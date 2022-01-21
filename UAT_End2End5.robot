*** Settings ***
Documentation   This Suite Consists of API UAT Developer Resources (Customer Record) - Test Cases
...             for developer resources documentation
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
${sand_Template}                            *LLBR-H3TEST
${recversionIDForCIS}
${status_code}                              200
${RESERVED}                                 RESERVED
${numDesc}                                  Invalid Number Included
${email}                                    jpetersen.ctr@somos.com
${cicCode}
${acna}
${API_Admin_User_Credentials_for_UAT_AWS}     {"usrName": "${UAT_AWS_Admin_USER}","password": "${UAT_AWS_Admin_PASSWORD}","withPerm": true}
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
${Lock_TAD_Data}                               {"srcTmplName": "string","srcEffDtTm": "string","tgtTmplName": "string","tgtEffDtTm": "string","tgtNum": "string","tmplRecCompPart": "TAD","custRecAction": "COPY","asyncId": "string","overWriteTGT": "Y"}
${unLock_TAD_Data}                             {"tmplName": "string","effDtTm": "string","asyncId": "string"}





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


Customer_Record_Administration
  [Documentation]  Accept-Version = ${Accept-Version}
  ###############################################################################################################
  BuiltIn.Comment                CUSTOMER RECORD ADMINISTRATION
  ###############################################################################################################

Reserve_a_Number
  [Documentation]   Allows the SMS800 TFNRegistry user to reserve a TFN for Customer Record creation.
  [Tags]     REGRESSION  NA    Query  Reserve
  ${token}=                get token
  ${oauthToken}=           set variable                   ${token}
  #${ROID}=                 set variable                   LGT01
  ${qty}=                  set variable                   2
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
  #remove from dictionary   ${requestData}                          npa
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
  [Tags]     REGRESSION  CUS   CAD Create
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  #${EFF_Date_Time}         Future Effective Date and Time
  ${Date}=                 get current date
  ${EFF_Date_Time1}=       get new future effective date and time         ${Date}         1
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
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

  Set Suite Variable      ${EFF_Date_Time1}

Lock_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to lock a Customer Record.
  [Tags]     REGRESSION  CUS   CAD Create  Lock
  ${Date}=                 get current date
  ${newEFF_Date_Time}=     get new future effective date and time         ${Date}         2
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/lock
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${lockType}=             set Variable                   ALL
  ${requestData}=          evaluate               json.loads('''${Lock_CAD_Data}''')       json
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          srcEffDtTm=${EFF_Date_Time1}
  set to dictionary        ${requestData}                          tgtNum=${reservedTFN}
  set to dictionary        ${requestData}                          tgtEffDtTm=${newEFF_Date_Time}
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          custRecAction=${lockType}
  set to dictionary        ${requestData}                          overWriteTGT=Y
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Lock Response
  Parse Return Code   ${resp}        ${keyword}

