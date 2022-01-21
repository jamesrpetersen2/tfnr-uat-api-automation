*** Settings ***
Documentation   This Suite Consists of API UAT Developer Resources (Involved RO Customer Record) - Test Cases
...             for developer resources documentation
Library     Collections
Library     String
Library     RequestsLibrary
Library     OperatingSystem
Resource    ./Track2_Keywords.robot
Resource    ./data_files/api/UAT_testdata.robot
#Test Setup         UserProfile Login                    ${API_User_Credentials_Track2}
#Test Teardown      Cleanup For Basic CAD Create         ${token}        ${TollFreeNumber}      ${effDateTm}
*** Variables ***


${HOST}                                     ${UAT_AWS_HOST}
${sand_Template}                            *LGBR-H3TEST
${recversionIDForCIS}
${status_code}                              200
${RESERVED}                                 RESERVED
${numDesc}                                  Invalid Number Included
${email}                                    jpetersen.ctr@somos.com
${cicCode}
${acna}
#${API_User_Credentials_for_UAT}               {"usrName": "${UAT_USER}","password": "${UAT_User_PASSWORD}","withPerm": true}
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



Customer_Record_Administration_Tests
  [Documentation]   Accept-Version = ${Accept-Version}
  ###############################################################################################################
  BuiltIn.Comment                CUSTOMER RECORD ADMINISTRATION
  ###############################################################################################################

Reserve_N_Numbers
  [Documentation]   Allows the SMS800 TFNRegistry user to reserve a TFN for Customer Record creation.
  ${token}=                get token
  ${oauthToken}=           set variable                   ${token}
  ${qty}=                  set variable                   3
  ${npa}=                  set variable                   833
  ${nxx}=                  set variable                   201
  ${line}=                 set variable                   1000
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${CR_v3_UCI}=            set variable                   /v3/ip/num/tfn/srchres/random
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
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
  remove from dictionary   ${requestData}                          npa
  remove from dictionary   ${requestData}                          shrtNotes
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}    Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}         headers=${headers}
  ${keyword}=     set variable       Parse Number Reserve Response
  Parse Return Code   ${resp}        ${keyword}
  Set Suite Variable       ${reservedTFN}    ${numList[0]}
  Set Suite Variable       ${numList}

Create_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to create a Customer Record for a given Toll-Free Number, Effective Date and Time.
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time1}=       get new future effective date and time         ${Date}         1
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0549
  ${intraLATACarrier}      create list                    0549
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${Create_CAD_Data}''')       json
  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time1}
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=999
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
  Log                 ${CAD_Created}
  Set Suite Variable       ${EFF_Date_Time1}

Retrieve_Customer_Record_to_View
  [Documentation]   Allows the SMS800 TFNRegistry user to retrieve a Customer Record for a given Number,
  ...               Effective Date and Time for the purpose of viewing/reading its content.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse Customer Record View
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Customer_Record_to_View_Non-Involved_RO
  set Test variable        ${Expected_Error}     User has no involvement with the customer record.
  ${ROID}=                 set variable                   ATX01
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse Customer Record View
  Parse Return Code   ${resp}        ${keyword}


Retrieve_Customer_Record_to_View_Part-Involved_RO
  set Test variable        ${Expected_Error}    User has no involvement with the customer record.
  ${ROID}=                 set variable                   BRCNA
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse Customer Record View
  Parse Return Code   ${resp}        ${keyword}


Create_Template_Record
  [Documentation]   This API allows the SMS800 TFNRegistry user to create a new Template record in the system to activate either immediately,
  ...                or at a future effective date and time.
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time}=        get new future effective date and time         ${Date}         1
  #${EFF_Date_Time}=        set variable                     NOW
  ${entity}=               get substring          ${ROID}           0     2
  ${mid}=                  get random string      3          [UPPER]
  ${tmplName}=             set variable                    ${entity}-${mid}3-TEST
  ${respOrg}=              get resporgid
  ${interLATACarrier}=     Create List                     NBI-0549
  ${intraLATACarrier}=     Create list                     NBI-0549
  ${tmplDesc}=             set variable                    API TEST TEMPLATE
  ${aosNetList}=           create list                     US
  ${aos}=                  create dictionary               aosNet=${aosNetList}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${Create_TAD_Data}''')       json
  set to dictionary        ${requestData}                          tmplName=*${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time}
  set to dictionary        ${requestData}                          tmplDesc=${tmplDesc}
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          aos=${aos}
  set to dictionary        ${requestData}                          numTermLine=999
  remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          lbl
  remove from dictionary   ${requestData}                          tmZn
  remove from dictionary   ${requestData}                          asyncId
  remove from dictionary   ${requestData}                          conTel
  remove from dictionary   ${requestData}                          conName
  remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData["aos"]}                   aosLbl
  remove from dictionary   ${requestData["aos"]}                   aosNPA
  remove from dictionary   ${requestData["aos"]}                   aosLATA
  remove from dictionary   ${requestData["aos"]}                   aosState
  remove from dictionary   ${requestData}                          dayLightSavings
  remove from dictionary   ${requestData}                          priIntraLT
  remove from dictionary   ${requestData}                          priInterLT
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Template Record Response
  Parse Return Code   ${resp}        ${keyword}
  Log                 ${TAD_Created}
  Set Suite Variable       ${tmplName}

