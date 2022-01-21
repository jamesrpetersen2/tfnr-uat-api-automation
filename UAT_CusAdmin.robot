*** Settings ***
Documentation   This Suite Consists of API for Customer Administration Microservice
...             Developer Resources (Customer Administration) - Test Cases

Library     Collections
Library     String
Library     RequestsLibrary
Library     OperatingSystem
Resource    ./UAT_End2End_Keywords.robot
Resource    ./data_files/api/UAT_testdata.robot
#Test Setup         UserProfile Login                    ${API_User_Credentials_Track2}
#Test Teardown      Cleanup For Basic CAD Create         ${token}        ${TollFreeNumber}      ${effDateTm}
*** Variables ***


${HOST}                                     ${UAT_AWS_HOST}
${recversionIDForCIS}
${status_code}                               200
${numDesc}                                   Invalid Number Included
${email}                                     jpetersen.ctr@somos.com
${cicCode}
${acna}
${uat_Template}                               *BR-100
${RESERVED}                                   RESERVED
${TRANSITIONAL}                               TRANSITIONAL
${ReqData}                                    {"conName":"PETERSEN","conTel":"${UserProfileCreate_PhoneNum}"}
#${API_Admin_User_Credentials_for_UAT_AWS}     {"usrName": "${UAT_AWS_Admin_USER}","password": "${UAT_AWS_Admin_PASSWORD}","withPerm": true}
${ReqBody_Mandatory_params}                   {"num":"8556664830","cmd":"U","effDtTm":"2018-03-10T10:00Z","agent":"NEWAG","notes":"NEW CAD","onAccCust":"1234A","endSubAddr":"NEW SAMPLE endSubAddr","suppFormNum":"adcdqw","svcOrderNum":"asagh","intraLATACarrier":["0555"],"interLATACarrier":["0555"],"aos":{"aosNet":["${validAosNet_CRO}"]},"destNums":[{"destNum":"8556664830","numTermLine":100}]}
#${Password_Change_Data}                       {"usrName": "${UAT_AWS_USER}","oldPassword": "${UAT_AWS_Admin_PASSWORD}","newPassword": "${UAT_AWS_Admin_PASSWORD}"}
${UCI_UPDT_Data}                              {"loginId": "string","primaryEmail": "user@example.com","ntfnInd": "Y","conName": "string","conPhone": "string","shrtNotes": "string","prefTmZn": "A","recVersionId": "string"}
${rand_reserve_Data}                          {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","conName": "string","conTel": "string","shrtNotes": "string","asyncId": "string"}
${Create_CAD_Data}                            {"num": "string","effDtTm": "string","cmd": "U","newRespOrgId": "string","hldIndFlag": "N","priority": "H","svcOrderNum": "ABC098","suppFormNum": "SO76","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "PETERSEN","conTel": "string","notes": "NOTES","aos": {"aosNet": ["YK"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 99}]}
${Update_CAD_Data}                            {"num": "string","effDtTm": "string","cmd": "U","reqSntFrom": "CAD","custRecStat": "PENDING","hldIndFlag": "N","priority": "N","svcOrderNum": "string","suppFormNum": "string","onAccCust": "strin","agent": "strin","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","aos": {aosNet": ["US"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 1}],"custRecCompPart": "CAD","endInterceptDt": "string","recVersionId": "string","asyncId": "string"}
${Lock_CAD_Data}                              {"srcNum": "string","srcEffDtTm": "string","tgtNum": "string","tgtTmplName": "string","tgtEffDtTm": "string","custRecCompPart": "CAD","custRecAction": "COPY","overWriteTGT": "Y","asyncId": "string"}
${unLock_CAD_Data}                            {"num": "string","effDtTm": "string","asyncId": "string"}
${Copy_CAD_Data}                              {"tgtNum": "string","tgtEffDtTm": "string","tgtTmplName": "string","srcNum": "string","srcEffDtTm": "string","tmplDesc": "string","ctrlRespOrgId": "string","cmd": "U","hldIndFlag": "N","priority": "N","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","custRecCompPart": "CAD","srcRecVersionId": "string","asyncId": "string","overWriteTGT": "N"}
${Transfer_CAD_Data}                          {"tgtNum": "string","tgtEffDtTm": "string","tgtTmplName": "string","srcNum": "string","srcEffDtTm": "string","ctrlRespOrgId": "string","cmd": "U","tmplDesc": "string","hldIndFlag": "Y","priority": "Y","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string" ,"custRecCompPart": "CAD", "srcRecVersionId": "string","tgtRecVersionId": "string","asyncId": "string"}
${Disconnect_CAD_Data}                        {"srcNum": "string","tgtNum": "string","tgtEffDtTm": "string","tgtTmplName": "string","srcEffDtTm": "string","ctrlRespOrgId": "string","cmd": "U","tmplDesc": "string","hldIndFlag": "Y","priority": "Y","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["string"],"aosNet": ["string"],"aosState": ["string"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"cprSectName": [{"name": "string","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"dayLightSavings": "Y","priInterLT": "string","priIntraLT": "string","tmZn": "A","lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"custRecCompPart": "CAD","referral": "Y","endInterceptDt": "string","srcRecVersionId": "string","tgtRecVersionId": "string","asyncId": "string","overWriteTGT": "Y"}
${CPR_Data}            {"svcOrderNum":"B098AB","notes":"COMPLEX","aos":{"aosNet":["US"]},"num":"8669870248","cprSectName":[{"nodes":[{"values":["*NPA"],"colIndex":1,"rowIndex":"1"},{"values":["OBA"],"colIndex":2,"rowIndex":"1"},{"values":["OTHER"],"colIndex":1,"rowIndex":"2"},{"values":["VCA"],"colIndex":2,"rowIndex":"2"}],"name":"MAIN","nodeSeq":["areaCode","announcement"]}],"intraLATACarrier":["0022"],"interLATACarrier":["0022"],"effDtTm":"2020-08-17T21:30Z","priIntraLT":"0022","lbl":[{"lblName":"*NPA","lblType":"AC","lblVals":["209"]}],"priInterLT":"0022","cmd":"U","destNums":[{"destNum":"8669870248","numTermLine":"0099"}]}
${PAD_Data}        {"svcOrderNum":"B098","notes":"POINTER-##-OTFN656493","endSub":"POINTER","tmplName":"*BR-API-MGI","conTel":"7326990000","num":"8886260044","conName":"PDDEVELOPMENT","cmd":"U","effDtTm":"NOW","destNums":[{"destNum":"8886260044","numTermLine":"99"}]}
${TAD_Data}  {"tmplName":"*BR","tmplDesc":"MGI_TESTING_TEMPLATES","intraLATACarrier":["0022","0555"],"interLATACarrier":["0555","0022"],"effDtTm":"NOW","priIntraLT":"0555","priInterLT":"0555","numTermLine":9999,"tmZn":"C","cmd":"U","dayLightSavings":"Y",aos":{"aosNet":["US"]},"cprSectName":[{"nodes":[{"values":["222"],"colIndex":1,"rowIndex":"1"},{"values":["0022"],"colIndex":2,"rowIndex":"1"},{"values":["#DIAL"],"colIndex":3,"rowIndex":"1"},{"values":[],"colIndex":4,"rowIndex":"1"},{"values":["224"],"colIndex":1,"rowIndex":"2"},{"values":["0555"],"colIndex":2,"rowIndex":"2"},{"values":["#DIAL"],"colIndex":3,"rowIndex":"2"},{"values":[],"colIndex":4,"rowIndex":"2"},{"values":["OTHER"],"colIndex":1,"rowIndex":"3"},{"values":[],"colIndex":2,"rowIndex":"3"},{"values":[],"colIndex":3,"rowIndex":"3"},{"values":["OBA"],"colIndex":4,"rowIndex":"3"}],"name":"MAIN","nodeSeq":["lata","carrier","termNum","announcement"]}]}
${T_data}                   {"tmplName": "*BR-EHZ1-TEST", "cmd": "U", "effDtTm": "NOW", "intraLATACarrier": ["WTL-0555"], "interLATACarrier": ["WTL-0555"], "tmplDesc": "Create Complex Template Record", "numTermLine": 100, "aos": {"aosState": ["CA"]}, "cprSectName": [{"name": "MAIN", "nodeSeq": ["state", "carrier", "announcement"], "nodes": [{"rowIndex": 1, "colIndex": 1, "values": ["CA"]}, {"rowIndex": 1, "colIndex": 2, "values": ["0555"]}, {"rowIndex": 1, "colIndex": 3, "values": ["OBA"]}]}]}
${ReqBody_CR_Disconnect_MandatoryParams}      {"srcNum":"","tgtEffDtTm":"","cmd":"U","srcRecVersionId":"","referral":"N","custRecCompPart":"CAD"}
${PR_CR_ReqBody}             {"tfNum": "","srcEffDtTm": "","tgtEffDtTm": "","recVersionId": ""}






*** Test Cases ***

OpenSession_Login_with_Resp_Org
   Log                                  ${UAT_AWS_HOST}
   Log                                  ${HOST}
   Log                                  ${API_Admin_User_Credentials_for_UAT_AWS}
   ${SESSION_OPEN_V3}=      Set Variable           /v3/ip/sec/session/open
   Set Suite Variable                  ${SESSION_OPEN_V3}
   Set Suite Variable                  ${HOST}
   Create Session  endpoint             ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json       Accept=application/json
   ${resp}=  Post Request  endpoint    ${SESSIONOPEN_V3}  data=${API_Admin_User_Credentials_for_UAT_AWS}  headers=${headers}
   Should Be Equal As Strings  ${resp.status_code}  200
   ${sessionopenResp}=  To Json  ${resp.content}
   ${Status}   run keyword and return status   Dictionary Should Contain Key  ${sessionopenResp}      oauthToken
   ${sessionopenResp1}      run keyword if      ${Status}==False            ReLogin         ${sessionopenResp}     ${User_Credentials}
   set global variable      ${sessionopenResp1}
   ${error_recieved}     run keyword and return status     Dictionary Should Contain Key     ${sessionopenResp1}     errList
   ${reopen_flag}    run keyword if    ${error_recieved}==True     Session Override errorcheck     ${sessionopenResp1}
   run keyword if   ${reopen_flag}==True     UserProfile Login    ${API_Admin_User_Credentials_for_UAT_AWS}
   ${sessionopenResp}      set variable if     ${Status}==False        ${sessionopenResp1}     ${sessionopenResp}
   Dictionary Should Contain Key  ${sessionopenResp}      scope
   Dictionary Should Contain Key  ${sessionopenResp}      tokenType
   Should be Equal     ${sessionopenResp['tokenType']}    Bearer
   Dictionary Should Contain Key  ${sessionopenResp}      expiresIn
   Dictionary Should Contain Key  ${sessionopenResp['permRecord']}      maxLogonAttempts
   ${token}=        Get From Dictionary     ${sessionopenResp}     oauthToken
   ${PermRecord}=   Get From Dictionary     ${sessionopenResp}     permRecord
   ${maxLogonAttempts}     get from dictionary     ${PermRecord}      maxLogonAttempts
   ${UpdateList}=   Get From Dictionary     ${PermRecord}     updList
   ${ViewList}=     Get From Dictionary     ${PermRecord}     viewList
   ${RespOrgID}=    Get From Dictionary     ${PermRecord}     respOrgId
   ${User_Group}=   Get from dictionary     ${PermRecord}     usrGrp
   ${UsrClass}=     Get From Dictionary     ${PermRecord}     usrClass
   set global variable     ${UpdateList}
   set global variable     ${ViewList}
   set global variable     ${RespOrgID}
   set global variable     ${sessionopenResp}
   set global variable     ${User_Group}
   set global variable     ${UsrClass}
   Log         ${token}





   ###############################################################################################################


TC01 CAD_2PAD_2CAD_Complete_Cycle_of_Number_and_Customer_Record_Activity
   [Documentation]   Create 'ACTIVE' CR via API with Both TurnAround and POTS numbers in DestNums.
   ...               Disconnect the record with NOW and end intercept of NOW. Create new Pending CR using
   ...               resultant Transitional number. Convert CR to PAD then to CAD/CPR.
   ...               Delete the Pending CR and the PENDING PAD. Verify TFN is back to RESERVED.
   [Tags]     REGRESSION  CustAdmin   CAD    PAD   NA
   Log                                  ${HOST}
   #Pass Execution        Working OK
   ${entity}=               get substring          ${ROID}           0     2
   ${mid}=                  get random string      3          [UPPER]
   ${tmplName}=             set variable                    ${entity}-${mid}7-TEST
   ${token}=                get token
   ${oauthToken}=           set variable           ${token}
   ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   set test variable        ${GET_ACTION_URI}
   ${requestData}=          evaluate               json.loads('''${T_data}''')       json
   set to dictionary        ${requestData}                          tmplName=*${tmplName}
   set to dictionary        ${requestData}                          effDtTm=NOW
   remove from dictionary   ${requestData}                          priority
   remove from dictionary   ${requestData}                          agent
   remove from dictionary   ${requestData}                          endSub
   remove from dictionary   ${requestData}                          endSubAddr
   remove from dictionary   ${requestData}                          onAccCust
   remove from dictionary   ${requestData}                          asyncId
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
   ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse Template Record Response
   Parse Return Code   ${resp}        ${keyword}
   set test variable         ${tmplName}
   ##################################################################################################
   ${token}              get token
   ${reservedTFN}        get Reserve Random Number      ${token}     ${ReqData}
   ${EFF_Date_Time}      set variable          NOW
   ${resporgId}          Get RespOrgID
   ${telco}              Get Telco             ${token}
   ${interLATACarrier}   create list           0555
   ${intraLATACarrier}   create list           0555
   ${requestData}        evaluate    json.loads('''${ReqBody_Mandatory_params}''')    json
   set to dictionary        ${requestData}                 num=${reservedTFN}
   set to dictionary        ${requestData}                 effDtTm=${EFF_Date_Time}
   set to dictionary        ${requestData}                 interLATACarrier=${interLATACarrier}
   set to dictionary        ${requestData}                 intraLATACarrier=${intraLATACarrier}
   set to dictionary        ${requestData}                 conTel=${reservedTFN}
   set to dictionary        ${requestData}                 telco=${telco}
   set to dictionary        ${requestData["destNums"][0]}  destNum=${reservedTFN}
   remove from dictionary   ${requestData}                 newRespOrgId
   ${Req_body}=         evaluate    json.dumps(${requestData})    json
            # Create CAD with EFFDATE = NOW
   ${responseData}=     POST Method      ${token}     ${POST_CAD_Create}     ${reqBody}       ${SuccessResponse}
   should not be empty        ${responseData}
   ${req_num}           get from dictionary   ${Request_data}    num
   ${E.D.T_req}         get from dictionary   ${Request_data}    effDtTm
   ${CAD_Status}=       Set Variable          ${Customer_Record_status}
   Log      ${CAD_Status}
   BuiltIn.Comment    Check CR Status change from PENDING to ACTIVE
   FOR     ${Index}      IN RANGE    1     18
        ${responsedata_View}=    GET METHOD     ${token}     ${GET_LAD_VIEW}${CAD_View}${reservedTFN}         ${SuccessResponse}
        Sleep  1m
        should not be empty          ${responsedata_View}
        Convert to dictionary        ${responsedata_View}
        ${CAD_EffDT}=           get from dictionary    ${responsedata_View}                       effDtTm
        ${CAD_Status}=          get from dictionary    ${responsedata_View["lstEffDtTms"][0]}     custRecStat
        #Log      ${CAD_Status}
        Run Keyword If         '${CAD_Status}' == '${ACTIVE}'      Exit For Loop
   END
   Log      ${CAD_Status}
   should be equal  ${CAD_Status}  ${ACTIVE}
   Add to Transaction Total   ${reservedTFN};${CAD_EffDT}:${CAD_Status}  ${resporgId}  ${HOST}
   ${crViewResponse}     Get Method   ${token}    ${GET_CAD_VIEW}${reservedTFN}   ${SuccessResponse}
   should not be empty    ${crViewResponse}
   ${recVersionIdViewResp}         get from dictionary      ${crViewResponse}           recVersionId
   ${effDtTmViewResp}              get from dictionary      ${crViewResponse}           effDtTm
   should be equal     ${effDtTmViewResp}      ${CAD_EffDT}
   BuiltIn.Comment    CR Disconnect
   ${requestDataDisconnect}    evaluate    json.loads('''${ReqBody_CR_Disconnect_MandatoryParams}''')    json
   set to dictionary        ${requestDataDisconnect}           srcNum=${reservedTFN}
   set to dictionary        ${requestDataDisconnect}           tgtEffDtTm=NOW
   set to dictionary        ${requestDataDisconnect}           srcRecVersionId=${recVersionIdViewResp}
   set to dictionary        ${requestDataDisconnect}           endInterceptDt=NOW
   ${reqBodyDisconnect}=    evaluate    json.dumps(${requestDataDisconnect})    json
   log                      ${reqBodyDisconnect}
   ${responseDataDisconnect}=   POST Method    ${token}    ${POST_CAD_Disconnect}    ${reqBodyDisconnect}     ${SuccessResponse}
   should not be empty      ${responseDataDisconnect}
   log                      ${responseDataDisconnect}
   BuiltIn.Comment          CR Disconnect Validation
   ${recVersionId}                    get from dictionary     ${responseDataDisconnect}             recVersionId
   ${effDtTmDisconnectResp}           get from dictionary     ${responseDataDisconnect}             effDtTm
   ${crViewResponseAfterDisconnect}     Get Method   ${token}    ${GET_CAD_VIEW}${reservedTFN}      ${SuccessResponse}
   log      ${crViewResponseAfterDisconnect}
   ${recVersionIdAfterDisconnect}     get from dictionary    ${crViewResponseAfterDisconnect}       recVersionId
   should be equal     ${recVersionIdAfterDisconnect}    ${recVersionId}
   ${lstEffDtTmsAfterDisconnect}      get from dictionary   ${crViewResponseAfterDisconnect}        lstEffDtTms
   ${crEffDtTmAfterDisconnect}        get from dictionary     ${lstEffDtTmsAfterDisconnect[1]}      effDtTm
   log     ${crEffDtTmAfterDisconnect}
   ${custRecStatusAfterDisconnect}    get from dictionary   ${lstEffDtTmsAfterDisconnect[1]}        custRecStat
   log     ${custRecStatusAfterDisconnect}
   should be equal     ${custRecStatusAfterDisconnect}     ${Customer_Record_status}
   BuiltIn.Comment        Wait until transitional
   FOR     ${Index}      IN RANGE    1     18
        Sleep   1m
        ${responsedata}=             Do Number Query     ${token}    ${reservedTFN}     ${SuccessResponse}
        Convert to dictionary        ${responsedata}
        ${Query_Result}              get from dictionary   ${responsedata}                         queryResult
        ${LstQuery_Result}=          get from list         ${Query_Result}                         0
        Convert to dictionary        ${LstQuery_Result}
        ${Number_Status}             get from dictionary   ${LstQuery_Result}                      status
        Run Keyword If               '${Number_Status}' == '${TRANSITIONAL}'       exit For Loop
   END
   log                      ${Number_Status}
   should be equal          ${Number_Status}               ${TRANSITIONAL}
   BuiltIn.Comment          Create Pending CR using Transitional number
   ${EFF_Date_Time}         Future Effective Date and Time
   ${resporgId}             Get RespOrgID
   ${telco}                 Get Telco                      ${token}
   ${interLATACarrier}      create list                    0555
   ${intraLATACarrier}      create list                    0555
   ${NewROID}=              Set Variable                   ${ROID}
   ${requestData}=          evaluate    json.loads('''${ReqBody_Mandatory_params}''')    json
   set to dictionary        ${requestData}                 num=${reservedTFN}
   set to dictionary        ${requestData}                 effDtTm=${EFF_Date_Time}
   #set to dictionary        ${requestData}                 newRespOrgId=${NewROID}
   set to dictionary        ${requestData}                 interLATACarrier=${interLATACarrier}
   set to dictionary        ${requestData}                 intraLATACarrier=${intraLATACarrier}
   set to dictionary        ${requestData}                 conTel=${reservedTFN}
   set to dictionary        ${requestData}                 telco=${telco}
   set to dictionary        ${requestData["destNums"][0]}  destNum=${reservedTFN}
   ${Req_body}=             evaluate    json.dumps(${requestData})    json
            # Create CAD with EFFDATE = NOW
   ${responseData}=         POST Method      ${token}      ${POST_CAD_Create}     ${reqBody}       ${SuccessResponse}
   should not be empty         ${responseData}
   Log                         ${responseData}
   ${RetrieveResponseData}=    Customer Record Retrieve with TFN    ${token}    ${reservedTFN}
   should not be empty         ${RetrieveResponseData}
   Log                         ${RetrieveResponseData}
   ${srcRecorddate}            get from dictionary         ${RetrieveResponseData}                       effDtTm
   ${CntrlRO}                  get from dictionary         ${RetrieveResponseData}                       ctrlRespOrgId
   ${custRecordStatus}         get from dictionary         ${RetrieveResponseData["lstEffDtTms"][0]}     custRecStat
   should be equal             ${custRecordStatus}         ${PENDING}
   #should be equal             ${CntrlRO}                  ${NewROID}
   ###############################################################################################################
   ###############################################################################################################
   BuiltIn.Comment   Convert PENDING CAD to PENDING PAD
   ###############################################################################################################
   ${Date}                     get current date
   ${PTR_EFF_Date_Time}        get new future effective date and time         ${Date}         20
   ${respOrg}                  get resporgid
   Log                         ${respOrg}
   ${ActiveTemplateRecord}=    Set Variable                  ${tmplName}
   BuiltIn.Comment             Conversion
   ${numList}                  create list     ${reservedTFN}
   ${retrieveResponse}         GET Method      ${token}     ${GET_CAD_VIEW}${reservedTFN}   ${SuccessResponse}
   log     ${retrieveResponse}
   ${recVersionId}     get from dictionary         ${retrieveResponse}     recVersionId
   ${requestData}      evaluate    json.loads('''${Conversion_Request_Body}''')    json
   set to dictionary       ${requestData}      numList=${numList}
   set to dictionary       ${requestData}      tmplName=*${ActiveTemplateRecord}
   set to dictionary       ${requestData}      srcEffDtTm=${srcRecorddate}
   set to dictionary       ${requestData}      tgtEffDtTm=${PTR_EFF_Date_Time}
   set to dictionary       ${requestData}      requestDesc=CR convert
   set to dictionary       ${requestData}      recVersionId=${recVersionId}
   ${reqBody}      evaluate        json.dumps(${requestData})      json
   ${responseData}=    POST Method         ${token}    ${Conversion_URI}     ${reqBody}          ${SuccessResponse}
   should not be empty        ${responseData}
   log   ${responseData}
   ###############################################################################################################
   dictionary should contain key   ${responseData}     recVersionId
   ${CopyRecordRecversionid}       get from dictionary      ${responseData}     recVersionId
   ${EffDate}                      get from dictionary      ${responseData}     effDtTm
   should be equal     ${EffDate}      ${PTR_EFF_Date_Time}
   log   ${EffDate}
   ${Eff_Date_without_Time}      get substring       ${PTR_EFF_Date_Time}        0           10
   ${Eff_Date_without_Time}      evaluate  '${Eff_Date_without_Time}'.replace('-','')
   ${retrieveResponse}      GET Method      ${token}     ${GET_PAD_VIEW}${reservedTFN}?effDtTm=${Eff_Date_without_Time}   ${SuccessResponse}
   log     ${retrieveResponse}
   ${lstEffDtTms}            get from dictionary      ${retrieveResponse["lstEffDtTms"][0]}     effDtTm
   should be equal           ${lstEffDtTms}           ${PTR_EFF_Date_Time}
   ${custRecordStatus}       get from dictionary      ${retrieveResponse["lstEffDtTms"][0]}     custRecStat
   should be equal           ${custRecordStatus}      ${PENDING}
   ${custRecCompPart}        get from dictionary      ${retrieveResponse["lstEffDtTms"][0]}     custRecCompPart
   should be equal           ${custRecCompPart}       PAD
   ${apprStat}               get from dictionary      ${retrieveResponse["lstEffDtTms"][0]}     apprStat
   should be equal           ${apprStat}              NOT REQUIRED
   ###############################################################################################################
   ###############################################################################################################
   BuiltIn.Comment           Convert PENDING PAD to PENDING CAD/CPR
   ###############################################################################################################
   #PR To CR when the template in PR is Complex TAD
   ###############################################################################################################
   ${token}                  get token
   ${SrcEffDtTm}=            Set Variable                                ${PTR_EFF_Date_Time}
   ${TgtEffDtTm}             get new future effective date and time      ${SrcEffDtTm}       5
   ${requestData}      evaluate    json.loads('''${PR_CR_ReqBody}''')    json
   set to dictionary               ${requestData}                        tfNum=${reservedTFN}
   set to dictionary               ${requestData}                        srcEffDtTm=${SrcEffDtTm}
   set to dictionary               ${requestData}                        tgtEffDtTm=${TgtEffDtTm}
   set to dictionary               ${requestData}                        recVersionId=${CopyRecordRecversionid}
   ${reqBody}          evaluate    json.dumps(${requestData})            json
   log                      ${reqBody}
   ${createResponse}        POST Method     ${token}    ${POST_PAD_Conv}      ${reqBody}     ${SuccessResponse}
   log                      ${createResponse}
   dictionary should contain key       ${createResponse}       recVersionId
   ${retrieveResponse}      GET Method      ${token}     ${GET_PAD_VIEW}${reservedTFN}   ${SuccessResponse}
   log                      ${retrieveResponse}
   Validation For Error Message    ${retrieveResponse}     ${MoreThanOneRecordWarningMsg}    ${WARN}   ${MoreThanOneRecordWarningCode}
   ${lstEffDtTms}            get from dictionary     ${retrieveResponse}     lstEffDtTms
   ${recVersionId}           get from dictionary     ${retrieveResponse}     recVersionId
   ${CADStatus}              get from dictionary     ${lstEffDtTms[1]}       custRecStat
   should be equal           ${CADStatus}            ${PENDING_STATE}
   ${custRecCompPart}        get from dictionary     ${lstEffDtTms[1]}       custRecCompPart
   should be equal           ${custRecCompPart}      CAD, CPR
   ${effDtTm}                get from dictionary     ${lstEffDtTms[1]}       effDtTm
   should be equal           ${effDtTm}              ${TgtEffDtTm}
   ###############################################################################################################
   ###############################################################################################################
   BuiltIn.Comment          Delete PENDING CAD
   ###############################################################################################################
   ###############################################################################################################
   ${EFF_Date_Time}=          Set Variable                                   ${effDtTm}
   ${ReserveTFN}=             Set Variable                                   ${reservedTFN}
   ${delResponseData}=        Customer Record Delete      ${token}        ${ReserveTFN}      ${EFF_Date_Time}       ${recVersionId}       ${SuccessResponse}
   Log        ${delResponseData}
   Validate deleted CR        ${token}      ${delResponseData}      ${ReserveTFN}      ${EFF_Date_Time}
   ###############################################################################################################
   ###############################################################################################################
   BuiltIn.Comment          Delete PENDING PAD
   ###############################################################################################################
   ###############################################################################################################
   ${EFF_Date_Time}=          Set Variable                                   ${PTR_EFF_Date_Time}
   ${ReserveTFN}=             Set Variable                                   ${reservedTFN}
   ${delResponseData}=        Delete multiple Pointer Records      ${token}        ${ReserveTFN}
   Log        ${delResponseData}
   Validate deleted CR        ${token}      ${delResponseData}      ${ReserveTFN}      ${EFF_Date_Time}
   ###############################################################################################################
   ###############################################################################################################
   BuiltIn.Comment          Query TFN Number [Should be RESERVED (45 Day Rule)]
   ###############################################################################################################
   ${Reserved_State_Number}=        Set Variable                                   ${reservedTFN}
   ${responsedata}=    Do Number Query     ${token}    ${Reserved_State_Number}     ${SuccessResponse}
   log         ${responsedata}
   ${queryResult}       get from dictionary             ${responsedata}       queryResult
   ${responsedata}      get from list                   ${queryResult}        0
   ${effDtTm}           get from dictionary             ${responsedata}       effDt
   should not be empty                   ${effDtTm}
   ${recVersionId}      get from dictionary             ${responsedata}       recVersionId
   should not be empty                   ${recVersionId}
   ${status}            get from dictionary             ${responsedata}       status
   # 45 day rule
   should be equal as strings            ${RESERVED}       ${status}
   #should be equal as strings            ${SPARE}       ${status}
   ${numTFN}            get from dictionary             ${responsedata}       num
   ${previous_reservedTFN}=        Set Variable                                        ${reservedTFN}
   should be equal as strings            ${numTFN}      ${previous_reservedTFN}

   ###############################################################################################################
   BuiltIn.Comment          Disconnect New ACTIVE [TAD] Template
   ###############################################################################################################
   ###############################################################################################################
   ${retrieveResponse}=    GET Method With Sync Timeout   ${token}    ${TAD_retrieve_URI}%2A${tmplName}   ${SuccessResponse}   ${TAD_Create_URI}
   log   ${retrieveResponse}
   ${recVersionId}       get from dictionary      ${retrieveResponse}                            recVersionId
   #${newEFF_Date_time}=        Get Future Effective DateTime   1
   #${newEFF_Date_time}=        Get Future Effective DateTime   1
   ${newEFF_Date_time}=        Get Next Quarter Hour
   log      ${newEFF_Date_time}
   ${reqData}      evaluate        json.loads('''${ReqBodyForTemplateCopy}''')    json
   set to dictionary       ${reqData}      srcTmplName=*${tmplName}
   set to dictionary       ${reqData}      tgtTmplName=*${tmplName}
   set to dictionary       ${reqData}      srcEffDtTm=${effDtTmViewResp}
   set to dictionary       ${reqData}      tgtEffDtTm=NOW
   set to dictionary       ${reqData}      srcRecVersionId=${recVersionId}
   set to dictionary       ${reqData}      tmplRecCompPart=TAD
   ${reqBody}      evaluate        json.dumps(${reqData})        json
   ${DisconnectResponse}     POST Method     ${token}    ${TAD_Disconnect_URI}      ${reqBody}     ${SuccessResponse}
   log     ${DisconnectResponse}


  ###############################################################################################################

TC02 Create_Active_Customer_Record_and_Disconnect_CAD
  [Tags]     REGRESSION  CustAdmin   CAD   NA
  Log                                  ${HOST}
  #Pass Execution        Customer records will not go to ACTIVE.
  ${token}              get token
  ${reservedTFN}        get Reserve Random Number      ${token}     ${ReqData}
  ${EFF_Date_Time}      set variable          NOW
  ${resporgId}          Get RespOrgID
  ${telco}              Get Telco             ${token}
  ${interLATACarrier}   create list           0555
  ${intraLATACarrier}   create list           0555
  ${requestData}        evaluate    json.loads('''${ReqBody_Mandatory_params}''')    json
  set to dictionary        ${requestData}                 num=${reservedTFN}
  set to dictionary        ${requestData}                 effDtTm=${EFF_Date_Time}
  set to dictionary        ${requestData}                 interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                 intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                 conTel=${reservedTFN}
  set to dictionary        ${requestData}                 telco=${telco}
  set to dictionary        ${requestData["destNums"][0]}  destNum=${reservedTFN}
  remove from dictionary   ${requestData}                 newRespOrgId
  ${Req_body}=         evaluate    json.dumps(${requestData})    json
           # Create CAD with EFFDATE = NOW
  ${responseData}=     POST Method      ${token}     ${POST_CAD_Create}     ${reqBody}       ${SuccessResponse}
  should not be empty        ${responseData}
  ${req_num}           get from dictionary   ${Request_data}    num
  ${E.D.T_req}         get from dictionary   ${Request_data}    effDtTm
  ${CAD_Status}=       Set Variable          ${Customer_Record_status}
  Log      ${CAD_Status}
  BuiltIn.Comment    Check CR Status change from PENDING to ACTIVE
  FOR     ${Index}      IN RANGE    1     15
       ${responsedata_View}=    GET METHOD     ${token}     ${GET_LAD_VIEW}${CAD_View}${reservedTFN}         ${SuccessResponse}
       Sleep  1m
       should not be empty          ${responsedata_View}
       Convert to dictionary        ${responsedata_View}
       ${CAD_EffDT}=           get from dictionary    ${responsedata_View}                       effDtTm
       ${CAD_Status}=          get from dictionary    ${responsedata_View["lstEffDtTms"][0]}     custRecStat
       #Log      ${CAD_Status}
       Run Keyword If         '${CAD_Status}' == '${ACTIVE}'      Exit For Loop
  END
  Log      ${CAD_Status}
  should be equal  ${CAD_Status}  ${ACTIVE}
  Add to Transaction Total   ${reservedTFN};${CAD_EffDT};${CAD_Status}  ${resporgId}  ${HOST}

  ###############################################################################################################
  ###############################################################################################################
  BuiltIn.Comment           QUERY ACTIVE CAD for Disconnect
  ###############################################################################################################
  #${effDate}=              Format Date Time                ${EFF_Date_Time1}
  ${token}=                get token
  #${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  #set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ##############################################################################################################
  BuiltIn.Comment          DISCONNECT ACTIVE CAD
  ###############################################################################################################
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  #${Date}=                 get current date
  #${EFF_Date_Time2}=       get new future effective date and time         ${Date}         4
  #${newDT}=                get new future effective date and time         ${Date}         5
  #${EID}=                  fetch from left     ${newDT}     T
  ${telco}                 Get Telco                      ${token}
  #${interLATACarrier}      create list                    0555
  #${intraLATACarrier}      create list                    0555
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/disconnect
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${Disconnect_CAD_Data}''')       json
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          srcEffDtTm=${Q_effDtTm}
  set to dictionary        ${requestData}                          tgtEffDtTm=NOW
  set to dictionary        ${requestData}                          endInterceptDt=NOW
  set to dictionary        ${requestData}                          referral=N
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          priority=N
  set to dictionary        ${requestData}                          notes=DISCONNECT CAD
  set to dictionary        ${requestData}                          srcRecVersionId=${Query_recVersionId}
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData}                          tmplDesc
  remove from dictionary   ${requestData}                          hldIndFlag
  remove from dictionary   ${requestData}                          svcOrderNum
  remove from dictionary   ${requestData}                          telco
  remove from dictionary   ${requestData}                          conName
  remove from dictionary   ${requestData}                          conTel
  remove from dictionary   ${requestData}                          aos
  remove from dictionary   ${requestData}                          interLATACarrier
  remove from dictionary   ${requestData}                          intraLATACarrier
  remove from dictionary   ${requestData}                          destNums
  remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          priInterLT
  remove from dictionary   ${requestData}                          priIntraLT
  remove from dictionary   ${requestData}                          tmZn
  remove from dictionary   ${requestData}                          lbl
  remove from dictionary   ${requestData}                          tgtRecVersionId
  remove from dictionary   ${requestData}                          asyncId
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          overWriteTGT
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  #set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  ${keyword}=     set variable       Parse Customer Record Disconnect
  Parse Return Code   ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${CAD_EffDT}  ${resporgId}   ${HOST}
  #set suite variable                 ${EFF_Date_Time1}
  #set suite variable                 ${EFF_Date_Time2}
  #set suite variable                 ${reservedTFN}
  ###############################################################################################################








TC03 Reserve_a_Number
  [Documentation]   Allows the SMS800 TFNRegistry user to reserve a TFN for Customer Record creation.
  [Tags]     REGRESSION  CustAdmin   NA
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ${token}=                get token
  ${oauthToken}=           set variable                   ${token}
  ${qty}=                  set variable                   2
  ${npa}=                  set variable                   833
  ${nxx}=                  set variable                   201
  ${line}=                 set variable                   1000
  # ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${CR_v3_UCI}=            set variable                   /v3/ip/num/tfn/srchres/random
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${rand_reserve_Data}''')       json
  set to dictionary        ${requestData}                          qty=${qty}
  set to dictionary        ${requestData}                          npa=${npa}
  set to dictionary        ${requestData}                          nxx=${nxx}
  set to dictionary        ${requestData}                          line=${line}
  set to dictionary        ${requestData}                          conTel=${UserProfileCreate_PhoneNum}
  set to dictionary        ${requestData}                          cons=N
  set to dictionary        ${requestData}                          conName=PETERSEN
  set to dictionary        ${requestData}                          shrtNotes=RESERVE
  remove from dictionary   ${requestData}                          nxx
  remove from dictionary   ${requestData}                          line
  remove from dictionary   ${requestData}                          shrtNotes
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}    Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}         headers=${headers}
  ${keyword}=     set variable       Parse Number Reserve Response
  Parse Return Code   ${resp}        ${keyword}
  Set Suite Variable       ${reservedTFN}    ${rsv_number}


  ###############################################################################################################







TC04 Create_Pending_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to create a Customer Record for a given Toll-Free Number, Effective Date and Time.
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time1}=       get new future effective date and time         ${Date}         3
  set suite variable       ${EFF_Date_Time1}
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${Create_CAD_Data}''')       json
  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time1}
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=99
  remove from dictionary   ${requestData}                          newRespOrgId
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          suppFormNum
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Customer Record Response
  Parse Return Code   ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${EFF_Date_Time1}  ${ROID}   ${HOST}
  ###############################################################################################################


TC05 Query_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to query a Customer Record for a given Toll-Free Number, Effective Date and Time.
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${EFF_Date_Time1};${CAD_Status}  ${ROID}   ${HOST}
  ###############################################################################################################


TC06 Retrieve_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to retrieve a Customer Record for a given Number,
  ...               Effective Date and Time for the purpose of viewing/reading its content.
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record View
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################


TC07 Transfer_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to transfer a Customer Record for a given Number,
  ...               Effective Date and Time.
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${effDate}=              Format Date Time                ${EFF_Date_Time1}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${EFF_Date_Time1};${CAD_Status}  ${ROID}   ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           Transfer PENDING CAD to New Date Time
  ###############################################################################################################
  ${Date}=                 get current date
  ${EFF_Date_Time2}=       get new future effective date and time         ${Date}         5
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/transfer
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${requestData}=          evaluate               json.loads('''${Transfer_CAD_Data}''')       json
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          srcEffDtTm=${EFF_Date_Time1}
  set to dictionary        ${requestData}                          tgtEffDtTm=${EFF_Date_Time2}
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          conName=JIM
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData}                          onAccCust=BROPR
  set to dictionary        ${requestData}                          notes=TRANSFERED CAD
  set to dictionary        ${requestData}                          srcRecVersionId=${Query_recVersionId}
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData}                          tmplDesc
  remove from dictionary   ${requestData}                          hldIndFlag
  remove from dictionary   ${requestData}                          svcOrderNum
  remove from dictionary   ${requestData}                          tgtRecVersionId
  remove from dictionary   ${requestData}                          aos
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          endInterceptDt
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Transfer
  set suite variable      ${EFF_Date_Time2}
  set Test Variable       ${TgtEffDtTm}            ${EFF_Date_Time2}
  Parse Return Code       ${resp}                  ${keyword}

  ###############################################################################################################


TC08 Query_Customer_Record_after_Transfer
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD after Transfer
  ###############################################################################################################
  ${token}=                get token
  ${effDate}=              Format Date Time                ${EFF_Date_Time2}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${TgtEffDtTm};${CAD_Status}  ${ROID}  ${HOST}
  ###############################################################################################################

TC09 Copy_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to make a copy of a Customer Record for a given Number,
  ...               Effective Date and Time.
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${effDate}=              Format Date Time                ${EFF_Date_Time2}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${TgtEffDtTm};${CAD_Status}  ${ROID}   ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           Copy PENDING CAD to New Date Time
  ###############################################################################################################
  ${Date}=                 get current date
  ${EFF_Date_Time3}=       get new future effective date and time         ${Date}         6
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/copy
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${requestData}=          evaluate               json.loads('''${Copy_CAD_Data}''')       json
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          srcEffDtTm=${EFF_Date_Time2}
  set to dictionary        ${requestData}                          tgtEffDtTm=${EFF_Date_Time3}
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          conName=JIM
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData}                          onAccCust=BROPR
  set to dictionary        ${requestData}                          notes=COPIED CAD
  set to dictionary        ${requestData}                          srcRecVersionId=${Query_recVersionId}
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData}                          tmplDesc
  remove from dictionary   ${requestData}                          hldIndFlag
  remove from dictionary   ${requestData}                          svcOrderNum
  remove from dictionary   ${requestData}                          tgtRecVersionId
  remove from dictionary   ${requestData}                          aos
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          endInterceptDt
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Copy
  set suite variable      ${EFF_Date_Time3}
  set Test Variable       ${TgtEffDtTm}            ${EFF_Date_Time3}
  Parse Return Code       ${resp}                  ${keyword}
  ###############################################################################################################

TC10 Query_Customer_Record_after_Copy
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD after Copy
  ###############################################################################################################
  ${token}=                get token
  ${effDate}=              Format Date Time                ${EFF_Date_Time3}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time3}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${TgtEffDtTm};${CAD_Status}  ${ROID}   ${HOST}
  ###############################################################################################################





TC11 Delete_Pending_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to delete a Customer Record for a given Number, Effective Date and Time.
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD for Delete
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time3}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time3}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${TgtEffDtTm};${CAD_Status}  ${ROID}   ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           DELETE LAST PENDING CAD
  ##############################################################################################################
  ${effDate}=              Format Date Time                ${Q_effDtTm}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${Query_recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################



TC12 Delete_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to delete a Customer Record for a given Number, Effective Date and Time.
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD for Delete
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time2}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${TgtEffDtTm};${CAD_Status}  ${ROID}   ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           DELETE FIRST PENDING CAD
  ##############################################################################################################
  ${effDate}=              Format Date Time                ${Q_effDtTm}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${Query_recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################


TC13 Create_Pending_Customer_Record_and_Disconnect
  [Documentation]   Allows the SMS800 TFNRegistry user to create a Customer Record for a given
  ...               Toll-Free Number, Effective Date and Time, and disconnect the CR.
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD   NA
  Log                                  ${HOST}
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${reservedTFN}=          get Reserve Random Number      ${token}     ${ReqData}
  ${Date}=                 get current date
  ${EFF_Date_Time1}=       get new future effective date and time         ${Date}         3
  set suite variable       ${EFF_Date_Time1}
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${Create_CAD_Data}''')       json
  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time1}
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=99
  remove from dictionary   ${requestData}                          newRespOrgId
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          suppFormNum
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Customer Record Response
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD for Disconnect
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time1}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ##############################################################################################################
  BuiltIn.Comment          DISCONNECT PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time2}=       get new future effective date and time         ${Date}         4
  ${newDT}=                get new future effective date and time         ${Date}         5
  ${EID}=                  fetch from left     ${newDT}     T
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/disconnect
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${Disconnect_CAD_Data}''')       json
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          srcEffDtTm=${EFF_Date_Time1}
  set to dictionary        ${requestData}                          tgtEffDtTm=${EFF_Date_Time2}
  set to dictionary        ${requestData}                          endInterceptDt=${EID}
  set to dictionary        ${requestData}                          referral=N
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          priority=N
  set to dictionary        ${requestData}                          notes=DISCONNECT CAD
  set to dictionary        ${requestData}                          srcRecVersionId=${Query_recVersionId}
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData}                          tmplDesc
  remove from dictionary   ${requestData}                          hldIndFlag
  remove from dictionary   ${requestData}                          svcOrderNum
  remove from dictionary   ${requestData}                          telco
  remove from dictionary   ${requestData}                          conName
  remove from dictionary   ${requestData}                          conTel
  remove from dictionary   ${requestData}                          aos
  remove from dictionary   ${requestData}                          interLATACarrier
  remove from dictionary   ${requestData}                          intraLATACarrier
  remove from dictionary   ${requestData}                          destNums
  remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          priInterLT
  remove from dictionary   ${requestData}                          priIntraLT
  remove from dictionary   ${requestData}                          tmZn
  remove from dictionary   ${requestData}                          lbl
  remove from dictionary   ${requestData}                          tgtRecVersionId
  remove from dictionary   ${requestData}                          asyncId
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          overWriteTGT
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  ${keyword}=     set variable       Parse Customer Record Disconnect
  Parse Return Code   ${resp}        ${keyword}
  set suite variable                 ${EFF_Date_Time1}
  set suite variable                 ${EFF_Date_Time2}
  set suite variable                 ${reservedTFN}
  ###############################################################################################################


TC14 Delete_Pending_Disconnect_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to delete a Customer Record for a given Number, Effective Date and Time.
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD for Delete
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time2}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           DELETE  PENDING CAD DISCONNECT
  ##############################################################################################################
  ${effDate}=              Format Date Time                ${Q_effDtTm}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${Query_recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################


TC15 Delete_Final_Pending_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to delete a Customer Record for a given Number, Effective Date and Time.
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD
  Log                                  ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD for Delete
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time1}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           DELETE FIRST PENDING CAD
  ##############################################################################################################
  ${effDate}=              Format Date Time                ${Q_effDtTm}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${Query_recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################



TC16 Create_Pending_Complex_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to create a Customer Record for a given
  ...               Toll-Free Number, Effective Date and Time.
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD   NA  ComplexCAD
  Log                                  ${HOST}
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${reservedTFN}=          get Reserve Random Number      ${token}     ${ReqData}
  ${Date}=                 get current date
  ${EFF_Date_Time1}=       get new future effective date and time         ${Date}         3
  set suite variable       ${EFF_Date_Time1}
  set suite variable       ${reservedTFN}
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0022
  ${intraLATACarrier}      create list                    0022
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${CPR_Data}''')       json
  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time1}
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=0999
  remove from dictionary   ${requestData}                          newRespOrgId
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Customer Record Response
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################