Unlock_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to unlock a Customer Record.
  [Tags]     REGRESSION  CUS   CAD Create  Unlock
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/unlock
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${unLock_CAD_Data}''')       json
  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time1}
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Unlock Response
  Parse Return Code   ${resp}        ${keyword}



Query_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to query a Customer Record for a given Toll-Free Number, Effective Date and Time.
  [Tags]     REGRESSION  CUS  CAD Query
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}

  #Run Keyword If    '${err_found}'=='False'         Parse Customer Record Query     ${responsejsondata1}     ${EFF_Date_Time1}       CAD    0

Retrieve_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to retrieve a Customer Record for a given Number, Effective Date and Time for the purpose of viewing/reading its content.
  [Tags]     REGRESSION  CUS   CAD Retrieve
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record View
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}

Update_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to update a Customer Record for a given Number, Effective Date and Time.
  [Tags]     REGRESSION  CUS   CAD Update  Query
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment           Update PENDING CAD
  ###############################################################################################################
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${telco}                 Get Telco                      ${token}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  #BuiltIn.Comment          CAUSE ERROR CODE 599057
  #${interLATACarrier}      create list                    0555  0022
  #${intraLATACarrier}      create list                    0555  0022
  ${requestData}=          evaluate               json.loads('''${Create_CAD_Data}''')       json

  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time1}
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData}                          onAccCust=BROPR
  set to dictionary        ${requestData}                          notes=UPDATED CAD
  set to dictionary        ${requestData}                          recVersionId=${recVersionId}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=999
  remove from dictionary   ${requestData}                          newRespOrgId
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  #remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          endInterceptDt
  remove from dictionary   ${requestData}                          asyncId
  #remove from dictionary   ${requestData}                          suppFormNum
  #remove from dictionary   ${requestData}                          suppFormNum
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Response
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   CAD
  Parse Return Code   ${resp}        ${keyword}


Copy_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to Copy a Customer Record.
  [Tags]     REGRESSION  CUS   CAD Copy  Query
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${cr_type}=              set variable                   CAD
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment           COPY PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/copy
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${Date}=                 get current date
  ${EFF_Date_Time2}=       get new future effective date and time         ${Date}         2
  Set suite variable       ${EFF_Date_Time2}
  ${requestData}=          evaluate               json.loads('''${Copy_CAD_Data}''')       json
  ###  REQUIRED PARAMETERS
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          tgtEffDtTm=${EFF_Date_Time2}
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          svcOrderNum=U559
  set to dictionary        ${requestData}                          notes=COPIED CR
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          srcRecVersionId=${recVersionId}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=999
  ####  returns error 506002 when not removed
  set to dictionary        ${requestData}                          tgtNum=8003218888
  ###  NOT REQUIRED PARAMETERS
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          srcEffDtTm
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
  remove from dictionary   ${requestData}                          overWriteTGT
  remove from dictionary   ${requestData["lbl"][0]}                lblType
  remove from dictionary   ${requestData["lbl"][0]}                lblName
  remove from dictionary   ${requestData["lbl"][0]}                lblVals
  remove from dictionary   ${requestData}                          numTermLine
  remove from dictionary   ${requestData["destNums"][0]}           forServOff
  remove from dictionary   ${requestData["destNums"][0]}           localServOff
  remove from dictionary   ${requestData}                          lbl
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Copy Record Response
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  Parse Return Code      ${resp}        ${keyword}


Transfer_Customer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to Transfer a Customer Record.
  [Tags]     REGRESSION  CUS   CAD Transfer    Query
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}            Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               1
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time2}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment           TRANSFER PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/transfer
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${Date}=                 get current date
  ${srcEFF_Date_Time}=     get new future effective date and time         ${Date}         2
  ${tgtEFF_Date_Time}=     get new future effective date and time         ${Date}         3
  ${EFF_Date_Time3}=       set variable                                   ${tgtEFF_Date_Time}
  Set suite variable       ${EFF_Date_Time3}
  ${requestData}=          evaluate               json.loads('''${Transfer_CAD_Data}''')       json
  ###  REQUIRED PARAMETERS
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          tgtEffDtTm=${tgtEFF_Date_Time}
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          svcOrderNum=U559
  set to dictionary        ${requestData}                          notes=TRANSFERED CR
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          srcEffDtTm=${srcEFF_Date_Time}
  set to dictionary        ${requestData}                          srcRecVersionId=${recVersionId}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=999
  ####  returns error 506002 when not removed
  set to dictionary        ${requestData}                          tgtNum=8003218888
  ###  NOT REQUIRED PARAMETERS
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tgtTmplName
  #remove from dictionary   ${requestData}                          srcEffDtTm
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
  remove from dictionary   ${requestData}                          overWriteTGT
  remove from dictionary   ${requestData}                          referral
  remove from dictionary   ${requestData}                          endInterceptDt
  remove from dictionary   ${requestData["lbl"][0]}                lblType
  remove from dictionary   ${requestData["lbl"][0]}                lblName
  remove from dictionary   ${requestData["lbl"][0]}                lblVals
  remove from dictionary   ${requestData}                          numTermLine
  remove from dictionary   ${requestData["destNums"][0]}           forServOff
  remove from dictionary   ${requestData["destNums"][0]}           localServOff
  remove from dictionary   ${requestData}                          lbl
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}             Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Transfer Record Response
  set Test Variable      ${Q_index}               1
  set Test Variable      ${TgtEffDtTm}            ${tgtEFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}

Disconnect_Customer_Record_Producing_Error
  [Documentation]   Allows the SMS800 TFNRegistry user to Disconnect a Customer Record.
  ...            The Disconnect request cannot be processed as other Customer Records exist for the TFN between Source and Target.
  [Tags]     REGRESSION  CUS   CAD Disconnect   Query
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD
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
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment           DISCONNECT PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/disconnect
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${interLATACarrier}      create list                    0555
  ${intraLATACarrier}      create list                    0555
  ${Date}=                 get current date
  ${srcEFF_Date_Time}=     get new future effective date and time         ${Date}         1
  ${tgtEFF_Date_Time}=     get new future effective date and time         ${Date}         4
  ${requestData}=          evaluate               json.loads('''${Disconnect_CAD_Data}''')       json
  ###  REQUIRED PARAMETERS
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          tgtEffDtTm=${tgtEFF_Date_Time}
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          svcOrderNum=U559
  set to dictionary        ${requestData}                          notes=COPIED CR
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          custRecCompPart=CAD
  set to dictionary        ${requestData}                          referral=N
  set to dictionary        ${requestData}                          srcEffDtTm=${srcEFF_Date_Time}
  set to dictionary        ${requestData}                          srcRecVersionId=${recVersionId}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=999
  ####  returns error 506002 when not removed
  set to dictionary        ${requestData}                          tgtNum=8003218888
  ###  NOT REQUIRED PARAMETERS
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tgtTmplName
  #remove from dictionary   ${requestData}                          srcEffDtTm
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
  remove from dictionary   ${requestData}                          endInterceptDt
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
  ${keyword}=     set variable       Parse Transfer Record Response
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${tgtEFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}








Retrieve_Immediate_Validation_Results_with_Number_CAD
  [Documentation]   Allows the SMS800 TFNRegistry user to retrieve Immediate Validation Results
  ...               for the Customer Record that was submitted for validation from the system.
  [Tags]     REGRESSION  CUS   CAD  IVR
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ivr/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Immediate Validation Results
  #set Test Variable      ${Q_index}               0
  #set Test Variable      ${TgtEffDtTm}            ${tgtEFF_Date_Time}
  #set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}



Delete_Customer_Record_1
  [Documentation]   Allows the SMS800 TFNRegistry user to delete a Customer Record for a given Number, Effective Date and Time.
  [Tags]     REGRESSION  CUS   CAD Delete  Query
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               1
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time3}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment           DELETE PENDING CAD
  ##############################################################################################################
  ${mod_effDate}=          evaluate                       '${Q_effDtTm}'.replace('-','')
  ${effDateT}=             Evaluate                       '${mod_effDate}'.replace(':','')
  ${effDate}=              set variable                   ${effDateT}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}


Delete_Customer_Record_0
  [Documentation]   Allows the SMS800 TFNRegistry user to delete a Customer Record for a given Number, Effective Date and Time.
  [Tags]     REGRESSION  CUS   CAD Delete   Query
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING CAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   CAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}


  ###############################################################################################################
  BuiltIn.Comment           DELETE PENDING CAD
  ##############################################################################################################
  ${mod_effDate}=          evaluate                       '${Q_effDtTm}'.replace('-','')
  ${effDateT}=             Evaluate                       '${mod_effDate}'.replace(':','')
  ${effDate}=              set variable                   ${effDateT}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}



List_Mass_Carrier_Change_Information
  [Documentation]   Allows the SMS800 TFNRegistry user to retrieve Mass Carrier Change Information list.
  [Tags]     REGRESSION  CUS   CCI
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/cci/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse MCC List
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Mass_Carrier_Change_Information
  [Documentation]   Allows the SMS800 TFNRegistry user to retrieve any existing Mass Carrier Change Information using MCCID.
  [Tags]     REGRESSION  CUS   CCI   MCC
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/cci/mccId/${mccId}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse MCC Information
  Parse Return Code   ${resp}        ${keyword}

List_High_Priority_Updates
  [Documentation]   Allows the SMS800 TFNRegistry user to fetch the list of keys for High Priority Customer Record Updates.
  [Tags]     REGRESSION  CUS   HPU List
  Set test variable      ${Expected_Error}   High Priority CR Updates List data does not exist.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/hpu/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse HPU List
  Parse Return Code   ${resp}        ${keyword}

Retrieve_High_Priority_Update_Information
  [Documentation]   Allows the SMS800 TFNRegistry user to retrieve High Priority Update Information.
  [Tags]     REGRESSION  CUS   HPU Retrieve
  Set test variable      ${Expected_Error}    Record does not exist.
  ${token}=                get token
  ${entity}=               set variable                   BR
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/hpu/entity/${entity}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${ROID}=                 set variable                   BROPR
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse HPU Information
  Parse Return Code   ${resp}        ${keyword}




Reserve_a_Number_for_Pointer
  [Documentation]   Allows the SMS800 TFNRegistry user to reserve a TFN for Customer Record creation.
  [Tags]     REGRESSION  CUS   PAD Create
  Log                      ${ROID}
  ${token}=                get token
  ${oauthToken}=           set variable                   ${token}
  Set test variable      ${Expected_Error}   While you have permissions for this TFN, you have selected the wrong Acting As Resp Org. Please select the following Resp Org to continue: LGT01.
  #${ROID}=                 set variable                   LGT01
  ${qty}=                  set variable                   5
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
  #remove from dictionary   ${requestData}                          npa
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

  ###############################################################################################################
  BuiltIn.Comment           POINTER RECORD OPERATIONS
  ##############################################################################################################

Create_Pointer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to create a Pointer Record in the system to activate service
  ...  for a given RESERVED or TRANSITIONAL Toll-Free Number, either immediately, or at a future effective date and time.
  [Tags]     REGRESSION  CUS   PAD Create
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time}=        get new future effective date and time         ${Date}         1
  #${tgtEFF_Date_Time}=     get new future effective date and time         ${Date}         10
  #${EFF_Date_Time}         Future Effective Date and Time
  ${telco}                 Get Telco                      ${token}
  ${sand_Template}=        set variable                   *LGBR-H3TEST
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${Create_PAD_Data}''')       json

  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time}
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          conName=PETERSEN
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData}                          svcOrderNum=P12345
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData}                          newRespOrgId=LGT01
  set to dictionary        ${requestData}                          tmplName=${sand_Template}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=99
  #remove from dictionary   ${requestData}                          newRespOrgId
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData["destNums"][0]}           forServOff
  remove from dictionary   ${requestData["destNums"][0]}           localServOff
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Pointer Record Response
  Parse Return Code   ${resp}        ${keyword}

  Set Suite Variable      ${EFF_Date_Time}

