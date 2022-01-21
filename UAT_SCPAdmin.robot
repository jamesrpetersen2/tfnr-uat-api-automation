*** Settings ***
Documentation   This Suite Consists of API for the SCP Administration Microservice
...             Developer Resources Documentation (SCP Administration) - Test Cases

Library     Collections
Library     String
Library     RequestsLibrary
Library     OperatingSystem
Resource    ./UAT_End2End_Keywords.robot
#Resource    ./data_files/api/UAT_testdata.robot
#Test Setup         UserProfile Login                    ${API_User_Credentials_Track2}
#Test Teardown      Cleanup For Basic CAD Create         ${token}        ${TollFreeNumber}      ${effDateTm}
*** Variables ***


${HOST}                                     ${UAT_AWS_HOST}

${recversionIDForCIS}
${status_code}                              200
${RESERVED}                                 RESERVED
${numDesc}                                  Invalid Number Included
${email}                                    jpetersen.ctr@somos.com
${SENDING}                                  SENDING
${cicCode}
${acna}
${API_Admin_User_Credentials_for_UAT_AWS}     {"usrName": "${UAT_AWS_Admin_USER}","password": "${UAT_AWS_Admin_PASSWORD}","withPerm": true}
${ReqBody_Mandatory_params}                   {"num":"8556664830","cmd":"U","effDtTm":"2018-03-10T10:00Z","agent":"NEWAG","notes":"NEW CAD","onAccCust":"1234A","endSubAddr":"NEW SAMPLE endSubAddr","suppFormNum":"adcdqw","svcOrderNum":"asagh","intraLATACarrier":["0555"],"interLATACarrier":["0555"],"aos":{"aosNet":["${validAosNet_CRO}"]},"destNums":[{"destNum":"8556664830","numTermLine":100}]}
#${Password_Change_Data}                       {"usrName": "${UAT_AWS_USER}","oldPassword": "${UAT_AWS_Admin_PASSWORD}","newPassword": "${UAT_AWS_Admin_PASSWORD}"}
${UCI_UPDT_Data}                              {"loginId": "string","primaryEmail": "user@example.com","ntfnInd": "Y","conName": "string","conPhone": "string","shrtNotes": "string","prefTmZn": "A","recVersionId": "string"}
${NLA_Data}                 {"netWrkId": "string","conName": "string","conPhone": "string","conEmail": "JRPETERS2@HOTMAIL.COM","respOrgList": ["string"]}
${NCN_Data}                 {"netWrkId": "string","potsnpa": "string"}
${LCN_Data}                 {"netWrkId": "string","lata": "string"}
${CRA_Data}                 {"num": "string","tmplName": "string","effDtTm": "string","action": "AUDIT","critInd": "Y","scpRecs": ["string"]}
${NRL_Data}                 {"nrlList": [{"scpId": "string","numListChg": 1,"sspOverflow": 1,"recVersionId": "string"}]}
${NRC_create_Data}          {"scpId": "string","numListChgEmailList": ["JRPETERS2@HOTMAIL.COM"],"scpSttsChgEmailList": ["JRPETERS2@HOTMAIL.COM"],"sspOverflowEmailList": ["JRPETERS2@HOTMAIL.COM"],"failedReqEmailList": ["JRPETERS2@HOTMAIL.COM"],"tlcOverrideEmailList": ["JRPETERS2@HOTMAIL.COM"]}
${PRC_create_Data}          {"scpId": "string","execErrorEmailList": ["JRPETERS2@HOTMAIL.COM"],"misQueriesEmailList": ["JRPETERS2@HOTMAIL.COM"],"lowSampleSpaceEmailList": ["JRPETERS2@HOTMAIL.COM"],"failedReqEmailList": ["JRPETERS2@HOTMAIL.COM"],"respOrgChgFailEmailList": ["JRPETERS2@HOTMAIL.COM"]}
${CCC_updt_Data}            {"cccList": [{"scpId": "string","cccStatus": "ON","recVersionId": "string"}],"critInd": "Y"}
${MAC_create_Data}          {"num": "string","gapInterval": 0,"ctrlDuration": 1,"callTreatment": "NCA","numType": "DIAL"}
${MAC_updt_Data}            {"num": "string","scpList": [{"scpId": "BR01"}]}
${SID_create_Data}          {"scpId": "string","scpNodeId": "string","tmplSupprtd": "Y","mateScpId": "string"}
${SSP_create_Data}          {"netWrkId": "string","sspList": [{"sspNodeId": "string","pointCode": "string"}]}
${SSP_update_Data}          {"netWrkId": "string","sspList": [{"sspNodeId": "string","pointCode": "string"}],"recVersionId": "string"}
${NPA-NXX_create_Data}      {"scpId": "string","npa": "string","effDt": "string","treatments": [{"startNXX": "string","endNXX": "string","treatment": "B"}]}
${NPA-NXX_create_Data}      {"scpId": "string","npa": "string","effDt": "string","treatments": [{"startNXX": "string","endNXX": "string","treatment": "B"}],"recVersionId": "string"}
${ReqData}                  {"conName":"PETERSEN","conTel":"${UserProfileCreate_PhoneNum}"}
${Disconnect_CAD_Data}      {"srcNum": "string","tgtNum": "string","tgtEffDtTm": "string","tgtTmplName": "string","srcEffDtTm": "string","ctrlRespOrgId": "string","cmd": "U","tmplDesc": "string","hldIndFlag": "Y","priority": "Y","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["string"],"aosNet": ["string"],"aosState": ["string"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"cprSectName": [{"name": "string","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"dayLightSavings": "Y","priInterLT": "string","priIntraLT": "string","tmZn": "A","lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"custRecCompPart": "CAD","referral": "Y","endInterceptDt": "string","srcRecVersionId": "string","tgtRecVersionId": "string","asyncId": "string","overWriteTGT": "Y"}




*** Test Cases ***

OpenSession_Login_with_Resp_Org
   #Set Global Variable                  ${UAT_RESPORG_HOST}                                     ${UAT_AWS_HOST}
   #Set Global Variable                  ${UAT_ADMIN_HOST}                                       ${UAT_AWS_HOST}
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
   #${scope}=           Get From Dictionary     ${sessionopenResp}    scope
   #Log list         ${scope}
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

 TC001 List_CCS_Network_Information
   [Documentation]   Allows the SMS800 TFNRegistry user to get the list of entities to be used in CCS Network Information.
   [Tags]   SCP      NET
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/net/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse SCP Network List
   Parse Return Code   ${resp}        ${keyword}

 TC002 Retrieve_CCS_Network_Information_for_One_Specific_Network_ID
   [Documentation]    Get network information for Network ID=YK
   [Tags]   SCP      NET
   ${netWrkId}=             set variable                   YK
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/net/netWrkId/${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse SCP Network View
   Parse Return Code   ${resp}        ${keyword}

 TC003 Retrieve_CCS_Network_Information_for_Each_Specific_Network_ID
   [Documentation]    Get network information for each Network ID in the network List
   [Tags]   SCP      NET
   ${token}=                get token
   Create Session           endpoint                       ${HOST}
   ${keyword}=              set variable       Parse SCP Network View
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${x}=            get length        ${netWrkIdList}
   set test variable        ${Expected_Error}              Record does not exist.
   FOR     ${i}    IN RANGE   0      ${x}
     ${netWrkId}=             set variable                   ${netWrkIdList[${i}]}
     ${CR_v3_UCI}=            set variable                   /v3/ip/scp/net/netWrkId/${netWrkId}
     ${resp}=                 Get Request        endpoint    ${CR_v3_UCI}   headers=${headers}
     Parse Return Code        ${resp}            ${keyword}
   END

 TC004 List_NLA_Record_with_Error_1
   set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.
   [Tags]   SCP      NLA
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NLA Response
   Parse Return Code   ${resp}        ${keyword}


 TC005 List_existing_NCC_Records
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   [Tags]   SCP      NCC
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncc/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NCA Response
   Parse Return Code   ${resp}        ${keyword}

 TC006 Retrieve_existing_NCC_Record
   set test variable        ${Expected_Error}              Record does not exist.
   [Tags]   SCP      NCC
   ${token}=                get token
   ${netWrkId}=             set variable                   ${netWrkIdList[0]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncc/netWrkId/${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NCC Record
   Parse Return Code   ${resp}        ${keyword}



 TC007 Create_NLA_Record_for_AB_with_Error
   [Documentation]   This API allows the SMS/800 TFN Registry user to create
   ...       Network Provider-SCP Owner/Operator IntraLATA Agreements record for the Network.
   [Tags]   SCP      NLA
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${netWrkId}=             set variable                    AB
   ${conName}=              set variable                    JIM PETERSEN
   ${conPhone}=             set variable                    9082320442
   ${respOrg}=              get resporgid
   ${respOrgList}=          Create List                     ${respOrg}
   ${conEmail}=             set variable                    JRPETERS2@HOTMAIL.COM
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${NLA_Data}''')       json
   set to dictionary        ${requestData}                          netWrkId=${netWrkId}
   set to dictionary        ${requestData}                          conName=${conName}
   set to dictionary        ${requestData}                          conPhone=${conPhone}
   set to dictionary        ${requestData}                          conEmail=${conEmail}
   set to dictionary        ${requestData}                          respOrgList=${respOrgList}
   #remove from dictionary   ${requestData}                          conEmail
   remove from dictionary   ${requestData}                          asyncId
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse NLA Response
   Parse Return Code   ${resp}        ${keyword}


 TC008 Retrieve_NLA_Record_for_BR_before_Creation
   [Tags]   SCP      NLA
   set Test variable        ${Expected_Error}     Record does not exist.
   ${token}=                get token
   ${netWrkId}=             set variable                    BR
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla/netWrkId/${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NLA Record
   Parse Return Code   ${resp}        ${keyword}


 TC009 Create_NLA_Record_for_BR_with_Success
   [Documentation]   This API allows the SMS/800 TFN Registry user to create
   ...       Network Provider-SCP Owner/Operator IntraLATA Agreements record for the Network.
   [Tags]   SCP      NLA
   set Test variable        ${Expected_Error}     Record already exists.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${netWrkId}=             set variable                    BR
   ${conName}=              set variable                    JIM PETERSEN
   ${conPhone}=             set variable                    9082320442
   ${respOrg}=              get resporgid
   ${respOrgList}=          Create List                     ${respOrg}
   ${conEmail}=             set variable                    JRPETERS2@HOTMAIL.COM
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${NLA_Data}''')       json
   set to dictionary        ${requestData}                          netWrkId=${netWrkId}
   set to dictionary        ${requestData}                          conName=${conName}
   set to dictionary        ${requestData}                          conPhone=${conPhone}
   set to dictionary        ${requestData}                          conEmail=${conEmail}
   set to dictionary        ${requestData}                          respOrgList=${respOrgList}
   #remove from dictionary   ${requestData}                          conEmail
   remove from dictionary   ${requestData}                          asyncId
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   #set Test variable        ${Expected_Error}     First create 'NCC' record before creating an 'NLA' record.
   ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse NLA Success Response
   Parse Return Code   ${resp}        ${keyword}



 TC010 Retrieve_NLA_Record_for_BR_after_Creation
   [Tags]   SCP      NLA
   ${token}=                get token
   ${netWrkId}=             set variable                    BR
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla/netWrkId/${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NLA Record
   Parse Return Code   ${resp}        ${keyword}

 TC011 Update_NLA_Record_for_BR_with_Success
   [Documentation]   This API allows the SMS/800 TFN Registry user to create
   ...       Network Provider-SCP Owner/Operator IntraLATA Agreements record for the Network.
   [Tags]   SCP      NLA
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${netWrkId}=             set variable                    BR
   ${conName}=              set variable                    JAMES PETERSEN
   ${conPhone}=             set variable                    9089565118
   ${respOrg}=              get resporgid
   ${respOrgList}=          Create List                     ${respOrg}
   ${conEmail}=             set variable                    JRPETERS2@HOTMAIL.COM
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${NLA_Data}''')       json
   set to dictionary        ${requestData}                          netWrkId=${netWrkId}
   set to dictionary        ${requestData}                          conName=${conName}
   set to dictionary        ${requestData}                          conPhone=${conPhone}
   set to dictionary        ${requestData}                          conEmail=${conEmail}
   set to dictionary        ${requestData}                          respOrgList=${respOrgList}
   set to dictionary        ${requestData}                          recVersionId=${recVersionId_NLA}
   #remove from dictionary   ${requestData}                          conEmail
   remove from dictionary   ${requestData}                          asyncId
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse NLA Success Response
   Parse Return Code   ${resp}        ${keyword}

 TC012 List_existing_NPA_to_CCS_Network_Mapping
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   [Tags]   SCP      NCN
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncn/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NCN List Response
   Parse Return Code   ${resp}        ${keyword}
   Log List    ${npaCCSList}

 TC013 Retrieve_existing_NPA_to_CCS_Network_Mapping_using_NPA
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   [Tags]   SCP      NCN   D-13283
   ${token}=                get token
   ${NPA}=                  set variable                   908
   ${netWrkId}=             set variable                   VQ
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncn?potsnpa=${NPA}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NCN Response
   Parse Return Code   ${resp}        ${keyword}
   Log List      ${ncnList}
   ############################################################################################
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncn?netWrkId=${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NCN Response
   Parse Return Code   ${resp}        ${keyword}
   Log List      ${ncnList}
   ############################################################################################
   ${NPA}=                  set variable                   570
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncn?potsnpa=${NPA}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NCN Response
   Parse Return Code   ${resp}        ${keyword}
   Log List      ${ncnList}


 TC014 Create_Active_Customer_Record
   [Tags]     REGRESSION  CustAdmin   CAD   NA
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
   FOR     ${Index}      IN RANGE    1     17
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
   set suite variable      ${reservedTFN}
   set suite variable      ${CAD_EffDT}
   Add to Transaction Total   ${reservedTFN};${CAD_EffDT};${CAD_Status}  ${resporgId}  ${HOST}
   #############################################################################################





 TC015 Query_SCP_Status_for_TFN
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
   Should not be empty      ${scpRecs}
   ${x}=        get length      ${scpRecs}
   ${scpRecStat}=         set variable     NP
   FOR     ${Index}      IN RANGE    0   ${x}
       #Log    ${scpRecs[${Index}]}
      ${scpId}=  Get from dictionary     ${scpRecs[${Index}]}    scpId
      ${inAOS}=  Get from dictionary     ${scpRecs[${Index}]}    inAOS
      ${scpRecStat}=  Run Keyword if     '${inAOS}' == 'Y'     Get from dictionary     ${scpRecs[${Index}]}    scpRecStat
   END

TC016 Disconnect_Active_Customer_Record
  [Tags]     REGRESSION  CustAdmin   CAD   NA
  ###############################################################################################################
  BuiltIn.Comment           QUERY ACTIVE CAD for Disconnect
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ##############################################################################################################
  BuiltIn.Comment          DISCONNECT ACTIVE CAD
  ###############################################################################################################
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${telco}                 Get Telco                      ${token}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/disconnect
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
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
  ${keyword}=     set variable       Parse Customer Record Disconnect
  Parse Return Code   ${resp}        ${keyword}
  Add to Transaction Total   ${reservedTFN};${CAD_EffDT}  ${resporgId}  ${HOST}
  ###############################################################################################################




 TC020 Query_SCP_Status_for_Template
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



 TC030 List_SCP_Exception_Reports_Control_before_Creation
   set test variable        ${Expected_Error}              No CCS Network data is found.
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prc/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse PRC List Response
   Parse Return Code   ${resp}        ${keyword}

 TC031 Create_SCP_Exception_Reports_Control_Record
   [Documentation]   This API allows the SMS/800 TFN Registry user to create
   ...               SCP Exception Reports destination addresses.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${scpId}=                set variable                    BR01
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prc
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${PRC_create_Data}''')       json
   set to dictionary        ${requestData}                          scpId=${scpId}
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse PRC Create Response
   Parse Return Code   ${resp}        ${keyword}

 TC032 List_SCP_Exception_Reports_Control_after_Creation
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prc/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse PRC List Response
   Parse Return Code   ${resp}        ${keyword}

 TC033 Update_SCP_Exception_Reports_Control_Record
   [Documentation]   This API allows the SMS/800 TFN Registry user to update
   ...               Network Exception Reports destination addresses.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${scpId}=                set variable                    BR01
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prc
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${PRC_create_Data}''')       json
   set to dictionary        ${requestData}                          scpId=${scpId}
   set to dictionary        ${requestData}                          recVersionId=${PRC_recVersionId}
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse PRC Create Response
   Parse Return Code   ${resp}        ${keyword}

 TC034 Retrieve_SCP_Exception_Reports_Control_Record_using_ScpId
   [Documentation]   This API allows the SMS/800 TFN Registry user to retrieve a NRC record.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${scpId}=                set variable                    BR01
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prc/scpId/${scpId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        get Request        endpoint       ${GET_ACTION_URI}     headers=${headers}
   ${keyword}=     set variable       Parse PRC create Response
   Parse Return Code   ${resp}        ${keyword}

 TC035 Delete_SCP_Exception_Reports_Control_Record
   [Documentation]   This API allows the SMS/800 TFN Registry user to delete a NRC record.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${scpId}=                set variable                    BR01
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prc/scpId/${scpId}/recVersionId/${PRC_recVersionId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Delete Request        endpoint       ${GET_ACTION_URI}     headers=${headers}
   ${keyword}=     set variable       Parse PRC Delete Response
   Parse Return Code   ${resp}        ${keyword}


 TC040 List_SCP_Exception_Reports_Limits
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prl/lst
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse PRL List Response
   Parse Return Code   ${resp}        ${keyword}

 TC041 Retrieve_SCP_Exception_Reports_Limits_for_netWrkId
   #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
   ${token}=                get token
                             # BR
   ${netWrkId}=             set variable                   ${netWrkIdList[0]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prl/netWrkId/${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse PRL Response
   Parse Return Code   ${resp}        ${keyword}


 TC050 Retrieve_Mass_Calling_Thresholds_for_netWrkId
   ${token}=                get token
   ${netWrkId}=             set variable                   ${netWrkIdList[0]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/mas?netWrkId=${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   set test variable        ${Expected_Error}               Record does not exist.
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse MAS Record
   Parse Return Code   ${resp}        ${keyword}

 TC051 Retrieve_Record_Call_Completion_Collection_using_netWrkId
   ${token}=                get token
   ${netWrkId}=             set variable                   ${netWrkIdList[0]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ccc?netWrkId=${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CCC Record
   Parse Return Code   ${resp}        ${keyword}
   Log                 ${recVersionId_CCC}
   Sleep  20 seconds

 TC052 Update_Call_Completion_Collection_Record_for_scpId_to_ON
   [Documentation]   This API allows the SMS/800 TFN Registry user to update
   ...               Call Completion Collection Data.
   ##################################################################################
   ${token}=                get token
   ${netWrkId}=             set variable                   ${netWrkIdList[0]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ccc?netWrkId=${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CCC Record
   Parse Return Code   ${resp}        ${keyword}
   Log                 ${recVersionId_CCC}
   ##################################################################################
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${critInd}=              set Variable                   Y
   ${scpId}=                set variable                   BR01
   ${cccStatus}=            set variable                   ON
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ccc
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${CCC_updt_Data}''')       json
   set to dictionary        ${requestData}                          critInd=${critInd}
   set to dictionary        ${requestData["cccList"][0]}            scpId=${scpId}
   set to dictionary        ${requestData["cccList"][0]}            cccStatus=${cccStatus}
   set to dictionary        ${requestData["cccList"][0]}            recVersionId=${recVersionId_CCC}
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse CCC Updt Response
   Parse Return Code   ${resp}        ${keyword}

 TC053 Retrieve_Record_Call_Completion_Collection_using_netWrkId_after_Update_to_ON
   ${token}=                get token
   ${netWrkId}=             set variable                   ${netWrkIdList[0]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ccc?netWrkId=${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CCC Record
   Parse Return Code   ${resp}        ${keyword}
   Should be equal     ${cccStatus}    ON
   Log                 ${recVersionId_CCC}
   Sleep  20 seconds

 TC054 Update_Call_Completion_Collection_Record_for_scpId_to_OFF
   ##################################################################################
   ${token}=                get token
   ${netWrkId}=             set variable                   ${netWrkIdList[0]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ccc?netWrkId=${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CCC Record
   Parse Return Code   ${resp}        ${keyword}
   Log                 ${recVersionId_CCC}
   ##################################################################################
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${critInd}=              set Variable                   Y
   ${scpId}=                set variable                   BR01
   ${cccStatus}=            set variable                   OFF
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ccc
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${CCC_updt_Data}''')       json
   set to dictionary        ${requestData}                          critInd=${critInd}
   set to dictionary        ${requestData["cccList"][0]}            scpId=${scpId}
   set to dictionary        ${requestData["cccList"][0]}            cccStatus=${cccStatus}
   set to dictionary        ${requestData["cccList"][0]}            recVersionId=${recVersionId_CCC}
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse CCC Updt Response
   Parse Return Code   ${resp}        ${keyword}

 TC055 Retrieve_Record_Call_Completion_Collection_using_netWrkId_after_Update_to_OFF
   ${token}=                get token
   ${netWrkId}=             set variable                   ${netWrkIdList[0]}
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ccc?netWrkId=${netWrkId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse CCC Record
   Parse Return Code   ${resp}        ${keyword}
   Should be equal     ${cccStatus}    OFF


 TC060 List_SCPIDs_of_SID
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpIdList
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse Scpid List
   Parse Return Code   ${resp}        ${keyword}
   Log                 ${scpId}

 TC061 Retrieve_SCPID_of_SID_using_scpId
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpId/${scpId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse SID Record
   Parse Return Code   ${resp}        ${keyword}

 TC062 Create_SCP_ID_Definition_Record_for_BR02
   [Documentation]   This API allows the SMS/800 TFN Registry user to create
   ...               SCP ID Definition (SID).
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${scpId}=                set variable                   BR02
   ${scpNodeId}=            set variable                   SNMNCAXPA09
   ${tmplSupprtd}=          set variable                   Y
   ${mateScpId}=            set variable                   BR01
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${SID_create_Data}''')       json
   set to dictionary        ${requestData}                          scpId=${scpId}
   set to dictionary        ${requestData}                          scpNodeId=${scpNodeId}
   set to dictionary        ${requestData}                          tmplSupprtd=${tmplSupprtd}
   set to dictionary        ${requestData}                          mateScpId=${mateScpId}
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   set test variable        ${Expected_Error}      Node ID is not known to TFN Registry.
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}         Record already exists.
   ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse SID Response
   Parse Return Code   ${resp}        ${keyword}

 TC063 List_SCPIDs_of_SID_after_addition_of_BR02
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpIdList
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse Scpid List
   Parse Return Code   ${resp}        ${keyword}
   ${x}=                get Length      ${scpIdList}
   should be equal as strings           ${x}            2

 TC064 Retrieve_SCPID_of_SID_using_scpId_for_BR02
   ${token}=                get token
   ${scpId}=                set variable                   BR02
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpId/${scpId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   set test variable        ${Expected_Error}      Record does not exist.
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse SID Record
   Parse Return Code   ${resp}        ${keyword}
   should be equal      ${tmplSupprtd}       Y

 TC065 Update_SCP_ID_Definition_Record_for_BR02
   [Documentation]   This API allows the SMS/800 TFN Registry user to update
   ...               SCP ID Definition (SID).
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${scpId}=                set variable                   BR02
   ${scpNodeId}=            set variable                   SNMNCAXPA06
   ${tmplSupprtd}=          set variable                   N
   ${mateScpId}=            set variable                   BR01
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${SID_create_Data}''')       json
   set to dictionary        ${requestData}                          scpId=${scpId}
   set to dictionary        ${requestData}                          scpNodeId=${scpNodeId}
   set to dictionary        ${requestData}                          tmplSupprtd=${tmplSupprtd}
   set to dictionary        ${requestData}                          mateScpId=${mateScpId}
   set to dictionary        ${requestData}                          recVersionId=${recVersionId_SID}
   remove from dictionary   ${requestData}                          scpNodeId
   remove from dictionary   ${requestData}                          mateScpId
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   set test variable        ${Expected_Error}      Record does not exist.
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}         Record already exists.
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse SID Response
   Parse Return Code   ${resp}        ${keyword}

 TC066 Retrieve_SCPID_of_SID_using_scpId_for_BR02_after_Update
   ${token}=                get token
   ${scpId}=                set variable                   BR02
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpId/${scpId}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   set test variable        ${Expected_Error}      Record does not exist.
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse SID Record
   Parse Return Code   ${resp}        ${keyword}
   should be equal      ${tmplSupprtd}       N

 TC067 Delete_SCP_ID_Definition_Record_for_BR02_with_Success
   #set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.
   ${token}=                get token
   ${scpId}=                set variable                   BR02
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpId/${scpId}/recVersionId/${recVersionId_SID}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   set test variable        ${Expected_Error}      Record does not exist.
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Delete Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NLA Delete Response
   Parse Return Code   ${resp}        ${keyword}

 TC068 List_SCPIDs_of_SID_after_deletion_of_BR02
   ${token}=                get token
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpIdList
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse Scpid List
   Parse Return Code   ${resp}        ${keyword}
   Log                 ${scpId}
   ${x}=                get Length      ${scpIdList}
   should be equal as strings           ${x}            2

 TC069 Create_SSP_ID_Definition_Record_for_BR_PointCode_error
   [Documentation]   This API allows the SMS/800 TFN Registry user to create
   ...               SSP ID Definition.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${netId}=                set variable                   BR
   ${sspNodeId}=            set variable                   SNMNCAXPA06
   ${pointCode}=            set variable                   012345678
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ssp
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${SSP_create_Data}''')       json
   set to dictionary        ${requestData}                          netWrkId=${netId}
   set to dictionary        ${requestData["sspList"][0]}              sspNodeId=${sspNodeId}
   set to dictionary        ${requestData["sspList"][0]}              pointCode=${pointCode}
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   set Test variable        ${Expected_Error}          012345678: Invalid value for Point Code. Enter first 3 digits in the range of 005-254, the next 3 digits in the range of 001-255, and the last 3 digits in the range of 001-255.
   ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse SSP Response
   Parse Return Code   ${resp}        ${keyword}
   #Log                 ${recVersionId_new_SSP}

 TC070 Create_SSP_ID_Definition_Record_for_BR
   [Documentation]   This API allows the SMS/800 TFN Registry user to create
   ...               SSP ID Definition.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${netId}=                set variable                   BR
   ${sspNodeId}=            set variable                   SNMNCAXPA06
   ${pointCode}=            set variable                   005001212
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ssp
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${SSP_create_Data}''')       json
   set to dictionary        ${requestData}                          netWrkId=${netId}
   set to dictionary        ${requestData["sspList"][0]}              sspNodeId=${sspNodeId}
   set to dictionary        ${requestData["sspList"][0]}              pointCode=${pointCode}
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   set Test variable        ${Expected_Error}          012345678: Invalid value for Point Code. Enter first 3 digits in the range of 005-254, the next 3 digits in the range of 001-255, and the last 3 digits in the range of 001-255.
   ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse SSP Response
   Parse Return Code   ${resp}        ${keyword}
   Log                 ${recVersionId_new_SSP}

 TC071 Update_SSP_ID_Definition_Record_for_BR
   [Documentation]   This API allows the SMS/800 TFN Registry user to update
   ...               SSP ID Definition.
   ${token}=                get token
   ${oauthToken}=           set variable                    ${token}
   ${netId}=                set variable                   BR
   ${sspNodeId}=            set variable                   SNMNCAXPA06
   ${pointCode}=            set variable                   005001001
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ssp
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${SSP_update_Data}''')       json
   set to dictionary        ${requestData}                          netWrkId=${netId}
   set to dictionary        ${requestData["sspList"][0]}              sspNodeId=${sspNodeId}
   set to dictionary        ${requestData["sspList"][0]}              pointCode=${pointCode}
   set to dictionary        ${requestData}                          recVersionId=${recVersionId_new_SSP}
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
   set Test variable        ${Expected_Error}          012345678: Invalid value for Point Code. Enter first 3 digits in the range of 005-254, the next 3 digits in the range of 001-255, and the last 3 digits in the range of 001-255.
   ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse SSP Response
   Parse Return Code   ${resp}        ${keyword}
     #Log                 ${recVersionId_new_SSP}

 TC072 Delete_SSP_ID_Definition_Record_for_BR
   #set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.
   ${token}=                get token
   ${netId}=                set variable                   BR
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ssp/netWrkId/${netId}/recVersionId/${recVersionId_new_SSP}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Delete Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse NLA Delete Response
   Parse Return Code   ${resp}        ${keyword}

 TC073 Retrieve_Threshold_Level_Class_Assignments_for_a_Toll_Free_Number
   set test variable        ${Expected_Error}               Permission Denied.
   ${token}=                get token
   ${tfNum}=                set variable                   8339580272
   #set test variable        ${num_Type}                    DIAL
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/tlc/tfNum/${tfNum}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse MAC Record
   Parse Return Code   ${resp}        ${keyword}


 TC074 List_SID_netWkIdList
   set test variable        ${Expected_Error}               Permission Denied.
   ${token}=                get token
   ${tfNum}=                set variable                   8339580272
   ${netId}=                set variable                   BR
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/netWrkIdList
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse SID netList
   Parse Return Code   ${resp}        ${keyword}


 TC075 Retrieve_SID_using_netWkId
   set test variable        ${Expected_Error}               Permission Denied.
   ${token}=                get token
   ${tfNum}=                set variable                   8339580272
   ${netId}=                set variable                   BR
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/netWrkId/${netWrkIdList[0]}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse SID Record
   Parse Return Code   ${resp}        ${keyword}


 TC076 Retrieve_SCP_NPA-NXX_List_producing_Error
   set test variable        ${Expected_Error}               NPA 822: Must be an existing 3-digit 8xx Toll-Free NPA code known to the TFN Registry (e.g., 800).

   ${token}=                get token
   ${scpId}=                set variable                   BR01
   ${npa}=                  set variable                   822
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nxx/scpId/${scpId}/npa/${npa}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   set Test Variable            ${SCPNPANXX_List}          True
   ${keyword}=     set variable       Parse SCPNXX List
   Parse Return Code   ${resp}        ${keyword}

 TC077 Create_SCP_NPA-NXX_List_producing_Error
   #set test variable        ${Expected_Error}               Record does not exist.
   #set test variable        ${Expected_Error}               Record already exists.
   set test variable        ${Expected_Error}               NPA 822: Must be an existing 3-digit 8xx Toll-Free NPA code known to the TFN Registry (e.g., 800).


   ${token}=                get token
   ${Date}=                 get current date
   ${effDt}=                Future Effective Date      ${Date}      1
   ${scpId}=                set variable                   BR01
   ${npa}=                  set variable                   822
   ${startNXX}=             set variable                   000
   ${endNXX}=               set variable                   005
   ${treatment}=            set variable                   B
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nxx
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   ${requestData}=          evaluate               json.loads('''${NPA-NXX_create_Data}''')       json
   set to dictionary        ${requestData}                          scpId=${scpId}
   set to dictionary        ${requestData}                          npa=${npa}
   set to dictionary        ${requestData}                          effDt=${effDt}
   set to dictionary        ${requestData["treatments"][0]}            startNXX=${startNXX}
   set to dictionary        ${requestData["treatments"][0]}            endNXX=${endNXX}
   set to dictionary        ${requestData["treatments"][0]}            treatment=${treatment}
   ${reqBody}=              evaluate               json.dumps(${requestData})    json
   log                      ${reqBody}
   Create Session           endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
   ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
   ${keyword}=     set variable       Parse SCPNXX Response
   Parse Return Code   ${resp}        ${keyword}


 TC078 Retrieve_SCP_NPA-NXX_List_for_822npa
   #set test variable        ${Expected_Error}               Record does not exist.
   set test variable        ${Expected_Error}               NPA 822: Must be an existing 3-digit 8xx Toll-Free NPA code known to the TFN Registry (e.g., 800).

   ${token}=                get token
   ${scpId}=                set variable                   BR01
   ${npa}=                  set variable                   822
   ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nxx/scpId/${scpId}/npa/${npa}
   ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   set Test Variable            ${SCPNPANXX_List}          True
   ${keyword}=     set variable       Parse SCPNXX List
   Parse Return Code   ${resp}        ${keyword}
   Sleep  20 seconds

 TC079 Delete_SCP_NPA-NXX_List_for_822npa
   set test variable        ${Expected_Error}               NPA 822: Must be an existing 3-digit 8xx Toll-Free NPA code known to the TFN Registry (e.g., 800).
    ${token}=                get token
    ${scpId}=                set variable                   BR01
    ${npa}=                  set variable                   822
    ${Date}=                 get current date
    ${effDt+}=               Future Effective Date       ${Date}      1
    ${effDT}=                Remove string               ${effDt+}    -
    ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nxx/scpId/${scpId}/npa/${npa}?effDt=${effDt}
    ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
    Create Session           endpoint                       ${HOST}
    ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
    ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
    set Test Variable            ${SCPNPANXX_List}          True
    ${keyword}=     set variable       Parse SCPNXX List
    Parse Return Code   ${resp}        ${keyword}
    ##################################################################################################################
    ##################################################################################################################
    ${token}=                get token
    ${scpId}=                set variable                   BR01
    ${npa}=                  set variable                   822
    ${effDT}=                Remove string              ${effDt_of_Pend}    -
    set test variable       ${CR_v3_UCI}               /v3/ip/scp/nxx/scpId/${scpId}/npa/${npa}/effDt/${effDt}/recVersionId/${recVersionId_SCPNXX}
    ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
    Create Session           endpoint                       ${HOST}
    ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
    ${resp}=        Delete Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
    ${keyword}=     set variable          Parse Delete SCPNXX List
    Parse Return Code   ${resp}           ${keyword}

TC080 Create_SCP_NPA-NXX_List_for_811npa
    set test variable        ${Expected_Error}               Record does not exist.
    set test variable        ${Expected_Error}               Record already exists.
    ${token}=                get token
    ${Date}=                 get current date
    ${effDt}=                Future Effective Date      ${Date}      2
    ${scpId}=                set variable                   BR01
    ${npa}=                  set variable                   811
    ${startNXX}=             set variable                   000
    ${endNXX}=               set variable                   009
    ${treatment}=            set variable                   B
    ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nxx
    ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
    ${requestData}=          evaluate               json.loads('''${NPA-NXX_create_Data}''')       json
    set to dictionary        ${requestData}                          scpId=${scpId}
    set to dictionary        ${requestData}                          npa=${npa}
    set to dictionary        ${requestData}                          effDt=${effDt}
    set to dictionary        ${requestData["treatments"][0]}            startNXX=${startNXX}
    set to dictionary        ${requestData["treatments"][0]}            endNXX=${endNXX}
    set to dictionary        ${requestData["treatments"][0]}            treatment=${treatment}
    ${reqBody}=              evaluate               json.dumps(${requestData})    json
    log                      ${reqBody}
    Create Session           endpoint               ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
    set Test variable        ${Expected_Error}     NPA 811: Must be an existing 3-digit 8xx Toll-Free NPA code known to the TFN Registry (e.g., 800).
    ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
    ${keyword}=     set variable       Parse SCPNXX Response
    Parse Return Code   ${resp}        ${keyword}
    Sleep  20 seconds

TC081 Update_SCP_NPA-NXX_List_for_811npa
    pass execution         No recVersionId
    set test variable        ${Expected_Error}               Record does not exist.
    ${token}=                get token
    ${Date}=                 get current date
    ${effDt}=                Future Effective Date      ${Date}      3
    ${scpId}=                set variable                   BR01
    ${npa}=                  set variable                   811
    ${startNXX}=             set variable                   010
    ${endNXX}=               set variable                   019
    ${treatment}=            set variable                   D
    ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nxx
    ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
    ${requestData}=          evaluate               json.loads('''${NPA-NXX_create_Data}''')       json
    set to dictionary        ${requestData}                          scpId=${scpId}
    set to dictionary        ${requestData}                          npa=${npa}
    set to dictionary        ${requestData}                          effDt=${effDt}
    set to dictionary        ${requestData}                          recVersionId=${recVersionId_SCPNXX}
    set to dictionary        ${requestData["treatments"][0]}            startNXX=${startNXX}
    set to dictionary        ${requestData["treatments"][0]}            endNXX=${endNXX}
    set to dictionary        ${requestData["treatments"][0]}            treatment=${treatment}
    ${reqBody}=              evaluate               json.dumps(${requestData})    json
    log                      ${reqBody}
    Create Session           endpoint               ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
    #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
    ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
    ${keyword}=     set variable       Parse SCPNXX Response
    Parse Return Code   ${resp}        ${keyword}


TC082 Retrieve_SCP_NPA-NXX_List_for_811npa
    #set test variable        ${Expected_Error}               Record does not exist.
    ${token}=                get token
    ${scpId}=                set variable                   BR01
    ${npa}=                  set variable                   811
    ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nxx/scpId/${scpId}/npa/${npa}
    ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
    Create Session           endpoint                       ${HOST}
    set Test variable        ${Expected_Error}     NPA 811: Must be an existing 3-digit 8xx Toll-Free NPA code known to the TFN Registry (e.g., 800).
    ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
    ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
    set Test Variable            ${SCPNPANXX_List}          True
    ${keyword}=     set variable       Parse SCPNXX List
    Parse Return Code   ${resp}        ${keyword}





Close_session_with_Resp_Org

    Close Session

*** Keywords ***

Spare Reserved TFN
  [Arguments]       ${token}  ${reservedTFN}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSC AC=S
  ###############################################################################################################
  ${requestDesc}=         Set Variable            BRMGIU1BRSACEDSXXXEDS01OTFN798329BRSACNSC
  ${GET_ACTION_URI}=      Set Variable            /v3/ip/num/tfn/update
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData}                             requestDesc=${requestDesc}
  set to dictionary        ${requestData["tfNumList"][0]}             recVersionId=${Query_recVersionId}
  set to dictionary        ${requestData["tfNumList"][0]}             num=${reservedTFN}
  set to dictionary        ${requestData}                             status=SPARE
  #set to dictionary        ${requestData}                             resUntilDt=${new_Date}
  remove from dictionary   ${requestData}                             conPhone
  remove from dictionary   ${requestData}                             conName
  remove from dictionary   ${requestData}                             resUntilDt
  remove from dictionary   ${requestData}                             email
  remove from dictionary   ${requestData}                             ctrlRespOrgId
  #remove from dictionary   ${requestData}                             requestDesc
  remove from dictionary   ${requestData}                             asyncId
  remove from dictionary   ${requestData}                             shrtNotes
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Number Update Response
  Parse Return Code   ${resp}        ${keyword}
