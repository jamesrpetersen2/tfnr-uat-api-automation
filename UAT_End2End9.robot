*** Settings ***
Documentation   This Suite Consists of API
...             Developer Resources Documentation (SCP Administration) - Test Cases
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
${sand_Template}                            *LGBR-H3TEST
${status_code}                              200
${RESERVED}                                 RESERVED
${numDesc}                                  Invalid Number Included
${email}                                    JRPETERS2@HOTMAIL.COM
${cicCode}
${acna}
#${API_User_Credentials_for_Sand}              {"usrName": "${SAND_USER}","password": "${SAND_User_PASSWORD}","withPerm": true}
${ReqData}                                    {"conName":"PETERSEN","conTel":"${UserProfileCreate_PhoneNum}"}
${Create_CAD_Data}                            {"num": "string","effDtTm": "string","cmd": "U","newRespOrgId": "string","hldIndFlag": "N","priority": "H","svcOrderNum": "ABC098","suppFormNum": "SO76","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "PETERSEN","conTel": "string","notes": "NOTES","aos": {"aosNet": ["YK"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 99}]}
${Update_CAD_Data}                            {"num": "string","effDtTm": "string","cmd": "U","reqSntFrom": "CAD","custRecStat": "PENDING","hldIndFlag": "N","priority": "N","svcOrderNum": "string","suppFormNum": "string","onAccCust": "strin","agent": "strin","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","aos": {aosNet": ["US"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 1}],"custRecCompPart": "CAD","endInterceptDt": "string","recVersionId": "string","asyncId": "string"}
${Lock_CAD_Data}                              {"srcNum": "string","srcEffDtTm": "string","tgtNum": "string","tgtTmplName": "string","tgtEffDtTm": "string","custRecCompPart": "CAD","custRecAction": "COPY","overWriteTGT": "Y","asyncId": "string"}
${unLock_CAD_Data}                            {"num": "string","effDtTm": "string","asyncId": "string"}
${Copy_CAD_Data}                              {"tgtNum": "string","tgtEffDtTm": "string","tgtTmplName": "string","srcNum": "string","srcEffDtTm": "string","tmplDesc": "string","ctrlRespOrgId": "string","cmd": "U","hldIndFlag": "Y","priority": "Y","svcOrderNum": "string","suppFormNum": "string","onAccCust": "strin","agent": "strin","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["strin"],"aosNet": ["string"],"aosState": ["string"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"numTermLine": 1,"cprSectName": [{"name": "string","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"priInterLT": "string","priIntraLT": "string","tmZn": "A","lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"dayLightSavings": "Y","custRecCompPart": "CAD","srcRecVersionId": "string","tgtRecVersionId": "string","asyncId": "string","overWriteTGT": "Y"}
${Transfer_CAD_Data}                          {"tgtNum": "string","tgtEffDtTm": "string","tgtTmplName": "string","srcNum": "string","srcEffDtTm": "string","ctrlRespOrgId": "string","cmd": "U","tmplDesc": "string","hldIndFlag": "Y","priority": "Y","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["string"],"aosNet": ["string"],"aosState": ["string"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"cprSectName": [{"name": "string","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"priInterLT": "string","priIntraLT": "string","tmZn": "A","lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"dayLightSavings": "Y","custRecCompPart": "CAD","referral": "Y","endInterceptDt": "string","srcRecVersionId": "string","tgtRecVersionId": "string","overWriteTGT": "Y","asyncId": "string"}
${Disconnect_CAD_Data}                        {"srcNum": "string","tgtNum": "string","tgtEffDtTm": "string","tgtTmplName": "string","srcEffDtTm": "string","ctrlRespOrgId": "string","cmd": "U","tmplDesc": "string","hldIndFlag": "Y","priority": "Y","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["string"],"aosNet": ["string"],"aosState": ["string"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"cprSectName": [{"name": "string","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"dayLightSavings": "Y","priInterLT": "string","priIntraLT": "string","tmZn": "A","lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"custRecCompPart": "CAD","referral": "Y","endInterceptDt": "string","srcRecVersionId": "string","tgtRecVersionId": "string","asyncId": "string","overWriteTGT": "Y"}
${Create_PAD_Data}                             {"num": "string","effDtTm": "string","tmplName": "string","cmd": "U","newRespOrgId": "string","hldIndFlag": "N","priority": "N","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "POINTER RECORD","destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"asyncId": "string"}
${Lock_PAD_Data}                               {"srcNum": "string","srcEffDtTm": "string","tgtNum": "string","tgtEffDtTm": "string","ptrRecAction": "COPY","asyncId": "string"}
${unLock_PAD_Data}                             {"num": "string","effDtTm": "string","asyncId": "string"}
${Disconnect_PAD_Data}                         {"num": "string","srcEffDtTm": "string","tgtEffDtTm": "string","tmplName": "string","referral": "string","endInterceptDt": "string","cmd": "U","ctrlRespOrgId": "string","hldIndFlag": "N","priority": "N","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"custRecCompPart": "PAD","asyncId": "string","recVersionId": "string"}
${Update_TAL_Data}                             {"entity": "string","maxRtngTmpl": 0,"manualOverride": "ON","asyncId": "string","recVersionId": "string"}
${Create_TAD_Data}                             {"tmplName": "string","effDtTm": "string","tmplDesc": "string","cmd": "U","ctrlRespOrgId": "string","priority": "Y","conName": "string","conTel": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["string"],"aosNet": ["US"],"aosState": ["string"]},"interLATACarrier": ["0555"],"intraLATACarrier": ["0555"],"numTermLine": 1,"cprSectName": [{"name": "MAIN","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"priInterLT": "string","priIntraLT": "string","tmZn": "A","dayLightSavings": "Y","asyncId": "string"}
${Copy_TAD_Data}                               {"tgtTmplName": "string","tgtNum": "string","tgtEffDtTm": "string","srcTmplName": "string","srcEffDtTm": "string","cmd": "U","tmplRecCompPart": "TAD","overWriteTGT": "Y","ctrlRespOrgId": "string","tmplDesc": "COPIED","priority": "Y","conName": "string","conTel": "string","notes": "string","hldIndFlag": "Y","svcOrderNum": "string","suppFormNum": "string","telco": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["string"],"aosNet": ["string"],"aosState": ["string"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"numTermLine": 1,"destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"cprSectName": [{"name": "string","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"priInterLT": "string","priIntraLT": "string","tmZn": "A","lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"dayLightSavings": "Y","asyncId": "string","srcRecVersionId": "string","tgtRecVersionId": "string"}
${MND_Data}                                    {"numList": ["string"],"startEffDtTm": "string","endInterceptDt": "string","referral": "Y","notes": "DISCONNECT CAD AND PAD","asyncId": "string","requestDesc": "DISC_CAD_PAD","email": "JRPETERS2@HOTMAIL.COM"}
${rand_reserve_Data}                           {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","conName": "string","conTel": "string","shrtNotes": "string","asyncId": "string"}
${Cad_to_Pad_Data}                             {"numList": ["string"],"tmplName": "string","srcEffDtTm": "string","tgtEffDtTm": "string","requestDesc": "string","email": "user@example.com","recVersionId": "string","ctrlRespOrgId": "string","hldIndFlag": "Y","priority": "Y","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"asyncId": "string","referral": "string","endInterceptDt": "string"}
${Pad_to_Cad_Data}                             {"tfNum": "string","srcEffDtTm": "string","tgtEffDtTm": "string","ctrlRespOrgId": "string","hldIndFlag": "Y","priority": "Y","svcOrderNum": "string","suppFormNum": "string","onAccCust": "strin","agent": "strin","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["strin"],"aosNet": ["YK"],"aosState": ["string"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"cprSectName": [{"name": "string","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"priInterLT": "string","priIntraLT": "string","tmZn": "A","lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"dayLightSavings": "Y","asyncId": "string","recVersionId": "string","referral": "string","endInterceptDt": "string"}
${Disconnect_Template_Data}                    {"srcTmplName": "string","tgtTmplName": "string","tgtNum": "string","srcEffDtTm": "string","tgtEffDtTm": "string","tmplRecCompPart": "TAD","overWriteTGT": "Y","tmplDesc": "string","cmd": "U","ctrlRespOrgId": "string","conName": "string","conTel": "string","notes": "string","hldIndFlag": "Y","svcOrderNum": "string","suppFormNum": "string","telco": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["strin"],"aosNet": ["string"],"aosState": ["string"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"numTermLine": 1,"cprSectName": [{"name": "string","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"dayLightSavings": "Y","priInterLT": "string","priIntraLT": "string","tmZn": "A","lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"asyncId": "string","srcRecVersionId": "string","tgtRecVersionId": "string"}
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



*** Test Cases ***
OpenSession_Login_with_Resp_Org
   Log                                  ${HOST}
   Log                                  ${API_Admin_User_Credentials_for_UAT_AWS}
   ${SESSION_OPEN_V3}=      Set Variable           /v3/ip/sec/session/open
   Set Global Variable                  ${SESSION_OPEN_V3}
   Set Global Variable                  ${HOST}
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



SCP_Administration_Tests
  [Documentation]  Accept-Version = ${Accept-Version}
  ###############################################################################################################
  BuiltIn.Comment                NETWORK & SCP ADMINISTRATION
  ###############################################################################################################
List_CCS_Network_Information
  [Documentation]   Allows the SMS800 TFNRegistry user to get the list of entities to be used in CCS Network Information.
  [Tags]     REGRESSION  SCP   Network list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/net/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse SCP Network List
  Parse Return Code   ${resp}        ${keyword}

Retrieve_CCS_Network_Information_for_One_Specific_Network_ID
  [Documentation]    Get network information for Network ID=YK
  [Tags]     REGRESSION  SCP   Network retrieve
  ${netWrkId}=             set variable                   YK
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/net/netWrkId/${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse SCP Network View
  Parse Return Code   ${resp}        ${keyword}

Retrieve_CCS_Network_Information_for_Each_Specific_Network_ID
  [Documentation]    Get network information for each Network ID in the network List
  [Tags]     REGRESSION  SCP   Network retrieve
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

List_NLA_Record_with_Error_1
  [Tags]     REGRESSION  SCP   NLA list
  set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Response
  Parse Return Code   ${resp}        ${keyword}

Create_NLA_Record_for_AB_with_Error
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...       Network Provider-SCP Owner/Operator IntraLATA Agreements record for the Network.
  [Tags]     REGRESSION  SCP   NLA create
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

Create_NLA_Record_for_BR_with_Success
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...       Network Provider-SCP Owner/Operator IntraLATA Agreements record for the Network.
  [Tags]     REGRESSION  SCP   NLA create
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
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse NLA Success Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_NLA_Record_for_BR_after_Creation
  [Tags]     REGRESSION  SCP   NLA retrieve
  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla/netWrkId/${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Record
  Parse Return Code   ${resp}        ${keyword}

Update_NLA_Record_for_BR_with_Success
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...       Network Provider-SCP Owner/Operator IntraLATA Agreements record for the Network.
  [Tags]     REGRESSION  SCP   NLA update
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

Retrieve_NLA_Record_for_BR_after_Update
  [Tags]     REGRESSION  SCP   NLA retrieve
  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla/netWrkId/${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Record
  Parse Return Code   ${resp}        ${keyword}

List_NLA_Record_for_BR_with_Success
  [Tags]     REGRESSION  SCP   NLA list
  set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Response
  Parse Return Code   ${resp}        ${keyword}

Delete_NLA_Record_for_BR_with_Success
  [Tags]     REGRESSION  SCP   NLA delete
  set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.
  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${recVersionId}=         set variable                    ${recVersionId_NLA}
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla/netWrkId/${netWrkId}/recVersionId/${recVersionId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Delete Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Delete Response
  Parse Return Code   ${resp}        ${keyword}

List_NLA_Record_with_Error_2
  [Tags]     REGRESSION  SCP   NLA list
  set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nla/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Response
  Parse Return Code   ${resp}        ${keyword}

List_NLE_Record_with_Error_1
  [Tags]     REGRESSION  SCP   NLA list
  set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nle/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLE Response
  Parse Return Code   ${resp}        ${keyword}

Reserve_a_Random_Number_to_use_for_NLE
  ${token}=                  Get Token
  ${NewTFN}=                 Get Reserve Random Number    ${token}     ${ReqBody_Reservetfn}
  set Suite Variable         ${NewTFN}

Create_NLE_Record_for_BR_with_Success
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...       Network Provider-SCP Owner/Operator IntraLATA Exceptions record for the Network.
  [Tags]     REGRESSION  SCP   NLE create
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${netWrkId}=             set variable                    BR
  ${conName}=              set variable                    JIM PETERSEN
  ${conPhone}=             set variable                    9082320442
  ${potsNumList}=          Create List                     9089565118
  ${conEmail}=             set variable                    JRPETERS2@HOTMAIL.COM
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nle
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${NLA_Data}''')       json
  set to dictionary        ${requestData}                          netWrkId=${netWrkId}
  set to dictionary        ${requestData}                          conName=${conName}
  set to dictionary        ${requestData}                          conPhone=${conPhone}
  set to dictionary        ${requestData}                          conEmail=${conEmail}
  set to dictionary        ${requestData}                          potsNumList=${potsNumList}
  remove from dictionary   ${requestData}                          respOrgList
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse NLA Success Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_NLE_Record_for_BR_after_Creation
  [Tags]     REGRESSION  SCP   NLE retrieve
  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nle/netWrkId/${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLE Record
  Parse Return Code   ${resp}        ${keyword}

Update_NLE_Record_for_BR_with_Success
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...       Network Provider-SCP Owner/Operator IntraLATA Exceptions record for the Network.
  [Tags]     REGRESSION  SCP   NLE update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${netWrkId}=             set variable                    BR
  ${conName}=              set variable                    JIM PETERSEN
  ${conPhone}=             set variable                    9082320442
  ${potsNumList}=          Create List                     9089565229
  ${conEmail}=             set variable                    JRPETERS2@HOTMAIL.COM
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nle
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${NLA_Data}''')       json
  set to dictionary        ${requestData}                          netWrkId=${netWrkId}
  set to dictionary        ${requestData}                          conName=${conName}
  set to dictionary        ${requestData}                          conPhone=${conPhone}
  set to dictionary        ${requestData}                          conEmail=${conEmail}
  set to dictionary        ${requestData}                          potsNumList=${potsNumList}
  set to dictionary        ${requestData}                          recVersionId=${recVersionId_NLA}
  remove from dictionary   ${requestData}                          respOrgList
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse NLA Success Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_NLE_Record_for_BR_after_Update
  [Tags]     REGRESSION  SCP   NLE retrieve
  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nle/netWrkId/${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLE Record
  Parse Return Code   ${resp}        ${keyword}

Delete_NLE_Record_for_BR_with_Success
  [Tags]     REGRESSION  SCP   NLE delete
  set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.
  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${recVersionId}=         set variable                    ${recVersionId_NLA}
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nle/netWrkId/${netWrkId}/recVersionId/${recVersionId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Delete Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Delete Response
  Parse Return Code   ${resp}        ${keyword}

List_NLE_Record_with_Error_2
  [Tags]     REGRESSION  SCP   NLE list
  set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nle/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLE Response
  Parse Return Code   ${resp}        ${keyword}

List_existing_NAC_Records
  [Tags]     REGRESSION  SCP   NAC list
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nac/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NAC Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_NAC_Record
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NAC retrieve
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nac/netWrkId/${netWrkIdList[0]}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NAC Record
  Parse Return Code   ${resp}        ${keyword}

Create_NCA_Record_for_BR_with_Success
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...       Network Provider-SCP Owner/Operator Carrier Agreement record for the Network.
  [Tags]     REGRESSION  SCP   NCA create
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${netWrkId}=             set variable                    BR
  ${conName}=              set variable                    JIM PETERSEN
  ${conPhone}=             set variable                    9082320442
  ${ocnList}=              Create List                     C120
  ${conEmail}=             set variable                    JRPETERS2@HOTMAIL.COM
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nca
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${NLA_Data}''')       json
  set to dictionary        ${requestData}                          netWrkId=${netWrkId}
  set to dictionary        ${requestData}                          conName=${conName}
  set to dictionary        ${requestData}                          conPhone=${conPhone}
  set to dictionary        ${requestData}                          conEmail=${conEmail}
  set to dictionary        ${requestData}                          ocnList=${ocnList}
  remove from dictionary   ${requestData}                          respOrgList
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}        headers=${headers}
  ${keyword}=     set variable       Parse NCA Success Response
  Parse Return Code   ${resp}        ${keyword}

Update_NCA_Record_for_BR_with_Success
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...       Network Provider-SCP Owner/Operator Carrier Agreement record for the Network.
  [Tags]     REGRESSION  SCP   NCA update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${netWrkId}=             set variable                    BR
  ${conName}=              set variable                    JAMES PETERSEN
  ${conPhone}=             set variable                    9082325999
  ${ocnList}=              Create List                     C120
  ${conEmail}=             set variable                    JRPETERS2@HOTMAIL.COM
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nca
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${NLA_Data}''')       json
  set to dictionary        ${requestData}                          netWrkId=${netWrkId}
  set to dictionary        ${requestData}                          conName=${conName}
  set to dictionary        ${requestData}                          conPhone=${conPhone}
  set to dictionary        ${requestData}                          conEmail=${conEmail}
  #set to dictionary        ${requestData}                          ocnList=${ocnList}
  set to dictionary        ${requestData}                          recVersionId=${recVersionId_NCA}
  remove from dictionary   ${requestData}                          respOrgList
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse NCA Success Response
  Parse Return Code   ${resp}        ${keyword}

List_existing_NCA_Records
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NcA list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nca/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NCA Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_NCA_Record
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NCA retrieve
  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nca/netWrkId/${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NCA Record
  Parse Return Code   ${resp}        ${keyword}

Delete_NCA_Record_for_BR_with_Success
  [Tags]     REGRESSION  SCP   NCA retrieve

  set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.

  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${recVersionId}=         set variable                    ${recVersionId_NCA}
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nca/netWrkId/${netWrkId}/recVersionId/${recVersionId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Delete Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Delete Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Deleted_NCA_Record_with_Error
  [Tags]     REGRESSION  SCP   NCA retrieve
  set test variable        ${Expected_Error}              Record does not exist.
  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nca/netWrkId/${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NCA Record
  Parse Return Code   ${resp}        ${keyword}

List_existing_NCC_Records
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NCC list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncc/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NCA Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_NCC_Record
  [Tags]     REGRESSION  SCP   NCC retrieve
  set test variable        ${Expected_Error}              Record does not exist.
  ${token}=                get token
  ${netWrkId}=             set variable                    BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncc/netWrkId/${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NCC Record
  Parse Return Code   ${resp}        ${keyword}

List_existing_NPA_to_CCS_Network_Mapping
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NCN list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncn/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NCN List Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_NPA_to_CCS_Network_Mapping_using_NPA
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NCN list
  ${token}=                get token
  ${NPA}=                  set variable                   908
  ${netWrkId}=             set variable                   VQ
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncn?potsnpa=${NPA}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  #${requestData}=          evaluate               json.loads('''${NCN_Data}''')       json
  #set to dictionary        ${requestData}                          netWrkId=${netWrkId}
  #set to dictionary        ${requestData}                          potsnpa=${NPA}
  #remove from dictionary   ${requestData}                          netWrkId
  #${reqBody}=              evaluate               json.dumps(${requestData})    json
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NCN Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_NPA_to_CCS_Network_Mapping_using_NetworkID
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NCN retrieve
  ${token}=                get token
  ${NPA}=                  set variable                   908
  ${netWrkId}=             set variable                   VQ
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncn?netWrkId=${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NCN Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_NPA_to_CCS_Network_Mapping_using_NetworkID_and_NPA
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NCN retrieve
  ${token}=                get token
  ${NPA}=                  set variable                   908
  ${netWrkId}=             set variable                   VQ
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ncn?potsnpa=${NPA}&netWrkId=${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NCN Response
  Parse Return Code   ${resp}        ${keyword}

List_existing_LATA_to_CCS_Network_Mapping
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   LCN list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/lcn/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse LCN List Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_LATA_to_CCS_Network_Mapping_wo_query_param
  set test variable        ${Expected_Error}              At-least one of the parameters need to be specified: lata or netWrkId.
  [Tags]     REGRESSION  SCP   LCN retrieve
  ${token}=                get token
  ${LATA}=                 set variable                   240
  ${netWrkId}=             set variable                   VQ
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/lcn
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse LCN Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_LATA_to_CCS_Network_Mapping_using_LATA
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   LCN retrieve
  ${token}=                get token
  ${LATA}=                 set variable                   240
  ${netWrkId}=             set variable                   VQ
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/lcn?lata=${LATA}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse LCN Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_LATA_to_CCS_Network_Mapping_using_NetworkID
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   LCN retrieve
  ${token}=                get token
  ${LATA}=                  set variable                  240
  ${netWrkId}=             set variable                   VQ
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/lcn?netWrkId=${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse LCN Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_existing_LATA_to_CCS_Network_Mapping_using_NetworkID_and_LATA
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   LCN retrieve
  ${token}=                get token
  ${uri}=                   set variable                 /v2/ip/scp/lcn?lata=240&netWrkId=VQ
  ${LATA}=                  set variable                   240
  ${netWrkId}=             set variable                   VQ
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/lcn?netWrkId=${netWrkId}&lata=${LATA}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse LCN Response
  Parse Return Code   ${resp}        ${keyword}

Update_Customer_Record_Audit_with_Template_Record
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               a customer record audit or resend.
  [Tags]     REGRESSION  SCP   CRA update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${num}=                  set variable                    8335551212
  ${tmplName}=             set variable                    *BR-1
  ${Date}=                 get current date
  ${effDt}=                Future Effective Date      ${Date}      1
  ${action}=               set variable                    AUDIT
  ${critInd}=              set variable                    Y
  #${action}=               set variable                    RESEND
  #${critInd}=              set variable                    N
  ${scpRecs}=              Create List                     YK01
  ${CR_v3_UCI}=            set variable                    /v3/ip/scp/cra
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${CRA_Data}''')       json
  set to dictionary        ${requestData}                          num=${num}
  set to dictionary        ${requestData}                          tmplName=${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${effDt}
  set to dictionary        ${requestData}                          action=${action}
  set to dictionary        ${requestData}                          critInd=${critInd}
  set to dictionary        ${requestData}                          scpRecs=${scpRecs}
  remove from dictionary   ${requestData}                          num
  remove from dictionary   ${requestData}                          Tm
  remove from dictionary   ${requestData}                          critInd
  #remove from dictionary   ${requestData}                          scpRecs
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse CRA Success Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Customer_Record_Audit_using_TemplateName
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   CRA retrieve
  ${token}=                get token
  ${tmplName}=             set variable                   BR-1
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra/tmplName/%2A${tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse CRA Record
  Parse Return Code   ${resp}        ${keyword}

Update_Customer_Record_Resend_with_Template_Record
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               a customer record audit or resend.
  [Tags]     REGRESSION  SCP   CRA update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${num}=                  set variable                    8335551212
  ${tmplName}=             set variable                    *BR-1
  ${effDtTm}=              set variable                    9082325999
  #${action}=               set variable                    AUDIT
  ${critInd}=              set variable                    Y
  ${action}=               set variable                    RESEND
  #${critInd}=              set variable                    N
  ${scpRecs}=              Create List                     YK01
  ${CR_v3_UCI}=            set variable                    /v3/ip/scp/cra
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${CRA_Data}''')       json
  set to dictionary        ${requestData}                          num=${num}
  set to dictionary        ${requestData}                          tmplName=${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${effDtTm}
  set to dictionary        ${requestData}                          action=${action}
  set to dictionary        ${requestData}                          critInd=${critInd}
  set to dictionary        ${requestData}                          scpRecs=${scpRecs}
  remove from dictionary   ${requestData}                          num
  remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          critInd
  #remove from dictionary   ${requestData}                          scpRecs
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse CRA Success Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Customer_Record_Resend_using_TemplateName
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   CRA retrieve
  ${token}=                get token
  ${tmplName}=             set variable                   BR-1
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra/tmplName/%2A${tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse CRA Record
  Parse Return Code   ${resp}        ${keyword}

Update_Customer_Record_Audit_with_Template_Record_and_ROID
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               a customer record audit or resend.
  [Tags]     REGRESSION  SCP   CRA update
  set test variable        ${Expected_Error}            *LG-ADX3-TEST:Template doesn't exist in Toll-Free Number Registry.

  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${num}=                  set variable                    8335551212
  ${tmplName}=             set variable                    *LG-ADX3-TEST
  ${effDtTm}=              set variable                    9082325999
  ${action}=               set variable                    AUDIT
  ${critInd}=              set variable                    Y
  #${action}=               set variable                    RESEND
  #${critInd}=              set variable                    N
  ${scpRecs}=              Create List                     YK01
  ${CR_v3_UCI}=            set variable                    /v3/ip/scp/cra
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${CRA_Data}''')       json
  set to dictionary        ${requestData}                          num=${num}
  set to dictionary        ${requestData}                          tmplName=${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${effDtTm}
  set to dictionary        ${requestData}                          action=${action}
  set to dictionary        ${requestData}                          critInd=${critInd}
  set to dictionary        ${requestData}                          scpRecs=${scpRecs}
  remove from dictionary   ${requestData}                          num
  remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          critInd
  #remove from dictionary   ${requestData}                          scpRecs
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}      ROID=${ROID}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse CRA Success Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Customer_Record_Audit_using_TemplateName_and_ROID
  [Tags]     REGRESSION  SCP   CRA retrieve
  set test variable        ${Expected_Error}            *LG-ADX3-TEST:Template doesn't exist in Toll-Free Number Registry.
#set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  ${token}=                get token
  ${tmplName}=             set variable                   LG-ADX3-TEST
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra/tmplName/%2A${tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}       ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse CRA Record
  Parse Return Code   ${resp}        ${keyword}

Update_Customer_Record_Audit_with_Customer_Record_Number
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               a customer record audit or resend.
  [Tags]     REGRESSION  SCP   CRA update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${num}=                  set variable                    8339920315
  ${tmplName}=             set variable                    *BR-1
  ${effDtTm}=              set variable                    9082325999
  ${action}=               set variable                    AUDIT
  ${critInd}=              set variable                    Y
  #${action}=               set variable                    RESEND
  #${critInd}=              set variable                    N
  ${scpRecs}=              Create List                     YK01
  ${CR_v3_UCI}=            set variable                    /v3/ip/scp/cra
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${CRA_Data}''')       json
  set to dictionary        ${requestData}                          num=${num}
  set to dictionary        ${requestData}                          tmplName=${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${effDtTm}
  set to dictionary        ${requestData}                          action=${action}
  set to dictionary        ${requestData}                          critInd=${critInd}
  set to dictionary        ${requestData}                          scpRecs=${scpRecs}
  remove from dictionary   ${requestData}                          tmplName
  remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          critInd
  #remove from dictionary   ${requestData}                          scpRecs
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse CRA Success Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Customer_Record_Audit_using_Customer_Record_Number
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   CRA retrieve
  ${token}=                get token
  ${tmplName}=             set variable                   BR-1
  ${num}=                  set variable                    8339920315
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra/tfnum/${num}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse CRA Record
  Parse Return Code   ${resp}        ${keyword}

Update_Customer_Record_Resend_with_Customer_Record_Number
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               a customer record audit or resend.
  [Tags]     REGRESSION  SCP   CRA update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${num}=                  set variable                    8339920315
  ${tmplName}=             set variable                    *BR-1
  ${effDtTm}=              set variable                    9082325999
  #${action}=               set variable                    AUDIT
  ${critInd}=              set variable                    Y
  ${action}=               set variable                    RESEND
  #${critInd}=              set variable                    N
  ${scpRecs}=              Create List                     YK01
  ${CR_v3_UCI}=            set variable                    /v3/ip/scp/cra
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${CRA_Data}''')       json
  set to dictionary        ${requestData}                          num=${num}
  set to dictionary        ${requestData}                          tmplName=${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${effDtTm}
  set to dictionary        ${requestData}                          action=${action}
  set to dictionary        ${requestData}                          critInd=${critInd}
  set to dictionary        ${requestData}                          scpRecs=${scpRecs}
  remove from dictionary   ${requestData}                          tmplName
  remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          critInd
  #remove from dictionary   ${requestData}                          scpRecs
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse CRA Success Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Customer_Record_Resend_using_Customer_Record_Number
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   CRA retrieve
  ${token}=                get token
  ${tmplName}=             set variable                   BR-1
  ${num}=                  set variable                    8339920315
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra/tfnum/${num}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse CRA Record
  Parse Return Code   ${resp}        ${keyword}

Update_Customer_Record_Audit_with_Customer_Record_Number_and_ROID
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               a customer record audit or resend.
  [Tags]     REGRESSION  SCP   CRA update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${num}=                  set variable                    8339920315
  ${tmplName}=             set variable                    *LG-ADX3-TEST
  ${effDtTm}=              set variable                    9082325999
  ${action}=               set variable                    AUDIT
  ${critInd}=              set variable                    Y
  ${ROID}=                 set variable                    BROPR
  #${critInd}=              set variable                    N
  ${scpRecs}=              Create List                     YK01
  ${CR_v3_UCI}=            set variable                    /v3/ip/scp/cra
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${CRA_Data}''')       json
  set to dictionary        ${requestData}                          num=${num}
  set to dictionary        ${requestData}                          tmplName=${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${effDtTm}
  set to dictionary        ${requestData}                          action=${action}
  set to dictionary        ${requestData}                          critInd=${critInd}
  set to dictionary        ${requestData}                          scpRecs=${scpRecs}
  remove from dictionary   ${requestData}                          tmplName
  remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          critInd
  #remove from dictionary   ${requestData}                          scpRecs
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}      ROID=${ROID}
  set Test variable        ${Expected_Error}     Permission Denied: User does not have requisite permissions.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse CRA Success Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Customer_Record_Audit_using_Customer_Record_Number_and_ROID
  [Tags]     REGRESSION  SCP   CRA retrieve
  set Test variable        ${Expected_Error}     Permission Denied: User does not have requisite permissions.
  ${token}=                get token
  ${ROID}=                 set variable                    BROPR
  ${tmplName}=             set variable                   LG-ADX3-TEST
  ${num}=                  set variable                    8339920315
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/cra/tfnum/${num}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}       ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse CRA Record
  Parse Return Code   ${resp}        ${keyword}

List_Network_Management_Exception_Reports_Limits
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NRL list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrl/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NRL List Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Network_Management_Exception_Reports_Limits_for_netWrkId
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NRL retrieve
  ${token}=                get token
                            # BR01
  ${netWrkId}=             set variable                   ${netWrkIdList[0]}
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrl?netWrkId=${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NRL Response
  Parse Return Code   ${resp}        ${keyword}

Update_Network_Management_Exception_Reports_Limits_for_netWrkId
  [Tags]     REGRESSION  SCP   NRL update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  parse scpList from NRL       ${scpList[0]}
  ${numListChg}=           set variable                    16
  ${sspOverflow}=          set variable                     6
  ${NRL_update_requestData}=           evaluate    json.loads('''${NRL_Data}''')    json
  ${NRL_nrlList}     get from dictionary     ${NRL_update_requestData}        nrlList
  set to dictionary       ${NRL_nrlList[0]}      recVersionId=${recVersionId}
  set to dictionary       ${NRL_nrlList[0]}      scpId=${scpId}
  set to dictionary       ${NRL_nrlList[0]}      numListChg=${numListChg}
  set to dictionary       ${NRL_nrlList[0]}      sspOverflow=${sspOverflow}
  Log list    ${NRL_nrlList}
                            # BR01
  ${netWrkId}=             set variable                   ${netWrkIdList[0]}
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrl
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${reqBody}=              evaluate               json.dumps(${NRL_update_requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  #set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse NRL Update Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Network_Management_Exception_Reports_Limits_for_netWrkId_after_Update
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NRL retrieve
  ${token}=                get token
                            # BR01
  ${netWrkId}=             set variable                   ${netWrkIdList[0]}
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrl?netWrkId=${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NRL Response
  Parse Return Code   ${resp}        ${keyword}
  parse scpList from NRL       ${scpList[0]}

List_Network_Management_Exception_Reports_before_Creation
  set test variable        ${Expected_Error}              No CCS Network data is found.
  [Tags]     REGRESSION  SCP   NRC list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrc/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NRC List Response
  Parse Return Code   ${resp}        ${keyword}

Create_Network_Management_Exception_Reports_Control_Record
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...               Network Exception Reports destination addresses.
  [Tags]     REGRESSION  SCP   NRC create
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${scpId}=                set variable                    BR01
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrc
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${NRC_create_Data}''')       json
  set to dictionary        ${requestData}                          scpId=${scpId}
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
  ${keyword}=     set variable       Parse NRC Create Response
  Parse Return Code   ${resp}        ${keyword}

List_Network_Management_Exception_Reports_after_Creation
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   NRC list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrc/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NRC List Response
  Parse Return Code   ${resp}        ${keyword}

Update_Network_Management_Exception_Reports_Control_Record
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               Network Exception Reports destination addresses.
  [Tags]     REGRESSION  SCP   NRC update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${scpId}=                set variable                    BR01
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrc
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${NRC_create_Data}''')       json
  set to dictionary        ${requestData}                          scpId=${scpId}
  set to dictionary        ${requestData}                          recVersionId=${NRC_recVersionId}
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
  ${keyword}=     set variable       Parse NRC Create Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Network_Management_Exception_Reports_Control_Record_using_ScpId
  [Documentation]   This API allows the SMS/800 TFN Registry user to retrieve a NRC record.
  [Tags]     REGRESSION  SCP   NRC retrieve
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${scpId}=                set variable                    BR01
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrc/scpId/${scpId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        get Request        endpoint       ${GET_ACTION_URI}     headers=${headers}
  ${keyword}=     set variable       Parse NRC create Response
  Parse Return Code   ${resp}        ${keyword}

Delete_Network_Management_Exception_Reports_Control_Record
  [Documentation]   This API allows the SMS/800 TFN Registry user to delete a NRC record.
  [Tags]     REGRESSION  SCP   NRC delete
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${scpId}=                set variable                    BR01
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/nrc/scpId/${scpId}/recVersionId/${NRC_recVersionId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Delete Request        endpoint       ${GET_ACTION_URI}     headers=${headers}
  ${keyword}=     set variable       Parse NRC Delete Response
  Parse Return Code   ${resp}        ${keyword}

########################################   PRC  #####################################################

List_SCP_Exception_Reports_Control_before_Creation
  [Tags]     REGRESSION  SCP   PRC list
  set test variable        ${Expected_Error}              No CCS Network data is found.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prc/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse PRC List Response
  Parse Return Code   ${resp}        ${keyword}

Create_SCP_Exception_Reports_Control_Record
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...               SCP Exception Reports destination addresses.
  [Tags]     REGRESSION  SCP   PRC create
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

List_SCP_Exception_Reports_Control_after_Creation
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   PRC list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prc/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse PRC List Response
  Parse Return Code   ${resp}        ${keyword}

Update_SCP_Exception_Reports_Control_Record
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               Network Exception Reports destination addresses.
  [Tags]     REGRESSION  SCP   PRC update
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

Retrieve_SCP_Exception_Reports_Control_Record_using_ScpId
  [Documentation]   This API allows the SMS/800 TFN Registry user to retrieve a NRC record.
  [Tags]     REGRESSION  SCP   PRC retrieve
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

Delete_SCP_Exception_Reports_Control_Record
  [Documentation]   This API allows the SMS/800 TFN Registry user to delete a NRC record.
  [Tags]     REGRESSION  SCP   PRC delete
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

List_SCP_Exception_Reports_Control_after_Delete
  [Tags]     REGRESSION  SCP   PRC list
  set test variable        ${Expected_Error}              No CCS Network data is found.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prc/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse PRC List Response
  Parse Return Code   ${resp}        ${keyword}

List_SCP_Exception_Reports_Limits
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   PRL list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/prl/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse PRL List Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_SCP_Exception_Reports_Limits_for_netWrkId
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   PRL retrieve
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

Retrieve_Manual_Control_Request_for_Tel#
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   MAC retrieve
  ${token}=                get token
  ${dest_Number}=          set variable                   9082320442
  set test variable        ${num_Type}                    DEST
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/mac/num/${dest_Number}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse MAC Record
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Manual_Control_Request_for_Dial#
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   MAC retrieve
  ${token}=                get token
  ${dial_Number}=          set variable                   8339580272
  set test variable        ${num_Type}                    DIAL
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/mac/num/${dial_Number}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse MAC Record
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Excluded_SCP_List
  #set test variable        ${Expected_Error}              Network IntraLATA Execptions data does not exist.
  [Tags]     REGRESSION  SCP   MAC retrieve
  ${token}=                get token
  ${num}=                  set variable                   8339580272
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/mac/num/${num}
  #${CR_v3_UCI}=            set variable                   /v3/ip/scp/
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse MAC Record
  Parse Return Code   ${resp}        ${keyword}

Create_Excluded_SCP_List_Record_for_Dial#_with_Error
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...               Manual Control Data.
  [Tags]     REGRESSION  SCP   MAC create
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${num}=                  set variable                   8339580272
  ${gapInterval}=          set variable                   15
  ${ctrlDuration}=         set variable                   10
  ${callTreatment}=        set variable                   VCA
  ${numType}=              set variable                   DIAL
  ${scpList}=              Create List                    BR01
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/mac
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${MAC_create_Data}''')       json
  set to dictionary        ${requestData}                          num=${num}
  set to dictionary        ${requestData}                          scpList=${scpList}
  set to dictionary        ${requestData}                          gapInterval=${gapInterval}
  set to dictionary        ${requestData}                          ctrlDuration=${ctrlDuration}
  set to dictionary        ${requestData}                          callTreatment=${callTreatment}
  set to dictionary        ${requestData}                          numType=${numType}
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  set Test variable        ${Expected_Error}     Valid values are NCA, VCA, OBA and 60IPM, but SCP has supoort for 60IPM.
  ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
  ${keyword}=     set variable       Parse MAC Record
  Parse Return Code   ${resp}        ${keyword}

Create_Excluded_SCP_List_Record_for_Dial#
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...               Manual Control Data.
  [Tags]     REGRESSION  SCP   MAC create
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${num}=                  set variable                   8339580272
  ${gapInterval}=          set variable                   15
  ${ctrlDuration}=         set variable                   10
  ${callTreatment}=        set variable                   60IPM
  ${numType}=              set variable                   DIAL
  ${scpList}=              Create List                    BR01
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/mac
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${MAC_create_Data}''')       json
  set to dictionary        ${requestData}                          num=${num}
  set to dictionary        ${requestData}                          scpList=${scpList}
  set to dictionary        ${requestData}                          gapInterval=${gapInterval}
  set to dictionary        ${requestData}                          ctrlDuration=${ctrlDuration}
  set to dictionary        ${requestData}                          callTreatment=${callTreatment}
  set to dictionary        ${requestData}                          numType=${numType}
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  set Test variable        ${Expected_Error}     Valid values are NCA, VCA, OBA and 60IPM, but SCP has supoort for 60IPM.
  ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
  ${keyword}=     set variable       Parse MAC Record
  Parse Return Code   ${resp}        ${keyword}

Update_Excluded_SCP_List_Record_for_Dial#
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               Manual Control Data.
  [Tags]     REGRESSION  SCP   MAC create
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${num}=                  set variable                   8339580272
  ${scpList}=              Create List                    BR01
  ${gapInterval}=          set variable                   1
  ${ctrlDuration}=         set variable                   5
  ${callTreatment}=        set variable                   NCA
  ${numType}=              set variable                   DIAL
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/mac
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${MAC_updt_Data}''')       json
  set to dictionary        ${requestData}                          num=${num}
  set to dictionary        ${requestData}                          scpList=${scpList}
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  set Test variable        ${Expected_Error}     Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
  ${keyword}=     set variable       Parse MAC Record
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Mass_Calling_Thresholds_for_netWrkId
  #set Test variable        ${Expected_Error}     Record does not exist.
  [Tags]     REGRESSION  SCP   MAS retrieve
  set Test variable        ${Expected_Error}     Record does not exist.
  ${token}=                get token
  ${netWrkId}=             set variable                   ${netWrkIdList[0]}
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/mas?netWrkId=${netWrkId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse MAS Record
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Record_Call_Completion_Collection_using_netWrkId
  [Tags]     REGRESSION  SCP   CCC retrieve
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
  Sleep  10 seconds

Update_Call_Completion_Collection_Record_for_scpId_to_ON
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               Call Completion Collection Data.
  [Tags]     REGRESSION  SCP   CCC update
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

Retrieve_Record_Call_Completion_Collection_using_netWrkId_after_Update_to_ON
  [Tags]     REGRESSION  SCP   CCC retrieve
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

Update_Call_Completion_Collection_Record_for_scpId_to_OFF
  [Tags]     REGRESSION  SCP   CCC update
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

Retrieve_Record_Call_Completion_Collection_using_netWrkId_after_Update_to_OFF
  [Tags]     REGRESSION  SCP   CCC retrieve
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

List_SCPIDs_of_SID
  [Tags]     REGRESSION  SCP   SID list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpIdList
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse Scpid List
  Parse Return Code   ${resp}        ${keyword}
  Log List            ${scpIdList}
  Log                 ${scpId}

Retrieve_SCPID_of_SID_using_scpId
  [Tags]     REGRESSION  SCP   SID retrieve
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpId/${scpId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse SID Record
  Parse Return Code   ${resp}        ${keyword}

Create_SCP_ID_Definition_Record_for_BR02
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...               SCP ID Definition (SID).
  [Tags]     REGRESSION  SCP   SID create
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${scpId}=                set variable                   BR02
  ${scpNodeId}=            set variable                   SNMNCAXPA06
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
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}
  set Test variable        ${Expected_Error}         Node ID is already defined for SCP ID ZA01.
  ${resp}=        Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
  ${keyword}=     set variable       Parse SID Response
  Parse Return Code   ${resp}        ${keyword}

List_SCPIDs_of_SID_after_addition_of_ZA01
  [Tags]     REGRESSION  SCP   SID list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpIdList
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse Scpid List
  Parse Return Code   ${resp}        ${keyword}
  Log                 ${scpId}
  Log List            ${scpIdList}
  ${x}=                get Length      ${scpIdList}
  should be equal as strings           ${x}            2

Retrieve_SCPID_of_SID_using_scpId_for_ZA01
  [Tags]     REGRESSION  SCP   SID retrieve
  set Test variable        ${Expected_Error}     User is not allowed to access SCP ID.
  ${token}=                get token
  ${scpId}=                set variable                   ZA01
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpId/${scpId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse SID Record
  Parse Return Code   ${resp}        ${keyword}
  should be equal      ${tmplSupprtd}       Y

Update_SCP_ID_Definition_Record_for_BR02
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               SCP ID Definition (SID).
  [Tags]     REGRESSION  SCP   SID update
  ${token}=                get token
  ${oauthToken}=           set variable                    ${token}
  ${scpId}=                set variable                   ZA01
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
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}

  set Test variable        ${Expected_Error}         User is not allowed to access SCP ID.

  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}      headers=${headers}
  ${keyword}=     set variable       Parse SID Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_SCPID_of_SID_using_scpId_for_BR02_after_Update
  [Tags]     REGRESSION  SCP   SID retrieve
  ${token}=                get token
  ${scpId}=                set variable                   ZA01
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpId/${scpId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse SID Record

  set Test variable        ${Expected_Error}     User is not allowed to access SCP ID.

  Parse Return Code   ${resp}        ${keyword}
  should be equal      ${tmplSupprtd}       N

Delete_SCP_ID_Definition_Record_for_BR02_with_error
  [Tags]     REGRESSION  SCP   SID delete
  set test variable        ${Expected_Error}              Record does not exist.
  ${token}=                get token
  ${scpId}=                set variable                   BR02
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpId/${scpId}/recVersionId/${recVersionId_SID}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Delete Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Delete Response
  Parse Return Code   ${resp}        ${keyword}

List_SCPIDs_of_SID_after_deletion_of_BR02
  [Tags]     REGRESSION  SCP   SID list
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/sid/scpIdList
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse Scpid List
  Parse Return Code   ${resp}        ${keyword}
  Log                 ${scpId}
  Log List            ${scpIdList}
  ${x}=                get Length      ${scpIdList}
  should be equal as strings           ${x}            2

Create_SSP_ID_Definition_Record_for_BR_PointCode_error
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...               SSP ID Definition.
  [Tags]     REGRESSION  SCP   SSP create
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

Create_SSP_ID_Definition_Record_for_BR
  [Documentation]   This API allows the SMS/800 TFN Registry user to create
  ...               SSP ID Definition.
  [Tags]     REGRESSION  SCP   SSP create
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

Update_SSP_ID_Definition_Record_for_BR
  [Documentation]   This API allows the SMS/800 TFN Registry user to update
  ...               SSP ID Definition.
  [Tags]     REGRESSION  SCP   SSP update
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

Delete_SSP_ID_Definition_Record_for_BR
  #set test variable        ${Expected_Error}              Network IntraLATA Agreements data does not exist.
  [Tags]     REGRESSION  SCP   SSP delete
  ${token}=                get token
  ${netId}=                set variable                   BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/scp/ssp/netWrkId/${netId}/recVersionId/${recVersionId_new_SSP}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Delete Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse NLA Delete Response
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Threshold_Level_Class_Assignments_for_a_Toll_Free_Number
  [Tags]     REGRESSION  SCP   TLC retrieve
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


List_SID_netWkIdList
  [Tags]     REGRESSION  SCP   SID list
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


Retrieve_SID_using_netWkId
  [Tags]     REGRESSION  SCP   SID list
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


Retrieve_SCP_NPA-NXX_List_producing_Error
  [Tags]     REGRESSION  SCP   NXX list
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

Create_SCP_NPA-NXX_List_producing_Error
  [Tags]     REGRESSION  SCP   NXX list
  set test variable        ${Expected_Error}               NPA 822: Must be an existing 3-digit 8xx Toll-Free NPA code known to the TFN Registry (e.g., 800).
  #set test variable        ${Expected_Error}               Record already exists.
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


Retrieve_SCP_NPA-NXX_List_for_822npa
  [Tags]     REGRESSION  SCP   NXX list
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




Delete_SCP_NPA-NXX_List_for_822npa
   [Tags]     REGRESSION  SCP   NXX list
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














 Close_User_Session
   Close Session








*** Keywords ***

Future Effective Date
  [Arguments]     ${Date}     ${Number of Days}
  ${Edit_Date}        Add Time To Date    ${Date}   ${Number of Days}days
  ${Date}    Convert Date    ${Edit_Date}    %Y-%m-%d
  [Return]    ${Date}