Lock_Pointer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to Lock a Pointer Record.
  [Tags]     REGRESSION  CUS   PAD Create  Lock
  ${Date}=                 get current date
  ${newEFF_Date_Time}=     get new future effective date and time         ${Date}         5
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/lock
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${lockType}=             set Variable                   ALL
  ${requestData}=          evaluate               json.loads('''${Lock_PAD_Data}''')       json
  set to dictionary        ${requestData}                          srcNum=${reservedTFN}
  set to dictionary        ${requestData}                          tgtEffDtTm=${newEFF_Date_Time}
  set to dictionary        ${requestData}                          ptrRecAction=${lockType}
  remove from dictionary   ${requestData}                          srcEffDtTm
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}           Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Lock Response
  Parse Return Code   ${resp}        ${keyword}


Unlock_Pointer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to unlock a Pointer Record.
  [Tags]     REGRESSION  CUS   PAD Create   Unlock
  Set test variable      ${Expected_Error}   Unlock request cannot be processed as the TFN is not locked for Customer Record Updates.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/unlock
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${unLock_PAD_Data}''')       json
  set to dictionary        ${requestData}                          num=${reservedTFN}
  remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Unlock Response
  Parse Return Code   ${resp}        ${keyword}



Disconnect_Pointer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to disconnect a Pointer Record in the system to deactivate service.
  [Tags]     REGRESSION  CUS   PAD Disconnect
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING PAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}

  ${cr_type}=              set variable                   PAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}

  ###############################################################################################################
  BuiltIn.Comment           DISCONNECT PENDING PAD
  ###############################################################################################################
  Set test variable      ${Expected_Error}   While you have permissions for this TFN, you have selected the wrong Acting As Resp Org. Please select the following Resp Org to continue: LGT01.
  ${ROID}=                 set variable                   LGT01
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/disconnect
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  #${interLATACarrier}      create list                    0555
  #${intraLATACarrier}      create list                    0555
  ${Date}=                 get current date
  #${srcEFF_Date_Time}=     get new future effective date and time         ${Date}         41
  ${tgtEFF_Date_Time}=     get new future effective date and time         ${Date}         2
  ${requestData}=          evaluate               json.loads('''${Disconnect_PAD_Data}''')       json
  ###  REQUIRED PARAMETERS
  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          tgtEffDtTm=${tgtEFF_Date_Time}
  set to dictionary        ${requestData}                          cmd=U
  #set to dictionary        ${requestData}                          svcOrderNum=U559
  #set to dictionary        ${requestData}                          notes=COPIED CR
  set to dictionary        ${requestData}                          custRecCompPart=PAD
  set to dictionary        ${requestData}                          referral=N
  #set to dictionary        ${requestData}                          srcEffDtTm=${srcEFF_Date_Time}
  set to dictionary        ${requestData}                          recVersionId=${recVersionId}
  #set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  #set to dictionary        ${requestData["destNums"][0]}           numTermLine=999
  ####  returns error 506002 when not removed
  #set to dictionary        ${requestData}                          tgtNum=8003218888
  ###  NOT REQUIRED PARAMETERS
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          tmplName
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          srcEffDtTm
  remove from dictionary   ${requestData}                          tmplDesc
  remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData}                          svcOrderNum
  remove from dictionary   ${requestData}                          notes
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
  #remove from dictionary   ${requestData}                          recVersionId
  remove from dictionary   ${requestData}                          asyncId
  remove from dictionary   ${requestData}                          endInterceptDt
  remove from dictionary   ${requestData}                          overWriteTGT
  #remove from dictionary   ${requestData}                          numTermLine
  remove from dictionary   ${requestData["destNums"][0]}           destNum
  remove from dictionary   ${requestData["destNums"][0]}           numTermLine
  remove from dictionary   ${requestData["destNums"][0]}           forServOff
  remove from dictionary   ${requestData["destNums"][0]}           localServOff
  remove from dictionary   ${requestData}                          destNums
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Post Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  set test variable        ${Disconnect_Pointer}        True
  ${keyword}=     set variable       Parse Disconnect Pointer Record Response
  Parse Return Code   ${resp}        ${keyword}

Query_a_Pointer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to Query a Pointer Record.
  [Tags]     REGRESSION  CUS   PAD Create   Query
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING PAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   PAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}



Retrieve_a_Pointer_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to Retrieve Pointer Record Information.
  [Tags]     REGRESSION  CUS   PAD Retrieve
  Set test variable      ${Expected_Error}   User has no involvement with the customer record.
  ${ROID}=                 set variable                   LGT01
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record View
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   PAD
  Parse Return Code   ${resp}        ${keyword}



Retrieve_Immediate_Validation_Results_with_Number_PAD
  [Documentation]   Allows the SMS800 TFNRegistry user to retrieve Immediate Validation Results
  ...               for the Customer Record that was submitted for validation from the system.
  [Tags]     REGRESSION  CUS   PAD Create   IVR
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ivr/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}      Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Immediate Validation Results
  #set Test Variable      ${Q_index}               0
  #set Test Variable      ${TgtEffDtTm}            ${tgtEFF_Date_Time}
  #set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}

Delete_Pointer_Record_Success
  [Tags]     REGRESSION  CUS   PAD Delete
  Builtin.Comment      Create PAD to Delete
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time}=        get new future effective date and time         ${Date}         1
  #${tgtEFF_Date_Time}=     get new future effective date and time         ${Date}         10
  #${EFF_Date_Time}         Future Effective Date and Time
  ${telco}                 Get Telco                      ${token}
  ${sand_Template}=        set variable                   *LGBR-H3TEST
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${reservedTFN}=          set variable                   ${numList[2]}

  ${requestData}=          evaluate               json.loads('''${Create_PAD_Data}''')       json

  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time}
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          conName=PETERSEN
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData}                          svcOrderNum=P12345
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData}                          newRespOrgId=LGT01
  set to dictionary        ${requestData}                          tmplName=${sand_Template}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reservedTFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=99
  #remove from dictionary   ${requestData}                          newRespOrgId
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData["destNums"][0]}           forServOff
  remove from dictionary   ${requestData["destNums"][0]}           localServOff
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Pointer Record Response
  Parse Return Code   ${resp}        ${keyword}
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}     Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   PAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}


  ###############################################################################################################
  BuiltIn.Comment           DELETE PENDING PAD
  ##############################################################################################################
  ${ROID}=                 set variable                   LGT01
  ${mod_effDate}=          evaluate                       '${Q_effDtTm}'.replace('-','')
  ${effDateT}=             evaluate                       '${mod_effDate}'.replace(':','')
  ${effDate}=              set variable                   ${effDateT}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}





Delete_Pointer_Record_Producing_Error
  [Documentation]   Allows the SMS800 TFNRegistry user to delete a PENDING Pointer Record.
  [Tags]     REGRESSION  CUS   PAD Delete   Query
  ###############################################################################################################
  BuiltIn.Comment           QUERY PENDING PAD
  ###############################################################################################################
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/query/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}     Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${cr_type}=              set variable                   PAD
  ${keyword}=     set variable       Parse Customer Record Query
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}


  ###############################################################################################################
  BuiltIn.Comment           DELETE PENDING PAD
  ##############################################################################################################
  #set Test variable        ${Expected_Error}   The Delete request cannot be processed. All the future Pointer Records must be deleted before deleting New Service(very first) Pointer Record.
  Set test variable      ${Expected_Error}   While you have permissions for this TFN, you have selected the wrong Acting As Resp Org. Please select the following Resp Org to continue: LGT01.

  ${mod_effDate}=          evaluate                       '${Q_effDtTm}'.replace('-','')
  ${effDateT}=             evaluate                       '${mod_effDate}'.replace(':','')
  ${effDate}=              set variable                   ${effDateT}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr/tfnum/${reservedTFN}/effDtTm/${effDate}/recVersionId/${recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}

List_Template_Allocation_Limit
  [Documentation]   Allows the SMS800 TFNRegistry user to list Template Allocation Entities.
  [Tags]     REGRESSION  CUS   TAD   TAL List
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tal/lst
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse TAL List
  Parse Return Code   ${resp}        ${keyword}



Retrieve_Template_Allocation_Limit_first

  [Documentation]   Allows the SMS800 TFNRegistry user to Retrieve Template Allocation Limit Information for an entity.
  [Tags]     REGRESSION  CUS   TAD   TAL Retrieve
  ${token}=                get token
  ${ROID}=                 set variable                   ART01
  ${entityfirst}=          set variable                   AR
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tal/entity/${entityfirst}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse TAL Information
  Parse Return Code   ${resp}        ${keyword}

Retrieve_Template_Allocation_Limit_Last_and_Mid
  [Documentation]   Allows the SMS800 TFNRegistry user to Retrieve Template Allocation Limit Information for an entity.
  [Tags]     REGRESSION  CUS   TAD   TAL Retrieve
  Set test variable      ${Expected_Error}   While you have permissions for this Entity, you have selected the wrong Acting As Resp Org. Please select the Resp Org belonging to Entity: ZZ.
  ${token}=                get token
  ${ROID}=                 set variable                   LGT01
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tal/entity/${entityLast}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse TAL Information
  Parse Return Code   ${resp}        ${keyword}
  ${ROID}=                 set variable                   BROPR
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tal/entity/${entityMid}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse TAL Information
  Parse Return Code   ${resp}        ${keyword}


Update_Template_Allocation_Limit
  [Documentation]   Allows the SMS800 TFNRegistry user to Update Template Allocation Limit Information for an entity.
  [Tags]     REGRESSION  CUS   TAD   TAL Update
  Pass execution     Clients should not be able to do this update
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tal
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${entity}=               set variable                   AT
  ${maxRtngTmpl}=          set variable                   31
  ${requestData}=          evaluate               json.loads('''${Update_TAL_Data}''')       json
  set to dictionary        ${requestData}                          entity=${entity}
  set to dictionary        ${requestData}                          maxRtngTmpl=${maxRtngTmpl}
  #remove from dictionary   ${requestData}                          maxRtngTmpl
  #remove from dictionary   ${requestData}                          manualOverride
  remove from dictionary   ${requestData}                          asyncId
  remove from dictionary   ${requestData}                          recVersionId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}

  ${keyword}=     set variable       Parse Template Record Response
  Parse Return Code   ${resp}        ${keyword}

Create_Template_Record
  [Documentation]   This API allows the SMS800 TFNRegistry user to create a new Template record in the system to activate either immediately,
  ...                or at a future effective date and time.
  [Tags]     REGRESSION  CUS   TAD Create
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time}=        get new future effective date and time         ${Date}         1
  ${entity}=               get substring          ${ROID}           0     2
  ${mid}=                  get random string      3          [UPPER]
  ${tmplName}=             set variable                    ${entity}-${mid}3-TEST
  ${respOrg}=              get resporgid
  ${interLATACarrier}=     Create List                     WTL-0555
  ${intraLATACarrier}=     Create list                     WTL-0555
  ${tmplDesc}=             set variable                    API TEST TEMPLATE FOR DELETION
  ${ctrlRespOrgId}=        set variable                    BRSMS
  ${aosNetList}=           create list                     US
  ${aos}=                  create dictionary               aosNet=${aosNetList}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${Create_TAD_Data}''')       json
  set to dictionary        ${requestData}                          tmplName=*${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time}
  set to dictionary        ${requestData}                          tmplDesc=${tmplDesc}
  set to dictionary        ${requestData}                          cmd=U
  #set to dictionary        ${requestData}                          ctrlRespOrgId=${respOrg}
  #set to dictionary        ${requestData}                          priority=${priority}
  #set to dictionary        ${requestData}                          conTel=${reservedTFN}
  #set to dictionary        ${requestData}                          conName=PETERSEN
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          aos=${aos}
  #set to dictionary        ${requestData}                          cprSectName=${cprSectName}
  #set to dictionary        ${requestData}                          lbl=${lbl}
  #set to dictionary        ${requestData}                          priInterLT=${interLATACarrier}
  #set to dictionary        ${requestData}                          priIntraLT=${interLATACarrier}
  set to dictionary        ${requestData}                          numTermLine=999
  #set to dictionary        ${requestData}                          tmZn=C
  #set to dictionary        ${requestData}                          dayLightSavings=Y
  #set to dictionary        ${requestData}                          asyncId=999


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
  Set Suite Variable      ${EFF_Date_Time}
  Set Suite Variable      ${tmplName}

