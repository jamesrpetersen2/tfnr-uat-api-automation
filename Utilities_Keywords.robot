*** Settings ***
Library  Collections
Library  String
Library  RequestsLibrary
Library  OperatingSystem
#Library   HttpLibrary.HTTP
#Library     Selenium2Library
Library           DateTime
#Resource    ../../data_files/api/Utilities_testdata.robot
Resource    ./data_files/api/ErrorMessages.robot
#Resource    ../../keywords/ui/resource.robot
Resource    ./data_files/TestData.robot
#Resource    ./data_files/api/Complex_Record_Create_Testdata/Complex_record_create_testdata.robot

*** Variables ***
${RespOrgID}
${UpdateList}
${ViewList}
${clientKey}
${clientSecret}
${jsondata}
${User_Group}

*** Keywords ***
#Get Token
#    ${Token} =  Get From Dictionary     ${jsondata}     oauthToken
#    log  ${Token}
#    [Return]    ${Token}
#
#Get ClientKey
#    ${clientKey} =  Get From Dictionary     ${jsondata}     clientKey
#    log  ${clientKey}
#    [Return]    ${clientKey}
#
#Get clientSecret
#    ${clientSecret} =  Get From Dictionary     ${jsondata}     clientSecret
#    log  ${clientSecret}
#    [Return]    ${clientSecret}
#
#Get MaxNumberOfAtempts value
#    ${MaxNumberOfAtempts} =  Get From Dictionary     ${jsondata['permRecord']}     maxLogonAttempts
#    log  ${MaxNumberOfAtempts}
#    [Return]    ${MaxNumberOfAtempts}

Get Oauth Token
    [Arguments]     ${User_Credentials}
    log     ${User_Credentials}
    Create Session  endpoint        ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json       Accept=application/json
    ${resp}=  Post Request  endpoint    ${SESSIONOPEN}  data=${User_Credentials}  headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    Log  ${jsondata}
    Dictionary Should Contain Key  ${jsondata}      oauthToken
    Dictionary Should Contain Key  ${jsondata}      scope
    #Commented as no need to do parameterised validation and different from track1 and track2
    #Should be Equal     ${jsondata['scope']}        ${TEST_SCOPE}
    Dictionary Should Contain Key  ${jsondata}      tokenType
    Should be Equal     ${jsondata['tokenType']}    Bearer
    Dictionary Should Contain Key  ${jsondata}      expiresIn
    Dictionary Should Contain Key  ${jsondata['permRecord']}      maxLogonAttempts
    ${token}=   Get From Dictionary     ${jsondata}     oauthToken
    ${PermRecord}=   Get From Dictionary     ${jsondata}     permRecord
    ${maxLogonAttempts}     get from dictionary     ${PermRecord}      maxLogonAttempts
    #${UpdateList}=   Get From Dictionary     ${PermRecord}     updList
    #${ViewList}=   Get From Dictionary     ${PermRecord}     viewList
    ${RespOrgID}=   Get From Dictionary     ${PermRecord}     respOrgId
    ${User_Group}   get from dictionary     ${PermRecord}     usrGrp
    set global variable     ${UpdateList}
    set global variable     ${ViewList}
    set global variable     ${RespOrgID}
    set global variable     ${jsondata}
    set global variable     ${User_Group}
    Log         ${token}
    [Return]    ${token}

Session Delete
    [Arguments]      ${token}
    sleep   ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}=  Delete Request  endpoint  ${DEL_SESSION_CLOSE}    headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    Log  ${jsondata}
    Dictionary Should Contain Key  ${jsondata}  status
    Should be Equal     ${jsondata['status']}     success

GET METHOD FOR SYNC TIMEOUT
    [Arguments]    ${token}     ${GET_ACTION_URI}       ${reqId}       ${status_code}
    sleep       ${T2_THROTTLING_SLEEP}
    ${jsondata}     set variable    0
    FOR    ${i}    IN RANGE    0       70
       ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
       ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${reqId}   headers=${headers}
       ${status}       run keyword and return status   Should Be Equal As Strings  ${resp.status_code}     ${status_code}
       run keyword if      ${status}==False     Should Be Equal As Strings  ${resp.status_code}     ${202Accepted}
       ${jsondata}     run keyword if      ${status}==False        run keywords        Sleep       ${SLEEP2Sec}       AND          continue for loop
       ...  ELSE       To json         ${resp.content}
       run keyword if      ${status}==True     exit for loop
    END
    [Return]        ${jsondata}