Retrieve_Template_to_View
   [Documentation]   RespOrg LGT01 should be involved with Template.
   ${token}=                get token
   ${oauthToken}=           set variable           ${token}
   ${CR_V2_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}
   ${GET_ACTION_URI}=       set variable                   ${CR_V2_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse Template Information
   Parse Return Code   ${resp}        ${keyword}

Retrieve_Template_to_View_Non-Involved_RO
   [Documentation]   RespOrg ATX01 should not be involved with Template.
   set Test variable        ${Expected_Error}     User has no involvement with the Template Record.
   ${ROID}=                 set variable                ATX01
   ${token}=                get token
   ${oauthToken}=           set variable           ${token}
   ${CR_V2_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}
   ${GET_ACTION_URI}=       set variable                   ${CR_V2_UCI}
   Create Session           endpoint                       ${HOST}
   ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
   ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
   ${keyword}=     set variable       Parse Template Information
   Parse Return Code   ${resp}        ${keyword}

 Retrieve_Template_to_View_Part-Involved_RO
    [Documentation]   RespOrg BRCNA should be involved with Template via carrier NBI-0549.
    set Test variable        ${Expected_Error}     User has no involvement with the Template Record.
    ${ROID}=                 set variable                BRCNA
    ${token}=                get token
    ${oauthToken}=           set variable           ${token}
    ${CR_V2_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}
    ${GET_ACTION_URI}=       set variable                   ${CR_V2_UCI}
    Create Session           endpoint                       ${HOST}
    ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
    ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
    ${keyword}=     set variable       Parse Template Information
    Parse Return Code   ${resp}        ${keyword}



Close_User_Session
  Close Session









*** Keywords ***

Parse Return Code
  [Arguments]       ${response}    ${keyword_to_run}
  ${status}=                  set variable            ${response.status_code}
  ${responsejsondata1}=       run keyword if      ${status}==200        Process 200 Return Code    ${response}  ${keyword_to_run}
  ${responsejsondata2}=       run keyword if      ${status}==202        Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
  ${errorList}=               run keyword if      ${status}==400        Process 400 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==401        Process 401 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==403        Process 403 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==404        Process 404 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==409        Process 409 Return Code    ${response}


Process 200 Return Code
  [Arguments]       ${response}   ${keyword_to_run}
  ${responsejsondata1}=           To Json       ${response.content}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${responsejsondata1}     errList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${responsejsondata1}     errList
  Run Keyword If    '${err_found}'=='False'           ${keyword_to_run}               ${responsejsondata1}
  Log                  ${responsejsondata1}
  Set suite variable   ${responsejsondata1}
  [Return]             ${responsejsondata1}

Process 400 Return Code
  [Arguments]       ${response}
  ${errorList}=      To Json     ${response.content}
  Fail    400 Error Found
  [Return]             ${errorList}

Process 401 Return Code
  [Arguments]       ${response}
  ${errorList}=      To Json     ${response.content}
  Fail    401 Error Found
  [Return]             ${errorList}

Process 403 Return Code
  [Arguments]       ${response}
  ${errorList}=      To Json     ${response.content}
  Fail    403 Error Found
  [Return]             ${errorList}

Process 404 Return Code
  [Arguments]       ${response}
  ${errorList}=      To Json     ${response.content}
  Fail    404 Error Found
  [Return]             ${errorList}

Process 409 Return Code
  [Arguments]       ${response}
  ${errorList}=      To Json     ${response.content}
  Fail    409 Error Found
  [Return]             ${errorList}


Get MND response
  [Arguments]       ${token}    ${BulkId}
  sleep  ${SLEEP_FOUR}
  ${MND_Resp}=      Retrieve MND With Bulk ID      ${token}      ${MND_GET_URI}        ${BulkId}
  dictionary should contain key             ${MND_Resp}             disconnectResult
  ${Disc_result}=   get from dictionary     ${MND_Resp}             disconnectResult

Retrieve MND With Bulk ID
  [Arguments]    ${token}   ${MND_GET_URI}        ${Bulk_Id}
  ${MND_Resp1}     GET METHOD      ${token}      ${MND_GET_URI}/${BulkId}     ${SuccessResponse}
  log     ${MND_Resp1}
  ${err_status}=   run keyword and return status  dictionary should contain key     ${MND_Resp1}    errList
  ${err_found}     run keyword if    ${err_status}==True        Request In Progress Errcheck    ${MND_Resp1}
  sleep  ${SLEEP_FOUR}
  ${MND_Resp2}        run keyword if   ${err_found}==True    Retrieve MND With Bulk ID    ${token}     ${MND_GET_URI}        ${Bulk_Id}
  ${MND_Resp}     set variable if  ${err_status}==False        ${MND_Resp1}      ${MND_Resp2}
  [Return]    ${MND_Resp}

Parse Number Reserve Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                        ${dictionary_name}         numList
  ${numList}=              Get from Dictionary         ${dictionary_name}         numList
  Set Global Variable      ${numList}

Get Errors from dictionary
  [Arguments]       ${dictionary_name}   ${key}
  ${errList}=                Get from Dictionary         ${dictionary_name}         ${key}
  Should not be empty         ${errList}
  ${err_msg}=                Get from Dictionary         ${errList[0]}              errMsg
  ${err_code}=               Get from Dictionary         ${errList[0]}              errCode
  ${errLvl}=                 Get from Dictionary         ${errList[0]}              errLvl
  ${EEFound}=      run keyword and return status         Should be equal       ${err_msg}        ${Expected_Error}
  Pass Execution If          '${EEFound}'=='True'        Correct Error Returned
  Pass Execution If          '${errLvl}'=='WARN'         200 Warning Found
  Run Keyword If             '${errLvl}'=='ERROR'        Fail                       200 Error ${err_msg}




Parse MCC List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                          ${dictionary_name}         mccIdList
  ${mccIdList}=              Get from Dictionary         ${dictionary_name}         mccIdList
  ${mccId}=                  Get from List               ${mccIdList}               0
  set global variable        ${mccId}

Parse HPU List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                          ${dictionary_name}         entityList
  ${entityList}=             Get from Dictionary         ${dictionary_name}         entityList
  ${x}=                      Get Length                  ${entityList}
  #${ind}=                    Generate Random String        3                        01234
  ${ind}=                    evaluate                     ${x} - 1
  ${index}=                  Convert to integer           ${ind}
  ${entity}=                 Get from List                ${entityList}              ${index}
  set global variable        ${entity}

Parse MND Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                          ${dictionary_name}         blkId
  ${blkId}=                  Get from Dictionary         ${dictionary_name}         blkId
  Dictionary should contain key                          ${dictionary_name}         subDtTm
  ${subDtTm}=                Get from Dictionary         ${dictionary_name}         subDtTm
  Set Global Variable        ${MND_Resp_OK}              TRUE
  Set Global Variable        ${blkId}

Parse HPU Information
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                          ${dictionary_name}         recVersionId
  ${recVersionId}=              Get from Dictionary      ${dictionary_name}         recVersionId
  ${remainingHPUCnt}=           Get from Dictionary      ${dictionary_name}         remainingHPUCnt
  ${allowAll}=                  Get from Dictionary      ${dictionary_name}         allowAll
  ${allowedLoginIds}=           Get from Dictionary      ${dictionary_name}         allowedLoginIds
  ${loginId}=                   Get from Dictionary      ${allowedLoginIds[0]}      loginId
  ${isAdmin}=                   Get from Dictionary      ${allowedLoginIds[0]}      isAdmin


Parse TAL List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                              ${dictionary_name}         respOrgEntList
  ${respOrgEntList}=             Get from Dictionary         ${dictionary_name}         respOrgEntList
  ${x}=                          Get Length                  ${respOrgEntList}
  ${last}=                       Evaluate                    ${x} - 1
  ${mid}=                        evaluate                    ${x} / 2
  ${entityLast}=                 Get from List               ${respOrgEntList}          ${last}
  ${entityMid}=                  Get from List               ${respOrgEntList}          ${mid}
  ${entityfirst}=                Get from List               ${respOrgEntList}              0
  set global variable            ${entityfirst}
  set global variable            ${entityLast}
  set global variable            ${entityMid}

Parse TAL Information
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                              ${dictionary_name}         recVersionId
  ${recVersionId}=               Get from Dictionary         ${dictionary_name}         recVersionId
  Dictionary should contain key                              ${dictionary_name}         maxRtngTmpl
  ${maxRtngTmpl}=                Get from Dictionary         ${dictionary_name}         maxRtngTmpl
  Dictionary should contain key                              ${dictionary_name}         curRtngTmpl
  ${curRtngTmpl}=                Get from Dictionary         ${dictionary_name}         curRtngTmpl
  Dictionary should contain key                              ${dictionary_name}         remRtngTmpl
  ${remRtngTmpl}=                Get from Dictionary         ${dictionary_name}         remRtngTmpl
  Dictionary should contain key                              ${dictionary_name}         manualOverride
  ${manualOverride}=             Get from Dictionary         ${dictionary_name}         manualOverride




Parse Immediate Validation Results
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                              ${dictionary_name}         effDtTm
  ${effDtTm}=                  Get from Dictionary           ${dictionary_name}         effDtTm
  ${custRecStat}=              Get from Dictionary           ${dictionary_name}         custRecStat
  ${valResult}=                Get from Dictionary           ${dictionary_name}         valResult
  ${lstEffDtTm}=               Get from Dictionary           ${dictionary_name}         lstEffDtTm
  ${x}=                        Get Length                    ${lstEffDtTm}
  :FOR     ${Index}      IN RANGE    0     ${x}
  \        ${sI}=                      Convert to String       ${Index}
  \        ${effDtTm}=            Get From Dictionary     ${lstEffDtTm[${Index}]}     effDtTm
  \        ${custRecStat}=        Get from Dictionary     ${lstEffDtTm[${Index}]}     custRecStat
  \        ${actionCode}=         Get from Dictionary     ${lstEffDtTm[${Index}]}     actionCode


Parse MCC Information
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                          ${dictionary_name}         recVersionId
  ${recVersionId}=              Get from Dictionary      ${dictionary_name}         recVersionId
  Dictionary should contain key                          ${dictionary_name}         cciInfo
  ${cciInfo}=                   Get from Dictionary      ${dictionary_name}         cciInfo
  ${respOrgId}=                 Get from Dictionary      ${cciInfo[0]}              respOrgId
  ${oldCICCode}=                Get from Dictionary      ${cciInfo[0]}              oldCICCode
  ${newCICCode}=                Get from Dictionary      ${cciInfo[0]}              newCICCode

Parse Customer Record Delete
  [Arguments]       ${dictionary_name}
  No Operation
  #${num}=                    get from dictionary     ${dictionary_name}             num
  #${effDtTm}=                get from dictionary     ${dictionary_name}             effDtTm
  #should be equal            ${effDtTm}              ${TgtEffDtTm}

Parse Lock Response
  [Arguments]       ${dictionary_name}   ${key}
  ${preface}=       Convert to Lower Case     ${key}
  ${preface}=       Set Variable if      '${key}'=='ALL'      copy     ${preface}
  Dictionary should contain key       ${dictionary_name}      ${preface}Status
  Dictionary should contain key       ${dictionary_name}      recVersionId

Parse Copy Record Response
  [Arguments]       ${dictionary_name}   ${TgtEffDtTm}
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${effDtTm}                get from dictionary     ${dictionary_name}             effDtTm
  should be equal           ${effDtTm}        ${TgtEffDtTm}

Parse Transfer Record Response
  [Arguments]       ${dictionary_name}   ${TgtEffDtTm}
  ${effDtTm}                   get from dictionary     ${dictionary_name}             effDtTm
    should be equal           ${effDtTm}        ${TgtEffDtTm}
  ${srcRecVersionId}           get from dictionary     ${dictionary_name}             srcRecVersionId
  #${tgtRecVersionId}           get from dictionary     ${dictionary_name}             tgtRecVersionId

Parse Conversion Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key       ${dictionary_name}      recVersionId
  ${recVersionId}=                    get from dictionary     ${dictionary_name}             recVersionId
  Dictionary should contain key       ${dictionary_name}      effDtTm
  ${effDtTm}=                         get from dictionary     ${dictionary_name}             effDtTm
  set global variable                 ${Q_effDtTm}            ${effDtTm}



Parse Customer Record Response
  [Arguments]       ${dictionary_name}
  ${index}=                 set variable            0
  ${lstEffDtTms}            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${custRecEntity}          get from dictionary     ${dictionary_name}             custRecEntity
  ${CADStatus}              get from dictionary     ${lstEffDtTms[${index}]}       custRecStat
  should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  should be equal           ${custRecCompPart}      CAD
  ${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  ${apprStat}               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  should be equal           ${actionCode}           N
  Set Global Variable       ${recVersionId}
  Set Global Variable       ${CAD_Created}          TRUE

Parse Pointer Record Response
  [Arguments]       ${dictionary_name}
  ${index}=                 set variable            0
  ${lstEffDtTms}            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${x}=                     get length              ${lstEffDtTms}
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${num}                    get from dictionary     ${dictionary_name}             num
  ${CADStatus}              get from dictionary     ${lstEffDtTms[${index}]}       custRecStat
  should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  should be equal           ${custRecCompPart}      PAD
  ${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  ${apprStat}               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  should be equal           ${actionCode}           N
  Set Global Variable       ${PAD_Created}          TRUE


Parse Customer Record Query
  [Arguments]       ${dictionary_name}    ${TgtEffDtTm}    ${key}     ${index}
  ${lstEffDtTms}            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${x}=                     get length              ${lstEffDtTms}
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${numStatus}              get from dictionary     ${dictionary_name}             numStatus
  ${lockStatus}             get from dictionary     ${dictionary_name}             lockStatus
  ${ctrlRespOrgId}          get from dictionary     ${dictionary_name}             ctrlRespOrgId
  ${CADStatus}              get from dictionary     ${lstEffDtTms[${index}]}       custRecStat
  should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  should be equal           ${custRecCompPart}      ${key}
  ${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  #should be equal           ${effDtTm}              ${TgtEffDtTm}
  ${apprStat}               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  ${last}=                  evaluate            ${x} - 1
  ${Last_effDtTm}=            get from dictionary     ${lstEffDtTms[${last}]}       effDtTm
  ${Q_effDtTm}=             set variable            ${Last_effDtTm}
  set global variable       ${Q_effDtTm}
  set global variable       ${recVersionId}


Parse Customer Record View
  [Arguments]       ${dictionary_name}
  ${index}=                  set variable             0
  ${lstEffDtTms}=            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${recVersionId}=           get from dictionary     ${dictionary_name}             recVersionId
  ${numStatus}=              get from dictionary     ${dictionary_name}             numStatus
  should be equal           ${numStatus}            ASSIGNED
  ${ctrlRespOrgId}=          get from dictionary     ${dictionary_name}             ctrlRespOrgId
  ${lastUsr}=                get from dictionary     ${dictionary_name}             lastUsr
  ${interLATACarrier}=       get from dictionary     ${dictionary_name}             interLATACarrier
  ${intraLATACarrier}=       get from dictionary     ${dictionary_name}             intraLATACarrier
  ${conName}=                get from dictionary     ${dictionary_name}             conName
  ${conTel}=                 get from dictionary     ${dictionary_name}             conTel
  ${aos}=                    get from dictionary     ${dictionary_name}             aos
  ${telco}=                  get from dictionary     ${dictionary_name}             telco
  ${CADStatus}=              get from dictionary     ${lstEffDtTms[${index}]}       custRecStat
  should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}=        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  should be equal           ${custRecCompPart}      CAD
  ${effDtTm}=                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  ${apprStat}=               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}=             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  Set Global Variable        ${recVersionId}

Parse Pointer Record View
  [Arguments]       ${dictionary_name}
  ${index}=                  set variable             0
  ${lstEffDtTms}=            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${recVersionId}=           get from dictionary     ${dictionary_name}             recVersionId
  ${numStatus}=              get from dictionary     ${dictionary_name}             numStatus
  should be equal           ${numStatus}            ASSIGNED
  ${ctrlRespOrgId}=          get from dictionary     ${dictionary_name}             ctrlRespOrgId
  ${lastUsr}=                get from dictionary     ${dictionary_name}             lastUsr
  ${telco}=                  get from dictionary     ${dictionary_name}             telco
  ${CADStatus}=              get from dictionary     ${lstEffDtTms[${index}]}       custRecStat
  should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}=        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  should be equal           ${custRecCompPart}      PAD
  ${effDtTm}=                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  ${apprStat}=               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}=             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  Set Global Variable        ${recVersionId}