Lock_Template_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to Lock a Template Record.
  [Tags]     REGRESSION  CUS   TAD   Lock
  ${Date}=                 get current date
  ${newEFF_Date_Time}=     get new future effective date and time         ${Date}         1
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/lock
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${lockType}=             set Variable                   ALL
  ${requestData}=          evaluate               json.loads('''${Lock_TAD_Data}''')       json
  set to dictionary        ${requestData}                          srcTmplName=*${tmplName}
  set to dictionary        ${requestData}                          tgtEffDtTm=${newEFF_Date_Time}
  set to dictionary        ${requestData}                          custRecAction=${lockType}
  remove from dictionary   ${requestData}                          tgtTmplName
  remove from dictionary   ${requestData}                          srcEffDtTm
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}           Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Lock Response
  Parse Return Code   ${resp}        ${keyword}

Unlock_Template_Record
  [Documentation]   Allows the SMS800 TFNRegistry user to unlock a Template Record.
  [Tags]     REGRESSION  CUS   TAD   Unlock
  #set test variable        ${Expected_Error}     Unlock request cannot be processed as the Template Name is not locked for Template Record Updates.
  ${token}=                get token
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/unlock
  ${PUT_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${unLock_TAD_Data}''')       json
  set to dictionary        ${requestData}                          tmplName=*${tmplName}
  remove from dictionary   ${requestData}                          effDtTm
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Put Request        endpoint       ${PUT_ACTION_URI}       data=${reqBody}               headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Unlock Response
  Parse Return Code   ${resp}        ${keyword}


Delete_Template_Record
  [Documentation]     Delete for new Pending Template.
  [Tags]     REGRESSION  CUS   TAD Delete
  ${token}=                Get Token
  ${entity}=               get substring          ${ROID}           0     2
  ${mid}=                  get random string      3          [UPPER]
  #${tmplName}=             set variable                    ${entity}-${mid}3-TEST
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse Template Information
  Parse Return Code   ${resp}        ${keyword}
  #####################################################################################################
  ${mod_effDate}=          evaluate                       '${effDtTm}'.replace('-','')
  ${effDateT}=             evaluate                       '${mod_effDate}'.replace(':','')
  ${effDate}=              set variable                   ${effDateT}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}/effDtTm/${effDate}/recVersionId/${recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  #${ROID}=                 set variable                   BRSMS
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}





Create_Complex_Template_Record
  [Tags]     REGRESSION  CUS   TAD Create Complex
  ${token}=                Get Token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time}=        get new future effective date and time         ${Date}         1
  ${entity}=               get substring          ${ROID}           0     2
  ${mid}=                  get random string      3          [UPPER]
  ${tmplName}=             set variable                    ${entity}-${mid}3-TEST
  ${respOrg}=              get resporgid
  ${tmplDesc}=             set variable                    API TEST TEMPLATE FOR DELETION
  ${validStateValue}=      set variable                    NJ
  ${aosStateList}=         create list                     ${validStateValue}
  ${aosNetList}=           create list                     US
  ${aos}=                  create dictionary               aosNet=${aosNetList}
  ${interLATACarrier}=     Create list                     WTL-0555
  ${intraLATACarrier}=     Create list                     WTL-0555
  ${cicCode}=              set variable                    ${interLATACarrier}
  ${T_data}=               set variable                    {"tmplName": "*BR-EHZ1-TEST", "cmd": "U", "effDtTm": "NOW", "intraLATACarrier": ["WTL-0555"], "interLATACarrier": ["WTL-0555"], "tmplDesc": "Create Complex Template Record", "numTermLine": 100, "aos": {"aosState": ["CA"]}, "cprSectName": [{"name": "MAIN", "nodeSeq": ["state", "carrier", "announcement"], "nodes": [{"rowIndex": 1, "colIndex": 1, "values": ["CA"]}, {"rowIndex": 1, "colIndex": 2, "values": ["0555"]}, {"rowIndex": 1, "colIndex": 3, "values": ["OBA"]}]}]}
  #${interLATACarrier}         ${intraLATACarrier}     ${cicCode}      ${acna}     ${recversionIDForCIS}     Get Intra and Inter LATA Carrier      ${token}
  ${nodeSeq}=              create list     STATE   CARRIER     ANNOUNCEMENT
  ${nodeValues}=           create list  ${validStateValue}    ${cicCode}   OBA
  ${noOfRows}=             get length   ${aosStateList}
  ${noOfColumns}=          get length   ${nodeSeq}
  ${nodes}=                Get Nodes List   ${nodeSeq}    ${nodeValues}   ${noOfRows}    ${noOfColumns}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  #${requestData}=          evaluate               json.loads('''${Create_TAD_Data}''')       json
  ${requestData}=          evaluate               json.loads('''${T_Data}''')       json
  set to dictionary        ${requestData}                          tmplName=*${tmplName}
  set to dictionary        ${requestData}                          effDtTm=${EFF_Date_Time}

  #remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          lbl
  remove from dictionary   ${requestData}                          tmZn
  remove from dictionary   ${requestData}                          asyncId
  #remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData["aos"]}                   aosLbl
  remove from dictionary   ${requestData["aos"]}                   aosNPA
  remove from dictionary   ${requestData["aos"]}                   aosLATA
  ##remove from dictionary   ${requestData["aos"]}                   aosState
  remove from dictionary   ${requestData}                          dayLightSavings
  remove from dictionary   ${requestData}                          priIntraLT
  remove from dictionary   ${requestData}                          priInterLT
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  #${reqBody}=              set variable           ${T_data}
  log          ${reqBody}
  set test variable        ${Expected_Error}              Template Record already exists for the given Template Name.
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Template Record Response
  Parse Return Code   ${resp}        ${keyword}
  set suite variable     ${tmplName}

Retrieve_Template_Record_Producing_Error
  [Tags]     REGRESSION  CUS   TAD Retrieve
  set Test variable        ${Expected_Error}     User has no involvement with the Template Record.
  ${token}=                Get Token
  ${entity}=               get substring          ${ROID}           0     2
  ${mid}=                  get random string      3          [UPPER]
  #${tmplName}=             set variable                    ${entity}-${mid}3-TEST
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}

  ${keyword}=     set variable       Parse Template Information
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################
  ${tmplName}=             set variable                   LGBR--4CARRIER
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}

  ${keyword}=     set variable       Parse Template Information
  Parse Return Code   ${resp}        ${keyword}
  ###############################################################################################################
  set Test variable        ${Expected_Error}     User has no involvement with the Template Record.
  ${tmplName}=             set variable                   BR-306
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}

  ${keyword}=     set variable       Parse Template Information
  Parse Return Code   ${resp}        ${keyword}



Delete_Template_Record_with_ERROR
  [Documentation]   Allows the SMS800 TFNRegistry user to delete a PENDING Template Record.
  [Tags]     REGRESSION  CUS   TAD Delete

  set Test variable        ${Expected_Error}     While you have permissions for this Template Name, you have selected the wrong Acting As Resp Org. Please select the following Resp Org to continue: BROPR.
  #set Test variable        ${Expected_Error}     Template Name does not exist in TFN Registry

  ${token}=                Get token
  ${ROID}=                 set variable                   BROPR
  #  NON_EXSISTENT TEMPLATE NAME
  ${tmplName}=             set variable                   BR-TEST1
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}           Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}

  ${keyword}=     set variable       Parse Template Information
  Parse Return Code   ${resp}        ${keyword}

  ${mod_effDate}=          evaluate                       '${effDtTm}'.replace('-','')
  ${effDateT}=             evaluate                       '${mod_effDate}'.replace(':','')
  ${effDate}=              set variable                   ${effDateT}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}/effDtTm/${effDate}/recVersionId/${recVersionId}
  ${DEL_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${ROID}=                 set variable                   BRSMS
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Delete Request        endpoint       ${DEL_ACTION_URI}         headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record Delete
  Parse Return Code   ${resp}        ${keyword}


Copy_Existing_Template_to_New_Template_Name_Producing_Error
  [Documentation]   Allows the SMS800 TFNRegistry user to copy a Template Record to same name or different name.
  [Tags]     REGRESSION  CUS   TAD Copy
  set Test variable        ${Expected_Error}    User has no involvement with the Template Record.
  ${token}=                Get token
  #${tmplName}=             set variable                   BR-JP1US
  ${tmplName}=             set variable                   BR-ALARM
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/tmplName/%2A${tmplName}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}       Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  ${keyword}=     set variable       Parse Template Information
  Parse Return Code   ${resp}        ${keyword}
  #########################################################################################################
  ${srcTmplName}=           set variable                    ${tmplName}
  ${srcEffDtTm}=            set variable                    ${effDtTm}
  ${srcRecVersionId}=       set variable                    ${recVersionId}
  ${srctmplRecCompPart}=    set variable                    ${tmplRecCompPart}
  ##########################################################################################################
  set Test variable        ${Expected_Error}    User has no involvement with the Template Record.
  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time}=        get new future effective date and time         ${Date}         35
  ${mid}=                  get random string      3          [UPPER]
  ${tgttmplName}=          set variable                    BR-${mid}3-TEST
  ${aosNetList}=           create list                     US
  ${aos}=                  create dictionary               aosNet=${aosNetList}
  ${interLATACarrier}=     create list                     WTL-0555
  ${intraLATACarrier}=     create list                     WTL-0555
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/copy
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${Copy_TAD_Data}''')       json
  set to dictionary        ${requestData}                          tgtTmplName=*${tgttmplName}
  set to dictionary        ${requestData}                          tgtEffDtTm=${EFF_Date_Time}
  set to dictionary        ${requestData}                          srcTmplName=*${srcTmplName}
  set to dictionary        ${requestData}                          cmd=U
  set to dictionary        ${requestData}                          srcEffDtTm=${srcEffDtTm}
  set to dictionary        ${requestData}                          tmplRecCompPart=${srctmplRecCompPart}
  set to dictionary        ${requestData}                          srcRecVersionId=${srcRecVersionId}
  #set to dictionary        ${requestData}                          conName=PETERSEN
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          aos=${aos}
  #set to dictionary        ${requestData}                          cprSectName=${cprSectName}
  #set to dictionary        ${requestData}                          lbl=${lbl}
  #set to dictionary        ${requestData}                          priInterLT=${interLATACarrier}
  #set to dictionary        ${requestData}                          priIntraLT=${interLATACarrier}
  set to dictionary        ${requestData}                          numTermLine=999
  #set to dictionary        ${requestData}                          tmZn=C
  #set to dictionary        ${requestData}                          dayLightSavings=Y
  #set to dictionary        ${requestData}                          asyncId=999


  remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          lbl
  remove from dictionary   ${requestData}                          tmZn
  remove from dictionary   ${requestData}                          tgtNum
  remove from dictionary   ${requestData}                          conTel
  remove from dictionary   ${requestData}                          conName
  #remove from dictionary   ${requestData}                          srcEffDtTm
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
  remove from dictionary   ${requestData}                          overWriteTGT
  remove from dictionary   ${requestData}                          notes
  remove from dictionary   ${requestData}                          hldIndFlag
  remove from dictionary   ${requestData}                          svcOrderNum
  remove from dictionary   ${requestData}                          telco
  remove from dictionary   ${requestData}                          tgtRecVersionId
  #remove from dictionary   ${requestData}                          srcEffDtTm
  remove from dictionary   ${requestData}                          destNums
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  log                      ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}         Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=  set variable        Parse Template Copy Response
  Parse Return Code   ${resp}      ${keyword}

