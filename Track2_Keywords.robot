*** Settings ***
Library  Collections
Library  String
Library  RequestsLibrary
Library  OperatingSystem
#Library  HttpLibrary.HTTP
#Library         HttpLibrary
#Library  Selenium2Library
#Library  Collections
Resource        ./data_files/api/Track2/Testdata.robot
Resource        ./data_files/api/Track2/URI.robot
Resource        ./data_files/api/ErrorMessages.robot
Resource        ./Utilities_Keywords.robot
#Resource    ../../keywords/api/numberAdmin/numberAdminKeywords.robot
*** Variables ***
${admin_flag}      False
${sessionopenResp1}
${RespOrgID}
${UpdateList}
${ViewList}
${clientKey}
${clientSecret}
${sessionopenResp}
${User_Group}
${updatedRequestData}
${UsrClass}
${respOrgUnitSubString}
${oauthToken}
${adminUserOauthToken}
${adminUserClientKey}
${adminUserclientSecret}
${NPA_List}
${intraLATACarrier}
${interLATACarrier}
${CR_CreatedResponse_Values}
${cicCode}
${acna}
${recversionIDForCIS}
${token}
${LAD_View}
${err_found}    False
${BR_Entity}                 BR
${responsejsondata_bulk}
*** Keywords ***
Session Override errorcheck
    [Arguments]     ${sessionopenResp}
    ${Error}         get from dictionary    ${sessionopenResp}     errList
    ${ErrorList}       get from dictionary    ${Error[0]}   errMsg
    ${Error_Match}      run keyword and return status     should contain      ${ErrorList}    Session Override Expired .
    [Return]    ${Error_Match}

Get Oauthentication Token
    [Arguments]     ${User_Credentials}
    log     ${User_Credentials}
    ${SESSIONOPEN_V2}   set variable        /v2/ip/sec/session/open
    set global variable   ${SESSIONOPEN_V2}
    ${HOST}     set variable     ${UAT_RESPORG_HOST}
    set global variable    ${HOST}
    Create Session  endpoint        ${HOST}
    #${SESSIONOPEN_V2}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/sec/session/open       /v2/ip/sec/session/open
    ${headers}=  Create Dictionary  Content-Type=application/json       Accept=application/json
    ${resp}=  Post Request  endpoint    ${SESSIONOPEN_V2}  data=${User_Credentials}  headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${sessionopenResp}=  To Json  ${resp.content}
    Log  ${sessionopenResp}
    ${Status}   run keyword and return status   Dictionary Should Contain Key  ${sessionopenResp}      oauthToken
    ${sessionopenResp1}      run keyword if      ${Status}==False            ReLogin         ${sessionopenResp}     ${User_Credentials}
    set global variable      ${sessionopenResp1}
    ${error_recieved}     run keyword and return status     Dictionary Should Contain Key     ${sessionopenResp1}     errList
    ${reopen_flag}    run keyword if    ${error_recieved}==True     Session Override errorcheck     ${sessionopenResp1}
    run keyword if   ${reopen_flag}==True     UserProfile Login    ${User_Credentials}
    ${sessionopenResp}      set variable if     ${Status}==False        ${sessionopenResp1}     ${sessionopenResp}
    Dictionary Should Contain Key  ${sessionopenResp}      scope
    #Commented as no need to do parameterised validation and different from track1 and track2
    #Should be Equal     ${jsondata['scope']}        ${TEST_SCOPE}
    Dictionary Should Contain Key  ${sessionopenResp}      tokenType
    Should be Equal     ${sessionopenResp['tokenType']}    Bearer
    Dictionary Should Contain Key  ${sessionopenResp}      expiresIn
    Dictionary Should Contain Key  ${sessionopenResp['permRecord']}      maxLogonAttempts
    ${token}=   Get From Dictionary     ${sessionopenResp}     oauthToken
    ${PermRecord}=   Get From Dictionary     ${sessionopenResp}     permRecord
    ${maxLogonAttempts}     get from dictionary     ${PermRecord}      maxLogonAttempts
    #${UpdateList}=   Get From Dictionary     ${PermRecord}     updList
    #${ViewList}=   Get From Dictionary     ${PermRecord}     viewList
    ${RespOrgID}=   Get From Dictionary     ${PermRecord}     respOrgId
    ${User_Group}   get from dictionary     ${PermRecord}     usrGrp
    ${UsrClass}=   Get From Dictionary     ${PermRecord}     usrClass
    set global variable     ${UpdateList}
    set global variable     ${ViewList}
    set global variable     ${RespOrgID}
    set global variable     ${sessionopenResp}
    set global variable     ${User_Group}
    set global variable     ${UsrClass}
    Log         ${token}
    ${userclass}      get userclass
    run keyword if   '${userclass}'=='ADMINISTRATOR'     Admin Session close
    ${admin_flag}     run keyword and return status     should be equal    ${userclass}      ADMINISTRATOR
    set global variable    ${admin_flag}
    ${HOST}    set variable if   '${userclass}'=='ADMINISTRATOR'     ${UAT_ADMIN_HOST}     ${UAT_RESPORG_HOST}
    set global variable    ${HOST}
    ${token1}        run keyword and return if   '${admin_flag}'=='True'      Session Open Response    ${User_Credentials}
    ${token}    set variable if     '${admin_flag}'=='True'    ${token1}    ${token}
    [Return]    ${token}

Session Open Response
    [Arguments]     ${User_Credentials}
    log     ${User_Credentials}
    Create Session  endpoint        ${HOST}
    ${SESSIONOPEN_V2}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/sec/session/open       /v2/ip/sec/session/open
    set global variable     ${SESSIONOPEN_V2}
    ${headers}=  Create Dictionary  Content-Type=application/json       Accept=application/json
    ${resp}=  Post Request  endpoint    ${SESSIONOPEN_V2}  data=${User_Credentials}  headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${sessionopenResp}=  To Json  ${resp.content}
    Log  ${sessionopenResp}
    ${Status}   run keyword and return status   Dictionary Should Contain Key  ${sessionopenResp}      oauthToken
    ${sessionopenResp1}      run keyword if      ${Status}==False            ReLogin         ${sessionopenResp}     ${User_Credentials}
    set global variable      ${sessionopenResp1}
    ${error_recieved}     run keyword and return status     Dictionary Should Contain Key     ${sessionopenResp1}     errList
    ${reopen_flag}    run keyword if    ${error_recieved}==True     Session Override errorcheck     ${sessionopenResp1}
    run keyword if   ${reopen_flag}==True     UserProfile Login    ${User_Credentials}
    ${sessionopenResp}      set variable if     ${Status}==False        ${sessionopenResp1}     ${sessionopenResp}
    Dictionary Should Contain Key  ${sessionopenResp}      scope
    #Commented as no need to do parameterised validation and different from track1 and track2
    #Should be Equal     ${jsondata['scope']}        ${TEST_SCOPE}
    Dictionary Should Contain Key  ${sessionopenResp}      tokenType
    Should be Equal     ${sessionopenResp['tokenType']}    Bearer
    Dictionary Should Contain Key  ${sessionopenResp}      expiresIn
    Dictionary Should Contain Key  ${sessionopenResp['permRecord']}      maxLogonAttempts
    ${token}=   Get From Dictionary     ${sessionopenResp}     oauthToken
    ${PermRecord}=   Get From Dictionary     ${sessionopenResp}     permRecord
    ${maxLogonAttempts}     get from dictionary     ${PermRecord}      maxLogonAttempts
    #${UpdateList}=   Get From Dictionary     ${PermRecord}     updList
    #${ViewList}=   Get From Dictionary     ${PermRecord}     viewList
    ${RespOrgID}=   Get From Dictionary     ${PermRecord}     respOrgId
    ${User_Group}   get from dictionary     ${PermRecord}     usrGrp
    ${UsrClass}=   Get From Dictionary     ${PermRecord}     usrClass
    set global variable     ${UpdateList}
    set global variable     ${ViewList}
    set global variable     ${RespOrgID}
    set global variable     ${sessionopenResp}
    set global variable     ${User_Group}
    set global variable     ${UsrClass}
    Log         ${token}
    ${SESSIONOPEN_V2}       set variable        /v2/ip/sec/session/open
    set global variable     ${SESSIONOPEN_V2}
    [Return]    ${token}

ReLogin
    [Arguments]         ${sessionopenResp}      ${User_Credentials_Track2}
    ${resp}         get dictionary items       ${sessionopenResp}
    ${resp}     convert to string       ${resp}
    should not contain      ${resp}     Logon Failed. Invalid Credentials
    ${sessionOverrideKey}       get from dictionary         ${sessionopenResp}      sessOverrideKey
    Create Session  endpoint        ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json       Accept=application/json
    ${requestData}=    evaluate    json.loads('''${User_Credentials_Track2}''')    json
    set to dictionary       ${requestData}      sessOverrideKey=${sessionOverrideKey}
    #set to dictionary       ${requestData}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}=  Post Request  endpoint    ${SESSIONOPEN_V2}  data=${reqBody}  headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${sessionopenResp}=  To Json  ${resp.content}
    Log  ${sessionopenResp}
    ${Status}   run keyword and return status   Dictionary Should Contain Key  ${sessionopenResp}      oauthToken
    ${sessionopenResp1}      run keyword if      ${Status}==False            ReLogin         ${sessionopenResp}     ${User_Credentials_Track2}
    set global variable      ${sessionopenResp1}
    ${sessionopenResp}      set variable if     ${Status}==False        ${sessionopenResp1}     ${sessionopenResp}
    [Return]       ${sessionopenResp}

Get Token
    ${Token} =  Get From Dictionary     ${sessionopenResp}     oauthToken
    log  ${Token}
    [Return]    ${Token}

Get ClientKey
    ${clientKey} =  Get From Dictionary     ${sessionopenResp}     clientKey
    log  ${clientKey}
    [Return]    ${clientKey}

Get clientSecret
    ${clientSecret} =  Get From Dictionary     ${sessionopenResp}     clientSecret
    log  ${clientSecret}
    [Return]    ${clientSecret}

Get PermRecord
    ${permRecord} =  Get From Dictionary     ${sessionopenResp}     permRecord
    log     ${permRecord}
    [Return]    ${permRecord}

Get MaxNumberOfAtempts value
    ${MaxNumberOfAtempts} =  Get From Dictionary     ${sessionopenResp['permRecord']}     maxLogonAttempts
    log  ${MaxNumberOfAtempts}
    [Return]    ${MaxNumberOfAtempts}

Get UserGroup
    [Return]    ${User_Group}

Get UserClass
    [Return]        ${UsrClass}

Get RespOrgID
    [Return]     ${RespOrgID}

Get from Input
    [Arguments]     ${inputJSON}    ${request_parameter}
    Log   ${request_parameter}
    Log   ${inputJSON}
    ${inputParameter}=   get json value  ${inputJSON}    /${request_parameter}
    ${inputParameter}=   Replace String Using Regexp    ${inputParameter}  "    ${EMPTY}    count=4
    [Return]    ${inputParameter}

UserProfile Login
    [Arguments]     ${User_Credentials}
    log     ${User_Credentials}
    ${OauthToken}    Get Oauthentication Token    ${User_Credentials}
    log     ${OauthToken}
    ${ClientKey}   Get ClientKey
    ${clientSecret}   Get clientSecret
    log     ${clientSecret}
    ${UserProfileDetails}      create dictionary   OauthToken=${OauthToken}    ClientKey=${ClientKey}      clientSecret=${clientSecret}
    log     ${UserProfileDetails}
    [Return]  ${UserProfileDetails}

Get Session Open Response
    [Arguments]     ${User_Credentials}
    Create Session  endpoint        ${HOST}
    ${SESSIONOPEN_V2}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/sec/session/open       /v2/ip/sec/session/open
    ${headers}=  Create Dictionary  Content-Type=application/json       Accept=application/json
    ${resp}=  Post Request  endpoint    ${SESSIONOPEN_V2}  data=${User_Credentials}  headers=${headers}
    log     ${resp}
    ${jsondata}=  To Json  ${resp.content}
    ${Status}   run keyword and return status   Dictionary Should Contain Key  ${jsondata}      oauthToken
    ${sessionopenResp1}      run keyword if      ${Status}==False            ReLogin         ${jsondata}     ${User_Credentials}
    ${error_recieved}     run keyword and return status     Dictionary Should Contain Key     ${sessionopenResp1}     errList
    ${reopen_flag}    run keyword if    ${error_recieved}==True     Session Override errorcheck     ${sessionopenResp1}
    run keyword if   ${reopen_flag}==True     Get Session Open Response    ${User_Credentials}
    ${sessionopenResp}      set variable if     ${Status}==False        ${sessionopenResp1}     ${jsondata}
    [Return]    ${sessionopenResp}

Validation For Error Message
    [Arguments]    ${ResponseData}      ${ErrorMessage}      ${ErrorLevel}      ${ExpectedErrorCode}
    #Check for the error code and error message
    ${Error}=     get from dictionary  ${ResponseData}     errList
    ${Length}       get length      ${Error}
    #should be equal as integers         ${Length}       1
    ${ErrorList}=   get from dictionary  ${Error[0]}   errMsg
    ${ErrorLvl}=   get from dictionary  ${Error[0]}   errLvl
    ${ErrorCode}=   get from dictionary  ${Error[0]}   errCode
    should contain     ${ErrorList}    ${ErrorMessage}
    should be equal     ${ErrorLvl}    ${ErrorLevel}
    should be equal     ${ErrorCode}    ${ExpectedErrorCode}

Validation For Error Message Based On Index
    [Arguments]    ${ResponseData}      ${ErrorMessage}      ${ErrorLevel}      ${ExpectedErrorCode}   ${index}
    #Check for the error code and error message
    ${Error}=     get from dictionary  ${ResponseData}     errList
    ${ErrorList}=   get from dictionary  ${Error[${index}]}   errMsg
    ${ErrorLvl}=   get from dictionary  ${Error[${index}]}   errLvl
    ${ErrorCode}=   get from dictionary  ${Error[${index}]}   errCode
    should contain     ${ErrorList}    ${ErrorMessage}
    should be equal     ${ErrorLvl}    ${ErrorLevel}
    should be equal     ${ErrorCode}    ${ExpectedErrorCode}

Validation For Error Description
    [Arguments]    ${ResponseData}      ${Expected_Error_description}   ${Error_Value}
    Dictionary Should Contain Key  ${ResponseData}      error
    Dictionary Should Contain Key  ${ResponseData}      code
    Dictionary Should Contain Key  ${ResponseData}      description
    ${Error_True}=     Get From Dictionary     ${ResponseData}     error
    ${Error_Code}=     Get From Dictionary     ${ResponseData}     code
    ${Error_Description}=     Get From Dictionary     ${ResponseData}     description
    ${Error_Description}     evaluate  '${error_Description}'.replace(' ','-')
    should contain  ${error_true}   ${Error_Value}
    should contain  ${error_Description}    ${Expected_Error_description}

Session Close
    [Arguments]    ${token}     ${ClientKey}    ${ClientSecret}
    ${DEL_SESSION_CLOSE_V2}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/sec/session/close       /v2/ip/sec/session/close
    Create Session  endpoint   ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}=  Put Request  endpoint    ${DEL_SESSION_CLOSE_V2}  data={"clientKey": "${ClientKey}","clientSecret": "${ClientSecret}" }  headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    Log  ${jsondata}
    Dictionary Should Contain Key  ${jsondata}  status
    Should be Equal     ${jsondata['status']}     success
    ${admin_flag}    set variable         False
    set global variable    ${admin_flag}
    ${HOST}     set variable  ${UAT_RESPORG_HOST}
    set global variable     ${HOST}
    ${SESSIONOPEN_V2}     set variable      /v2/ip/sec/session/open
    set global variable    ${SESSIONOPEN_V2}

Session Close Admin
    [Arguments]    ${token}     ${ClientKey}    ${ClientSecret}
    ${DEL_SESSION_CLOSE_V2}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/sec/session/close       /v2/ip/sec/session/close
    ${HOST}    set variable if   '${admin_flag}'=='True'     ${UAT_ADMIN_HOST}     ${UAT_RESPORG_HOST}
    Create Session  endpoint   ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}=  Put Request  endpoint    ${DEL_SESSION_CLOSE_V2}  data={"clientKey": "${ClientKey}","clientSecret": "${ClientSecret}" }  headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    Log  ${jsondata}
    Dictionary Should Contain Key  ${jsondata}  status
    Should be Equal     ${jsondata['status']}     success

Admin Session close
    ${oauthToken}       Get Token
    ${clientKey}    Get ClientKey
    ${clientSecret}     Get clientSecret
    Session Close Admin       ${oauthToken}       ${clientKey}        ${clientSecret}

Close Session
    ${oauthToken}       Get Token
    ${clientKey}    Get ClientKey
    ${clientSecret}     Get clientSecret
    Session Close       ${oauthToken}       ${clientKey}        ${clientSecret}

Get ContactName Updated Json Request Body
    [Arguments]         ${Req_Body}         ${num}    ${Contact_Name}     ${recVersionId}
  #  ${numList}      create list     ${num}
    ${data}=    evaluate    json.loads('''${Req_Body} ''')    json
    ${NumlistObject}        create dictionary       num=${num}          recVersionId=${recVersionId}
    ${tfNumList}        create list         ${NumlistObject}
    set to dictionary     ${data}     tfNumList=${tfNumList}
    set to dictionary     ${data}     conName=${Contact_Name}
    ${ContactName_Updated_ReqBody}=    evaluate    json.dumps(${data})    json
    log         ${ContactName_Updated_ReqBody}
    [Return]    ${ContactName_Updated_ReqBody}

Get ContactNumber Updated Json Request Body
    [Arguments]        ${Req_Body}         ${num}    ${Cont_Num}     ${recVersionId}
    ${data}=    evaluate    json.loads('''${Req_Body} ''')    json
    ${NumlistObject}        create dictionary       num=${num}          recVersionId=${recVersionId}
    ${tfNumList}        create list         ${NumlistObject}
    set to dictionary     ${data}     tfNumList=${tfNumList}
    set to dictionary     ${data}     conPhone=${Cont_Num}
    ${ContactNumber_Updated_Reqbody}=    evaluate    json.dumps(${data})    json
    log     ${ContactNumber_Updated_Reqbody}
    [Return]    ${ContactNumber_Updated_Reqbody}

Get ContactNumber Available In DB
    [Arguments]         ${token}
    ${resp}     PUT Method       ${token}      ${NUS_Random_URI}     ${RequestDataForNUSRandomSearch}     ${SuccessResponse}
    log     ${resp}
    should not be empty     ${resp}
    ${numList}      get from dictionary         ${resp}         numList
    ${number}       get from list       ${numList}      0
    [Return]    ${number}

Get ResUntilDt Updated Json Request Body
    [Arguments]         ${Req_Body}     ${num}        ${ResUntilDt}       ${recVersionId}
    ${data}=    evaluate    json.loads('''${Req_Body} ''')    json
    ${NumlistObject}        create dictionary       num=${num}          recVersionId=${recVersionId}
    ${tfNumList}        create list         ${NumlistObject}
    set to dictionary     ${data}     tfNumList=${tfNumList}
    set to dictionary     ${data}     resUntilDt=${ResUntilDt}
    #set to dictionary     ${data}      recVersionId=${recVersionId}
    ${ResUntilDt_Updated_ReqBody}=    evaluate    json.dumps(${data})    json
    log         ${ResUntilDt_Updated_ReqBody}
    [Return]    ${ResUntilDt_Updated_ReqBody}

Do REL QUERY
    [Arguments]     ${Token}     ${Response_code}
    Create Session  endpoint  ${HOST}
    ${second}     fetch from right   ${GET_REL_ACTION}     /v2/ip/
    ${GET_REL_ACTION}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_REL_ACTION}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*     Authorization=Bearer ${token}
    ${resp}=  Get Request   endpoint  ${GET_REL_ACTION}  headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}     ${Response_code}
    ${responsejsondata}=  To Json  ${resp.content}
    Log  ${responsejsondata}
    [Return]                              ${responsejsondata}

GET METHOD
    [Arguments]    ${token}     ${GET_ACTION_URI}   ${status_code}
    sleep       ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${GET_ACTION_URI}     /v2/ip/
    ${GET_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}   headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
    ${responsejsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata}

GET METHOD_V3
    [Arguments]    ${token}     ${GET_ACTION_URI}   ${status_code}
    sleep       ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${GET_ACTION_URI}     /v3/ip/
    ${GET_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v3/ip/admin/${second}      ${GET_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}   headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
    ${responsejsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata}

GET Method With Sync Timeout
    [Arguments]    ${token}     ${GET_ACTION_URI}   ${status_code}      ${GET_SYNC_URI}
    sleep       ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${GET_ACTION_URI}     /v2/ip/
    ${GET_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_ACTION_URI}
    ${GET_SYNC_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_SYNC_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}   headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_SYNC_URI}     ${202Accepted}
    ${responsejsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata}

Get Random String
    [Arguments]    ${numberOfLetters}     ${lowerOrUpper}
        ${randomString}=    generate random string      ${numberOfLetters}     ${lowerOrUpper}
        [Return]  ${randomString}

Create RespOrg Entity
    [Arguments]  ${token}  ${requestBody}    ${expectedResponseCode}    ${respOrgEntityString}
    #Load respOrgEntity_request_body and modify respOrgEntity value
    ${requestData}=    evaluate    json.loads('''${requestBody}''')    json
    ${respOrgEntity}=   get from dictionary     ${requestData}     respOrgEntity
    #Add resporg entity to reguest body
    set to dictionary   ${requestData}      respOrgEntity=${respOrgEntityString}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    Log     ${reqBody}
    #Perform Create RespOrg Entity operation
    ${responseData}=    POST Method  ${token}  ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}   ${reqBody}  ${expectedResponseCode}
    log     ${responseData}
    ${response}     get dictionary items  ${responseData}
    should not be empty     ${response}
    ${recVersionId}         get from dictionary     ${responseData}     recVersionId
    log many  RespOrg Entity ${respOrgEntityString} is created successfully
    [Return]  ${respOrgEntityString}        ${recVersionId}

Retrieve RespOrgEntity
    [Arguments]    ${token}     ${respOrgEntityName}   ${status_code}
    ${jsondata}     GET METHOD      ${token}     ${GET_RETRIEVE_RESPORG_ENITY}${respOrgEntityName}   ${status_code}
    log many  RespOrgEntity  ${respOrgEntityName}    is Retrieved Successfully
    [Return]    ${jsondata}

Delete RespOrg Entity
    [Arguments]    ${token}     ${requestBody}  ${respOrgEntityName}        ${recVersionId}    ${status_code}
    #Loading respOrgEntity_request_body and modifying respOrgEntity value
    ${requestData}=    evaluate    json.loads('''${requestBody}''')    json
    set to dictionary   ${requestData}      respOrgEntity=${respOrgEntityName}
    set to dictionary   ${requestData}      recVersionId=${recVersionId}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    Log     ${reqBody}


    #Delete RespOrg Entity
    ${responseData}     PUT Method  ${token}   ${PUT_DELETE_RESPORG_ENITY}     ${reqBody}     ${SuccessResponse}
    log     ${responseData}
    ${dictionaryItems}     get dictionary items  ${responseData}
    should be empty  ${dictionaryItems}

Update RespOrg Entity Company Name
    [Arguments]    ${token}     ${requestBody}  ${respOrgEntityName}    ${companyName}      ${recVersionId}    ${status_code}
    #Loading respOrgEntity_request_body and modifying respOrgEntity value
    ${requestData}=    evaluate    json.loads('''${requestBody}''')    json
    set to dictionary   ${requestData}      respOrgEntity=${respOrgEntityName}
    set to dictionary   ${requestData}      companyName=${companyName}
    set to dictionary   ${requestData}      recVersionId=${recVersionId}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    Log     ${reqBody}

    #Update RespOrg Entity Company Name
    ${responseData}     PUT Method  ${token}   ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}     ${reqBody}     ${SuccessResponse}
    log     ${responseData}
    ${dictionaryItems}     get dictionary items  ${responseData}
    should not be empty  ${dictionaryItems}
    ${recVersionId}     get from dictionary     ${responseData}     recVersionId
    [Return]        ${recVersionId}


Retrieve NXL With EffDate
    [Arguments]    ${token}     ${status_code}      ${New_date}
    ${Modified_Date}        Remove '-' From EffDate         ${New_date}
    Create Session  endpoint  ${HOST}
    ${second}     fetch from right   ${GET_Retrieve_NXL_With_EffDate}     /v2/ip/
    ${GET_Retrieve_NXL_With_EffDate}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_Retrieve_NXL_With_EffDate}
    ${headers}=     Create Dictionary  Accept=application/json     Content-Type=application/json   Authorization=Bearer ${token}
    ${resp}=    GET Request    endpoint  ${GET_Retrieve_NXL_With_EffDate}${Modified_Date}     headers=${headers}
    log     ${resp}
    ${response} =	to json     ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}     ${status_code}
    Log  ${response}
    [Return]    ${response}

Remove '-' From EffDate
    #[Documentation]     ${responsedata} -> raw response we get from IMS
    [Arguments]     ${EffDate}
    ${Modified_Date}=   Replace String Using Regexp     ${EffDate}  -    ${EMPTY}    count=2
    [Return]    ${Modified_Date}

Retrieve NXL To Get Future Spare Date
    [Tags]      Sanity      Regression
    ${oauthToken}     Get Oauthentication Token       ${User_Credentials_Track2}
    ${retrieve_NXL}     GET METHOD      ${oauthToken}   ${GET_Retrieve_NXL}     ${SuccessResponse}
    log     ${retrieveNXL}
    ${retrieveNXLResponse}     get from dictionary     ${retrieveNXL}     nxlRecords
    log     ${retrieveNXLResponse}
    ${SIZE}     get length      ${retrieveNXLResponse}
    log     ${SIZE}
    ${lastIndex-1}      evaluate    (${SIZE}-1)
    ${lastIndex-1Response}   get from list       ${retrieveNXLResponse}    ${lastIndex-1}
    ${effDate}      get from dictionary     ${lastIndex-1Response}     effDt
    log     ${effDate}
    ${DATE}     Get Future Effective Date    ${effDate}   1
    [Return]    ${DATE}

Get Future Effective Date
    [Arguments]     ${Date}     ${Number of Days}
    ${Edit_Date}        Add Time To Date    ${Date}   ${Number of Days}days
    ${Date}    Convert Date    ${Edit_Date}    %Y-%m-%d
    [Return]    ${Date}

Concatenate Error Message
    [Arguments]  ${requestBody}    ${value}     ${constantString}    ${errorMessage}
    ${requestData}=    evaluate    json.loads('''${requestBody}''')    json
    ${responseValue}    get from dictionary  ${requestData}    ${value}
    ${errorResponse}    catenate  ${constantString} ${responseValue} ${errorMessage}
    [Return]  ${errorResponse}

Parse Request Body
    [Arguments]  ${responseBody}     ${keyName}
    ${requestData}=    evaluate    json.dumps(${responseBody})    json
    ${requestData}=    evaluate    json.loads('''${requestData}''')    json
    ${nxlRecordsList}=   get from dictionary     ${requestData}     ${keyName}
    ${responseBody}=    evaluate    json.dumps(${nxlRecordsList})    json
    [Return]  ${responseBody}

Retrieve NXL
    [Arguments]    ${token}  ${NPA}  ${NXX}  ${EffD&T}  ${status_code}
    Create Session  endpoint  ${HOST}
    ${second}     fetch from right   ${GET_Retrieve_NXL_WITH_EFFDT}     /v2/ip/
    ${GET_Retrieve_NXL_WITH_EFFDT}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_Retrieve_NXL_WITH_EFFDT}
    ${headers}=     Create Dictionary  Accept=application/json     Content-Type=application/json   Authorization=Bearer ${token}
    ${resp}=    GET Request    endpoint  ${GET_Retrieve_NXL_WITH_EFFDT}${NPA}/nxx/${NXX}?effDt=${EffD&T}    headers=${headers}
    log     ${resp}
    ${description} =   to json     ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}     ${status_code}
    Log  ${description}
    [Return]    ${description}

Get EffectiveDate Updated Json Request Body
    [Arguments]     ${Req_Body}     ${futureEffDate}
    ${addNXLReqdata}=    evaluate    json.loads('''${Req_Body}''')    json
    ${Eff_Date}=   get from dictionary     ${addNXLReqdata}     effDt
    set to dictionary   ${addNXLReqdata}      effDt=${futureEffDate}
    ${modifiedAddReqbody}=    evaluate    json.dumps(${AddNXLReqdata})    json
    [Return]  ${modifiedAddReqbody}

Get Target Effective Date Updated Json Request Body
    [Arguments]     ${Req_Body}     ${futureEffDate}
    ${copyNXLrequestData}=    evaluate    json.loads('''${Req_Body}''')    json
    set to dictionary   ${copyNXLrequestData}      srcEffDt=${futureEffDate}
#    ${Random_days}                 generate random string  2   [NUMBERS]
    ${futureTargetEffDate}  Get Future Effective Date   ${futureEffDate}     1
    set to dictionary   ${copyNXLrequestData}    tgtEffDt=${futureTargetEffDate}
    ${modifiedCopyReqBody}=    evaluate    json.dumps(${copyNXLrequestData})    json
    [Return]    ${modifiedCopyReqBody}

Get User Profile
    [Arguments]     ${oauthToken}       ${userID}
    ${responseData}=    GET METHOD    ${oauthToken}     ${UP_ACTION}${userID}    ${SuccessResponse}
    log         ${responseData}
    [Return]   ${responseData}

Set UserID State
    [Arguments]         ${oauthToken}        ${requestBody}          ${userID}           ${state}
    ${requestData}=    evaluate    json.loads('''${requestBody}''')    json
    set to dictionary       ${requestData}    loginId=${userID}
    set to dictionary       ${requestData}   lockInd=${state}
    ${requestData}    evaluate    json.dumps(${requestData})    json
    log     ${requestData}
    ${responseData}     PUT Method  ${oauthToken}   ${UP_ACTION}     ${requestData}    ${SuccessResponse}
    log     ${responseData}
    should be empty     ${responseData}
    [Return]    ${requestData}

Get UserID State
    [Arguments]     ${oauthToken}        ${userID}
    #${userID} is the userid to be locked or unlocked #${expectedStatus} is locked or unlocked
    ${responseData}   Get User Profile       ${oauthToken}        ${userID}
    log     ${responseData}
    ${userIdState}     get from dictionary     ${responseData}      lockInd
    should not be empty     ${userIdState}
    [Return]        ${userIdState}

Get Open Session Response
    [Arguments]     ${LockUnlock_User_Credentials_Track2}
    ${resp}=  Get Session Open Response     ${LockUnlock_User_Credentials_Track2}
#    Should Be Equal As Strings  ${resp.status_code}  ${SuccessResponse}
#    ${jsondata}=  To Json  ${resp.content}
#    log  ${jsondata}
#    should not be empty     ${jsondata}
    [Return]        ${resp}

Perform Number Query
    [Arguments]         ${token}        ${number}
    ${responseData}=    Do Number Query     ${token}    ${number}     ${SuccessResponse}
    log         ${responseData}
    [Return]        ${responseData}

Get Contact Details
    [Arguments]         ${responsedata}
    ${conPhone}         get from dictionary     ${responsedata}       conPhone
    should not be empty         ${conPhone}
    ${conName}          get from dictionary     ${responsedata}       conName
    [Return]        ${conPhone}     ${conName}

Update RespOrgId
    [Arguments]     ${oauthToken}       ${reqbody}       ${number}       ${newResporgId}        ${recVersionId}
    #add respOrgId to request body
    ${reqBody}=    evaluate    json.loads('''${reqbody}''')    json
    ${NumlistObject}        create dictionary       num=${number}          recVersionId=${recVersionId}
    ${tfNumList}        create list         ${NumlistObject}
    set to dictionary     ${reqBody}     tfNumList=${tfNumList}
    set to dictionary     ${reqBody}    ctrlRespOrgId=${newResporgId}
   # set to dictionary     ${reqBody}    recVersionId=${recVersionId}
    ${updatedReqBody}=    evaluate    json.dumps(${reqBody})    json
    log         ${updatedReqBody}
    #update number with respOrgID
    ${responseData}     Do Number Update     ${oauthToken}    ${updatedReqBody}    ${SuccessResponse}
    log     ${responseData}
    [Return]    ${responseData}

Lock or Unlock UserId
    [Arguments]     ${token}      ${UserID_ReqData}       ${status_code}
    ${Response_Body}        PUT Method      ${token}      ${PUT_lOCKorUNLOCK_UserID}     ${UserID_ReqData}     ${status_code}
    log     ${Response_Body}
    [Return]        ${Response_Body}

Check For Duplicate String
#Here ${stringType} parameter accepts only [LETTERS],[NUMBERS],[UPPER],[LOWER] values
    [Arguments]  ${listToCheck}     ${numberOfLetters}  ${stringType}     ${stringToConcatinateFirst}     ${stringToConcatinateLast}
    ${requestData}=    evaluate    json.dumps(${listToCheck})    json
    ${requestData}=    evaluate    json.loads('''${requestData}''')    json
    ${listLength}      get length  ${listToCheck}
    ${i}    set variable  0
    set global variable  ${duplicateRandomStringCheck}
    FOR   ${i}      IN RANGE    0  ${listLength}
       ${duplicateRandomStringCheck}     generate random string  ${numberOfLetters}   ${stringType}
       ${duplicateRandomStringCheck}       convert to uppercase  ${duplicateRandomStringCheck}
       ${duplicateRandomStringCheck}   catenate    ${stringToConcatinateFirst}${duplicateRandomStringCheck}${stringToConcatinateLast}
       ${Condition}     run keyword and return status    list should not contain value      ${requestData}   ${duplicateRandomStringCheck}
       log     ${Condition}
       Exit For Loop If   ${Condition} == True
    END
    [Return]  ${duplicateRandomStringCheck}

Get Random User Role
#User Role should be alphanumeric with minimum length 1 and maximum length 8
    [Arguments]     ${oauthToken}   ${StringType}
    ${Two_Random_Numbers}   get random string   2   [NUMBERS]
    #Retrieve List of User Roles
    ${responseData}     GET METHOD      ${oauthToken}       ${GET_LUR_ACTION}      ${SuccessResponse}
    ${Users_List}   get from dictionary   ${responseData}   roleLst
    #${New_UserRole}   get from list   ${Users_List}     5
    ${New_UserRole}     Check For Duplicate String  ${Users_List}   4   ${StringType}     ${EMPTY}     ${Two_Random_Numbers}
    [Return]    ${New_UserRole}

Delete User Role
    [Arguments]     ${oauthToken}   ${UserRole_To_delete}   ${ReqBody}
    #Create request body
    ${requestData}    evaluate    json.loads('''${ReqBody}''')    json
    set list value     ${requestData['roleLst']}   0     ${UserRole_To_delete}
    ${Req_body}=    evaluate    json.dumps(${requestData})    json
    #Call Delete API
    ${responseData}    PUT Method  ${oauthToken}   ${PUT_DELETE_USER_ROLES}   ${Req_body}  ${SuccessResponse}
    ${dictionaryItems}     get dictionary items  ${responseData}
    should be empty  ${dictionaryItems}
    #Retrieve list of user roles and validate deleted user role
    ${Resp}     GET METHOD      ${oauthToken}       ${GET_LUR_ACTION}      ${SuccessResponse}
    log     ${Resp}
    #${UserRoles_List}    convert to string   ${Resp}
    ${UserRoles_List}       get from dictionary        ${Resp}      roleLst
    list should not contain value       ${UserRoles_List}   ${UserRole_To_delete}
    log  User Role ${UserRole_To_delete} deleted successfully

Validate Error List
    [Arguments]  ${ResponseData}     ${Index}     ${Expected_Error_Msg}     ${Expected_Error_Code}
    ${errorMsg}    get from dictionary   ${ResponseData['errList'][${Index}]}     errMsg
    should be equal as strings    ${errorMsg}    ${Expected_Error_Msg}
    ${ErrorLevel}    get from dictionary   ${ResponseData['errList'][${Index}]}     errLvl
    should be equal as strings    ${ErrorLevel}    ${ERROR}
    ${ErrorCode}     get from dictionary   ${ResponseData['errList'][${Index}]}   errCode
    should be equal as strings  ${ErrorCode}     ${Expected_Error_Code}

Create User Role
    [Arguments]  ${oauthToken}      ${UserRole}     ${ReqBody}
    #Create Request Body
    ${requestData}    evaluate    json.loads('''${ReqBody}''')    json
    set to dictionary    ${requestData}        roleName=${UserRole}
    ${Req_body}=    evaluate    json.dumps(${requestData})    json
    #Add new user role using post method
    ${responseData}    POST Method  ${oauthToken}   ${POST_Add_User_Role}   ${Req_body}  ${SuccessResponse}
    ${Resp_UserRole}     get from dictionary     ${responseData["roleLstResp"][0]}    roleName
    should be equal as strings      ${UserRole}     ${Resp_UserRole}
    #Retrieve list of user roles and validate newly added user role
    ${After_Create_Resp}     GET METHOD      ${oauthToken}       ${GET_LUR_ACTION}      ${SuccessResponse}
    log     ${After_Create_Resp}
    #${After_Create_Resp}    convert to string   ${After_Create_Resp}
    ${After_Create_Resp}        get from dictionary         ${After_Create_Resp}        roleLst
    list should contain value       ${After_Create_Resp}   ${UserRole}
    [Return]    ${responseData}
Get ReqBody For Two Exisitng One New User Roles
    [Arguments]  ${oauthToken}  ${New_UserRole}     ${Req_Body}
    #Get the existing roles from API
    ${responseData}     GET METHOD      ${oauthToken}       ${GET_LUR_ACTION}      ${SuccessResponse}
    ${Existing_Roles}   get from dictionary     ${responseData}     roleLst
    ${Existing_Role1}     get from list   ${Existing_Roles}     0
    ${Existing_Role2}     get from list   ${Existing_Roles}     1
    #Create a Request Body
   # ${requestData}    evaluate    json.loads('''${Req_Body}''')    json
    ${Three_roles}      convert to string       ${Existing_Role1}","${Existing_Role2}","${New_UserRole}
    ${requestData}      create dictionary       roleName=${Three_roles}
    #${Three_roles}      create list    ${Existing_Role1}       ${Existing_Role2}       ${New_UserRole}
   # set to dictionary       ${requestData}     roleName=${Three_roles}
#    set to dictionary       ${requestData}     roleName=${Existing_Role2}
#    set to dictionary       ${requestData}     roleName=${New_UserRole}
    ${Req_body}=    evaluate    json.dumps(${requestData})    json
    [Return]    ${Existing_Role1}   ${Existing_Role2}   ${Req_body}

Generate Valid New Password
    ${string}       Generate Random String  1       [UPPER]
    ${string2}       Generate Random String  3       [LOWER]
    ${string3}      generate random string    2     0123456789
    ${userPswd}       catenate    ${string}${string2}@@${string3}
    log     ${userPswd}
    ${length}       get length      ${userPswd}
    run keyword if      ${length}==8        log         done
    ...     ELSE    Fail        log  UserPassword Length should be 8.
    [Return]        ${userPswd}

UserLst Updated RequestData
    [Arguments]         ${requestData}
    ${updatedRequestData}=    evaluate  '${ReqData_UserProfileCreate_List} '.replace('{body}','${requestData}')
    log         ${updatedRequestData}
    [Return]        ${updatedRequestData}

Delete User Profile
    [Arguments]         ${oauthToken}       ${requestData}      ${loginId}
    ${requestData}=    evaluate    json.loads('''${requestData}''')    json
    set to dictionary     ${requestData}     loginId=${loginId}
    ${requestData}=    evaluate    json.dumps(${requestData})    json
    ${responseData}     PUT Method      ${oauthToken}       ${UP_DELETE_ACTION}       ${requestData}   ${SuccessResponse}
    log          ${responseData}
    should be empty    ${responseData}
    [Return]        ${responseData}

Get List Of LoginIDs
    [Arguments]     ${oauthToken}
    #Get the User Name list
    ${responseData}     GET METHOD      ${oauthToken}       ${Get_UserProfile_List}     ${SuccessResponse}
    ${UserName}      get from dictionary     ${responseData}     usrLst
    log     ${UserName}
    [Return]    ${UserName}

Generate LoginID
    [Arguments]     ${oauthToken}       ${lengthOfString}       ${stringType}       ${stringToAppendFirst}     ${stringToAppendLast}
    #Get the User Name list
    ${responseData}     GET METHOD      ${oauthToken}       ${Get_UserProfile_List}     ${SuccessResponse}
    ${UserName}      get from dictionary     ${responseData}     usrLst
    log     ${UserName}
    #Get Randomely generated String
    ${LoginID}     Check For Duplicate String  ${UserName}        ${lengthOfString}       ${stringType}     ${stringToAppendFirst}     ${stringToAppendLast}
    [Return]        ${LoginID}

Validate Non-existing User Profile Retrieve Response
    [Arguments]     ${oauthToken}        ${loginId}
    ${responseData}   Get User Profile      ${oauthToken}        ${loginId}
    log     ${responseData}
    validation for error message        ${responseData}     ${NonExistLoginIDErrMsg}     ${ERROR}       ${NonExistLoginIDErrCode}
    [Return]        ${responseData}

Get Non-Existing Telco
    [Arguments]     ${oauthToken}       ${lengthOfString}       ${stringType}       ${stringToAppendFirst}     ${stringToAppendLast}
    #Get the User Name list
    ${responseData}     GET METHOD      ${oauthToken}       ${GET_TELCO_LIST}     ${SuccessResponse}
    ${telcoLst}      get from dictionary     ${responseData}     telcoLst
    ${listLength}      get length  ${telcoLst}
    #Get the list of Existing User Names and create a list
    ${telco_List}   create list
    ${i}    set variable    0
    FOR   ${i}      IN RANGE    0  ${listLength}
       ${telco}      get from dictionary     ${responseData['telcoLst'][${i}]}     telco
       append to list     ${telco_List}    ${telco}
    END
    log     ${telco_List}
    #Get Randomely generated String
    ${newTelco}     Check For Duplicate String  ${telco_List}        ${lengthOfString}       ${stringType}     ${stringToAppendFirst}     ${stringToAppendLast}
    [Return]        ${newTelco}

Create User Profile
    [Arguments]         ${oauthToken}       ${requestData}          ${responseCode}
    ${responseData}     POST Method     ${oauthToken}   ${UP_ACTION}      ${requestData}        ${responseCode}
    [Return]        ${responseData}

UserProfileCreate Validation
    [Arguments]     ${oauthToken}        ${loginId}         ${requestData}     ${respDataExpectedParametersList}
    ${responseData}   Get User Profile      ${oauthToken}        ${loginId}
    log     ${responseData}
    ${responseDataList}     convert to list         ${responseData}
    log     ${responseDataList}
    @{Lists}        create list
    ${numOfParametersInList}   get length      ${respDataExpectedParametersList}
    log     ${numOfParametersInList}
    FOR   ${i}   IN RANGE   0   ${numOfParametersInList}
       ${parameter}     get from list       ${respDataExpectedParametersList}      ${i}
       ${list}     run keyword and return status  should not contain           ${parameter}       Lst
       ${response}     run keyword if      ${list}==False      run keywords            List Validation     ${parameter}     ${responseData}     ${requestData}         AND             continue for loop
        ...     ELSE    get from dictionary        ${responseData}     ${parameter}
       ${Status}     run keyword and return status     should contain      ${requestData}      ${parameter}
       ${request}    run keyword if      ${Status}==True     Get Value From RequestData       ${requestData}         ${parameter}
       ...     ELSE        log     requestData doesn't contain ${parameter}
       run keyword if      ${Status}==True         should be equal     ${request}            ${response}
       ...     ELSE        should be equal      ${UNLOCK}        ${response}
    END
    [Return]        ${responseData}

List Validation
    [Arguments]     ${parameter}     ${Response}     ${Request}
    ${Request}    evaluate    json.loads('''${Request}''')    json
    ${Len}  get length      ${parameter}
    ${Status}     run keyword and return status     should contain      ${Response}      ${parameter}
    ${Resp}    run keyword if      ${Status}==True      get from dictionary           ${Response}         ${parameter}
    ${Request}    run keyword if      ${Status}==True      get from dictionary           ${Request}         ${parameter}
    ${Status}     run keyword and return status     should contain      ${Request}      ${parameter}
    sort list       ${Resp}
    sort list       ${Request}
    lists should be equal       ${Resp}         ${Request}

#    ${Requ}    run keyword if      ${Status}==True     Get Value From RequestData       ${Request}         ${parameter}
#    ${NoOfParams}   get length      ${Resp}
#    :FOR   ${i}   IN RANGE   0   ${NoOfParams}
#    \   ${Requ}    evaluate    json.loads('''${Requ}''')    json
#    \   ${Val}      get from list       ${Resp}     ${i}
#    \   list should contain value   ${Requ}     ${Val}

Get Value From RequestData
    [Arguments]     ${inputJSON}    ${request_parameter}
    ${list}     run keyword and return status  should not contain   ${request_parameter}       Lst
    ${request}      run keyword if   ${list} == True        get from input      ${inputJSON}    ${request_parameter}
    ...     ELSE      get json value       ${inputJSON}    /${request_parameter}
    [Return]        ${request}

Get List Values from ResponseData
    [Arguments]     ${responseData}     ${parameter}
    ${response}     get from dictionary        ${responseData}     ${parameter}
    ${response}     evaluate    json.dumps(${response})    json
    [Return]        ${response}

Resp Org Unit Modify Pre-Condition
    [Arguments]  ${token}
    ${respOrgEntityList}     GET METHOD      ${token}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}   ${successResponse}
    ${respOrgList}     get from dictionary     ${respOrgEntityList}     respOrgList
    ${respOrgEntity}  set variable  ${respOrgList[0]["respOrgEntity"]}
    ${respOrgUnitList}     GET METHOD      ${token}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_UNIT}   ${successResponse}
    ${respOrgUnitListResponse}    Parse Request Body   ${respOrgEntityList}     respOrgList
    ${respOrgUnitString}     Check For Duplicate String      ${respOrgUnitListResponse}      3      [LETTERS][NUMBERS]      ${respOrgEntity}     ${EMPTY}
    [Return]  ${respOrgUnitString}

Delete RespOrg Unit
    [Arguments]    ${token}     ${requestBody}  ${respOrgUnitName}      ${recVersionId}   ${status_code}
    #Loading respOrgUnit_request_body and modifying respOrgEntity value
    ${requestData}=    evaluate    json.loads('''${requestBody}''')    json
    set to dictionary   ${requestData}      respOrgId=${respOrgUnitName}
    set to dictionary   ${requestData}      recVersionId=${recVersionId}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    #Delete RespOrg Entity
    ${responseData}     PUT Method  ${token}   ${PUT_DELETE_RESPORG_UNIT}     ${reqBody}     ${status_code}
    log     ${responseData}
    [Return]    ${responseData}

Disconnect RespOrg Unit
    [Arguments]    ${token}     ${requestBody}  ${respOrgUnitName}      ${recVersionId}    ${status_code}
    #Loading respOrgUnit_request_body and modifying respOrgEntity value
    ${requestData}=    evaluate    json.loads('''${requestBody}''')    json
    set to dictionary   ${requestData}      respOrgId=${respOrgUnitName}
    set to dictionary   ${requestData}      recVersionId=${recVersionId}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    #Delete RespOrg Entity
    ${responseData}     PUT Method  ${token}   ${PUT_DISCONNECT_RESPORG_UNIT}     ${reqBody}     ${status_code}
    log     ${responseData}
    [Return]    ${responseData}


Create RespOrg Unit
    [Arguments]  ${token}  ${requestBody}    ${expectedResponseCode}    ${respOrgEntityString}  ${respOrgUnitString}
    #Load respOrgUnit_request_body and modify respOrgUnit value
    ${requestData}=    evaluate    json.loads('''${requestBody}''')    json
    ${respOrgEntity}=   get from dictionary     ${requestData}     respOrgId
    ${respOrgUnitSubString}    set variable  ${respOrgUnitString[2:]}
    ${respOrgUnitString}    set variable  ${respOrgEntityString}
    ${respOrgUnitString}    catenate  ${respOrgUnitString}${respOrgUnitSubString}
    #Add resporg unit to reguest body
    set to dictionary   ${requestData}      respOrgEntity=${respOrgEntityString}
    set to dictionary   ${requestData}      respOrgId=${respOrgUnitString}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log  ${reqBody}
    ${createRespOrgUnitResponse}     POST Method  ${token}    ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_UNIT}      ${reqBody}     ${expectedResponseCode}
    log     ${createRespOrgUnitResponse}
    [Return]   ${createRespOrgUnitResponse}

Create User Profile With all Parameters
    [Arguments]          ${oauthToken}          ${ReqData_UserProfileCreate}
    ${loginId}      Generate LoginID        ${oauthToken}       4       [UPPER]       USQW     ${EMPTY}
    ${requestData}=    evaluate    json.loads('''${ReqData_UserProfileCreate}''')    json
    set to dictionary     ${requestData}     loginId=${loginId}
    ${requestData}=    evaluate    json.dumps(${requestData})    json
    log         ${requestData}
    ${updatedRequestData}=    UserLst Updated RequestData       ${requestData}
    ${responseData}     Create User Profile     ${oauthToken}           ${updatedRequestData}       ${SuccessResponse}
    should be empty         ${responseData}
    ${expectedResDataForAllParameters}     create list     viewLst     primaryEmail        updtLst		respOrgId		telco		phoneNum		lockInd		role		location		usrFullname		usrClass		loginId
    UserProfileCreate Validation        ${oauthToken}       ${loginId}          ${requestData}      ${expectedResDataForAllParameters}
    [Return]        ${loginId}

Retrieve Telco
    [Arguments]    ${token}     ${Telco}   ${status_code}
    ${jsondata}     GET METHOD      ${token}     ${GET_Retrieve_TCO}${Telco}   ${status_code}
    log many  RespOrgEntity  ${Telco}    is Retrieved Successfully
    [Return]    ${jsondata}

Modify User Profile
    [Arguments]         ${oauthToken}           ${requestData}    ${responseCode}
    ${responseData}     PUT Method  ${oauthToken}   ${UP_ACTION}     ${requestData}    ${responseCode}
    log     ${responseData}
    [Return]            ${responseData}

Error List Validation
    [Arguments]         ${ResponseData}     ${expectedErrMsglist}           ${expectedErrMsgCodelist}
    ${errList}      get from dictionary      ${ResponseData}     errList
    ${listLength}      get length  ${errList}
    ${j}    set variable    0
    FOR   ${i}      IN RANGE    0  ${listLength}
       ${errMsg}=   get from dictionary          ${responseData['errList'][${i}]}       errMsg
       ${ErrorLvl}=   get from dictionary  ${responseData['errList'][${i}]}    errLvl
       ${ErrorCode}=   get from dictionary  ${responseData['errList'][${i}]}    errCode
       list should contain value       ${expectedErrMsglist}         ${errMsg}
       list should contain value       ${expectedErrMsgCodelist}         ${ErrorCode}
       should be equal     ${ErrorLvl}     ${ERROR}
    END

UserProfileCleanup
    [Arguments]             ${oauthToken}           ${loginId}
    #Get the User Name list
    ${HOST}    set variable if   '${admin_flag}'=='True'     ${UAT_ADMIN_HOST}     ${UAT_RESPORG_HOST}
    set global variable    ${HOST}
    ${userNames_List}       Get List Of LoginIDs            ${oauthToken}
    ${Status}       run keyword and return status          list should contain value        ${userNames_List}         ${loginId}
    run keyword if          ${Status}==True              Delete User Profile      ${oauthToken}       ${ReqData_UserProfileDelete}       ${loginId}
    ...  ELSE         log  There is no user profile to delete
    ${clientKey}    Get ClientKey
    ${clientSecret}     Get clientSecret
    Session Close       ${oauthToken}       ${clientKey}        ${clientSecret}

Get Future Effective DateTime
    [Arguments]     ${numberOfDays}
    ${Date}    get current Date
    ${Date_Time}        Add Time To Date    ${Date}   ${numberOfDays} days
    ${Date_Time}        evaluate  '${Date_Time}'.replace(' ','T')
    ${Date_Time}        fetch from left     ${Date_Time}     :
    ${minutesInquarters}    create list     00  15  30  45
    ${listIndex}      generate random string     1    0123
    ${randomMins}      get from list   ${minutesInquarters}   ${listIndex}
    ${Date_Time}        Catenate    ${Date_Time}:${randomMins}Z
    [Return]        ${Date_Time}

Get Updated Json Request Body For Num And Date
    [Arguments]    ${request_body}   ${number}  ${effectiveDateTime}
    ${data}=    evaluate    json.loads('''${request_body}''')    json
    set to dictionary     ${data}     num=${number}
    set to dictionary     ${data['destNums'][0]}    destNum=${number}
    set to dictionary   ${data}     effDtTm=${effectiveDateTime}
    ${Req_body}=    evaluate    json.dumps(${data})    json
    [Return]    ${Req_body}

Get Updated Json Request Body For TFN Date AOS
    [Arguments]    ${request_body}   ${number}  ${effectiveDateTime}    ${aos_Data}
    ${data}=    evaluate    json.loads('''${request_body}''')    json
    set to dictionary     ${data}     num=${number}
    set to dictionary     ${data['destNums'][0]}    destNum=${number}
    set to dictionary   ${data}     effDtTm=${effectiveDateTime}
    set to dictionary   ${data}     aos=${aos_Data}
    ${Req_body}=    evaluate    json.dumps(${data})    json
    [Return]    ${Req_body}


GET Method With One Parameter
    [Arguments]    ${token}     ${GET_ACTION_URI}   ${Param}    ${status_code}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${GET_ACTION_URI}     /v2/ip/
    ${GET_ACTION_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_ACTION_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*    Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${Param}   headers=${headers}
    ${jsondata} =	To json     ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}     ${status_code}
    [Return]    ${jsondata}


Get Updated ChangePassword Request Body
    [Arguments]         ${Req_Body}     ${UserId}       ${Password}     ${newPassword}
    ${data}=    evaluate    json.loads('''${Req_Body}''')    json
    set to dictionary     ${data}     usrName=${UserId}
    set to dictionary     ${data}    oldPassword=${Password}
    set to dictionary       ${data}    newPassword=${newPassword}
    ${reqBody}=    evaluate    json.dumps(${data})    json
    [Return]        ${reqBody}

Get Updated UserCredentials ReqBody
    [Arguments]         ${Req_Body}     ${UserId}       ${Password}
	${requestData}=    evaluate    json.loads('''${Req_Body}''')    json
	set to dictionary     ${requestData}     usrName=${UserId}
	set to dictionary     ${requestData}     password=${Password}
	set to dictionary      ${requestData}       withPerm=true
	${UserCredentials_RequestBody}=    evaluate    json.dumps(${requestData})    json
	[Return]    ${UserCredentials_RequestBody}

Get New User Credentials Request Body
    [Arguments]          ${oauthToken}
	${loginId}      Create User Profile With all Parameters     ${oauthToken}       ${ReqData_UserProfileCreate_all_Parameters}
	log     ${loginId}
	${Passwd}   get from input      ${ReqData_UserProfileCreate_all_Parameters}       password
	# Create request body to open  session with new userId
	${UserCredentials_RequestBody}      Get Updated UserCredentials ReqBody     ${User_Credentials_Track2}      ${loginId}      ${Passwd}
	[Return]    ${UserCredentials_RequestBody}

Get Updated New UserCredentials
    [Arguments]         ${NewPassword_Reqbody}      ${UserCredentials}
    ${data}=    evaluate    json.loads('''${NewPassword_Reqbody}''')    json
    ${userName}       get from dictionary     ${data}    usrName
    ${newPswd}       get from dictionary     ${data}    newPassword
    ${NewCredentials_Reqbody}       Get Updated UserCredentials ReqBody     ${User_Credentials_Track2}      ${userName}      ${newPswd}
    [Return]    ${NewCredentials_Reqbody}

Two Letter Differs In NewPassword
    [Arguments]         ${newPasswordUserCredentials}
    log     ${newPasswordUserCredentials}
    ${data}=    evaluate    json.loads('''${newPasswordUserCredentials}''')    json
    ${userID}       get from dictionary     ${data}    usrName
    ${password}       get from dictionary     ${data}    password
    ${updatedPassword}     evaluate  '${password}'.replace('@','$')
    ${Updated_NewCredentialsReqbody}        Get Updated ChangePassword Request Body     ${ChangePswd_ReqBody}     ${userID}       ${Password}     ${updatedPassword}
    [Return]        ${Updated_NewCredentialsReqbody}

Get ChangePassword with NewPassword
    [Arguments]         ${Req_Body}     ${UserId}       ${Password}
    ${newPassword}      Generate Valid New Password
    ${reqBody}        Get Updated ChangePassword Request Body     ${Req_Body}     ${userID}       ${Password}     ${newPassword}
    [Return]        ${reqBody}

Get Updated Unlock Request Body
    [Arguments]     ${unlockUserID_ReqData}     ${newPasswordUserCredentials}
    ${data}=    evaluate    json.loads('''${newPasswordUserCredentials}''')    json
    ${userID}       get from dictionary     ${data}    usrName
    ${data}=    evaluate    json.loads('''${unlockUserID_ReqData}''')    json
    set to dictionary     ${data}     loginId=${userID}
    set to dictionary     ${data}     lockInd=N
    set to dictionary     ${data}     phoneNum=9846989989
    ${Updated_UnlockUserID_ReqData}=    evaluate    json.dumps(${data})    json
    [Return]    ${Updated_UnlockUserID_ReqData}

Check and Get New Effective Date
    [Arguments]     ${listToCheck}      ${Date}
    ${requestData}=    evaluate    json.dumps(${listToCheck})    json
    ${listLength}      get length  ${listToCheck}
    ${i}    set variable  0
    ${new_date}    set variable  0
    FOR   ${i}      IN RANGE    0  ${listLength}
       ${randomDays}     generate random string   2    [NUMBERS]
       ${new_date}         Get Future Effective Date   ${Date}   ${randomDays}
       ${Condition}     run keyword and return status    list should not contain value      ${requestData}   ${new_date}
       log     ${Condition}
       Exit For Loop If   ${Condition} == True
    END
    [Return]  ${new_date}

Retrieve NXL with particular NPA and NXX
    [Arguments]    ${token}  ${NPA}  ${NXX}  ${status_code}
    Create Session  endpoint  ${HOST}
    ${second}     fetch from right   ${GET_Retrieve_NXL_WITH_EFFDT}     /v2/ip/
    ${GET_Retrieve_NXL_WITH_EFFDT}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_Retrieve_NXL_WITH_EFFDT}
    ${headers}=     Create Dictionary  Accept=application/json     Content-Type=application/json   Authorization=Bearer ${token}
    ${resp}=    GET Request    endpoint  ${GET_Retrieve_NXL_WITH_EFFDT}${NPA}/nxx/${NXX}       headers=${headers}
    log     ${resp}
    ${description} =   to json     ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}     ${status_code}
    Log  ${description}
    [Return]    ${description}

Get ASL With Label EffDt AslType
    [Arguments]  ${token}   ${labelName}    ${effDt}    ${aslType}  ${statusCode}
    Create Session  endpoint    ${HOST}
    ${uri}   set variable     /v2/ip/adm/asl/label/
    ${second}     fetch from right   ${uri}     /v2/ip/
    ${uri}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${uri}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*    Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${uri}${labelName}?effDt=${effDt}&aslType=${aslType}   headers=${headers}
    ${jsondata} =	To json     ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}     ${statusCode}
    [Return]    ${jsondata}

Delete ASL
    [Arguments]  ${token}   ${reqData}     ${labelName}    ${effDt}    ${aslType}  ${statusCode}
    ${requestData}    evaluate    json.loads('''${reqData}''')    json
    set to dictionary   ${requestData}      effDt=${effDt}
    set to dictionary   ${requestData}      aslType=${aslType}
    set to dictionary   ${requestData}      label=${labelName}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${response}     PUT Method  ${token}      ${PUT_DELETE_ASL}     ${reqBody}     ${statusCode}
    should be empty  ${response}

Retrieve ASL With Label
    [Arguments]  ${token}   ${labelName}    ${statusCode}
    Create Session  endpoint    ${HOST}
    ${uri}   set variable     /v2/ip/adm/asl/label/
    ${second}     fetch from right   ${uri}     /v2/ip/
    ${uri}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${uri}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${uri}${labelName}   headers=${headers}
    ${jsondata} =	To json     ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}     ${statusCode}
    [Return]    ${jsondata}

Validation for Retrieved ASL response
    [Arguments]     ${aslRetrieveRespone}   ${futureDate}   ${aslType}  ${respOrgIdValue}   ${PENDING_Status_Caps}  ${arglist}
    ${labelName}   get from dictionary  ${aslRetrieveRespone}  label
    ${records}   get from dictionary  ${aslRetrieveRespone}  records
    ${retrieveArgList}  get from dictionary     ${records[0]}   argList
    should be equal  ${records[0]["effDt"]}   ${futureDate}
    should be equal  ${records[0]["aslType"]}   ${aslType}
    should be equal  ${records[0]["respOrgId"]}   ${respOrgIdValue}
    should be equal  ${records[0]["status"]}       ${PENDING_Status_Caps}
    lists should be equal   ${retrieveArgList}      ${arglist}

Create ASL
    [Arguments]  ${token}       ${requestBody}
    #It will return time with date
    ${date}    get current date
    #Get ASL list
    ${aslRecordsList}      GET METHOD  ${token}     ${GET_LIST_ASL}   ${successResponse}
    ${aslList}  get from dictionary  ${aslRecordsList}     aslLst
    #Generate future data
    ${futureDate}   Check and Get New Effective Date    ${aslList}      ${date}
    #Generate Label name value min 3 ans max 7 length
    ${value}    generate random string  1   34567
    ${newLabelName}    generate random string  ${value}    [LETTERS][NUMBERS]
    ${respOrgId}        Get RespOrgID
    #Define ASL request body with EffDT RespOrgID and label name
    ${requestData}    evaluate    json.loads('''${requestBody}''')    json
    set to dictionary   ${requestData}      effDt=${futureDate}
     set to dictionary   ${requestData}      respOrgId=${respOrgId}
    set to dictionary   ${requestData}      label=${newLabelName}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    #Define ASL
    ${response}     POST Method  ${token}    ${POST_PUT_ADD_MODIFY_ASL}      ${reqBody}     ${successResponse}
    should not be empty  ${response}
    ${recVersionID}     get from dictionary     ${response}     recVersionId
    [Return]        ${reqBody}              ${recVersionID}

Validate Mandatory Parameters Of UAA Retrieve
    [Arguments]     ${reqDataOfUserProfileCreate}       ${uaaLst}       ${index}           ${inputLogoffStatus}
    ${retrivedEntity}   get from dictionary   ${uaaLst[${index}]}      entity
    ${respOrgId}       get from input      ${reqDataOfUserProfileCreate}          respOrgId
    ${inputEntity}       get substring           ${respOrgId}       0       2
    should be equal             ${retrivedEntity}           ${inputEntity}
    ${retrivedUsrClass}   get from dictionary   ${uaaLst[${index}]}      usrClass
    ${inputUsrClass}       get from input      ${reqDataOfUserProfileCreate}          usrClass
    should be equal             ${retrivedUsrClass}            ${inputUsrClass}
    ${retrivedLogoffStatus}   get from dictionary   ${uaaLst[${index}]}      logoffStatus
    should be equal             ${retrivedLogoffStatus}            ${inputLogoffStatus}

UAA Retrieve response Validations
   [Arguments]    ${requestData}        ${uaaLst}       ${index}     ${respDataExpectedParametersList}      ${inputLogoffStatus}        ${inputInactiveInd}
    ${numOfParametersInList}   get length      ${respDataExpectedParametersList}
    log     ${numOfParametersInList}
    :FOR   ${i}   IN RANGE   0   ${numOfParametersInList}
    \   ${parameter}     get from list       ${respDataExpectedParametersList}      ${i}
    \   ${response}      get from dictionary        ${uaaLst[${index}]}     ${parameter}
    \   ${Status}     run keyword and return status     should contain      ${requestData}      ${parameter}
    \   ${request}    run keyword if      ${Status}==True     get from input       ${requestData}         ${parameter}
    \   ...     ELSE        log     requestData doesn't contain ${parameter}
    \   run keyword if      ${Status}==True         should be equal     ${request}            ${response}
    ${retrivedLogoffStatus}   get from dictionary   ${uaaLst[${index}]}      logoffStatus
    should be equal             ${retrivedLogoffStatus}            ${inputLogoffStatus}
    ${retrivedInactiveInd}   get from dictionary   ${uaaLst[${index}]}      inactiveInd
    should be equal             ${retrivedInactiveInd}            ${inputInactiveInd}
    ${retrivedEntity}   get from dictionary   ${uaaLst[${index}]}      entity
    ${respOrgId}       get from input      ${requestData}          respOrgId
    ${inputEntity}       get substring           ${respOrgId}       0       2
    should be equal             ${retrivedEntity}           ${inputEntity}

Get Role Name from Existing Roles
    [Arguments]     ${oauthToken}
    ${responseData}     GET METHOD      ${oauthToken}       ${GET_LUR_ACTION}      ${SuccessResponse}
    ${Users_List}   get from dictionary   ${responseData}   roleLst
    ${User_RoleName}    get from list  ${Users_List}            3
    [Return]    ${User_RoleName}

Create ORC
    [Arguments]         ${respOrg}      ${oauthToken}       ${ORC_ReqBody}      ${successResponse}
    log     ${respOrg}
    ${ORC_ReqBody}     evaluate    json.loads('''${ORC_ReqBody}''')    json
    set to dictionary       ${ORC_ReqBody}     respOrgId=${respOrg}
    ${ORC_ReqBody}=    evaluate    json.dumps(${ORC_ReqBody})    json
    log     ${ORC_ReqBody}
    ${Response}     POST Method     ${oauthToken}    ${POST_ORC_Create}      ${ORC_ReqBody}     ${successResponse}
    [Return]    ${Response}

Basic Validation of ORC
    [Arguments]         ${respOrg}      ${oauthToken}
    ${Response}     GET Method With NUM      ${oauthToken}     ${GET_ORC_View}   ${respOrg}   ${successResponse}
    log     ${Response}
    ${respOrgId}      get from dictionary     ${Response}      respOrgId
    ${mgiOnlnNtf}       get from dictionary     ${Response}         mgiOnlnNtf
    should be equal     ${respOrgId}      ${respOrg}
    should be equal     ${mgiOnlnNtf}       Y
    [Return]        ${Response}

ORC GenEmail Validation
    [Arguments]       ${Create_ORC_ReqBody}       ${Retrive_ResponseBody}
    ${Create_ORC_ReqBody}=    evaluate    json.loads('''${Create_ORC_ReqBody}''')    json
    ${email}     get from dictionary         ${Create_ORC_ReqBody}     genEmail
    ${Req_genEmail}     get from dictionary         ${email}        email
    ${email}     get from dictionary         ${Retrive_ResponseBody}     genEmail
    ${Resp_genEmail}     get from dictionary         ${email}        email
    should be equal     ${Req_genEmail}      ${Resp_genEmail}

ORC RespNtfRpt Validation
    [Arguments]         ${Create_ORC_ReqBody}       ${Retrive_ResponseBody}
    ${Create_ORC_ReqBody}=    evaluate    json.loads('''${Create_ORC_ReqBody}''')    json
    ${respNtfRpt}     get from dictionary         ${Retrive_ResponseBody}     respNtfRpt
    ${reqNtfRpt}       get from dictionary         ${Create_ORC_ReqBody}     respNtfRpt
    ${Req_respNtfRpt}     get from dictionary         ${reqNtfRpt}        emails
    ${Resp_respNtfRpt}     get from dictionary         ${respNtfRpt}        emails
    ${length}       get length      ${Req_respNtfRpt}
    :FOR   ${i}   IN RANGE   0      ${length}
    \   ${Status}     run keyword and return status  list should contain value       ${Resp_respNtfRpt}       ${Req_respNtfRpt[${i}]}
    \   should be true      ${Status}

ORC CusFailRpt Validation
    [Arguments]         ${Create_ORC_ReqBody}       ${Retrive_ResponseBody}
    ${Create_ORC_ReqBody}=    evaluate    json.loads('''${Create_ORC_ReqBody}''')    json
    ${Req_cusFailRpt}     get from dictionary         ${Retrive_ResponseBody}     cusFailRpt
    ${Resp_cusFailRpt}       get from dictionary         ${Create_ORC_ReqBody}     cusFailRpt
    ${length}       get length      ${Req_cusFailRpt}
    :FOR   ${i}   IN RANGE   0      ${length}
    \   ${Status}     run keyword and return status  list should contain value       ${Resp_cusFailRpt}       ${Req_cusFailRpt[${i}]}
    \   should be true      ${Status}

ORC CnaRpt Validation
    [Arguments]         ${Create_ORC_ReqBody}       ${Retrive_ResponseBody}
    ${Create_ORC_ReqBody}=    evaluate    json.loads('''${Create_ORC_ReqBody}''')    json
    ${Req_cnaRpt}     get from dictionary         ${Retrive_ResponseBody}     cnaRpt
    ${Resp_cnaRpt}       get from dictionary         ${Create_ORC_ReqBody}     cnaRpt
    ${length}       get length      ${Req_cnaRpt}
    :FOR   ${i}   IN RANGE   0      ${length}
    \   ${Status}     run keyword and return status  list should contain value       ${Resp_cnaRpt}       ${Req_cnaRpt[${i}]}
    \   should be true      ${Status}

Get Orc Resp Org Id
    [Arguments]       ${oauthToken}
    ${respOrgList}     GET METHOD      ${oauthToken}     ${GET_ORC_List}   ${successResponse}
    log  ${respOrgList}
    ${RespOrgIds}        get from dictionary     ${respOrgList}     respOrgList
    ${RespOrgId}        get from list     ${RespOrgIds}       0
    [Return]        ${RespOrgId}

DeleteORC NegativeTest
    [Arguments]         ${respOrg}      ${token}        ${recVersionId}
    ${requestData}=    evaluate    json.loads('''${Delete_ORC_Reqbody}''')    json
    set to dictionary     ${requestData}     respOrgId=${respOrg}
    set to dictionary     ${requestData}     recVersionId=${recVersionID}
    ${requestData}=    evaluate    json.dumps(${requestData})    json
    ${Response}      PUT Method      ${token}      ${PUT_Delete_ORC}     ${requestData}     ${SuccessResponse}
    [Return]        ${Response}


Delete ORC
    [Arguments]         ${respOrg}      ${token}        ${Response}
    ${recVersionId}      get from dictionary          ${Response}            recVersionId
    log     ${recVersionId}
    ${requestData}=    evaluate    json.loads('''${Delete_ORC_Reqbody}''')    json
    set to dictionary     ${requestData}     respOrgId=${respOrg}
    set to dictionary     ${requestData}     recVersionId=${recVersionID}
    ${requestData}=    evaluate    json.dumps(${requestData})    json
    ${Response}      PUT Method      ${token}      ${PUT_Delete_ORC}     ${requestData}     ${SuccessResponse}
    [Return]        ${Response}

Specific User SessionOpen
    [Arguments]         ${oauthToken}      ${Req_Body}      ${LengthOfLoginID}
    ${loginID}      Generate User Profile       ${oauthToken}      ${Req_Body}      ${LengthOfLoginID}
    ${password}     get from input      ${Req_Body}     password
    ${ChangePswd_UserCredentials_Track2}      Get Updated UserCredentials ReqBody     ${User_Credentials_Track2}      ${loginID}      ${password}
    ${reqBody}    Get ChangePassword with NewPassword        ${ChangePswd_ReqBody}     ${loginID}       ${password}
    ${successResponseBody}     PUT Method      ${ChangePswd_UserCredentials_Track2}      ${PASSWD_UPDATE}        ${reqBody}       ${SuccessResponse}
    log     ${successResponseBody}
    should be empty         ${successResponseBody}
    ${newPasswordUserCredentials}       Get Updated New UserCredentials        ${reqBody}      ${ChangePswd_UserCredentials_Track2}
    log     ${newPasswordUserCredentials}
    #UserProfile Login       ${newPasswordUserCredentials}
    [Return]        ${newPasswordUserCredentials}

Generate User Profile
    [Arguments]          ${oauthToken}      ${Req_Body}     ${LengthOfLoginID}
    ${loginId}      Generate LoginID        ${oauthToken}       ${LengthOfLoginID}       [UPPER]       USQW    ${EMPTY}
    ${requestData}=    evaluate    json.loads('''${Req_Body}''')    json
    set to dictionary     ${requestData}     loginId=${loginId}
    ${requestData}=    evaluate    json.dumps(${requestData})    json
    log         ${requestData}
    ${updatedRequestData}=    UserLst Updated RequestData       ${requestData}
    ${responseData}     POST Method     ${oauthToken}   ${UP_ACTION}      ${updatedRequestData}        ${SuccessResponse}
    should be empty         ${responseData}
    [Return]        ${loginId}

Get User Credentials Request Body
    [Arguments]          ${oauthToken}       ${Req_Body}        ${loginID}
    ${Req_Body}=    evaluate    json.loads('''${Req_Body}''')    json
	${Passwd}   get from dictionary      ${Req_Body}       password
	# Create request body to open  session with new userId
	${UserCredentials_RequestBody}      Get Updated UserCredentials ReqBody     ${User_Credentials_Track2}      ${loginID}      ${Passwd}
	[Return]    ${UserCredentials_RequestBody}

Close Session and Delete User Profile
    [Arguments]     ${oauthToken}       ${Credentials_ReqBody}
    #close session
    ${Credentials}=    evaluate    json.loads('''${Credentials_ReqBody}''')    json
    ${loginId}      get from dictionary     ${Credentials}      usrName
    ${responseData}     Delete User Profile     ${oauthToken}       ${ReqData_UserProfileDelete}      ${loginId}
    should be empty          ${responseData}

Validate Mandataory Parameters Of UAA Retrieve
    [Arguments]     ${reqDataOfUserProfileCreate}       ${uaaLst}       ${index}           ${inputLogoffStatus}
    ${retrivedEntity}   get from dictionary   ${uaaLst[${index}]}      entity
    ${respOrgId}       get from input      ${reqDataOfUserProfileCreate}          respOrgId
    ${inputEntity}       get substring           ${respOrgId}       0       2
    should be equal             ${retrivedEntity}           ${inputEntity}
    ${retrivedUsrClass}   get from dictionary   ${uaaLst[${index}]}      usrClass
    ${inputUsrClass}       get from input      ${reqDataOfUserProfileCreate}          usrClass
    should be equal             ${retrivedUsrClass}            ${inputUsrClass}
    ${retrivedLogoffStatus}   get from dictionary   ${uaaLst[${index}]}      logoffStatus
    should be equal             ${retrivedLogoffStatus}            ${inputLogoffStatus}

Create User Profile and Modify Permissions
    [Arguments]          ${user_credentials_track2}          ${ReqData_UserProfileCreate}        ${ReqData_ModifyRole}       ${functionName}
    ${UserProfileDetails}     userprofile login     ${user_credentials_track2}
    ${oauthToken}                 get from dictionary     ${UserProfileDetails}               OauthToken
    ${loginId}      Generate LoginID        ${oauthToken}       4       [UPPER]       USQW     ${EMPTY}
    ${requestData}=    evaluate    json.loads('''${ReqData_UserProfileCreate}''')    json
    set to dictionary     ${requestData}     loginId=${loginId}
    ${roleName}     get from dictionary     ${requestData}      role
    ${requestData}=    evaluate    json.dumps(${requestData})    json
    log         ${requestData}
    ${updatedRequestData}=    UserLst Updated RequestData       ${requestData}
    set global variable     ${updatedRequestData}
    log  ${updatedRequestData}
    ${responseData}     Create User Profile     ${oauthToken}           ${updatedRequestData}       ${SuccessResponse}
    should be empty         ${responseData}
    ${requestDataRole}=    evaluate    json.loads('''${ReqData_ModifyRole}''')    json
    set to dictionary     ${requestDataRole["fnPermissions"][0]}        fnName=${functionName}
    set to dictionary       ${requestDataRole}      roleName=${roleName}
    ${requestDataRole}=    evaluate    json.dumps(${requestDataRole})    json
    ${reqBody}     replace string      ${requestDataRole}      "[      ["
    ${reqBody}     replace string      ${reqBody}      ]"      "]
    Modify User Role        ${oauthToken}      ${PUT_Modify_Role}     ${reqBody}     ${successresponse}

Modify User Role
    [Arguments]     ${token}      ${PUT_ACTION_URI}     ${req_data}     ${status_code}
    ${Response}         PUT Method      ${token}      ${PUT_ACTION_URI}     ${req_data}     ${status_code}
    should be empty     ${Response}

Get UserName
    log  ${updatedRequestData}
    ${requestData}    evaluate    json.loads('''${updatedRequestData}''')    json
    ${userList}   get from dictionary  ${requestData}     userLst
    log  ${userList}
    ${Username}   get from dictionary  ${userList[0]}     loginId
    [Return]        ${Username}

Get Password
    ${requestData}    evaluate    json.loads('''${updatedRequestData}''')    json
    ${userList}   get from dictionary  ${requestData}     userLst
    log  ${userList}
    ${Password}     get from dictionary         ${userList[0]}       password
    [Return]        ${Password}

Get RoleName
    ${requestData}    evaluate    json.loads('''${updatedRequestData}''')    json
    ${userList}   get from dictionary  ${requestData}     userLst
    log  ${userList}
    ${roleName}     get from dictionary         ${userList[0]}       role
    [Return]        ${roleName}

Get Non-Existing Entity
    [Arguments]     ${token}
    ${respOrgEntityList}    get method      ${token}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}   ${successResponse}
    log  ${respOrgEntityList}
    should not be empty     ${respOrgEntityList}
    ${respOrgLst}     get from dictionary     ${respOrgEntityList}     respOrgList
    ${length}     get length    ${respOrgLst}
    ${entity_list}   create list
    :FOR   ${i}      IN RANGE    0  ${length}
    \     ${entity}      get from dictionary     ${respOrgEntityList['respOrgList'][${i}]}     respOrgEntity
    \     append to list     ${entity_list}    ${entity}
    log     ${entity_list}
    ${entity}   Check For Duplicate String      ${entity_list}   2       [UPPER][NUMBERS]     ${EMPTY}     ${EMPTY}
    [Return]    ${entity}

Get Non-Existing CIC
    [Arguments]     ${token}
    ${CIC_List}      GET METHOD    ${token}     ${GET_CIS_CIC_LIST}   ${SuccessResponse}
    log     ${CIC_List}
    should not be empty     ${CIC_List}
    ${carrierLst}      get from dictionary     ${CIC_List}     carrierLst
#    ${listLength}      get length  ${carrierLst}
#    #Get the list of Existing CIC Codes and create new CIC
#    ${cicCode_list}   create list
#    ${i}    set variable    0
#    :FOR   ${i}      IN RANGE    0  ${listLength}
#    \   ${cicCode}      get from dictionary     ${CIC_List['carrierLst'][${i}]}     cicCode
#    \   append to list     ${cicCode_list}    ${cicCode}
#    log     ${cicCode_list}
    ${cicCode}     Check For Duplicate String  ${carrierLst}        4       [NUMBERS]     ${EMPTY}     ${EMPTY}
    [Return]        ${cicCode}

Get Non-Existing ACNA
    [Arguments]     ${token}
    ${ACNA_List}      GET METHOD    ${token}     ${GET_CIS_ACNA_LIST}   ${SuccessResponse}
    log     ${ACNA_List}
    ${acnaLst}      get from dictionary         ${ACNA_List}            acnaLst
    should not be empty     ${ACNA_List}
    ${ACNA}     Check For Duplicate String       ${acnaLst}        3       [UPPER]     ${EMPTY}     ${EMPTY}
    [Return]        ${ACNA}

Create CIS
    #(API Hits-3)
    #Only Admin user can create CIS
    [Arguments]     ${token}    ${ReqDataForCISCreate}       ${translation_State}        ${status}
    ${cicCode}          Get Non-Existing CIC        ${token}
    ${acna}         Get Non-Existing ACNA        ${token}
#    ${resp}     PUT Method         ${token}        ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_UNIT}      ${reqdataForCISResporgACTIVE}      ${SuccessResponse}
#    log     ${resp}
    ${resporgId}            get from input          ${reqdataForCISResporgACTIVE}           respOrgId
    ${requestData}    evaluate    json.loads('''${ReqDataForCISCreate}''')    json
    set to dictionary   ${requestData}      acna=${acna}
    set to dictionary       ${requestData['prmryCICRec']}      cicCode=${cicCode}
    set to dictionary   ${requestData['prmryCICRec']}      translation=${translation_State}
    set to dictionary   ${requestData['prmryCICRec']}      status=${status}
    set to dictionary   ${requestData['prmryCICRec']}      respOrg=${resporgId}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method         ${token}        ${POST_CIS_CIC_CREATE}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    should not be empty     ${resp}
    ${create_recVersionId}     get from dictionary         ${resp}         recVersionId
    should not be empty             ${create_recVersionId}
    #validate the creation
    ${resp}      GET METHOD    ${token}     ${GET_CIS_CIC_RETRIEVE}${cicCode}       ${SuccessResponse}
    log     ${resp}
    #Validate CIS retrieve response
    ${CIS_retrieve_recVersionId}     get from dictionary         ${resp}         recVersionId
    should be equal           ${CIS_retrieve_recVersionId}        ${create_recVersionId}
    ${resp_acna}     get from dictionary         ${resp}     acna
    should be equal         ${resp_acna}         ${acna}
    ${prmryCICRec}           get from dictionary         ${resp}         prmryCICRec
    log     ${prmryCICRec}
    ${resp_cic}     get from dictionary         ${prmryCICRec}     cicCode
    should be equal         ${resp_cic}         ${cicCode}
    ${resp_status}     get from dictionary         ${prmryCICRec}     status
    should be equal         ${resp_status}        ${status}
    ${resp_translation}     get from dictionary         ${prmryCICRec}     translation
    should be equal         ${resp_translation}         ${translation_State}
    ${resp_respOrg}     get from dictionary         ${prmryCICRec}     respOrg
    should be equal         ${resp_respOrg}         ${resporgId}
    [Return]        ${cicCode}      ${acna}         ${resporgId}            ${CIS_retrieve_recVersionId}

Create CAG
    #(API Hits-4)
    # Create CAG for CIC with one entity, other than 0110 CIC
    [Arguments]     ${token}        ${cicCode}      ${ResponseCode}
    #{ "cicCode": "", "cagEnttyLst": ["BR","CD","EL","PG","SS"]}
    #generate random string of 2 letters for passing respOrgEntity value
#    ${respdata}     get open session response           ${CIS_Credentials}
#    ${adminUserOauthToken} =  Get From Dictionary     ${respdata}     oauthToken
    ${respOrgEntityList}  GET METHOD      ${token}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}   ${successResponse}
    ${respOrgEntityLst}    get from dictionary  ${respOrgEntityList}   respOrgList
    ${respOrgEntity}        get from list       ${respOrgEntityLst}         0
    ${respOrgEntity}    get from dictionary  ${respOrgEntity}   respOrgEntity
#    ${respOrgEntityString}  Check For Duplicate String  ${respOrgEntity}     2  [LETTERS]     ${EMPTY}     ${EMPTY}
#    Create RespOrg Entity     ${adminUserOauthToken}   ${respOrgEntityCreate_request_body}   ${successResponse}    ${respOrgEntityString}
#    ${responseData}     Retrieve RespOrgEntity   ${adminUserOauthToken}   ${respOrgEntityString}  ${successResponse}
#    ${respOrgEntity}=   get from dictionary     ${responseData}     respOrgEntity
#    should be equal  ${respOrgEntityString}     ${respOrgEntity}
    ${respOrgEntity_List}        create list     ${respOrgEntity}
    ${requestData}    evaluate    json.loads('''${ReqDataForCAGCreate}''')    json
    set to dictionary   ${requestData}      cicCode=${cicCode}
    ${Status}       run keyword and return status       should be equal         ${cicCode}          ${cicCode_0110}
    run keyword if      ${Status}==True            set to dictionary   ${requestData}      netWrkId=${netWrkIdForCIC_0110}
    set to dictionary       ${requestData}       cagEntityList=${respOrgEntity_List}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method         ${token}        ${POST_CAG_CREATE}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    dictionary should not contain key     ${resp}    errList
    [Return]        ${resp}       ${respOrgEntity}

Create GNA
    [Arguments]     ${token}        ${cicCode}      ${reqbodyForGNACreate}
    ${requestData}    evaluate    json.loads('''${reqbodyForGNACreate}''')    json
    set to dictionary   ${requestData}      cicCode=${cicCode}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method     ${token}    ${GNA_CREATE_URI}           ${reqBody}         ${SuccessResponse}
    log     ${resp}
    should not be empty             ${resp}
    ${recVersionIdGNA}     get from dictionary         ${resp}         recVersionId
    [Return]        ${cicCode}       ${recVersionIdGNA}

Delete CIS
    [Arguments]      ${token}       ${acna}             ${recVersionId}         ${status_code}
    sleep       ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
#    ${second}     fetch from right   ${POST_CIS_CIC_CREATE}     /v2/ip/
#    ${POST_CIS_CIC_CREATE}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${POST_CIS_CIC_CREATE}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}       delete method       ${token}        ${POST_CIS_CIC_CREATE}      /acna/${acna}     ${recVersionId}        ${status_code}
    log     ${resp}
    [Return]    ${resp}

Get CIS Retrieve RecVersionId
    [Arguments]      ${token}       ${cicCode}      ${Update_recVersionId}      ${acna}         ${status}           ${translation_State}        ${resporgId}
     ${resp}      GET METHOD    ${token}     ${GET_CIS_CIC_RETRIEVE}${cicCode}       ${SuccessResponse}
    log     ${resp}
    #Validate CIS retrieve response
    ${CIS_retrieve_recVersionId}     get from dictionary         ${resp}         recVersionId
    should be equal           ${CIS_retrieve_recVersionId}        ${Update_recVersionId}
    ${resp_acna}     get from dictionary         ${resp}     acna
    should be equal         ${resp_acna}         ${acna}
    ${prmryCICRec}           get from dictionary         ${resp}         prmryCICRec
    log     ${prmryCICRec}
    ${resp_cic}     get from dictionary         ${prmryCICRec}     cicCode
    should be equal         ${resp_cic}         ${cicCode}
    ${resp_status}     get from dictionary         ${prmryCICRec}     status
    should be equal         ${resp_status}        ${status}
    ${resp_translation}     get from dictionary         ${prmryCICRec}     translation
    should be equal         ${resp_translation}         ${translation_State}
    ${resp_respOrg}     get from dictionary         ${prmryCICRec}     respOrg
    should be equal         ${resp_respOrg}         ${resporgId}
    [Return]        ${CIS_retrieve_recVersionId}

Get Non-Existing RespOrgID
    [Arguments]     ${oauthToken}
    ${respOrgEntityList}     GET METHOD      ${oauthToken}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}   ${successResponse}
    ${respOrgList}     get from dictionary     ${respOrgEntityList}     respOrgList
    ${respOrgEntity}  set variable  ${respOrgList[0]["respOrgEntity"]}

    ${respOrgUnitList}     GET METHOD      ${oauthToken}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_UNIT}   ${successResponse}
    ${respOrgUnitListResponse}    Parse Request Body   ${respOrgEntityList}     respOrgList
    ${respOrgID}     Check For Duplicate String      ${respOrgUnitListResponse}      3      [LETTERS][NUMBERS]      ${respOrgEntity}     ${EMPTY}
    [Return]  ${respOrgID}

Get Inactive RespOrg ID
    [Arguments]     ${oauthToken}
    ${respOrgUnitList}     GET METHOD      ${oauthToken}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_UNIT}   ${successResponse}
    ${respOrgUnitListResponse}    get from dictionary  ${respOrgUnitList}     respOrgList
    ${listLength}       get length      ${respOrgUnitListResponse}
    ${Inactive_respOrgId}    set variable    0
    :FOR   ${i}      IN RANGE    0  ${listLength}
    \   ${status}      get from dictionary     ${respOrgUnitList['respOrgList'][${i}]}     status
    \   ${Inactive_respOrgId}        get from dictionary     ${respOrgUnitList['respOrgList'][${i}]}     respOrgId
    \   ${status}       run keyword and return status       should be equal         ${status}       DISCONNECT
    \   run keyword if      ${status}==True           run keywords      log         ${Inactive_respOrgId}      AND       exit for loop
    \   ...     ELSE    continue for loop
    [Return]            ${Inactive_respOrgId}

Create RespOrgId
    [Arguments]         ${oauthToken}
    ${respOrgEntityList}     GET METHOD      ${oauthToken}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}   ${successResponse}
    ${respOrgList}     get from dictionary     ${respOrgEntityList}     respOrgList
    ${respOrgEntity}  set variable  ${respOrgList[0]["respOrgEntity"]}

    ${respOrgUnitList}     GET METHOD      ${oauthToken}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_UNIT}   ${successResponse}
    ${respOrgUnitListResponse}    Parse Request Body   ${respOrgEntityList}     respOrgList
    ${respOrgUnitString}     Check For Duplicate String      ${respOrgUnitListResponse}      3      [LETTERS][NUMBERS]      ${respOrgEntity}     ${EMPTY}
    ${createRespOrgUnitResponse}    Create RespOrg Unit     ${oauthToken}  ${createRespOrgUnitRequestBody}    ${successResponse}    ${respOrgEntity}  ${respOrgUnitString}
    should not be empty     ${createRespOrgUnitResponse}
    [Return]        ${respOrgUnitString}

Do Number Query
    [Arguments]    ${token}     ${number}   ${status_code}
    ${numList}      create list         ${number}
    ${reqbody}=  Create Dictionary      numList=${numList}
    ${reqBody}    evaluate    json.dumps(${reqbody})    json
    ${resp}=    PUT Method   ${token}   /v2/ip/num/tfn/query    ${reqBody}       ${SuccessResponse}
    log     ${resp}
    [Return]    ${resp}

Do Number Update
    [Arguments]    ${token}     ${req_data}     ${status_code}
    Log     ${req_data}
    Create Session  endpoint   ${HOST}
    ${second}     fetch from right   ${PUT_NU_ACTION}   /v2/ip/
    ${PUT_NU_ACTION}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${PUT_NU_ACTION}
    ${headers}=  Create Dictionary  Content-Type=application/json   Authorization=Bearer ${token}
    ${resp}=  Put Request  endpoint  ${PUT_NU_ACTION}  data=${req_data}  headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}     ${status_code}
    ${responsejsondata}=  To Json  ${resp.content}
    Log  ${responsejsondata}
    [Return]    ${responsejsondata}

Modify Specific Role
    [Arguments]     ${token}     ${reqData}     ${functionName}      ${statusCode}
    ${requestDataRole}=    evaluate    json.loads('''${reqData}''')    json
    set to dictionary     ${requestDataRole["fnPermissions"][0]}        fnName=${functionName}
    ${requestDataRole}=    evaluate    json.dumps(${requestDataRole})    json
    ${reqBody}     replace string      ${requestDataRole}      "[      ["
    ${reqBody}     replace string      ${reqBody}      ]"      "]
    log  ${reqBody}
    ${Response}         PUT Method      ${token}      ${PUT_Modify_Role}     ${reqBody}     ${status_code}
    should be empty     ${Response}

Get one LogonID from the List Of LogonIDs
    [Arguments]     ${oauthToken}
    ${responseData}     GET METHOD      ${oauthToken}       ${Get_UserProfile_List}     ${SuccessResponse}
    ${UserName}      get from dictionary     ${responseData}     usrLst
    ${Login_ID}         get from list       ${UserName}             0
    [Return]    ${Login_ID}

Delete ACNA
    [Arguments]          ${token}         ${cicCode}          ${acna}       ${resporgId}        ${CIS_retrieve_recVersionId}
    ${requestData}    evaluate    json.loads('''${ReqDataForCISUpdate}''')    json
    set to dictionary   ${requestData}      acna=${acna}
    set to dictionary       ${requestData['prmryCICRec']}      cicCode=${cicCode}
    set to dictionary   ${requestData['prmryCICRec']}      translation=Y
    set to dictionary   ${requestData['prmryCICRec']}      status=DISCONNECT
    set to dictionary   ${requestData['prmryCICRec']}      respOrg=${resporgId}
    set to dictionary  ${requestData}        recVersionId=${CIS_retrieve_recVersionId}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method         ${token}        ${PUT_CIS_CIC_UPDATE}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    should not be empty         ${resp}
    ${Update_recVersionId}      get from dictionary          ${resp}            recVersionId
    #${recVersionIdAfterUpdate}      Get CIS Retrieve RecVersionId      ${token}       ${cicCode}      ${Update_recVersionId}      ${acna}         DISCONNECT           ${translation_State_Y}          ${resporgId}
    ${deleteResp}       delete method       ${token}        ${POST_CIS_CIC_CREATE}      /acna/${acna}     ${Update_recVersionId}        ${SuccessResponse}
#    ${deleteResp}  Delete CIS     ${token}      ${acna}         ${recVersionIdAfterUpdate}        ${SuccessResponse}
    log     ${deleteResp}
    dictionary should not contain key    ${deleteResp}     errList
    should be empty     ${deleteResp}
    #Retrieve CIS after delete
    ${resp}      GET METHOD    ${token}     ${GET_CIS_CIC_RETRIEVE}${cicCode}       ${SuccessResponse}
    log     ${resp}
    dictionary should not contain key    ${resp}     recVersionId
    should not be empty     ${resp}
    validation for error message        ${resp}        ${UnknownCICErrorMsg}${cicCode}${NotKnownToTFNRegisteryErrMsg}        ${ERROR}       ${UnknownCICErrorCode}

Create CIC 0110
    #(API Hits-3)
    #Only Admin user can create CIS
    [Arguments]     ${token}    ${translation_State}        ${status}       ${netWrkIdForCIC_0110}
#    ${resporgId}            get from input          ${reqdataForCISResporgACTIVE}           respOrgId
#    ${requestData}    evaluate    json.loads('''${ReqBodyForCICCreateAllParams}''')    json
#    set to dictionary   ${requestData}      acna=OTC
#    set to dictionary       ${requestData['otcPrmryCICRec']}      cicCode=${cicCode_0110}
#    set to dictionary   ${requestData['otcPrmryCICRec']}      translation=${translation_State}
#    set to dictionary   ${requestData['otcNtwrkIds'][0]}      respOrg=${resporgId}
#    set to dictionary   ${requestData['otcPrmryCICRec']}      status=DISCONNECT
#    ${reqBody}    evaluate    json.dumps(${requestData})    json
#    ${updateResp}     PUT Method         ${token}        ${PUT_CIS_CIC_UPDATE}      ${reqBody}      ${SuccessResponse}
#    log     ${updateResp}
#    ${result}   run keyword and return status       should be empty         ${updateResp}
#    run keyword if      ${result}==True     Log     Continue
#    ...     ELSE        validation for error message        ${updateResp}        ${NonExistingACNAErrorMsg}OTC${DoesNtExist}        ${ERROR}        ${NonExistingACNAErrorCode}
#    ${deleteResp}  Delete CIS     ${token}      OTC         ${SuccessResponse}
#    ${result}   run keyword and return status       should be empty         ${deleteResp}
#    run keyword if      ${result}==True     Log     Continue
#    ...     ELSE        validation for error message        ${deleteResp}        ${NonExistingACNAErrorMsg}OTC${DoesNtExist}        ${ERROR}        ${NonExistingACNAErrorCode}
    ${requestData}    evaluate    json.loads('''${ReqBodyForCICCreateAllParams}''')    json
    set to dictionary   ${requestData}      acna=OTC
    set to dictionary   ${requestData['otcPrmryCICRec']}      translation=${translation_State}
    set to dictionary   ${requestData['otcPrmryCICRec']}      status=${status}
    set to dictionary   ${requestData['otcNtwrkIds'][0]}      respOrg=${resporgId}
    set to dictionary   ${requestData['otcNtwrkIds'][0]}      netWrkId=${netWrkIdForCIC_0110}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method         ${token}        ${POST_CIS_CIC_CREATE}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    [Return]        ${resp}     ${netWrkIdForCIC_0110}      ${resporgId}

Delete ACNA-0110
    [Arguments]          ${token}       ${translation_State}        ${resporgId}        ${CISrecVersionId}
    ${requestData}    evaluate    json.loads('''${ReqBodyForCICCreateAllParams}''')    json
    set to dictionary   ${requestData}      acna=OTC
    set to dictionary       ${requestData['otcPrmryCICRec']}      cicCode=${cicCode_0110}
    set to dictionary   ${requestData['otcPrmryCICRec']}      translation=${translation_State}
    set to dictionary   ${requestData['otcNtwrkIds'][0]}      respOrg=${resporgId}
    set to dictionary   ${requestData['otcPrmryCICRec']}      status=DISCONNECT
    set to dictionary  ${requestData}        recVersionId=${CISrecVersionId}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method         ${token}        ${PUT_CIS_CIC_UPDATE}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
     should not be empty     ${resp}
    ${recVersionId}          get from dictionary         ${resp}         recVersionId
    ${deleteResp}  Delete CIS     ${token}      OTC         ${recVersionId}       ${SuccessResponse}
    log     ${deleteResp}
    should be empty     ${deleteResp}
    #Retrieve CIS after delete
    ${resp}      GET METHOD    ${token}     ${GET_CIS_ACNA_RETRIEVE}OTC        ${SuccessResponse}
    log     ${resp}
    should not be empty     ${resp}
    validation for error message        ${resp}        ${NonExistingACNAErrorMsg}OTC${DoesNtExistReadytoCreate}        ${ERROR}            ${NonExistingACNAErrCode}

Validate CIC-0110 Retrieve Response
    [Arguments]     ${resp}     ${expectedStatus}       ${expectedTranslationState}         ${expectedNetWrkId}         ${expectedResporgId}        ${create_recVersionId}    ${CIS_retrieve_recVersionId}
    get from dictionary         ${resp}         recVersionId
    should be equal           ${CIS_retrieve_recVersionId}        ${create_recVersionId}
    ${resp_acna}     get from dictionary         ${resp}     acna
    should be equal         ${resp_acna}         ${ACNA_For_CIC_0110}
    ${otcPrmryCICRec}           get from dictionary         ${resp}         otcPrmryCICRec
    log     ${otcPrmryCICRec}
    ${resp_cic}     get from dictionary         ${otcPrmryCICRec}     cicCode
    should be equal         ${resp_cic}         ${cicCode_0110}
    ${resp_status}     get from dictionary         ${otcPrmryCICRec}     status
    should be equal         ${resp_status}         ${expectedStatus}
    ${resp_translation}     get from dictionary         ${otcPrmryCICRec}     translation
    should be equal         ${resp_translation}         ${expectedTranslationState}
    ${otcNtwrkIds}           get from dictionary         ${resp}         otcNtwrkIds
    log     ${otcNtwrkIds}
    ${resp_cic}     get from dictionary         ${otcNtwrkIds[0]}     cicCode
    should be equal         ${resp_cic}         ${cicCode_0110}
    ${resp_netWrkId}     get from dictionary         ${otcNtwrkIds[0]}     netWrkId
    should be equal         ${resp_netWrkId}         ${expectedNetWrkId}
    ${resp_respOrg}     get from dictionary         ${otcNtwrkIds[0]}     respOrg
    should be equal         ${resp_respOrg}         ${expectedResporgId}

Validate ENA Retrieve Response
    [Arguments]     ${oauthToken}          ${requestData}        ${retrieveENAResp}         ${create_recVersionIdENA}
    ${retrieve_recVersionIdENA}     get from dictionary         ${retrieveENAResp}         recVersionId
    ${respList}             get from dictionary         ${retrieveENAResp}          enaLst
    ${retrieve_recVersionIdENALst}     get from dictionary         ${respList[0]}         recVersionId
    should be equal         ${retrieve_recVersionIdENALst}          ${create_recVersionIdENA}
    ${respEntity}            get from dictionary        ${respList[0]}       entity
    ${respCarrierActions}       get from dictionary          ${respList[0]}           carrierActions
    ${requestCarrierActions}  get json value    ${requestData}    /carrierActions
    ${carrierActionsExpectedParametersList}       create list         addRtng     pssblRtng       delRtngWork     delRtngDscnt        respChng
    ${numOfParametersInList}        get length          ${carrierActionsExpectedParametersList}
    log     ${numOfParametersInList}
       ${i}   IN RANGE   0   ${numOfParametersInList}
    \   ${parameter}     get from list       ${carrierActionsExpectedParametersList}      ${i}
    \   ${resp}      get from dictionary             ${respCarrierActions}        ${parameter}
    \   ${req}  get from input         ${requestCarrierActions}           ${parameter}
    \   should be equal         ${resp}              ${req}
    [Return]        ${retrieve_recVersionIdENA}             ${retrieve_recVersionIdENALst}

CA Setup
    [Arguments]    ${User_Credentials}     ${Admin_Credentials}
    ${oauthToken}    Get Oauthentication Token    ${User_Credentials}
    set global variable     ${oauthToken}
    ${clientKey}        Get ClientKey
    set global variable     ${clientKey}
    ${clientSecret}     Get clientSecret
    set global variable     ${clientSecret}
    #Create Admin User
    ${respdata}     get open session response           ${Admin_Credentials}
    ${adminUserOauthToken} =  Get From Dictionary     ${respdata}     oauthToken
    set global variable     ${adminUserOauthToken}
    ${adminUserClientKey} =  Get From Dictionary     ${respdata}     clientKey
    set global variable     ${adminUserClientKey}
    ${adminUserclientSecret} =  Get From Dictionary     ${respdata}     clientSecret
    set global variable     ${adminUserclientSecret}
    ${PermRecord}=   Get From Dictionary     ${respdata}     permRecord
    ${adminUserUsrClass}=   Get From Dictionary     ${PermRecord}     usrClass
    should be equal         ${adminUserUsrClass}            ADMINISTRATOR

CA Cleanup
    session close       ${adminUserOauthToken}          ${adminUserClientKey}       ${adminUserclientSecret}
    session close       ${oauthToken}          ${clientKey}       ${clientSecret}

Get RespOrgID from List
    [Arguments]     ${Token}
    ${respOrgUnit}      Get Active RespOrg ID       ${Token}
    RepOrgID Should Not Have ORC        ${Token}        ${respOrgUnit}
    [Return]        ${respOrgUnit}

RepOrgID Should Not Have ORC
    [Arguments]     ${Token}        ${respOrgUnit}
    ${Response}     GET Method With NUM      ${Token}     ${GET_ORC_View}   ${respOrgUnit}   ${successResponse}
    log  ${Response}
    ${Status}       run keyword and return status       Validation For Error Message        ${Response}      ${ORC_NoRecordInDB_ErrMsg}      ${ErrLvl_INFO}      ${ORC_NoRecordInDB_ErrCode}
    run keyword if   ${Status}==False   Delete ORC      ${respOrgUnit}      ${Token}       ${Response}

GetRecVresionId
    [Arguments]         ${Response}
    ${recVersionId}      get from dictionary          ${Response}            recVersionId
    [Return]    ${recVersionId}


Create CIC With CAG
    [Arguments]     ${adminUserOauthToken}      ${ReqDataForCISCreate}      ${CIS_Translation_State}        ${CIC_status}
    ${cicCode}      ${acna}     ${resporgId}        ${recversionIDForCIS}       Create CIS    ${adminUserOauthToken}        ${ReqDataForCISCreate}       ${CIS_Translation_State}        ${CIC_status}
    #Create CAG
    ${resp}       ${respOrgEntity}     Create CAG     ${adminUserOauthToken}        ${cicCode}          ${SuccessResponse}
    should not be empty             ${resp}
    ${recVersionIdCAG}     get from dictionary         ${resp}         recVersionId
    ${resp}      GET METHOD    ${adminUserOauthToken}     ${GET_CAG_RETRIEVE}${cicCode}       ${SuccessResponse}
    log     ${resp}
    ${resp_recVersionId}     get from dictionary         ${resp}         recVersionId
    should be equal             ${resp_recVersionId}            ${recVersionIdCAG}
    ${cagEnttyLst}         get from dictionary     ${resp}         cagEntityList
    ${cagEnttyLst}         get from list     ${cagEnttyLst}         0
    should be equal         ${cagEnttyLst}          ${respOrgEntity}
    [Return]         ${cicCode}     ${acna}     ${resporgId}        ${respOrgEntity}        ${recVersionIdCAG}          ${recversionIDForCIS}

Get New RespOrg Entity
    [Arguments]         ${adminUserOauthToken}
    #create new resporg entity
    ${respOrgEntityString}          Get Non-Existing Entity     ${adminUserOauthToken}
    Create RespOrg Entity     ${adminUserOauthToken}   ${respOrgEntityCreate_request_body}   ${successResponse}    ${respOrgEntityString}
    ${responseData}     Retrieve RespOrgEntity   ${adminUserOauthToken}   ${respOrgEntityString}  ${successResponse}
    ${recVersionIdForNewRespEntity}     get from dictionary     ${responseData}         recVersionId
    ${newRespOrgEntity}=   get from dictionary     ${responseData}     respOrgEntity
    should be equal  ${respOrgEntityString}     ${newRespOrgEntity}
    [Return]        ${newRespOrgEntity}         ${recVersionIdForNewRespEntity}

Delete CAG
    [Arguments]      ${token}       ${cicCode}     ${status_code}
    sleep       ${T2_THROTTLING_SLEEP}
    ${second}     fetch from right   ${POST_CAG_DELETE}   /v2/ip/
    ${POST_CAG_DELETE}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${POST_CAG_DELETE}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}=  Delete Request  endpoint  ${POST_CAG_DELETE}${cicCode}     headers=${headers}
    log     ${resp}
    Should Be Equal As Strings  ${resp.status_code}   ${status_code}
    ${jsondata}=  To Json  ${resp.content}
    Log  ${jsondata}
    [Return]    ${jsondata}

Delete ACNA For CIC-0110 If Exists
    [Arguments]     ${token}
    ${resporgId}            get from input          ${reqdataForCISResporgACTIVE}           respOrgId
    ${requestData}    evaluate    json.loads('''${ReqBodyForCICCreateAllParams}''')    json
    set to dictionary   ${requestData}      acna=OTC
    set to dictionary       ${requestData['otcPrmryCICRec']}      cicCode=${cicCode_0110}
    set to dictionary   ${requestData['otcPrmryCICRec']}      translation=Y
    set to dictionary   ${requestData['otcNtwrkIds'][0]}      respOrg=${resporgId}
    set to dictionary   ${requestData['otcPrmryCICRec']}      status=DISCONNECT
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${updateResp}     PUT Method         ${token}        ${PUT_CIS_CIC_UPDATE}      ${reqBody}      ${SuccessResponse}
    log     ${updateResp}
    ${result}   run keyword and return status       should be empty         ${updateResp}
    run keyword if      ${result}==True     Log     Continue
    ...     ELSE        validation for error message        ${updateResp}        ${NonExistingACNAErrorMsg}OTC${DoesNtExist}        ${ERROR}        ${NonExistingACNAErrorCode}
    ${deleteResp}  Delete CIS     ${token}      OTC         ${SuccessResponse}
    ${result}   run keyword and return status       should be empty         ${deleteResp}
    run keyword if      ${result}==True     Log     Continue
    ...     ELSE        validation for error message        ${deleteResp}        ${NonExistingACNAErrorMsg}OTC${DoesNtExist}        ${ERROR}        ${NonExistingACNAErrorCode}

Validate NOF NPA Retrieve Response
    [Arguments]         ${retrieveResp}         ${expected_fromEffDt}           ${expected_NPA}
    ${carNtfn}          get from dictionary     ${retrieveResp}         carNtfn
    ${listLength}       get length      ${carNtfn}
    :FOR   ${i}      IN RANGE    0  ${listLength}
    \   ${effDt}        get from dictionary     ${carNtfn[${i}]}         effDt
    \   ${ModifiedEffDt}        Remove '-' From EffDate         ${effDt}
    \   ${RespEffDate}     Fetch From Left  ${ModifiedEffDt}    T
    \   Should be true      ${RespEffDate} >= ${expected_fromEffDt}
    \   ${ntfyResn}     get from dictionary     ${carNtfn[${i}]}     ntfyResn
    \   should not be empty         ${ntfyResn}
    \   ${num}          get from dictionary     ${carNtfn[${i}]}       num
    \   ${respNPA}    get substring           ${num}       0       3
    \   should be equal         ${respNPA}          ${expected_NPA}
    \   ${approval}         get from dictionary     ${carNtfn[${i}]}       approval
    \   should not be empty         ${approval}

Validate NOF Template Retrieve Response
    [Arguments]         ${retrieveResp}         ${expected_fromEffDt}
    ${carNtfn}          get from dictionary     ${retrieveResp}         carNtfn
    ${listLength}       get length      ${carNtfn}
    :FOR   ${i}      IN RANGE    0  ${listLength}
    \   ${effDt}        get from dictionary     ${carNtfn[${i}]}         effDt
    \   ${ModifiedEffDt}        Remove '-' From EffDate         ${effDt}
    \   ${RespEffDate}     Fetch From Left  ${ModifiedEffDt}    T
    \   Should be true      ${RespEffDate} >= ${expected_fromEffDt}
    \   ${ntfyResn}     get from dictionary     ${carNtfn[${i}]}     ntfyResn
    \   should not be empty         ${ntfyResn}
    \   ${tmplName}          get from dictionary     ${carNtfn[${i}]}       tmplName
    \   should not be empty         ${tmplName}
    \   ${prCntr}         get from dictionary     ${carNtfn[${i}]}       prCntr
    \   ${approval}         get from dictionary     ${carNtfn[${i}]}       approval
    \   should not be empty         ${approval}

Create CIC With GNA
   [Arguments]          ${adminUserOauthToken}          ${translation_State}
   ${cicCode}      ${acna}      ${resporgId}            ${CIS_retrieve_recVersionId}            Create CIS         ${adminUserOauthToken}        ${ReqDataForCISCreateMandatoryParamas}       ${translation_State}       ACTIVE
   ${resp}        ${respOrgEntity}     Create CAG      ${adminUserOauthToken}      ${cicCode}          ${SuccessResponse}
   should not be empty             ${resp}
   ${cicCodeWithGNA}             ${recVersionIdGNA}               Create GNA             ${adminUserOauthToken}              ${cicCode}          ${ReqbodyForGNACreateWithMandatoryParams}
   [Return]         ${cicCodeWithGNA}           ${acna}         ${resporgId}             ${recVersionIdGNA}             ${CIS_retrieve_recVersionId}

Validate EAP Retrieve Response
    [Arguments]                 ${creteRequestData}         ${Approvals}            ${retrieveResp}             ${createResponseNumList}
    ${creteRequestData}    evaluate    json.loads('''${creteRequestData}''')    json
    ${createApprovals}           get from dictionary             ${creteRequestData}         ${Approvals}
    ${retrieveRecversionID}     get from dictionary             ${retrieveResp}               recVersionId
    should not be empty         ${retrieveRecversionID}
    ${retrieveExceptionApprovals}           get from dictionary             ${retrieveResp}         exceptionApprovals
    ${exceptionApprovalsLength}       get length          ${retrieveExceptionApprovals}
    :FOR   ${i}     IN RANGE    0      ${exceptionApprovalsLength}
    \   ${retrieve_recVersionIdEAP}           get from dictionary             ${retrieveExceptionApprovals[${i}]}               recVersionId
    \   ${retrieveResp_num}           get from dictionary             ${retrieveExceptionApprovals[${i}]}              num
    \   ${index}        Validate Number After Retrieve          ${exceptionApprovalsLength}             ${retrieveResp_num}     ${createApprovals}
    \   ${retrieveResp_addRoutingInd}           get from dictionary             ${retrieveExceptionApprovals[${i}]}              addRoutingInd
    \   ${input_addRoutingInd}        get from dictionary          ${createApprovals[${index}]}        addRoutingInd
    \   Should be equal             ${retrieveResp_addRoutingInd}         ${input_addRoutingInd}
    \   ${retrieveResp_chgRoutingInd}           get from dictionary             ${retrieveExceptionApprovals[${i}]}              chgRoutingInd
    \   ${input_chgRoutingInd}        get from dictionary          ${createApprovals[${index}]}        chgRoutingInd
    \   Should be equal             ${retrieveResp_chgRoutingInd}         ${input_chgRoutingInd}
    [Return]        ${retrieveRecversionID}

Validate Number After Retrieve
    [Arguments]         ${exceptionApprovalsLength}           ${retrieveResp_num}      ${createRespApprovals}
    : FOR     ${i}   IN RANGE   0   ${exceptionApprovalsLength}
    \   ${input_num}        get from dictionary          ${createRespApprovals[${i}]}        num
    \   ${status}       run keyword and return status           Should be equal             ${retrieveResp_num}         ${input_num}
    \   run keyword if       ${status}==True         return from keyword    ${i}
    \   ...     ELSE   continue for loop

Create EAP And Validate The Response
    [Arguments]     ${oauthToken}     ${reqBodyForEAPCreate}      ${createRequestNumList}
    ${respCreate}          POST Method             ${oauthToken}        ${POST_EAP_CREATE}           ${reqBodyForEAPCreate}         ${SuccessResponse}
    log     ${respCreate}
    #validate create response
    should not be empty             ${respCreate}
    ${resp_numList}      get from dictionary             ${respCreate}               numList
    ${numListLength}        get length          ${resp_numList}
    :FOR    ${i}        IN RANGE    0       ${numListLength}
    \   ${recVersionIdEAP}           get from dictionary             ${resp_numList[ ${i}]}               recVersionId
    \   should not be empty         ${recVersionIdEAP}
    \   ${num}           get from dictionary             ${resp_numList[${i}]}               num
    \   list should contain value     ${createRequestNumList}             ${num}
    [Return]        ${resp_numList}

Retrieve EAP And Validate The Response
    [Arguments]         ${oauthToken}        ${Approvals}         ${cicCode}          ${reqBodyForEAPCreate}          ${createResponse_numList}
    ${retrieveResp}     GET Method    ${oauthToken}    ${GET_EAP_RETRIEVE}${cicCode}          ${SuccessResponse}
    log      ${retrieveResp}
    Should not be empty         ${retrieveResp}
    ${retrieveRecversionID}         Validate EAP Retrieve Response               ${reqBodyForEAPCreate}          ${Approvals}              ${retrieveResp}             ${createResponse_numList}
    [Return]        ${retrieveRecversionID}

Delete EAP
    [Arguments]         ${oauthToken}        ${cicCodeForEAPDelete}          ${recversionIDOfTheEAPRecord}
    ${requestData}=    evaluate    json.loads('''${ReqBodyForDeleteEAP}''')    json
    set to dictionary     ${requestData}     cicCode=${cicCodeForEAPDelete}
    set to dictionary     ${requestData}    recVersionId=${recversionIDOfTheEAPRecord}
    ${reqData}=    evaluate    json.dumps(${requestData})    json
    ${deleteResp}            PUT Method       ${oauthToken}      ${PUT_EAP_DELETE}        ${reqData}         ${SuccessResponse}
    should be empty          ${deleteResp}

Retrieve Non-Existing EAP Record And Validate The Response
    [Arguments]         ${oauthToken}      ${cicCode}
    ${retrieveResp}     GET Method    ${oauthToken}    ${GET_EAP_RETRIEVE}${cicCode}          ${SuccessResponse}
    log      ${retrieveResp}
    Should not be empty         ${retrieveResp}
    validation for error message        ${retrieveResp}         ${NoEAPDataExistsErrMsg}            ${ERROR}            ${NoEAPDataExistsErrCode}

Cleanup For EAP
    [Arguments]       ${adminUserOauthToken}        ${cicCode}          ${EAPretrieveRecversionID}        ${acna}            ${recversionIDForCIS}
    ${retrieveResp}     GET Method    ${adminUserOauthToken}    ${GET_EAP_RETRIEVE}${cicCode}          ${SuccessResponse}
    log      ${retrieveResp}
    Should not be empty         ${retrieveResp}
    ${status}       run keyword and return status           dictionary should contain key           ${retrieveResp}         errList
    run keyword if   ${Status}==False   run keywords     Delete EAP      ${adminUserOauthToken}     ${cicCode}          ${EAPretrieveRecversionID}     AND         Retrieve Non-Existing EAP Record And Validate The Response          ${adminUserOauthToken}       ${cicCode}
    Delete ACNA          ${adminUserOauthToken}         ${cicCode}          ${acna}       ${resporgId}          ${recversionIDForCIS}
    Close Session

Prepare RequestData For EAP
   [Arguments]          ${ReqBody}      ${cicCode}          ${Approvals}          ${Spare_num}        ${addRoutingInd_Y}      ${chgRoutingInd_N}         ${updateEAP}            ${recVersionId}
    ${requestData}    evaluate    json.loads('''${ReqBody}''')    json
    set to dictionary         ${requestData}           cicCode=${cicCode}
    ${Approvals}        get from dictionary      ${requestData}         ${Approvals}
    set to dictionary         ${Approvals[0]}            num=${Spare_num}
    set to dictionary         ${Approvals[0]}             addRoutingInd=${addRoutingInd_Y}
    set to dictionary         ${Approvals[0]}           chgRoutingInd=${chgRoutingInd_N}
    run keyword if      ${updateEAP}==True          set to dictionary         ${Approvals[0]}          recVersionId=${recVersionId}
    ${reqBody}    evaluate    json.dumps(${requestData})             json
    [Return]        ${reqBody}

Validate ENO Retrieve Response
    [Arguments]                 ${creteRequestData}         ${Notifications}            ${retrieveResp}             ${createResponseNumList}
    ${creteRequestData}    evaluate    json.loads('''${creteRequestData}''')    json
    ${createNotifications}           get from dictionary             ${creteRequestData}         ${Notifications}
    ${retrieveRecversionID}     get from dictionary             ${retrieveResp}               recVersionId
    should not be empty         ${retrieveRecversionID}
    ${retrieveExceptionNotifications}           get from dictionary             ${retrieveResp}         exceptionNotifications
    ${exceptionNotificationsLength}       get length          ${retrieveExceptionNotifications}
    :FOR   ${i}     IN RANGE    0      ${exceptionNotificationsLength}
    \   ${retrieve_recVersionIdEAP}           get from dictionary             ${retrieveExceptionNotifications[${i}]}               recVersionId
    \   ${retrieveResp_num}           get from dictionary             ${retrieveExceptionNotifications[${i}]}              num
    \   ${index}        Validate Number After Retrieve          ${exceptionNotificationsLength}             ${retrieveResp_num}     ${createNotifications}
    \   ${retrieveResp_addRoutingInd}           get from dictionary             ${retrieveExceptionNotifications[${i}]}              addRoutingInd
    \   ${input_addRoutingInd}        get from dictionary          ${createNotifications[${index}]}        addRoutingInd
    \   Should be equal             ${retrieveResp_addRoutingInd}         ${input_addRoutingInd}
    \   ${retrieveResp_chgRoutingInd}           get from dictionary             ${retrieveExceptionNotifications[${i}]}              chgRoutingInd
    \   ${input_chgRoutingInd}        get from dictionary          ${createNotifications[${index}]}        chgRoutingInd
    \   Should be equal             ${retrieveResp_chgRoutingInd}         ${input_chgRoutingInd}
    \   ${retrieveResp_delRoutingInd}           get from dictionary             ${retrieveExceptionNotifications[${i}]}              delRoutingInd
    \   ${input_delRoutingInd}        get from dictionary          ${createNotifications[${index}]}        delRoutingInd
    \   Should be equal             ${retrieveResp_delRoutingInd}         ${input_delRoutingInd}
    [Return]        ${retrieveRecversionID}

Create ENO And Validate The Response
    [Arguments]     ${oauthToken}     ${reqBodyForENOCreate}      ${createRequestNumList}
    ${respCreate}          POST Method             ${oauthToken}        ${POST_ENO_CREATE}           ${reqBodyForENOCreate}         ${SuccessResponse}
    log     ${respCreate}
    #validate create response
    should not be empty             ${respCreate}
    ${recVersionIdEAP}           get from dictionary             ${respCreate}                recVersionId
    ${resp_numList}      get from dictionary             ${respCreate}               numList
    ${numListLength}        get length          ${resp_numList}
    :FOR    ${i}        IN RANGE    0       ${numListLength}
    \   ${recVersionIdEAP}           get from dictionary             ${resp_numList[ ${i}]}               recVersionId
    \   should not be empty         ${recVersionIdEAP}
    \   ${num}           get from dictionary             ${resp_numList[${i}]}               num
    \   list should contain value     ${createRequestNumList}             ${num}
    [Return]        ${resp_numList}

Retrieve ENO And Validate The Response
    [Arguments]         ${oauthToken}        ${Notifications}         ${cicCode}          ${reqBodyForENOCreate}          ${createResponse_numList}
    ${status}      run keyword and return status        should be equal         ${cicCode}      ${cicCode_0110}
    ${retrieveResp}         run keyword if  ${status}==True       GET Method    ${oauthToken}    ${GET_ENO_RETRIEVE}${cicCode}${networkParam}${netWrkIdForCIC_0110}          ${SuccessResponse}
    ...     ELSE        GET Method    ${oauthToken}    ${GET_ENO_RETRIEVE}${cicCode}          ${SuccessResponse}
    log      ${retrieveResp}
    Should not be empty         ${retrieveResp}
    ${retrieveRecversionID}         Validate ENO Retrieve Response               ${reqBodyForENOCreate}          ${Notifications}              ${retrieveResp}             ${createResponse_numList}
    [Return]        ${retrieveRecversionID}

Delete ENO
    [Arguments]         ${oauthToken}        ${cicCodeForENODelete}          ${recversionIDOfTheENORecord}
    ${requestData}=    evaluate    json.loads('''${ReqBodyForDeleteENO}''')    json
    set to dictionary     ${requestData}     cicCode=${cicCodeForENODelete}
    ${status}       run keyword and return status       should be equal         ${cicCodeForENODelete}              ${cicCode_0110}
    run keyword if      ${status}==True         set to dictionary     ${requestData}     netWrkId=${netWrkIdForCIC_0110}
    set to dictionary     ${requestData}    recVersionId=${recversionIDOfTheENORecord}
    ${reqData}=    evaluate    json.dumps(${requestData})    json
    ${deleteResp}            PUT Method       ${oauthToken}      ${PUT_ENO_DELETE}        ${reqData}         ${SuccessResponse}
    should be empty          ${deleteResp}
    [Return]        ${reqData}

Retrieve Non-Existing ENO Record And Validate The Response
    [Arguments]         ${oauthToken}      ${cicCode}
    ${status}       run keyword and return status   should be equal     ${cicCode}          ${cicCode_0110}
    ${retrieveResp}         run keyword if  ${status}==True       GET Method    ${oauthToken}    ${GET_ENO_RETRIEVE}${cicCode}${networkParam}${netWrkIdForCIC_0110}          ${SuccessResponse}
    ...     ELSE        GET Method    ${oauthToken}    ${GET_ENO_RETRIEVE}${cicCode}          ${SuccessResponse}
    log      ${retrieveResp}
    Should not be empty         ${retrieveResp}
    validation for error message        ${retrieveResp}         ${NoENODataExistsErrMsg}            ${ERROR}            ${NoENODataExistsErrCode}

Cleanup For ENO
    [Arguments]       ${adminUserOauthToken}     ${cicCode}          ${retrieveRecversionID}        ${acna}            ${recVersionIdCIS}
    ${retrieveResp}     GET Method    ${adminUserOauthToken}    ${GET_ENO_RETRIEVE}${cicCode}          ${SuccessResponse}
    log      ${retrieveResp}
    Should not be empty         ${retrieveResp}
    ${status}       run keyword and return status           dictionary should contain key           ${retrieveResp}         errList
    run keyword if   ${Status}==False   run keywords     Delete ENO      ${adminUserOauthToken}     ${cicCode}          ${retrieveRecversionID}     AND         Retrieve Non-Existing ENO Record And Validate The Response          ${adminUserOauthToken}       ${cicCode}
    ${cicCodeStatus}       run keyword and return status       should be equal     ${cicCode}      ${cicCode_0110}
    run keyword if   ${cicCodeStatus}==True         Delete ACNA-0110        ${adminUserOauthToken}        Y        ${resporgId}
    ...     ELSE        Delete ACNA          ${adminUserOauthToken}         ${cicCode}          ${acna}       ${resporgId}              ${recVersionIdCIS}
    Close Session

Prepare RequestData For ENO
   [Arguments]          ${ReqBody}      ${cicCode}          ${Notifications}          ${num}        ${addRoutingInd}      ${chgRoutingInd}      ${delRoutingInd}        ${updateENO}            ${recVersionId}
    ${requestData}    evaluate    json.loads('''${ReqBody}''')    json
    set to dictionary         ${requestData}           cicCode=${cicCode}
    ${status}       run keyword and return status       should be equal         ${cicCode}      ${cicCode_0110}
    run keyword if      ${status}==True     set to dictionary     ${requestData}     netWrkId=${netWrkIdForCIC_0110}
    ${Notifications}        get from dictionary      ${requestData}         ${Notifications}
    set to dictionary         ${Notifications[0]}            num=${num}
    set to dictionary         ${Notifications[0]}             addRoutingInd=${addRoutingInd}
    set to dictionary         ${Notifications[0]}           chgRoutingInd=${chgRoutingInd}
    set to dictionary         ${Notifications[0]}             delRoutingInd=${delRoutingInd}
    run keyword if      ${updateENO}==True          set to dictionary         ${Notifications[0]}          recVersionId=${recVersionId}
    ${reqBody}    evaluate    json.dumps(${requestData})             json
    [Return]        ${reqBody}

UAA and User Profile Admin User with View Permission
    # Modify {Function_Name} as per scenario and also modify specific Role as per scenario(SUD,ORG,SEC)
    ####For Example : modify specific role        ${oauthToken}     ${reqBody}     SUD      200
    ################  modify specific role        ${oauthToken}     ${reqBody}     ORG      200
    [Arguments]     ${Modify_UserRole_All_Perms_ReqBody}        ${Modify_UserRole_View_Perm_ReqBody}        ${function_Name}
    UserProfile Login        ${Admin_Credentials_Track2}
    ${oauthToken}       Get Token
    #Get Randomly generated User Role
    ${new_UserRole}     Get Random User Role    ${oauthToken}   [LETTERS]
    #Create user role
    ${responseData}     Create User Role     ${oauthToken}  ${new_UserRole}  ${reqBody_Single_UserRole}
    ${requestData}=    evaluate    json.loads('''${AdminUserProfile_ReqBody}''')    json
    set to dictionary       ${requestData}      role=${new_UserRole}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    create user profile and modify permissions       ${Admin_Credentials_Track2}         ${reqBody}        ${Modify_UserRole_View_Perm_ReqBody}      ${function_Name}
    ${requestData}=    evaluate    json.loads('''${Modify_UserRole_All_Perms_ReqBody}''')    json
    set to dictionary       ${requestData}      roleName=${new_UserRole}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    ${UserId}     get username
    ${passwd}     get password
    ${CredentialsreqBody}    Get ChangePassword with NewPassword        ${ChangePswd_ReqBody}     ${UserId}       ${passwd}
    log     ${CredentialsreqBody}
    ${successResponseBody}     PUT Method      ${oauthToken}      ${PASSWD_UPDATE}        ${CredentialsreqBody}       ${SuccessResponse}
    log     ${successResponseBody}
    ${newPasswordUserCredentials}       Get Updated New UserCredentials        ${CredentialsreqBody}      ${oauthToken}
    ${data}=    evaluate    json.loads('''${newPasswordUserCredentials}''')    json
    ${New_password}     get from dictionary     ${data}   password
    [Return]    ${reqBody}     ${oauthToken}       ${new_UserRole}      ${New_password}


Get single NPA
    [Arguments]         ${oauthToken}
    ${response}     GET METHOD      ${oauthToken}     ${AND_URI}        ${SuccessResponse}
    dictionary should contain key       ${response}     startNPA
    ${List_NPA}     get from dictionary     ${response}         npaList
    log     ${List_NPA}
    ${NPALen}     get length      ${NPA_List}
    @{NPA_List}     run keyword if      ${NPALen}!=0        Clean the List      ${NPA_List}
    should be empty         ${NPA_List}
    ${listLength}       get length      ${List_NPA}
    ${index}        get random string       1       0123456
    #${RandVal}=    Evaluate    random.sample([unicode(x) for x in range(0, ${listLength})], 1)    random
    dictionary should contain key       ${List_NPA[${index}]}       npa
    ${NPA}     get from dictionary           ${List_NPA[${index}]}       npa
    [Return]        ${NPA}

Clean the List
    [Arguments]     ${List}
    ${ListLength}       get length      ${List}
    :FOR   ${i}      IN RANGE    0      ${ListLength}
    \       remove from list       ${List}       0
    \       log     ${List}
    [Return]        ${List}

Get NPA list
    [Arguments]         ${response}
    ${List_NPA}     get from dictionary     ${response}         npaList
    log     ${List_NPA}
    ${NPALen}     get length      ${NPA_List}
    @{NPA_List}     run keyword if      ${NPALen}!=0        Clean the List      ${NPA_List}
    should be empty         ${NPA_List}
    ${listLength}       get length      ${List_NPA}
    :FOR   ${i}      IN RANGE    0      ${listLength}
    \       dictionary should contain key       ${List_NPA[${i}]}       recVersionId
    \       dictionary should contain key       ${List_NPA[${i}]}       npa
    \       ${NPA}     get from dictionary           ${List_NPA[${i}]}       npa
    \       append to list          ${NPA_List}         ${NPA}
    \       log     ${NPA_List}
    log     ${NPA_List}
    [Return]        @{NPA_List}

Validation for multiple error messages
    [Arguments]         ${ResponseData}     ${errorMessages_List}        ${errorCode_List}      ${ErrorLevel_List}
    ${ErrMsgListLength}     get length          ${errorMessages_List}
    ${errList}=     get from dictionary  ${ResponseData}     errList
    ${length}     get length      ${errList}
    #should be equal as integers         ${Length}       ${ErrMsgListLength}
    :FOR   ${i}   IN RANGE   0  ${length}
    \       ${ErrorList}=   get from dictionary  ${errList[${i}]}   errMsg
    \       ${ErrorLvl}=   get from dictionary  ${errList[${i}]}   errLvl
    \       ${ErrorCode}=   get from dictionary  ${errList[${i}]}   errCode
    \       list should contain value   ${errorMessages_List}   ${ErrorList}
    \       list should contain value   ${errorCode_List}   ${ErrorCode}
    \       list should contain value     ${ErrorLevel_List}    ${ErrorLvl}

Delete Method
    [Arguments]      ${token}       ${Delete_URI}       ${Input}    ${recVersionId}       ${status_code}
    sleep       ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${Delete_URI}   /v2/ip/
    ${Delete_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${Delete_URI}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}=  Delete Request  endpoint  ${Delete_URI}${Input}${recVersionId_URI}${recVersionId}      headers=${headers}
    log     ${resp}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${Delete_URI}     ${202Accepted}
    ${jsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    Log  ${jsondata}
    [Return]    ${jsondata}

Get OCN List
    [Arguments]         ${token}
    ${ListResponse}     GET METHOD      ${token}     ${GET_OCN_List}        ${SuccessResponse}
    log         ${ListResponse}
    ${MappedEntityLst}        get from dictionary     ${ListResponse}    entityLst
    ${Length}       get length      ${MappedEntityLst}
    ${MappedOCNList}        Create list
    : FOR   ${i}    IN RANGE    0       ${Length}
    \   ${entity}       get from list       ${MappedEntityLst}        ${i}
    \   ${entityRetrieveResponse}     GET METHOD      ${token}     ${GET_OCN_Retrieve}${entity}        ${SuccessResponse}
    \   log         ${entityRetrieveResponse}
    \   ${ocnLst}       get from dictionary     ${entityRetrieveResponse}      ocnLst
    \   ${MappedOCNList}        Combine Lists       ${MappedOCNList}       ${ocnLst}
    \   log     ${MappedOCNList}
    [Return]        ${MappedEntityLst}      ${MappedOCNList}

Get OCN List For An Entity
    [Arguments]       ${token}    ${entity}
    ${entityRetrieveResponse}     GET METHOD      ${token}     ${GET_OCN_Retrieve}${entity}        ${SuccessResponse}
    log     ${entityRetrieveResponse}
    ${ocnList}       get from dictionary     ${entityRetrieveResponse}      ocnLst
    log    ${ocnList}
    [Return]     ${ocnList}

Get OCN Mapping Not Existing Entity From RespOrgEntity List
    [Arguments]         ${adminUserOauthToken}        ${MappedEntityLst}
    ${respOrgEntityList}  GET METHOD            ${adminUserOauthToken}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}   ${successResponse}
    ${respOrgList}    get from dictionary  ${respOrgEntityList}   respOrgList
    ${respOrgListLength}        get length      ${respOrgList}
    ${Entity}   set variable  0
    :FOR        ${i}    IN RANGE    0       ${respOrgListLength}
    \   ${Index}        Get One Random Index From The List        ${respOrgListLength}
    \   ${respOrgEntityDetails}       get from list       ${respOrgList}      ${Index}
    \   ${Entity}        get from dictionary         ${respOrgEntityDetails}     respOrgEntity
    \   ${Status}   run keyword and return status  list should not contain value       ${MappedEntityLst}        ${Entity}
    \   run keyword if  ${Status}==True     exit for loop
    [Return]        ${Entity}

Retrieve Non-existing OCN Entity And Validate The Response
    [Arguments]         ${token}        ${Entity}
    ${retrieveResponse}     GET METHOD      ${token}     ${GET_OCN_Retrieve}${Entity}        ${SuccessResponse}
    log         ${retrieveResponse}
    Validation For Error Message        ${retrieveResponse}        ${NonExistingOCNErrMsg}         ${ERROR}        ${NonExistingOCNErrCode}

Get One Random Index From The List
    [Arguments]          ${ListLength}
    ${RandomListIndex}    Evaluate    random.sample(range(1, ${ListLength}), 1)    random
    ${RandomIndex}        get from list       ${RandomListIndex}        0
    [Return]        ${RandomIndex}

Get OCN Mapping Exists Entity
    [Arguments]         ${token}
    ${listResponse}     GET METHOD      ${token}     ${GET_OCN_List}        ${SuccessResponse}
    log         ${listResponse}
    ${mappedEntityList}        get from dictionary     ${listResponse}    entityLst
    ${mappedEntityListLength}       get length      ${mappedEntityList}
    ${randomIndex}         Get One Random Index From The List        ${mappedEntityListLength}
    ${entity}       get from list       ${mappedEntityList}        ${randomIndex}
    [Return]    ${entity}

OCNLst Validation
    [Arguments]         ${retrieveOCNLst}       ${expectedOCNLst}
    ${retrieveOCNLstLength}     get length      ${retrieveOCNLst}
    ${ResponseOCNLstLength}     get length      ${expectedOCNLst}
    should be equal     ${retrieveOCNLstLength}        ${ResponseOCNLstLength}
    : For    ${i}   IN RANGE    0       ${retrieveOCNLstLength}-1
    \   ${OCNID}        get from list       ${retrieveOCNLst}       ${i}
    \   list should contain value       ${expectedOCNLst}       ${OCNID}

Delete OCN And Get OCN Details
    [Arguments]         ${adminUserOauthToken}
    #Get one entity from the list
    ${entity}     Get No CLE and CLA Info OCN Entity      ${adminUserOauthToken}
    # Retrieve entiry before delete
    ${entityRetrieveResponseBeforeDelete}     GET METHOD      ${adminUserOauthToken}     ${GET_OCN_Retrieve}${entity}        ${SuccessResponse}
    log         ${entityRetrieveResponseBeforeDelete}
    ${OCNLst}       get from dictionary     ${entityRetrieveResponseBeforeDelete}      ocnLst
    ${recVersionId}     get from dictionary     ${entityRetrieveResponseBeforeDelete}       recVersionId
    # Delete entity
    ${deleteResp}      Delete Method       ${adminUserOauthToken}          ${DELETE_OCN}       ${entity}        ${recVersionId}            ${SuccessResponse}
    should be empty     ${deleteResp}
    Retrieve Non-existing OCN Entity And Validate The Response      ${adminUserOauthToken}      ${entity}
    [Return]        ${entity}       ${OCNLst}

Get No CLE and CLA Info OCN Entity
    [Arguments]     ${token}
    ${listResponse}     GET METHOD      ${token}     ${GET_OCN_List}        ${SuccessResponse}
    log         ${listResponse}
    ${mappedEntityList_OCN}        get from dictionary     ${listResponse}      entityLst
    ${listResponse_CLA}     GET METHOD      ${token}     ${GET_CLA_RETRIEVE_LST}        ${SuccessResponse}
    log         ${listResponse_CLA}
    ${CLAListISEmpty}   run keyword and return status     validation for error message      ${listResponse_CLA}           ${NoCLADataErrMsg}     ${ERROR}            ${NoCLADataErrCode}
    ${entityLstCLA}       run keyword if      ${CLAListISEmpty} == False       get from dictionary     ${listResponse_CLA}        entityList
    ...     ELSE        create list
    ${listResponse_CLE}     GET METHOD      ${token}     ${GET_CLE_LIST}        ${SuccessResponse}
    log         ${listResponse_CLE}
    ${CLEListISEmpty}   run keyword and return status     validation for error message        ${listResponse_CLE}            ${NoCLEDataErrMsg}     ${ERROR}            ${NoCLEDataErrCode}
    ${entityLstCLE}       run keyword if      ${CLEListISEmpty} == False       get from dictionary     ${listResponse_CLE}       entityList
    ...     ELSE        create list
    ${CLAAndCLEMappingExistsEntityList}     combine lists      ${entityLstCLE}      ${entityLstCLA}
    log     ${CLAAndCLEMappingExistsEntityList}
    ${CLAAndCLEMappingExistsEntityList}         remove duplicates       ${CLAAndCLEMappingExistsEntityList}
    ${resultlistStatus}     run keyword and return status   should not be empty         ${CLAAndCLEMappingExistsEntityList}
    ${OCN_Length}         get length         ${mappedEntityList_OCN}
    :FOR   ${i}      IN RANGE    0       ${OCN_Length}
    \   ${OCNentity}        get from list       ${mappedEntityList_OCN}     ${i}
    \   ${entity}           run keyword if   ${resultlistStatus} == False  set variable      ${OCNentity}
    \   run keyword if   ${resultlistStatus} == False      return from keyword         ${entity}
    \   ${Condition}     run keyword and return status      list should contain value      ${CLAAndCLEMappingExistsEntityList}      ${OCNentity}
    \   log     ${Condition}
    \   ${entity}           set variable if     ${Condition}==False        ${mappedEntityList_OCN[${i}]}
    \   Exit For Loop If    ${Condition} == False
    [Return]        ${entity}

Update OCN
    [Arguments]          ${adminUserOauthToken}         ${entity}       ${OCNLst}       ${recVersionId}
    ${requestData}    evaluate    json.loads('''${ReqBodyForOCNCreate}''')    json
    set to dictionary       ${requestData}      entity=${entity}
    set to dictionary      ${requestData}       ocnLst=${OCNLst}
    set to dictionary       ${requestData}       recVersionId=${recVersionId}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method         ${adminUserOauthToken}        ${PUT_OCN_UPDATE}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    [Return]        ${reqBody}      ${resp}

Create OCN
    [Arguments]          ${adminUserOauthToken}         ${entity}       ${OCNLst}
    ${requestData}    evaluate    json.loads('''${ReqBodyForOCNCreate}''')    json
    set to dictionary       ${requestData}      entity=${entity}
    set to dictionary      ${requestData}       ocnLst=${OCNLst}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method         ${adminUserOauthToken}        ${POST_OCN_Create}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    [Return]        ${reqBody}      ${resp}

Create OCN AND Close Session
    [Arguments]         ${adminUserOauthToken}      ${entity}       ${OCNLst}
    # Create OCN
    ${OCN_CreateReqBody}      ${OCN_CreateResp}          Create OCN          ${adminUserOauthToken}         ${entity}       ${OCNLst}
    should not be empty        ${OCN_CreateResp}
    ${recVersionId}     get from dictionary     ${OCN_CreateResp}       recVersionId
    # Retrieve after create
    ${entityRetrieveResponseAfterCreate}     GET METHOD      ${adminUserOauthToken}     ${GET_OCN_Retrieve}${entity}        ${SuccessResponse}
    log         ${entityRetrieveResponseAfterCreate}
    ${retrieveOCNLst}       get from dictionary     ${entityRetrieveResponseAfterCreate}      ocnLst
    OCNLst Validation       ${retrieveOCNLst}      ${OCNLst}
    ${retrieveRecVersionId}     get from dictionary     ${entityRetrieveResponseAfterCreate}       recVersionId
    should be equal      ${retrieveRecVersionId}         ${recVersionId}
    Close Session

Update NPA-NXX Status
    [Arguments]   ${token}   ${NPA}    ${NXX}    ${Status}   ${All_Param}   ${NUC_Retrieve_response}   ${PUT_Response}
    ${requestData}=    evaluate    json.loads('''${NUC_Status_UpdateReqBody}''')    json
    ${recVersionId}      get from dictionary   ${NUC_Retrieve_response}    recVersionId
    dictionary should contain key   ${NUC_Retrieve_response}     status
    set to dictionary   ${requestData}   npa=${NPA}
    set to dictionary   ${requestData}   nxx=${NXX}
    set to dictionary   ${requestData}   status=${Status}
    run keyword if    ${All_Param}==True   set to dictionary       ${requestData}     rndmLimit=100.0
    set to dictionary        ${requestData}     recVersionId=${recVersionId}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${responseBody}     PUT Method           ${token}       ${POST_NUC_CREATE}     ${reqBody}     ${PUT_Response}
    should not be empty    ${responseBody}
    [Return]    ${responseBody}       ${Status}

Delete NPA
    [Arguments]     ${oauthToken}         ${NPA}        ${NPA_DeleteReqBody}        ${Response}     ${recVersionId}
    ${requestData}=    evaluate    json.loads('''${NPA_DeleteReqBody}''')    json
    set to dictionary       ${requestData['deleteNPAList'][0]}     npa=${NPA}
    set to dictionary        ${requestData['deleteNPAList'][0]}     recVersionId=${recVersionId}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${responseBody}     PUT Method          ${oauthToken}      ${AND_URI}     ${reqBody}     ${Response}
    should not be empty     ${responseBody}
    ${npaList_response}     GET METHOD      ${oauthToken}     ${AND_URI}        ${SuccessResponse}
    should not be empty     ${npaList_response}
    ${NPA_List}     Get NPA list        ${npaList_response}
    list should not contain value      ${NPA_List}    ${NPA}
    [Return]        ${responseBody}

Get NPA RecVersion Id
    [Arguments]     ${Response}     ${Rec_NPA}
    ${npaList}         get from dictionary     ${Response}     npaList
    ${listLength}       get length          ${npaList}
    :FOR   ${i}      IN RANGE    0      ${listLength}
    \      ${NPA}     get from dictionary         ${npaList[${i}]}       npa
    \      ${recVersionId}      get from dictionary         ${npaList[${i}]}       recVersionId
    \      exit for loop if     ${NPA}==${Rec_NPA}
    [Return]        ${recVersionId}

Reserve Number Status Validation
    [Arguments]        ${token}     ${resp}     ${Qty}
    ${NumList}      get from dictionary          ${resp}        numList
    ${Qty}      get length      ${NumList}
    :FOR   ${i}   IN RANGE   0      ${Qty}
    \   ${resp}     Do Number Query         ${token}    ${NumList[${i}]}    ${SuccessResponse}
    \   ${queryResult}       get from dictionary     ${resp}     queryResult
    \   ${Status}       get from dictionary     ${queryResult[0]}     status
    \   should be equal     ${Status}       ${TFN_status_reserved}

Status Update To SPARE
    [Arguments]     ${Qty}      ${token}        ${resp}
    ${NumList}      get from dictionary          ${resp}        numList
    :FOR   ${i}   IN RANGE   0      ${Qty}
    \   ${resp}     Do Number Query         ${token}    ${NumList[${i}]}    ${SuccessResponse}
    \   ${queryResult}     get from dictionary     ${resp}     queryResult
    \   ${recVersionId}        get from dictionary     ${queryResult[0]}     recVersionId
    \   ${reqData}=    evaluate    json.loads('''${NumUpdate_Reqbody}''')    json
    \   set to dictionary       ${reqData["tfNumList"][0]}      num=${NumList[${i}]}
    \   set to dictionary       ${reqData}     status=${TFN_status_spare}
    \   set to dictionary       ${reqData["tfNumList"][0]}      recVersionId=${recVersionId}
    \   ${reqData}=    evaluate    json.dumps(${reqData})    json
    \   ${resp}     PUT Method      ${token}    ${PUT_NU_ACTION}        ${reqData}      ${SuccessResponse}
    \   Dictionary should contain key       ${resp}     updateResult
    \   ${UpdateResult}     get from dictionary     ${resp}     updateResult
    \   ${recversionId}     get from dictionary     ${UpdateResult[0]}      recVersionId
    \   ${ResponseNum}      get from dictionary     ${UpdateResult[0]}      num
    \   should be equal         ${ResponseNum}      ${NumList[${i}]}
    \   ${resp}     Do Number Query         ${token}    ${NumList[${i}]}    ${SuccessResponse}
    \   ${queryResult}     get from dictionary     ${resp}     queryResult
    \   ${StatusafterUpdate}        get from dictionary     ${queryResult[0]}     status
    \   should be equal     ${StatusafterUpdate}        ${SPARE}

    Close Session

TFNs Validate Specific NXX
    [Arguments]         ${responseBody}     ${Req_NPA}      ${Req_NXX}      ${token}     ${Req_Qty}
    ${ANDresponse}     GET METHOD      ${token}     ${AND_URI}        ${SuccessResponse}
    ${NPA_List}     Get NPA list        ${ANDresponse}
    ${Num}      get from dictionary          ${responseBody}        numList
    ${TFN_Length}     get length      ${Num}
    ${Req_Qty}      convert to integer      ${Req_Qty}
    #should be equal        ${TFN_Length}       ${Req_Qty}
    :FOR   ${i}   IN RANGE   0      ${TFN_Length}
    \       ${RespNPA}     Get Substring           ${Num[${i}]}      0       3
    \       ${NPA_Status}     run keyword and return status         should be equal         ${RespNPA}      ${Req_NPA}
    \       run keyword if        ${NPA_Status}==False    list should contain value       ${NPA_List}     ${RespNPA}
    \       ${RespNXX}     Get Substring           ${Num[${i}]}      3       6
    \       should be true          ${RespNXX}>=${Req_NXX}

Appending Zeroes For Line Number
    [Arguments]  ${XXXX}        ${numbers}      ${i}
    ${diff}     evaluate        4-${XXXX}
    ${noOfZeroesToAppend}       Get random string       ${diff}          0
    ${newNumber}    catenate        ${noOfZeroesToAppend}${numbers[${i}]}
    remove from list    ${numbers}      ${i}
    log  ${numbers}
    insert into list  ${numbers}      ${i}      ${newNumber}

Status Validation For Length Greater Than Five
       [Arguments]     ${RespNPA}  ${RespNXX}   ${Req_XXXX}     ${RespXXXX}      ${token}
        ${numbers}=     Evaluate    random.sample([unicode(x) for x in range(${Req_XXXX}, ${RespXXXX})], 5)    random
        ${listLength}   get length  ${numbers}
        :FOR   ${i}   IN RANGE   0      ${listLength}
        \       ${XXXX_Length}     get length  ${numbers[${i}]}
        \       ${status}   run keyword and return status   should be true      ${XXXX_Length}==4
        \       run keyword if  ${status}==False    Appending Zeroes For Line Number     ${XXXX_Length}        ${numbers}      ${i}
        log     ${numbers}
        :FOR   ${i}   IN RANGE   0      5
        \       ${resp}   do number query  ${token}     ${RespNPA}${RespNXX}${numbers[${i}]}     ${successresponse}
        \       ${status}   get from dictionary  ${resp}        status
        \       should not be equal     ${status}       ${SPARE}

Status Validation For Length Less Than Five
    [Arguments]     ${RespNPA}  ${RespNXX}      ${Req_XXXX}     ${RespXXXX}      ${token}       ${diff}
    ${status}   run keyword and return status   should be true  ${diff}==0
    run keyword if      ${status}==False        Status Validation For Length Greater Than Zero And Less Than Five      ${RespNPA}  ${RespNXX}      ${Req_XXXX}     ${RespXXXX}      ${token}       ${diff}

Status Validation For Length Greater Than Zero And Less Than Five
    [Arguments]     ${RespNPA}  ${RespNXX}      ${Req_XXXX}     ${RespXXXX}      ${token}       ${diff}
    ${XXXX_Range}     evaluate    ${Req_XXXX}+${diff}
    ${numbers}=     Evaluate    random.sample([unicode(x) for x in range(${Req_XXXX}, ${XXXX_Range})], ${diff})    random
    :FOR   ${i}   IN RANGE   0      ${diff}
    \       ${XXXX_length}  get length      ${numbers[${i}]}
    \       ${status}   run keyword and return status   should be true      ${XXXX_length}==4
    \       run keyword if  ${status}==False    Appending Zeroes For Line Number     ${XXXX_Length}        ${numbers}      ${i}
    \       log     ${numbers}
    \       ${resp}   do number query  ${token}     ${RespNPA}${RespNXX}${numbers[${i}]}     ${successresponse}
    \       ${status}   get from dictionary  ${resp}        status
    \       should not be equal     ${status}       ${SPARE}

Number Status Query
    [Arguments]      ${responseBody}      ${Req_XXXX}       ${token}
    ${Num}      get from dictionary          ${responseBody}        numList
    ${RespNPA}     Get Substring           ${Num[0]}      0       3
    ${RespNXX}     Get Substring           ${Num[0]}      3       6
    ${RespXXXX}     Get Substring           ${Num[0]}      6       10
    ${Resp_Line}     convert to integer      ${RespXXXX}
    ${Req_Line}     convert to integer       ${Req_XXXX}
    ${diff}     evaluate  ${Resp_Line} - ${Req_Line}
    ${status}   run keyword and return status   should be true      ${diff} > 5
    run keyword if  ${status}==True     Status Validation For Length Greater Than Five       ${RespNPA}  ${RespNXX}  ${Req_Line}     ${Resp_Line}     ${token}
    run keyword if  ${status}==False     Status Validation For Length Less Than Five      ${RespNPA}  ${RespNXX}  ${Req_Line}     ${Resp_Line}     ${token}       ${diff}


TFNs Validate Specific NPA_NXX_XXXX
    [Arguments]      ${responseBody}     ${Req_NPA}      ${Req_NXX}      ${Req_XXXX}        ${token}     ${Req_Qty}
    ${ANDresponse}     GET METHOD      ${token}     ${AND_URI}        ${SuccessResponse}
    ${NPA_List}     Get NPA list        ${ANDresponse}
    ${Num}      get from dictionary          ${responseBody}        numList
    ${TFN_Length}     get length      ${Num}
    ${Req_Qty}      convert to integer      ${Req_Qty}
    should be equal        ${TFN_Length}       ${Req_Qty}
    ${status}       run keyword and return status       should be equal        ${TFN_Length}       ${Req_Qty}
    run keyword if      ${status}==False        validation for error message    ${responseBody}     ${NUS_CannotFoundReqQty_ErrMsg}     ${WARNING}        ${NUS_CannotFoundReqQty_ErrCode}
    :FOR   ${i}   IN RANGE   0      ${TFN_Length}
    \       ${RespNPA}     Get Substring           ${Num[${i}]}      0       3
    \       should be equal         ${RespNPA}      ${Req_NPA}
    \       ${RespNXX}     Get Substring           ${Num[${i}]}      3       6
    \       should be true          ${RespNXX}>=${Req_NXX}
    \       ${RespXXXX}     Get Substring           ${Num[${i}]}      6       10
    \       ${RespXXXX}     convert to integer      ${RespXXXX}
    \       ${Req_XXXX}     convert to integer       ${Req_XXXX}
    \       should be true         ${RespXXXX}>=${Req_XXXX}


TFNs Validate Specific NPA_NXX
    [Arguments]         ${responseBody}     ${Req_NPA}      ${Req_NXX}      ${token}     ${Req_Qty}
    ${ANDresponse}     GET METHOD      ${token}     ${AND_URI}        ${SuccessResponse}
    ${NPA_List}     Get NPA list        ${ANDresponse}
    ${Num}      get from dictionary          ${responseBody}        numList
    ${TFN_Length}     get length      ${Num}
    ${Req_Qty}      convert to integer      ${Req_Qty}
    should be equal        ${TFN_Length}       ${Req_Qty}
    :FOR   ${i}   IN RANGE   0      ${TFN_Length}
    \       ${RespNPA}     Get Substring           ${Num[${i}]}      0       3
    \       should be equal         ${RespNPA}      ${Req_NPA}
    \       ${RespNXX}     Get Substring           ${Num[${i}]}      3       6
    \       should be true          ${RespNXX}>=${Req_NXX}

TFNs Validate NPA_XXXX
    [Arguments]      ${responseBody}     ${Req_NPA}      ${Req_XXXX}        ${token}     ${Req_Qty}
    ${ANDresponse}     GET METHOD      ${token}     ${AND_URI}        ${SuccessResponse}
    ${NPA_List}     Get NPA list        ${ANDresponse}
    ${Num}      get from dictionary          ${responseBody}        numList
    ${TFN_Length}     get length      ${Num}
    ${Req_Qty}      convert to integer      ${Req_Qty}
    ${ErrorMsgsList}        create list     ${ReservationLimitExceededErrMsg}       ${NUS_CannotFoundReqQty_ErrMsg}
    ${WarnList}     create list     ${WARNING}      ${WARNING}
    ${ErrorCodesList}       create list     ${ReservationLimitExceededErrCode}          ${NUS_CannotFoundReqQty_ErrCode}
    ${status}       run keyword and return status       should be equal        ${TFN_Length}       ${Req_Qty}
    ${status1}      run keyword and return status       run keyword if      ${status}==False        validation for multiple error messages      ${responseBody}     ${ErrorMsgsList}        ${ErrorCodesList}       ${WarnList}
    run keyword if      ${status1}==False        validation for error message    ${responseBody}     ${NUS_CannotFoundReqQty_ErrMsg}     ${WARNING}        ${NUS_CannotFoundReqQty_ErrCode}
    :FOR   ${i}   IN RANGE   0      ${TFN_Length}
    \       ${RespNPA}     Get Substring           ${Num[${i}]}      0       3
    \       ${NPA_Status}     run keyword and return status         should be equal         ${RespNPA}      ${Req_NPA}
    \       run keyword if        ${NPA_Status}==False    list should contain value       ${NPA_List}     ${RespNPA}
    \       ${RespXXXX}     Get Substring           ${Num[${i}]}      6       10
    \       ${RespXXXX}     convert to integer      ${RespXXXX}
    \       ${Req_XXXX}     convert to integer       ${Req_XXXX}
    \       should be true          ${RespXXXX}>=${Req_XXXX}

TFNs Validate Specific NPA_XXXX
    [Arguments]      ${responseBody}     ${Req_NPA}      ${Req_XXXX}        ${token}     ${Req_Qty}
    ${Num}      get from dictionary          ${responseBody}        numList
    ${TFN_Length}     get length      ${Num}
    ${Req_Qty}      convert to integer      ${Req_Qty}
    should be equal        ${TFN_Length}       ${Req_Qty}
    :FOR   ${i}   IN RANGE   0      ${TFN_Length}
    \       ${RespNPA}     Get Substring           ${Num[${i}]}      0       3
    \       should be equal         ${RespNPA}      ${Req_NPA}
    \       ${RespXXXX}     Get Substring           ${Num[${i}]}      6       10
    \       ${RespXXXX}     convert to integer      ${RespXXXX}
    \       ${Req_XXXX}     convert to integer       ${Req_XXXX}
    \       should be true          '${RespXXXX}'>='${Req_XXXX}'

TFNs Validation Specific NPA
    [Arguments]         ${responseBody}     ${Req_NPA}      ${token}          ${Req_Qty}
    ${Num}      get from dictionary          ${responseBody}        numList
    ${TFN_Length}     get length      ${Num}
    ${Req_Qty}      convert to integer      ${Req_Qty}
    should be equal        ${TFN_Length}       ${Req_Qty}
    :FOR   ${i}      IN RANGE    0      ${TFN_Length}
    \       ${Resp_NPA}     Get Substring           ${Num[${i}]}      0       3
    \       should be equal         ${Resp_NPA}      ${Req_NPA}

TFNs Validation Random NPA
    [Arguments]         ${responseBody}     ${Req_NPA}      ${token}          ${Req_Qty}
    ${ANDresponse}     GET METHOD      ${token}     ${AND_URI}        ${SuccessResponse}
    ${NPA_List}     Get NPA list        ${ANDresponse}
    ${Num}      get from dictionary          ${responseBody}        numList
    ${TFN_Length}     get length      ${Num}
    ${Req_Qty}      convert to integer      ${Req_Qty}
    should be equal        ${TFN_Length}       ${Req_Qty}
    :FOR   ${i}      IN RANGE    0      ${TFN_Length}
    \       ${RespNPA}     Get Substring           ${Num[${i}]}      0       3
    \       ${NPA_Status}     run keyword and return status         should be equal         ${RespNPA}      ${Req_NPA}
    \       run keyword if        ${NPA_Status}==False    list should contain value       ${NPA_List}     ${RespNPA}

TFNs Validate Specific NXX_XXXX
    [Arguments]         ${responseBody}     ${Req_NXX}      ${Req_XXXX}      ${token}     ${Req_Qty}        ${Req_NPA}
    ${ANDresponse}     GET METHOD      ${token}     ${AND_URI}        ${SuccessResponse}
    ${NPA_List}     Get NPA list        ${ANDresponse}
    ${Num}      get from dictionary          ${responseBody}        numList
    ${TFN_Length}     get length      ${Num}
    ${Req_Qty}      convert to integer      ${Req_Qty}
    should be equal        ${TFN_Length}       ${Req_Qty}
    :FOR   ${i}   IN RANGE   0      ${TFN_Length}
    \       ${RespNPA}     Get Substring           ${Num[${i}]}      0        3
    \       ${NPA_Status}     run keyword and return status         should be equal         ${RespNPA}      ${Req_NPA}
    \       run keyword if        ${NPA_Status}==False    list should contain value       ${NPA_List}     ${RespNPA}
    \       ${RespNXX}     Get Substring           ${Num[${i}]}      3        6
    \       should be true          ${RespNXX}>=${Req_NXX}
    \       ${RespXXXX}     Get Substring           ${Num[${i}]}      6       10
    \       ${RespXXXX}     convert to integer       ${RespXXXX}
    \       ${Req_XXXX}     convert to integer       ${Req_XXXX}
    \       should be true          ${RespXXXX}>=${Req_XXXX}

Get TFNS list
    [Arguments]         ${NPA}     ${NXX}      ${NoOf_NPS}
    ${TFN_List}     create List
    :FOR   ${i}      IN RANGE    0      ${NoOf_NPS}
    \       ${XXXX}     Get Random String   4       0123456789
    \       ${TFN}     catenate    ${NPA}${NXX}${XXXX}
    \       append to list          ${TFN_List}         ${TFN}
    log     ${TFN_List}
    [Return]    ${TFN_List}

Consecutive Numbers Validation
    [Arguments]     ${response_body}
    ${numList}      get from dictionary     ${response_body}    numList
#    ${SortedList}     sort list  ${numList}
#    ${length}   get length  ${SortedList}
    ${length}   get length  ${numList}
    :FOR    ${i}    IN RANGE    0   ${length}-1
    \   ${FirstNumber}    get from list   ${numList}  ${i}
    \   ${SecondNumberIndex}    evaluate  ${i}+1
    \   ${SecondNumber}   get from list   ${numList}  ${SecondNumberIndex}
    \   ${Diff}   evaluate    ${SecondNumber}-${FirstNumber}
    \   should be true    ${Diff}==${1}

Update NPA
    [Arguments]     ${oauthToken}         ${NPA}        ${NPA_Update}       ${recVersionId}
    ${requestData}=    evaluate    json.loads('''${NPA_Update}''')    json
    set to dictionary       ${requestData}     startNPA=${NPA}
    set to dictionary        ${requestData}     recVersionId=${recVersionId}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${responseBody}     PUT Method          ${oauthToken}      ${AND_URI}     ${reqBody}     ${SuccessResponse}
    [Return]        ${responseBody}

Set Start NPA
    [Arguments]     ${token}        ${NPA}      ${recVersionId}
    ${updateResponse}     Update NPA      ${token}         ${NPA}        ${AND_NPA_UpdateReqBody}      ${recVersionId}
    ${response}     GET METHOD      ${token}     ${AND_URI}        ${SuccessResponse}
    dictionary should contain key       ${response}     startNPA
    ${startNPA}     get from dictionary     ${response}         startNPA
    should be equal         ${startNPA}     ${NPA}
    [Return]    ${startNPA}


Get Active RespOrg ID
    [Arguments]     ${oauthToken}
    ${respOrgUnitList}     GET METHOD      ${oauthToken}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_UNIT}   ${successResponse}
    ${respOrgUnitListResponse}    get from dictionary  ${respOrgUnitList}     respOrgList
    ${listLength}       get length      ${respOrgUnitListResponse}
    ${Active_respOrgId}    set variable    0
    :FOR   ${i}      IN RANGE    0  ${listLength}
    \   ${status}      get from dictionary     ${respOrgUnitList['respOrgList'][${i}]}     status
    \   ${Active_respOrgId}        get from dictionary     ${respOrgUnitList['respOrgList'][${i}]}     respOrgId
    \   ${status}       run keyword and return status   run keywords      should be equal         ${status}       ACTIVE        AND     should not be equal as integers          ${Active_respOrgId}        0123456789
    \   run keyword if      ${status}==True           run keywords      log         ${Active_respOrgId}      AND       exit for loop
    \   ...     ELSE    continue for loop
    [Return]            ${Active_respOrgId}

ADD New NPA
    [Arguments]     ${oauthToken}         ${NPA}        ${NPA_ADDReqBody}       ${Response}
    ${requestData}=    evaluate    json.loads('''${NPA_ADDReqBody}''')    json
    set to dictionary           ${requestData}      addNPAList=[${NPA}]
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${reqBody}     replace string      ${reqBody}      "[      ["
    ${reqBody}     replace string      ${reqBody}      ]"      "]
    ${responseBody}     PUT Method          ${oauthToken}      ${AND_URI}     ${reqBody}     ${Response}
    [Return]        ${responseBody}

Get CAG Details For CIC-0110
   [Arguments]      ${token}
   ${resp}      GET METHOD    ${token}     ${GET_CAG_LIST}       ${SuccessResponse}
   log      ${resp}
   ${cicLst}        get from dictionary      ${resp}          cicList
   ${netWrkIdForCIC_0110}            set variable    0
   ${cicListLength}     get length      ${cicLst}
   :FOR     ${i}    IN RANGE    0           ${cicListLength}
   \    ${cicCode}      get from dictionary          ${cicLst[${i}]}      cicCode
   \    ${cicCodeValidation}      run keyword and return status   should be equal         ${cicCode}        ${cicCode_0110}
   \    ${netWrkIdForCIC_0110}        run keyword if          ${cicCodeValidation}==True         get from dictionary          ${cicLst[${i}]}      netWrkId
   \    run keyword if          ${cicCodeValidation}==False         continue for loop
   \    log         ${netWrkIdForCIC_0110}
   \    ${retrieveResp}     GET Method     ${token}    ${GNA_RETRIEVE_URI}${cicCode_0110}?netWrkId=${netWrkIdForCIC_0110}          ${Successresponse}
   \    should not be empty         ${retrieveResp}
   \    ${GNAStatus}        run keyword and return status   dictionary should contain key           ${retrieveResp}         errList
   \    run keyword if          ${GNAStatus}==True     exit for loop
   log         ${netWrkIdForCIC_0110}
  [Return]     ${netWrkIdForCIC_0110}

Get CIS-0110 Details
   [Arguments]      ${token}
   ${retrieveResp}      GET METHOD      ${token}       ${GET_CIS_ACNA_RETRIEVE}OTC      ${SuccessResponse}
   log     ${retrieveResp}
   ${recVersionId}      get from dictionary  ${retrieveResp}        recVersionId
   ${otcNtwrkIds}       get from dictionary          ${retrieveResp}       otcNtwrkIds
   ${otcNtwrkIdsLengt}      get length       ${otcNtwrkIds}
   ${netWrkId}      set variable  0
   ${respOrgId}     set variable  0
   : FOR      ${i}      IN RANGE        0           ${otcNtwrkIdsLengt}
   \    ${netWrkId}      get from dictionary         ${otcNtwrkIds[${i}]}         netWrkId
   \    ${respOrgId}      get from dictionary         ${otcNtwrkIds[${i}]}         respOrg
   \    ${CAGretrieveResp}      GET METHOD      ${token}       ${GET_CAG_RETRIEVE}${cicCode_0110}${networkParam}${netWrkId}      ${SuccessResponse}
   \    log     ${CAGretrieveResp}
   \    ${CAGStatus}        run keyword and return status   dictionary should not contain key  ${CAGretrieveResp}     cagEntityList
   \    run keyword if      ${CAGStatus}==True     exit for loop
   ${otcPrmryCICRec}        get from dictionary         ${retrieveResp}         otcPrmryCICRec
   ${status}        get from dictionary         ${otcPrmryCICRec}       status
   ${translation}       get from dictionary         ${otcPrmryCICRec}       translation
   [Return]     ${retrieveResp}     ${netWrkId}      ${respOrgId}       ${status}       ${translation}       ${recVersionId}

Delete And Create Existing CAG
    [Arguments]         ${adminUserOauthToken}          ${netWrkIdForCIC_0110}
    ${retrieveResp_cagEnttyLst}         Delete And Retrieve CAG For CIC-0110        ${adminUserOauthToken}       ${netWrkIdForCIC_0110}
    ${createResp}       Create CAG For CIC-0110    ${adminUserOauthToken}        ${netWrkIdForCIC_0110}       ${retrieveResp_cagEnttyLst}        ${SuccessResponse}
    should not be empty             ${createResp}
    ${recversionId}     get from dictionary         ${createResp}       recVersionId
    ${retrieveResp}     GET METHOD      ${adminUserOauthToken}       ${GET_CAG_RETRIEVE}${cicCode_0110}${networkParam}${netWrkIdForCIC_0110}      ${SuccessResponse}
    log     ${retrieveResp}
    ${retrieveResp_cagEnttyLst}     get from dictionary  ${retrieveResp}     cagEntityList
    log     ${retrieveResp_cagEnttyLst}
    should not be empty     ${retrieveResp_cagEnttyLst}
    should be equal         ${retrieveResp_cagEnttyLst}          ${retrieveResp_cagEnttyLst}
    ${recVersionIdCAG}     get from dictionary         ${createResp}       recVersionId
    should be equal         ${recVersionIdCAG}         ${recversionId}
    [Return]        ${netWrkIdForCIC_0110}          ${retrieveResp_cagEnttyLst}     ${recVersionIdCAG}

Create CAG with Existing CIS
    [Arguments]         ${adminUserOauthToken}
    ${cagEntity}     Get One Resporg Entity From List     ${adminUserOauthToken}
    ${cagEnttyLst}      create list     ${cagEntity}
    ${retrieveRespBeforeDelete}         ${netWrkIdForCIC_0110}      ${respOrgId}      ${status}       ${translation}         ${recVersionId}      Get CIS-0110 Details         ${adminUserOauthToken}
    ${createResp}       Create CAG For CIC-0110    ${adminUserOauthToken}        ${netWrkIdForCIC_0110}       ${cagEnttyLst}        ${SuccessResponse}
    should not be empty             ${createResp}
    ${recVersionIdCAG}     get from dictionary         ${createResp}       recVersionId
    ${retrieveResp}     GET METHOD      ${adminUserOauthToken}       ${GET_CAG_RETRIEVE}${cicCode_0110}${networkParam}${netWrkIdForCIC_0110}      ${SuccessResponse}
    log     ${retrieveResp}
    ${retrieveResp_cagEnttyLst}     get from dictionary  ${retrieveResp}     cagEntityList
    log     ${retrieveResp_cagEnttyLst}
    should not be empty     ${retrieveResp_cagEnttyLst}
    should be equal         ${retrieveResp_cagEnttyLst}          ${cagEnttyLst}
    ${CAGretrieveRecversionId}     get from dictionary         ${createResp}       recVersionId
    should be equal         ${CAGretrieveRecversionId}         ${recVersionIdCAG}
    [Return]        ${netWrkIdForCIC_0110}          ${cagEnttyLst}      ${recVersionIdCAG}

Delete And Retrieve CAG For CIC-0110
   [Arguments]       ${token}      ${netWrkIdForCIC}
   ${retrieveResp}      GET METHOD      ${token}       ${GET_CAG_RETRIEVE}${cicCode_0110}${networkParam}${netWrkIdForCIC}      ${SuccessResponse}
   log     ${retrieveResp}
   ${retrieveResp_cagEnttyLst}     get from dictionary  ${retrieveResp}     cagEntityList
   log     ${retrieveResp_cagEnttyLst}
   should not be empty     ${retrieveResp_cagEnttyLst}
   ${recVersionId}      get from dictionary  ${retrieveResp}        recVersionId
   ${delresp}      Delete CAG      ${token}       ${cicCode_0110}${recVersionId_URI}${recVersionId}${networkParam}${netWrkIdForCIC}      ${SuccessResponse}
   should be empty     ${delresp}
   ${retrieveResp}     GET METHOD      ${token}       ${GET_CAG_RETRIEVE}${cicCode_0110}${networkParam}${netWrkIdForCIC}      ${SuccessResponse}
   log     ${retrieveResp}
   dictionary should contain key         ${retrieveResp}        errList
   validation for error message         ${retrieveResp}         ${NonExistingCAGRetrieveErrMsg}         ${ERROR}        ${NonExistingCAGRetrieveErrCode}
   [Return]         ${retrieveResp_cagEnttyLst}

Create CAG For CIC-0110
    [Arguments]         ${token}        ${netWrkIdForCIC_0110}          ${Entity_List}          ${responseCode}
    ${requestData}    evaluate    json.loads('''${ReqDataForCAGCreate}''')    json
    set to dictionary   ${requestData}      cicCode=${cicCode_0110}
    set to dictionary   ${requestData}      netWrkId=${netWrkIdForCIC_0110}
    set to dictionary       ${requestData}       cagEntityList=${Entity_List}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method         ${token}        ${POST_CAG_CREATE}      ${reqBody}      ${responseCode}
    log     ${resp}
    [Return]        ${resp}

Get One Resporg Entity From List
    [Arguments]         ${adminUserOauthToken}
    ${respOrgEntityList}  GET METHOD      ${adminUserOauthToken}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}   ${successResponse}
    ${respOrgEntityLst}    get from dictionary  ${respOrgEntityList}   respOrgList
    ${respOrgEntity}        get from list       ${respOrgEntityLst}         0
    ${respOrgEntity}    get from dictionary  ${respOrgEntity}   respOrgEntity
    [Return]        ${respOrgEntity}

Delete GNA For CIC-0110 And Get GNA Details
   [Arguments]      ${token}
   ${resp}      GET METHOD    ${token}     ${GET_List_GNA}       ${SuccessResponse}
   log      ${resp}
   ${keyList}        get from dictionary      ${resp}          keyLst
   ${netWrkIdForCIC_0110}            set variable    0
   ${cicListLength}     get length      ${keyList}
   :FOR     ${i}    IN RANGE    0           ${cicListLength}
   \    ${cicCode}      get from dictionary          ${keyList[${i}]}      cicCode
   \    ${cicCodeValidation}      run keyword and return status   should be equal         ${cicCode}        ${cicCode_0110}
   \    ${netWrkIdForCIC_0110}        run keyword if          ${cicCodeValidation}==True         get from dictionary          ${keyList[${i}]}      netWrkId
   \    run keyword if          ${cicCodeValidation}==True        exit for loop
   log         ${netWrkIdForCIC_0110}
   ${retrieveResp}      GET METHOD      ${token}       ${GET_Retrieve_GNA}${cicCode_0110}${networkParam}${netWrkIdForCIC_0110}      ${SuccessResponse}
   log     ${retrieveResp}
   ${recVersionId}      get from dictionary         ${retrieveResp}             recVersionId
  # ${requestData}    evaluate    json.loads('''${retrieveResp}''')    json
   remove from dictionary        ${retrieveResp}     recVersionId
   ${dlvryMthdsToCar}       get from dictionary  ${retrieveResp}     dlvryMthdsToCar
   remove from dictionary       ${dlvryMthdsToCar}     apprvl
   ${ntfy}       get from dictionary  ${dlvryMthdsToCar}     ntfy
   remove from dictionary       ${ntfy}     mgicli
   ${reqBody}    evaluate    json.dumps(${retrieveResp})             json
   log      ${reqBody}
   ${carrierActions}     get from dictionary  ${retrieveResp}     carrierActions
   log     ${carrierActions}
   should not be empty     ${carrierActions}
   ${requestData}=    evaluate    json.loads('''${ReqbodyForGNADelete}''')    json
   set to dictionary     ${requestData}     cicCode=${cicCode_0110}
   set to dictionary     ${requestData}      netWrkId=${netWrkIdForCIC_0110}
   set to dictionary     ${requestData}     recVersionId=${recVersionId}
   ${requestData}=    evaluate    json.dumps(${requestData})    json
   ${deleteResp}  PUT Method      ${token}      ${GNA_DELETE_URI}      ${requestData}         ${SuccessResponse}
   should be empty     ${deleteResp}
   ${retrieveResp}     GET METHOD      ${token}       ${GET_Retrieve_GNA}${cicCode_0110}${networkParam}${netWrkIdForCIC_0110}      ${SuccessResponse}
   log     ${retrieveResp}
   dictionary should contain key         ${retrieveResp}        errList
   Validation For Error Message         ${retrieveResp}      ${NonExistingGNARetrieveErrMsg}      ${ERROR}      ${NonExistingGNARetrieveErrCode}
   [Return]     ${netWrkIdForCIC_0110}          ${reqBody}

Validate GNA Retrieve Response
    [Arguments]     ${token}        ${cicCode}           ${requestData}        ${retrieveResp}          ${input_recVersionId}
    ${respCICcode}      get from dictionary         ${retrieveResp}         cicCode
    should be equal         ${cicCode}              ${respCICcode}
    ${resp_recVersionId}     get from dictionary         ${retrieveResp}         recVersionId
    should be equal             ${resp_recVersionId}            ${input_recVersionId}
    ${status}       run keyword and return status       should be equal         ${respCICcode}          0110
    ${respNetWrkId}     run keyword if          ${status}==True           get from dictionary         ${retrieveResp}     netWrkId
    ${reqNetWrkId}     run keyword if          ${status}==True           get from input          ${requestData}      netWrkId
    run keyword if          ${status}==True           should be equal         ${respNetWrkId}      ${reqNetWrkId}
    ${respCarrierActions}       get from dictionary         ${retrieveResp}           carrierActions
    ${requestCarrierActions}  get json value  ${requestData}    /carrierActions
    ${carrierActionsExpectedParametersList}       create list         addRtng     pssblRtng       delRtngWork     delRtngDscnt        respChng
    ${numOfParametersInList}        get length          ${carrierActionsExpectedParametersList}
    log     ${numOfParametersInList}
    :FOR   ${i}   IN RANGE   0   ${numOfParametersInList}
    \   ${parameter}     get from list       ${carrierActionsExpectedParametersList}      ${i}
    \   ${resp}      get from dictionary             ${respCarrierActions}        ${parameter}
    \   ${req}  get from input         ${requestCarrierActions}           ${parameter}
    \   should be equal         ${resp}              ${req}
    ${respDlvryMthdsToCar}       get from dictionary         ${retrieveResp}           dlvryMthdsToCar
    ${requestDlvryMthdsToCar}  get json value  ${requestData}    /dlvryMthdsToCar
    ${respNtfy}       get from dictionary         ${respDlvryMthdsToCar}           ntfy
    ${requestNtfy}  get json value  ${requestDlvryMthdsToCar}    /ntfy
    ${respOnline}      get from dictionary             ${respNtfy}        online
    ${reqOnline}  get from input         ${requestNtfy}           online
    should be equal             ${respOnline}           ${reqOnline}
    return from keyword if            ${status}==True
    ${respApprvl}       get from dictionary         ${respDlvryMthdsToCar}           apprvl
    ${requestApprvl}  get json value  ${requestDlvryMthdsToCar}    /apprvl
    ${respMgicli}      get from dictionary             ${respApprvl}        mgicli
    ${reqMgicli}  get from input         ${requestApprvl}           mgicli
    should be equal             ${respMgicli}           ${reqMgicli}
    ${respOnline}      get from dictionary             ${respApprvl}        online
    should be equal         ${respOnline}           Y

Delete ENA For CIC-0110 And Get ENA Details
    [Arguments]      ${token}
    ${resp}      GET METHOD    ${token}     ${GET_List_GNA}       ${SuccessResponse}
    log      ${resp}
    ${keyList}        get from dictionary      ${resp}          keyLst
    ${netWrkIdForCIC_0110}            set variable    0
    ${cicListLength}     get length      ${keyList}
    :FOR     ${i}    IN RANGE    0           ${cicListLength}
    \    ${cicCode}      get from dictionary          ${keyList[${i}]}      cicCode
    \    ${cicCodeValidation}      run keyword and return status   should be equal         ${cicCode}        ${cicCode_0110}
    \    ${netWrkIdForCIC_0110}        run keyword if          ${cicCodeValidation}==True         get from dictionary          ${keyList[${i}]}      netWrkId
    \    run keyword if          ${cicCodeValidation}==True        exit for loop
    log         ${netWrkIdForCIC_0110}
    ${retrieveResp}      GET METHOD      ${token}       ${GET_Retrieve_GNA}${cicCode_0110}${networkParam}${netWrkIdForCIC_0110}      ${SuccessResponse}
    log     ${retrieveResp}
    ${recVersionId}      get from dictionary         ${retrieveResp}             recVersionId
    remove from dictionary        ${retrieveResp}     recVersionId
    ${dlvryMthdsToCar}       get from dictionary  ${retrieveResp}     dlvryMthdsToCar
    remove from dictionary       ${dlvryMthdsToCar}     apprvl
    ${ntfy}       get from dictionary  ${dlvryMthdsToCar}     ntfy
    remove from dictionary       ${ntfy}     mgicli
    ${reqBody}    evaluate    json.dumps(${retrieveResp})             json
    log      ${reqBody}
    ${carrierActions}     get from dictionary  ${retrieveResp}     carrierActions
    log     ${carrierActions}
    should not be empty     ${carrierActions}
    ${requestData}=    evaluate    json.loads('''${ReqbodyForGNADelete}''')    json
    set to dictionary     ${requestData}     cicCode=${cicCode_0110}
    set to dictionary     ${requestData}      netWrkId=${netWrkIdForCIC_0110}
    set to dictionary     ${requestData}     recVersionId=${recVersionId}
    ${requestData}=    evaluate    json.dumps(${requestData})    json
    ${deleteResp}  PUT Method      ${token}      ${GNA_DELETE_URI}      ${requestData}         ${SuccessResponse}
    should be empty     ${deleteResp}
    ${retrieveResp}     GET METHOD      ${token}       ${GET_Retrieve_GNA}${cicCode_0110}${networkParam}${netWrkIdForCIC_0110}      ${SuccessResponse}
    log     ${retrieveResp}
    dictionary should contain key         ${retrieveResp}        errList
    Validation For Error Message         ${retrieveResp}      ${NonExistingGNARetrieveErrMsg}      ${ERROR}      ${NonExistingGNARetrieveErrCode}
    [Return]     ${netWrkIdForCIC_0110}          ${reqBody}

###################################CAD Keywords############################

Get Reserve Random Number
    [Arguments]    ${token}     ${req_data}
    Log   ${req_data}
    ${responsejsondata}   POST Method   ${token}    /v2/ip/num/tfn/srchres/random     ${req_data}     ${successresponse}
    ${numList}      get from dictionary     ${responsejsondata}   numList
    ${Numb}      get from list       ${numList}      0
    Log  ${responsejsondata}
    sleep   3s
#    ${resp}     Do Number Query         ${token}    ${Numb}    ${SuccessResponse}
#    ${queryResult}     get from dictionary     ${resp}     queryResult
#    ${Status}       get from dictionary     ${queryResult[0]}     status
#    should be equal     ${Status}       ${TFN_status_reserved}
    [Return]        ${Numb}


Get Intra and Inter LATA Carrier
    [Arguments]      ${token}
    ${cicCode}      ${acna}     ${resporgId}        ${recversionIDForCIS}     Create CIS     ${token}        ${ReqDataForCISCreateMandatoryParamas}       B      ACTIVE
    ${respOrgEntity_List}        create list         BR
    ${requestData}    evaluate    json.loads('''${ReqDataForCAGCreate}''')    json
    set to dictionary   ${requestData}      cicCode=${cicCode}
    ${Status}       run keyword and return status       should be equal         ${cicCode}          ${cicCode_0110}
    run keyword if      ${Status}==True            set to dictionary   ${requestData}      netWrkId=${netWrkIdForCIC_0110}
    set to dictionary       ${requestData}       cagEntityList=${respOrgEntity_List}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method         ${token}        ${POST_CAG_CREATE}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    ${interLATACarrier}     create list          ${acna}-${cicCode}
    ${intraLATACarrier}     create list         ${acna}-${cicCode}
    set global variable          ${acna}
    set global variable          ${cicCode}
    set global variable          ${recversionIDForCIS}
    [Return]        ${interLATACarrier}         ${intraLATACarrier}     ${cicCode}      ${acna}     ${recversionIDForCIS}

Get Telco
    [Arguments]     ${token}
    ${listTelco}     get method  ${token}    ${GET_LIST_TCO}   ${successresponse}
    ${TCOList}  get from dictionary     ${listTelco}    telcoLst
    ${telco}      get from dictionary       ${TCOList[0]}       telco
    [Return]    ${telco}

Future Effective Date and Time
    ${Date}    get current Date
    ${Date_Time}        Add Time To Date    ${Date}   20 days
    ${Date_Time}        evaluate  '${Date_Time}'.replace(' ','T')
    ${Date_Time}        fetch from left     ${Date_Time}     :
    ${Date_Time}        Catenate    ${Date_Time}:00Z
    [Return]        ${Date_Time}

Validation for Customer Record Create Response
   [Arguments]    ${responsedata}     ${EFF_Date_Time}     ${ReserveTFN}       ${status}      ${USER}     ${Entity}     ${custRecCompPart}
   ${recVersionId}      get from dictionary      ${responsedata}     recVersionId
   ${custRecTFN}      get from dictionary      ${responsedata}     num
   ${effDtTm}      get from dictionary      ${responsedata}     effDtTm
   get from dictionary      ${responsedata}     effDtTm
   ${lstEffDtTms}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     effDtTm
   ${custRecordStatus}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     custRecStat
   ${custRecCompPart}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     custRecCompPart
   ${apprStat}              get from dictionary         ${responsedata["lstEffDtTms"][0]}     apprStat
   ${createdUser}          get from dictionary     ${responsedata}     lastUsr
   ${custRecEntity}          get from dictionary      ${responsedata}         custRecEntity
   should be equal       ${custRecTFN}      ${ReserveTFN}
   should be equal       ${effDtTm}      ${EFF_Date_Time}
   should be equal       ${custRecordStatus}      ${status}
   #should be equal       ${createdUser}      ${USER}
   should be equal       ${custRecEntity}      ${Entity}
   should be equal       ${custRecCompPart}         ${custRecCompPart}
   @{CR_CreatedResponse_Values}       Create List       ${recVersionId}       ${custRecTFN}    ${effDtTm}  ${lstEffDtTms}  ${custRecordStatus}  ${apprStat}  ${custRecCompPart}
   [Return]     @{CR_CreatedResponse_Values}

Customer Record Retrieve with TFN
   [Arguments]         ${token}        ${TFN}
#   ${second}     fetch from right   ${GET_CAD_VIEW}   /v2/ip/
#    ${GET_CAD_VIEW}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_CAD_VIEW}
   ${responsedata}      GET Method With Sync Timeout      ${token}     ${GET_CAD_VIEW}${TFN}   ${SuccessResponse}   ${POST_CAD_Create}
   log     ${responsedata}
   [Return]     ${responsedata}

Get Customer Record Retrieve List
   [Arguments]     ${responsedata}      ${expectedNumStatus}        ${expectedPriorityStatus}       ${expectedHldndFlagStatus}
   ${recVersionId}      get from dictionary      ${responsedata}     recVersionId
   ${numStatus}         get from dictionary     ${responsedata}     numStatus
   #common Response
   ${custRecTFN}      get from dictionary      ${responsedata}     num
   ${effDtTm}      get from dictionary      ${responsedata}     effDtTm
   ${lstEffDtTms}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     effDtTm
   ${custRecordStatus}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     custRecStat
   ${custRecCompPart}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     custRecCompPart
   ${apprStat}              get from dictionary         ${responsedata["lstEffDtTms"][0]}     apprStat
   #${createdUser}          get from dictionary     ${responsedata}     lastUsr
   #Extra in Retrieve
   ${RespOrgId}      get from dictionary      ${responsedata}     ctrlRespOrgId
   ${interLATACarrier}          get from dictionary      ${responsedata}         interLATACarrier
   ${intraLATACarrier}          get from dictionary      ${responsedata}         intraLATACarrier
   ${svcOrderNum}          get from dictionary      ${responsedata}         svcOrderNum
   ${suppFormNum}          get from dictionary      ${responsedata}         suppFormNum
   ${telco}          get from dictionary      ${responsedata}         telco
   ${notes}          get from dictionary      ${responsedata}         notes
   ${agent}          get from dictionary      ${responsedata}         agent
   ${endSubAddr}          get from dictionary      ${responsedata}         endSubAddr
   ${conName}          get from dictionary      ${responsedata}         conName
   ${conTel}          get from dictionary      ${responsedata}         conTel
   ${onAccCust}          get from dictionary      ${responsedata}         onAccCust
   ${destNums}              get from dictionary      ${responsedata}         destNums
   ${aos}               get from dictionary         ${responsedata}         aos
   ${priority}          get from dictionary         ${responsedata}         priority
   ${hldIndFlag}        get from dictionary         ${responsedata}         hldIndFlag
   should be equal      ${numStatus}        ${expectedNumStatus}
   should be equal      ${priority}         ${expectedPriorityStatus}
   should be equal      ${hldIndFlag}       ${expectedHldndFlagStatus}
   ${CR_retrieveResponse_Values}       Create List              ${recVersionId}         ${custRecTFN}    ${effDtTm}  ${lstEffDtTms}  ${custRecordStatus}  ${apprStat}     ${custRecCompPart}
   ${CR_retrieveResponseList}          Create list          ${RespOrgId}        ${interLATACarrier}         ${intraLATACarrier}     ${svcOrderNum}      ${suppFormNum}      ${telco}    ${notes}    ${agent}    ${endSubAddr}    ${conName}     ${conTel}   ${onAccCust}     ${aos}     ${destNums}
   [Return]        ${CR_retrieveResponse_Values}       ${CR_retrieveResponseList}

Remove '-' and ':' From EffDate
    #[Documentation]     ${responsedata} -> raw response we get from IMS
    [Arguments]     ${EffDate}
    ${Modified_Date}=   Replace String Using Regexp     ${EffDate}  -    ${EMPTY}    count=2
    ${Updated_Date}=   Replace String Using Regexp     ${Modified_Date}  :    ${EMPTY}    count=1
    [Return]    ${Updated_Date}

Customer Record Create
   [Arguments]         ${token}      ${Req_body}
   ${responsedata}=    POST Method      ${token}     ${POST_LAD_Create}     ${Req_body}       ${SuccessResponse}
   should not be empty        ${responsedata}
   log    ${responsedata}
   [Return]      ${responsedata}

Create CR Request Body
   [Arguments]         ${token}        ${ReserveTFN}    ${EFF_Date_Time}    ${interLATACarrier}   ${intraLATACarrier}   ${respOrg}  ${telco}   ${NPA}   ${ReqBody_skeleton}
   ${requestData}    evaluate    json.loads('''${ReqBody_skeleton}''')    json
   set to dictionary        ${requestData}           num=${ReserveTFN}
   set to dictionary        ${requestData}          effDtTm=${EFF_Date_Time}
   set to dictionary        ${requestData}          interLATACarrier=${interLATACarrier}
   set to dictionary        ${requestData}          intraLATACarrier=${intraLATACarrier}
   set to dictionary        ${requestData}          newRespOrgId=${respOrg}
   set to dictionary        ${requestData}          telco=${telco}
   set to dictionary        ${requestData["aos"]}       aosNPA=${NPA}
   set to dictionary        ${requestData["destNums"][0]}  destNum=${ReserveTFN}
   ${Req_body}=    evaluate    json.dumps(${requestData})    json
   [Return]      ${Req_body}

CR GET ReqBodyParams
   [Arguments]         ${token}       ${Req_body}
   ${requestData}    evaluate    json.loads('''${Req_body}''')    json
   ${svcOrderNum}      get from dictionary      ${requestData}     svcOrderNum
   ${suppFormNum}      get from dictionary      ${requestData}     suppFormNum
   ${telco}      get from dictionary      ${requestData}     telco
   ${notes}      get from dictionary      ${requestData}     notes
   ${agent}      get from dictionary      ${requestData}     agent
   ${onAccCust}      get from dictionary      ${requestData}     onAccCust
   ${endSubAddr}      get from dictionary      ${requestData}     endSubAddr
   ${conName}      get from dictionary      ${requestData}     conName
   ${conTel}      get from dictionary      ${requestData}     conTel
   ${aos}               get from dictionary         ${requestData}         aos
   ${destNums}      get from dictionary      ${requestData}     destNums

   ${Req_body}=    evaluate    json.dumps(${requestData})    json
   log    ${Req_body}
   [Return]      ${svcOrderNum}   ${suppFormNum}    ${telco}  ${notes}  ${agent}  ${onAccCust}   ${endSubAddr}   ${conName}     ${conTel}    ${aos}    ${destNums}

Validate CR non creation
   [Arguments]         ${token}        ${ReserveTFN}
   ${retrieveResponseData}          Customer Record Retrieve with TFN      ${token}        ${ReserveTFN}
   should not be empty    ${retrieveResponseData}
   ${status}           run keyword and return status   dictionary should contain key      ${retrieveResponseData}      errList
   run keyword if      ${status}==True     validation for error message     ${retrieveResponseData}      ${CAD_CR_Missing_ErrMsg}     ${ERROR}    ${CAD_CR_Missing_ErrCode}
   #  In REG environment , the TFN returns to Spare after the CR has been deleted.
   ${numStatus_value}       get from dictionary      ${retrieveResponseData}     numStatus
   should be equal          ${numStatus_value}       ${TFN_status_reserved}

Customer Record Delete
   [Arguments]         ${token}        ${ReserveTFN}      ${EFF_Date_Time}        ${recVersionId}       ${ResponseCode}
   ${Eff_Date_Time_string}        Remove '-' and ':' From EffDate       ${EFF_Date_Time}
#   ${recVersionId}      catenate    ${recVersionId}?toSpare=Y
   ${delResponseData}=    delete method     ${token}     ${DEL_LAD_Delete}       /tfnum/${ReserveTFN}/effDtTm/${Eff_Date_Time_string}       ${recVersionId}       ${ResponseCode}
   should not be empty        ${delResponseData}
#   # Validating the status of TFN
#   ${numQueryResp}      GET METHOD    ${token}     ${GET_NUSQ_ACTION}${ReserveTFN}     ${SuccessResponse}
#   ${statusOfTfnFromQuery}      get from dictionary    ${numQueryResp}   status
#   log      ${statusOfTfnFromQuery}
#   should be equal   ${statusOfTfnFromQuery}    ${SPARE}
   [Return]      ${delResponseData}

Customer Record Delete with toSpare
   [Arguments]         ${token}        ${ReserveTFN}      ${EFF_Date_Time}        ${recVersionId}       ${ResponseCode}   ${toSpareStatus}
   ${Eff_Date_Time_string}        Remove '-' and ':' From EffDate       ${EFF_Date_Time}
   sleep       ${T2_THROTTLING_SLEEP}
    Create Session  endpoint    ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${delResponseData}=  Delete Request  endpoint  ${DEL_ADMIN_LAD_Delete}/tfnum/${ReserveTFN}/effDtTm/${Eff_Date_Time_string}${recVersionId_URI}${recVersionId}?toSpare=${toSpareStatus}     headers=${headers}
    log     ${delResponseData}
    Should Be Equal As Strings  ${delResponseData.status_code}   ${ResponseCode}
    ${jsondata}=  To Json  ${delResponseData.content}
    Log  ${jsondata}
    should not be empty        ${jsondata}
    [Return]    ${jsondata}

Validate deleted CR
   [Arguments]         ${token}      ${delResponseData}      ${ReserveTFN}      ${EFF_Date_Time}
   ${del_CR_TFN}           get from dictionary       ${delResponseData}      num
   should be equal         ${del_CR_TFN}             ${ReserveTFN}
   ${del_CR_EffDtTm}       get from dictionary       ${delResponseData}      effDtTm
   should be equal         ${del_CR_EffDtTm}         ${EFF_Date_Time}

Customer Record Update
    [Arguments]         ${token}      ${PUT_ACTION_URI}     ${req_data}     ${status_code}
    ${response}         PUT Method          ${token}      ${PUT_ACTION_URI}     ${req_data}     ${status_code}
    [Return]        ${response}

Get Invalid NPANXX
    [Arguments]  ${token}
    ${listResponseNXL}    GET METHOD  ${token}  ${GET_NXL_LIST}     ${successResponse}
    ${npaNxxList}  get from dictionary  ${listResponseNXL}    npanxxLst
    ${npaList}      create list
    ${npaNxxListLength}  get length  ${npaNxxList}
    :FOR   ${i}   IN RANGE   0    ${npaNxxListLength}
    \   ${npaValue}     get from dictionary   ${npaNxxList[${i}]}     npa
    \   append to list  ${npaList}   ${npaValue}
    log  ${npaList}
    ${invalidNpa}     Check For Duplicate String  ${npaList}   3   [NUMBERS]     ${EMPTY}     ${EMPTY}
    ${randomNxx}        generate random string  3   [NUMBERS]
    ${invalidNpaNxx}       catenate  ${invalidNpa}${randomNxx}
    [Return]    ${invalidNpaNxx}

Create CR Copy Reqbody
     [Arguments]   ${Request_data}    ${CR_Copy_Req_Body}       ${numOfDays}
#     ${data}=    Evaluate    json.loads('''${Request_data}''')    json
     ${Source_TFN}=     Get From Dictionary     ${Request_data}     num
     ${recVersionId}=     Get From Dictionary     ${Request_data}     recVersionId
     ${Req_body}=    Evaluate    json.loads('''${CR_Copy_Req_Body}''')    json
     Set To Dictionary      ${Req_body}     srcNum=${Source_TFN}
     Set To Dictionary      ${Req_body}     tgtNum=${Source_TFN}
     ${Date}    get current Date
     ${EffDate_FutureDate}        Add Time To Date    ${Date}   ${numOfDays} days
     ${EffDate_FutureDate}        evaluate  '${EffDate_FutureDate}'.replace(' ','T')
     ${EffDate_FutureDate}        fetch from left     ${EffDate_FutureDate}     :
     ${EffDate_FutureDate}        Catenate    ${EffDate_FutureDate}:00Z
     Set To Dictionary   ${Req_body}     tgtEffDtTm=${EffDate_FutureDate}
     Set To Dictionary   ${Req_body}     srcRecVersionId=${recVersionId}
     ${Req_body}=        Evaluate    json.dumps(${Req_body})    json
     [Return]    ${Req_body}      ${EffDate_FutureDate}

Create CAD CR Transfer Reqbody
     [Arguments]   ${Request_data}    ${CR_Copy_Req_Body}       ${numOfDays}        ${cmd_data}     ${recVersionId}
     #${data}=    Evaluate    json.loads('''${Request_data}''')    json
     ${Source_TFN}=     Get From Dictionary     ${Request_data}     num
     ${custRecCompPartData}=        Get From Dictionary     ${Request_data["lstEffDtTms"][0]}     custRecCompPart
     ${Req_body}=    Evaluate    json.loads('''${CR_Copy_Req_Body}''')    json
     Set To Dictionary      ${Req_body}     srcNum=${Source_TFN}
     Set To Dictionary      ${Req_body}     tgtNum=${Source_TFN}
     ${Date}    get current Date
     ${EffDate_FutureDate}        Add Time To Date    ${Date}   ${numOfDays} days
     ${EffDate_FutureDate}        evaluate  '${EffDate_FutureDate}'.replace(' ','T')
     ${EffDate_FutureDate}        fetch from left     ${EffDate_FutureDate}     :
     ${EffDate_FutureDate}        Catenate    ${EffDate_FutureDate}:00Z
     Set To Dictionary   ${Req_body}     tgtEffDtTm=${EffDate_FutureDate}
     Set To Dictionary   ${Req_body}     srcRecVersionId=${recVersionId}
     Set To Dictionary   ${Req_body}     custRecCompPart=${custRecCompPartData}
     Set To Dictionary   ${Req_body}     cmd=${cmd_data}
     ${Req_body}=        Evaluate    json.dumps(${Req_body})    json
     [Return]    ${Req_body}      ${EffDate_FutureDate}

Create and Validate a PENDING CR With Mandatory Parameters
    ${token}=        Get Token
    ${reservedTFN}       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
    ${EFF_Date_Time}     Future Effective Date and Time
    ${respOrg}           get resporgid
    ${interLATACarrier}         ${intraLATACarrier}     ${cicCode}      ${acna}     ${recversionIDForCIS}     Get Intra and Inter LATA Carrier      ${token}
    set global variable         ${cicCode}
    set global variable         ${acna}
    set global variable         ${recversionIDForCIS}
    ${requestData}    evaluate    json.loads('''${ReqBody_CR_Create_MandatoryParams}''')    json
    set to dictionary        ${requestData}          num=${reservedTFN}
    set to dictionary        ${requestData}          effDtTm=${EFF_Date_Time}
    set to dictionary        ${requestData}          interLATACarrier=${interLATACarrier}
    set to dictionary        ${requestData}          intraLATACarrier=${intraLATACarrier}
    set to dictionary        ${requestData["destNums"][0]}  destNum=${reservedTFN}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log      ${reqBody}
    # Create CR
    ${responseData}=    POST Method      ${token}     ${POST_CAD_Create}     ${reqBody}       ${SuccessResponse}
    should not be empty        ${responseData}
    log   ${responseData}
    ${recVersionId}     get from dictionary   ${responseData}   recVersionId
    # CR Validation
    ${createdCrResponseValues}  Validation for Customer Record Create Response  ${responseData}  ${EFF_Date_Time}  ${reservedTFN}  ${PENDING_Status_Caps}  ${API_T2_ADMIN_USER}  ${respOrg[0:2]}  ${cad_Only}
    [Return]   ${reservedTFN}   ${EFF_Date_Time}   ${respOrg}   ${recVersionId}   ${token}   ${cicCode}  ${acna}  ${recversionIDForCIS}

Get New Future Effective Date and Time
    [Arguments]       ${EFF_Date_Time}   ${Days_To_Add}
    ${EFF_Date_Time_New}    Add Time To Date    ${EFF_Date_Time}    ${Days_To_Add} days
    ${EFF_Date_Time_New}        evaluate  '${EFF_Date_Time_New}'.replace(' ','T')
    ${EFF_Date_Time_New}        fetch from left     ${EFF_Date_Time_New}     :
    ${EFF_Date_Time_New}        Catenate    ${EFF_Date_Time_New}:00Z
    log   ${EFF_Date_Time_New}
    [Return]     ${EFF_Date_Time_New}

Get New Past Effective Date and Time
    [Arguments]       ${EFF_Date_Time}      ${Days_To_Subtract}
    ${EFF_Date_Time_New}    Subtract Time From Date    ${EFF_Date_Time}    ${Days_To_Subtract} days
    ${EFF_Date_Time_New}        evaluate  '${EFF_Date_Time_New}'.replace(' ','T')
    ${EFF_Date_Time_New}        fetch from left     ${EFF_Date_Time_New}     :
    ${EFF_Date_Time_New}        Catenate    ${EFF_Date_Time_New}:00Z
    log   ${EFF_Date_Time_New}
    [Return]     ${EFF_Date_Time_New}

Validation of Transfer Lock Allowed Flag
    [Arguments]   ${transferStatus}     ${expectedTransferAllowedFlag}
    ${isAllowedFlagFromResponse}        get from dictionary     ${transferStatus}       isAllowed
    should be equal     ${isAllowedFlagFromResponse}    ${expectedTransferAllowedFlag}

Create and Validate a HOLD CR With Mandatory Parameters
    ${token}=        Get Token
    ${reservedTFN}       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
    ${EFF_Date_Time}     Future Effective Date and Time
    ${respOrg}           get resporgid
    ${interLATACarrier}         ${intraLATACarrier}     ${cicCode}      ${acna}     ${recversionIDForCIS}     Get Intra and Inter LATA Carrier      ${token}
    ${requestData}    evaluate    json.loads('''${ReqBody_CR_Create_MandatoryParams}''')    json
    set to dictionary        ${requestData}          num=${reservedTFN}
    set to dictionary        ${requestData}          effDtTm=${EFF_Date_Time}
    set to dictionary        ${requestData}          hldIndFlag=Y
    set to dictionary        ${requestData}          interLATACarrier=${interLATACarrier}
    set to dictionary        ${requestData}          intraLATACarrier=${intraLATACarrier}
    set to dictionary        ${requestData["destNums"][0]}  destNum=${reservedTFN}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log      ${reqBody}
    # Create CR
    ${responseData}=    POST Method      ${token}     ${POST_CAD_Create}     ${reqBody}       ${SuccessResponse}
    should not be empty        ${responseData}
    log   ${responseData}
    ${recVersionId}     get from dictionary   ${responseData}   recVersionId
    # CR Validation
    ${createdCrResponseValues}  Validation for Customer Record Create Response  ${responseData}  ${EFF_Date_Time}  ${reservedTFN}  ${HOLD_Status_Caps}  ${API_T2_ADMIN_USER}  ${respOrg[0:2]}  ${cad_Only}
    [Return]   ${reservedTFN}   ${EFF_Date_Time}   ${respOrg}   ${recVersionId}   ${token}   ${cicCode}  ${acna}  ${recversionIDForCIS}

CR Copy With Mandatory Parameters
    [Arguments]   ${sourceTFN}      ${targetTFN}    ${Target_EFF_Date_Time}   ${recVersionId}     ${token}
    ${crCopyRequestData}    evaluate    json.loads('''${ReqBody_CR_Copy_MandatoryParams}''')    json
    set to dictionary        ${crCopyRequestData}          srcNum=${sourceTFN}
    set to dictionary        ${crCopyRequestData}          tgtNum=${targetTFN}
    set to dictionary        ${crCopyRequestData}          tgtEffDtTm=${Target_EFF_Date_Time}
    set to dictionary        ${crCopyRequestData}          srcRecVersionId=${recVersionId}
    ${crCopyReqBody}=    evaluate    json.dumps(${crCopyRequestData})    json
    ${crCopyResponseData}=    PUT Method    ${token}     ${PUT_CAD_COPY}     ${crCopyReqBody}       ${SuccessResponse}
    [Return]   ${crCopyResponseData}

Create and Validate an INVALID CR
    ${token}=        Get Token
    ${reservedTFN}       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
    ${EFF_Date_Time}     Future Effective Date and Time
    ${respOrg}           get resporgid
    ${interLATACarrier}         ${intraLATACarrier}     ${cicCode}      ${acna}     ${recversionIDForCIS}     Get Intra and Inter LATA Carrier      ${token}
    ${requestData}    evaluate    json.loads('''${ReqBody_CR_Create_Missing_InterLataCarrier}''')    json
    set to dictionary        ${requestData}          num=${reservedTFN}
    set to dictionary        ${requestData}          effDtTm=${EFF_Date_Time}
    set to dictionary        ${requestData}          intraLATACarrier=${intraLATACarrier}
    set to dictionary        ${requestData["destNums"][0]}  destNum=${reservedTFN}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log      ${reqBody}
    # Create CR
    ${responseData}=    POST Method      ${token}     ${POST_CAD_Create}     ${reqBody}       ${SuccessResponse}
    should not be empty        ${responseData}
    log   ${responseData}
    ${recVersionId}     get from dictionary   ${responseData}   recVersionId
    # CR Validation
    ${createdCrResponseValues}  Validation for Customer Record Create Response  ${responseData}  ${EFF_Date_Time}  ${reservedTFN}  ${InvalidStatus_string}  ${API_T2_ADMIN_USER}  ${respOrg[0:2]}  ${cad_Only}
    [Return]   ${reservedTFN}   ${EFF_Date_Time}   ${respOrg}   ${recVersionId}   ${token}   ${cicCode}  ${acna}  ${recversionIDForCIS}

Create and Validate a SAVED CR With Mandatory Parameters
    ${token}=        Get Token
    ${reservedTFN}       get Reserve Random Number      ${token}     ${ReqData}
    ${EFF_Date_Time}     Future Effective Date and Time
    ${respOrg}           get resporgid
    ${interLATACarrier}         ${intraLATACarrier}     ${cicCode}      ${acna}     ${recversionIDForCIS}     Get Intra and Inter LATA Carrier      ${token}
    ${requestData}    evaluate    json.loads('''${ReqBody_CR_Create_MandatoryParams}''')    json
    set to dictionary        ${requestData}          num=${reservedTFN}
    set to dictionary        ${requestData}          cmd=${Saved_CR_Cmd_Value}
    set to dictionary        ${requestData}          effDtTm=${EFF_Date_Time}
    set to dictionary        ${requestData}          interLATACarrier=${interLATACarrier}
    set to dictionary        ${requestData}          intraLATACarrier=${intraLATACarrier}
    set to dictionary        ${requestData["destNums"][0]}  destNum=${reservedTFN}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log      ${reqBody}
    # Create CR
    ${responseData}=    POST Method      ${token}     ${POST_CAD_Create}     ${reqBody}       ${SuccessResponse}
    should not be empty        ${responseData}
    log   ${responseData}
    ${recVersionId}     get from dictionary   ${responseData}   recVersionId
    # CR Validation
    ${createdCrResponseValues}  Validation for Customer Record Create Response  ${responseData}  ${EFF_Date_Time}  ${reservedTFN}  ${SAVED_Status_Caps}  ${API_T2_ADMIN_USER}  ${respOrg[0:2]}  ${cad_Only}
    [Return]   ${reservedTFN}   ${EFF_Date_Time}   ${respOrg}   ${recVersionId}   ${token}   ${cicCode}  ${acna}  ${recversionIDForCIS}

Create Basic CAD In Save State With Mandatory Parameters
    [Arguments]         ${Admin_Credentials_Track2}
    UserProfile Login        ${Admin_Credentials_Track2}
    ${token}        Get Token
    set global variable         ${token}
    ${TollFreeNumber}       Get Reserve Random Number    ${token}     ${ReqBody_Reservetfn}
    set global variable     ${TollFreeNumber}
    ${futureEffDate}       Future Effective Date and Time
    set global variable     ${futureEffDate}
    ${effDate}      evaluate  '${futureEffDate}'.replace('-','')
    ${effDateTm}      evaluate  '${effDate}'.replace(':','')
    set global variable     ${effDateTm}
    ${telco}    Get Telco       ${token}
    ${interLATACarrier}         ${intraLATACarrier}         ${cicCode}      ${acna}     ${recversionIDForCIS}       Get Intra and Inter LATA Carrier            ${token}
    set global variable      ${cicCode}
    set global variable         ${interLATACarrier}
    set global variable      ${acna}
    set global variable      ${recversionIDForCIS}
    ${requestData}    evaluate    json.loads('''${RequestbodyforBasicCADCreateInSave}''')    json
    set to dictionary   ${requestData}          num=${TollFreeNumber}
    set to dictionary   ${requestData}          effDtTm=${futureEffDate}
    set to dictionary   ${requestData}          interLATACarrier=${interLATACarrier}
    set to dictionary        ${requestData['destNums'][0]}     destNum=${TollFreeNumber}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${createResponse}     POST Method     ${token}    ${POST_CAD_Create}      ${reqBody}     ${SuccessResponse}
    log     ${createResponse}
    #CAD create response Validations
    ${CR_CreatedResponse_Values}        Validation for Customer Record Create Response          ${createResponse}       ${futureEffDate}        ${TollFreeNumber}       ${SAVESTATE}      ${API_T2_ADMIN_USER}     BR     CAD only
    set global variable         ${CR_CreatedResponse_Values}

Create Basic CAD In Save State With All Parameters
    [Arguments]         ${Admin_Credentials_Track2}
    UserProfile Login        ${Admin_Credentials_Track2}
    ${token}        Get Token
    set global variable         ${token}
    ${TollFreeNumber}       Get Reserve Random Number    ${token}     ${ReqBody_Reservetfn}
    set global variable     ${TollFreeNumber}
    ${futureEffDate}       Future Effective Date and Time
    set global variable     ${futureEffDate}
    ${effDate}      evaluate  '${futureEffDate}'.replace('-','')
    ${effDateTm}      evaluate  '${effDate}'.replace(':','')
    set global variable     ${effDateTm}
    ${telco}    Get Telco       ${token}
    ${interLATACarrier}         ${intraLATACarrier}         ${cicCode}      ${acna}     ${recversionIDForCIS}       Get Intra and Inter LATA Carrier            ${token}
    set global variable      ${cicCode}
    set global variable         ${interLATACarrier}
    set global variable         ${intraLATACarrier}
    set global variable      ${acna}
    set global variable      ${recversionIDForCIS}
    ${requestData}    evaluate    json.loads('''${RequestbodyforBasicCADCreateInSaveStateWithAllParams}''')    json
    set to dictionary   ${requestData}          num=${TollFreeNumber}
    set to dictionary   ${requestData}          effDtTm=${futureEffDate}
    set to dictionary   ${requestData}          interLATACarrier=${interLATACarrier}
    set to dictionary   ${requestData}          intraLATACarrier=${intraLATACarrier}
    set to dictionary        ${requestData['destNums'][0]}     destNum=${TollFreeNumber}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${createResponse}     POST Method     ${token}    ${POST_CAD_Create}      ${reqBody}     ${SuccessResponse}
    log     ${createResponse}
    #CAD create response Validations
    ${CR_CreatedResponse_Values}        Validation for Customer Record Create Response          ${createResponse}       ${futureEffDate}        ${TollFreeNumber}       ${SAVESTATE}      ${API_T2_ADMIN_USER}     BR     CAD only
    set global variable         ${CR_CreatedResponse_Values}
    [Return]        ${reqBody}

Cleanup For Basic CAD Create
    [Arguments]         ${token}        ${TollFreeNumber}      ${EffDt}
    ${recVersionId}     get from list        ${CR_CreatedResponse_Values}       0
    ${response}         Delete Method      ${token}       ${DEL_CAD_Delete}       ${TollFreeNumber}${EffDtTmURI}${EffDt}    ${recVersionId}       ${SuccessResponse}
    log     ${response}
    should not be empty     ${response}
    ${retrieveResponse}      GET Method      ${token}     ${GET_CAD_VIEW}${TollFreeNumber}${EffDateURI}${EffDt}   ${SuccessResponse}
    log     ${retrieveResponse}
    Validation For Error Message        ${retrieveResponse}        ${CAD_CR_Missing_ErrMsg}        ${ERROR}      ${NoCADExistsErrCode}
    ${resporgId}        Get RespOrgID
    Delete acna      ${token}         ${cicCode}          ${acna}       ${resporgId}        ${recversionIDForCIS}
    Close Session

Validate Customer Record retrieve response In Saved Status
   [Arguments]     ${responsedata}      ${TollFreeNumber}       ${futureEffDate}         ${expectedEffDtTm}     ${RequestbodyforBasicCADCreateInSaveState}       ${AllParams}
   ${telco}          get from dictionary      ${responsedata}         telco
   ${userRespOrgId}     get resporgid
   ${TelcoStatus}        run keyword and return status       dictionary should contain key           ${RequestbodyforBasicCADCreateInSaveState}     telco
   ${UserTelco}     run keyword if      ${TelcoStatus}==True            get from input       ${RequestbodyforBasicCADCreateInSaveState}     telco
   ...      ELSE        get substring       ${userRespOrgId}        0       4
   should be equal          ${telco}         ${UserTelco}
   ${custRecTFN}      get from dictionary      ${responsedata}     num
   should be equal      ${custRecTFN}       ${TollFreeNumber}
   ${createdUser}          get from dictionary     ${responsedata}     lastUsr
   ${UserId}        get from input          ${Admin_Credentials_Track2}         usrName
   should be equal       ${createdUser}         ${UserId}
   ${retrivedinterLATACarrier}          get from dictionary      ${responsedata}         interLATACarrier
   should be equal          ${interLATACarrier}     ${retrivedinterLATACarrier}
   ${lastUpDt}          get from dictionary      ${responsedata}         lastUpDt
   ${perms}          get from dictionary      ${responsedata}         perms
   should be equal       ${perms}     Update
   ${recVersionId}      get from dictionary      ${responsedata}     recVersionId
   ${lstEffDtTms}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     effDtTm
   #${futureEffDate}       Future Effective Date and Time
   should be equal      ${lstEffDtTms}      ${futureEffDate}
   ${custRecordStatus}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     custRecStat
   should be equal          ${custRecordStatus}     SAVED
   ${custRecCompPart}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     custRecCompPart
   should be equal      ${custRecCompPart}          ${cad_Only}
   ${apprStat}              get from dictionary         ${responsedata["lstEffDtTms"][0]}     apprStat
   should be equal          ${apprStat}         NOT APPLICABLE
   ${destNums}              get from dictionary      ${responsedata}         destNums
   ${localServOff}       get from dictionary      ${responsedata["destNums"][0]}     localServOff
   ${inputrequstbody}     to json     ${RequestbodyforBasicCADCreateInSaveState}
   ${inputDestNum}      get from dictionary         ${inputrequstbody}      destNums
   ${inputLocalServOff}     get from dictionary   ${inputDestNum[0]}    localServOff
   should be equal          ${inputLocalServOff}        ${localServOff}
   ${destNum}       get from dictionary      ${responsedata["destNums"][0]}     destNum
   should be equal          ${destNum}      ${custRecTFN}
   ${numTermLine}              get from dictionary         ${responsedata["destNums"][0]}     numTermLine
   ${inputNumTermLine}     get from dictionary      ${inputrequstbody["destNums"][0]}       numTermLine
   ${inputNumTermLine}      convert to integer           ${inputNumTermLine}
   should be equal      ${numTermLine}          ${inputNumTermLine}
   ${effDtTm}      get from dictionary      ${responsedata}     effDtTm
   should be equal      ${effDtTm}      ${expectedEffDtTm}
   ${aos}               get from dictionary         ${responsedata}         aos
   ${input_AOS}         get from dictionary          ${inputrequstbody}       aos
   should be equal       ${aos}     ${input_AOS}
   ${numStatus}         get from dictionary     ${responsedata}     numStatus
   should be equal      ${numStatus}        ${ASSIGNEDSTATE}
   ${svcOrderNum}          get from dictionary      ${responsedata}         svcOrderNum
   ${Input_svcOrderNum}         get from dictionary          ${inputrequstbody}       svcOrderNum
   should be equal          ${svcOrderNum}      ${Input_svcOrderNum}
   ${RespOrgId}      get from dictionary      ${responsedata}     ctrlRespOrgId
   #should be equal          ${RespOrgId}        ${userRespOrgId}
   run keyword if   ${AllParams}==True          CAD Retrieve Only Optional Params Validations       ${responsedata}          ${inputrequstbody}
   ...  ELSE        Validate Customer Record Contact Details              ${responsedata}       ${ReqBody_Reservetfn}
   ${hldIndFlag}        get from dictionary         ${responsedata}         hldIndFlag
   ${input_hldIndFlag}     run keyword if   ${AllParams}==True       get from input         ${RequestbodyforBasicCADCreateInSaveState}         hldIndFlag
   ...   ELSE       set variable    N
   should be equal          ${hldIndFlag}       ${input_hldIndFlag}
   ${priority}          get from dictionary         ${responsedata}         priority
   ${input_priority}      run keyword if   ${AllParams}==True       get from input         ${RequestbodyforBasicCADCreateInSaveState}         priority
   ...   ELSE       set variable    N
   should be equal      ${priority}        ${input_priority}   [Return]         ${recVersionId}

Validate Customer Record Contact Details
   [Arguments]          ${responsedata}     ${inputrequstbody}
   ${inputrequstbody}   to json     ${inputrequstbody}
   ${inputConTel}  get from dictionary          ${inputrequstbody}       conTel
   ${conTel}          get from dictionary      ${responsedata}         conTel
   should be equal      ${inputConTel}      ${conTel}
   ${inputconName}  get from dictionary          ${inputrequstbody}       conName
   ${conName}          get from dictionary      ${responsedata}         conName
   should be equal      ${inputconName}      ${conName}

CAD Retrieve Only Optional Params Validations
   [Arguments]          ${responsedata}          ${inputrequstbody}
   ${agent}          get from dictionary      ${responsedata}         agent
   ${Input_agent}         get from dictionary          ${inputrequstbody}       agent
   should be equal      ${Input_agent}           ${agent}
   ${suppFormNum}          get from dictionary      ${responsedata}         suppFormNum
   ${Input_suppFormNum}         get from dictionary          ${inputrequstbody}       suppFormNum
   should be equal          ${suppFormNum}      ${Input_suppFormNum}
   ${endSub}          get from dictionary      ${responsedata}         endSub
   ${Input_endSub}         get from dictionary          ${inputrequstbody}       endSub
   should be equal          ${endSub}      ${Input_endSub}
   ${endSubAdd}          get from dictionary      ${responsedata}         endSubAddr
   ${Input_endSubAdd}         get from dictionary          ${inputrequstbody}       endSubAddr
   should be equal          ${endSubAdd}      ${Input_endSubAdd}
   ${onAccCust}          get from dictionary      ${responsedata}         onAccCust
   ${Input_onAccCust}         get from dictionary          ${inputrequstbody}       onAccCust
   should be equal          ${onAccCust}      ${Input_onAccCust}
   ${notes}          get from dictionary      ${responsedata}         notes
   ${Input_notes}         get from dictionary          ${inputrequstbody}       notes
   should be equal          ${notes}      ${Input_notes}
   ${forServOff}       get from dictionary      ${responsedata["destNums"][0]}     forServOff
   ${inputDestNum}      get from dictionary         ${inputrequstbody}      destNums
   ${inputForServOff}     get from dictionary   ${inputDestNum[0]}    forServOff
   should be equal          ${forServOff}        ${inputForServOff}
   ${retrivedintraLATACarrier}          get from dictionary      ${responsedata}         intraLATACarrier
   should be equal          ${intraLATACarrier}     ${retrivedintraLATACarrier}
   ${inputConTel}  get from dictionary          ${inputrequstbody}       conTel
   ${conTel}          get from dictionary      ${responsedata}         conTel
   should be equal      ${inputConTel}      ${conTel}
   ${inputconName}  get from dictionary          ${inputrequstbody}       conName
   ${conName}          get from dictionary      ${responsedata}         conName
   should be equal      ${inputconName}      ${conName}

Validate DestNums
    [Arguments]         ${responsedata}          ${reqBody}
    ${localServOff}         get from dictionary     ${responsedata}     localServOff
    ${numTermLine}          get from dictionary       ${responsedata}     numTermLine
    ${numTermLine}      convert to integer    ${numTermLine}
    ${destNum}          get from dictionary         ${responsedata}     destNum
    ${input_localServOff}         get from dictionary     ${reqBody}     localServOff
    ${input_numTermLine}          get from dictionary       ${reqBody}     numTermLine
    ${input_destNum}          get from dictionary         ${reqBody}     destNum
    ${forServOffStatus}     run keyword and return status       dictionary should contain key        ${reqBody}          forServOff
    ${forServOff}    run keyword if   ${forServOffStatus}==True     get from dictionary       ${responsedata}         forServOff
    ${input_forServOff}    run keyword if   ${forServOffStatus}==True     get from dictionary       ${reqBody}         forServOff
    ${validationStatuslocalServOff}     run keyword and return status          should be equal          ${localServOff}            ${input_localServOff}
    ${validationStatus}    run keyword if   ${validationStatuslocalServOff}==True     run keyword and return status         should be equal         ${numTermLine}              ${input_numTermLine}
    ${destNumStatus}     run keyword if   ${validationStatus}==True   run keyword and return status         should be equal          ${destNum}                  ${input_destNum}
    ${status}       run keyword if   ${destNumStatus}==True    run keyword and return status          should be equal         ${forServOff}            ${input_forServOff}
    ${destNumValidation}        run keyword if          ${status}==True     set variable        True
    ...     ELSE        set variable        False
    [Return]        ${destNumValidation}

Delete multiple Customer Records And Close Session
    [Arguments]         ${token}        ${TollFreeNumber}         ${FirstRecordEffDateTm}         ${SecondRecordEffDateTm}        ${recVersionIdForDelete}
    ${response}         Delete Method      ${token}       ${DEL_CAD_Delete}       ${TollFreeNumber}${EffDtTmURI}${SecondRecordEffDateTm}    ${recVersionIdForDelete}       ${SuccessResponse}
    log     ${response}
    should not be empty     ${response}
    ${response}         Delete Method      ${token}       ${DEL_CAD_Delete}       ${TollFreeNumber}${EffDtTmURI}${FirstRecordEffDateTm}    ${recVersionIdForDelete}       ${SuccessResponse}
    log     ${response}
    should not be empty     ${response}
    ${retrieveResponse}      GET Method      ${token}     ${GET_CAD_VIEW}${TollFreeNumber}${EffDateURI}${FirstRecordEffDateTm}   ${SuccessResponse}
    log     ${retrieveResponse}
    Validation For Error Message        ${retrieveResponse}        ${CAD_CR_Missing_ErrMsg}        ${ERROR}      ${NoCADExistsErrCode}
    ${resporgId}        Get RespOrgID
    Delete acna      ${token}         ${cicCode}          ${acna}       ${resporgId}        ${recversionIDForCIS}
    Close Session

Validate CAD Transfered CR
   [Arguments]      ${token}      ${ReserveTFN}         ${EFF_Date_Time}        ${recVersionId}         ${custRecStatus_expctd}
   ${CRviewAfterTransfer}      GET METHOD          ${token}      ${CAD_GET_VIEW}${ReserveTFN}           ${successResponse}
   should not be empty     ${CRviewAfterTransfer}
   log      ${CRviewAfterTransfer}
   ${recVersionIdTr}      get from dictionary      ${CRviewAfterTransfer}            recVersionId
   ${lstEffDtTms}       get from dictionary        ${CRviewAfterTransfer["lstEffDtTms"][0]}     effDtTm
   ${custRecStatus}       get from dictionary      ${CRviewAfterTransfer["lstEffDtTms"][0]}     custRecStat
   should be equal      ${recVersionIdTr}       ${recVersionId}
   should be equal      ${lstEffDtTms}          ${EFF_Date_Time}
   should be equal      ${custRecStatus}          ${custRecStatus_expctd}

Create Basic CAD In Pending Status
    [Arguments]         ${Admin_Credentials_Track2}
#    UserProfile Login        ${Admin_Credentials_Track2}
    ${token}        Get Token
    set global variable         ${token}
    ${TollFreeNumber}       Get Reserve Random Number    ${token}     ${ReqBody_Reservetfn}
    set global variable     ${TollFreeNumber}
    ${futureEffDate}       Future Effective Date and Time
    set global variable         ${futureEffDate}
    ${effDate}      evaluate  '${futureEffDate}'.replace('-','')
    ${effDateTm}      evaluate  '${effDate}'.replace(':','')
    set global variable     ${effDateTm}
    ${telco}    Get Telco       ${token}
    ${interLATACarrier}         ${intraLATACarrier}         ${cicCode}      ${acna}     ${recversionIDForCIS}       Get Intra and Inter LATA Carrier            ${token}
    set global variable      ${cicCode}
    set global variable      ${acna}
    set global variable      ${recversionIDForCIS}
    set global variable     ${interLATACarrier}
    set global variable     ${intraLATACarrier}
    ${requestData}    evaluate    json.loads('''${RequestbodyforBasicCADCreate}''')    json
    set to dictionary   ${requestData}          num=${TollFreeNumber}
    set to dictionary   ${requestData}          effDtTm=${futureEffDate}
    set to dictionary   ${requestData}          telco=${telco}
    set to dictionary   ${requestData}          interLATACarrier=${interLATACarrier}
    set to dictionary   ${requestData}          intraLATACarrier=${intraLATACarrier}
    set to dictionary        ${requestData['destNums'][0]}     destNum=${TollFreeNumber}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${createResponse}     POST Method     ${token}    ${POST_CAD_Create}      ${reqBody}     ${SuccessResponse}
    log     ${createResponse}
    set global variable         ${createResponse}
    #CAD create response Validations
    ${CR_CreatedResponse_Values}        Validation for Customer Record Create Response          ${createResponse}       ${futureEffDate}        ${TollFreeNumber}       ${PENDINGSTATE}      ${T2_ADMIN_USER}     BR     CAD only
    set global variable         ${CR_CreatedResponse_Values}
    ${retrieveResponse}      GET Method      ${token}     ${GET_CAD_VIEW}${TollFreeNumber}   ${SuccessResponse}
    log     ${retrieveResponse}
    set global variable     ${retrieveResponse}
    ${CR_retrieveResponse_Values}       ${CR_retrieveResponseList}          Get Customer Record Retrieve List     ${retrieveResponse}      ${ASSIGNEDSTATE}        N         N
    should be equal     ${CR_retrieveResponse_Values}        ${CR_CreatedResponse_Values}
    [Return]        ${reqBody}

Delete Customer record and close session
    [Arguments]     ${token}    ${cicCode}      ${acna}     ${recversionIDForCIS}         ${responsedata_View}        ${req_num}      ${Trimmed_E:D:T}        ${E.D.T_req}         ${reservedTFN}
   ${recVersionId}          get from dictionary     ${responsedata_View}               recVersionId
   ${recVersionId}      catenate    ${recVersionId}?toSpare=Y
   ${responsedata_Delete}=     DELETE METHOD      ${token}         ${DEL_LAD_Delete}                ${LAD_View}${reservedTFN}/effDtTm/${Trimmed_E:D:T}      ${recVersionId}               ${SuccessResponse}
   should not be empty           ${responsedata_Delete}
   ${number_Del_Resp}           get from dictionary         ${responsedata_Delete}      num
   should be equal as strings      ${number_Del_Resp}       ${req_num}
   ${E.D.T_Del_Resp}           get from dictionary         ${responsedata_Delete}       effDtTm
   Should Be Equal As Strings       ${E.D.T_Del_Resp}       ${E.D.T_req}
   # Validating the status of TFN
   ${numQueryResp}      GET METHOD    ${token}     ${GET_NUSQ_ACTION}${reservedTFN}     ${SuccessResponse}
   ${statusOfTfnFromQuery}      get from dictionary    ${numQueryResp}   status
   log      ${statusOfTfnFromQuery}
   should be equal   ${statusOfTfnFromQuery}    ${SPARE}
   Delete ACNA       ${token }      ${cicCode}      ${acna}          ${resporgId}         ${recversionIDForCIS}
   Close Session

Get Non CLE/CLA Info OCN Entity
    [Arguments]     ${token}
    ${listResponse}     GET METHOD      ${token}     ${GET_OCN_List}        ${SuccessResponse}
    log         ${listResponse}
    ${mappedEntityList_OCN}        get from dictionary     ${listResponse}      entityLst
    ${listResponse_CLA}     GET METHOD      ${token}     ${GET_CLA_RETRIEVE_LST}        ${SuccessResponse}
    log         ${listResponse_CLA}
    ${CLAListISEmpty}   run keyword and return status     validation for error message      ${listResponse_CLA}           ${NoCLADataErrMsg}     ${ERROR}            ${NoCLADataErrCode}
    ${entityLstCLA}       run keyword if      ${CLAListISEmpty} == False       get from dictionary     ${listResponse_CLA}        entityList
    ...     ELSE        create list
    ${listResponse_CLE}     GET METHOD      ${token}     ${GET_CLE_LIST}        ${SuccessResponse}
    log         ${listResponse_CLE}
    ${CLEListISEmpty}   run keyword and return status     validation for error message        ${listResponse_CLE}            ${NoCLEDataErrMsg}     ${ERROR}            ${NoCLEDataErrCode}
    ${entityLstCLE}       run keyword if      ${CLEListISEmpty} == False       get from dictionary     ${listResponse_CLE}       entityList
    ...     ELSE        create list
    ${CLAAndCLEMappingExistsEntityList}     combine lists      ${entityLstCLE}      ${entityLstCLA}
    log     ${CLAAndCLEMappingExistsEntityList}
    ${CLAAndCLEMappingExistsEntityList}         remove duplicates       ${CLAAndCLEMappingExistsEntityList}
    ${resultlistStatus}     run keyword and return status   should not be empty         ${CLAAndCLEMappingExistsEntityList}
    ${OCN_Length}         get length         ${mappedEntityList_OCN}
    :FOR   ${i}      IN RANGE    0       ${OCN_Length}
    \   ${OCNentity}        get from list       ${mappedEntityList_OCN}     ${i}
    \   ${entity}           run keyword if   ${resultlistStatus} == False  set variable      ${OCNentity}
    \   run keyword if   ${resultlistStatus} == False      return from keyword         ${entity}
    \   ${Condition}     run keyword and return status      list should contain value      ${CLAAndCLEMappingExistsEntityList}      ${OCNentity}
    \   log     ${Condition}
    \   ${entity}           set variable if     ${Condition}==False        ${mappedEntityList_OCN[${i}]}
    \   Exit For Loop If    ${Condition} == False
    [Return]        ${entity}

Create LAD CR Transfer Reqbody
     [Arguments]   ${reservedTFN}    ${CR_Copy_Req_Body}       ${numOfDays}        ${cmd_data}     ${srcRecVersionId}      ${tgtRecVersionId}       ${diffTfn}
     ${Req_body}=    Evaluate    json.loads('''${CR_Copy_Req_Body}''')    json
     ${Date}    get current Date
     ${EffDate_FutureDate}        Add Time To Date    ${Date}   ${numOfDays} days
     ${EffDate_FutureDate}        evaluate  '${EffDate_FutureDate}'.replace(' ','T')
     ${EffDate_FutureDate}        fetch from left     ${EffDate_FutureDate}     :
     ${EffDate_FutureDate}        Catenate    ${EffDate_FutureDate}:00Z
     Set To Dictionary   ${Req_body}     srcNum=${reservedTFN}
     Set To Dictionary   ${Req_body}     tgtNum=${diffTfn}
     Set To Dictionary   ${Req_body}     tgtEffDtTm=${EffDate_FutureDate}
     Set To Dictionary   ${Req_body}     srcRecVersionId=${srcRecVersionId}
     Set To Dictionary   ${Req_body}     tgtRecVersionId=${tgtRecVersionId}
     Set To Dictionary   ${Req_body}     custRecCompPart=LAD
     Set To Dictionary   ${Req_body}     cmd=${cmd_data}
     ${Req_body}=        Evaluate    json.dumps(${Req_body})    json
     [Return]    ${Req_body}      ${EffDate_FutureDate}

Create LAD Copy Reqbody
     [Arguments]   ${Source_TFN}    ${CR_Copy_Req_Body}       ${numOfDays}     ${recVersionId}
     ${Req_body}=    Evaluate    json.loads('''${CR_Copy_Req_Body}''')    json
     Set To Dictionary      ${Req_body}     tgtNum=${Source_TFN}
     ${Date}    get current Date
     ${EffDate_FutureDate}        Add Time To Date    ${Date}   ${numOfDays} days
     ${EffDate_FutureDate}        evaluate  '${EffDate_FutureDate}'.replace(' ','T')
     ${EffDate_FutureDate}        fetch from left     ${EffDate_FutureDate}     :
     ${EffDate_FutureDate}        Catenate    ${EffDate_FutureDate}:00Z
     Set To Dictionary   ${Req_body}     tgtEffDtTm=${EffDate_FutureDate}
     Set To Dictionary   ${Req_body}     srcRecVersionId=${recVersionId}
     ${Req_body}=        Evaluate    json.dumps(${Req_body})    json
     [Return]    ${Req_body}      ${EffDate_FutureDate}

Create Basic LAD In Pending Status
    [Arguments]         ${Admin_Credentials_Track2}     ${hldIndFlag}       ${LAD_ReqBody}
    UserProfile Login        ${Admin_Credentials_Track2}
    ${token}        Get Token
    set global variable         ${token}
    ${TollFreeNumber}       Get Reserve Random Number    ${token}     ${ReqBody_Reservetfn}
    set global variable     ${TollFreeNumber}
    ${futureEffDate}       Future Effective Date and Time
    set global variable         ${futureEffDate}
    ${effDate}      evaluate  '${futureEffDate}'.replace('-','')
    ${effDateTm}      evaluate  '${effDate}'.replace(':','')
    set global variable     ${effDateTm}
    ${telco}    Get Telco       ${token}
    ${interLATACarrier}         ${intraLATACarrier}         ${cicCode}      ${acna}     ${recversionIDForCIS}       Get Intra and Inter LATA Carrier            ${token}
    set global variable      ${cicCode}
    set global variable      ${acna}
    set global variable      ${recversionIDForCIS}
    set global variable     ${interLATACarrier}
    set global variable     ${intraLATACarrier}
    ${requestData}    evaluate    json.loads('''${LAD_ReqBody}''')    json
    set to dictionary   ${requestData}          num=${TollFreeNumber}
    set to dictionary   ${requestData}          effDtTm=${futureEffDate}
    set to dictionary   ${requestData}          telco=${telco}
    set to dictionary   ${requestData}          interLATACarrier=${interLATACarrier}
    set to dictionary   ${requestData}          intraLATACarrier=${intraLATACarrier}
    set to dictionary   ${requestData}          hldIndFlag=${hldIndFlag}
    set to dictionary        ${requestData['destNums'][0]}     destNum=${TollFreeNumber}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${createResponse}     POST Method     ${token}    ${POST_CAD_Create}      ${reqBody}     ${SuccessResponse}
    log     ${createResponse}
    set global variable         ${createResponse}
    #CAD create response Validations
    ${CR_CreatedResponse_Values}        Validation for Customer Record Create Response          ${createResponse}       ${futureEffDate}        ${TollFreeNumber}       ${PENDINGSTATE}      ${API_T2_ADMIN_USER}     BR     CAD only
    set global variable         ${CR_CreatedResponse_Values}
    ${retrieveResponse}      GET Method      ${token}     ${GET_CAD_VIEW}${TollFreeNumber}   ${SuccessResponse}
    log     ${retrieveResponse}
    set global variable     ${retrieveResponse}
    ${CR_retrieveResponse_Values}       ${CR_retrieveResponseList}          Get Customer Record Retrieve List     ${retrieveResponse}      ${ASSIGNEDSTATE}        N         N
    should be equal     ${CR_retrieveResponse_Values}        ${CR_CreatedResponse_Values}
    [Return]        ${reqBody}

Delete multiple Customer Records And Associative ACNA
    [Arguments]         ${token}        ${TollFreeNumber}
    run keywords    Delete Multiple Customer records for TFN         ${token}        ${TollFreeNumber}      AND     Delete cicCode      ${token}


#    ${retrieveResponseData}          Customer Record Retrieve with TFN    ${token}        ${TollFreeNumber}
#    log      ${retrieveResponseData}
#    ${Status}       run keyword and return status           dictionary should not contain key       ${retrieveResponseData}     errList
#   # ${Status}       run keyword and return status       Validation For Error Message        ${retrieveResponseData}        ${CAD_CR_Missing_ErrMsg}        ${ERROR}      ${NoCADExistsErrCode}
#    return from keyword if        ${Status} == True         ${retrieveResponseData}
#    ${recVersionIdForDelete}        get from dictionary         ${retrieveResponseData}     recVersionId
#    ${lstEffDtTms}      get from dictionary         ${retrieveResponseData}     lstEffDtTms
#    ${TotalNumberOfCRsForTFN}       get length           ${lstEffDtTms}
#    ${latestCRIndex}     evaluate        ${TotalNumberOfCRsForTFN}-1
#    ${i}    set variable    0
#    :FOR    ${i}        IN RANGE    0       ${TotalNumberOfCRsForTFN}
#    \   ${j}       evaluate        ${latestCRIndex}-${i}
#    \   ${EffDtTmOfCR}      get from dictionary           ${lstEffDtTms[${j}]}        effDtTm
#    \   ${effDate}      evaluate  '${EffDtTmOfCR}'.replace('-','')
#    \   ${modifiedEffDateTm}      evaluate  '${effDate}'.replace(':','')
#    \   ${response}         Delete Method      ${token}       ${POST_CAD_Create}       /tfnum/${TollFreeNumber}${EffDtTmURI}${modifiedEffDateTm}    ${recVersionIdForDelete}       ${SuccessResponse}
#    \   log     ${response}
#    \   dictionary should not contain key     ${response}      errList
#    \   should not be empty     ${response}
#    ${retrieveResponse}      Customer Record Retrieve with TFN    ${token}        ${TollFreeNumber}
#    log     ${retrieveResponse}
#    Validation For Error Message        ${retrieveResponse}        ${CAD_CR_Missing_ErrMsg}        ${ERROR}      ${NoCADExistsErrCode}
#    ${interLATACarrier}     get from dictionary         ${retrieveResponseData}         interLATACarrier
#    ${carrier}      get from list       ${interLATACarrier}     0
#    ${acna}  fetch from left      ${carrier}     -
#    ${cicCode}  fetch from right      ${carrier}     -

Delete cicCode
    [Arguments]     ${token}
    ${resp}      GET METHOD    ${token}     ${GET_CIS_ACNA_RETRIEVE}${acna}/cicCode/${cicCode}       ${SuccessResponse}
    log     ${resp}
    should not be empty          ${resp}
    ${recversionIDForCIS}       get from dictionary          ${resp}        recVersionId
    ${resporgId}        Get RespOrgID
    Delete acna      ${token}         ${cicCode}          ${acna}       ${resporgId}        ${recversionIDForCIS}


Delete multiple Customer Records And Associative IntraLataCarrier ACNA
    [Arguments]         ${token}        ${TollFreeNumber}
    run keywords    Delete Multiple Customer records for TFN         ${token}        ${TollFreeNumber}      AND     Delete cicCode      ${token}

#    ${retrieveResponseData}          Customer Record Retrieve with TFN    ${token}        ${TollFreeNumber}
#    log      ${retrieveResponseData}
#    ${recVersionIdForDelete}        get from dictionary         ${retrieveResponseData}     recVersionId
#    ${lstEffDtTms}      get from dictionary         ${retrieveResponseData}     lstEffDtTms
#    ${TotalNumberOfCRsForTFN}       get length           ${lstEffDtTms}
#    ${latestCRIndex}     evaluate        ${TotalNumberOfCRsForTFN}-1
#    ${i}    set variable    0
#    :FOR    ${i}        IN RANGE    0       ${TotalNumberOfCRsForTFN}
#    \   ${j}       evaluate        ${latestCRIndex}-${i}
#    \   ${EffDtTmOfCR}      get from dictionary           ${lstEffDtTms[${j}]}        effDtTm
#    \   ${effDate}      evaluate  '${EffDtTmOfCR}'.replace('-','')
#    \   ${modifiedEffDateTm}      evaluate  '${effDate}'.replace(':','')
#    \   ${response}         Delete Method      ${token}       ${POST_CAD_Create}       /tfnum/${TollFreeNumber}${EffDtTmURI}${modifiedEffDateTm}    ${recVersionIdForDelete}       ${SuccessResponse}
#    \   log     ${response}
#    \   dictionary should not contain key     ${response}      errList
#    \   should not be empty     ${response}
#    ${retrieveResponse}      Customer Record Retrieve with TFN    ${token}        ${TollFreeNumber}
#    log     ${retrieveResponse}
#    Validation For Error Message        ${retrieveResponse}        ${CAD_CR_Missing_ErrMsg}        ${ERROR}      ${NoCADExistsErrCode}
#    ${interLATACarrier}     get from dictionary         ${retrieveResponseData}         intraLATACarrier
#    ${carrier}      get from list       ${interLATACarrier}     0
#    ${acna}  fetch from left      ${carrier}     -
#    ${cicCode}  fetch from right      ${carrier}     -
#    ${resp}      GET METHOD    ${token}     ${GET_CIS_ACNA_RETRIEVE}${acna}/cicCode/${cicCode}       ${SuccessResponse}
#    log     ${resp}
#    should not be empty          ${resp}
#    ${recversionIDForCIS}       get from dictionary          ${resp}        recVersionId
#    ${resporgId}        Get RespOrgID
#    Delete acna      ${token}         ${cicCode}          ${acna}       ${resporgId}        ${recversionIDForCIS}

Delete Multiple Customer records for TFN
    [Arguments]         ${token}        ${TollFreeNumber}
    ${retrieveResponseData}          Customer Record Retrieve with TFN    ${token}        ${TollFreeNumber}
    log      ${retrieveResponseData}
    ${Status}       run keyword and return status           dictionary should contain key       ${retrieveResponseData}     errList
    ${ErrMsg}       run keyword if        ${Status} == True       get from dictionary  ${retrieveResponseData['errList'][0]}     errMsg
    ${Status}       run keyword and return status       should be equal        ${CAD_CR_Missing_ErrMsg}     ${ErrMsg}
    return from keyword if        ${Status} == True         ${retrieveResponseData}
    ${recVersionIdForDelete}        get from dictionary         ${retrieveResponseData}     recVersionId
    ${lstEffDtTms}      get from dictionary         ${retrieveResponseData}     lstEffDtTms
    ${TotalNumberOfCRsForTFN}       get length           ${lstEffDtTms}
    ${latestCRIndex}     evaluate        ${TotalNumberOfCRsForTFN}-1
    ${i}    set variable    0
    FOR    ${i}        IN RANGE    0       ${TotalNumberOfCRsForTFN}
       ${j}       evaluate        ${latestCRIndex}-${i}
       ${EffDtTmOfCR}      get from dictionary           ${lstEffDtTms[${j}]}        effDtTm
       ${effDate}      evaluate  '${EffDtTmOfCR}'.replace('-','')
       ${modifiedEffDateTm}      evaluate  '${effDate}'.replace(':','')
       ${response}         Delete Method      ${token}       ${PUT_CAD_Update}       /tfnum/${TollFreeNumber}${EffDtTmURI}${modifiedEffDateTm}    ${recVersionIdForDelete}?toSpare=Y       ${SuccessResponse}
       log     ${response}
       ${status}   run keyword and return status         validation for error message    ${response}     ${PADRecordDeleteFromCADAPIErrMsg}   ${ERROR}       ${PADRecordDeleteFromCADAPIErrCode}
       continue for loop if            ${status}==True
    #\   dictionary should not contain key    ${response}    errList
       should not be empty     ${response}
    END
    ${retrieveResponseAfterDelete}      Customer Record Retrieve with TFN    ${token}        ${TollFreeNumber}
    log     ${retrieveResponseAfterDelete}
    #Validation For Error Message        ${retrieveResponseAfterDelete}        ${CAD_CR_Missing_ErrMsg}        ${ERROR}      ${NoCADExistsErrCode}
    ${interLATAStatus}      run keyword and return status        dictionary should contain key         ${retrieveResponseData}       intraLATACarrier
    ${interLATACarrier}      run keyword if   ${interLATAStatus} == True       get from dictionary         ${retrieveResponseData}         intraLATACarrier
    ...     ELSE          get from dictionary         ${retrieveResponseData}         interLATACarrier
    ${carrier}      get from list       ${interLATACarrier}     0
    ${acna}  fetch from left      ${carrier}     -
    set global variable     ${acna}
    ${cicCode}  fetch from right      ${carrier}     -
    set global variable    ${cicCode}
    sleep   3s
    ${resp}     Do Number Query         ${token}    ${TollFreeNumber}    ${SuccessResponse}
    ${queryResult}     get from dictionary     ${resp}     queryResult
    ${Status}       get from dictionary     ${queryResult[0]}     status
    #should be equal     ${Status}       ${TFN_status_spare}
    [Return]        ${retrieveResponseData}


Create Basic CPR request body
    [Arguments]         ${Admin_Credentials_Track2}         ${RequestbodyCPR}
    UserProfile Login        ${Admin_Credentials_Track2}
    ${token}        Get Token
    set global variable         ${token}
    ${TollFreeNumber}       Get Reserve Random Number    ${token}     ${ReqBody_Reservetfn}
    set global variable     ${TollFreeNumber}
    ${futureEffDate}       Future Effective Date and Time
    set global variable         ${futureEffDate}
    ${effDate}      evaluate  '${futureEffDate}'.replace('-','')
    ${effDateTm}      evaluate  '${effDate}'.replace(':','')
    set global variable     ${effDateTm}
    ${telco}    Get Telco       ${token}
    ${interLATACarrier}         ${intraLATACarrier}         ${cicCode}      ${acna}     ${recversionIDForCIS}       Get Intra and Inter LATA Carrier            ${token}
    ${cicCodeList}      create list         ${cicCode}
    set global variable      ${cicCode}
    set global variable      ${acna}
    set global variable      ${recversionIDForCIS}
    set global variable     ${interLATACarrier}
    set global variable     ${intraLATACarrier}
    ${requestData}    evaluate    json.loads('''${RequestbodyCPR}''')    json
    set to dictionary   ${requestData}          num=${TollFreeNumber}
    set to dictionary   ${requestData}          effDtTm=${futureEffDate}
    set to dictionary   ${requestData}          telco=${telco}
    set to dictionary   ${requestData}          interLATACarrier=${interLATACarrier}
    set to dictionary   ${requestData}          intraLATACarrier=${intraLATACarrier}
    set to dictionary   ${requestData}          priIntraLT=${interLATACarrier[0]}
    set to dictionary   ${requestData}          priInterLT=${intraLATACarrier[0]}
   # set to dictionary        ${requestData["aos"]}       aosNet=${NetwrkList}
    set to dictionary        ${requestData['destNums'][0]}     destNum=${TollFreeNumber}
    ${respOrg}      get from dictionary        ${requestData}       newRespOrgId
    set global variable     ${respOrg}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    set global variable            ${reqBody}
    [Return]        ${reqBody}

CPR Delete
   [Arguments]         ${token}        ${ReserveTFN}      ${EFF_Date_Time}        ${recVersionId}       ${ResponseCode}
   ${Eff_Date_Time_string}        Remove '-' and ':' From EffDate       ${EFF_Date_Time}
   ${recVersionId}      catenate    ${recVersionId}?toSpare=Y
   ${delResponseData}=    delete method     ${token}     ${DEL_LAD_Delete}       /tfnum/${ReserveTFN}/effDtTm/${Eff_Date_Time_string}       ${recVersionId}       ${ResponseCode}
   should not be empty        ${delResponseData}
   [Return]      ${delResponseData}

Validation For second Error Message
    [Arguments]    ${ResponseData}      ${ErrorMessage}      ${ErrorLevel}      ${ExpectedErrorCode}
    #Check for the error code and error message
    ${Error}=     get from dictionary  ${ResponseData}     errList
    ${ErrorList}=   get from dictionary  ${Error[1]}   errMsg
    ${ErrorLvl}=   get from dictionary  ${Error[1]}   errLvl
    ${ErrorCode}=   get from dictionary  ${Error[1]}   errCode
    should contain     ${ErrorList}    ${ErrorMessage}
    should be equal     ${ErrorLvl}    ${ErrorLevel}
    should be equal     ${ErrorCode}    ${ExpectedErrorCode}

Get ACTIVE networkId from NET List
    [Arguments]        ${token}
    ${ListResponse}     GET METHOD   ${token}     ${NET_List_URI}   ${SuccessResponse}
    log      ${ListResponse}
    ${netWrkIdList}     get from dictionary          ${ListResponse}            netWrkIdList
    ${netWrkIdListLength}     get length        ${netWrkIdList}
    ${i}    set variable    0
    ${ActiveNetWorkId}      set variable    0
    :FOR    ${i}       IN RANGE        0       ${netWrkIdListLength}
    \   ${ActiveNetWorkId}     get from list       ${netWrkIdList}     ${i}
    \   ${Response}     GET METHOD   ${token}     /v2/ip/scp/net/netWrkId/${ActiveNetWorkId}   ${SuccessResponse}
    \   log      ${Response}
    \   ${NetWorkID_status}       get from dictionary         ${Response}     status
    \   ${result}       run keyword and return status       should be equal       ${NetWorkID_status}        ACTIVE
    \   exit for loop if        ${result}==True
    [Return]        ${ActiveNetWorkId}

NAC Create
    [Arguments]     ${token}        ${netWrkId}     ${cicCodeList}
    ${reqBody}      create dictionary      netWrkId=${netWrkId}      cicCodeList=${cicCodeList}
    ${response}      POST Method           ${token}    ${NAC_Create_URI}      ${reqBody}     200
    log          ${response}
    should not be empty             ${response}
    ${recVersionIDofNAC}      get from dictionary         ${response}         recVersionId
    [Return]        ${recVersionIDofNAC}

NAC Delete
    [Arguments]         ${token}        ${NetWorkId}
    ${Response}     GET METHOD   ${token}     ${NAC_retrieve_URI}${NetWorkId}      ${SuccessResponse}
    log      ${Response}
    ${recVersionId}     get from dictionary          ${Response}            recVersionId
    ${delResponseData}=    delete method     ${token}     /v2/ip/scp/nac/netWrkId/        ${NetWorkId}       ${recVersionId}       ${SuccessResponse}
    should be empty        ${delResponseData}

NCA Delete
    [Arguments]         ${token}        ${NetWorkId}
    ${Response}     GET METHOD   ${token}     ${NCA_retrieve_URI}${NetWorkId}      ${SuccessResponse}
    log      ${Response}
    ${recVersionId}     get from dictionary          ${Response}            recVersionId
    ${delResponseData}=    delete method     ${token}     ${NCA_Delete_URI}       ${NetWorkId}       ${recVersionId}       ${SuccessResponse}
    should be empty        ${delResponseData}

Get Nodes List
    [Arguments]     ${nodeSeq}     ${nodeValues}    ${noOfRows}     ${noOfColumns}
    ${nodeValuesLength}   get length    ${nodeValues}
    ${nodeValuesLists}      create list
    FOR    ${i}    IN RANGE    0   ${nodeValuesLength}
       ${valueList}    create list   ${nodeValues[${i}]}
       append to list   ${nodeValuesLists}  ${valueList}
    END
    log  ${nodeValuesLists}
    ${lengthOfNodeSeq}    get length      ${nodeSeq}
    ${nodesRowSubList}    create list
    FOR    ${k}    IN RANGE    0   ${noOfRows}
       ${rowValues}  set variable    ${nodeValuesLists[0:${lengthOfNodeSeq}]}
       ${nodeValuesLists}  set variable     ${nodeValuesLists[${lengthOfNodeSeq}:]}
       append to list      ${nodesRowSubList}    ${rowValues}
    END
    log  ${nodesRowSubList}
    ${nodesList}     create list
    FOR    ${i}    IN RANGE    0   ${noOfRows}
       ${rowNodes}     Get Columns for CPR Table   ${i}    ${nodesRowSubList}    ${noOfColumns}
       ${nodesList}  combine lists   ${nodesList}    ${rowNodes}
    END
    log   ${nodesList}

    [Return]    ${nodesList}

Get Columns for CPR Table
    [Arguments]   ${i}  ${nodesRowSubList}    ${noOfColumns}
    ${rowNodes}    create list
    FOR    ${j}    IN RANGE    0   ${noOfColumns}
       ${rowInd}   evaluate    ${i}+1
       ${colInd}   evaluate    ${j}+1
       ${node}     create dictionary     rowIndex=${rowInd}     colIndex=${colInd}   values=${nodesRowSubList[${i}][${j}]}
       append to list   ${rowNodes}   ${node}
       log    ${rowNodes}
    END
    [Return]   ${rowNodes}

Validation for CPR View Response
    [Arguments]     ${crViewResponse}   ${recVersionId}     ${reservedTFN}    ${EFF_Date_Time}   ${cusRecordStatus}    ${custRecCompPart}    ${numStatus}   ${ctrlRespOrgId}    ${lastUsr}
    ...  ${priority}     ${hldIndFlag}      ${interLATACarrier}      ${intraLATACarrier}        ${svcOrderNum}      ${aos}      ${destNums}     ${cprSectName}
    ${recVersionIdViewResp}     get from dictionary     ${crViewResponse}       recVersionId
    should be equal   ${recVersionIdViewResp}      ${recVersionId}
    ${numViewResp}      get from dictionary     ${crViewResponse}       num
    should be equal    ${numViewResp}      ${reservedTFN}
    ${effDtTmViewResp}      get from dictionary     ${crViewResponse}       effDtTm
    should be equal     ${effDtTmViewResp}      ${EFF_Date_Time}
    ${lstEffDtTmsViewResp}      get from dictionary     ${crViewResponse}    lstEffDtTms
    ${cusRecStatusViewResp}     get from dictionary     ${lstEffDtTmsViewResp[0]}    custRecStat
    should be equal    ${cusRecStatusViewResp}      ${cusRecordStatus}
    ${custRecCompPartViewResp}      get from dictionary     ${lstEffDtTmsViewResp[0]}       custRecCompPart
    should be equal    ${custRecCompPartViewResp}      ${custRecCompPart}
    ${numStatusViewResp}      get from dictionary     ${crViewResponse}       numStatus
    should be equal     ${numStatusViewResp}     ${numStatus}
    ${ctrlRespOrgIdViewResp}      get from dictionary     ${crViewResponse}       ctrlRespOrgId
    should be equal     ${ctrlRespOrgIdViewResp}    ${ctrlRespOrgId}
    ${lastUsrViewResp}      get from dictionary     ${crViewResponse}       lastUsr
    #should be equal     ${lastUsrViewResp}    ${lastUsr}
    ${priorityViewResp}      get from dictionary     ${crViewResponse}       priority
    should be equal     ${priorityViewResp}    ${priority}
    ${hldIndFlagViewResp}      get from dictionary     ${crViewResponse}       hldIndFlag
    should be equal     ${hldIndFlagViewResp}    ${hldIndFlag}
    ${interLATACarrierViewResp}      get from dictionary     ${crViewResponse}       interLATACarrier
    should be equal     ${interLATACarrierViewResp}    ${interLATACarrier}
    ${intraLATACarrierViewResp}      get from dictionary     ${crViewResponse}       intraLATACarrier
    should be equal     ${intraLATACarrierViewResp}    ${intraLATACarrier}
    ${svcOrderNumViewResp}      get from dictionary     ${crViewResponse}       svcOrderNum
    should be equal     ${svcOrderNumViewResp}    ${svcOrderNum}
    ${aosViewResp}      get from dictionary     ${crViewResponse}       aos
    ${destNumsViewResp}      get from dictionary     ${crViewResponse}       destNums
    sort list       ${destNums}
    sort list       ${destNumsViewResp}
    should be equal     ${destNumsViewResp}    ${destNums}
    ${cprSectNameViewResp}      get from dictionary     ${crViewResponse}       cprSectName
    sort list       ${cprSectNameViewResp}
    sort list       ${cprSectName}
    should be equal     ${cprSectNameViewResp}    ${cprSectName}

Validation for Complex TAD View Response
    [Arguments]     ${crViewResponse}   ${recVersionId}     ${ctrlRespOrgId}    ${tmplId}    ${EFF_Date_Time}   ${tmplRecStatus}     ${apprStatus}     ${tmplRecCompPart}
    ...  ${priority}   ${tmplDescription}   ${lastUsr}   ${interLATACarrier}      ${intraLATACarrier}    ${numTermLine}    ${aos}    ${dayLightSavings}
    ...  ${timeZone}   ${cprSectName}    ${disconInd}
    ${recVersionIdViewResp}     get from dictionary     ${crViewResponse}       recVersionId
    should be equal   ${recVersionIdViewResp}      ${recVersionId}
    ${ctrlRespOrgIdViewResp}      get from dictionary     ${crViewResponse}       ctrlRespOrgId
    should be equal     ${ctrlRespOrgIdViewResp}    ${ctrlRespOrgId}
    ${tmplIdViewResp}     get from dictionary     ${crViewResponse}       tmplId
    should be equal   ${tmplIdViewResp}    ${tmplId}
    ${effDtTmViewResp}      get from dictionary     ${crViewResponse}       effDtTm
    #should be equal     ${effDtTmViewResp}      ${EFF_Date_Time}
    ${lstEffDtTmsViewResp}      get from dictionary     ${crViewResponse}    lstEffDtTms
    ${tmplRecStatusViewResp}     get from dictionary     ${lstEffDtTmsViewResp[0]}    tmplRecStat
    should be equal    ${tmplRecStatusViewResp}     ${tmplRecStatus}
    ${apprStatusViewResp}     get from dictionary     ${lstEffDtTmsViewResp[0]}    apprStat
    should be equal    ${apprStatusViewResp}     ${apprStatus}
    ${tmplRecCompPartViewResp}     get from dictionary     ${lstEffDtTmsViewResp[0]}    tmplRecCompPart
    should be equal    ${tmplRecCompPartViewResp}     ${tmplRecCompPart}
    ${priorityViewResp}      get from dictionary     ${crViewResponse}       priority
    should be equal     ${priorityViewResp}    ${priority}
#    ${tmplDescriptionViewResp}      get from dictionary     ${crViewResponse}       tmplDesc
#    should be equal     ${tmplDescriptionViewResp}    ${tmplDescription}
    ${lastUsrViewResp}      get from dictionary     ${crViewResponse}       lastUsr
    should be equal     ${lastUsrViewResp}    ${lastUsr}
    ${interLATACarrierViewResp}      get from dictionary     ${crViewResponse}       interLATACarrier
    should be equal     ${interLATACarrierViewResp}    ${interLATACarrier}
    ${intraLATACarrierViewResp}      get from dictionary     ${crViewResponse}       intraLATACarrier
    should be equal     ${intraLATACarrierViewResp}    ${intraLATACarrier}
    ${numTermLineViewResp}      get from dictionary     ${crViewResponse}       numTermLine
    should be equal as integers     ${numTermLineViewResp}    ${numTermLine}
    ${aosViewResp}      get from dictionary     ${crViewResponse}       aos
    should be equal     ${aosViewResp}    ${aos}
    ${dayLightSavingsViewResp}      get from dictionary     ${crViewResponse}       dayLightSavings
    should be equal     ${dayLightSavingsViewResp}    ${dayLightSavings}
    ${timeZoneViewResp}      get from dictionary     ${crViewResponse}       tmZn
    should be equal     ${timeZoneViewResp}    ${timeZone}
    ${cprSectNameViewResp}      get from dictionary     ${crViewResponse}       cprSectName
#    sort list       ${cprSectNameViewResp}
#    sort list       ${cprSectName}
#    should be equal     ${cprSectNameViewResp}    ${cprSectName}
#    ${disconIndViewResp}      get from dictionary     ${crViewResponse}       dscInd
#    should be equal     ${disconIndViewResp}    ${disconInd}

Get NPA NXX List From NXL List
    [Arguments]     ${token}
    ${listResponseNXL}    GET METHOD  ${token}   ${GET_NXL_LIST}     ${successResponse}
    ${npaNxxList}  get from dictionary  ${listResponseNXL}    npanxxLst
    ${npaList}      create list
    ${nxxList}      create list
    ${npaNxxListLength}  get length  ${npaNxxList}
    :FOR   ${i}   IN RANGE   0    ${npaNxxListLength}
    \   ${npaValue}     get from dictionary   ${npaNxxList[${i}]}     npa
    \   append to list  ${npaList}   ${npaValue}
    \   ${nxxValue}     get from dictionary   ${npaNxxList[${i}]}     nxx
    \   append to list  ${nxxList}   ${nxxValue}
    log   ${npaList}
    log   ${nxxList}
    [Return]    ${npaList}    ${nxxList}

Get Random Spare Number
    [Arguments]         ${token}
    ${token}        get token
    ${requestData}=    evaluate    json.loads('''${RequestDataForNUSRandomSearch}''')    json
    set to dictionary       ${requestData}     npa=${NUS_NPA}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method      ${token}      ${NUS_Random_URI}     ${reqBody}     ${SuccessResponse}
    should not be empty     ${resp}
    log     ${resp}
    ${Num}      get from dictionary          ${resp}        numList
    ${Num}      get from list       ${Num}      0
    [Return]        ${Num}


Create Multiple Users
    [Arguments]         ${oauthToken}       ${numOfUsers}       ${Role}     ${respOrgId}    ${usrClass}     ${UptList}      ${ViewList}

    ${UptLst}         create list          ${UptList}
    ${ViewLst}         create list         ${ViewList}
    :FOR   ${i}      IN RANGE   0   ${numOfUsers}
    \   ${loginId}      Generate LoginID        ${oauthToken}       4       [UPPER]       USQW     ${EMPTY}
    \   ${passwd}       Generate Valid New Password
    \   ${requestData}=    evaluate    json.loads('''${ReqData_UserProfileCreate_Mandatory_Parameters}''')    json
    \   set to dictionary     ${requestData}     loginId=${loginId}
    \   set to dictionary     ${requestData}     password=${passwd}
    \   set to dictionary       ${requestData}     role=${Role}
    \   set to dictionary       ${requestData}     respOrgId=${respOrgId}
    \   set to dictionary       ${requestData}     telco=${respOrgId[0:4]}
    \   set to dictionary       ${requestData}     usrClass=${usrClass}
    \   set to dictionary       ${requestData}     updtLst=${UptLst}
    \   set to dictionary       ${requestData}     viewLst=${ViewLst}
    \   ${requestData}=    evaluate    json.dumps(${requestData})    json
    \   log         ${requestData}
    \   ${updatedRequestData}=    UserLst Updated RequestData       ${requestData}
    \   ${responseData}     Create User Profile     ${oauthToken}           ${updatedRequestData}       ${SuccessResponse}
    \   should be empty         ${responseData}
    \   ${requestData_PassUP}=    evaluate    json.loads('''${ChangePswd_UserCredentials_Track2}''')    json
    \   set to dictionary     ${requestData_PassUP}     usrName=${loginId}
    \   set to dictionary     ${requestData_PassUP}     oldPassword=${passwd}
    \   set to dictionary       ${requestData_PassUP}     newPassword=India@123
    \   ${requestData_PassUP}=    evaluate    json.dumps(${requestData_PassUP})    json
    \   ${successResponseBody}     PUT Method      ${oauthToken}      ${PASSWD_UPDATE}        ${requestData_PassUP}       ${SuccessResponse}
    \   log     ${successResponseBody}
    \   ${expectedResDataForMandatoryParameters}     create list     primaryEmail    respOrgId       telco       phoneNum        lockInd      role        location        usrFullname     loginId
    \   UserProfileCreate Validation        ${oauthToken}       ${loginId}          ${requestData}      ${expectedResDataForMandatoryParameters}
    \   ${requestData}=    evaluate    json.loads('''${User_Credentials_Track2}''')    json
    \   set to dictionary       ${requestData}      usrName=${loginId}
    \   set to dictionary       ${requestData}      password=India@123
    \   ${User_Credentials}=    evaluate    json.dumps(${requestData})    json
#    \   UserProfile Login       ${User_Credentials}
#    \   close session
    \   log many        ${loginId}      India@123
    [Return]        ${User_Credentials}

Delete Multiple Users

    [Arguments]         ${oauthToken}           ${list}
    ${listLen}         get length      ${list}
    :FOR   ${i}      IN RANGE   0   ${listLen}
    \   ${requestData}=    evaluate    json.loads('''${User_Credentials_Track2}''')    json
    \   set to dictionary       ${requestData}      usrName=${list[${i}]}
    \   set to dictionary       ${requestData}      password=Ind@123
    \   ${User_Credentials}=    evaluate    json.dumps(${requestData})    json
    \   UserProfile Login       ${User_Credentials}
    \   close session
    \   ${resp}   Delete User Profile      ${oauthToken}       ${ReqData_UserProfileDelete}       ${list[${i}]}
    \   should be empty     ${resp}
    \   ${responseData}=    GET METHOD    ${oauthToken}     ${UP_LIST_ACTION}   ${SuccessResponse}
    \   log         ${responseData}
    \   ${UserLst}      get from dictionary     ${responseData}     usrLst
    \   list should not contain value       ${UserLst}      ${list[${i}]}

Create ROC
    [Arguments]          ${token}       ${cicCode}      ${resporgId}
    ${EFF_Date_Time}    Future Effective Date and Time
    ${Date_Time}    fetch from left     ${EFF_Date_Time}     T
    ${CicCodeList}      create list     ${cicCode}
    ${requestData}    evaluate    json.loads('''${Roc_create_Req_body}''')    json
    set to dictionary        ${requestData}           effDt=${Date_Time}
    set to dictionary        ${requestData}           respOrgId=${resporgId}
    set to dictionary        ${requestData}           cicCodeList=${CicCodeList}
    ${Roc_create_Req_body}=    evaluate    json.dumps(${requestData})    json
    ${ROCresponse}     POST Method      ${token}     ${POST_ROC_Create}     ${Roc_create_Req_body}       ${SuccessResponse}
    should not be empty        ${ROCresponse}
    ${Roc_recVersionId}     get from dictionary     ${ROCresponse}      recVersionId
    log     ${ROCresponse}
    [Return]    ${Date_Time}      ${Roc_recVersionId}

Delete ROC if exists
    [Arguments]     ${token}   ${effDate}    ${new_respOrgId}
    ${ROCRespValues}     GET METHOD      ${token}        ${GET_ROC_RespId}${new_respOrgId}     ${successResponse}
    log    ${ROCRespValues}
    ${Status}   run keyword and return status   dictionary should contain key       ${ROCRespValues}    recVersionId
    ${recVersionId}     run keyword if          ${status}==True     get from dictionary     ${ROCRespValues}        recVersionId
    run keyword if      ${Status}==True     Delete ROC      ${token}   ${new_respOrgId}     ${effDate}      ${recVersionId}
    ...    ELSE     log     ROC is already deleted

Delete ROC
    [Arguments]   ${token}   ${ReporgId}     ${effDate}      ${recVersionId}
    ${response}     Delete Method   ${token}       ${POST_ROC_Create}       /respOrgId/${ReporgId}/effDt/${effDate}    ${recVersionId}      ${SuccessResponse}
    should be empty     ${response}
    ${RetrieveResponseROC}    GET METHOD    ${token}   ${POST_ROC_Create}/respOrgId/${ReporgId}             ${successResponse}
    ${status}       run keyword and return status       dictionary should contain key       ${RetrieveResponseROC}      effDt
    ${RecordDate}       run keyword if          ${status}==True            get from dictionary     ${RetrieveResponseROC}      effDt
    ${RecordDate}       run keyword if          ${status}==True     evaluate  '${RecordDate}'.replace('-','')
    run keyword if          ${status}==True     should not be equal     ${RecordDate}       ${effDate}
    ${status1}   run keyword and return status   dictionary should contain key       ${RetrieveResponseROC}     allOtherRecords
    ${OtherRecords}        run keyword if       ${status1}==True     get from dictionary     ${RetrieveResponseROC}     allOtherRecords
    ${OtherRecords_Length}      run keyword if       ${status1}==True    get length      ${OtherRecords}
    ${DatesList}       run keyword if       ${status1}==True     create list
    ${DatesList}        run keyword if       ${status1}==True    Validation of ROC deleted record        ${OtherRecords}     ${OtherRecords_Length}      ${DatesList}
    run keyword if       ${status1}==True        log     ${DatesList}
    run keyword if       ${status1}==True        list should not contain value       ${DatesList}        ${effDate}

Validation of ROC deleted record
    [Arguments]     ${OtherRecords}     ${OtherRecords_Length}      ${DatesList}
    :FOR   ${i}      IN RANGE    0  ${OtherRecords_Length}
    \   ${OtherRecordsDate}     get from dictionary     ${OtherRecords[${i}]}     effDt
    \   ${OtherRecordsDate}     evaluate  '${OtherRecordsDate}'.replace('-','')
    \   append to list      ${DatesList}        ${OtherRecordsDate}
    [Return]    ${DatesList}

ROC Retrieve validations
    [Arguments]         ${response}     ${effDateTm}        ${status}       ${CicList}
    ${RetrievedDate}        get from dictionary     ${response}     effDt
    should be equal     ${RetrievedDate}        ${effDateTm}
    ${RetrievedStatus}        get from dictionary     ${response}     status
    should be equal     ${RetrievedStatus}        ${status}
    ${RetrievedCicCode}        get from dictionary     ${response}     cicCodeList
    sort list       ${RetrievedCicCode}
    sort list       ${CicList}
    should be equal     ${RetrievedCicCode}        ${CicList}

CLA Delete
    [Arguments]          ${token}       ${entity}
    ${resp}      GET METHOD    ${token}     ${GET_CLA_RETRIEVE_Entity}${entity}       ${SuccessResponse}
    log     ${resp}
    should not be empty             ${resp}
    ${resp_recVersionId}     get from dictionary         ${resp}         recVersionId
    ${Delresp}      Delete Method   ${token}       ${GET_CLA_RETRIEVE_Entity}       ${entity}    ${resp_recVersionId}       ${SuccessResponse}
    should be empty     ${Delresp}

Delete RDC
    [Arguments]  ${token}    ${pots_Num}
    ${RDCretrive}      GET METHOD      ${token}      ${GET_RDC_RETRIEVE_POTSNUM}${pots_Num}       ${SuccessResponse}
    log     ${RDCretrive}
    should not be empty         ${RDCretrive}
    ${recVersionId}      get from dictionary      ${RDCretrive}         recVersionId
    ${Delresp}      Delete Method   ${token}       ${GET_RDC_RETRIEVE_POTSNUM}       ${pots_Num}    ${recVersionId}       ${SuccessResponse}
    should be empty     ${Delresp}

Delete RAC
    [Arguments]  ${token}    ${pots_Num}
    ${RACretrive}      GET METHOD      ${token}      ${GET_Retrieve_RAC}${pots_Num}       ${SuccessResponse}
    log     ${RACretrive}
    should not be empty         ${RACretrive}
    ${recVersionId}      get from dictionary      ${RACretrive}         recVersionId
     ${requestData}    evaluate    json.loads('''${RAC_deleteReqData}''')    json
    set to dictionary   ${requestData}          potsNum=${pots_Num}
    set to dictionary   ${requestData}          recVersionId=${recVersionId}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${deleteResponse}         PUT Method        ${token}      ${PUT_Delete_RAC}     ${reqBody}     ${successResponse}
    should be empty     ${deleteResponse}

RDC Check
    [Arguments]         ${token}        ${num}      ${OCNID}     ${respOrgList}
    ${requestData}    evaluate    json.loads('''${RDC_All_Parameters_req_Body}''')    json
    set to dictionary   ${requestData}      potsNum=${num}
    set to dictionary   ${requestData}      ocn=${OCNID}
    set to dictionary   ${requestData}      respOrgList=${respOrgList}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method     ${token}    ${RDC_Create}           ${reqBody}        ${successresponse}
    log     ${resp}
    should not be empty             ${resp}
    ${RDCrecVersionId}     get from dictionary         ${resp}         recVersionId

CLA Check
    [Arguments]         ${token}        ${Entity}  ${respOrgList}
    ${requestData}    evaluate    json.loads('''${CLACreateReqbody}''')    json
    set to dictionary   ${requestData}      entity=${Entity}
    set to dictionary   ${requestData}      respOrgList=${respOrgList}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method     ${token}    ${CLA_CREATE}           ${reqBody}         ${SuccessResponse}
    log     ${resp}
    should not be empty             ${resp}
    ${recVersionIdCLA}     get from dictionary         ${resp}         recVersionId
    [Return]         ${recVersionIdCLA}

CLE Check
    [Arguments]         ${token}        ${Entity}         ${destNumList}
    ${requestData}    evaluate    json.loads('''${reqbodyForCLECreate}''')    json
    set to dictionary       ${requestData}      entity=${Entity}
    set to dictionary       ${requestData}      destNumList=${destNumList}
    ${reqBody}      evaluate    json.dumps(${requestData})    json
    ${resp}     POST Method     ${token}    ${CLE_CREATE}           ${reqBody}         ${SuccessResponse}
    log     ${resp}
    should not be empty             ${resp}
    ${recVersionIDofCLE}      get from dictionary         ${resp}         recVersionId
    [Return]        ${recVersionIDofCLE}

Create NetWorkId
    [Arguments]          ${token}       ${expectedNetWrkIdStatus}
    ${ListResponse}     GET METHOD   ${token}     ${NET_List_URI}   ${SuccessResponse}
    log      ${ListResponse}
    ${netWrkIdList}     get from dictionary          ${ListResponse}            netWrkIdList
    ${netWrkIdListLength}       get length          ${netWrkIdList}
#    ${requestData}=    evaluate    json.dumps(${netWrkIdList})    json
    ${i}    set variable  0
    ${netWrkId}     set variable  0
    :FOR   ${i}      IN RANGE    0  674
    \   ${netWrkId}     generate random string  2      ABDEFGHIJKLMOPQRTVWXYZ
    \   ${netWrkId}       convert to uppercase  ${netWrkId}
    \   ${Condition}     run keyword and return status    list should contain value      ${netWrkIdList}   ${netWrkId}
    \   log     ${Condition}
    \   Exit For Loop If   ${Condition} == False
#    ${netWrkId}     Check For Duplicate String  ${netWrkIdList}        2      LETTERS     ${EMPTY}     ${EMPTY}
    log      ${netWrkId}
    ${requestData}    evaluate    json.loads('''${reqBodyForNETCreate}''')    json
    set to dictionary       ${requestData}      netWrkId=${netWrkId}
    set to dictionary       ${requestData}      status=${expectedNetWrkIdStatus}
    ${reqBody}      evaluate    json.dumps(${requestData})    json
    ${response}      POST Method           ${token}    ${NET_Create_URI}      ${reqBody}     200
    log          ${response}
    should not be empty             ${response}
    ${recVersionIDofNET}      get from dictionary         ${response}         recVersionId
    [Return]         ${netWrkId}     ${recVersionIDofNET}

Delete NetWorkId if Exists
    [Arguments]      ${token}        ${netWrkId}
    ${NETRetrieve}      GET METHOD      ${token}     ${NET_Retrieve_URI}${netWrkId}       ${SuccessResponse}
    log     ${NETRetrieve}
    should not be empty         ${NETRetrieve}
    ${NETRetrieveStatus}        run keyword and return status       dictionary should not contain key       ${NETRetrieve}       errList
    ${recVersionId}     run keyword if      ${NETRetrieveStatus}==True          get from dictionary      ${NETRetrieve}         recVersionId
    ${recVersionIDofNETAfterUpdate}          run keyword if      ${NETRetrieveStatus}==True         Update NetworkId        ${token}        ${netWrkId}        DISCONNECT      ${recVersionId}
    ${Delresp}      run keyword if      ${NETRetrieveStatus}==True       Delete Method   ${token}      ${NET_Delete_URI}     /netWrkId/${netWrkId}       ${recVersionIDofNETAfterUpdate}       ${SuccessResponse}
    run keyword if      ${NETRetrieveStatus}==True      should be empty     ${Delresp}
    ${NETRetrieve}      GET METHOD      ${token}     ${NET_Retrieve_URI}${netWrkId}       ${SuccessResponse}
    log     ${NETRetrieve}
    validation for error message        ${NETRetrieve}     ${NetworkIdNotExistsErrMsg}     ${ERROR}        ${NetworkIdNotExistsErrCode}

Update NetworkId
    [Arguments]      ${token}        ${netWrkId}        ${expectedNetWrkIdStatus}       ${recVersionId}
    ${requestData}    evaluate    json.loads('''${reqBodyForNETCreate}''')    json
    set to dictionary       ${requestData}      netWrkId=${netWrkId}
    set to dictionary       ${requestData}      status=${expectedNetWrkIdStatus}
    set to dictionary       ${requestData}      recVersionId=${recVersionId}
    ${reqBody}      evaluate    json.dumps(${requestData})    json
    ${response}      PUT Method           ${token}    ${NET_Update_URI}      ${reqBody}     ${SuccessResponse}
    log          ${response}
    should not be empty             ${response}
    ${recVersionIDofNETAfterUpdate}      get from dictionary         ${response}         recVersionId
    [Return]        ${recVersionIDofNETAfterUpdate}

NLA Create
    [Arguments]          ${token}       ${netWrkId}         ${respOrgList}
    ${requestData}    evaluate    json.loads('''${reqBodyForNLACreate}''')    json
    set to dictionary       ${requestData}      netWrkId=${netWrkId}
    set to dictionary       ${requestData}      respOrgList=${respOrgList}
    ${reqBody}      evaluate    json.dumps(${requestData})    json
    ${response}      POST Method           ${token}    ${NLA_Create_URI}      ${reqBody}     ${SuccessResponse}
    log          ${response}
    should not be empty             ${response}
    ${recVersionIDofNLA}      get from dictionary         ${response}         recVersionId
    [Return]        ${recVersionIDofNLA}

NLE Delete
    [Arguments]     ${token}        ${netWrkId}
    ${NLEretrive}      GET METHOD      ${token}      ${NLE_Retrieve_URI}${netWrkId}       ${SuccessResponse}
    log     ${NLEretrive}
    should not be empty         ${NLEretrive}
    ${recVersionId}      get from dictionary      ${NLEretrive}         recVersionId
    ${Delresp}      Delete Method   ${token}      ${NLE_Delete_URI}     ${netWrkId}       ${recVersionId}       ${SuccessResponse}
    should be empty     ${Delresp}

NLE Create
    [Arguments]          ${token}       ${netWrkId}         ${potsNumList}
    ${requestData}    evaluate    json.loads('''${reqbodyForNLECreate}''')    json
    set to dictionary       ${requestData}      netWrkId=${netWrkId}
    set to dictionary       ${requestData}      potsNumList=${potsNumList}
    ${reqBody}      evaluate    json.dumps(${requestData})    json
    ${response}      POST Method           ${token}    ${NLE_Create_URI}      ${reqBody}     ${SuccessResponse}
    log          ${response}
    should not be empty             ${response}
    ${recVersionIDofNLE}      get from dictionary         ${response}         recVersionId
    [Return]        ${recVersionIDofNLE}

NCA Create
    [Arguments]          ${token}       ${netWrkId}         ${ocnList}
    ${requestData}    evaluate    json.loads('''${reqbodyForNCACreate}''')    json
    set to dictionary       ${requestData}      netWrkId=${netWrkId}
    set to dictionary       ${requestData}      ocnList=${ocnList}
    ${reqBody}      evaluate    json.dumps(${requestData})    json
    ${response}      POST Method           ${token}    ${NCA_Create_URI}      ${reqBody}     ${SuccessResponse}
    log          ${response}
    should not be empty             ${response}
    ${recVersionIDofNCA}      get from dictionary         ${response}         recVersionId
    [Return]        ${recVersionIDofNCA}

NCC create
    [Arguments]     ${token}        ${netWrkId}     ${cmpnyCodes}
    ${requestData}    evaluate    json.loads('''${NCCCreateReqbody}''')    json
    set to dictionary       ${requestData}      netWrkId=${netWrkId}
    set to dictionary       ${requestData}      cmpnyCodes=${cmpnyCodes}
    ${reqBody}      evaluate    json.dumps(${requestData})    json
    ${response}      POST Method           ${token}    ${NCC_Create_URI}      ${reqBody}     200
    log          ${response}
    should not be empty             ${response}
    [Return]        ${response}

NCC Delete if Record Exists
    [Arguments]     ${token}        ${netWrkId}
    ${NCCretrive}      GET METHOD      ${token}     ${NCC_Retrieve_URI}/netWrkId/${netWrkId}       ${SuccessResponse}
    log     ${NCCretrive}
    should not be empty         ${NCCretrive}
    ${NCCRetrieveStatus}        run keyword and return status       dictionary should not contain key       ${NCCretrive}       errList
    ${recVersionId}     run keyword if      ${NCCRetrieveStatus}==True          get from dictionary      ${NCCretrive}         recVersionId
    ${Delresp}      run keyword if      ${NCCRetrieveStatus}==True       Delete Method   ${token}      ${NCC_Delete_URI}     /netWrkId/${netWrkId}       ${recVersionId}       ${SuccessResponse}
    run keyword if      ${NCCRetrieveStatus}==True         should be empty     ${Delresp}
    run keyword if      ${NCCRetrieveStatus}==True      Validate Non-Exsting NCC Retrieve Response        ${token}        ${netWrkId}

Validate Non-Exsting NCC Retrieve Response
    [Arguments]         ${token}        ${netWrkId}
    ${NCCretrieve}      GET METHOD      ${token}    ${NCC_Retrieve_URI}/netWrkId/${netWrkId}       ${SuccessResponse}
    log     ${NCCretrieve}
    should not be empty         ${NCCretrieve}
    Validation For Error Message     ${NCCretrieve}     ${NetworkIdNotExistsErrMsg}     ${ERROR}        ${NetworkIdNotExistsErrCode}

Get Pots NPA-NXX
    [Arguments]     ${token}         ${co}      ${ocn}
    ${POTsNPA}      set variable    315
    ${POTsNXX}      set variable    318
    ${lata}      set variable    136
    ${retrieveList}  Retrieve NXL with particular NPA and NXX       ${token}  ${POTsNPA}  ${POTsNXX}  ${successresponse}
    ${NXLRecordsList}           get from dictionary     ${retrieveList}     nxlRecords
    ${todayDate}    get current date
    ${NXLRecordEffDt}  Check and Get New Effective Date      ${NXLRecordsList}     ${todayDate}
    ${requestData}    evaluate    json.loads('''${addNxl_AllParameters_ReqBody}''')    json
    ${effDate}      get from dictionary     ${requestData}      effDt
    set to dictionary   ${requestData}      effDt=${NXLRecordEffDt}
    set to dictionary   ${requestData}      lata=${lata}
    set to dictionary   ${requestData}      ocn=${ocn}
    set to dictionary   ${requestData}      npa=${POTsNPA}
    set to dictionary   ${requestData}      nxx=${POTsNXX}
    set to dictionary   ${requestData}      co=${co}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    Log     ${reqBody}
#To Create NXL record
    ${addNXL}   POST Method  ${token}    ${POST_Add_NXL}      ${reqBody}     ${successresponse}
    should not be empty     ${add_NXL}
    ${recVersionId}         get from dictionary     ${add_NXL}  recVersionId
    ${validateResponseAfterAdd}     Retrieve NXL With EffDate       ${token}     ${successresponse}       ${NXLRecordEffDt}
    log     ${validateResponseAfterAdd}
    [Return]       ${POTsNPA}       ${POTsNXX}      ${NXLRecordEffDt}

Delete NCC and Get Company code
    [Arguments]         ${token}
    ${NCCListretrieve}      GET METHOD      ${token}      ${NCC_List_URI}   ${SuccessResponse}
    log     ${NCCListretrieve}
    ${netWrkIdList}     get from dictionary        ${NCCListretrieve}         netWrkIdList
    ${netWrkIdListLength}       get length      ${netWrkIdList}
    ${netWrkId}     set variable    0
    ${cmpnyCodesList}     create list
    :FOR    ${i}        IN RANGE    0        ${netWrkIdListLength}
    \   ${netWrkId}     get from list            ${netWrkIdList}        ${i}
    \   ${NCCretrieve}      GET Method With NUM       ${token}    ${NCC_Retrieve_URI}   /netWrkId/${netWrkId}       ${SuccessResponse}
    \   log     ${NCCretrieve}
    \   should not be empty         ${NCCretrieve}
    \   ${recVersionId}     get from dictionary     ${NCCretrieve}      recVersionId
    \   ${cmpnyCodesList}       get from dictionary           ${NCCretrieve}              cmpnyCodes
    \   ${cmpnyCodesLength}     get length             ${cmpnyCodesList}
    \   ${CoListLength}     run keyword and return status       should be true      ${cmpnyCodesLength}>1
    \   run keyword if        ${CoListLength}==False       continue for loop
    \   ${RetrieveResponse}     run keyword if        ${CoListLength}==True     get method with num          ${token}        ${NET_Update_URI}     /netWrkId/${netWrkId}       ${SuccessResponse}
    \   ${NetworkIdStatus}      get from dictionary         ${RetrieveResponse}     status
    \   ${NetworkIdActiveStatus}        run keyword and return status       should be equal     ${NetworkIdStatus}      ${UI_Active_Status}
    \   ${NetworkRecversionId}      run keyword if        ${NetworkIdActiveStatus}==False       get from dictionary         ${RetrieveResponse}     recVersionId
    \   ${UpdateRecversionId}      run keyword if        ${NetworkIdActiveStatus}==False      Update NetworkId        ${token}        ${netWrkId}        ACTIVE      ${NetworkRecversionId}
    #\   ${recVersionId}     set variable if     ${NetworkIdActiveStatus}==False     ${UpdateRecversionId}
    \   exit for loop if        ${NetworkIdActiveStatus}==True
    ${CO}       get from list        ${cmpnyCodesList}      0
    remove from list        ${cmpnyCodesList}       0
    ${requestData}    evaluate    json.loads('''${NCCCreateReqbody}''')    json
    set to dictionary       ${requestData}     netWrkId=${netWrkId}
    set to dictionary       ${requestData}     cmpnyCodes=${cmpnyCodesList}
    set to dictionary       ${requestData}      recVersionId=${recVersionId}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    Log     ${reqBody}
    ${UpdateResp}       PUT Method           ${token}      ${NCC_Update_URI}     ${reqBody}     ${SuccessResponse}
    should not be empty         ${UpdateResp}
    ${recVersionIdofNccUpdate}      get from dictionary     ${UpdateResp}      recVersionId
    [Return]        ${netWrkId}         ${CO}

Restore NCC
    [Arguments]         ${token}        ${netWrkId}     ${CO}
    ${NCCretrieve}      GET METHOD      ${token}    ${NCC_Retrieve_URI}/netWrkId/${netWrkId}       ${SuccessResponse}
    log     ${NCCretrieve}
    should not be empty         ${NCCretrieve}
    ${recVersionId}     get from dictionary     ${NCCretrieve}      recVersionId
    ${cmpnyCodesList}       get from dictionary           ${NCCretrieve}              cmpnyCodes
    append to list         ${cmpnyCodesList}       ${CO}
    ${requestData}    evaluate    json.loads('''${NCCCreateReqbody}''')    json
    set to dictionary       ${requestData}     netWrkId=${netWrkId}
    set to dictionary       ${requestData}     cmpnyCodes=${cmpnyCodesList}
    set to dictionary       ${requestData}      recVersionId=${recVersionId}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    Log     ${reqBody}
    ${UpdateResp}       PUT Method           ${token}      ${NCC_Update_URI}     ${reqBody}     ${SuccessResponse}
    should not be empty         ${UpdateResp}
    ${recVersionIdofNccUpdate}      get from dictionary     ${UpdateResp}      recVersionId
    ${NCCretrieve}      GET METHOD      ${token}    ${NCC_Retrieve_URI}/netWrkId/${netWrkId}       ${SuccessResponse}
    log     ${NCCretrieve}
    should not be empty         ${NCCretrieve}
    ${recVersionId}     get from dictionary     ${NCCretrieve}      recVersionId
    ${cmpnyCodesList}       get from dictionary           ${NCCretrieve}              cmpnyCodes
    list should contain value       ${cmpnyCodesList}       ${CO}

Delete OCN
    [Arguments]         ${token}          ${entity}
    ${entityRetrieveResponseBeforeDelete}     GET METHOD      ${token}     ${GET_OCN_Retrieve}${entity}        ${SuccessResponse}
    log         ${entityRetrieveResponseBeforeDelete}
    ${OCNLst}       get from dictionary     ${entityRetrieveResponseBeforeDelete}      ocnLst
    ${recVersionId}     get from dictionary     ${entityRetrieveResponseBeforeDelete}       recVersionId
    ${deleteResp}      Delete Method       ${token}          ${DELETE_OCN}       ${entity}        ${recVersionId}            ${SuccessResponse}
    should be empty     ${deleteResp}
    Retrieve Non-existing OCN Entity And Validate The Response      ${token}      ${entity}

Delete NXL record
    [Arguments]        ${token}      ${NPA}      ${NXX}      ${EffDt}
    ${Modified_Date}        Remove '-' From EffDate         ${EffDt}
    ${retrieveResp}     Retrieve NXL    ${token}  ${NPA}  ${NXX}  ${Modified_Date}  ${successResponse}
    log     ${retrieveResp}
    ${nxlRecords}       get from dictionary          ${retrieveResp}    nxlRecords
    ${recVersionId}         get from dictionary     ${nxlRecords[0]}  recVersionId
    ${requestData}    evaluate    json.loads('''${deleteNxlActiveRecordreqBody}''')    json
    set to dictionary   ${requestData}      effDt=${EffDt}
    set to dictionary   ${requestData}      npa=${NPA}
    set to dictionary   ${requestData}      nxx=${NXX}
    set to dictionary   ${requestData}      recVersionId=${recVersionId}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${resp}     PUT Method      ${token}      ${PUT_Delete_NXL}     ${reqBody}     ${successResponse}
    should be empty     ${resp}

RAC Check
    [Arguments]         ${token}        ${num}      ${OCNID}   ${respOrgList}
    ${requestData}    evaluate    json.loads('''${RAC_AllCreateReqData}''')    json
    set to dictionary   ${requestData}          ocn=${OCNID}
    set to dictionary   ${requestData}          potsNum=${num}
    set to dictionary   ${requestData}          respOrgList=${respOrgList}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${createResponse}             POST Method     ${token}    ${POST_RAC}      ${reqBody}     ${successResponse}
    ${RACrecVersionId}         get from dictionary         ${createResponse}   recVersionId
    [Return]           ${RACrecVersionId}

Retrieve NCC
    [Arguments]     ${token}        ${netWrkId}
    ${NCCretrieve}      GET METHOD      ${token}    ${NCC_Retrieve_URI}/netWrkId/${netWrkId}       ${SuccessResponse}
    log     ${NCCretrieve}
    should not be empty         ${NCCretrieve}
    ${recVersionId}     get from dictionary     ${NCCretrieve}      recVersionId
    ${cmpnyCodesList}       get from dictionary           ${NCCretrieve}              cmpnyCodes
    [Return]        ${cmpnyCodesList}

Delete NCC
    [Arguments]         ${token}        ${netWrkId}
    ${NCCRetrieve}      GET METHOD      ${token}     ${NCC_Retrieve_URI}/netWrkId/${netWrkId}       ${SuccessResponse}
    log     ${NCCRetrieve}
    should not be empty         ${NCCRetrieve}
    ${recVersionId}       get from dictionary      ${NCCRetrieve}         recVersionId
    ${Delresp}      Delete Method   ${token}      ${NCC_Delete_URI}     /netWrkId/${netWrkId}       ${recVersionID}       ${SuccessResponse}
    Should be empty     ${Delresp}
    [Return]        ${Delresp}

Create NCA with new NetworkID and validate
   [Arguments]          ${adminUserOauthToken}
   ${netWrkId}     ${recVersionIDofNET}        Create NetWorkId         ${adminUserOauthToken}       ACTIVE
   set global variable          ${netWrkId}
   ${NetWorkIDToRestore}       ${Ccode}      Delete NCC and Get Company code     ${adminUserOauthToken}
   set global variable          ${NetWorkIDToRestore}
   ${coList}       create list         ${Ccode}
   ${response}        NCC create     ${adminUserOauthToken}        ${netWrkId}     ${coList}
   ${cmpnyCodesList}       Retrieve NCC        ${adminUserOauthToken}        ${netWrkId}
   lists should be equal       ${cmpnyCodesList}       ${coList}
   #Get OCN and corresponding OCN list and delete
   ${entity}       ${OCNLst}       Delete OCN And Get OCN Details      ${adminUserOauthToken}
   set global variable          ${OCNLst}
   set global variable          ${coList}
   set global variable          ${Ccode}
   set global variable          ${entity}
   ${Create_response}      NCA Create       ${adminUserOauthToken}       ${netWrkId}      ${OCNLst}
   ${NcaRecVersionId}   get from dictionary     ${Create_response}   recVersionId
   set global variable          ${NcaRecVersionId}
   #Validation for NCA created
   ${NCA_retrieve_responseAdmin}  GET METHOD    ${adminUserOauthToken}    ${NCA_retrieve_URI}${netWrkId}    ${successResponse}
   should not be empty     ${NCA_retrieve_responseAdmin}
   log  ${NCA_retrieve_responseAdmin}
   dictionary should contain key  ${NCA_retrieve_responseAdmin}   recVersionId
   ${NcaRecVersionIdExpectedAdmin}       get from dictionary     ${NCA_retrieve_responseAdmin}   recVersionId
   should be equal      ${NcaRecVersionId}        ${NcaRecVersionIdExpectedAdmin}
   dictionary should contain key  ${NCA_retrieve_responseAdmin}   conName
   dictionary should contain key  ${NCA_retrieve_responseAdmin}   conPhone
   dictionary should contain key  ${NCA_retrieve_responseAdmin}   conEmail
   dictionary should contain key  ${NCA_retrieve_responseAdmin}   ocnList
   ${OCNList}       create list
   ${OCNList}    get from dictionary     ${NCA_retrieve_responseAdmin}   ocnList
   ${OCNListLen}        get length      ${OCNList}
   ${OCNLstLen}         get length      ${OCNLst}
   should be equal      ${OCNListLen}      ${OCNLstLen}


Delete NCN
    [Arguments]     ${token}     ${PotsNPA}      ${netWrkId}     ${effDt}        ${recVersionId}
    ${Date_Time}        evaluate  '${effDt}'.replace('-','')
    Create Session  endpoint    ${HOST}
    ${uri}   set variable     /v2/ip/scp/ncn/potsnpa/
    ${second}     fetch from right   ${uri}   /v2/ip/
    ${uri}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${uri}
    ${second1}     fetch from right   ${POST_NCN}   /v2/ip/
    ${POST_NCN}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second1}      ${POST_NCN}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}=  Delete Request  endpoint  ${uri}${PotsNPA}/netWrkId/${netWrkId}/effDt/${Date_Time}${recVersionId_URI}${recVersionId}      headers=${headers}
    log     ${resp}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${successresponse}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${POST_NCN}     ${202Accepted}
    ${jsondata}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    Log  ${jsondata}
    should be empty     ${jsondata}
    Delete networkid if exists      ${token}        ${netWrkId}
    ${retrieveResponse}         get method with one parameter       ${token}       ${GET_NCN_netWorkId}       ${netWrkId}     ${successresponse}
    log     ${retrieveResponse}
    Validation For Error Message    ${retrieveResponse}      ${ENANonExistingNetworkIdErrMsg}${netWrkId}${TFNRegistryNotKnown}       ${ERROR}      ${ENANonExistingNetworkIdErrCode}
    [Return]        ${jsondata}

Delete SID
    [Arguments]     ${token}    ${SCPID}
    ${SCPIDRetrieve}      GET METHOD      ${token}      ${Retrieve_SID_WithSCPIDURI}${SCPID}       ${SuccessResponse}
    log     ${SCPIDRetrieve}
    ${SCPDetails}   get from dictionary     ${SCPIDRetrieve}    scpDetails
    ${recVersionID}     get from dictionary     ${SCPDetails[0]}     recVersionId
    ${resp}     Delete Method   ${token}       ${POST_SID_Create}       /scpId/${SCPID}    ${recVersionID}       ${successresponse}
    should be empty    ${resp}

Get Non-Existing NetWorkId
    [Arguments]        ${token}
    ${ListResponse}     GET METHOD   ${token}     ${NET_List_URI}   ${SuccessResponse}
    log      ${ListResponse}
    ${netWrkIdList}     get from dictionary          ${ListResponse}            netWrkIdList
    ${netWrkIdListLength}       get length          ${netWrkIdList}
    ${requestData}=    evaluate    json.dumps(${netWrkIdList})    json
    ${i}    set variable  0
    ${netWrkId}     set variable  0
    :FOR   ${i}      IN RANGE    0  674
    \   ${netWrkId}     generate random string  2      ABCDEFGHIJKLMNOPQRSTUVWXYZ
    \   ${netWrkId}       convert to uppercase  ${netWrkId}
    \   ${Condition}     run keyword and return status    list should contain value      ${requestData}   ${netWrkId}
    \   log     ${Condition}
    \   Exit For Loop If   ${Condition} == False
    log      ${netWrkId}
    [Return]        ${netWrkId}

Retrieve NLE
    [Arguments]         ${token}        ${netWrkId}
    ${NLEretrieve}      GET METHOD with Num     ${token}    ${NLE_Retrieve_URI}     /netWrkId/${netWrkId}       ${SuccessResponse}
    log     ${NLEretrieve}
    should not be empty         ${NLEretrieve}
    [Return]        ${NLEretrieve}

NLE Delete if Record Exists
    [Arguments]     ${token}        ${netWrkId}
    ${NLEretrieve}      Retrieve NLE        ${token}        ${netWrkId}
    ${NLERetrieveStatus}        run keyword and return status       dictionary should not contain key       ${NLEretrieve}       errList
    ${recVersionId}     run keyword if      ${NLERetrieveStatus}==True          get from dictionary      ${NLEretrieve}         recVersionId
    ${Delresp}      run keyword if      ${NLERetrieveStatus}==True       Delete Method   ${token}      ${NLE_Delete_URI}     /netWrkId/${netWrkId}       ${recVersionId}       ${SuccessResponse}
    run keyword if      ${NLERetrieveStatus}==True     should be empty     ${Delresp}
    run keyword if      ${NLERetrieveStatus}==True              Validate Non-Exsting NLE Retrieve Response          ${token}        ${netWrkId}

Validate Non-Exsting NLE Retrieve Response
    [Arguments]         ${token}        ${netWrkId}
    ${NLEretrieve}      Retrieve NLE        ${token}        ${netWrkId}
    Validation For Error Message     ${NLEretrieve}     ${NetworkIdNotExistsErrMsg}     ${ERROR}        ${NetworkIdNotExistsErrCode}

Check And Create NLE with User Resporg Entity
    [Arguments]         ${BR_token}     ${resporgUserStatus1}       ${netWrkId}
        ${EntityExistsInListStatus}     Check NetWorkID exists with User Resporg entity     ${BR_token}        ${netWrkId}
    ${Status}     run keyword and return status       should be equal         ${EntityExistsInListStatus}      True
    run keyword if      ${Status}==False        close session
    ${token}        run keyword if      ${Status}==False        Get Oauthentication Token       ${Admin_Credentials_Track2}
    run keyword if      ${Status}==False        Create NetWorkId With BR         ${token}       ${netWrkId}
    run keyword if      ${resporgUserStatus1} == True       close session
    ${token}        run keyword if      ${resporgUserStatus1} == True       Get Oauthentication Token       ${Admin_Credentials_Track2}
    ${RetrieveResponse}     run keyword if        ${resporgUserStatus1}==True     get method with num          ${token}        ${NET_Update_URI}     /netWrkId/${netWrkId}       ${SuccessResponse}
    ${NetworkIdStatus}      get from dictionary         ${RetrieveResponse}     status
    ${NetworkIdActiveStatus}        run keyword and return status       should be equal     ${NetworkIdStatus}      ${UI_Active_Status}
    ${NetworkRecversionId}      run keyword if        ${NetworkIdActiveStatus}==False       get from dictionary         ${RetrieveResponse}     recVersionId
    ${UpdateRecversionId}      run keyword if        ${NetworkIdActiveStatus}==False      Update NetworkId        ${token}        ${netWrkId}        ACTIVE      ${NetworkRecversionId}
    ${NetWorkIDToRestore}       ${co}       run keyword if       ${resporgUserStatus1} == True            Delete NCC and Get Company code     ${token}
    ${coList}       run keyword if       ${resporgUserStatus1} == True          create list         ${co}
    ${recVersionIDofNCC}    run keyword if       ${resporgUserStatus1} == True           NCC create     ${token}        ${netWrkId}     ${coList}
    ${destNumList}      run keyword if       ${resporgUserStatus1} == True           Get PotsNum      ${token}
    run keyword if       ${resporgUserStatus1} == True       close session
    ${BR_token}     run keyword if       ${resporgUserStatus1} == True      Get Oauthentication Token       ${User_Credentials_Track2}
    ${recVersionIDofNLE}            run keyword if       ${resporgUserStatus1} == True              NLE Create   ${BR_token}        ${netWrkId}        ${destNumList}
    [Return]        ${resporgUserStatus1}       ${EntityExistsInListStatus}           ${NetWorkIDToRestore}       ${co}     ${BR_token}

Check and Create OCN with User Resporg entity
    [Arguments]         ${token}        ${UserResporgIDEntity}
    ${retrieveResponse}     GET METHOD      ${token}     ${GET_OCN_Retrieve}${UserResporgIDEntity}        ${SuccessResponse}
    log         ${retrieveResponse}
    should not be empty      ${retrieveResponse}
    ${ocnLst_foundStatus}     run keyword and return status   dictionary should contain key      ${retrieveResponse}       ocnLst
    ${OCNentityToRestore}       ${OCNLstToRestore}          run keyword if       ${ocnLst_foundStatus} == False        Delete OCN And Get OCN Details      ${token}
    run keyword if      ${ocnLst_foundStatus} == False        create OCN     ${token}     ${UserResporgIDEntity}       ${OCNLstToRestore}
    ${ocnLst}     run keyword if          ${ocnLst_foundStatus}==True     get from dictionary     ${retrieveResponse}       ocnLst
    ...     ELSE        set variable        ${OCNLstToRestore}
    [Return]        ${ocnLst}       ${OCNentityToRestore}            ${ocnLst_foundStatus}

Get PotsNum
    [Arguments]         ${token}
#    ${POTsNPA}       ${POTsNXX}            ${NXLRecordEffDt}           Get Pots NPA-NXX     ${token}       ${co}      ${ocn}
    ${POTsNPA}     set variable         315
    ${POTsNXX}     set variable          318
#    set global variable              ${NXLRecordEffDt}
    ${XXXX}     generate random string  4   1346789
    set global variable         ${XXXX}
    ${num}      set variable          ${POTsNPA}${POTsNXX}${XXXX}
    set global variable         ${num}
    ${destNumList}      create list        ${num}
    [Return]        ${destNumList}

Check NetWorkID exists with User Resporg entity
    [Arguments]         ${token}        ${netWrkId}
    ${Response}     get method         ${token}       ${NET_List_URI}         ${successresponse}
    dictionary should contain key       ${Response}      netWrkIdList
    ${netWrkIdList}     get from dictionary     ${Response}     netWrkIdList
    ${status}       run keyword and return status   list should contain value       ${netWrkIdList}     ${netWrkId}
    ${status}     run keyword if          ${status}==True     set variable       True
    ...     ELSE        set variable         False
    [Return]        ${status}

Create NetWorkId With BR
    [Arguments]         ${token}        ${netWrkId}
    ${reporgId}     get resporgid
    ${UserEntity}       get substring       ${reporgId}     0       2
    ${requestData}    evaluate    json.loads('''${reqBodyForNETCreate}''')    json
    set to dictionary       ${requestData}      netWrkId=${netWrkId}
    set to dictionary       ${requestData}      status=ACTIVE
    ${reqBody}      evaluate    json.dumps(${requestData})    json
    ${response}      POST Method           ${token}    ${NET_Create_URI}      ${reqBody}     200
    log          ${response}
    should not be empty             ${response}
    ${recVersionIDofNET}      get from dictionary         ${response}         recVersionId

Delete NLE
    [Arguments]         ${token}        ${netWrkId}        ${recVersionId}
    ${Delresp}      Delete Method   ${token}      ${NLE_Delete_URI}     /netWrkId/${netWrkId}       ${recVersionId}       ${SuccessResponse}
    log     ${Delresp}
    [Return]        ${Delresp}

Retrieve NLA
    [Arguments]         ${token}        ${netWrkId}
    ${NLAretrieve}      GET METHOD with Num     ${token}    ${NLA_Retrieve_URI}     /netWrkId/${netWrkId}       ${SuccessResponse}
    log     ${NLAretrieve}
    should not be empty         ${NLAretrieve}
    [Return]        ${NLAretrieve}

NLA Delete if Record Exists
    [Arguments]     ${token}        ${netWrkId}
    ${NLAretrieve}      Retrieve NLA        ${token}        ${netWrkId}
    ${NLARetrieveStatus}        run keyword and return status       dictionary should not contain key       ${NLAretrieve}       errList
    ${recVersionId}     run keyword if      ${NLARetrieveStatus}==True          get from dictionary      ${NLAretrieve}         recVersionId
    ${Delresp}      run keyword if      ${NLARetrieveStatus}==True       Delete Method   ${token}      ${NLA_Delete_URI}     /netWrkId/${netWrkId}       ${recVersionId}       ${SuccessResponse}
    run keyword if      ${NLARetrieveStatus}==True     should be empty     ${Delresp}
    run keyword if      ${NLARetrieveStatus}==True              Validate Non-Exsting NLA Retrieve Response          ${token}        ${netWrkId}

Validate Non-Exsting NLA Retrieve Response
    [Arguments]         ${token}        ${netWrkId}
    ${NLEretrieve}      Retrieve NLA        ${token}        ${netWrkId}
    Validation For Error Message     ${NLEretrieve}     ${NetworkIdNotExistsErrMsg}     ${ERROR}        ${NetworkIdNotExistsErrCode}

Check And Create NLA with User Resporg Entity
    [Arguments]         ${BR_token}     ${resporgUserStatus1}       ${netWrkId}
    ${EntityExistsInListStatus}     Check NetWorkID exists with User Resporg entity     ${BR_token}        ${netWrkId}
    ${Status}     run keyword and return status       should be equal         ${EntityExistsInListStatus}      True
    run keyword if      ${Status}==False        close session
    ${token}        run keyword if      ${Status}==False        Get Oauthentication Token       ${Admin_Credentials_Track2}
    run keyword if      ${Status}==False        Create NetWorkId With BR         ${token}       ${netWrkId}
    run keyword if      ${resporgUserStatus1} == True       close session
    ${token}        run keyword if      ${resporgUserStatus1} == True       Get Oauthentication Token       ${Admin_Credentials_Track2}
    ${RetrieveResponse}     run keyword if        ${resporgUserStatus1}==True     get method with num          ${token}        ${NET_Update_URI}     /netWrkId/${netWrkId}       ${SuccessResponse}
    ${NetworkIdStatus}      get from dictionary         ${RetrieveResponse}     status
    ${NetworkIdActiveStatus}        run keyword and return status       should be equal     ${NetworkIdStatus}      ${UI_Active_Status}
    ${NetworkRecversionId}      run keyword if        ${NetworkIdActiveStatus}==False       get from dictionary         ${RetrieveResponse}     recVersionId
    ${UpdateRecversionId}      run keyword if        ${NetworkIdActiveStatus}==False      Update NetworkId        ${token}        ${netWrkId}        ACTIVE      ${NetworkRecversionId}
    ${NetWorkIDToRestore}       ${co}       run keyword if       ${resporgUserStatus1} == True            Delete NCC and Get Company code     ${token}
    ${coList}       run keyword if       ${resporgUserStatus1} == True          create list         ${co}
    ${recVersionIDofNCC}    run keyword if       ${resporgUserStatus1} == True           NCC create     ${token}        ${netWrkId}     ${coList}
    ${RespOrgList}      run keyword if       ${resporgUserStatus1} == True         Create list       ${respOrgId}
    run keyword if       ${resporgUserStatus1} == True       close session
    ${BR_token}     run keyword if       ${resporgUserStatus1} == True      Get Oauthentication Token       ${User_Credentials_Track2}
    ${recVersionIDofNLE}            run keyword if       ${resporgUserStatus1} == True              NLA Create   ${BR_token}         ${netWrkId}        ${RespOrgList}
    ${UserResporgIDEntity}          set variable         ${netWrkId}
    [Return]        ${resporgUserStatus1}   ${EntityExistsInListStatus}           ${NetWorkIDToRestore}       ${co}     ${BR_token}

Delete NLA
    [Arguments]         ${token}        ${netWrkId}         ${recVersionId}
    ${Delresp}      Delete Method   ${token}      ${NLA_Delete_URI}     /netWrkId/${netWrkId}       ${recVersionId}       ${SuccessResponse}
    log     ${Delresp}
    [Return]        ${Delresp}

Delete NAC if Exists
   [Arguments]      ${token}        ${netWrkId}
   ${NACRetrieve}      GET METHOD      ${token}     ${NAC_retrieve_URI}${netWrkId}       ${SuccessResponse}
   log     ${NACRetrieve}
   should not be empty         ${NACRetrieve}
   ${NACRetrieveStatus}        run keyword and return status       dictionary should not contain key       ${NACRetrieve}       errList
   ${recVersionId}     run keyword if      ${NACRetrieveStatus}==True          get from dictionary      ${NACRetrieve}         recVersionId
   ${Delresp}      run keyword if      ${NACRetrieveStatus}==True       Delete Method   ${token}      ${NAC_Delete_URI}     ${netWrkId}       ${recVersionId}       ${SuccessResponse}
   run keyword if      ${NACRetrieveStatus}==True      should be empty     ${Delresp}
   ${NACRetrieve}      GET METHOD      ${token}     ${NAC_Retrieve_URI}${netWrkId}       ${SuccessResponse}
   log     ${NACRetrieve}
   should not be empty         ${NACRetrieve}
   validation for error message        ${NACRetrieve}    ${NAC_NotExistsErrMsg}     ${ERROR}        ${NAC_NotExistsErrCode}

Validation of CPR creation
    [Arguments]   ${token}     ${TollFreeNumber}        ${custRecStatusExpected}         ${ExpectedcustRecCompPart}
    # View CR
    ${retrieveResponse}      GET METHOD          ${token}      ${CAD_GET_VIEW}${TollFreeNumber}           ${successResponse}
    should not be empty     ${retrieveResponse}
    log      ${retrieveResponse}
    set global variable         ${retrieveResponse}
    #validation of retrieve response
    ${TFN}       get from dictionary      ${retrieveResponse}     num
    should be equal     ${TFN}         ${TollFreeNumber}
    ${NumStatus}       get from dictionary      ${retrieveResponse}     numStatus
    should be equal     ${NumStatus}         ${ASSIGNED_Status}
    ${custRecordStatus}       get from dictionary      ${retrieveResponse["lstEffDtTms"][0]}     custRecStat
    should be equal     ${custRecordStatus}         ${custRecStatusExpected}
    ${lstEffDtTm}       get from dictionary      ${retrieveResponse["lstEffDtTms"][0]}     effDtTm
    should be equal      ${lstEffDtTm}     ${futureEffDate}
    ${custRecCompPart}       get from dictionary      ${retrieveResponse["lstEffDtTms"][0]}     custRecCompPart
    should be equal      ${custRecCompPart}     ${ExpectedcustRecCompPart}

Create RespOrgId GAN GUN
    [Arguments]     ${token}
    ${respOrgEntityList}     GET METHOD      ${token}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_ENITY}   ${successResponse}
    ${respOrgList}     get from dictionary     ${respOrgEntityList}     respOrgList
    ${respOrgEntity}  set variable  ${respOrgList[0]["respOrgEntity"]}
    ${respOrgUnitList}     GET METHOD      ${token}     ${ADD_MODIFY_RETRIEVE_LIST_RESPORG_UNIT}   ${successResponse}
    ${respOrgUnitListResponse}    Parse Request Body   ${respOrgEntityList}     respOrgList
    ${respOrgUnitString}     Check For Duplicate String      ${respOrgUnitListResponse}      3      [LETTERS][NUMBERS]      ${respOrgEntity}     ${EMPTY}
    ${createRespOrgUnitResponse}        Create RespOrg Unit     ${token}  ${createRespOrgUnitRequestBody}    ${successResponse}    ${respOrgEntity}  ${respOrgUnitString}
    should not be empty     ${createRespOrgUnitResponse}
    ${recVersionId}     get from dictionary     ${createRespOrgUnitResponse}        recVersionId
    [Return]      ${respOrgUnitString}    ${recVersionId}

Delete GAN
    [Arguments]     ${token}    ${respOrgId}    ${recVersionId}
    ${response}   delete method       ${token}       ${GET_GAN_RespId}    ${respOrgId}    ${recversionId}    ${successresponse}
    should be empty   ${response}
    ${GANRespValues}     GET METHOD      ${token}        ${GET_GAN_RespId}${respOrgId}     ${successResponse}
    log    ${GANRespValues}
    dictionary should contain key     ${GANRespValues}     errList
    Validation For Error Message    ${GANRespValues}     ${GAN_NoRecord_ErrMsg}       ${ERROR}    ${GAN_NoRecord_ErrCode}

Delete respOrg Id GAN GUN
    [Arguments]     ${token}    ${respOrgId}    ${recVersionId}
    ${responseData}     Disconnect RespOrg Unit     ${token}     ${deleteOrDisconnectRespOrgUnitRequestBody}   ${respOrgId}     ${recVersionId}      ${SuccessResponse}
    ${recVersionId}             get from dictionary     ${responseData}         recVersionId
    ${Del_response}    Delete RespOrg Unit     ${token}     ${deleteRespOrgUnitRequestBody}    ${respOrgId}     ${recVersionId}   ${successResponse}
    should be empty     ${Del_response}

Delete GUN
    [Arguments]     ${token}    ${respOrgId}    ${recVersionId}
    ${response}   delete method       ${token}       ${GET_GUN_RespId}    ${respOrgId}    ${recversionId}    ${successresponse}
    should be empty   ${response}
    ${GUNRespValues}     GET METHOD      ${token}        ${GET_GUN_RespId}${respOrgId}     ${successResponse}
    log    ${GUNRespValues}
    dictionary should contain key     ${GUNRespValues}     errList
    Validation For Error Message    ${GUNRespValues}    ${No_Record_ErrMsg}         ${ERROR}    ${No_Record_ErrCode}

Disconnect and Delete RespOrg Unit
    [Arguments]    ${token}    ${respOrgUnitName}   ${RespOrg_recVersionId}         ${status_code}
    ${Retrieve_response}    GET METHOD      ${token}     ${RETRIEVE_RESPORG_UNIT_WITH_SPECIFIC_UNIT}${respOrgUnitName}   ${status_code}
    ${status}       run keyword and return status   validation for error message    ${Retrieve_response}        ${NoRecordsFoundErrMsg}     ${ERROR}        ${NoRecordsFoundErrCode}
    #${recVersionId}     run keyword if      ${Status}==False        get from dictionary     ${Retrieve_response}         recVersionId
    ${responseData}     run keyword if      ${Status}==False        Disconnect RespOrg Unit     ${token}     ${deleteOrDisconnectRespOrgUnitRequestBody}  ${respOrgUnitName}     ${RespOrg_recVersionId}      ${SuccessResponse}
    ${Disconnect_recVersionId}       run keyword if      ${Status}==False      get from dictionary     ${responseData}         recVersionId
    #Delete RespOrg Entity
    ${Delete_responseData}     run keyword if      ${Status}==False        Delete RespOrg Unit     ${token}     ${deleteRespOrgUnitRequestBody}  ${respOrgUnitName}     ${Disconnect_recVersionId}   ${successResponse}
    run keyword if      ${Status}==False        log     ${Delete_responseData}
    run keyword if      ${Status}==False        should be empty     ${Delete_responseData}

Delete NCO if Exists
    [Arguments]     ${token}    ${newNPA}
    ${retrieveResponse}     GET METHOD      ${token}     ${Retrieve_NCO_with_NPACode}${newNPA}       ${SuccessResponse}
    ${Status}       run keyword and return status       dictionary should contain key       ${retrieveResponse}     recVersionId
    run keyword if        ${Status}==True       Delete NCO     ${token}        ${newNPA}
    ...      ELSE        log       NCO already deleted.

Delete NCO
    [Arguments]     ${token}    ${newNPA}
    ${retrieveResponse}     GET METHOD      ${token}     ${Retrieve_NCO_with_NPACode}${newNPA}       ${SuccessResponse}
    ${recVersionId}     get from dictionary         ${retrieveResponse}     recVersionId
    Delete Method   ${token}       ${Retrieve_NCO_with_NPACode}       ${newNPA}    ${recVersionId}       ${SuccessResponse}
    ${retrieveResponse}     GET METHOD      ${token}     ${Retrieve_NCO_with_NPACode}${newNPA}       ${SuccessResponse}
    Validation For Error Message    ${retrieveResponse}     ${No_Record_ErrMsg}     ${ERROR}    ${No_Record_ErrCode}

NCO Retrieve response Validation
    [Arguments]     ${retrieveResponse}     ${Open_X_Dt}    ${Open_Date}    ${LATA}     ${ValidState}  ${NPA}   ${ActiveNetWorkId}
    ${Status}   get from dictionary     ${retrieveResponse}     status
    should be equal     ${Status}       ${PENDING_STATE}
    ${Retrieved_OpenXDt}   get from dictionary     ${retrieveResponse}     openXDt
    should be equal     ${Retrieved_OpenXDt}       ${Open_X_Dt}
    ${Retrieved_OpenDt}   get from dictionary     ${retrieveResponse}     openDt
    should be equal     ${Retrieved_OpenDt}       ${Open_Date}
    ${Latalist}     get from dictionary     ${retrieveResponse}     lataList
    ${LataStatus}       get from dictionary         ${Latalist[0]}      enabled
    should be equal         ${LataStatus}       Y
    ${LataValue}       get from dictionary         ${Latalist[0]}      lata
    should be equal         ${LataValue}       ${LATA}
    ${State}      get from dictionary       ${retrieveResponse}     state
    should be equal         ${State}       ${ValidState}
    ${ExistingNPAlist}     get from dictionary     ${retrieveResponse}     existingNPAList
    ${ExistingNPAlistStatus}       get from dictionary         ${ExistingNPAlist[0]}      enabled
    should be equal         ${ExistingNPAlistStatus}       Y
    ${NPAValue}       get from dictionary         ${ExistingNPAlist[0]}      npa
    should be equal         ${NPAValue}       ${NPA}
    ${ExistingNetIDlist}     get from dictionary     ${retrieveResponse}     netWrkIdList
    ${length}       get length      ${ExistingNetIDlist}
    ${ListOfNetworks}     create list
    :FOR    ${i}        IN RANGE    0       ${length}
    \   ${Network}     get from dictionary     ${ExistingNetIDlist[${i}]}     netWrkId
    \   append to list     ${ListOfNetworks}     ${Network}
    sort list       ${ListOfNetworks}
    ${ExistingNetIDlistStatus}       get from dictionary         ${ExistingNetIDlist[0]}      enabled
    should be equal         ${ExistingNetIDlistStatus}       Y
    should be equal         ${ListOfNetworks[0]}       ${ActiveNetWorkId}

Get ACTIVE networkId from given NET List
    [Arguments]        ${token}     ${netWrkIdList}
    ${netWrkIdListLength}     get length        ${netWrkIdList}
    ${i}    set variable    0
    ${ActiveNetWorkId}      set variable    0
    :FOR    ${i}       IN RANGE        0       ${netWrkIdListLength}
    \   ${ActiveNetWorkId}     get from list       ${netWrkIdList}     ${i}
    \   ${Response}     GET METHOD   ${token}     /v2/ip/scp/net/netWrkId/${ActiveNetWorkId}   ${SuccessResponse}
    \   log      ${Response}
    \   ${NetWorkID_status}       get from dictionary         ${Response}     status
    \   ${result}       run keyword and return status       should be equal       ${NetWorkID_status}        ACTIVE
    \   exit for loop if        ${result}==True
    [Return]        ${ActiveNetWorkId}

Validation for WRA
    [Arguments]    ${retrievWRA}
    dictionary should contain key        ${retrievWRA}          recVersionId
    dictionary should contain key        ${retrievWRA}          numCnt
    dictionary should contain key        ${retrievWRA}          mrktShare
    dictionary should contain key        ${retrievWRA}          mrktShareAlloc
    dictionary should contain key        ${retrievWRA}          fixedAlloc
    dictionary should contain key        ${retrievWRA}          manualAlloc
    dictionary should contain key        ${retrievWRA}          entityLimit
    dictionary should contain key        ${retrievWRA}          creditAdded
    dictionary should contain key        ${retrievWRA}          adjustedLimit
    dictionary should contain key        ${retrievWRA}          numReserved
    dictionary should contain key        ${retrievWRA}          remAlloc
    dictionary should contain key        ${retrievWRA}          manualOverride
    ${manualOverrideWRA}       get from dictionary         ${retrievWRA}        manualOverride
    set global variable     ${manualOverrideWRA}
    ${manualAllocWRA}       get from dictionary         ${retrievWRA}        manualAlloc
    set global variable     ${manualAllocWRA}
    ${recVersionIdWRA}       get from dictionary         ${retrievWRA}        recVersionId
    set global variable     ${recVersionIdWRA}

Validation for RMS
    [Arguments]    ${retrieveRMS}
    dictionary should contain key        ${retrieveRMS}          recVersionId
    dictionary should contain key        ${retrieveRMS}          dtLastUpdated
    dictionary should contain key        ${retrieveRMS}          updatedBy
    dictionary should contain key        ${retrieveRMS}          numAlloc
    dictionary should contain key        ${retrieveRMS}          allocEndDt
    dictionary should contain key        ${retrieveRMS}          spareCnt
    dictionary should contain key        ${retrieveRMS}          entityCnt
    dictionary should contain key        ${retrieveRMS}          mrktShare
    dictionary should contain key        ${retrieveRMS}          credit
    dictionary should contain key        ${retrieveRMS}          manualOverride
    ${manualOverrideRMS}       get from dictionary         ${retrieveRMS}        manualOverride
    set global variable     ${manualOverrideRMS}
    ${recVersionIdRMS}       get from dictionary         ${retrieveRMS}        recVersionId
    set global variable     ${recVersionIdRMS}

Update WRA
    [Arguments]          ${token}         ${entity}       ${manualAllocValue}       ${recVersionIdWRA}
    ${requestData}    evaluate    json.loads('''${ReqBodyForWraUpdate}''')    json
    set to dictionary       ${requestData}      entity=${entity}
    set to dictionary      ${requestData}       manualAlloc=${manualAllocValue}
    set to dictionary       ${requestData}       recVersionId=${recVersionIdWRA}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method         ${token}        ${PUT_WRA_Update}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    [Return]        ${reqBody}      ${resp}

Update REL for numAllocInd
    [Arguments]          ${token}       ${numAllocIndValue}       ${recVersionIdREL}
    ${retrievREL}    GET METHOD     ${token}    ${GET_REL_VIEW}     ${successResponse}
    should not be empty     ${retrievREL}
    log     ${retrievREL}
    ${recVersionIdREL}      get from dictionary     ${retrievREL}       recVersionId
    ${requestData}    evaluate    json.loads('''${ReqBodyForRelUpdate}''')    json
    set to dictionary      ${requestData}       numAllocInd=${numAllocIndValue}
    set to dictionary       ${requestData}       recVersionId=${recVersionIdREL}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method         ${token}        ${REL_UPDATE}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    [Return]        ${reqBody}      ${resp}

Update SPH for EntityAffiliation
    [Arguments]          ${token}         ${EntityAffiliationValue}       ${recVersionIdSPH}
    ${requestData}    evaluate    json.loads('''${ReqBodyForSPHUpdate_EAF}''')    json
    set to dictionary      ${requestData["parameterValues"][0]}       value=${EntityAffiliationValue}
    set to dictionary      ${requestData["parameterValues"][0]}       recVersionId=${recVersionIdSPH}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method         ${token}        ${PUT_SPH_Update}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    ${recVersionIdSPH}      get from dictionary     ${resp["parameterValues"][0]}          recVersionId
    [Return]        ${reqBody}      ${resp}

Update RMS
    [Arguments]          ${token}         ${ManualOverrideValue}       ${recVersionIdRMS}
    ${requestData}    evaluate    json.loads('''${ReqBodyForRmsUpdateMO}''')    json
    set to dictionary      ${requestData}       manualOverride=${ManualOverrideValue}
    set to dictionary       ${requestData}       recVersionId=${recVersionIdRMS}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method         ${token}        ${PUT_RMS_Update}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    ${recVersionIdRMS}      get from dictionary     ${resp}          recVersionId

effective date and time for disconnect
    [Arguments]     ${Date}
    ${x}        get substring        ${Date}       14  16
    ${a}=   Evaluate   int(round((${x})/15))
    log      ${a}
    ${status}       run keyword and return status       should be true      ${a}==0
    ${Date_Time}        run keyword if     ${status}== True         format minute           ${Date}       15
    return from keyword if    ${status}== True           ${Date_Time}
    ${status1}       run keyword and return status       should be true      ${a}==1
    ${Date_Time}        run keyword if     ${status1}== True           format minute           ${Date}       30
    return from keyword if     ${status1}== True         ${Date_Time}
    ${status2}       run keyword and return status       should be true      ${a}==2
    ${Date_Time}        run keyword if     ${status2}== True         format minute           ${Date}       45
    return from keyword if    ${status2}== True        ${Date_Time}
    ${status3}       run keyword and return status       should be true      ${a}==3
    ${Date_Time}        run keyword if     ${status3}== True         format hour      ${Date}       00
    log     ${Date_Time}
    [Return]     ${Date_Time}

format minute
    [Arguments]     ${Date}         ${m}
    ${Date_Time}        evaluate  '${Date}'.replace(' ','T')
    ${Date_Time}        fetch from left     ${Date_Time}     :
    ${Date_Time}        Catenate    ${Date_Time}:${m}Z
    [Return]       ${Date_Time}

format hour
    [Arguments]     ${Date}       ${m}
    ${hour}           get substring        ${Date}       11    13
    ${q}         get substring   ${hour}   0   1
    ${status}       run keyword and return status       should be equal     ${q}          0
    ${x}    run keyword if   ${status}==True     get substring   ${hour}   1   2
    ${hour}      set variable if           ${status}==True       ${x}    ${hour}
    ${Date_Time}        evaluate  '${Date}'.replace(' ','T')
    ${Date_Time}        fetch from left     ${Date_Time}     T
    ${i}        set variable        1
    ${h}             evaluate    ${hour}+${i}
    ${Date_Time}        Catenate    ${Date_Time}T${h}:${m}Z
    [Return]       ${Date_Time}


Delete active record after disconnecting CR
    [Arguments]      ${token}     ${reservedTFN}
    ${responsedata_View}=    GET METHOD     ${token}     ${GET_LAD_VIEW}${CAD_View}${reservedTFN}         ${SuccessResponse}
    log      ${responsedata_View}
    ${effedtm_activerecord}         get from dictionary         ${responsedata_View}      effDtTm
    ${recversionId}  get from dictionary          ${responsedata_View}       recVersionId
    ${custRecordStatus}       get from dictionary      ${responsedata_View["lstEffDtTms"][0]}     custRecStat
    ${status}     run keyword and return status      should be equal    ${custRecordStatus}    ${ACTIVE}
    sleep   960s
    run keyword if       ${status}==True            Disconnecting an Active CR       ${token}     ${effedtm_activerecord}       ${recversionId}     ${reservedTFN}

Disconnecting an Active CR
    [Arguments]    ${token}     ${effedtm_activerecord}     ${recversionId}         ${reservedTFN}
    ${Date}    get current Date
    ${Date_Time}        evaluate  '${Date}'.replace(' ','T')
    ${current_date}        fetch from left     ${Date_Time}     T
    ${requestData}    evaluate    json.loads('''${ReqBody_Disconnect_params}''')    json
    set to dictionary   ${requestData}          srcNum=${reservedTFN}
    set to dictionary   ${requestData}          tgtNum=${reservedTFN}
    set to dictionary   ${requestData}          srcEffDtTm=${effedtm_activerecord}
    set to dictionary   ${requestData}          tgtEffDtTm=NOW
    set to dictionary   ${requestData}          custRecCompPart=${custRecCompPart_CAD_LAD_CPR}
    set to dictionary   ${requestData}          srcRecVersionId=${recversionId}
    set to dictionary   ${requestData}          endInterceptDt=${current_date}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${responseDataDisconnect}=   POST Method    ${token}    ${POST_CAD_Disconnect}    ${reqBody}    ${SuccessResponse}
    should not be empty    ${responseDataDisconnect}
    log     ${responseDataDisconnect}
    ${SLEEP60s}      set variable        120s
    sleep    ${SLEEP60s}
    ${responsedata_View}=    GET METHOD     ${token}     ${GET_LAD_VIEW}${CAD_View}${reservedTFN}        ${SuccessResponse}
    should not be empty          ${responsedata_View}
    log      ${responsedata_View}
    validation for error message         ${responsedata_View}      ${CAD_CR_Missing_ErrMsg}      ${ERROR}    ${CAD_CR_Missing_ErrCode}
    ${num_Status}        get from dictionary       ${responsedata_View}          numStatus
    should be equal         ${num_Status}            TRANSITIONAL

Create CPO request body
    [Arguments]         ${Admin_Credentials_Track2}         ${RequestbodyCPR}
    UserProfile Login        ${Admin_Credentials_Track2}
    ${token}        Get Token
    set global variable         ${token}
    ${acna}     set variable        ${validAcna_CRO}
    ${cicCode}      set variable        ${validCicCode_CRO}
    ${interLATACarrier}     create list          ${acna}-${cicCode}
    ${intraLATACarrier}     create list         ${acna}-${cicCode}
    ${TollFreeNumber}       Get Reserve Random Number    ${token}     ${ReqBody_Reservetfn}
    set global variable     ${TollFreeNumber}
    ${futureEffDate}       Future Effective Date and Time
    set global variable         ${futureEffDate}
    ${effDate}      evaluate  '${futureEffDate}'.replace('-','')
    ${effDateTm}      evaluate  '${effDate}'.replace(':','')
    set global variable     ${effDateTm}
    ${telco}    Get Telco       ${token}
#    ${interLATACarrier}         ${intraLATACarrier}         ${cicCode}      ${acna}     ${recversionIDForCIS}       Get Intra and Inter LATA Carrier            ${token}
    ${cicCodeList}      create list         ${cicCode}
    set global variable      ${cicCode}
    set global variable      ${acna}
    set global variable      ${recversionIDForCIS}
    set global variable     ${interLATACarrier}
    set global variable     ${intraLATACarrier}
    ${requestData}    evaluate    json.loads('''${RequestbodyCPR}''')    json
    set to dictionary   ${requestData}          num=${TollFreeNumber}
    set to dictionary   ${requestData}          effDtTm=${futureEffDate}
    set to dictionary   ${requestData}          telco=${telco}
    set to dictionary   ${requestData}          interLATACarrier=${interLATACarrier}
    set to dictionary   ${requestData}          intraLATACarrier=${intraLATACarrier}
    set to dictionary   ${requestData}          priIntraLT=${interLATACarrier[0]}
    set to dictionary   ${requestData}          priInterLT=${intraLATACarrier[0]}
    set to dictionary        ${requestData['destNums'][0]}     destNum=${TollFreeNumber}
    ${respOrg}      get from dictionary        ${requestData}       newRespOrgId
    set global variable     ${respOrg}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    [Return]        ${reqBody}

HPU Create
    [Arguments]         ${token}        ${AllAllowValue}        ${successresponse}
    ${respOrgEntityString}       get non-existing entity     ${token}
    ${entity}        ${entityCreationRecVersionId}       Create RespOrg Entity     ${token}   ${respOrgEntityCreate_request_body}   ${successResponse}    ${respOrgEntityString}
    ${requestData}    evaluate    json.loads('''${HPU_createReqBody}''')    json
    set to dictionary       ${requestData}      allowAll=${AllAllowValue}
    set to dictionary       ${requestData}           entity=${entity}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    ${createRespone}        POST Method     ${token}    ${POST_HPU_Create}      ${reqBody}          ${successresponse}
    should not be empty     ${createRespone}
    [Return]        ${createRespone}        ${entity}

HPU Create With All Parameters
    [Arguments]         ${token}        ${AllAllowValue}        ${User1}        ${User2}        ${IsAdminValue_Y}     ${successresponse}
    ${respOrgEntityString}       get non-existing entity     ${token}
    ${entity}        ${entityCreationRecVersionId}       Create RespOrg Entity     ${token}   ${respOrgEntityCreate_request_body}   ${successResponse}    ${respOrgEntityString}
    ${requestData}    evaluate    json.loads('''${HPU_create_AllParameters_ReqBody}''')    json
    set to dictionary       ${requestData}      allowAll=${AllAllowValue}
    set to dictionary       ${requestData}           entity=${entity}
    set to dictionary       ${requestData["allowedLoginIds"][0]}      loginId=${User1}
    set to dictionary       ${requestData["allowedLoginIds"][0]}      isAdmin=${IsAdminValue_Y}
    set to dictionary       ${requestData["allowedLoginIds"][1]}      loginId=${User2}
    set to dictionary       ${requestData["allowedLoginIds"][1]}      isAdmin=${IsAdminValue_Y}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    ${createRespone}        POST Method     ${token}    ${POST_HPU_Create}      ${reqBody}          ${successresponse}
    should not be empty     ${createRespone}
    [Return]        ${createRespone}        ${entity}

HPU Retrieve Response Validations
    [Arguments]     ${Response}     ${Entity}       ${AllowAllExpectedValue}
    dictionary should contain key       ${Response}     recVersionId
    ${RecVersioId}      get from dictionary         ${Response}     recVersionId
    dictionary should contain key       ${Response}     maxHPUPerDay
    dictionary should contain key       ${Response}     remainingHPUCnt
    dictionary should contain key       ${Response}     allowAll
    ${AllowAllValue}        get from dictionary         ${Response}     allowAll
    should be equal     ${AllowAllExpectedValue}        ${AllowAllValue}
    [Return]        ${RecVersioId}

HPU Retrieve Response All Parameters Validations
    [Arguments]     ${Response}     ${Entity}       ${AllowAllExpectedValue}        ${allowedLoginIds}
    dictionary should contain key       ${Response}     recVersionId
    ${RecVersioId}      get from dictionary         ${Response}     recVersionId
    dictionary should contain key       ${Response}     maxHPUPerDay
    dictionary should contain key       ${Response}     remainingHPUCnt
    dictionary should contain key       ${Response}     allowAll
    ${AllowAllValue}        get from dictionary         ${Response}     allowAll
    should be equal     ${AllowAllExpectedValue}        ${AllowAllValue}
    ${length}       get length      ${allowedLoginIds}
    :FOR   ${i}      IN RANGE    0  ${length}
    \   dictionary should contain key       ${allowedLoginIds[${i}]}        loginId
    \   dictionary should contain key       ${allowedLoginIds[${i}]}       isAdmin
    [Return]        ${RecVersioId}

Delete HPU Record
    [Arguments]     ${token}        ${entity}
    ${RetrieveResponse}         get method      ${token}     ${GET_HPU_Retrieve}${entity}   ${successresponse}
    ${status}       run keyword and return status   dictionary should contain key       ${RetrieveResponse}     recVersionId
    ${RecVersioId}      get from dictionary         ${RetrieveResponse}     recVersionId
    ${DeleteResponse}       run keyword if          ${status}==True     Delete Method       ${token}        ${GET_HPU_Retrieve}     ${entity}       ${RecVersioId}      ${SuccessResponse}
    run keyword if          ${status}==True     should be empty     ${DeleteResponse}
    ${RetrieveResponse}         run keyword if          ${status}==True     get method      ${token}     ${GET_HPU_Retrieve}${entity}   ${successresponse}
    run keyword if          ${status}==True     Validation For Error Message        ${RetrieveResponse}     ${No_Record_ErrMsg}     ${ERROR}      ${No_Record_ErrCode}

Delete Entity
    [Arguments]    ${token}     ${respOrgEntityName}    ${status_code}
    ${responseData}     Retrieve RespOrgEntity   ${token}   ${respOrgEntityName}  ${successResponse}
    ${status}       run keyword and return status   dictionary should contain key       ${responseData}     recVersionId
    ${entityRecVersionId}       run keyword if          ${status}==True           get from dictionary        ${responseData}      recVersionId
    Delete RespOrg Entity       ${token}        ${respOrgEntityDelete_request_body}     ${respOrgEntityName}        ${entityRecVersionId}       ${successResponse}

Delete CCI if Exists
    [Arguments]     ${token}    ${MCCID}
    ${response}     GET METHOD      ${token}        ${Retrieve_CCI}${MCCID}         ${SuccessResponse}
    ${Status}       run keyword and return status       dictionary should contain key       ${response}         recVersionId
    run keyword if      ${Status}==True         Delete CCI     ${token}    ${response}     ${MCCID}

Delete CCI
    [Arguments]     ${token}    ${response}     ${MCCID}
    ${recVersionId}     get from dictionary         ${response}         recVersionId
    ${DeleteResp}   Delete Method   ${token}       ${Retrieve_CCI}       ${MCCID}       ${recVersionId}       ${SuccessResponse}
    should be empty    ${DeleteResp}
    ${response}     GET METHOD      ${token}        ${Retrieve_CCI}${MCCID}         ${SuccessResponse}
    dictionary should contain key       ${response}     errList
    Validation For Error Message        ${response}     ${RecordDoesNotExistErrMsg}     ${ERROR}    ${RecordDoesNotExistsErrCode}

Validation for PAD Record Response
   [Arguments]    ${responsedata}     ${EFF_Date_Time}     ${ReserveTFN}
   ${recVersionId}      get from dictionary      ${responsedata}     recVersionId
   ${custRecTFN}      get from dictionary      ${responsedata}     num
   ${effDtTm}      get from dictionary      ${responsedata}     effDtTm
   should be equal       ${custRecTFN}      ${ReserveTFN}
   should be equal       ${effDtTm}      ${EFF_Date_Time}
   [Return]     ${recVersionId}

PAD Retrieve Validations
   [Arguments]     ${responsedata}      ${CreateReqBody}    ${EFF_Date_Time}     ${ReserveTFN}      ${recVersionId}     ${expectedNumStatus}        ${expectedRecordStatus}        ${expectedapprStatus}        ${expectedPriorityStatus}       ${expectedHldndFlagStatus}
   ${RetrievedRecVersionId}      get from dictionary      ${responsedata}     recVersionId
   should be equal      ${recVersionId}     ${RetrievedRecVersionId}
   ${RespOrgId}     get resporgid
   ${ctrlRespOrgId}     get from dictionary     ${responsedata}     ctrlRespOrgId
   should be equal      ${ctrlRespOrgId}        ${RespOrgId}
   #common Response
   ${custRecTFN}      get from dictionary      ${responsedata}     num
   should be equal       ${custRecTFN}      ${ReserveTFN}
   ${numStatus}         get from dictionary     ${responsedata}     numStatus
   should be equal      ${numStatus}        ${expectedNumStatus}
   ${effDtTm}      get from dictionary      ${responsedata}     effDtTm
   #should be equal       ${effDtTm}      ${EFF_Date_Time}
   ${lstEffDtTms}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     effDtTm
   should be equal       ${lstEffDtTms}      ${EFF_Date_Time}
   ${custRecordStatus}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     custRecStat
   should be equal      ${custRecordStatus}     ${expectedRecordStatus}
   ${custRecCompPart}       get from dictionary      ${responsedata["lstEffDtTms"][0]}     custRecCompPart
   should be equal      ${custRecCompPart}      PAD
   ${apprStat}              get from dictionary         ${responsedata["lstEffDtTms"][0]}     apprStat
   should be equal      ${apprStat}          ${expectedapprStatus}
   ${svcOrderNum}          get from dictionary      ${responsedata}         svcOrderNum
   ${CreatedsvcOrderNum}          get from dictionary      ${CreateReqBody}         svcOrderNum
   should be equal      ${svcOrderNum}      ${CreatedsvcOrderNum}
   ${suppFormNum}          get from dictionary      ${responsedata}         suppFormNum
   ${CreatedsuppFormNum}          get from dictionary      ${CreateReqBody}         suppFormNum
   should be equal      ${suppFormNum}      ${CreatedsuppFormNum}
   ${telco}          get from dictionary      ${responsedata}         telco
   ${Createdtelco}          get from dictionary      ${CreateReqBody}         telco
   should be equal      ${telco}      ${Createdtelco}
   ${notes}          get from dictionary      ${responsedata}         notes
   ${Creatednotes}          get from dictionary      ${CreateReqBody}         notes
   should be equal      ${notes}      ${Creatednotes}
   ${agent}          get from dictionary      ${responsedata}         agent
   ${Createdagent}          get from dictionary      ${CreateReqBody}         agent
   should be equal      ${agent}      ${Createdagent}
   ${endSubAddr}          get from dictionary      ${responsedata}         endSubAddr
   ${CreatedendSubAddr}          get from dictionary      ${CreateReqBody}         endSubAddr
   should be equal      ${endSubAddr}      ${CreatedendSubAddr}
   ${conName}          get from dictionary      ${responsedata}         conName
   ${CreatedconName}          get from dictionary      ${CreateReqBody}         conName
   should be equal      ${conName}      ${CreatedconName}
   ${conTel}          get from dictionary      ${responsedata}         conTel
   ${CreatedconTel}          get from dictionary      ${CreateReqBody}         conTel
   should be equal      ${conTel}      ${CreatedconTel}
   ${onAccCust}          get from dictionary      ${responsedata}         onAccCust
   ${CreatedonAccCust}          get from dictionary      ${CreateReqBody}         onAccCust
   should be equal      ${onAccCust}      ${CreatedonAccCust}
   ${destNums}              get from dictionary      ${responsedata}         destNums
   ${Destnum}       getf rom dictionary     ${destNums[0]}      destNum
   should be equal      ${Destnum}      ${ReserveTFN}
   ${priority}          get from dictionary         ${responsedata}         priority
   should be equal      ${priority}     ${expectedPriorityStatus}
   ${hldIndFlag}        get from dictionary         ${responsedata}         hldIndFlag
   should be equal      ${hldIndFlag}       ${expectedHldndFlagStatus}
   ${Template}      get from dictionary     ${responsedata}         tmplName
   ${CreatedTemplate}          get from dictionary      ${CreateReqBody}         tmplName
   should be equal           ${Template}        ${CreatedTemplate}

Delete multiple Pointer Records
    [Arguments]         ${token}        ${TollFreeNumber}
    ${retrieveResponseData}          GET Method With NUM     ${token}     ${POST_PAD_Create}        /tfnum/${TollFreeNumber}   ${SuccessResponse}
    log      ${retrieveResponseData}
    ${Status}       run keyword and return status           dictionary should contain key       ${retrieveResponseData}     errList
    ${ErrMsg}       run keyword if        ${Status} == True       get from dictionary  ${retrieveResponseData['errList'][0]}     errMsg
    ${Status}       run keyword and return status       should be equal        ${CAD_CR_Missing_ErrMsg}     ${ErrMsg}
    return from keyword if        ${Status} == True         ${retrieveResponseData}
    ${recVersionIdForDelete}        get from dictionary         ${retrieveResponseData}     recVersionId
    ${lstEffDtTms}      get from dictionary         ${retrieveResponseData}     lstEffDtTms
    ${TotalNumberOfCRsForTFN}       get length           ${lstEffDtTms}
    ${latestCRIndex}     evaluate        ${TotalNumberOfCRsForTFN}-1
    ${i}    set variable    0
    FOR    ${i}        IN RANGE    0       ${TotalNumberOfCRsForTFN}
       ${j}       evaluate        ${latestCRIndex}-${i}
       ${EffDtTmOfCR}      get from dictionary           ${lstEffDtTms[${j}]}        effDtTm
       ${effDate}      evaluate  '${EffDtTmOfCR}'.replace('-','')
       ${modifiedEffDateTm}      evaluate  '${effDate}'.replace(':','')
       ${response}         Delete Method      ${token}       ${POST_PAD_Create}       /tfnum/${TollFreeNumber}${EffDtTmURI}${modifiedEffDateTm}    ${recVersionIdForDelete}?toSpare=Y       ${SuccessResponse}
       log     ${response}
    #\   ${status}   run keyword and return status   dictionary should contain key       ${response}     errList
       ${status}   run keyword and return status         validation for error message    ${response}     ${CADRecordDeleteFromPADAPIErrMsg}   ${ERROR}       ${CADRecordDeleteFromPADAPIErrCode}
       continue for loop if            ${status}==True
    END
    #\   should be empty     ${response}
    ${retrieveResponseAfterDelete}      GET Method      ${token}     ${GET_PAD_VIEW}${TollFreeNumber}   ${SuccessResponse}
    log     ${retrieveResponseAfterDelete}
    #Validation For Error Message        ${retrieveResponseAfterDelete}        ${CAD_CR_Missing_ErrMsg}        ${ERROR}      ${NoPADExistsErrCode}
    sleep   3s
    ${resp}     Do Number Query         ${token}    ${TollFreeNumber}    ${SuccessResponse}
    ${queryResult}     get from dictionary     ${resp}     queryResult
    ${Status}       get from dictionary     ${queryResult[0]}     status
    #should be equal     ${Status}       ${TFN_status_spare}
    [Return]        ${retrieveResponseData}

Get Bulk List
    [Arguments]     ${token}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${GET_BulkLst}     /v2/ip/
    ${GET_BulkLst}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${GET_BulkLst}
    ${second1}     fetch from right   ${GET_BulkLst_Sync}     /v2/ip/
    ${GET_BulkLst_Sync}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second1}      ${GET_BulkLst_Sync}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint   ${GET_BulkLst}  headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}    ${SuccessResponse}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_BulkLst_Sync}    ${202Accepted}
    ${responsejsondata_bulk}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    [Return]    ${responsejsondata_bulk}


Request In Progress Errcheck
    [Arguments]     ${errResponse}
    ${Error}         get from dictionary    ${errResponse}     errList
    ${ErrorList}       get from dictionary    ${Error[0]}   errMsg
    ${Error_Match}      run keyword and return status     should contain      ${ErrorList}    Request is still in progress.
    [Return]    ${Error_Match}

Retrieve Bulk ID
    [Arguments]    ${token}   ${Bulk_Id}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${Retrieve_BlkId}     /v2/ip/
    ${Retrieve_BlkId}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${Retrieve_BlkId}
    ${second1}     fetch from right   ${Retrieve_BlkId_Sync}     /v2/ip/
    ${Retrieve_BlkId_Sync}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second1}      ${Retrieve_BlkId_Sync}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint   ${Retrieve_BlkId}${Bulk_Id}   headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}    ${SuccessResponse}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}      ${Retrieve_BlkId_Sync}   ${202Accepted}
    ${responsejsondata_bulk}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    set global variable    ${responsejsondata_bulk}
    ${err_status}   run keyword and return status  dictionary should contain key     ${responsejsondata_bulk}    errList
    ${err_found}     run keyword if    ${err_status}==True        Request In Progress Errcheck    ${responsejsondata_bulk}
    sleep  ${SLEEP_FOUR}
    run keyword if   ${err_found}==True    Retrieve Bulk ID     ${token}     ${Bulk_Id}
    log    ${responsejsondata_bulk}
    [Return]    ${responsejsondata_bulk}

Delete BulkId
    [Arguments]     ${token}   ${Bulk_Id}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${Delete_BulkId}     /v2/ip/
    ${Delete_BulkId}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${Delete_BulkId}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json     Authorization=Bearer ${token}
    ${resp}=  Delete Request  endpoint  ${Delete_BulkId}${Bulk_Id}   headers=${headers}
    log     ${resp}
    ${response}   run keyword    To Json  ${resp.content}
    log    ${response}
    #should be empty    ${response}
    ${Retreive_BulkID_resp_afterDel}    Retrieve Bulk ID    ${token}   ${Bulk_Id}
    [Return]     ${Retreive_BulkID_resp_afterDel}

Bulk Number Status Update To SPARE
    [Arguments]     ${Qty}      ${token}        ${resp}
    ${NumList}      get from dictionary          ${resp}        resultList
    :FOR   ${i}   IN RANGE   0      ${Qty}
    \    ${NumberListValue}   get from list    ${NumList}   ${i}
    \    ${number}    get from dictionary    ${NumberListValue}   num
    \    ${resp}     Do Number Query         ${token}     ${number}   ${SuccessResponse}
    \    ${queryResult}     get from dictionary     ${resp}     queryResult
    \    log     ${queryResult}
    \    ${recVersionId}        get from dictionary     ${queryResult[0]}     recVersionId
    \    ${reqData}=    evaluate    json.loads('''${NumUpdate_Reqbody}''')    json
    \    set to dictionary       ${reqData["tfNumList"][0]}      num=${number}
    \    set to dictionary       ${reqData}     status=${TFN_status_spare}
    \    set to dictionary       ${reqData["tfNumList"][0]}      recVersionId=${recVersionId}
    \    ${reqData}=    evaluate    json.dumps(${reqData})    json
    \    PUT Method      ${token}    ${PUT_NU_ACTION}        ${reqData}      ${SuccessResponse}

Get Spare Number list
    [Arguments]    ${token}   ${qty}
    ${spareNumList}    create list
    :FOR  ${i}  IN RANGE   0    ${qty}
    \    ${requestData}=    evaluate    json.loads('''${RequestDataForNUSRandomSearch}''')    json
    \    set to dictionary       ${requestData}     qty=1
    \    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    \    ${resp}     PUT Method      ${token}      ${NUS_Random_URI}     ${reqBody}     ${SuccessResponse}
    \    should not be empty     ${resp}
    \   ${NumberList}=     get from dictionary   ${Resp}     numList
    \   ${num}    get from list   ${NumberList}   0
    \    append to list     ${spareNumList}     ${num}
    sleep  64s
    [Return]    ${spareNumList}

SPH retrieve Update and verfiy
    [Arguments]              ${token}         ${paramType}            ${FULL_COVERAGE_string}          ${NetYKList}
    #Updating Full coverage YK
    #Retrieve
    ${retrieveSPH}    GET METHOD     ${token}    ${GET_SPH_Retrieve_CR}     ${successResponse}
    should not be empty     ${retrieveSPH}
    log     ${retrieveSPH}
    ${SPHparameterListLen}     get length     ${retrieveSPH["parameterList"][0]["parameterValues"]}
    :FOR    ${i}    IN RANGE    0       ${SPHparameterListLen}
    \  ${SPHName}       get from dictionary      ${retrieveSPH["parameterList"][0]["parameterValues"][${i}]}         name
    \  ${FULL_COVERAGE_values}      run keyword     get from dictionary      ${retrieveSPH["parameterList"][0]["parameterValues"][${i}]}         value
    \  ${recVersionIdSPH}      get from dictionary      ${retrieveSPH["parameterList"][0]["parameterValues"][${i}]}         recVersionId
    \   run keyword if     "${SPHName}"== "${FULL_COVERAGE_string}"      run keywords     set global variable       ${FULL_COVERAGE_values}
    \  ...      AND      set variable        ${recVersionIdSPH}     AND         exit for loop
    \  ...      ELSE            continue for loop

    ${FULL_COVERAGE_values_beforeUpdate}        set variable        ${FULL_COVERAGE_values}
    log         ${FULL_COVERAGE_values_beforeUpdate}

    ${reqBody}      ${responseData}     Update SPH          ${token}         ${paramType}      ${FULL_COVERAGE_string}          ${NetYKList}          ${recVersionIdSPH}

    ${recVersionIdSPH}      get from dictionary      ${responseData["parameterValues"][0]}         recVersionId
    ${SPHNameAfterUpdate}       get from dictionary      ${responseData["parameterValues"][0]}         name
    should be equal     ${SPHNameAfterUpdate}       ${FULL_COVERAGE_string}

    #Retrieve again for verification
    ${retrieveSPH}    GET METHOD     ${token}    ${GET_SPH_Retrieve_CR}     ${successResponse}
    should not be empty     ${retrieveSPH}
    log     ${retrieveSPH}
    ${SPHparameterListLen}     get length     ${retrieveSPH["parameterList"][0]["parameterValues"]}
    :FOR    ${i}    IN RANGE    0       ${SPHparameterListLen}
    \  ${SPHName}       get from dictionary      ${retrieveSPH["parameterList"][0]["parameterValues"][${i}]}         name
    \  ${FULL_COVERAGE_values_after}      run keyword     get from dictionary      ${retrieveSPH["parameterList"][0]["parameterValues"][${i}]}         value
    \  ${recVersionIdSPH}      get from dictionary      ${retrieveSPH["parameterList"][0]["parameterValues"][${i}]}         recVersionId
    \   run keyword if     "${SPHName}"== "${FULL_COVERAGE_string}"      run keywords     set global variable       ${FULL_COVERAGE_values_after}
    \  ...      AND      set variable        ${recVersionIdSPH}     AND         exit for loop
    \  ...      ELSE            continue for loop

    ${FULL_COVERAGE_values_AfterUpdate}        set variable        ${FULL_COVERAGE_values_after}
    log         ${FULL_COVERAGE_values_AfterUpdate}
    [Return]        ${FULL_COVERAGE_values_beforeUpdate}        ${recVersionIdSPH}

GET NCN values for NET
   [Arguments]      ${token}        ${AosNet}
   #Compare aosNet's Npa's with that of CRO tree
   ${APINetNpasList}        create list

   #Retrieve NPAs for the Network used
   ${retrieveNCN}    GET METHOD     ${token}    ${GET_NCN_netWorkId}${AosNet}     ${successResponse}
   should not be empty     ${retrieveNCN}
   log     ${retrieveNCN}
   ${APINetNpasList}        create list
   ${NCNparameterListLen}     get length     ${retrieveNCN["ncnList"]}
   :FOR    ${i}    IN RANGE    0       ${NCNparameterListLen}
   \  ${NCNname}       get from dictionary      ${retrieveNCN["ncnList"][${i}]}         potsnpa
   \  ${NCNnameStatus}       get from dictionary      ${retrieveNCN["ncnList"][${i}]["recordsList"][0]}         status
   \  run keyword if        "${NCNnameStatus}"=="ACTIVE"      append to list      ${APINetNpasList}    ${NCNname}
   log     ${APINetNpasList}
   ${APINetNpasList}        remove duplicates       ${APINetNpasList}
   sort list       ${APINetNpasList}
   ${APINetNpasListLen}        get length      ${APINetNpasList}
   log     ${APINetNpasListLen}
   [Return]    ${APINetNpasList}       ${APINetNpasListLen}

CRO EFD Calculation
   [Arguments]          ${futureEffDate}
   ${Date_Time}        Subtract Time From Date      ${futureEffDate}   0.2083333 days
   ${Date_Time}        evaluate  '${Date_Time}'.replace(' ','T')
   log      ${Date_Time}
   ${DateEFD}     fetch from left        ${Date_Time}        T
   log      ${DateEFD}
   ${DateEFD}       evaluate  '${DateEFD}'.replace('-','')
   log      ${DateEFD}
   ${Date_Time}     fetch from right        ${Date_Time}        T
   log      ${Date_Time}
   log      ${Date_Time[0:5]}
   ${TimeSub}      set variable        ${Date_Time[0:5]}
   ${HoursSub}      fetch from left         ${TimeSub}     :
   log      ${HoursSub}
   ${HoursSub}        convert to integer       ${HoursSub}
   log      ${HoursSub}
   ${MinSub}      fetch from right         ${TimeSub}     :
   log      ${MinSub}
   ${futureEffDateEFTime}        run keyword if       "${MinSub}"=="00"         set variable        0
   ...      ELSE IF              "${MinSub}"=="15"      set variable        1
   ...      ELSE IF              "${MinSub}"=="30"      set variable        2
   ...      ELSE IF              "${MinSub}"=="45"      set variable        3
   ...      ELSE       log      "wrong minutes selection."
   log      ${futureEffDateEFTime}
   ${futureEffDateEFTimeZone}       evaluate        ${HoursSub}*4+${futureEffDateEFTime}
   log      ${futureEffDateEFTimeZone}
   ${status}        evaluate        ${futureEffDateEFTimeZone}< 10
   log      ${status}
   ${futureEffDateEFTimeZone}       run keyword if      ${status}== True        catenate        0${futureEffDateEFTimeZone}
   ...      ELSE        set variable        ${futureEffDateEFTimeZone}
   log      ${futureEffDateEFTimeZone}
   ${futureEffDateTime_CRO}         catenate        ${DateEFD}${futureEffDateEFTimeZone}
   log      ${futureEffDateTime_CRO}
   [Return]         ${futureEffDateTime_CRO}

Update SPH
    [Arguments]          ${token}         ${paramType}      ${paramString}          ${paramValue}          ${recVersionIdSPH}
    ${requestData}    evaluate    json.loads('''${ReqBodyForSPHUpdateAllVals}''')    json
    set to dictionary      ${requestData}               parameterType=${paramType}
    set to dictionary      ${requestData["parameterValues"][0]}       value=${paramValue}
    set to dictionary      ${requestData["parameterValues"][0]}       name=${paramString}
    set to dictionary      ${requestData["parameterValues"][0]}       recVersionId=${recVersionIdSPH}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method         ${token}        ${PUT_SPH_Update}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    ${recVersionIdSPH}      get from dictionary     ${resp["parameterValues"][0]}          recVersionId
    [Return]        ${reqBody}      ${resp}

PAD Create in Pending Status
    [Arguments]         ${token}
    ${TollFreeNumber}       Get Reserve Random Number    ${token}     ${ReqBody_Reservetfn}
    ${futureEffDate}       Future Effective Date and Time
    set global variable     ${futureEffDate}
    ${telco}    Get Telco       ${token}
    ${requestData}    evaluate    json.loads('''${RequestbodyforBasicPADCreate}''')    json
    set to dictionary   ${requestData}          num=${TollFreeNumber}
    set to dictionary   ${requestData}          effDtTm=${futureEffDate}
    set to dictionary   ${requestData}          telco=${telco}
    set to dictionary        ${requestData['destNums'][0]}     destNum=${TollFreeNumber}
    set to dictionary   ${requestData}          tmplName=${ActiveTemplateRecord}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${createResponse}     POST Method     ${token}    ${POST_PAD_Create}      ${reqBody}     ${SuccessResponse}
    log     ${createResponse}
    #PAD create response Validations
    ${Recversionid}        Validation for PAD Record Response          ${createResponse}       ${futureEffDate}        ${TollFreeNumber}
    ${retrieveResponse}      GET Method      ${token}     ${GET_PAD_VIEW}${TollFreeNumber}   ${SuccessResponse}
    log     ${retrieveResponse}
    PAD Retrieve Validations     ${retrieveResponse}      ${requestData}        ${futureEffDate}       ${TollFreeNumber}       ${Recversionid}     ${ASSIGNEDSTATE}        ${PENDING_STATE}    NOT REQUIRED     N         N
    [Return]        ${requestData}     ${createResponse}     ${Recversionid}        ${TollFreeNumber}

Create Template Mandatory Param
    [Arguments]     ${token}     ${TmplName}      ${date}        ${lataValue}
    ${reqData}=    evaluate    json.loads('''${Tmpl_Mandatory_Reqbody}''')    json
    set to dictionary     ${reqData}                tmplName=*${TmplName}
    set to dictionary     ${reqData}                effDtTm=${date}
    set to dictionary     ${reqData}                interLATACarrier=${lataValue}
    set to dictionary     ${reqData}                intraLATACarrier=${lataValue}
    set to dictionary     ${reqData}                numTermLine=10
    ${reqData}=    evaluate    json.dumps(${reqData})    json
    log     ${reqData}
    ${resp}     POST Method       ${token}      ${TAD_Create_URI}     ${reqData}     ${SuccessResponse}
    log    ${resp}
    dictionary should contain key     ${resp}    recVersionId
    dictionary should contain key     ${resp}    tmplId
    [Return]     ${resp}

Delete Multiple Template records
    [Arguments]         ${token}        ${TemplateName}
#    ${second}     fetch from right   ${TAD_retrieve_URI}   /v2/ip/
#    ${TAD_retrieve_URI}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${TAD_retrieve_URI}
    ${retrieveResponseData}      GET Method With Sync Timeout      ${token}     ${TAD_retrieve_URI}%2A${TemplateName}   ${SuccessResponse}   ${POST_CAD_Create}
    log      ${retrieveResponseData}
    ${Status}       run keyword and return status           dictionary should contain key       ${retrieveResponseData}     errList
    ${ErrMsg}       run keyword if        ${Status} == True       get from dictionary  ${retrieveResponseData['errList'][0]}     errMsg
    ${Status}       run keyword and return status       should be equal         ${ErrMsg}      ${TAD_DoesnotExists_ErrMsg}
    return from keyword if        ${Status} == True         ${retrieveResponseData}
    ${recVersionIdForDelete}        get from dictionary         ${retrieveResponseData}     recVersionId
    ${lstEffDtTms}      get from dictionary         ${retrieveResponseData}     lstEffDtTms
    ${TotalNumberOfCRsForTFN}       get length           ${lstEffDtTms}
    ${latestCRIndex}     evaluate        ${TotalNumberOfCRsForTFN}-1
    ${i}    set variable    0F
    :FOR    ${i}        IN RANGE    0       ${TotalNumberOfCRsForTFN}
    \   ${retrieveResponseData}          GET Method With Sync Timeout      ${token}     ${TAD_retrieve_URI}%2A${TemplateName}   ${SuccessResponse}   ${POST_CAD_Create}
    \   log      ${retrieveResponseData}
    \   ${recVersionIdForDelete}        get from dictionary         ${retrieveResponseData}     recVersionId
    \   ${j}       evaluate        ${latestCRIndex}-${i}
    \   ${EffDtTmOfCR}      get from dictionary           ${lstEffDtTms[${j}]}        effDtTm
    \   ${effDate}      evaluate  '${EffDtTmOfCR}'.replace('-','')
    \   ${modifiedEffDateTm}      evaluate  '${effDate}'.replace(':','')
    \   ${response}         Delete Method      ${token}       ${TAD_Create_URI}       /tmplName/%2A${TemplateName}${EffDtTmURI}${modifiedEffDateTm}    ${recVersionIdForDelete}       ${SuccessResponse}
    \   log     ${response}
    \   dictionary should not contain key    ${response}    errList
    ${retrieveResponseAfterDelete}      GET Method With Sync Timeout      ${token}     ${TAD_retrieve_URI}%2A${TemplateName}   ${SuccessResponse}   ${POST_CAD_Create}
    log     ${retrieveResponseAfterDelete}
    Validation For Error Message        ${retrieveResponseAfterDelete}        ${TAD_DoesnotExists_ErrMsg}        ${ERROR}      ${TAD_DoesnotExists_ErrCode}
    ${interLATAStatus}      run keyword and return status        dictionary should contain key         ${retrieveResponseData}       intraLATACarrier
    ${interLATACarrier}      run keyword if   ${interLATAStatus} == True       get from dictionary         ${retrieveResponseData}         intraLATACarrier
    ...     ELSE          get from dictionary         ${retrieveResponseData}         interLATACarrier
    ${carrier}      get from list       ${interLATACarrier}     0
    ${acna}  fetch from left      ${carrier}     -
    set global variable     ${acna}
    ${cicCode}  fetch from right      ${carrier}     -
    set global variable    ${cicCode}
    [Return]        ${retrieveResponseData}

Mandatory Param Validation Template
    [Arguments]    ${token}   ${templName}
    ${TADRetrieve_response}     GET METHOD      ${token}        ${TAD_retrieve_URI}%2A${templName}       ${successResponse}
    log     ${TADRetrieve_response}
    dictionary should contain key     ${TADRetrieve_response}    recVersionId
    dictionary should contain key     ${TADRetrieve_response}    ctrlRespOrgId
    dictionary should contain key     ${TADRetrieve_response}    lstEffDtTms
    ${tmplStatus}    get from dictionary     ${TADRetrieve_response['lstEffDtTms'][0]}    tmplRecStat
    should be equal      ${tmplStatus}    ${PENDING_Status_Caps}
    ${recCompPart}    get from dictionary     ${TADRetrieve_response['lstEffDtTms'][0]}    tmplRecCompPart
    should be equal    ${recCompPart}    TAD
    dictionary should contain key     ${TADRetrieve_response['lstEffDtTms'][0]}    effDtTm
    dictionary should contain key     ${TADRetrieve_response['lstEffDtTms'][0]}    apprStat

Transfer Simple TR
    [Arguments]     ${token}     ${TmplName}    ${recVersionId}
    ${Future_Date}    Get Future Effective Date and Time
    ${reqData}=    evaluate    json.loads('''${Tmpl_Mandatory_Transfer_ReqBody}''')    json
    set to dictionary     ${reqData}      srcTmplName=*${TmplName}
    set to dictionary     ${reqData}      srcRecVersionId=${recVersionId}
    set to dictionary     ${reqData}      tgtEffDtTm=${Future_Date}
    set to dictionary     ${reqData}      tgtTmplName=*${TmplName}
    ${reqData}=    evaluate    json.dumps(${reqData})    json
    log     ${reqData}
    ${resp}     POST Method       ${token}      ${TAD_Transfer_URI}     ${reqData}    ${SuccessResponse}
    log    ${resp}
    dictionary should contain key    ${resp}     recVersionId

Update Template Mandatory Param
    [Arguments]     ${token}     ${TmplName}    ${recVersionId}    ${date}
    ${numTermLine}     get random string     3        123456789
    ${reqData}=    evaluate    json.loads('''${Tmpl_Update_Mandatory_Reqbody}''')    json
    set to dictionary     ${reqData}                tmplName=*${TmplName}
    set to dictionary     ${reqData}                recVersionId=${recVersionId}
    set to dictionary     ${reqData}                effDtTm=${date}
    set to dictionary     ${reqData}                numTermLine=${numTermLine}
    ${reqData}=    evaluate    json.dumps(${reqData})    json
    log     ${reqData}
    ${resp}     PUT Method       ${token}      ${TAD_Create_URI}     ${reqData}     ${SuccessResponse}
    log    ${resp}
    dictionary should contain key     ${resp}    recVersionId
    [Return]     ${resp}

All Param Template Validation
    [Arguments]    ${token}   ${templName}
    ${TADRetrieve_response}     GET METHOD      ${token}        ${TAD_retrieve_URI}%2A${templName}       ${successResponse}
    log     ${TADRetrieve_response}
    dictionary should contain key     ${TADRetrieve_response}    recVersionId
    dictionary should contain key     ${TADRetrieve_response}    ctrlRespOrgId
    dictionary should contain key     ${TADRetrieve_response}    lstEffDtTms
    ${cntrlRespOrgId}      get from dictionary     ${TADRetrieve_response}        ctrlRespOrgId
    should be equal      ${cntrlRespOrgId}    BRSAC
    ${tmplStatus}    get from dictionary     ${TADRetrieve_response['lstEffDtTms'][0]}    tmplRecStat
    should be equal      ${tmplStatus}    ${PENDING_Status_Caps}
    ${templ_des}     get from dictionary     ${TADRetrieve_response}       tmplDesc
    should be equal    ${templ_des}      Template record creation
    ${recCompPart}    get from dictionary     ${TADRetrieve_response['lstEffDtTms'][0]}    tmplRecCompPart
    should be equal    ${recCompPart}    TAD
    dictionary should contain key     ${TADRetrieve_response['lstEffDtTms'][0]}    effDtTm
    dictionary should contain key     ${TADRetrieve_response['lstEffDtTms'][0]}    apprStat

Update SPH For Aging Disconnect Value
    [Arguments]          ${token}       ${recVersionIdSPH}
    ${DisconnectValue}      create list         180
    ${requestData}    evaluate    json.loads('''${RequestDataForNUSRandomSearch}''')    json
    set to dictionary      ${requestData}       parameterType=SNA
    ${Values}       create dictionary       recVersionId=${recVersionIdSPH}       name=${NoAgingDisconnect_string}       value=${DisconnectValue}
    ${parameterValues}      create list     ${Values}
    set to dictionary       ${requestData}       parameterValues=${parameterValues}
    ${reqBody}    evaluate    json.dumps(${requestData})    json
    ${resp}     PUT Method         ${token}        ${PUT_SPH_Update}      ${reqBody}      ${SuccessResponse}
    log     ${resp}
    dictionary should contain key       ${resp}     parameterValues
    ${recVersionIdSPH}      get from dictionary     ${resp["parameterValues"][0]}          recVersionId
    ${Disconnectparameter}      get from dictionary     ${resp["parameterValues"][0]}          name
    should be equal         ${Disconnectparameter}      ${NoAgingDisconnect_string}
    [Return]        ${recVersionIdSPH}

Delete multiple Pointer Records List
    [Arguments]   ${token}      ${TollFreeNumberList}
    ${length}     get length    ${TollFreeNumberList}
    :FOR  ${i}  IN RANGE   0     ${length}
    \   ${TollFreeNumber}     get from list    ${TollFreeNumberList}    ${i}
    \   ${retrieveResponseData}    Delete multiple Pointer Records     ${token}        ${TollFreeNumber}

Get Active TemplName
    [Arguments]       ${token}
    ${listTRL}     GET Method With NUM    ${token}        ${TRL_retrieve_URI}   /entity/${BR_Entity}        ${successResponse}
    dictionary should contain key     ${listTRL}    tmplList
    ${TmplList}   get from dictionary      ${listTRL}    tmplList
    log   ${TmplList}
    ${tmplName}    set variable     ${EMPTY}
    ${TmplList_valuesLength}   get length   ${TmplList}
    log  ${TmplList_valuesLength}
    :FOR   ${i}      IN RANGE   1   ${TmplList_valuesLength}
    \   ${TmplList_ValuebyIndex}   get from list    ${TmplList}   ${i}
    \   ${tmplName}    get from dictionary    ${TmplList_ValuebyIndex}      tmplName
    \   ${status}   get from dictionary     ${TmplList_ValuebyIndex}     custRecStat
    \   exit for loop if  "${status}" == "ACTIVE"
    [Return]    ${tmplName}

Get NumberList
    [Arguments]        ${resp}
    ${resultList}     get from dictionary    ${resp}   resultList
    ${length}     get length   ${resultList}
    ${numList}   create list
    :FOR   ${i}      IN RANGE   0   ${length}
    \    ${ValuesPerIndex}   get from list    ${resultList}   ${i}
    \    ${num_found}   run keyword and return status   dictionary should contain key    ${ValuesPerIndex}     num
    \    ${number}  run keyword if   ${num_found}==True   get from dictionary    ${ValuesPerIndex}   num
    \    append to list     ${numList}   ${number}
    [Return]    ${numList}

Consecutive Number check
    [Arguments]     ${numList}
    ${length}   get length  ${numList}
    :FOR    ${i}    IN RANGE    0   ${length}-1
    \   ${FirstNumber}    get from list   ${numList}  ${i}
    \   ${SecondNumberIndex}    evaluate  ${i}+1
    \   ${SecondNumber}   get from list   ${numList}  ${SecondNumberIndex}
    \   ${Diff}   evaluate    ${SecondNumber}-${FirstNumber}
    \   should be true    ${Diff}==${1}

Retrieve Bulk OCA ID

    [Arguments]    ${token}   ${Bulk_Id}
    Create Session  endpoint    ${HOST}
    ${second}     fetch from right   ${RetrieveOCA_BlkId}     /v2/ip/
    ${RetrieveOCA_BlkId}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second}      ${RetrieveOCA_BlkId}
    ${second1}     fetch from right   ${Retrieve_BlkIdOCA_Sync}     /v2/ip/
    ${Retrieve_BlkIdOCA_Sync}     set variable if   '${admin_flag}'=='True'      /v2/ip/admin/${second1}      ${Retrieve_BlkIdOCA_Sync}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
    ${resp}=    Get Request   endpoint    ${RetrieveOCA_BlkId}${Bulk_Id}   headers=${headers}
    ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}    ${SuccessResponse}
    ${responsejsondata1}       run keyword if   ${status}==True     To Json  ${resp.content}
    ${responsejsondata2}         run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}      ${Retrieve_BlkIdOCA_Sync}   ${202Accepted}
    ${responsejsondata_bulk}     set variable if  ${status}==True        ${responsejsondata1}      ${responsejsondata2}
    set global variable    ${responsejsondata_bulk}
    ${err_status}   run keyword and return status  dictionary should contain key     ${responsejsondata_bulk}    errList
    ${err_found}     run keyword if    ${err_status}==True        Request In Progress Errcheck    ${responsejsondata_bulk}
    sleep  ${SLEEP_FOUR}
    run keyword if   ${err_found}==True    Retrieve Bulk OCA ID     ${token}     ${Bulk_Id}
    log    ${responsejsondata_bulk}
    [Return]    ${responsejsondata_bulk}


Retrieve MRO With Bulk ID
    [Arguments]    ${token}   ${GET_MRO_URI}        ${Bulk_Id}
    ${MRO_Resp1}     GET METHOD      ${token}      ${GET_MRO_URI}${BulkId}     ${SuccessResponse}
    log     ${MRO_Resp1}
    ${err_status}   run keyword and return status  dictionary should contain key     ${MRO_Resp1}    errList
    ${err_found}     run keyword if    ${err_status}==True        Request In Progress Errcheck    ${MRO_Resp1}
    sleep  ${SLEEP_FOUR}
    ${MRO_Resp2}        run keyword if   ${err_found}==True    Retrieve MRO With Bulk ID     ${token}     ${GET_MRO_URI}        ${Bulk_Id}
    ${MRO_Resp}     set variable if  ${err_status}==False        ${MRO_Resp1}      ${MRO_Resp2}
    [Return]    ${MRO_Resp}

MRO Response Validations
    [Arguments]         ${MRO_Resp}     ${reqData}      ${CompletedValue}       ${OldResporg}       ${NewResporg}
    ${Description}      get from dictionary     ${MRO_Resp}       requestDesc
    ${requestDesc}      get from dictionary     ${reqData}       requestDesc
    should be equal     ${requestDesc}      ${Description}
    dictionary should contain key       ${MRO_Resp}     userId
    dictionary should contain key       ${MRO_Resp}     respOrgId
    dictionary should contain key       ${MRO_Resp}     newRespOrgId
    ${ResponseResporgId}        get from dictionary     ${MRO_Resp}       respOrgId
    ${ResponseNewResporgId}        get from dictionary     ${MRO_Resp}       newRespOrgId
    should be equal     ${OldResporg}     ${ResponseResporgId}
    should be equal     ${NewResporg}     ${ResponseNewResporgId}
    dictionary should contain key       ${MRO_Resp}     subDtTm
    dictionary should contain key       ${MRO_Resp}     jobStats
    ${Completed}    get from dictionary         ${MRO_Resp["jobStats"]}       completed
    should be equal as integers        ${Completed}        ${CompletedValue}
    ${failed}    get from dictionary         ${MRO_Resp["jobStats"]}       failed
    ${Total}    get from dictionary         ${MRO_Resp["jobStats"]}       total
    ${SUM}      evaluate        ${Completed}+${failed}
    should be equal as integers         ${Total}        ${SUM}

Reverting the Repsorg Id
    [Arguments]         ${token}        ${list}     ${ctrlRespOrgId}
    ${reqData}    evaluate    json.loads('''${RCH_reqBody}''')    json
    set to dictionary       ${reqData}      numList=${list}
    set to dictionary       ${reqData}      ctrlRespOrgId=ATX01
    ${reqBody}      evaluate        json.dumps(${reqData})      json
    ${resp}     POST Method       ${token}      ${POST_RCH_URI}     ${reqBody}     ${202Accepted}
    log     ${resp}
    dictionary should contain key       ${resp}     blkId
    ${BulkId}       get from dictionary     ${resp}     blkId
    ${MRO_Resp}     Retrieve MRO With Bulk ID       ${token}      ${GET_MRO_URI}        ${BulkId}
    dictionary should contain key       ${MRO_Resp}     mroResult

Multiple Numbers Reserve
    [Arguments]         ${qty}      ${token}
    ${reqData}=    evaluate    json.loads('''${RequestDataForNUSRMultipleRandomSearchAndReserve}''')    json
    set to dictionary     ${reqData}      qty=${qty}
    ${reqData}=    evaluate    json.dumps(${reqData})    json
    ${resp}     POST Method       ${token}      ${NUSR_Random_URI}     ${reqData}     ${SuccessResponse}
    log     ${resp}
    Reserve Number Status Validation        ${token}     ${resp}     ${qty}
    ${numList}      get from dictionary     ${resp}   numList
    [Return]        ${numList}

SCP Server Logs CRO
     [Arguments]        ${regex}
     ${SCP_Fuse_Server_ListLen}     get length      ${SCP_Fuse_server_E2E}
     ${FuseLogs}     set variable        "SCP CRO logs"
     :FOR    ${i}    IN RANGE    0       ${SCP_Fuse_Server_ListLen}
     \  ${op}      Open Connection     ${SCP_Fuse_server_E2E[${i}]}
     \  ${userName}        set variable       somos\\epillai
     \  SSHLibrary.Login       ${userName}    Kaali@123   4
     \  ${Logs_path}       set variable        /project/jboss-fuse/data/log/fuse.log
     \  ${output}        write      grep ${TollFreeNumber} ${Logs_path} | grep -E -i -w ${regex} | sed 's?\\[01;31m\\[K??g' | sed 's?\\[m\\[K??g'
     \  sleep       5s
#     \  ${FuseLogsCRO}=    read until regexp      ~]$
     \  ${FuseLogsCRO}=    read
     \  log      ${FuseLogsCRO}
     \  ${FuseLogs}     catenate    SEPARATOR=\n       ${FuseLogs}      ${FuseLogsCRO}
     \  log     ${FuseLogs}
     \  set global variable        ${FuseLogs}
     \  Close Connection

SCP Server Logs CRO 2
     [Arguments]        ${regex}
     ${SCP_Fuse_Server_ListLen}     get length      ${SCP_Fuse_server_E2E}
     ${FuseLogs}     set variable        "SCP CRO logs"
     :FOR    ${i}    IN RANGE    0       ${SCP_Fuse_Server_ListLen}
     \  ${op}      Open Connection     ${SCP_Fuse_server_E2E[${i}]}
     \  ${userName}        set variable       somos\\epillai
     \  SSHLibrary.Login       ${userName}    Kaali@123   4
     \  ${Logs_path}       set variable        /project/jboss-fuse/data/log/fuse.log
     \  ${output}        write        grep -E -i -w ${regex} ${Logs_path} | sed 's?\\[01;31m\\[K??g' | sed 's?\\[m\\[K??g'
     \  sleep       10s
#     \  ${FuseLogsCRO}=    read until regexp      ~]$
     \  ${FuseLogsCRO}=    read
     \  log      ${FuseLogsCRO}
     \  ${FuseLogs}     catenate    SEPARATOR=\n       ${FuseLogs}      ${FuseLogsCRO}
     \  log     ${FuseLogs}
     \  set global variable        ${FuseLogs}
     \  Close Connection

MGI Server Logs E2E
     [Arguments]        ${regex}
     ${MGI_Fuse_server_ListLen}     get length      ${MGI_Fuse_server_E2E}
     ${FuseLogs}     set variable        "MGI SCP logs"
     :FOR    ${i}    IN RANGE    0       ${MGI_Fuse_server_ListLen}
     \  ${op}      Open Connection     ${MGI_Fuse_server_E2E[${i}]}
     \  ${userName}        set variable       somos\\epillai
     \  SSHLibrary.Login       ${userName}    Kaali@123   4
     \  ${Logs_path}       set variable        /project/jboss-fuse/data/log/fuse.log
     \  ${output}        write      grep ${num} ${Logs_path} | grep -E "${regex[5:8]}|${regex}" | sed 's?\\[01;31m\\[K??g' | sed 's?\\[m\\[K??g'
#     \  ${output}        write      grep -E -i -w ${regex} ${Logs_path}
     \  sleep       5s
#     \  ${FuseLogsCRO}=    read until regexp      ~]$
     \  ${FuseLogsCRO}=    read
     \  log      ${FuseLogsCRO}
     \  ${FuseLogs}     catenate    SEPARATOR=\n       ${FuseLogs}      ${FuseLogsCRO}
     \  log     ${FuseLogs}
     \  set global variable        ${FuseLogs}
     \  Close Connection

MGI Server Logs E2E 2
     [Arguments]        ${regex}
     ${MGI_Fuse_server_ListLen}     get length      ${MGI_Fuse_server_E2E}
     ${FuseLogs}     set variable        "MGI SCP logs"
     :FOR    ${i}    IN RANGE    0       ${MGI_Fuse_server_ListLen}
     \  ${op}      Open Connection     ${MGI_Fuse_server_E2E[${i}]}
     \  ${userName}        set variable       somos\\epillai
     \  SSHLibrary.Login       ${userName}    Kaali@123   4
     \  ${Logs_path}       set variable        /project/jboss-fuse/data/log/fuse.log
     \  ${output}        write      grep -E "${regex[5:8]}|${regex}" ${Logs_path} | sed 's?\\[01;31m\\[K??g' | sed 's?\\[m\\[K??g'
#     \  ${output}        write      grep -E -i -w ${regex} ${Logs_path}
     \  sleep       5s
#     \  ${FuseLogsCRO}=    read until regexp      ~]$
     \  ${FuseLogsCRO}=    read
     \  log      ${FuseLogsCRO}
     \  ${FuseLogs}     catenate    SEPARATOR=\n       ${FuseLogs}      ${FuseLogsCRO}
     \  log     ${FuseLogs}
     \  set global variable        ${FuseLogs}
     \  Close Connection

Linux Server Login
    [Arguments]     ${ServerIp}         ${usrName}              ${password}
    ${op}      Open Connection     ${ServerIp}
    ${userName}        set variable       ${usrName}
    SSHLibrary.Login       ${userName}    ${password}   4

Delete NPA-NXX
    [Arguments]       ${NPA}        ${NPA_DeleteReqBody}        ${Response}     ${recVersionId}
    ${oauthToken}    get token
    ${requestData}=    evaluate    json.loads('''${NPA_DeleteReqBody}''')    json
    set to dictionary       ${requestData['deleteNPAList'][0]}     npa=${NPA}
    set to dictionary        ${requestData['deleteNPAList'][0]}     recVersionId=${recVersionId}
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${responseBody}     PUT Method          ${oauthToken}      ${AND_URI}     ${reqBody}     ${Response}
    should not be empty     ${responseBody}
    ${npaList_response}     GET METHOD      ${oauthToken}     ${AND_URI}        ${SuccessResponse}
    should not be empty     ${npaList_response}
    ${NPA_List}     Get NPA list        ${npaList_response}
    list should not contain value      ${NPA_List}    ${NPA}
    close session
    [Return]        ${responseBody}

ADD NPA
    [Arguments]     ${oauthToken}         ${NPA}        ${NPA_ADDReqBody}       ${Response}
    ${requestData}=    evaluate    json.loads('''${NPA_ADDReqBody}''')    json
    set to dictionary           ${requestData}      addNPAList=[${NPA}]
    ${reqBody}=    evaluate    json.dumps(${requestData})    json
    log     ${reqBody}
    ${reqBody}     replace string      ${reqBody}      "[      ["
    ${reqBody}     replace string      ${reqBody}      ]"      "]
    ${responseBody}     PUT Method          ${oauthToken}      ${AND_URI}     ${reqBody}     ${Response}
    [Return]        ${responseBody}

Get Next Quarter Hour
    ${times}=       Create Dictionary        '00'=00
    Set to Dictionary     ${times}           '01'=14
    Set to Dictionary     ${times}           '02'=13
    Set to Dictionary     ${times}           '03'=12
    Set to Dictionary     ${times}           '04'=11
    Set to Dictionary     ${times}           '05'=10
    Set to Dictionary     ${times}           '06'=09
    Set to Dictionary     ${times}           '07'=08
    Set to Dictionary     ${times}           '08'=07
    Set to Dictionary     ${times}           '09'=06
    Set to Dictionary     ${times}           '10'=05
    Set to Dictionary     ${times}           '11'=04
    Set to Dictionary     ${times}           '12'=03
    Set to Dictionary     ${times}           '13'=02
    Set to Dictionary     ${times}           '14'=01
    Set to Dictionary     ${times}           '15'=00
    Set to Dictionary     ${times}           '16'=14
    Set to Dictionary     ${times}           '17'=13
    Set to Dictionary     ${times}           '18'=12
    Set to Dictionary     ${times}           '19'=11
    Set to Dictionary     ${times}           '20'=10
    Set to Dictionary     ${times}           '21'=09
    Set to Dictionary     ${times}           '22'=08
    Set to Dictionary     ${times}           '23'=07
    Set to Dictionary     ${times}           '24'=06
    Set to Dictionary     ${times}           '25'=05
    Set to Dictionary     ${times}           '26'=04
    Set to Dictionary     ${times}           '27'=03
    Set to Dictionary     ${times}           '28'=02
    Set to Dictionary     ${times}           '29'=01
    Set to Dictionary     ${times}           '30'=00
    Set to Dictionary     ${times}           '31'=14
    Set to Dictionary     ${times}           '32'=13
    Set to Dictionary     ${times}           '33'=12
    Set to Dictionary     ${times}           '34'=11
    Set to Dictionary     ${times}           '35'=10
    Set to Dictionary     ${times}           '36'=09
    Set to Dictionary     ${times}           '37'=08
    Set to Dictionary     ${times}           '38'=07
    Set to Dictionary     ${times}           '39'=06
    Set to Dictionary     ${times}           '40'=05
    Set to Dictionary     ${times}           '41'=04
    Set to Dictionary     ${times}           '42'=03
    Set to Dictionary     ${times}           '43'=02
    Set to Dictionary     ${times}           '44'=01
    Set to Dictionary     ${times}           '45'=00
    Set to Dictionary     ${times}           '46'=14
    Set to Dictionary     ${times}           '47'=13
    Set to Dictionary     ${times}           '48'=12
    Set to Dictionary     ${times}           '49'=11
    Set to Dictionary     ${times}           '50'=10
    Set to Dictionary     ${times}           '51'=09
    Set to Dictionary     ${times}           '52'=08
    Set to Dictionary     ${times}           '53'=07
    Set to Dictionary     ${times}           '54'=06
    Set to Dictionary     ${times}           '55'=05
    Set to Dictionary     ${times}           '56'=04
    Set to Dictionary     ${times}           '57'=03
    Set to Dictionary     ${times}           '58'=02
    Set to Dictionary     ${times}           '59'=01
    ${time1}=        get time                  min  UTC
    ${val}=          get from dictionary       ${times}      '${time1}'
    ${addmin}=       Convert to integer        ${val}
    ${time2}=        get time                  year month day hour min     UTC + ${addMin} min
    ${Date_Time}=    Set Variable              ${time2}[0]-${time2}[1]-${time2}[2]T${time2}[3]:${time2}[4]Z
    [Return]         ${Date_Time}