Parse Template Record Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                     ${dictionary_name}             recVersionId
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  Dictionary should contain key                     ${dictionary_name}             tmplId
  ${tmplId}                 get from dictionary     ${dictionary_name}             tmplId
  Dictionary should contain key                     ${dictionary_name}             effDtTm
  ${tmplId}                 get from dictionary     ${dictionary_name}             effDtTm
  Set Global Variable       ${TAD_Created}          TRUE

Parse Template Copy Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                     ${dictionary_name}             recVersionId
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  Dictionary should contain key                     ${dictionary_name}             effDtTm
  ${tmplId}                 get from dictionary     ${dictionary_name}             effDtTm


Parse Template Disconnect Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                     ${dictionary_name}             recVersionId
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  Dictionary should contain key                     ${dictionary_name}             effDtTm
  ${tmplId}                 get from dictionary     ${dictionary_name}             effDtTm


Parse Template Information
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                     ${dictionary_name}             recVersionId
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  Dictionary should contain key                     ${dictionary_name}             ctrlRespOrgId
  ${ctrlRespOrgId}          get from dictionary     ${dictionary_name}             ctrlRespOrgId
  Dictionary should contain key                     ${dictionary_name}             tmplId
  ${tmplId}                 get from dictionary     ${dictionary_name}             tmplId
  ${lstEffDtTms}            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${Status}                 get from dictionary     ${lstEffDtTms[0]}              tmplRecStat
  ${effDtTm}                get from dictionary     ${lstEffDtTms[0]}              effDtTm
  ${tmplRecCompPart}        get from dictionary     ${lstEffDtTms[0]}              tmplRecCompPart
  Set global variable       ${tmplRecCompPart}
  Set Global Variable       ${recVersionId}
  Set Global Variable       ${effDtTm}