Create_Multi_Number_Disconnect_for_Number
  [Documentation]   Allows the SMS800 TFNRegistry user to disconnect multiple numbers.
  [Tags]     REGRESSION  CUS   TAD Disconnect  MND
  ${token}=               get token
  ${oauthToken}=          set variable                   ${token}
  ${reservedTFN}=         get Reserve Random Number      ${token}     ${ReqData}
  ${numList}=             Create List            ${reservedTFN}
  Set Suite Variable       ${reservedTFN}
  Set Suite Variable       ${numList}
  ${ROID}=                 set variable                   BRSMS
  ${telco}=                Get Telco                      ${token}
  ${interLATACarrier}=     create list                    0555
  ${intraLATACarrier}=     create list                    0555
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${Create_CAD_Data}''')       json

  set to dictionary        ${requestData}                          num=${reservedTFN}
  set to dictionary        ${requestData}                          effDtTm=NOW
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
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}   Accept-Version=${Accept-Version}    ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=  set variable        Parse Customer Record Response
  Parse Return Code   ${resp}      ${keyword}
  ######################################################################################################
  ${token}=                get token
  ${reserved_p_TFN}=       get Reserve Random Number      ${token}     ${ReqData}
  Append to List           ${numList}      ${reserved_p_TFN}
  ${oauthToken}=           set variable                   ${token}
  ${telco}                 Get Telco                      ${token}
  ${sand_Template}=        set variable                   *LGBR-H3TEST
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/ptr
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${requestData}=          evaluate               json.loads('''${Create_PAD_Data}''')       json

  set to dictionary        ${requestData}                          num=${reserved_p_TFN}
  set to dictionary        ${requestData}                          effDtTm=NOW
  set to dictionary        ${requestData}                          conTel=${reservedTFN}
  set to dictionary        ${requestData}                          conName=PETERSEN
  set to dictionary        ${requestData}                          telco=${telco}
  set to dictionary        ${requestData}                          svcOrderNum=P12345
  set to dictionary        ${requestData}                          newRespOrgId=LGT01
  set to dictionary        ${requestData}                          tmplName=${sand_Template}
  set to dictionary        ${requestData["destNums"][0]}           destNum=${reserved_p_TFN}
  set to dictionary        ${requestData["destNums"][0]}           numTermLine=99
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          agent
  #remove from dictionary   ${requestData}                          newRespOrgId
  remove from dictionary   ${requestData}                          endSub
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData["destNums"][0]}           forServOff
  remove from dictionary   ${requestData["destNums"][0]}           localServOff
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}     Accept-Version=${Accept-Version}    ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=  set variable        Parse Pointer Record Response
  Parse Return Code   ${resp}      ${keyword}
  ##############################################################################################
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/mnd
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${date}=                 get time                        year month day   NOW + 2 days
  ${endInterceptDt}=       set variable                   ${date}[0]-${date}[1]-${date}[2]
  ${Date}=                 get current date
  ${startEffDtTm}=         get new future effective date and time         ${Date}       1
  set test variable        ${blkType}                      mnd
  set test variable        ${token}
  #${eIDT}=                 get new future effective date and time         ${Date}       2
  #${mod_effDate}=          evaluate                       '${eIDT}'.replace('-','')
  #${effDate}=              evaluate                       '${eIDT}'.replace('^T.*','')
  #${endInterceptDt}=       set variable                   ${effDate}
  ${requestData}=          evaluate               json.loads('''${MND_Data}''')       json

  set to dictionary        ${requestData}                          numList=${numList}
  set to dictionary        ${requestData}                          startEffDtTm=${startEffDtTm}
  set to dictionary        ${requestData}                          endInterceptDt=${endInterceptDt}
  set to dictionary        ${requestData}                          referral=N
  set to dictionary        ${requestData}                          notes=NOTES
  set to dictionary        ${requestData}                          requestDesc=REQ_1
  set to dictionary        ${requestData}                          email=JRPETERS2@HOTMAIL.COM
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=  set variable        Parse MND Response
  set Test variable       ${Expected_Error}    Request is still in progress.
  set suite variable      ${GET_ACTION_URI}
  Parse Return Code   ${resp}    ${keyword}
  Log                 ${MND_Resp_OK}
  Log                 ${blkId}
  Run Keyword If    '${MND_Resp_OK}'=='TRUE'        get MND response      ${token}      ${blkId}




Create_Multi_Template_Disconnect_for_Templates
  [Documentation]   Allows the SMS800 TFNRegistry user to disconnect multiple templates.
  [Tags]     REGRESSION  CUS   TAD   MND
  No Operation

  ${token}=                get token
  ${oauthToken}=           set variable           ${token}
  ${ROID}=                set variable                    BRSMS
  ${Date}=                 get current date
  ${EFF_Date_Time}=        get new future effective date and time         ${Date}         1
  ${mid}=                  get random string      3          [UPPER]
  ${tmplName}=             set variable                    BR-${mid}3-TEST
  ${respOrg}=              get resporgid
  ${interLATACarrier}=     Create List                     WTL-0555
  ${intraLATACarrier}=     Create list                     WTL-0555
  ${tmplDesc}=             set variable                    API TEST TEMPLATE FOR DELETION
  ${ctrlRespOrgId}=        set variable                    BRSMS
  ${aosNetList}=           create list                     US
  ${aos}=                  create dictionary               aosNet=${aosNetList}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${T_List}=               Create List                    *${tmplName}
  ${requestData}=          evaluate               json.loads('''${Create_TAD_Data}''')       json
  set to dictionary        ${requestData}                          tmplName=*${tmplName}
  set to dictionary        ${requestData}                          effDtTm=NOW
  set to dictionary        ${requestData}                          tmplDesc=${tmplDesc}
  set to dictionary        ${requestData}                          cmd=U
  #set to dictionary        ${requestData}                          ctrlRespOrgId=${respOrg}
  #set to dictionary        ${requestData}                          priority=${priority}
  #set to dictionary        ${requestData}                          conTel=${reservedTFN}
  #set to dictionary        ${requestData}                          conName=PETERSEN
  set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  set to dictionary        ${requestData}                          aos=${aos}
  #set to dictionary        ${requestData}                          cprSectName=${cprSectName}
  #set to dictionary        ${requestData}                          lbl=${lbl}
  #set to dictionary        ${requestData}                          priInterLT=${interLATACarrier}
  #set to dictionary        ${requestData}                          priIntraLT=${interLATACarrier}
  set to dictionary        ${requestData}                          numTermLine=999
  #set to dictionary        ${requestData}                          tmZn=C
  #set to dictionary        ${requestData}                          dayLightSavings=Y
  #set to dictionary        ${requestData}                          asyncId=999


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
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}           Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}

  ${keyword}=     set variable       Parse Template Record Response
  Parse Return Code   ${resp}        ${keyword}
  Set Suite Variable      ${EFF_Date_Time}

  ${token}=                Get Token
  ${oauthToken}=           set variable           ${token}
  ${Date}=                 get current date
  ${EFF_Date_Time}=        get new future effective date and time         ${Date}         1
  ${mid}=                  get random string      3          [UPPER]
  ${tmplName}=             set variable                    BR-${mid}3-TEST
  ${respOrg}=              get resporgid
  ${tmplDesc}=             set variable                    API TEST TEMPLATE FOR DELETION
  ${validStateValue}=      set variable                    NJ
  ${aosStateList}=         create list                     ${validStateValue}
  ${aosNetList}=           create list                     US
  ${aos}=                  create dictionary               aosNet=${aosNetList}
  ${interLATACarrier}=     Create list                     WTL-0555
  ${intraLATACarrier}=     Create list                     WTL-0555
  ${cicCode}=              set variable                    ${interLATACarrier}
  ${T_data}=               set variable                    {"tmplName": "*BR-EHZ1-TEST", "cmd": "U", "effDtTm": "NOW", "intraLATACarrier": ["WTL-0555"], "interLATACarrier": ["WTL-0555"], "tmplDesc": " Template Record", "numTermLine": 100, "aos": {"aosState": ["CA"]}, "cprSectName": [{"name": "MAIN", "nodeSeq": ["state", "carrier", "announcement"], "nodes": [{"rowIndex": 1, "colIndex": 1, "values": ["CA"]}, {"rowIndex": 1, "colIndex": 2, "values": ["0555"]}, {"rowIndex": 1, "colIndex": 3, "values": ["OBA"]}]}]}
  #${interLATACarrier}         ${intraLATACarrier}     ${cicCode}      ${acna}     ${recversionIDForCIS}     Get Intra and Inter LATA Carrier      ${token}
  ${nodeSeq}=              create list     STATE   CARRIER     ANNOUNCEMENT
  ${nodeValues}=           create list  ${validStateValue}    ${cicCode}   OBA
  ${noOfRows}=             get length   ${aosStateList}
  ${noOfColumns}=          get length   ${nodeSeq}
  ${nodes}=                Get Nodes List   ${nodeSeq}    ${nodeValues}   ${noOfRows}    ${noOfColumns}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Append to list           ${T_List}                      *${tmplName}
  #${requestData}=          evaluate               json.loads('''${Create_TAD_Data}''')       json
  ${requestData}=          evaluate               json.loads('''${T_Data}''')       json
  set to dictionary        ${requestData}                          tmplName=*${tmplName}
  set to dictionary        ${requestData}                          effDtTm=NOW
  #set to dictionary        ${requestData}                          tmplDesc=${tmplDesc}
  #set to dictionary        ${requestData}                          cmd=U
  #set to dictionary        ${requestData}                          ctrlRespOrgId=${respOrg}
  #set to dictionary        ${requestData}                          priority=${priority}
  #set to dictionary        ${requestData}                          conTel=${reservedTFN}
  #set to dictionary        ${requestData}                          conName=PETERSEN
  #set to dictionary        ${requestData}                          interLATACarrier=${interLATACarrier}
  #set to dictionary        ${requestData}                          intraLATACarrier=${intraLATACarrier}
  #set to dictionary        ${requestData}                          cprSectName=${cprSectName}
  #set to dictionary        ${requestData}                          lbl=${lbl}
  #set to dictionary        ${requestData}                          priInterLT=${interLATACarrier}
  #set to dictionary        ${requestData}                          priIntraLT=${interLATACarrier}
  #set to dictionary        ${requestData}                          numTermLine=999
  #set to dictionary        ${requestData}                          tmZn=C
  #set to dictionary        ${requestData}                          dayLightSavings=Y
  #set to dictionary        ${requestData}                          asyncId=999
  #set to dictionary        ${requestData}                          aos=${aos}
  #set to dictionary        ${requestData["cprSectName"][0]}        nodeSeq=${nodeSeq}
  #set to dictionary        ${requestData["cprSectName"][0]}        nodes=${nodes}


  #remove from dictionary   ${requestData}                          cprSectName
  remove from dictionary   ${requestData}                          lbl
  remove from dictionary   ${requestData}                          tmZn
  remove from dictionary   ${requestData}                          asyncId
  #remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData["aos"]}                   aosLbl
  remove from dictionary   ${requestData["aos"]}                   aosNPA
  remove from dictionary   ${requestData["aos"]}                   aosLATA
  ##remove from dictionary   ${requestData["aos"]}                   aosState
  remove from dictionary   ${requestData}                          dayLightSavings
  remove from dictionary   ${requestData}                          priIntraLT
  remove from dictionary   ${requestData}                          priInterLT
  remove from dictionary   ${requestData}                          priority
  remove from dictionary   ${requestData}                          endSubAddr
  remove from dictionary   ${requestData}                          onAccCust
  remove from dictionary   ${requestData}                          suppFormNum
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  #${reqBody}=              set variable           ${T_data}
  log          ${reqBody}
  Create Session           endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}        Accept-Version=${Accept-Version}     ROID=${ROID}
  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}

  ${keyword}=     set variable       Parse Template Record Response
  Parse Return Code   ${resp}        ${keyword}
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/tpl/mnd
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  ${date}=                 get time                        year month day   NOW + 2 days
  ${endInterceptDt}=       set variable                   ${date}[0]-${date}[1]-${date}[2]
  ${Date}=                 get current date
  ${startEffDtTm}=         get new future effective date and time         ${Date}       1
  set test variable        ${blkType}                      mnd
  set test variable        ${token}
  #${eIDT}=                 get new future effective date and time         ${Date}       2
  #${mod_effDate}=          evaluate                       '${eIDT}'.replace('-','')
  #${effDate}=              evaluate                       '${eIDT}'.replace('^T.*','')
  #${endInterceptDt}=       set variable                   ${effDate}
  ${requestData}=          evaluate               json.loads('''${MND_Data}''')       json

  set to dictionary        ${requestData}                          tmplList=@{T_List}
  set to dictionary        ${requestData}                          startEffDtTm=${startEffDtTm}
  #set to dictionary        ${requestData}                          endInterceptDt=${endInterceptDt}
  #set to dictionary        ${requestData}                          referral=N
  set to dictionary        ${requestData}                          notes=TMP_NOTES
  set to dictionary        ${requestData}                          requestDesc=TEMP_1
  set to dictionary        ${requestData}                          email=JRPETERS2@HOTMAIL.COM
  remove from dictionary   ${requestData}                          endInterceptDt
  remove from dictionary   ${requestData}                          referral
  remove from dictionary   ${requestData}                          numList
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=              evaluate               json.dumps(${requestData})    json
  Create Session           endpoint               ${HOST}
  #${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}          Accept-Version=${Accept-Version}     ROID=${ROID}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}          Accept-Version=${Accept-Version}

  ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}       data=${reqBody}               headers=${headers}
  ${keyword}=  set variable        Parse MND Response
  set suite variable      ${GET_ACTION_URI}
  set Test variable       ${Expected_Error}    Request is still in progress.
  Parse Return Code   ${resp}    ${keyword}
  Log                 ${MND_Resp_OK}
  Log                 ${blkId}
  Run Keyword If    '${MND_Resp_OK}'=='TRUE'        get MND response      ${token}      ${blkId}




Retrieve_Customer_Record_01
  [Tags]     REGRESSION  CUS   CAD Retrieve

  ${token}=                get token
  ${reservedTFN}=          set variable                   8339540385
  ${cr_type}=              set variable                   CAD, CPR
  ${EFF_Date_Time1}=       set variable                   2019-08-28T16:30Z
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}               ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  set Test variable        ${Expected_Error}    No customer record exists for this number.

  ${keyword}=     set variable       Parse Customer Record View
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}


Retrieve_Customer_Record_02
  [Tags]     REGRESSION  CUS   CAD Retrieve
  ${token}=                get token
  ${reservedTFN}=          set variable                   8339720283
  ${cr_type}=              set variable                   CAD, CPR
  ${EFF_Date_Time1}=       set variable                   2019-08-28T16:30Z
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}                    ROID=${ROID}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  set Test variable        ${Expected_Error}    User has no involvement with the customer record.
  ${keyword}=     set variable       Parse Customer Record View
  set Test Variable      ${Q_index}               0
  #set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}

Retrieve_Customer_Record_03
  [Tags]     REGRESSION  CUS   CAD Retrieve
  ${token}=                get token
  ${reservedTFN}=          set variable                   8339810396
  ${cr_type}=              set variable                   CAD
  ${EFF_Date_Time1}=       set variable                   2019-08-28T16:30Z
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record View
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}

Retrieve_Customer_Record_04
  [Tags]     REGRESSION  CUS   CAD Retrieve
  ${token}=                get token
  ${reservedTFN}=          set variable                   8339810397
  ${cr_type}=              set variable                   CAD
  ${EFF_Date_Time1}=       set variable                   2019-08-28T16:30Z
  ${CR_v3_UCI}=            set variable                   /v3/ip/cus/rec/tfnum/${reservedTFN}
  ${GET_ACTION_URI}=       set variable                   ${CR_v3_UCI}
  Create Session           endpoint                       ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}         Accept-Version=${Accept-Version}
  ${resp}=        Get Request        endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${keyword}=     set variable       Parse Customer Record View
  set Test Variable      ${Q_index}               0
  set Test Variable      ${TgtEffDtTm}            ${EFF_Date_Time1}
  set Test Variable      ${key}                   ${cr_type}
  Parse Return Code      ${resp}        ${keyword}





Close_session_with_Resp_Org
      Close Session


*** Keywords ***


Get MND response
  [Arguments]       ${token}    ${BulkId}
  sleep  ${SLEEP_FOUR}
  ${MND_Resp}=      Retrieve MND With Bulk ID      ${token}      ${MND_GET_URI}        ${BulkId}
  dictionary should contain key             ${MND_Resp}             disconnectResult
  ${Disc_result}=   get from dictionary     ${MND_Resp}             disconnectResult
  Log          ${Disc_result}

Retrieve MND With Bulk ID
  [Arguments]    ${token}   ${MND_GET_URI}        ${Bulk_Id}
  ${MND_Resp1}     GET METHOD      ${token}      ${MND_GET_URI}/${BulkId}     ${SuccessResponse}
  log     ${MND_Resp1}
  ${err_status}   run keyword and return status  dictionary should contain key     ${MND_Resp1}    errList
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
  FOR     ${Index}      IN RANGE    0     ${x}
          ${sI}=                      Convert to String       ${Index}
          ${effDtTm}=            Get From Dictionary     ${lstEffDtTm[${Index}]}     effDtTm
          ${custRecStat}=        Get from Dictionary     ${lstEffDtTm[${Index}]}     custRecStat
          ${actionCode}=         Get from Dictionary     ${lstEffDtTm[${Index}]}     actionCode
  END


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
  [Arguments]       ${dictionary_name}
  #${preface}=       Convert to Lower Case     ${key}
  ${key}=           Set variable           ALL
  ${preface}=       Set Variable if     '${key}'=='ALL'      copy     ${preface}
  Dictionary should contain key       ${dictionary_name}      ${preface}Status
  #Dictionary should contain key       ${dictionary_name}      recVersionIParse Unlock Response

Parse Unlock Response
  [Arguments]       ${dictionary_name}
  No Operation


Parse Copy Record Response
  [Arguments]       ${dictionary_name}
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${effDtTm}                get from dictionary     ${dictionary_name}             effDtTm
  should be equal           ${effDtTm}        ${TgtEffDtTm}

Parse Transfer Record Response
  [Arguments]       ${dictionary_name}
  ${effDtTm}                   get from dictionary     ${dictionary_name}             effDtTm
    should be equal           ${effDtTm}        ${TgtEffDtTm}
  ${srcRecVersionId}           get from dictionary     ${dictionary_name}             srcRecVersionId
  #${tgtRecVersionId}           get from dictionary     ${dictionary_name}             tgtRecVersionId


Parse Disconnect Pointer Record Response
  [Arguments]       ${dictionary_name}
  ${effDtTm}                   get from dictionary     ${dictionary_name}             effDtTm
    #should be equal           ${effDtTm}        ${TgtEffDtTm}
  ${srcRecVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  #${tgtRecVersionId}           get from dictionary     ${dictionary_name}             tgtRecVersionId



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
  should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  should be equal           ${custRecCompPart}      ${key}
  ${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  should be equal           ${effDtTm}              ${TgtEffDtTm}
  ${apprStat}               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  #should be equal           ${actionCode}           N
  ${Q_effDtTm}=             set variable            ${effDtTm}
  set global variable       ${Q_effDtTm}
  set test variable         ${recVersionId}


Parse Customer Record View
  [Arguments]       ${dictionary_name}
  ${index}=                 set variable            ${Q_index}
  ${lstEffDtTms}            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  set test variable         ${recVersionId}
  ${numStatus}              get from dictionary     ${dictionary_name}             numStatus
  #should be equal           ${numStatus}            ASSIGNED
  ${ctrlRespOrgId}          get from dictionary     ${dictionary_name}             ctrlRespOrgId
  ${lastUsr}                get from dictionary     ${dictionary_name}             lastUsr
  ${telco}                  get from dictionary     ${dictionary_name}             telco
  ${CADStatus}              get from dictionary     ${lstEffDtTms[${index}]}       custRecStat
  #should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  should be equal           ${custRecCompPart}      ${key}
  ${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  should be equal           ${effDtTm}              ${TgtEffDtTm}
  ${apprStat}               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}             get from dictionary     ${lstEffDtTms[${index}]}       actionCode

Parse Template Record Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                     ${dictionary_name}             recVersionId
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  Dictionary should contain key                     ${dictionary_name}             tmplId
  ${tmplId}                 get from dictionary     ${dictionary_name}             tmplId
  Dictionary should contain key                     ${dictionary_name}             effDtTm
  ${tmplId}                 get from dictionary     ${dictionary_name}             effDtTm

Parse Template Copy Response
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