Retrieve Response For 202 Success Response
    [Arguments]  ${token}       ${responsedata}        ${PUT_ACTION_URI}        ${status_code}
    Should Be Equal As Strings  ${responsedata.status_code}     ${status_code}
    ${responsedata}     To Json  ${responsedata.content}
    ${reqId}        get from dictionary     ${responsedata}     reqId
    ${response}    GET METHOD FOR SYNC TIMEOUT      ${token}    ${PUT_ACTION_URI}         ?reqId=${reqId}         ${SuccessResponse}
    #${response}    GET METHOD FOR SYNC TIMEOUT      ${token}    ${PUT_ACTION_URI}         -${reqId}         ${SuccessResponse}
    [Return]    ${response}

PUT Method
    [Arguments]     ${token}      ${PUT_ACTION_URI}     ${req_data}     ${status_code}
    Log     ${req_data}
    sleep   ${T2_THROTTLING_SLEEP}
    Create Session  endpoint  ${HOST}
    ${second}     fetch from right   ${PUT_ACTION_URI}     /v2/ip/
    ${PUT_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${PUT_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}
    ${resp}=  Put Request  endpoint  ${PUT_ACTION_URI}  data=${req_data}  headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${PUT_ACTION_URI}     ${202Accepted}
    ${responsejsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata}

PUT Method_V3
    [Arguments]     ${token}      ${PUT_ACTION_URI}     ${req_data}     ${status_code}
    Log     ${req_data}
    sleep   ${T2_THROTTLING_SLEEP}
    Create Session  endpoint  ${HOST}
    ${second}     fetch from right   ${PUT_ACTION_URI}     /v3/ip/
    ${PUT_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v3/ip/admin/${second}      ${PUT_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}
    ${resp}=  Put Request  endpoint  ${PUT_ACTION_URI}  data=${req_data}  headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${PUT_ACTION_URI}     ${202Accepted}
    ${responsejsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata}

POST Method
    [Arguments]     ${token}    ${POST_ACTION_URI}      ${Req_body}     ${Status_Code}
    Log     ${Req_body}
    sleep   ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${POST_ACTION_URI}     /v2/ip/
    ${POST_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${POST_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json         Authorization=Bearer ${token}
    ${resp}=    post request  endpoint    ${POST_ACTION_URI}     data=${Req_Body}   headers=${headers}
    Log     ${resp}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${Status_Code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${POST_ACTION_URI}     ${202Accepted}
    ${responsejsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata}

POST Method_V3
    [Arguments]     ${token}    ${POST_ACTION_URI}      ${Req_body}     ${Status_Code}
    sleep   ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${POST_ACTION_URI}     /v3/ip/
    ${POST_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v3/ip/admin/${second}      ${POST_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json         Authorization=Bearer ${token}
    ${resp}=    post request  endpoint    ${POST_ACTION_URI}     data=${Req_Body}   headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${Status_Code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${POST_ACTION_URI}     ${202Accepted}
    ${responsejsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata}

GET Method With Eff/Dt/TM
    [Arguments]    ${token}     ${GET_ACTION_URI}   ${number}      ${Eff/Dt/TM}     ${status_code}
    sleep   ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${GET_ACTION_URI}     /v2/ip/
    ${GET_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*    Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${number}&effDtTm=${Eff/Dt/TM}   headers=${headers}
    ${jsondata}     To json     ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}     ${status_code}
    [Return]    ${jsondata}

remove '-' from TFN
    #[Documentation]     ${responsedata} -> raw response we get from IMS
    [Arguments]     ${number}
    ${modifiedTFN}=   Replace String Using Regexp     ${number}  -    ${EMPTY}    count=2
    [Return]    ${modifiedTFN}

Reserved number
    [Arguments]    ${request_body}   ${token}
    ${numb}=      Do Number Search and Reserve    ${token}    ${request_body}
    ${num}      get from dictionary     ${numb}  numList
    ${Reservd_numb}   set variable        ${num[0]}
    ${Reservd_numb}=  remove '-' from TFN     ${Reservd_numb}
    [Return]    ${Reservd_numb}

Do Number Search and Reserve
    [Arguments]    ${token}     ${req_data}
    Log     ${req_data}
    Create Session  endpoint  ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json   Authorization=Bearer ${token}
    ${resp}=  Put Request  endpoint  ${PUT_NUSR_ACTION}  data=${req_data}  headers=${headers}
    Log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${responsejsondata}=  To Json  ${resp.content}
    Log  ${responsejsondata}
    [Return]    ${responsejsondata}
Get updated json request body
    [Arguments]    ${request_body}   ${number}
    ${data}=    evaluate    json.loads('''${request_body}''')    json
    set to dictionary     ${data}     num=${number}
    set to dictionary     ${data['destNums'][0]}    destNum=${number}
    ${Req_body}=    evaluate    json.dumps(${data})    json
    [Return]    ${Req_body}

Get updated dictionary resquest Body
    [Arguments]    ${request_body}
    ${data}=    evaluate    json.loads('''${request_body}''')    json
    [Return]    ${data}

Error Message And Error Code Validation
    [Arguments]    ${ResponseData}      ${ErrorMessage_With_ErrorCode}      ${ErrorLevel}
    #Checking for the error code and error message
    ${Error}=     get from dictionary  ${ResponseData}     errList
    ${ErrorList}=   get from dictionary  ${Error[0]}   errMsg
    ${ErrorLvl}=   get from dictionary  ${Error[0]}   errLvl
    should be equal     ${ErrorList}    ${ErrorMessage_With_ErrorCode}
    should be equal     ${ErrorLvl}    ${ErrorLevel}
    [Return]    ${ErrorList}    ${ErrorLvl}

Validating Record Status
    [Arguments]         ${token}    ${Number}    ${Record_Status}
    ${CRRetrieveResponseData}=    GET Method With NUM     ${token}      ${GET_CR_RETRIVE}    ${Number}     ${SuccessResponse}
    log     ${CRRetrieveResponseData}
    ${CustomerRecordStatus}=    get from dictionary  ${CRRetrieveResponseData["lstEffDtTms"][0]}    custRecStat
    should be equal     ${CustomerRecordStatus}     ${Record_Status}    msg=Customer Record Has Different State Than Expected
    log     Record Status is ${CustomerRecordStatus}
    [Return]    ${CustomerRecordStatus}

Regex Error Message For CAD Update With EffDtAndTi as NOW
    [Arguments]    ${ResponseData}
    #Checking for the error code and error message
    ${Description}=     get from dictionary  ${ResponseData}     description
    ${TrimmedDescription}=    evaluate  '${Description}'.replace(' ','-')
    ${Code}=   get from dictionary  ${ResponseData}   code
    should be equal     ${TrimmedDescription}    ${EffDtTm_Now_ErrorMessage}
    should be equal     ${Code}    ${400BadRequest}

Regex Error Message For CAD Update With EffDtAndTi as NOW With Time
    [Arguments]    ${ResponseData}
    #Checking for the error code and error message
    ${Description}=     get from dictionary  ${ResponseData}     description
    ${TrimmedDescription}=    evaluate  '${Description}'.replace(' ','-')
    ${Code}=   get from dictionary  ${ResponseData}   code
    should be equal     ${TrimmedDescription}    ${EffDtTm_NowAndTime_ErrorMessage}
    should be equal     ${Code}    ${400BadRequest}

Regex Error Message For CAD Update With Invalid TermNumber
    [Arguments]    ${ResponseData}
    #Checking for the error code and error message
    ${Description}=     get from dictionary  ${ResponseData}     description
    ${TrimmedDescription}=    evaluate  '${Description}'.replace(' ','-')
    ${Code}=   get from dictionary  ${ResponseData}   code
    should be equal     ${TrimmedDescription}    ${Invalid_TermNumber_Error}
    should be equal     ${Code}    ${400BadRequest}

#Get RespOrgID
#    log     ${RespOrgID}
#    [Return]     ${RespOrgID}

Get UpdateList Permissions
    log     ${UpdateList}
    [Return]     ${UpdateList}

Get ViewList Permissions
    log     ${ViewList}
    [Return]     ${ViewList}

Get LAD Values
    [Arguments]     ${Number}   ${RequestData}      ${LabelIndex}
    Create Session  endpoint        ${HOST}
    ${LabelType}=     get from dictionary  ${RequestData["lbl"][${LabelIndex}]}     lblType
    ${LabelName}=     get from dictionary  ${RequestData["lbl"][${LabelIndex}]}     lblName
    ${LabelValue}=     get from dictionary  ${RequestData["lbl"][${LabelIndex}]}     lblVals
    log many     For LAD Label Name ${LabelName} we are passing Value as ${LabelValue} for the TFN ${Number}


Get Error List
    [Arguments]     ${responsedata}
    log     ${responsedata}
    ${err_stat}=    run keyword and return status   dictionary should contain key       ${responsedata}     errList
    run keyword if  ${err_stat}== False    run keywords    log  "No Errors found"      AND      Return From Keyword

    ${err_value}=       Get From Dictionary     ${responsedata["errList"][0]}     errMsg
    log  ${err_value}
    [Return]    ${err_value}


Get Updated json with Num
    [Arguments]    ${request_body}   ${number}      ${Reserve_until_Date}

    ${data}=    evaluate    json.loads('''${request_body}''')    json
    set to dictionary     ${data}     num=${number}
    set to dictionary     ${data}      resUntilDt=${Reserve_until_Date}
    ${Req_body}=    evaluate    json.dumps(${data})    json
    [Return]    ${Req_body}

Validating CR Copy Record Status
    [Arguments]         ${token}    ${Number}    ${Record_Status}       ${Index}
    ${CRRetrieveResponseData}=    GET Method With NUM     ${token}      ${GET_CR_RETRIVE}    ${Number}     ${SuccessResponse}
    log     ${CRRetrieveResponseData}
    ${CustomerRecordStatus}=    get from dictionary  ${CRRetrieveResponseData["lstEffDtTms"][${Index}]}    custRecStat
    should be equal     ${CustomerRecordStatus}     ${Record_Status}
    log     Record Status is ${CustomerRecordStatus}
    [Return]    ${CustomerRecordStatus}

Validating PR Copy Record Status
    [Arguments]         ${token}    ${Number}    ${Record_Status}       ${Index}
    ${CRRetrieveResponseData}=    GET Method With NUM     ${token}      ${GET_PR_RETRIVE}    ${Number}     ${SuccessResponse}
    log     ${CRRetrieveResponseData}
    ${CustomerRecordStatus}=    get from dictionary  ${CRRetrieveResponseData["lstEffDtTms"][${Index}]}    custRecStat
    should be equal     ${CustomerRecordStatus}     ${Record_Status}
    log     Record Status is ${CustomerRecordStatus}
    [Return]    ${CustomerRecordStatus}

Replace TemplateName
    log     Proceeding to update tempName value in UAT environment
    set to dictionary     ${data}     tempName=${TemplateName_UAT}

Get PR In Pending or Saved or Invalid or Hold State
########This Keyword will create PAD in Pending or Saved or Invalid or Hold State and returns the request body########
#PAD ReqBody eg:{"num": "","effDtTm":"","hldIndFlag": "N","svcOrderNum": "A1dhgtajkjaks","co": "BRSA","tempName" : "*ADFASDFA","cmd":"U","reqSntFrom" : "PAD","destNums": [{"destNum" : "","numTermLine":9}]}#
# To create Saved record change "cmd" value from U to S #
# To create Hold record change "hldIndFlag" value from N to Y #
#All the required TFN statuses are available in the file "Utilities_testdta.robot"#
    [Arguments]     ${Req_Body}    ${Status}
    ${token}=       Get Oauth Token     ${User_Credentials}
    #Getting the Reserved Number
    ${Resvd_Num}=       Reserved number     ${request_nusr}     ${token}
    ${data}=    evaluate    json.loads('''${Req_Body}''')    json
    set to dictionary     ${data}     num=${Resvd_Num}
    set to dictionary     ${data['destNums'][0]}    destNum=${Resvd_Num}
    ${Date}=       Get Future Date and Time     20
    set to dictionary       ${data}         effDtTm=${Date}
    #Updating the tempName if the environment is UAT
    run keyword if  "${HOST}"=="${UAT_HOST}"    Replace TemplateName
    ...     ELSE    log     Hence the environment is not UAT, tempName value is not updated
    ${Req_body}=    evaluate    json.dumps(${data})    json
    log     ${Req_body}
    #Creating the record
    ${responsedata}=    POST Method     ${token}   ${POST_PR_CREATE}    ${Req_body}     ${SuccessResponse}
    TFN Number And Status Validation    ${responsedata}   ${Resvd_Num}  0   ${Status}
    Session Delete      ${token}
    [Return]    ${Req_body}

Get PR In Active State
########This Keyword will create PAD in Active State and returns the request body########
#PAD ReqBody eg:{"num": "","effDtTm":"NOW","hldIndFlag": "N","svcOrderNum": "A1dhgtajkjaks","co": "BRSA","tempName" : "*ADFASDFA","cmd":"U","reqSntFrom" : "PAD","destNums": [{"destNum" : "","numTermLine":9}]}#
#All the required TFN statuses are available in the file "Utilities_testdta.robot"#
    [Arguments]     ${Req_Body}
    ${token}=       Get Oauth Token     ${User_Credentials}
    #Getting the Reserved Number
    ${Resvd_Num}=       Reserved number     ${request_nusr}     ${token}
    ${Req_Body}=    Get updated json request body      ${Req_Body}     ${Resvd_Num}
    ${data}    evaluate    json.loads('''${Req_Body}''')    json
    #Updating the tempName if the environment is UAT
    run keyword if  "${HOST}"=="${UAT_HOST}"    Replace TemplateName
    ...     ELSE    log     Hence the environment is not UAT, tempName value is not updated
    ${Req_body}    evaluate    json.dumps(${data})    json
    log     ${Req_body}
    #Creating the record
    ${responsedata1}=    POST Method     ${token}   ${POST_PR_CREATE}    ${Req_body}     ${SuccessResponse}
    TFN Number And Status Validation    ${responsedata1}   ${Resvd_Num}     0   ${PendingStatus}
    sleep   ${SLEEP10}
    #Retrieving the status of the TFN
    ${responsedata2}=    GET Method With NUM    ${token}    ${GET_PR_RETRIVE}   ${Resvd_Num}    ${SuccessResponse}
    TFN Number And Status Validation    ${responsedata2}   ${Resvd_Num}     0   ${ActiveStatus}
    log     ${responsedata2}
    Session Delete      ${token}
    [Return]    ${Req_body}

Get PR In Mustcheck State
########This Keyword will create PAD in MustCheck State and returns the request body########
#PAD Create ReqBody eg:{"num": "","effDtTm":"","hldIndFlag": "N","svcOrderNum": "A1dhgtajkjaks","co": "BRSA","tempName" : "*ADFASDFA","cmd":"U","reqSntFrom" : "PAD","destNums": [{"destNum" : "","numTermLine":9}]}#
#PAD CopyUpdate ReqBody eg:{"cmd":"U","num":"8338266724","effDtTm":"2017-10-21T03:15:00Z","reqSntFrom":"PAD","priority":"N","co":"BRSA","hldIndFlag":"N","svcOrderNum":"dsfds234","newRespOrgId":"BRSAC","conName":"MOGHAL U","conTel":"5712786753","tempName":"*ADFASDFA","endSub":[],"destNums":[{"destNum":"8338266724","numTermLine":10}],"srcEffDtTm":"2017-09-30T03:15:00Z","custRecCompPart":"PAD only"}#
#All the required TFN statuses are available in the file "Utilities_testdta.robot"#
    [Arguments]     ${Create_ReqBody}        ${CopyUpdate_ReqBody}
    ${ReqBody_Pending_PR}       Get PR In Pending or Saved or Invalid or Hold State     ${Create_ReqBody}    ${PendingStatus}
    ${data}=    evaluate    json.loads('''${ReqBody_Pending_PR}''')    json
    ${TFN}=     Get from dictionary     ${data}     num
    ${token}=       Get Oauth Token     ${User_Credentials}
    ${data}=    evaluate    json.loads('''${CopyUpdate_ReqBody}''')    json
    set to dictionary     ${data}     num=${TFN}
    set to dictionary     ${data['destNums'][0]}    destNum=${TFN}
    #Updating the tempName if the environment is UAT
    run keyword if  "${HOST}"=="${UAT_HOST}"    Replace TemplateName
    ...     ELSE    log     Hence the environment is not UAT, tempName value is not updated
    ${Date1}=       Get Future Date and Time     30
    set to dictionary       ${data}         effDtTm=${Date1}
    ${Date2}=       Get Future Date and Time     20
    set to dictionary       ${data}         srcEffDtTm=${Date2}
    ${CopyUpdate_ReqBody1}=    evaluate    json.dumps(${data})    json
    log     ${CopyUpdate_ReqBody1}
    ${responsedata1}=   PUT Method  ${token}  ${PUT_PR_COPY_UPDATE}  ${CopyUpdate_ReqBody1}   ${SuccessResponse}
    log     ${responsedata1}
    TFN Number And Status Validation For MustCheck    ${responsedata1}   ${TFN}     1   ${PendingStatus}
    ${data}=    evaluate    json.loads('''${CopyUpdate_ReqBody1}''')    json
    ${Date3}=       Get Future Date and Time     25
    set to dictionary       ${data}         effDtTm=${Date3}
    ${CopyUpdate_ReqBody2}=    evaluate    json.dumps(${data})    json
    ${responsedata2}=   PUT Method      ${token}    ${PUT_PR_COPY_UPDATE}     ${CopyUpdate_ReqBody2}   ${SuccessResponse}
    TFN Number And Status Validation For MustCheck    ${responsedata2}   ${TFN}     2   ${MustCheckStatus}
    log     ${responsedata2}
    ${data}=    evaluate    json.loads('''${ReqBody_Pending_PR}''')    json
    set to dictionary       ${data}         effDtTm=${Date1}
    ${ReqBody_MustCheck_PR}      evaluate    json.dumps(${data})    json
    Session Delete      ${token}
    [Return]    ${ReqBody_MustCheck_PR}

Check Customer Record Response
    [Arguments]     ${responsedata_CR_Create}
    ${num}=    get from dictionary     ${responsedata_CR_Create}     num
    log     ${num}
    ${effDtTm}=    get from dictionary     ${responsedata_CR_Create}     effDtTm
    log     ${effDtTm}
    ${lstEffDtTms}=    get from dictionary     ${responsedata_CR_Create}     lstEffDtTms
    log     ${lstEffDtTms}
    ${lstEffDtTmList}=      get from list   ${lstEffDtTms}   0
    log     ${lstEffDtTmList}
    ${custRecStat}=    get from dictionary     ${lstEffDtTmList}     custRecStat
    log     ${custRecStat}
    ${custRecCompPart}=    get from dictionary     ${lstEffDtTmList}     custRecCompPart
    log     ${custRecCompPart}

    ${apprStat}=    get from dictionary     ${lstEffDtTmList}     apprStat
    log     ${apprStat}
    @{CR_Values}       Create List       ${num}    ${effDtTm}  ${lstEffDtTms}  ${lstEffDtTmList}     ${custRecStat}   ${custRecCompPart}  ${apprStat}
    [Return]        @{CR_Values}

GET Method With NUM
    [Arguments]    ${token}     ${GET_ACTION_URI}   ${number}    ${status_code}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${GET_ACTION_URI}     /v2/ip/
    ${GET_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*    Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${number}   headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
    ${responsejsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata}

GET Method With NUM_V3
    [Arguments]    ${token}     ${GET_ACTION_URI}   ${number}    ${status_code}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${GET_ACTION_URI}     /v3/ip/
    ${GET_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v3/ip/admin/${second}      ${GET_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*    Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${number}   headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
    ${responsejsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata}

Delete Session
    [Arguments]    ${token}
    sleep       ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}=  Delete Request  endpoint  ${DEL_SESSION_CLOSE}    headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    Log  ${jsondata}
    Dictionary Should Contain Key  ${jsondata}  status
    Should be Equal     ${jsondata['status']}     success

Get Oauth Token From Session Open
    Create Session  endpoint    ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json       Accept=application/json
    ${resp}=  Post Request  endpoint    ${SESSIONOPEN}  data=${sessionOpenData_validuser1}  headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    Log  ${jsondata}
    Dictionary Should Contain Key  ${jsondata}      oauthToken
    Dictionary Should Contain Key  ${jsondata}      scope
    Should be Equal     ${jsondata['scope']}        ${TEST_SCOPE}
    Dictionary Should Contain Key  ${jsondata}      tokenType
    Should be Equal     ${jsondata['tokenType']}    Bearer
    Dictionary Should Contain Key  ${jsondata}      expiresIn
    ${token}=   Get From Dictionary     ${jsondata}     oauthToken
    Log         ${token}
    [Return]    ${token}

Split extra characters from TFNs
    [Documentation]     ${reservedNum} -> raw response we get from IMS
    [Arguments]     ${reservedNum}
    ${TFN_numList}=     get from dictionary     ${reservedNum}  numList
    ${TFN_count}=      get length      ${TFN_numList}
    log     ${TFN_count}
    ${splitTFNArray}    create list
    :FOR   ${i}   IN RANGE   0  ${TFN_count}
    \   ${single_TFN}=  get from list   ${TFN_numList}  ${i}
    \   log  ${single_TFN}
    \   ${modifiedTFN}=   Replace String Using Regexp     ${single_TFN}  -    ${EMPTY}    count=2
    \   log     ${modifiedTFN}
    \   append to list  ${splitTFNArray}    ${modifiedTFN}
    [Return]    @{splitTFNArray}

Do Customer Record Create
    [Arguments]    ${token}     ${req_data}     ${status_code}
    Create Session  endpoint  ${HOST}
    ${headers}=     Create Dictionary  Accept=application/json     Content-Type=application/json   Authorization=Bearer ${token}
    ${resp}=    POST Request    endpoint  ${POST_CR_Create_ACTION}   data=${req_data}    headers=${headers}
    log     ${resp}
    ${description} =	to json     ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}     ${status_code}
    Log  ${description}
    [Return]    ${description}

Do Customer Record Retrieve
    [Arguments]    ${token}     ${GET_ACTION_URI}   ${number}    ${status_code}
    Create Session  endpoint    ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${number}   headers=${headers}
    ${jsondata} =	To json     ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}     ${status_code}
    ${num}=    get from dictionary     ${jsondata}     num
    log     ${num}

    ${effDtTm}=    get from dictionary     ${jsondata}     effDtTm
    log     ${effDtTm}

    ${lstEffDtTms}=    get from dictionary     ${jsondata}     lstEffDtTms
    log     ${lstEffDtTms}

    ${lstEffDtTmList}=      get from list   ${lstEffDtTms}   0
    log     ${lstEffDtTmList}

    ${custRecStat}=    get from dictionary     ${lstEffDtTmList}     custRecStat
    log     ${custRecStat}

    ${custRecCompPart}=    get from dictionary     ${lstEffDtTmList}     custRecCompPart
    log     ${custRecCompPart}

    ${apprStat}=    get from dictionary     ${lstEffDtTmList}     apprStat
    log     ${apprStat}
    @{CR_Retrieve__Values}       Create List       ${num}    ${effDtTm}  ${lstEffDtTms}  ${lstEffDtTmList}     ${custRecStat}   ${custRecCompPart}  ${apprStat}
    [Return]    @{CR_Retrieve__Values}

Get Spare Number Api
    ${token}=        Get Oauth Token   ${User_Credentials}
    ${Resp}=    PUT Method      ${token}     ${PUT_NUS_ACTION}     ${req_nums}     200
    ${Spare_number}=     get from dictionary   ${Resp}     numList
    ${Spare_Number}     set variable    ${Spare_Number[0]}
    ${Spare_number}     remove '-' from TFN     ${Spare_number}
    delete session      ${token}
    [Return]    ${Spare_number}

Get updated json request body with Date and Time
    [Arguments]    ${request_body}   ${Date_Time}
    ${data}=    evaluate    json.loads('''${request_body}''')    json
    set to dictionary     ${data}     effDtTm=${Date_Time}
    ${Req_body}=    evaluate    json.dumps(${data})    json
    [Return]    ${Req_body}

Get Future Effective Date and Time
    ${Date}    get current Date
    #log     ${Date}
    #${Edit_Date}        Add Time To Date    ${Date}   20 days
    #${Date}    Convert Date    ${Edit_Date}    %Y-%m-%dT
    #${Date_Time}        Get Time   ``time``
    ${Date_Time}        Add Time To Date    ${Date}   20 days
    ${Date_Time}        evaluate  '${Date_Time}'.replace(' ','T')
    ${Date_Time}        fetch from left     ${Date_Time}     :
    ${Date_Time}        Catenate    ${Date_Time}:00Z
    [Return]        ${Date_Time}

Get Reserved Vanity Number
    @{list}     create list  800      833      844       855        866         877       888
    log many     @{List}
    ${listIndex}      generate random string     1    0123456
    ${randomNPA}      get from list   ${List}   ${listIndex}
    log  ${randomNPA}
    ${Random_String} =  Generate Random String  7  [LOWER]
    ${Vanity_Num}   catenate    ${randomNPA}${Random_String}
    ${data}=    evaluate    json.loads('''${request_nusr_VanityTFN}''')    json
    ${num}      get from dictionary  ${data}     numList
    set list value    ${data['numList']}   0     ${Vanity_Num}
    ${request_nusr_VanityTFN}=    evaluate    json.dumps(${data})    json
    #Get the Reserved Number
    ${token}=       Get Oauth Token     ${User_Credentials}
    ${Resp}=    PUT Method      ${token}     ${PUT_NUSR_ACTION}     ${request_nusr_VanityTFN}     200
    ${templist}=     Get Dictionary Keys   ${Resp}
    ${found}=       get from list   ${templist}     0
    log     ${found}
    #run keyword if      "${found}"=="errList"        Get Reserved Vanity Number
    #...     ELSE        log     "numList found with a Spare Status, gets the same"
    ${Resv_number}     get from dictionary   ${Resp}     numList
    ${Reservd_numb}   set variable        ${Resv_number[0]}
    ${Reservd_numb}=  remove '-' from TFN     ${Reservd_numb}
    Session Delete      ${token}
    [Return]    ${Vanity_Num}   ${Reservd_numb}

Get Vanity Number PR
########This Keyword creates PAD in Pending or Saved or Invalid or Hold State and returns the Vanity number########
#PAD ReqBody eg:{"num": "","effDtTm":"","hldIndFlag": "N","svcOrderNum": "A1dhgtajkjaks","co": "BRSA","tempName" : "*ADFASDFA","cmd":"U","reqSntFrom" : "PAD","destNums": [{"destNum" : "","numTermLine":9}]}#
# To create Saved record change "cmd" value from U to S #
# To create Hold record change "hldIndFlag" value from N to Y #
#All the required TFN statuses are available in the file "Utilities_testdta.robot"#
    [Arguments]     ${Req_Body}    ${Status}
    ${Vanity_Num}   ${Reservd_numb}   Get Reserved Vanity Number
    ${data}=    evaluate    json.loads('''${Req_Body}''')    json
    set to dictionary     ${data}     num=${Reservd_numb}
    set to dictionary     ${data['destNums'][0]}    destNum=${Reservd_numb}
    ${Date}=       Get Future Date and Time     20
    set to dictionary       ${data}         effDtTm=${Date}
    #Update the tempName if the environment is UAT
    run keyword if  "${HOST}"=="${UAT_HOST}"    Replace TemplateName
    ...     ELSE    log     Hence the environment is not UAT, tempName value is not updated
    ${Req_body}=    evaluate    json.dumps(${data})    json
    log     ${Req_body}
    #Create the record
    ${token}=       Get Oauth Token     ${User_Credentials}
    ${responsedata}=    POST Method     ${token}   ${POST_PR_CREATE}    ${Req_body}     ${SuccessResponse}
    TFN Number And Status Validation    ${responsedata}   ${Reservd_numb}  0   ${Status}
    Session Delete      ${token}
    [Return]    ${Vanity_Num}

Create Basic CAD or PAD In Pending or Saved or Failed or Hold State and returns req body
########This Keyword will create Basic CAD or CAD LAD or PAD in Pending or Saved or Invalid or Hold State########
#CAD ReqBody eg:{"num": "","effDtTm":"","reqSntFrom":"CAD","cmd":"U","interLTCar":["MCI0222"],"intraLTCar":["MCI0222"],"hldIndFlag":"N","svcOrderNum":"B098AB","aos":{"aosNet":["US"]},"destNums":[{"destNum":"","numTermLine":10}]}#
#PAD ReqBody eg:{"num": "","effDtTm":"","hldIndFlag": "N","svcOrderNum": "A1dhgtajkjaks","co": "BRSA","tempName" : "*ADFASDFA","cmd":"U","reqSntFrom" : "PAD","destNums": [{"destNum" : "","numTermLine":9}]}#
# To create Saved record change "cmd" value from U to S #
# To create Hold record change "hldIndFlag" value from N to Y #
#All the required URIs and TFN statuses are available in the file "Utilities_testdta.robot"#
    [Arguments]     ${POST_ACTION_URI}       ${Req_Body}    ${Status}
    ${token}=       Get Oauth Token     ${User_Credentials}
    #Getting the Reserved Number
    ${Resvd_Num}=       Reserved number     ${request_nusr}     ${token}
    ${data}=    evaluate    json.loads('''${Req_Body}''')    json
    set to dictionary     ${data}     num=${Resvd_Num}
    set to dictionary     ${data['destNums'][0]}    destNum=${Resvd_Num}
    ${Date}=       Get Future Date and Time     20
    set to dictionary       ${data}         effDtTm=${Date}
    ${Req_body}=    evaluate    json.dumps(${data})    json
    log     ${Req_body}
    #Creating the record
    ${responsedata}=    POST Method     ${token}   ${POST_ACTION_URI}    ${Req_body}     ${SuccessResponse}
    TFN Number And Status Validation    ${responsedata}   ${Resvd_Num}  0   ${Status}
    Session Delete      ${token}
    [Return]    ${Req_body}
