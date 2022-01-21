*** Settings ***
Documentation   This Suite Consists of Samples from
...             MGI - API Conversion Document - Test Cases
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
${cicCode}
${acna}
${PriorityStatus_N}                         N
${DayLightSavings_N}                        N
${TimeZone_C}                               C
${DisconInd_N}                              N
#${API_User_Credentials_for_UAT}               {"usrName": "${UAT_USER}","password": "${UAT_User_PASSWORD}","withPerm": true}
#${API_User_Credentials_for_Sand}          {"usrName": "${SAND_USER}","password": "${SAND_User_PASSWORD}","withPerm": true}
${ReqData}                                {"conName":"PETERSEN","conTel":"${UserProfileCreate_PhoneNum}"}${cicCode}
${ACTIVE}                                 ACTIVE
${PENDING}                                PENDING
${SENDING}                                SENDING
${TRANSITIONAL}                           TRANSITIONAL
${WORKING}                                WORKING
${custRecCompPart_CAD_LAD_CPR}            CAD, LAD, CPR
${custRecCompPart_CAD_CPR}                CAD, CPR
${custRecCompPart_LAD_CPR}                LAD, CPR
${tmplRecCompPart_TAD_LAD_CPR}            TAD, LAD, CPR
${SPARE}                                  SPARE
${RESERVED}                               RESERVED
${acna}
#${API_User_Credentials_for_UAT}               {"usrName": "${UAT_USER}","password": "${UAT_User_PASSWORD}","withPerm": true}
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
${ReqBody_Mandatory_params}                      {"num":"8556664830","cmd":"U","effDtTm":"2018-03-10T10:00Z","suppFormNum":"adcdqw","svcOrderNum":"asagh","intraLATACarrier":["0555"],"interLATACarrier":["0555"],"aos":{"aosNet":["${validAosNet_CRO}"]},"destNums":[{"destNum":"8556664830","numTermLine":100}]}
${ReqBody_CR_Disconnect_MandatoryParams}         {"srcNum":"","tgtEffDtTm":"","cmd":"U","srcRecVersionId":"","referral":"Y","custRecCompPart":"CAD"}
${PR_CR_ReqBody}                                 {"tfNum": "","srcEffDtTm": "","tgtEffDtTm": "","recVersionId": ""}
${ReqBody_Complex_TR_Create_Mandatory_Params}    {"tmplName":"","cmd":"U","effDtTm":"","intraLATACarrier":[""],"interLATACarrier":[""],"tmplDesc":"Create Complex Template Record","numTermLine":100,"aos":{"aosNet":["US"]},"cprSectName":[{"name":"MAIN","nodeSeq":[""],"nodes":[""]}]}
${Disconnect_CAD_Data}                        {"srcNum": "string","tgtNum": "string","tgtEffDtTm": "string","tgtTmplName": "string","srcEffDtTm": "string","ctrlRespOrgId": "string","cmd": "U","tmplDesc": "string","hldIndFlag": "Y","priority": "Y","svcOrderNum": "string","suppFormNum": "string","onAccCust": "string","agent": "string","telco": "string","endSub": "string","endSubAddr": "string","conName": "string","conTel": "string","notes": "string","aos": {"aosLbl": ["string"],"aosNPA": ["string"],"aosLATA": ["string"],"aosNet": ["string"],"aosState": ["string"]},"interLATACarrier": ["string"],"intraLATACarrier": ["string"],"destNums": [{"destNum": "string","numTermLine": 1,"forServOff": "string","localServOff": "string"}],"cprSectName": [{"name": "string","nodeSeq": ["string"],"nodes": [{"colIndex": 0,"rowIndex": 0,"values": ["string"]}]}],"dayLightSavings": "Y","priInterLT": "string","priIntraLT": "string","tmZn": "A","lbl": [{"lblType": "AC","lblName": "string","lblVals": ["string"]}],"custRecCompPart": "CAD","referral": "Y","endInterceptDt": "string","srcRecVersionId": "string","tgtRecVersionId": "string","asyncId": "string","overWriteTGT": "Y"}
${NUM_RSCH_Data}            {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string"}
${NUM_SSCH_Data}            {"numList": ["string"],"asyncId": "string"}
${NUM_WSCH_Data}            {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string","wildCardNum": "string"}
${NUM_RRSV_Data}            {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","conName": "string","conTel": "string","shrtNotes": "string","asyncId": "string"}
${NUM_WRSV_Data}            {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","conName": "string","conTel": "string","shrtNotes": "string","asyncId": "string","wildCardNum": "string"}
${NUM_SRSV_Data}            {"numList": ["string"],"conName": "string","conTel": "string","asyncId": "string"}
${NUM_UPDT_Data}            {"tfNumList": [{"num": "string","recVersionId": "string"}],"status": "SPARE","requestDesc": "string","email": "user@example.com","ctrlRespOrgId": "string","conName": "string","conPhone": "string","resUntilDt": "string","shrtNotes": "string","asyncId": "string"}






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



Query_a_Reserved_TFN
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=Q,NUM=A_Reserved_TFN;
  ...      RSP-NSR:,2020-08-07,10-09-48- CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC,NUM="8339650366 "
  ...      ,RU="09/21/20",SE="08/07/20",STAT="RESERVE",CRO=BRSMS;
  [Tags]     REGRESSION  NA  Query
  ${token}         get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
  set test variable     ${reservedTFN}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${numList}=             Create List            ${reservedTFN}
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}

Search_for_one_Random_TFN
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=S;
  ...      RSP-NSR:,2020-08-07,10-09-48- CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM=Random TFN
  [Tags]     REGRESSION  NA  Search
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=S (RANDOM)
  ###############################################################################################################
  ${token}=               get token
  ${GET_ACTION_URI}=         Set Variable           /v3/ip/num/tfn/random
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           1
  ${requestData}=         evaluate               json.loads('''${NUM_RSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         npa=833
  set to dictionary       ${requestData}         cons=N
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
  log          ${resp}
  ${keyword}=     set variable       Parse Number Search Response
  Parse Return Code   ${resp}        ${keyword}
  set suite variable    ${spare_number}         ${number}


Search_for_one_Specific_TFN
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUM="${number}";
  ...      RSP-NSR:,2020-08-07,10-09-48- CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM=${number}
  [Tags]     REGRESSION  NA  Specific-search
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=S (SPECIFIC)
  ###############################################################################################################
  ${token}=               get token
  ${GET_ACTION_URI}=        Set Variable           /v3/ip/num/tfn/specific
  ${oauthToken}=            Set Variable           ${token}
  ${numList}=               Create List            ${number}
  ${requestData}=           evaluate               json.loads('''${NUM_SSCH_Data}''')       json
  set to dictionary         ${requestData}         numList=${numList}
  remove from dictionary    ${requestData}         asyncId
  ${reqBody}=               evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
  log          ${resp}
  ${keyword}=     set variable       Parse Number Search Response
  Parse Return Code   ${resp}        ${keyword}

Search_for_two_Wildcard_TFNs
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=S,QT=2,CONT=N,NUM="866*******";
  ...      RSP-NSR:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=02:NUM="866*******":NUM="866*******"
  [Tags]     REGRESSION  NA  Wildcard
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=S (WILDCARD)
  ###############################################################################################################
  ${token}=               get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/wildcard
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           2
  ${wildCardNum}=         Set Variable           866*******
  ${requestData}=         evaluate               json.loads('''${NUM_WSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         cons=N
  set to dictionary       ${requestData}         wildCardNum=${wildCardNum}
  remove from dictionary  ${requestData}         npa
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
  log          ${resp}
  ${keyword}=     set variable       Parse Number Search Response
  Parse Return Code   ${resp}        ${keyword}

Search_and_Reserve_for_two_Random_TFNs
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=R,NCON="SOMOS",CTEL="9089565118",NPA=866;
  ...      RSP-NSR:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM="866*******"
  [Tags]     REGRESSION  NA  Search  Reserve
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=R (RANDOM SEARCH AND RESERVE)
  ###############################################################################################################
  ${token}=               get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/srchres/random
  ${oauthToken}=          Set Variable           ${token}
  ${conName}=             Set Variable           SOMOS
  ${conTel}=              Set Variable           9089565118
  ${shrtNotes}=           Set Variable           RESERVE 2 RANDOM NUMBERS
  ${qty}=                 Set variable           2
  ${NPA}=                 Set Variable           866
  ${requestData}=         evaluate               json.loads('''${NUM_RRSV_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         cons=N
  set to dictionary       ${requestData}         npa=${NPA}
  set to dictionary       ${requestData}         conName=${conName}
  set to dictionary       ${requestData}         conTel=${conTel}
  set to dictionary       ${requestData}         shrtNotes=${shrtNotes}
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         qty
  remove from dictionary  ${requestData}         cons
  remove from dictionary  ${requestData}         shrtNotes
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
  log          ${resp}
  ${keyword}=     set variable       Parse Number Reserve Response
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}=               get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${rsv_number}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}

Search_and_Reserve_for_one_Wildcard_TFN
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=R,NCON="SOMOS",CTEL="9089565118":QT=1:NUM="8**9**0023";
  ...      RSP-NSR:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM="8**9**0023"
  [Tags]     REGRESSION  NA   Search  Reserve  Wildcard
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=R (WILDCARD SEARCH AND RESERVE)
  ###############################################################################################################
  ${token}=               get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/srchres/wildcard
  ${oauthToken}=          Set Variable           ${token}
  ${wildCardNum}=         Set Variable           8**9**0023
  ${conName}=             Set Variable           SOMOS
  ${conTel}=              Set Variable           9089565118
  ${shrtNotes}=           Set Variable           RESERVE 1 WILDCARD NUMBER
  ${qty}=                 Set variable           1
  ${NPA}=                 Set Variable           866
  ${requestData}=         evaluate               json.loads('''${NUM_WRSV_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         wildCardNum=${wildCardNum}
  set to dictionary       ${requestData}         npa=${NPA}
  set to dictionary       ${requestData}         conName=${conName}
  set to dictionary       ${requestData}         conTel=${conTel}
  set to dictionary       ${requestData}         shrtNotes=${shrtNotes}
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         npa
  remove from dictionary  ${requestData}         cons
  remove from dictionary  ${requestData}         shrtNotes
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
  log          ${resp}
  ${keyword}=     set variable       Parse Number Reserve Response
  Parse Return Code   ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}=               get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${rsv_number}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}

Search_and_Reserve_for_one_Specific_TFN
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=R,NUM="${spare_number}";
  ...      RSP-NSR:,2020-08-07,10-09-48- CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM=${spare_number}
  [Tags]     REGRESSION  NA  Specific-search  Reserve
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=R (SPECIFIC SEARCH AND RESERVE)
  ###############################################################################################################
  ${token}=                 get token
  ${GET_ACTION_URI}=        Set Variable           /v3/ip/num/tfn/srchres/specific
  ${oauthToken}=            Set Variable           ${token}
  ${conName}=               Set Variable           SOMOS
  ${conTel}=                Set Variable           9089565118
  ${numList}=               Create List            ${spare_number}
  ${requestData}=           evaluate               json.loads('''${NUM_SRSV_Data}''')       json
  set to dictionary         ${requestData}         numList=${numList}
  set to dictionary         ${requestData}         conName=${conName}
  set to dictionary         ${requestData}         conTel=${conTel}
  remove from dictionary    ${requestData}         asyncId
  ${reqBody}=               evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
  log          ${resp}
  ${keyword}=     set variable       Parse Number Search Response
  Parse Return Code   ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}=               get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${rsv_number}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}




Spare_one_Reserved_TFN
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUM="${reservedTFN}";
  ...      RSP-NSC:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM=${reservedTFN}
  [Tags]     REGRESSION  NA  Reserve  Spare
  #Pass Execution    Work in Progress.
  ${token}         get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
  set test variable     ${reservedTFN}
  ${numList}=             Create List            ${reservedTFN}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}         get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSC AC=S
  ###############################################################################################################
  ${token}         get token
  ${GET_ACTION_URI}=      Set Variable            /v3/ip/num/tfn/update
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData["tfNumList"][0]}             recVersionId=${Q_recVersionId}
  set to dictionary        ${requestData["tfNumList"][0]}             num=${reservedTFN}
  set to dictionary        ${requestData}                             status=SPARE
  #set to dictionary        ${requestData}                             resUntilDt=${new_Date}
  remove from dictionary   ${requestData}                             conPhone
  remove from dictionary   ${requestData}                             conName
  remove from dictionary   ${requestData}                             resUntilDt
  remove from dictionary   ${requestData}                             email
  remove from dictionary   ${requestData}                             ctrlRespOrgId
  remove from dictionary   ${requestData}                             requestDesc
  remove from dictionary   ${requestData}                             asyncId
  remove from dictionary   ${requestData}                             shrtNotes
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Number Update Response
  Parse Return Code   ${resp}        ${keyword}


Change_Parameters_of_one_Reserved_TFN
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUM="${reservedTFN}";
  ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=C,NUM="",NEWRO=BRSAC,RU="",NCON="HELLO WORLD ";
  ...      Change conName, ctrlRespOrgId
  [Tags]     REGRESSION  NA   Reserve   Change
  #Pass Execution    Work in Progress.
  ${token}         get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
  set test variable     ${reservedTFN}
  ${numList}=             Create List            ${reservedTFN}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}         get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSC AC=C
  ###############################################################################################################
  ${token}=                get token
  ${GET_ACTION_URI}=       Set Variable            /v3/ip/num/tfn/update
  ${ctrlRespOrgId}=        Set Variable           BRSAC
  ${conName}=              Set Variable           HELLO WORLD
  ${rsv_Until_Dt}=         get Time               year month day            UTC + 1 day
  ${form_Dt}=              Set variable          ${rsv_Until_Dt}[0]-${rsv_Until_Dt}[1]-${rsv_Until_Dt}[2]
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData["tfNumList"][0]}             recVersionId=${Q_recVersionId}
  set to dictionary        ${requestData["tfNumList"][0]}             num=${reservedTFN}
  set to dictionary        ${requestData}                             resUntilDt=${form_Dt}
  set to dictionary        ${requestData}                             conName=${conName}
  set to dictionary        ${requestData}                             ctrlRespOrgId=${ctrlRespOrgId}
  remove from dictionary   ${requestData}                             conPhone
  remove from dictionary   ${requestData}                             spare
  remove from dictionary   ${requestData}                             email
  remove from dictionary   ${requestData}                             requestDesc
  remove from dictionary   ${requestData}                             asyncId
  remove from dictionary   ${requestData}                             shrtNotes
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Number Update Response
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}         get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}


