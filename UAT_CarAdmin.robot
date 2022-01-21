*** Settings ***
Documentation   This Suite Consists of API for Carrier Administration Microservice
...             Developer Resources (Carrier Administration) - Test Cases
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
${status_code}                              200
${RESERVED}                                 RESERVED
${numDesc}                                  Invalid Number Included
${email}                                    jpetersen.ctr@somos.com
${recversionIDForCIS}
${cicCode}
#${API_Admin_User_Credentials_for_UAT_AWS}     {"usrName": "${UAT_AWS_Admin_USER}","password": "${UAT_AWS_Admin_PASSWORD}","withPerm": true}
${ReqBody_Mandatory_params}                   {"num":"8556664830","cmd":"U","effDtTm":"2018-03-10T10:00Z","agent":"NEWAG","notes":"NEW CAD","onAccCust":"1234A","endSubAddr":"NEW SAMPLE endSubAddr","suppFormNum":"adcdqw","svcOrderNum":"asagh","intraLATACarrier":["0555"],"interLATACarrier":["0555"],"aos":{"aosNet":["${validAosNet_CRO}"]},"destNums":[{"destNum":"8556664830","numTermLine":100}]}
${UCI_UPDT_Data}                              {"loginId": "string","primaryEmail": "user@example.com","ntfnInd": "Y","conName": "string","conPhone": "string","shrtNotes": "string","prefTmZn": "A","recVersionId": "string"}
###################################################################################################################
#${GNA_create_Data}        {"cicCode": "1234","netWrkId": "string","carrierActions": {"addRtng": "RA","pssblRtng": "RA","delRtngWork": "NON","delRtngDscnt": "NON","respChng": "NON"},"dlvryMthdsToCar": {"ntfy": {"online": "Y","mgicli": "N","mgicliLst": ["string"]}, "apprvl": {"mgicli": "N","mgicliLst": ["string"]}}}

${GNA_create_Data}        {"cicCode": "1234","netWrkId": "string","carrierActions": {"addRtng": "RA","pssblRtng": "RA","delRtngWork": "NON","delRtngDscnt": "NON","respChng": "NON"},"dlvryMthdsToCar": {"ntfy": {"online":"N","mgicli": "Y","mgicliLst": ["MGISIMULATO"], "unsolicitedNotification": "Y","unsolicitedNotificationList": [{"domainName": "127.0.0.0","port": "8080"}]},"apprvl": {"online":"N","mgicli": "Y","mgicliLst": ["MGISIMULATO"],"unsolicitedNotification": "Y","unsolicitedNotificationList": [{"domainName": "127.1.1.1","port": "8081"}]}}}
                                                                                    #{"respChng": "NON","pssblRtng": "RA","delRtngDscnt": "NON","delRtngWork":"NON","addRtng": "RA"}, "dlvryMthdsToCar": {"ntfy": {"unsolicitedNotification": "Y","unsolicitedNotificationList": [{"domainName": "127.0.0.0","port": "8080"}]},"apprvl": { "online": "Y","mgicli": "Y", "mgicliLst": ["MGISIMULATO"],"unsolicitedNotification": "Y", "unsolicitedNotificationList": [{"domainName": "127.1.1.1","port": "8081"}]}}