TC17 Copy_Pending_Complex_Customer_Record
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD  ComplexCAD
  Log                                  ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD for Copy
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time1}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD, LAD, CPR
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           COPY PENDING CAD
  ##############################################################################################################
  ${Date}=                 get current date
  ${EFF_Date_Time2}=       get new future effective date and time         ${Date}         5
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/copy
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${CPR_Data}''')       json
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          tgtEffDtTm=${EFF_Date_Time2}
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          srcRecVersionId=${Query_recVersionId}
  set to dictionary        ${requestData}                          notes=COPIED CAD FOR ${reservedTFN}
  set to dictionary        ${requestData}                          custRecCompPart=CAD, LAD, CPR
  remove from dictionary   ${requestData}                          interLATACarrier
  remove from dictionary   ${requestData}                          svcOrderNum
  remove from dictionary   ${requestData}                          aos
  remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          destNums
  remove from dictionary   ${requestData}                          priInterLT
  remove from dictionary   ${requestData}                          intraLATACarrier
  remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          priIntraLT
  remove from dictionary   ${requestData}                          lbl
  remove from dictionary   ${requestData}                          num
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Customer Record Copy
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  Parse Return Code   ${resp}        ${keyword}
  set suite variable       ${EFF_Date_Time2}
  ###############################################################################################################


TC18 Transfer_Pending_Complex_Customer_Record
  #Pass Execution     Working but takes too much time.
  [Tags]     REGRESSION  CustAdmin   CAD  ComplexCAD
  Log                                  ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD for TRANSFER
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time2}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD, LAD, CPR
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  ${Date}=                 get current date
  ${EFF_Date_Time3}=       get new future effective date and time         ${Date}         4
  ###############################################################################################################
  BuiltIn.Comment           TRANSFER PENDING CAD to New Date/Time
  ##############################################################################################################
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/transfer
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${CPR_Data}''')       json
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          srcEffDtTm=${EFF_Date_Time2}
  set to dictionary        ${requestData}                          tgtEffDtTm=${EFF_Date_Time3}
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          srcRecVersionId=${Query_recVersionId}
  set to dictionary        ${requestData}                          notes=TRANSFERED CAD FOR ${reservedTFN}
  set to dictionary        ${requestData}                          custRecCompPart=CAD, LAD, CPR
  remove from dictionary   ${requestData}                          interLATACarrier
  remove from dictionary   ${requestData}                          svcOrderNum
  remove from dictionary   ${requestData}                          aos
  remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          destNums
  remove from dictionary   ${requestData}                          priInterLT
  remove from dictionary   ${requestData}                          intraLATACarrier
  remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          priIntraLT
  remove from dictionary   ${requestData}                          lbl
  remove from dictionary   ${requestData}                          num
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Customer Record Transfer
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time3}
  Parse Return Code   ${resp}        ${keyword}
  set suite variable       ${EFF_Date_Time3}
  ###############################################################################################################