Reserve_one_TRANSITIONAL_TFN
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=R,NUM="86698708 26",NCON="HELLO WORLD ",CTEL="9852081234",NOTES="HELLO WORLD";
  ...      RSP-NSC::::COMPLD,00::ID=BRMGIU1,RO=BRSAC,NUM="8669870826 ",LACT="11/28/18",SE="08/13/20",
  ...      STAT="RESERVE",NCON="HELLO WORLD ",CTEL="9852081234",NOTES="HELLO WORLD";
  [Tags]     REGRESSION  NA    Reserve  Transitional
  ##################################        CREATE TRANSITIONAL NUMBER
  #Pass Execution    WORKS, but takes time.
  ${token}         get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
  set test variable     ${reservedTFN}
  ${EFF_Date_Time}      set variable          NOW
  ${resporgId}          Get RespOrgID
  ${telco}              Get Telco             ${token}
  ${interLATACarrier}   create list           0555
  ${intraLATACarrier}   create list           0555
  ${GET_ACTION_URI}=            set variable                   /v3/ip/cus/rec
  ${requestData}        evaluate    json.loads('''${ReqBody_Mandatory_params}''')    json
  set to dictionary        ${requestData}                 num=${reservedTFN}
  set to dictionary        ${requestData}                 effDtTm=${EFF_Date_Time}
  set to dictionary        ${requestData}                 interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                 intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                 conTel=${reservedTFN}
  set to dictionary        ${requestData}                 telco=${telco}
  set to dictionary        ${requestData["destNums"][0]}  destNum=${reservedTFN}
  ${Req_body}=         evaluate    json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Customer Record Response
  Parse Return Code   ${resp}        ${keyword}
  #****************************************************************************************************#
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
  ###############################################################################################################
  BuiltIn.Comment           QUERY ACTIVE CAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  #set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           DISCONNECT ACTIVE CAD WITH NOW - NUMBER STATUS SHOULD BECOME TRANSISTIONAL
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/disconnect
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${Disconnect_CAD_Data}''')       json
  ###  REQUIRED PARAMETERS
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          tgtEffDtTm=NOW
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          endInterceptDt=NOW
  remove from dictionary        ${requestData}                          svcOrderNum=U559
  remove from dictionary       ${requestData}                          notes=COPIED CR
  remove from dictionary       ${requestData}                          interLATACarrier
  remove from dictionary        ${requestData}                          intraLATACarrier
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          referral=N
  remove from dictionary       ${requestData}                          srcEffDtTm
  set to dictionary        ${requestData}                          srcRecVersionId=${recVersionId}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=999
  ####  returns error 506002 when not removed
  remove from dictionary        ${requestData}                          tgtNum
  ###  NOT REQUIRED PARAMETERS
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          tmplDesc
  remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData}                          hldIndFlag
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          telco
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          conName
  remove from dictionary   ${requestData}                          conTel
  remove from dictionary   ${requestData}                          aos
  remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          priInterLT
  remove from dictionary   ${requestData}                          priIntraLT
  remove from dictionary   ${requestData}                          tmZn
  remove from dictionary   ${requestData}                          dayLightSavings
  remove from dictionary   ${requestData}                          tgtRecVersionId
  remove from dictionary   ${requestData}                          asyncId
  #remove from dictionary   ${requestData}                          endInterceptDt
  remove from dictionary   ${requestData}                          overWriteTGT
  remove from dictionary   ${requestData["lbl"][0]}                lblType
  remove from dictionary   ${requestData["lbl"][0]}                lblName
  remove from dictionary   ${requestData["lbl"][0]}                lblVals
  remove from dictionary   ${requestData}                          numTermLine
  remove from dictionary   ${requestData["destNums"][0]}           forServOff
  remove from dictionary   ${requestData["destNums"][0]}           localServOff
  remove from dictionary   ${requestData}                          lbl
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  set Test variable        ${Expected_Error}   The Disconnect request cannot be processed as other Customer Records exist for the TFN between Source and Target.

  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Post Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Disconnect Response
  set Test Variable      ${Q_index}               0
  #set Test Variable      ${TgtEffDtTm}            ${tgtEFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment        Wait until transitional
  ###############################################################################################################
  FOR     ${Index}      IN RANGE    1     15
       Sleep   1m
       ${responsedata}=             Do Number Query     ${token}    ${reservedTFN}     ${SuccessResponse}
       log                          ${responsedata}
       Convert to dictionary        ${responsedata}
       ${Query_Result}              get from dictionary   ${responsedata}                         queryResult
       log                          ${Query_Result}
       ${LstQuery_Result}=          get from list         ${Query_Result}                         0
       Convert to dictionary        ${LstQuery_Result}
       ${Number_Status}             get from dictionary   ${LstQuery_Result}                      status
       Run Keyword If               '${Number_Status}' == '${TRANSITIONAL}'      Exit For Loop
  END

  log                      ${Number_Status}
  should be equal          ${Number_Status}               ${TRANSITIONAL}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}         get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSC AC=R
  ###############################################################################################################
  ${token}=                get token
  ${GET_ACTION_URI}=       Set Variable            /v3/ip/num/tfn/update
  ${shrtNotes}=            Set Variable           HELLO WORLD
  ${conPhone}=             Set Variable           9089565118
  ${status}=               Set Variable           RESERVED
  ${ctrlRespOrgId}=        Set Variable           BRSMS
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData["tfNumList"][0]}             recVersionId=${Q_recVersionId}
  set to dictionary        ${requestData["tfNumList"][0]}             num=${reservedTFN}
  set to dictionary        ${requestData}                             shrtNotes=${shrtNotes}
  set to dictionary        ${requestData}                             conPhone=${conPhone}
  set to dictionary        ${requestData}                             status=${status}
  set to dictionary        ${requestData}                             ctrlRespOrgId=${ctrlRespOrgId}
  remove from dictionary   ${requestData}                             conName
  remove from dictionary   ${requestData}                             email
  remove from dictionary   ${requestData}                             requestDesc
  remove from dictionary   ${requestData}                             asyncId
  remove from dictionary   ${requestData}                             resUntilDt
  remove from dictionary   ${requestData}                             asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Number Update Response
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}         get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}


Spare_one_TRANSITIONAL_TFN
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUM="86698708 26",NCON="HELLO WORLD ",CTEL="9852081234",NOTES="HELLO WORLD";
  ...      RSP-NSC::::COMPLD,00::ID=BRMGIU1,RO=BRSAC,NUM="8669870826 ",LACT="11/28/18",SE="08/13/20",
  ...      STAT="RESERVE",NCON="HELLO WORLD ",CTEL="9852081234",NOTES="HELLO WORLD";
  [Tags]     REGRESSION  NA    Reserve  Transitional  Spare
  ##################################        CREATE TRANSITIONAL NUMBER
  #Pass Execution    WORKS, but takes time.
  ${token}         get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
  set test variable     ${reservedTFN}
  ${EFF_Date_Time}      set variable          NOW
  ${resporgId}          Get RespOrgID
  ${telco}              Get Telco             ${token}
  ${interLATACarrier}   create list           0555
  ${intraLATACarrier}   create list           0555
  ${GET_ACTION_URI}=            set variable                   /v3/ip/cus/rec
  ${requestData}        evaluate    json.loads('''${ReqBody_Mandatory_params}''')    json
  set to dictionary        ${requestData}                 num=${reservedTFN}
  set to dictionary        ${requestData}                 effDtTm=${EFF_Date_Time}
  set to dictionary        ${requestData}                 interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                 intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                 conTel=${reservedTFN}
  set to dictionary        ${requestData}                 telco=${telco}
  set to dictionary        ${requestData["destNums"][0]}  destNum=${reservedTFN}
  ${Req_body}=         evaluate    json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Customer Record Response
  Parse Return Code   ${resp}        ${keyword}
  #****************************************************************************************************#
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
  ###############################################################################################################
  BuiltIn.Comment           QUERY ACTIVE CAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  #set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment           DISCONNECT ACTIVE CAD WITH NOW - RECORD SHOULD BECOME TRANSISTIONAL
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/disconnect
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${Disconnect_CAD_Data}''')       json
  ###  REQUIRED PARAMETERS
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          tgtEffDtTm=NOW
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          endInterceptDt=NOW
  remove from dictionary        ${requestData}                          svcOrderNum=U559
  remove from dictionary       ${requestData}                          notes=COPIED CR
  remove from dictionary       ${requestData}                          interLATACarrier
  remove from dictionary        ${requestData}                          intraLATACarrier
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          referral=N
  remove from dictionary       ${requestData}                          srcEffDtTm
  set to dictionary        ${requestData}                          srcRecVersionId=${recVersionId}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=999
  ####  returns error 506002 when not removed
  remove from dictionary        ${requestData}                          tgtNum
  ###  NOT REQUIRED PARAMETERS
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          tmplDesc
  remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData}                          hldIndFlag
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          telco
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          conName
  remove from dictionary   ${requestData}                          conTel
  remove from dictionary   ${requestData}                          aos
  remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          priInterLT
  remove from dictionary   ${requestData}                          priIntraLT
  remove from dictionary   ${requestData}                          tmZn
  remove from dictionary   ${requestData}                          dayLightSavings
  remove from dictionary   ${requestData}                          tgtRecVersionId
  remove from dictionary   ${requestData}                          asyncId
  #remove from dictionary   ${requestData}                          endInterceptDt
  remove from dictionary   ${requestData}                          overWriteTGT
  remove from dictionary   ${requestData["lbl"][0]}                lblType
  remove from dictionary   ${requestData["lbl"][0]}                lblName
  remove from dictionary   ${requestData["lbl"][0]}                lblVals
  remove from dictionary   ${requestData}                          numTermLine
  remove from dictionary   ${requestData["destNums"][0]}           forServOff
  remove from dictionary   ${requestData["destNums"][0]}           localServOff
  remove from dictionary   ${requestData}                          lbl
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  set Test variable        ${Expected_Error}   The Disconnect request cannot be processed as other Customer Records exist for the TFN between Source and Target.
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Post Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Disconnect Response
  set Test Variable      ${Q_index}               0
  #set Test Variable      ${TgtEffDtTm}            ${tgtEFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment        Wait until transitional
  ###############################################################################################################
  FOR     ${Index}      IN RANGE    1     15
       Sleep   1m
       ${responsedata}=             Do Number Query     ${token}    ${reservedTFN}     ${SuccessResponse}
       log                          ${responsedata}
       Convert to dictionary        ${responsedata}
       ${Query_Result}              get from dictionary   ${responsedata}                         queryResult
       log                          ${Query_Result}
       ${LstQuery_Result}=          get from list         ${Query_Result}                         0
       Convert to dictionary        ${LstQuery_Result}
       ${Number_Status}             get from dictionary   ${LstQuery_Result}                      status
       Run Keyword If               '${Number_Status}' == '${TRANSITIONAL}'             Exit For Loop
  END
  log                      ${Number_Status}
  should be equal          ${Number_Status}               ${TRANSITIONAL}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}         get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSC AC=S SHOULD ERROR 45 DAY RULE
  ###############################################################################################################
  ${token}=                get token
  ${GET_ACTION_URI}=       Set Variable            /v3/ip/num/tfn/update
  ${shrtNotes}=            Set Variable           HELLO WORLD
  ${conPhone}=             Set Variable           9089565118
  ${status}=               Set Variable           SPARE
  ${ctrlRespOrgId}=        Set Variable           BRSMS
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData["tfNumList"][0]}             recVersionId=${Q_recVersionId}
  set to dictionary        ${requestData["tfNumList"][0]}             num=${reservedTFN}
  set to dictionary        ${requestData}                             shrtNotes=${shrtNotes}
  set to dictionary        ${requestData}                             conPhone=${conPhone}
  set to dictionary        ${requestData}                             status=${status}
  set to dictionary        ${requestData}                             ctrlRespOrgId=${ctrlRespOrgId}
  remove from dictionary   ${requestData}                             conName
  remove from dictionary   ${requestData}                             email
  remove from dictionary   ${requestData}                             requestDesc
  remove from dictionary   ${requestData}                             asyncId
  remove from dictionary   ${requestData}                             resUntilDt
  remove from dictionary   ${requestData}                             asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Number Update Response
  set Test variable        ${Expected_Error}   Toll-Free Number requested has not completed the required 45 day aging period.
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}         get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}