${GNA_delete_Data}        {"cicCode": "string","netWrkId": "string","recVersionId": "string"}
${ENA_create_Data}        {"cicCode": "string","netWrkId": "string","entity": "string","respOrgId": "string","carrierActions": {"addRtng": "NON","pssblRtng": "NON","delRtngWork": "NON","delRtngDscnt": "NON","respChng": "NON"}}
${ENA_delete_Data}        {"cicCode": "string","netWrkId": "string","entity": "string","respOrgId": "string","recVersionId": "string"}
${NUM_QRY_Data}           {"numList": ["8555551212"],"requestDesc": "string","email": "jpetersen.ctr@somos.com","asyncId": "string"}
${NUM_UPDT_Data}          {"tfNumList": [{"num": "string","recVersionId": "string"}],"requestDesc": "string","email": "user@example.com","ctrlRespOrgId": "string","conName": "string","conPhone": "string","resUntilDt": "string","status": "SPARE","shrtNotes": "string","asyncId": "string"}
${ReqData}                {"conName":"PALLA","conTel":"${UserProfileCreate_PhoneNum}"}
${NUM_RSCH_Data}          {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string"}
${NUM_SSCH_Data}          {"numList": ["string"],"asyncId": "string"}
${NUM_WSCH_Data}          {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string","wildCardNum": "string"}
${NUM_RSRV_Data}          {"conName": "string","conTel": "string","shrtNotes": "string","numList": ["string"],"asyncId": "string"}
${NUM_RRSV_Data}          {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","conName": "string","conTel": "string","shrtNotes": "string","asyncId": "string"}
${NUM_WRSV_Data}          {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","conName": "string","conTel": "string","shrtNotes": "string","asyncId": "string","wildCardNum": "string"}
${Disconnect_ReqBody_Mandatory_params}                  {"srcNum": "","cmd": "U","tgtEffDtTm": "","custRecCompPart":"CAD","srcRecVersionId": ""}
${Tran_Tot}                0


*** Test Cases ***

OpenSession_Login_with_Resp_Org
   #Pass Execution       NOT Working.
   Log                                  ${API_Admin_User_Credentials_for_UAT_AWS}
   ${SESSION_OPEN_V3}=      Set Variable           /v3/ip/sec/session/open
   Set Global Variable                  ${SESSION_OPEN_V3}
   ${HOST}=                 Set Variable           ${UAT_AWS_HOST}
   Set Global Variable                  ${HOST}
   Create Session  endpoint             ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json       Accept=application/json
   ${resp}=  Post Request  endpoint    ${SESSIONOPEN_V3}  data=${API_Admin_User_Credentials_for_UAT_AWS}  headers=${headers}
   log     ${resp}
   Should Be Equal As Strings  ${resp.status_code}  200
   ${sessionopenResp}=  To Json  ${resp.content}
   Log  ${sessionopenResp}
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


TC040 Retrieve_Template_List_for_BR_and_find_Active_Templates
   [Tags]     REGRESSION  CustAdmin   Template
   #Pass Execution        Working
   ${token}=                get token
   ${oauthToken}=           set variable           ${token}
   ${br_entity}=            set variable           BR
   ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/lst/entity/${br_entity}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   #${PUT_ACTION_URI}=       set variable                   /v3/ip/cus/tpl/lst
   set test variable        ${GET_ACTION_URI}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
   set test variable        ${headers}
   ${resp}=     Get Request        endpoint       ${GET_ACTION_URI}               headers=${headers}
   ${keyword}=     set variable       Parse Template List
   Parse Return Code   ${resp}        ${keyword}
   ${Alist}=        Get Active Template List     ${tmplList}
   Sort List        ${Alist}
   Log List         ${Alist}
   ${Tran_Tot}=       set variable     1
   [Teardown]        Add to Transaction Total   ${Tran_Tot}   ${RespOrgID}  ${HOST}


TC041 Retrieve_Template_List_for_BR_and_find_Pending_Templates
   [Tags]     REGRESSION  CustAdmin   Template
   #Pass Execution        Working
   ${token}=                get token
   ${oauthToken}=           set variable           ${token}
   ${br_entity}=            set variable           BR
   ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/lst/entity/${br_entity}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   #${PUT_ACTION_URI}=       set variable                   /v3/ip/cus/tpl/lst
   set test variable        ${GET_ACTION_URI}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
   set test variable        ${headers}
   ${resp}=     Get Request        endpoint       ${GET_ACTION_URI}               headers=${headers}
   ${keyword}=     set variable       Parse Template List
   Parse Return Code   ${resp}        ${keyword}
   ${Plist}=        Get Pending Template List    ${tmplList}
   Log List         ${Plist}
   ${Tran_Tot}=       set variable     1
   [Teardown]        Add to Transaction Total   ${Tran_Tot}   ${RespOrgID}  ${HOST}

TC043 Retrieve_Template_List_for_BR_and_find_Templates_with_0_Pointers
   [Tags]     REGRESSION  CustAdmin   Template
   #Pass Execution        Working
   ${token}=                get token
   ${oauthToken}=           set variable           ${token}
   ${br_entity}=            set variable           BR
   ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/lst/entity/${br_entity}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${PUT_ACTION_URI}=       set variable                   /v3/ip/cus/tpl/lst
   set test variable        ${PUT_ACTION_URI}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
   set test variable        ${headers}
   ${resp}=     Get Request        endpoint       ${GET_ACTION_URI}               headers=${headers}
   ${keyword}=     set variable       Parse Template List
   Parse Return Code   ${resp}        ${keyword}
   ${0list}=        Get Template List 0 Pointers    ${tmplList}
   Log List         ${0list}
   ${Tran_Tot}=       set variable     1
   [Teardown]        Add to Transaction Total   ${Tran_Tot}  ${RespOrgID}  ${HOST}

TC044 Create_Active_Customer_Record
   [Tags]     REGRESSION  CustAdmin   CAD   NA
   #Pass Execution        Customer records will not go to ACTIVE.
   ${token}=              get token
   ${reservedTFN}=        get Reserve Random Number      ${token}     ${ReqData}
   ${EFF_Date_Time}=      set variable          NOW
   ${resporgId}=          Get RespOrgID
   ${telco}=              Get Telco             ${token}
   ${interLATACarrier}=   create list           0555
   ${intraLATACarrier}=   create list           0555
   ${oauthToken}=         set variable          ${token}
   ${CR_v3_UCI}=          set variable                   /v3/ip/cus/rec
   ${GET_ACTION_URI}=     set variable                   ${CR_v3_UCI}
   ${requestData}=        evaluate    json.loads('''${ReqBody_Mandatory_params}''')    json
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
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}     ROID=${ROID}
   ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse Customer Record Response
   Parse Return Code   ${resp}        ${keyword}
   #${responseData}=     POST Method      ${token}     ${POST_CAD_Create}     ${reqBody}       ${SuccessResponse}
   #should not be empty        ${responseData}
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
        Run Keyword If         '${CAD_Status}' == '${ACTIVE}'      Exit For Loop
   END
   Log      ${CAD_Status}
   should be equal  ${CAD_Status}  ${ACTIVE}
   set suite variable      ${reservedTFN}
   ${Tran_Tot}=       set variable     2
   [Teardown]        Add to Transaction Total   ${Tran_Tot}   ${RespOrgID}  ${HOST}

   #############################################################################################


TC045 Query_SCP_Status_for_TFN
   [Tags]   SCP   CAD/PAD   CRA   SCPstatus   d-13965
   #Pass Execution        SCP Adapter not responding.
   ${token}=                get token
   ${TFNum}=                set variable                   ${reservedTFN}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra/tfnum/${TFNum}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CRA Record
   Parse Return Code   ${resp}        ${keyword}
   Log List      ${scpRecs}
   ${Tran_Tot}=       set variable     1
   [Teardown]        Add to Transaction Total   ${Tran_Tot}   ${RespOrgID}  ${HOST}

TC046 Resend_to_SCPs_for_TFN
   [Tags]   SCP   CAD/PAD   CRR   SCPstatus   d-13965
   #Pass Execution        SCP Adapter not responding.
   ${token}=                get token
   ${TFNum}=                set variable                   ${reservedTFN}
   Set test variable      ${Expected_Error}    The Resend request has been submitted. Detailed results will be sent to user's SMS/800 Toll-Free Number Registry mailbox.
    #   Gives error code 516006
   #${payload}=               set variable     {"tmplName":"*BR","action":"RESEND","scpRecs":["YK01","BX01"]}
    #   Gives error code 516017
   ${payload}=               set variable     {"num":"${TFNum}","action":"RESEND","scpRecs":["YK01"]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${Tran_Tot}=       set variable     1
   ${requestData}        evaluate    json.loads('''${payload}''')    json
   set to dictionary        ${requestData}                 num=${TFNum}
   set to dictionary        ${requestData}                 action=RESEND
   remove from dictionary   ${requestData}                 tmplName
   remove from dictionary   ${requestData}                 asyncId
   ${reqbody}=         evaluate    json.dumps(${requestData})    json
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse NLA Success Response
   Parse Return Code   ${resp}        ${keyword}

   [Teardown]        Add to Transaction Total   ${Tran_Tot}   ${RespOrgID}  ${HOST}


TC047 Audit_to_SCPs_for_TFN
   [Tags]   SCP   CAD/PAD   CRR   SCPstatus   d-13965
   #Pass Execution        SCP Adapter not responding.
   ${token}=                get token
   ${TFNum}=                set variable                   ${reservedTFN}
   Set test variable      ${Expected_Error}    The Audit request has been submitted. Detailed results will be sent to user's SMS/800 Toll-Free Number Registry mailbox.
    #   Gives error code 516006
   #${payload}=               set variable     {"tmplName":"*BR","action":"RESEND","scpRecs":["YK01","BX01"]}
    #   Gives error code 516017
   ${payload}=               set variable     {"num":"${TFNum}","action":"RESEND","scpRecs":["YK01"]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${Tran_Tot}=       set variable     1
   ${requestData}        evaluate    json.loads('''${payload}''')    json
   set to dictionary        ${requestData}                 num=${TFNum}
   set to dictionary        ${requestData}                 action=AUDIT
   remove from dictionary   ${requestData}                 tmplName
   remove from dictionary   ${requestData}                 asyncId
   ${reqbody}=         evaluate    json.dumps(${requestData})    json
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse NLA Success Response
   Parse Return Code   ${resp}        ${keyword}

   [Teardown]        Add to Transaction Total   ${Tran_Tot}    ${RespOrgID}  ${HOST}



TC050 Query_SCP_Status_for_Template
   [Tags]   SCP  Template    CRA   SCPstatus   d-13965
   #Pass Execution        SCP Adapter not responding.
   ${ROID}=                 set variable                   BRSAC
   ${token}=                get token
   ${tmplName}=                set variable                BR-100
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra/tmplName/%2A${tmplName}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}       ROID=${ROID}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CRA Record
   Parse Return Code   ${resp}        ${keyword}
   Log List      ${scpRecs}
   ${Tran_Tot}=       set variable     1
   [Teardown]        Add to Transaction Total   ${Tran_Tot}    ${RespOrgID}  ${HOST}

TC051 Resend_to_SCP_for_Template
   [Tags]   SCP   Template   CRA   SCPstatus   d-13965
   #Pass Execution        SCP Adapter not responding.
   ${ROID}=                 set variable                   BRSAC
   ${token}=                get token
   ${tmplName}=                set variable                BR-100
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra/tmplName/%2A${tmplName}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}       ROID=${ROID}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CRA Record
   Parse Return Code   ${resp}        ${keyword}
   Log List      ${scpRecs}
   Log           ${lstEffDtTms}
   ########################################################################################################
   Set test variable      ${Expected_Error}    The Resend request has been submitted. Detailed results will be sent to user's SMS/800 Toll-Free Number Registry mailbox.
   ${payload}=              set variable     {"tmplName":"*BR","action":"RESEND","scpRecs":["YK01"]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${Tran_Tot}=             set variable                   2
   ${requestData}        evaluate    json.loads('''${payload}''')    json
   set to dictionary        ${requestData}                 tmplName=*${tmplName}
   set to dictionary        ${requestData}                 action=RESEND
   remove from dictionary   ${requestData}                 asyncId
   ${reqbody}=         evaluate    json.dumps(${requestData})    json
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse NLA Success Response
   Parse Return Code   ${resp}        ${keyword}

   [Teardown]        Add to Transaction Total   ${Tran_Tot}    ${RespOrgID}  ${HOST}





TC01 List_Carrier_Agreements
   [Tags]      CAG
   #Pass Execution       NOT Working.
   set test variable        ${Expected_Error}              No CAG data is found.
   ${token}=                get token
   ${NPA}=                  set variable                   908
   ${netWrkId}=             set variable                   VQ
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/cag/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CAG List
   Parse Return Code   ${resp}        ${keyword}

TC02 List_Access_Customer_Names_Abbreviations
   [Tags]     CIS    ACNA
   #Pass Execution       NOT Working.
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   ${token}=                get token
   ${NPA}=                  set variable                   908
   ${netWrkId}=             set variable                   VQ
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/cis/acna/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse ACNA List
   Parse Return Code   ${resp}        ${keyword}
   Log List            ${acnaLst}

TC03 List_Carrier_Information_Codes
   [Tags]     CIS   CIC
   #Pass Execution       NOT Working.
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   ${token}=                get token
   #${NPA}=                  set variable                   908
   #${netWrkId}=             set variable                   VQ
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/cis/cic/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CIC List
   Parse Return Code   ${resp}        ${keyword}
   Log List            ${carrierLst}

TC04 Retrieve_Carrier_Information_and_Security_using_ACNA
   [Documentation]      Record has both primary and secondary CICcodes
   [Tags]     CIS   ACNA
   #Pass Execution       NOT Working.
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   ${token}=                get token
   #${NPA}=                  set variable                   908
   ${acna}=                 set variable                   MCI
   set test variable        ${acna}
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/cis/acna/${acna}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CIS Record
   Parse Return Code   ${resp}        ${keyword}
   #Log         ${respOrg}
   Log         ${cicCode}


TC05 Retrieve_Carrier_Information_and_Security_using_ACNA_and_secondary_cicCode
   [Documentation]      Record has both primary and secondary CICcodes
   [Tags]     CIS   CIC   ACNA
   #Pass Execution       NOT Working.
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   ${token}=                get token
   #${NPA}=                  set variable                   908
   ${acna}=                 set variable                   MCI
   set test variable        ${acna}
   ${cicCode}=              set variable                   0022
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/cis/acna/${acna}/cicCode/${cicCode}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CIS Record
   Parse Return Code   ${resp}        ${keyword}
   Log         ${cicCode}
   Log         ${cicCode_sec}

TC06 Retrieve_Carrier_Information_and_Security_using_ACNA_wo_CIC
   [Documentation]      Record has only primary CICcode
   [Tags]     CIS   ACNA
   #Pass Execution       NOT Working.
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   ${token}=                get token
   #${NPA}=                  set variable                   908
   ${acna}=                 set variable                   BSO
   set test variable        ${acna}
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/cis/acna/${acna}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CIS Record
   Parse Return Code   ${resp}        ${keyword}
   Log         ${cicCode}

TC07 Retrieve_Carrier_Information_and_Security_using_ACNA_OTC
   [Documentation]      Record has only primary CICcode
   [Tags]     CIS   ACNA
   #Pass Execution       NOT Working.
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   ${token}=                get token
   #${NPA}=                  set variable                   908
   ${acna}=                 set variable                   OTC
   set test variable        ${acna}
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/cis/acna/${acna}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CIS Record
   Parse Return Code   ${resp}        ${keyword}
   Log         ${cicCode}


TC08 Retrieve_Exception_Approval_using_cicCode_Permission_Error
   [Documentation]      No EAP data exists for this CIC.
   [Tags]     EAP   CIC

   #Pass Execution       NOT Working.
   set test variable        ${Expected_Error}              Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   #set test variable        ${Expected_Error}              To create 'Entity Notification and Approval ', 'Exception Notification' or 'Exception Approval ', its 'General Notification and Approval-CIC-level' must exist first.
   ${token}=                get token
   ${cicCode}=              set variable                   9122
   ${acna}=                 set variable                   BSO
   set test variable        ${acna}
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/eap/cicCode/${cicCode}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${respOrg}=              get resporgid
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CIS Record
   Parse Return Code   ${resp}        ${keyword}
   Log         ${cicCode}



TC010 Retrieve_General_Notification_and_Approval_Record_using_cicCode
   [Documentation]      RO has no permission for retrieve record.
   [Tags]     GNA  CIC

   #Pass Execution       NOT Working.
   set test variable        ${Expected_Error}              Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${token}=                get token
   ${cicCode}=              set variable                   9122
   ${acna}=                 set variable                   BSO
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/gna/${cicCode}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${respOrg}=              get resporgid
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse GNA Record
   Parse Return Code   ${resp}        ${keyword}


TC011 Delete_General_Notification_and_Approval_Record_with_Success
   [Documentation]   This API allows the SMS/800 TFN Registry user to delete
   ...               General Notification and Approval data.
   [Tags]     GNA   CIC
   Pass Execution       ADMIN only.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${cicCode}=              set variable                    9122
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/gna/delete
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${GNA_delete_Data}''')       json
   set to dictionary        ${requestData}                                   cicCode=${cicCode}
   set to dictionary        ${requestData}                                   recVersionId=${recVersionId_GNA}
   set to dictionary        ${requestData}                                   netWrkId=BR
   remove from dictionary   ${requestData}                                   netWrkId
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse GNA Delete Response
   Parse Return Code   ${resp}        ${keyword}

TC012 List_General_Notification_and_Approval_Records
   [Tags]     GNA
   #Pass Execution    NOT Working.
   set test variable        ${Expected_Error}              GNA data does not exist.
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/gna/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${respOrg}=              get resporgid
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse GNA List
   Parse Return Code   ${resp}        ${keyword}

TC013 List_Entity_Notification_and_Approval_Records
   #Pass Execution       NOT Working.
   [Tags]     ENA
   set test variable        ${Expected_Error}              ENA data does not exist.
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/ena/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${respOrg}=              get resporgid
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse ENA List
   Parse Return Code   ${resp}        ${keyword}

TC014 List_Entity_Agreements_with_Carriers_Records
   #Pass Execution       NOT Working.
   [Tags]     EAG
   #set test variable        ${Expected_Error}              ENA data does not exist.
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/eag/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${respOrg}=              get resporgid
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse EAG List
   Parse Return Code   ${resp}        ${keyword}

TC015 Retrieve_Entity_Agreements_with_Carriers_Records_using_Entity
   #Pass Execution       NOT Working.
   [Tags]     EAG
   #set test variable        ${Expected_Error}              ENA data does not exist.
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/eag/entity/${entityList[0]}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${respOrg}=              get resporgid
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse EAG Record
   Parse Return Code   ${resp}        ${keyword}


TC016 Create_Entity_Notification_and_Approval_Record_with_Error
   [Documentation]   This API allows the SMS/800 TFN Registry user to create
   ...               Entity Notification and Approval data.
   [Tags]     ENA
   #Pass Execution       NOT Working.
   set test variable        ${Expected_Error}            Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${cicCode}=              set variable                    9122
   ${entity}=               set variable                    BR
   ${respOrg}=              get resporgid
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/ena
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${ENA_create_Data}''')       json
   set to dictionary        ${requestData}                                  cicCode=${cicCode}
   set to dictionary        ${requestData}                                  entity=${entity}
   set to dictionary        ${requestData}                                  respOrgId=${respOrg}
   set to dictionary        ${requestData}                                  cicCode=${cicCode}
   remove from dictionary   ${requestData}                                  netWrkId
   #     either entity or respOrgId
   remove from dictionary   ${requestData}                                  respOrgId
   #remove from dictionary   ${requestData}                                  entity
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable        Parse ENA Record
   Parse Return Code   ${resp}        ${keyword}



TC018 Create_Entity_Notification_and_Approval_Record
   [Documentation]   This API allows the SMS/800 TFN Registry user to create
   ...               Entity Notification and Approval data.
   [Tags]     ENA
   #Pass Execution       NOT Working.
   set test variable        ${Expected_Error}           Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${cicCode}=              set variable                    9122
   ${entity}=               set variable                    BR
   ${respOrg}=              get resporgid
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/ena
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${ENA_create_Data}''')       json
   set to dictionary        ${requestData}                                  cicCode=${cicCode}
   set to dictionary        ${requestData}                                  entity=${entity}
   set to dictionary        ${requestData}                                  respOrgId=${respOrg}
   set to dictionary        ${requestData}                                  cicCode=${cicCode}
   remove from dictionary   ${requestData}                                  netWrkId
   #     either entity or respOrgId
   remove from dictionary   ${requestData}                                  respOrgId
   #remove from dictionary   ${requestData}                                  entity

   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable        Parse ENA Success Response
   Parse Return Code   ${resp}        ${keyword}



TC020 Retrieve_General_Notification_and_Approval_Record_after_Update_using_cicCode_01
   [Tags]     GNA   CIC
   #Pass Execution       NOT Working.
   set test variable        ${Expected_Error}              Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${token}=                get token
   ${cicCode}=              set variable                   9122
   ${acna}=                 set variable                   BSO
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/gna/${cicCode}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${respOrg}=              get resporgid
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse GNA List
   Parse Return Code   ${resp}        ${keyword}




TC022 Retrieve_General_Notification_and_Approval_Record_after_Update_using_cicCode_and_netWrkId_for_Error
   [Tags]     GNA
   #Pass Execution       NOT Working.
   set test variable        ${Expected_Error}              The network ID can only be used with Carrier (CIC) 0110, like '0110-BA'.
   ${token}=                get token
   ${cicCode}=              set variable                   9122
   ${netWrkId}=             set variable                   BR
   ${acna}=                 set variable                   BSO
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/gna/${cicCode}?netWrkId=${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${respOrg}=              get resporgid
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse GNA Record
   Parse Return Code   ${resp}        ${keyword}

TC023 List_General_Notification_and_Approval_Record_Not_exist
   [Tags]     GNA
   #Pass Execution       NOT Working.
   set test variable        ${Expected_Error}              GNA data does not exist.
   ${token}=                get token
   ${cicCode}=              set variable                   9122
   ${netWrkId}=             set variable                   BR
   ${acna}=                 set variable                   BSO
   ${CR_v3_UCI}=            set variable                   /v3/ip/car/gna/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${respOrg}=              get resporgid
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse GNA List
   Parse Return Code   ${resp}        ${keyword}



 TC000 Disconnect_Active_Customer_Record_to_go_Transitional_status
    [Tags]     REGRESSION  CustAdmin   CAD   NA  Transitional
    #Pass Execution        Customer records will not go to ACTIVE.
    ###############################################################################################################

    ###############################################################################################################
    ${token}=                get token
    ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
    ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
    Create Session           endpoint                       ${HOST}
    ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
    ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
    Log                         ${resp}
    ${keyword}=     set variable       Parse Customer Record Query
    set Test Variable      ${Q_index}       0
    Parse Return Code   ${resp}        ${keyword}
    ###############################################################################################################

    ${EFF_Date_Time}=      set variable          NOW
    ${resporgId}=          Get RespOrgID
    ${oauthToken}=         set variable          ${token}
    ${CR_v3_UCI}=          set variable                   /v3/ip/cus/rec
    ${GET_ACTION_URI}=     set variable                   ${CR_v3_UCI}

    ${requestData}    evaluate    json.loads('''${Disconnect_ReqBody_Mandatory_params}''')    json
    set to dictionary        ${requestData}          srcNum=${reservedTFN}
    set to dictionary        ${requestData}          tgtEffDtTm=${EFF_Date_Time}
    set to dictionary        ${requestData}          srcRecVersionId=${Query_recVersionId}
    set to dictionary        ${requestData}          referral=Y
    set to dictionary        ${requestData}          endInterceptDt=${EFF_Date_Time}

    ${Req_body}=         evaluate    json.dumps(${requestData})    json
    Create Session           endpoint               ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
    ${resp}=     Post Request        endpoint       ${POST_CAD_Disconnect}       data=${reqBody}               headers=${headers}
    ${keyword}=     set variable       Parse Customer Record Disconnect
    Parse Return Code   ${resp}        ${keyword}
    ${TRANSITIONAL}=   set variable     TRANSITIONAL
    ${NUM_Status}=     set variable     SPARE
    BuiltIn.Comment    Check CR Status change from  ACTIVE to TRANSITIONAL
    FOR     ${Index}      IN RANGE    1     15
         ${responsedata_View}=    GET METHOD     ${token}     ${GET_LAD_VIEW}${CAD_View}${reservedTFN}         ${SuccessResponse}
         Sleep  1m
         should not be empty          ${responsedata_View}
         Log        ${responsedata_View}
         Convert to dictionary        ${responsedata_View}
         ${status}    ${NUM_Status}=          Run Keyword And Ignore Error    get from dictionary    ${responsedata_View}     numStatus
         Run Keyword If         '${NUM_Status}' == '${TRANSITIONAL}'      Exit For Loop
    END
    should be equal  ${NUM_Status}  ${TRANSITIONAL}
    #############################################################################################







Close_session_with_Resp_Org
    Close Session

*** Keywords ***


Get TFN Status
  [Arguments]       ${token}  ${TFN}
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${TFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}
  [Return]        ${Query_status}