TC20 Delete_Last_Pending_Complex_Customer_Record
  [Tags]     REGRESSION  CustAdmin   CAD  ComplexCAD
  #Pass Execution     Working but takes too much time.
  Log                                  ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD for Delete
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time3}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD, LAD, CPR
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time3}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           DELETE PENDING CAD
  ##############################################################################################################
  ${effDate}=              Format Date Time                ${Q_effDtTm}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${Query_recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################













TC21 Delete_First_Pending_Complex_Customer_Record
  [Tags]     REGRESSION  CustAdmin   CAD  ComplexCAD
  #Pass Execution     Working but takes too much time.
  Log                                  ${HOST}
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD for Delete
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time1}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD, LAD, CPR
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           DELETE PENDING CAD
  ##############################################################################################################
  ${effDate}=              Format Date Time                ${Q_effDtTm}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${Query_recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################




TC41 Retrieve_Template_List_for_BR_and_find_Active_Template
  [Documentation]   Allows the SMS800 TFNRegistry user to retrieve a list of templet records for an entity.
  [Tags]     REGRESSION  CustAdmin   Template
  #Pass Execution     Working but takes too much time.
  Log                                  ${HOST}
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${br_entity}=            set variable           BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/lst/entity/${br_entity}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Set test variable        ${GET_ACTION_URI}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Get Request        endpoint       ${GET_ACTION_URI}               headers=${headers}
  ${keyword}=     set variable       Parse Template List
  Parse Return Code   ${resp}        ${keyword}
  Log List    ${tmplList}
  ${ActiveList}=       Get Active Template List     ${tmplList}
  set suite variable     ${ActiveList}



TC30 Create_Pending_Pointer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to create a Pointer Record for a given
  ...               Toll-Free Number, Effective Date and Time.
  [Tags]     REGRESSION  CustAdmin   PAD   NA
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${reservedTFN}=          get Reserve Random Number      ${token}     ${ReqData}
  ${Date}=                 get current date
  ${EFF_Date_Time1}=       get new future effective date and time         ${Date}         8
  set suite variable       ${EFF_Date_Time1}
  ${tmplName}=             set variable                   ${ActiveList[2]}
  #${tmplName}=             set variable                   ${ActiveList[14]}
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0022
  ${intraLATACarrier}      create list                    0022
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${PAD_Data}''')       json
  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          svcOrderNum=J098
  set to dictionary        ${requestData}                          notes=PTR RECORD --> ${tmplName}
  set to dictionary        ${requestData}                          tmplName=${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time1}
  set to dictionary        ${requestData}                          conTel=7326990000
  set to dictionary        ${requestData}                          conName=JIM PETERSEN
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=0999
  #remove from dictionary   ${requestData}                          svcOrderNum
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  
  set Test variable        ${Expected_Error}     CPR/MAIN/CARRIER/0555: Carrier is not Supported by Network BX.

  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Pointer Record Response
  set suite variable         ${reservedTFN}
  Parse Return Code   ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${EFF_Date_Time1};${CAD_Status};${tmplName}  ${ROID}   ${HOST}
  ###############################################################################################################


TC35 Delete_Pending_Pointer_Record
  [Documentation]  Allows the SMS800 TFNRegistry user to delete a pending Pointer Record for a given
  ...               Toll-Free Number, Effective Date and Time.
  [Tags]     REGRESSION  CustAdmin   PAD
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING PAD for Delete
  ###############################################################################################################
  ${effDate}=              Format Date Time                ${EFF_Date_Time1}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/query/${reservedTFN}?effDtTm=${effDate}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   PAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           DELETE PENDING PAD
  ##############################################################################################################
  ${effDate}=              Format Date Time                ${Q_effDtTm}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${Query_recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Pointer Record Delete
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################


TC40 Create_Pending_Template_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to create a Template Record for a given
  ...               Toll-Free Number, Effective Date and Time.
  [Tags]     REGRESSION  CustAdmin   TAD
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ${entity}=               get substring          ${ROID}           0     2
  ${mid}=                  get random string      3          [UPPER]
  ${tmplName}=             set variable                    *${entity}-${mid}5-TEST
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time1}=       get new future effective date and time         ${Date}         30
  set suite variable       ${EFF_Date_Time1}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  ${requestData}=          evaluate               json.loads('''${T_data}''')       json
  set to dictionary        ${requestData}                          tmplName=${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time1}
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Template Record Response
  Parse Return Code   ${resp}        ${keyword}
  set suite variable         ${tmplName}
  Add to Transaction Total   ${EFF_Date_Time1};${CAD_Status};${tmplName}  ${ROID}   ${HOST}
  ###############################################################################################################


TC45 Delete_Pending_Template_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to delete a pending Template Record for a given
  ...               Toll-Free Number, Effective Date and Time.
  [Tags]     REGRESSION  CustAdmin   TAD
  Log                                  ${HOST}
  #Pass Execution     Working but takes too much time.
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING TAD for Delete
  ###############################################################################################################
  #${effDate}=              Format Date Time                ${EFF_Date_Time1}
  ${mod_tmplName}=          Evaluate                       '${tmplName}'.replace('*','')
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${mod_tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  set test variable        ${GET_ACTION_URI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   TAD, CPR
  ${keyword}=     set variable       Parse Template Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           DELETE PENDING TAD
  ##############################################################################################################
  ${effDate}=              Format Date Time                ${Q_effDtTm}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${mod_tmplName}/effDtTm/${effDate}/recVersionId/${Query_recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Template Record Delete
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################











Close_session_with_Resp_Org
    Close Session

*** Keywords ***


Get TFN Status
  [Arguments]       ${token}  ${TFN}
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${TFN}
  set test variable        ${GET_ACTION_URI}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}
  [Return]        ${Query_status}



Format Date Time
  [Arguments]       ${DateTime}
  ${mod_effDate}=          Evaluate                       '${DateTime}'.replace('-','')
  ${effDateT}=             Evaluate                       '${mod_effDate}'.replace(':','')
  ${effDate}=              set variable                   ${effDateT}
  [Return]          ${effDate}