Spare_one_Reserved_TFN_Automation
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUML="${reservedTFN}";
  ...      RSP-NSC:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUML=${reservedTFN}
  [Tags]     REGRESSION   NA    Reserve  Spare  Automation
  #Pass Execution    Work in Progress.
  ${token}         get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
  set test variable     ${reservedTFN}
  ${numList}=             Create List            ${reservedTFN}
  #Append to List          ${numList}             8003569377
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  ${token}         get token
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  Parse Return Code   ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSC AC=S
  ###############################################################################################################
  ${token}                get token
  ${requestDesc}=         Set Variable            BRMGIU1BRSACEDSXXXEDS01OTFN798329BRSACNSC
  ${GET_ACTION_URI}=      Set Variable            /v3/ip/num/tfn/update
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData}                             requestDesc=${requestDesc}
  set to dictionary        ${requestData["tfNumList"][0]}             recVersionId=${Q_recVersionId}
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
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Number Update Response
  Parse Return Code   ${resp}        ${keyword}



Query_Several_TFN_Automation
  [Documentation]  Accept-Version = ${Accept-Version}
  ...      REQ-MNQ:,2008-01-09,12-00-48-EDT:::::ID=BRMGIU1,RO=BRSAC:QT=4:NUML="8002511000,8882511000,8772511000,8662511000";
  ...      RSP-MNQ:,2020-08-13,04-44-31-CST:::COMPLD,11::ID=BRMGIU1,RO=BRSAC:QT=00000004:NUM="8002511000 ",STAT="WORKING",
  ...      SE="11/19/93",CRO=ZATST:NUM="8882511000",STAT="WORKING",SE="09/04/98",CRO=ZATST:NUM="8772511000",STAT="WORKING",
  ...      SE="02/26/04",LACT="02/01/04",CRO=ZATST:NUM="8662511000 ",STAT="WORKING",SE="10/13/09",LACT="09/01/09",CRO=ZATST;
  [Tags]     REGRESSION  NA    Query  Automation
  #Pass Execution    Work in Progress.
  ${token}         get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
  set test variable     ${reservedTFN}
  ${numList}=             Create List            8002511000  8882511000  8772511000  8662511000  ${reservedTFN}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSC AC=S
  ###############################################################################################################
  ${token}                get token
  set test variable       ${token}
  ${requestDesc}=         Set Variable            BRMGIU1BRSACEDSXXXEDS01OTFN798329BRSACMNQ
  ${GET_ACTION_URI}=      Set Variable            /v3/ip/num/tfn/query
  ${requestData}=          evaluate               json.loads('''${NUM_SSCH_Data}''')       json
  set to dictionary        ${requestData}                             requestDesc=${requestDesc}
  set to dictionary        ${requestData}                             numList=${numList}
  remove from dictionary   ${requestData}                             asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}   ROID=${ROID}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Bulk MNQ Result
  set test variable       ${blkType}         mnq
  Sleep  1 minute
  Parse Return Code     ${resp}        ${keyword}
























Close_User_Session
  Close Session









*** Keywords ***





Parse Number Search Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         numList
  ${numList}=                   Get from Dictionary         ${dictionary_name}         numList
  ${x}=                         Get Length                  ${numList}
  FOR     ${Index}      IN RANGE    0     ${x}
         ${number}=     Get from list     ${numList}      ${Index}
  END
  set suite variable       ${number}


Parse Number Reserve Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         numList
  ${rsv_numList}=               Get from Dictionary         ${dictionary_name}         numList
  ${x}=                         Get Length                  ${rsv_numList}
  FOR     ${Index}      IN RANGE    0     ${x}
         ${rsv_number}=     Get from list     ${rsv_numList}      ${Index}
  END
  set suite variable       ${rsv_number}


Parse Number Update Response
  [Arguments]       ${dictionary_name}
  #Dictionary should contain key                             ${dictionary_name}         updateResult
  #${updateResult}=              Get from Dictionary         ${dictionary_name}         updateResult
  ${recVersionId}=              Get from Dictionary         ${dictionary_name}         recVersionId
  ${num}=                       Get from Dictionary         ${dictionary_name}         num


Parse Customer Record Query
  [Arguments]       ${dictionary_name}
  ${index}=                 set variable            ${Q_index}
  ${lstEffDtTms}            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${x}=                     get length              ${lstEffDtTms}
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${numStatus}              get from dictionary     ${dictionary_name}             numStatus
  ${lockStatus}             get from dictionary     ${dictionary_name}             lockStatus
  ${ctrlRespOrgId}          get from dictionary     ${dictionary_name}             ctrlRespOrgId
  ${CADStatus}              get from dictionary     ${lstEffDtTms[${index}]}       custRecStat
  #should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  should be equal           ${custRecCompPart}      ${key}
  ${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  #should be equal           ${effDtTm}              ${TgtEffDtTm}
  ${apprStat}               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  #should be equal           ${actionCode}           N
  ${Q_effDtTm}=             set variable            ${effDtTm}
  set global variable       ${Q_effDtTm}
  set test variable         ${recVersionId}



Parse Disconnect Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                     ${dictionary_name}             recVersionId
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${effDtTm}                get from dictionary     ${dictionary_name}             effDtTm




Parse ACNA List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                          ${dictionary_name}         acnaLst
  ${acnaLst}=                Get from Dictionary         ${dictionary_name}         acnaLst
  ${len_acnaLst}=            Get Length           ${acnaLst}
  set Suite Variable                ${acnaLst}
  set Test Variable                 ${acnaLst}


Parse CAG List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                          ${dictionary_name}         cicList
  ${cicList}=                Get from Dictionary         ${dictionary_name}         cicList
  ${cicCode}=                Get from Dictionary         ${cicList[0]}              cicCode
  set Test Variable                 ${cicCode}
  set Suite Variable                ${cicList}


Parse CIC List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         carrierLst
  ${carrierLst}=                Get from Dictionary         ${dictionary_name}         carrierLst
  set Suite Variable                ${carrierLst}

Parse CIS Record
  [Arguments]       ${dictionary_name}
  Log               ${dictionary_name}
  Dictionary should contain key                                   ${dictionary_name}         recVersionId
  ${recVersionId_CIS}=                Get from Dictionary         ${dictionary_name}         recVersionId
  Run Keyword If    '${acna}'=='OTC'           Parse OTC CIS Record         ${dictionary_name}
  ...               ELSE                       Parse Regular CIS Record     ${dictionary_name}
  set Test Variable                 ${recVersionId_CIS}

Parse OTC CIS Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                 ${dictionary_name}         otcPrmryCICRec
  ${otcPrmryCICRec}=                Get from Dictionary         ${dictionary_name}         otcPrmryCICRec
  ${cicCode}=                       Get from Dictionary         ${otcPrmryCICRec}          cicCode
  ${translation}=                   Get from Dictionary         ${otcPrmryCICRec}          translation
  ${status}=                        Get from Dictionary         ${otcPrmryCICRec}          status
  Dictionary should contain key                                 ${dictionary_name}         otcNtwrkIds
  ${otcNtwrkIds}=                   Get from Dictionary         ${dictionary_name}         otcNtwrkIds
  ${cicCode_net}=                   Get from Dictionary         ${otcNtwrkIds[0]}             cicCode
  ${netWrkId}=                      Get from Dictionary         ${otcNtwrkIds[0]}             netWrkId

Parse Regular CIS Record
  [Arguments]       ${dictionary_name}
  Get Primary CIC Rec      ${dictionary_name}
  ${secndryCICRec_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${dictionary_name}     secndryCICRec
  Run Keyword If    '${secndryCICRec_found}'=='True'            Get Second CIC Rec              ${dictionary_name}


Get Primary CIC Rec
   [Arguments]       ${dictionary_name}
   Dictionary should contain key                                 ${dictionary_name}         prmryCICRec
   ${prmryCICRec}=                Get from Dictionary            ${dictionary_name}         prmryCICRec
   ${cicCode}=                    Get from Dictionary            ${prmryCICRec}             cicCode
   ${translation}=                Get from Dictionary            ${prmryCICRec}             translation
   ${status}=                     Get from Dictionary            ${prmryCICRec}             status
   set Test Variable                 ${cicCode}

Get Second CIC Rec
   [Arguments]       ${dictionary_name}
   Dictionary should contain key                                ${dictionary_name}         secndryCICRec
   ${secndryCICRec}=                Get from Dictionary         ${dictionary_name}         secndryCICRec
   ${cicCode_sec}=                  Get from Dictionary         ${secndryCICRec[0]}        cicCode
   ${translation}=                  Get from Dictionary         ${secndryCICRec[0]}        translation
   ${status}=                       Get from Dictionary         ${secndryCICRec[0]}        status
   set Test Variable                 ${cicCode_sec}

Parse CCC Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         cccList
  ${cccList}=                   Get from Dictionary         ${dictionary_name}         cccList
  ${recVersionId_CCC}=          Get from Dictionary         ${cccList[0]}              recVersionId
  ${scpId}=                     Get from Dictionary         ${cccList[0]}              scpId
  ${cccStatus}=                 Get from Dictionary         ${cccList[0]}              cccStatus
  set Suite Variable                ${recVersionId_CCC}
  set test variable                 ${cccStatus}


Create Complex TR
  [Arguments]         ${token}       ${TmplName}     ${EFF_Date_Time}     ${cmd}      ${custrecstatus}    ${Appr_Status}      ${Carrier}
  ${respOrg}           get resporgid
  ${aosStateList}     create list     NJ
  ${aos}      create dictionary       aosState=${aosStateList}
  ${nodeSeq}      create list     lata     carrier     termNum
  set global variable         ${nodeSeq}
  ${lataLabelValues}      create list     ${validLataValue}
  ${lblElement}   create dictionary    lblType=LT     lblName=*lata   lblVals=${lataLabelValues}
  ${lbl}      create list    ${lblElement}
  ${nodeValues}   create list  *LATA     ${cicCode}   \#DIAL
  ...   OTHER       ${cicCode}    \#DIAL
  set global variable         ${nodeValues}
  ${noOfRows}     evaluate    2
  set global variable        ${noOfRows}
  ${noOfColumns}      get length   ${nodeSeq}
  set global variable        ${noOfColumns}
  ${nodes}    Get Nodes List   ${nodeSeq}    ${nodeValues}   ${noOfRows}    ${noOfColumns}
  set global variable         ${nodes}
  ${requestData}    evaluate    json.loads('''${ReqBody_Complex_TR_Create_Mandatory_Params}''')    json
  set to dictionary        ${requestData}                     tmplName=*${tmplName}
  set to dictionary        ${requestData}                     effDtTm=${EFF_Date_Time}
  set to dictionary        ${requestData}                     interLATACarrier=${Carrier}
  set to dictionary        ${requestData}                     intraLATACarrier=${Carrier}
  set to dictionary        ${requestData}                     aos=${aos}
  set to dictionary        ${requestData["cprSectName"][0]}   nodeSeq=${nodeSeq}
  set to dictionary        ${requestData["cprSectName"][0]}   nodes=${nodes}
  set to dictionary        ${requestData}                     lbl=${lbl}
  set to dictionary        ${requestData}                     cmd=${cmd}
  ${tmplDescription}      get from dictionary    ${requestData}   tmplDesc
  ${numTermLine}      get from dictionary     ${requestData}    numTermLine
  ${reqBody}=    evaluate    json.dumps(${requestData})    json
  log      ${reqBody}
  ${TAD_Create_URI}=       set variable           /v3/ip/cus/tpl
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
      # Create TR
  #${responseData}=    POST Method      ${token}     ${TAD_Create_URI}     ${reqBody}      ${SuccessResponse}
  ${resp}=        Post Request        endpoint       ${TAD_Create_URI}       data=${reqBody}        headers=${headers}
  ${keyword}=     set variable       Parse Template Record Response
  Parse Return Code   ${resp}        ${keyword}

  should not be empty        ${responsejsondata1}
  ${responseData}=            set variable       ${responsejsondata1}
  log   ${responseData}
  dictionary should contain key    ${responseData}    recVersionId
  ${recVersionId}     get from dictionary   ${responseData}   recVersionId
  dictionary should contain key    ${responseData}    tmplId
  ${tmplId}       get from dictionary     ${responseData}     tmplId
  set global variable     ${tmplId}
  dictionary should contain key    ${responseData}    effDtTm
  ${EFF_Date_Time}      get from dictionary     ${responseData}     effDtTm
      # TR View Validation
  ${crViewResponse}    GET Method With Sync Timeout   ${token}    ${TAD_retrieve_URI}%2A${tmplName}   ${SuccessResponse}   ${TAD_Create_URI}
  log   ${crViewResponse}
  ${aos}      get from dictionary     ${requestData}      aos
  ${nodeValuesExpected}   create list  *LATA    ${Carrier[0]}   \#DIAL
  ...   OTHER     ${Carrier[0]}    \#DIAL
  #...   *LATA    OTHER     ${Carrier[0]}   \#DIAL
  #...   OTHER    SU     ${Carrier[0]}     \#DIAL
  #...   OTHER    OTHER     ${Carrier[0]}     \#DIAL
  ${expectedNodes}    Get Nodes List   ${nodeSeq}    ${nodeValuesExpected}   ${noOfRows}    ${noOfColumns}
  ${cprMainSectionExpected}   create dictionary       name=MAIN     nodeSeq=${nodeSeq}      nodes=${expectedNodes}
  ${cprSectName}      create list     ${cprMainSectionExpected}
  set global variable             ${cprSectName}
  Validation for Complex TAD View Response     ${crViewResponse}      ${recVersionId}     ${respOrg}    ${tmplId}   ${EFF_Date_Time}
  ...  ${custrecstatus}    ${Appr_Status}    ${tmplRecCompPart_TAD_LAD_CPR}    ${PriorityStatus_N}     ${tmplDescription}   ${UAT_USER}
  ...  ${interLATACarrier}      ${intraLATACarrier}     ${numTermLine}    ${aos}    ${DayLightSavings_N}   ${TimeZone_C}    ${cprSectName}  ${DisconInd_N}
  [Return]        ${requestData}       ${recVersionId}
