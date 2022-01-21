*** Settings ***
Documentation   This Suite Consists of API for Number Administration Microservice
...             Developer Resources Documentation (Number Administration) - Test Cases
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
#${API_Admin_User_Credentials_for_UAT}         {"usrName": "${UAT_USER}","password": "${UAT_User_PASSWORD}","withPerm": true}
${ReqBody_Mandatory_params}                   {"num":"8556664830","cmd":"U","effDtTm":"2018-03-10T10:00Z","agent":"NEWAG","notes":"NEW CAD","onAccCust":"1234A","endSubAddr":"NEW SAMPLE endSubAddr","suppFormNum":"adcdqw","svcOrderNum":"asagh","intraLATACarrier":["0555"],"interLATACarrier":["0555"],"aos":{"aosNet":["${validAosNet_CRO}"]},"destNums":[{"destNum":"8556664830","numTermLine":100}]}
#${Password_Change_Data}                       {"usrName": "${UAT_USER}","oldPassword": "${UAT_User_PASSWORD}","newPassword": "${UAT_User_PASSWORD}"}
${UCI_UPDT_Data}                              {"loginId": "string","primaryEmail": "user@example.com","ntfnInd": "Y","conName": "string","conPhone": "string","shrtNotes": "string","prefTmZn": "A","recVersionId": "string"}
${NUM_QRY_Data}                               {"numList": ["8555551212"],"requestDesc": "string","email": "jpetersen.ctr@somos.com","asyncId": "string"}
${NUM_UPDT_Data}                              {"tfNumList": [{"num": "string","recVersionId": "string"}],"requestDesc": "string","email": "user@example.com","ctrlRespOrgId": "string","conName": "string","conPhone": "string","resUntilDt": "string","status": "SPARE","shrtNotes": "string","asyncId": "string"}
${ReqData}                                    {"conName":"PALLA","conTel":"${UserProfileCreate_PhoneNum}"}
${NUM_RSCH_Data}                              {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string"}
${NUM_SSCH_Data}                              {"numList": ["string"],"asyncId": "string"}
${NUM_WSCH_Data}                              {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string","wildCardNum": "string"}
${NUM_RSRV_Data}                              {"conName": "string","conTel": "string","shrtNotes": "string","numList": ["string"],"asyncId": "string"}


${responsedata_View}
${reservedTFN}
${req_num}
${Trimmed_E:D:T}
${E.D.T_req}
${cicCode}
${acna}
${recversionIDForCIS}
${validStateValue}                     ${validAosState}
${validStateValue_1}                       FL
${validNpaValue}                       ${validAosNpa}
${validNpaValue_1}                         003
${validLataValue}                      ${validAosLata}
${custRecCompPart_CAD_LAD_CPR}            CAD, LAD, CPR
${custRecCompPart_CAD_CPR}                CAD, CPR
${custRecCompPart_LAD_CPR}                LAD, CPR
${tmplRecCompPart_TAD_LAD_CPR}            TAD, LAD, CPR
${DayLightSavings_N}                      N
${TimeZone_C}                             C
${DisconInd_N}                            N
${valid_NPA}                              315
${valid_Lata}                             136
${validPOTS_DestNum}                      3157071234
${custRecCompPart}                        CAD only
${CAD_View}                               /tfnum/
${ACTIVE}                                 ACTIVE
${PENDING}                                PENDING
${SENDING}                                SENDING
${TRANSITIONAL}                           TRANSITIONAL
${WORKING}                                WORKING
${Customer_Record_status}                 PENDING
${Number_Status}                          ASSIGNED
${SPARE}                                  SPARE
${RESERVED}                               RESERVED
${ASSIGNED}                               ${Number_Status}
${disconnectAllowedFlag_Y}                Y
${disconnectAllowedFlag_N}                N
${priority_Y}                             Y
${priority_N}                             N
${hldIndFlag_N}                           N
${hldIndFlag_Y}                           Y
${priorityStatus}                         N
${HldndFlagStatus}                        N
${invalid_aosLabel}                       SANTHI
${PriorityStatus_N}                       N
${HldndFlagStatus_N}                      N
${NewROID}                                ATX01
${RO_belonging_to_USR}                    LGT01
${CtrlRO_for_USR}                         BROPR
${Act_LG_Temp_rec}                        *LG-SCPT025
${CAD_Create_With_UnavailTFN_ErrMsg}      Toll-Free Number status is UNAVAILABLE
${CAD_Create_With_UnavailTFN_ErrCode}     502008
${status_code}                              200
${RESERVED}                                 RESERVED
${numDesc}                                  Invalid Number Included
${email}                                    jpetersen.ctr@somos.com
${cicCode}
${acna}
${ReqBody_Mandatory_params}                   {"num":"8556664830","cmd":"U","effDtTm":"2018-03-10T10:00Z","agent":"NEWAG","notes":"NEW CAD","onAccCust":"1234A","endSubAddr":"NEW SAMPLE endSubAddr","suppFormNum":"adcdqw","svcOrderNum":"asagh","intraLATACarrier":["0555"],"interLATACarrier":["0555"],"aos":{"aosNet":["${validAosNet_CRO}"]},"destNums":[{"destNum":"8556664830","numTermLine":100}]}
${UCI_UPDT_Data}                              {"loginId": "string","primaryEmail": "user@example.com","ntfnInd": "Y","conName": "string","conPhone": "string","shrtNotes": "string","prefTmZn": "A","recVersionId": "string"}
${NUM_QRY_Data}                               {"numList": ["8555551212"],"requestDesc": "string","email": "jpetersen.ctr@somos.com","asyncId": "string"}
${NUM_UPDT_Data}                              {"tfNumList": [{"num": "string","recVersionId": "string"}],"requestDesc": "string","email": "user@example.com","ctrlRespOrgId": "string","conName": "string","conPhone": "string","resUntilDt": "string","status": "SPARE","shrtNotes": "string","asyncId": "string"}
${ReqData}                                    {"conName":"PALLA","conTel":"${UserProfileCreate_PhoneNum}"}
${NUM_RSCH_Data}                              {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string"}
${NUM_SSCH_Data}                              {"numList": ["string"],"asyncId": "string"}
${NUM_WSCH_Data}                              {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string","wildCardNum": "string"}
${NUM_RSRV_Data}                              {"conName": "string","conTel": "string","shrtNotes": "string","numList": ["string"],"asyncId": "string"}

${API_Admin_User_Credentials_for_UAT_AWS}     {"usrName": "${UAT_AWS_Admin_USER}","password": "${UAT_AWS_Admin_PASSWORD}","withPerm": true}

${ReqBody_All_params}                  {"num": "","cmd": "U","effDtTm": "","newRespOrgId": "ATX01","svcOrderNum": "B098AA","suppFormNum": "uy21w","hldIndFlag": "N","telco": "BROP","notes": " NOTES","agent": "NEWAG","onAccCust": "1234A","endSubAddr": "NEW SAMPLE endSubAddr","conName": "cntc","conTel": "${UserProfileCreate_PhoneNum}","aos": {"aosNPA": [""]},"intraLATACarrier": [""],"interLATACarrier": [""],"destNums": [{"destNum": "","numTermLine": 10}]}
${ReqBody_duplicate_DestNums}          {"num": "","cmd": "U","effDtTm": "","newRespOrgId": "","svcOrderNum": "B098AB","suppFormNum": "uy21w","telco": "BROP","notes": "SAMPLE ONE NOTES","agent": "NEWAG","onAccCust": "1234A","endSubAddr": "NEW SAMPLE TWO endSubAddr","conName": "cntc","conTel": "${UserProfileCreate_PhoneNum}","aos": {"aosNPA": [""]},"intraLATACarrier": [""],"interLATACarrier": [""],"destNums": [{"destNum": "","numTermLine": 10},{"destNum": "","numTermLine": 11}]}
${ReqBody_Vanity_params}            {"num":"800a05740j","cmd":"U","effDtTm":"2018-03-10T10:00Z","priority":"N","hldIndFlag":"N","newRespOrgId":"BROPR","svcOrderNum":"asagh","suppFormNum":"adcdqw","notes":"SAMPLE NOTES","agent":"qwert","onAccCust":"asdfg","telco":"BRDA","endSub":"abcde","endSubAddr":"end subscriber address","conName":"asdaafg","conTel":"${UserProfileCreate_PhoneNum}","intraLATACarrier":["CAR-1234"],"interLATACarrier":["CAR-1234"],"aos":{"aosNet":["${validAosNet}"]},"destNums":[{"destNum":"8002057405","numTermLine":100},{"destNum":"9176812345","localServOff":"917681","numTermLine":100}]}
${ReqBody_Mandatory_params}         {"num":"8556664830","cmd":"U","effDtTm":"2018-03-10T10:00Z","suppFormNum":"adcdqw","svcOrderNum":"asagh","intraLATACarrier":["0555"],"interLATACarrier":["0555"],"aos":{"aosNet":["${validAosNet_CRO}"]},"destNums":[{"destNum":"8556664830","numTermLine":100}]}
${ReqBody_More_DestNums_params}     {"conTel":"8664785015","conName":"asdaafg","cmd":"U","num":"8664785015","svcOrderNum":"asagh","interLATACarrier":["BJN-0812"],"telco":"ABCV","notes":"SAMPLE THREE NOTES","hldIndFlag":"N","endSubAddr":"end subscriber address","newRespOrgId":"BROPR","agent":"qwert","priority":"N","endSub":"abcde","effDtTm":"2018-06-07T07:00Z","aos":{"aosLATA":["136"],"aosLbl":["100CA1"],"aosState":["CA"],"aosNPA":["315"]},"suppFormNum":"adcdqw","onAccCust":"asdfg","intraLATACarrier":["BJN-0812"],"destNums":[{"destNum":"8664785015","numTermLine":100},{"localServOff":"917681","numTermLine":100,"destNum":"9176812345"},{"localServOff":"917681","numTermLine":100,"destNum":"9176813456"}]}
${ReqBody_DerivedLATA_params}       {"num":"8556664184","cmd":"U","effDtTm":"2018-03-10","priority":"N","hldIndFlag":"N","newRespOrgId":"BROPR","svcOrderNum":"asagh","suppFormNum":"adcdqw","notes":"SAMPLE FOUR NOTES","agent":"qwert","onAccCust":"asdfg","telco":"BRDA","endSub":"abcde","endSubAddr":"end subscriber address","conName":"asdaafg","conTel":"8556664840","interLATACarrier":["1234"],"aos":{"aosLbl":["Test1"],"aosState":["CA"],"aosNPA":["987"],"aosLATA":["230"]},"destNums":[{"destNum":"8556664184","numTermLine":100},{"destNum":"9176812345","localServOff":"917681","numTermLine":100}]}
${ReqBody_Complex_TR_Create_Mandatory_Params}      {"tmplName":"","cmd":"U","effDtTm":"","intraLATACarrier":[""],"interLATACarrier":[""],"tmplDesc":"Create Complex Template Record","numTermLine":100,"aos":{"aosNet":["US"]},"cprSectName":[{"name":"MAIN","nodeSeq":[""],"nodes":[""]}]}
${ReqBody_CPR_Create_Params_WithSingleLabel}       {"num":"","cmd":"U","effDtTm":"","svcOrderNum":"asagh","intraLATACarrier":[""],"interLATACarrier":[""],"aos":{"aosState":[""]},"destNums":[{"destNum":"","numTermLine":100}],"lbl":[{"lblType":"NX","lblName":"*nxx","lblVals":["315","707"]}],"cprSectName":[{"name":"MAIN","nodeSeq":[""],"nodes":[""]}]}
${ReqBody_DerivedLATA2_params}       {"num":"8556664184","cmd":"U","effDtTm":"2018-03-10","priority":"N","hldIndFlag":"N","newRespOrgId":"BROPR","svcOrderNum":"asagh","suppFormNum":"adcdqw","notes":"SAMPLE FOUR NOTES","agent":"qwert","onAccCust":"asdfg","telco":"BRDA","endSub":"abcde","endSubAddr":"end subscriber address","conName":"asdaafg","conTel":"8556664840","interLATACarrier":["1234"],"aos":{"aosState":["CA"],"aosNPA":["987"],"aosLATA":["230"]},"destNums":[{"destNum":"8556664184","numTermLine":100},{"destNum":"9176812345","localServOff":"917681","numTermLine":100}]}
${ReqBody_valid_params}             {"num":"8556664832","cmd":"U","effDtTm":"NOW","priority":"N","hldIndFlag":"N","newRespOrgId":"BROPR","svcOrderNum":"asagh","suppFormNum":"adcdqw","notes":"SAMPLE FIVE NOTES","agent":"qwert","onAccCust":"asdfg","telco":"BRDA","endSub":"abcde","endSubAddr":"end subscriber address","conName":"asdaafg","conTel":"8556664840","intraLATACarrier":["CAR-1234"],"interLATACarrier":["CAR-1234"],"aos":{"aosNPA":["987"],"aosState":["CA"],"aosLbl":["Test2"],"aosLATA":["230"]},"destNums":[{"destNum":"8556664832","numTermLine":100}]}
${ReqBody_All_params}      {"num": "","cmd": "U","effDtTm": "","newRespOrgId": "","svcOrderNum": "B098AC","suppFormNum": "uy21w","telco": "BROP","notes": "SAMPLE SIX NOTES","agent": "NEWAG","onAccCust": "1234A","endSubAddr": "NEW SAMPLE endSubAddr","conName": "cntc","conTel": "${UserProfileCreate_PhoneNum}","aos": {"aosNPA": [""]},"intraLATACarrier": [""],"interLATACarrier": [""],"destNums": [{"destNum": "","numTermLine": 10}]}
${ReqData}                 {"conName":"PALLA","conTel":"${UserProfileCreate_PhoneNum}"}
${ReqBody_RandomSearch}    {}
${ReqBody_Missing_SO_SF}   {"num": "","cmd": "U","effDtTm": "","newRespOrgId": "","telco": "BROP","notes": "SAMPLE SEVEN NOTES","agent": "NEWAG","onAccCust": "1234A","endSubAddr": "NEW SAMPLE endSubAddr","conName": "cntc","conTel": "${UserProfileCreate_PhoneNum}","aos": {"aosNPA": [""]},"intraLATACarrier": [""],"interLATACarrier": [""],"destNums": [{"destNum": "","numTermLine": 10}]}
${ReqBody_Missing_InterLataCarrier}     {"num": "","cmd": "U","effDtTm": "","newRespOrgId": "","svcOrderNum": "B098AD","suppFormNum": "uy21w","telco": "BROP","notes": "SAMPLE EIGHT NOTES","agent": "NEWAG","onAccCust": "1234A","endSubAddr": "NEW SAMPLE endSubAddr","conName": "cntc","conTel": "${UserProfileCreate_PhoneNum}","aos": {"aosNPA": [""]},"intraLATACarrier": [""],"destNums": [{"destNum": "","numTermLine": 10}]}
${Admin_Credentials_NoHpu_Track2}     {"usrName": "${T2_ADMIN_NO_HPU_USER}","password": "${T2_ADMIN_NO_HPU_USER_PASSWORD}","withPerm": true}
${User_Credentials_NoHpu_Track2}      {"usrName": "${T2_RESP_NO_HPU_USER}","password": "${T2_RESP_NO_HPU_USER_PASSWORD}","withPerm": true}
${ReqBody_HPU_params}       {"num":"8556664830","cmd":"U","priority":"Y","effDtTm":"2018-03-10T10:00Z","svcOrderNum":"asagh","intraLATACarrier":["0222"],"interLATACarrier":["0222"],"aos":{"aosNet":["${validAosNet_CRO}"]},"destNums":[{"destNum":"8556664830","numTermLine":100}]}
${CAD_Transfer_E2ETC_ReqBody}           {"tgtNum":"", "cmd":"", "tgtEffDtTm":"", "srcRecVersionId":"", "custRecCompPart":""}
${ReqBody_CR_DisconnectLock_MandatoryParams}      {"srcNum":"","tgtEffDtTm":"","custRecCompPart":"CAD","custRecAction":"DISCONNECT"}
${ReqBody_CR_Disconnect_MandatoryParams}      {"srcNum":"","tgtEffDtTm":"","cmd":"U","srcRecVersionId":"","referral":"Y","custRecCompPart":"CAD"}
${CAD_Transfer_mandatory_ReqBody}           {"srcNum":"", "cmd":"", "tgtEffDtTm":"", "srcRecVersionId":"", "custRecCompPart":""}
${ReqBody_CR_Transfer_MandatoryParams}      {"tgtNum":"","tgtEffDtTm":"","cmd":"U","srcRecVersionId":"","custRecCompPart":"CAD"}
${Disconnect_ReqBody_All_params}        {"srcNum":"","srcEffDtTm":"","tgtEffDtTm":"","referral":"Y","endInterceptDt":"","cmd":"U","ctrlRespOrgId":"BROPR","hldIndFlag":"N","priority":"N","svcOrderNum":"bajd2","suppFormNum":"adcdqw","onAccCust":"asdfg","agent":"qwert","telco":"BROP","endSub":"abcde","endSubAddr":"end subscriber address","conName":"SOMOS","conTel":"8446662406","notes":"SAMPLE NOTES","aos":{ "aosNet":["${validAosNet_CRO}"]},"interLATACarrier":["1246"],"intraLATACarrier":["1246"],"destNums":[{"destNum": "8663255125","numTermLine": 10}],"custRecCompPart":"CAD","srcRecVersionId":""}
${PAD_Transfer_reqData}         {"tgtEffDtTm": "2018-12-28T22:00Z","num": "8552004596","cmd": "U","custRecCompPart": "PAD","recVersionId": "1543411742161000000"}
${PR_CR_ReqBody}        {"tfNum": "","srcEffDtTm": "","tgtEffDtTm": "","recVersionId": ""}
${Temp_ReqBody}         {"tmplName": "*BR-IJA3-TEST", "cmd": "U", "effDtTm": "2020-04-23T13:00Z", "intraLATACarrier": ["FKR-7935"], "interLATACarrier": ["FKR-7935"], "tmplDesc": "Create Complex Template Record", "numTermLine": 100, "aos": {"aosState": ["CA"]}, "cprSectName": [{"name": "MAIN", "nodeSeq": ["lata", "dayOfWeek", "carrier", "termNum"], "nodes":
#[{"rowIndex": 1, "colIndex": 1, "values": ["*lata"]}, {"rowIndex": 1, "colIndex": 2, "values": ["SU"]}, {"rowIndex": 1, "colIndex": 3, "values": ["7935"]}, {"rowIndex": 1, "colIndex": 4, "values": ["#DIAL"]}, {"rowIndex": 2, "colIndex": 1, "values": ["*lata"]}, {"rowIndex": 2, "colIndex": 2, "values": ["M","TU","W","TH","F"]}, {"rowIndex": 2, "colIndex": 3, "values": ["7935"]}, {"rowIndex": 2, "colIndex": 4, "values": ["#DIAL"]}, {"rowIndex": 3, "colIndex": 1, "values": ["*lata"]}, {"rowIndex": 3, "colIndex": 2, "values": ["SA"]}, {"rowIndex": 3, "colIndex": 3, "values": ["7935"]}, {"rowIndex": 3, "colIndex": 4, "values": ["#DIAL"]}, {"rowIndex": 4, "colIndex": 1, "values": ["OTHER"]}, {"rowIndex": 4, "colIndex": 2, "values": []}, {"rowIndex": 4, "colIndex": 3, "values": []}, {"rowIndex": 4, "colIndex": 4, "values": ["#DIAL"]}]}], "lbl": [{"lblType": "LT", "lblName": "*lata", "lblVals": ["728"]}]}


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

 UAT_NA_Test01
   [Documentation]  Accept-Version = ${Accept-Version}
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION
   ###############################################################################################################


Get_Allowable_NPA_List
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  AND
  ${token}=             get token
  ${Get_V2_AND}=        Set Variable          /v3/ip/num/and
  ${GET_ACTION_URI}=    Set Variable          ${Get_V2_AND}
  Create Session  endpoint    ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
  ${resp}=        Get Request   endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log             ${resp}
  ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
  ${responsejsondata1}       run keyword if      ${status}==True        To Json  ${resp.content}
  ${responsejsondata2}       run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
  ${responsejsondata}        set variable if     ${status}==True        ${responsejsondata1}      ${responsejsondata2}
  ${recVersionID}=       Get From Dictionary     ${responsejsondata1["npaList"][0]}     recVersionId
  ${NPA}=                Get From Dictionary     ${responsejsondata1["npaList"][0]}     npa
  #Close Session

AND_Retrieve
   #UserProfile Login        ${API_User_Credentials_Track2}
   [Tags]     REGRESSION  NA    Query  AND
   ${oauthToken}       Get Token
   ${response}     GET METHOD      ${oauthToken}     ${AND_URI}        ${SuccessResponse}
   log     ${response}
   dictionary should contain key       ${response}     startNPA
   ${NPA_List}     get from dictionary     ${response}         npaList
   log list     ${NPA_List}
   ${listLength}       get length      ${NPA_List}
   FOR   ${i}      IN RANGE    0      ${listLength}
          dictionary should contain key       ${NPA_List[${i}]}       recVersionId
          dictionary should contain key       ${NPA_List[${i}]}       npa
   END

   #Close Session

Query_Trouble_Referral_Number01
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  TRQ
  ${token}=             get token
  ${number}=            Set Variable          8995551212
  #${number}=            Set Variable          8005874510
  ${admin_flag}=        Set Variable          False
  Log        ${GET_TRQ}
  #/v3/ip/num/trq?numlist=
  ${GET_ACTION_URI}=    Set Variable          ${GET_TRQ}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*    Authorization=Bearer ${token}
  ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${number}   headers=${headers}
  Log             ${resp}
  ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
  ${responsejsondata1}       run keyword if      ${status}==True        To Json  ${resp.content}
  ${responsejsondata2}       run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
  ${responsejsondata}        set variable if     ${status}==True        ${responsejsondata1}      ${responsejsondata2}
  ${trqLst}=                 Get From Dictionary        ${responsejsondata1}                   TRQResult
  ${Lst}=                    Set Variable               ${trqLst[0]}
  ${listLength}=             get length                 ${Lst}
  LOG                        ${Lst}
  ${num}=                    Get from Dictionary         ${Lst}                                    num
  Should be equal            ${num}                      ${number}
  ${errList}=                Get from Dictionary         ${Lst}                                    errList
  ${err_msg}=                Get from Dictionary         ${errList[0]}                             errMsg
  Should be equal            ${err_msg}                  Invalid Toll-Free Number.
  ${err_code}=               Get from Dictionary         ${errList[0]}                             errCode
  Should be equal            ${err_code}                 805102
  #Close Session


Query_Trouble_Referral_Number02
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  TRQ
  ${token}=             get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqData}
  ${number}=            Set Variable          ${reservedTFN}
  ${admin_flag}=        Set Variable          False
  Log        ${GET_TRQ}
  ${GET_ACTION_URI}=    Set Variable          ${GET_TRQ}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*    Authorization=Bearer ${token}
  ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${number}   headers=${headers}
  Log             ${resp}
  ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
  ${responsejsondata1}       run keyword if      ${status}==True        To Json  ${resp.content}
  ${responsejsondata2}       run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
  ${responsejsondata}        set variable if     ${status}==True        ${responsejsondata1}      ${responsejsondata2}
  ${TRQResult}=          Get From Dictionary     ${responsejsondata1}                   TRQResult
  Log                    ${TRQResult}
  ${x}=                  Get Length              ${TRQResult}
  Log                    ${x}
  ${TRQLst}=             Set Variable if         ${x}==1       ${TRQResult[0]}
  Log                    ${TRQLst}
  ${num}=                Get From Dictionary     ${TRQLst}      num
  Should be equal        ${num}                  ${number}
  #Close Session


Query_Trouble_Referral_Number03

  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  TRQ
  ${token}=             get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqData}
  ${number}=            Create List           ${reservedTFN}
  Append to List        ${number}             8995551212
  ${admin_flag}=        Set Variable          False
  Log        ${GET_TRQ}
  ${GET_ACTION_URI}=    Set Variable          ${GET_TRQ}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*    Authorization=Bearer ${token}
  ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${number}   headers=${headers}
  Log             ${resp}
  ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
  ${responsejsondata1}       run keyword if      ${status}==True        To Json  ${resp.content}
  ${responsejsondata2}       run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
  ${responsejsondata}        set variable if     ${status}==True        ${responsejsondata1}      ${responsejsondata2}
  ${TRQResult}=          Get From Dictionary     ${responsejsondata1}                   TRQResult
  Log                    ${TRQResult}
  Pass Execution                  Test not working
  ${x}=                  Get Length              ${TRQResult}
  Log                    ${x}
  FOR   ${i}   IN RANGE    0      ${x}
        ${TRQLst}=             Set Variable            ${TRQResult[${i}]}
        Log                    ${TRQLst}
        ${num}=                Get From Dictionary     ${TRQLst}      num
        ${nnum}=                Evaluate      '${num}'.replace('[','')
        Log                    ${nnum}
        Should be equal as strings       ${nnum}                 ${number[${i}]}
  END
  #Close Session


Query_Trouble_Referral_Number04
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  TRQ
  ${token}=             get token
  ${number}=            Set Variable          8005874510
  ${admin_flag}=        Set Variable          False
  ${GET_ACTION_URI}=    Set Variable          ${GET_TRQ}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json, text/plain, */*    Authorization=Bearer ${token}
  ${resp}=    Get Request   endpoint    ${GET_ACTION_URI}${number}   headers=${headers}
  Log             ${resp}
  ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
  ${responsejsondata1}       run keyword if      ${status}==True        To Json  ${resp.content}
  ${responsejsondata2}       run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
  ${responsejsondata}        set variable if     ${status}==True        ${responsejsondata1}      ${responsejsondata2}
  ${trqLst}=                 Get From Dictionary        ${responsejsondata1}                   TRQResult
  ${Lst}=                    Set Variable               ${trqLst[0]}
  ${listLength}=             get length                 ${Lst}
  LOG                        ${Lst}
  ${num}=                    Get from Dictionary         ${Lst}                                    num
  Should be equal            ${num}                      ${number}
  Pass Execution             Should not be error.
  ${errList}=                Get from Dictionary         ${Lst}                                    errList
  ${err_msg}=                Get from Dictionary         ${errList[0]}                             errMsg
  Should be equal            ${err_msg}                  Invalid Toll-Free Number.
  ${err_code}=               Get from Dictionary         ${errList[0]}                             errCode
  Should be equal            ${err_code}                 805102
  #Close Session


Query_Number_Data_01
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query
  ${token}=               get token
  ${reservedTFN}=         get Reserve Random Number      ${token}     ${ReqData}
  ${numList}=             Create List            ${reservedTFN}
  ${Num_V2_QUERY}=        Set Variable           /v3/ip/num/tfn/query
  ${oauthToken}=          Set Variable           ${token}
  ${requestData}=         evaluate               json.loads('''${NUM_QRY_Data}''')       json
  set to dictionary       ${requestData}         numList=${numList}
  remove from dictionary  ${requestData}         requestDesc
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_QUERY}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${queryResult}      get from dictionary             ${resp}                queryResult
  ${x}                get length                      ${queryResult}
  Log                 ${x}
  FOR     ${i}       IN RANGE         0        ${x}
    ${responsedata}     get from list                   ${queryResult}         ${i}
    ${num}              get from dictionary             ${responsedata}        num
    should not be empty         ${num}
    ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${responsedata}   failReason
    Log                ${err_found}
    Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${responsedata}     failReason
    Run Keyword If    '${err_found}'=='False'         Get Status from Dictionary      ${responsedata}     status
    Run Keyword If    '${err_found}'=='False'         Get CtrlRO from Dictionary      ${responsedata}     ctrlRespOrgId
  END
  #Close Session


Query_Number_Data_02
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query
  ${token}=               get token
  ${reservedTFN}=         get Reserve Random Number      ${token}     ${ReqData}
  @{numList}=             Create List            ${reservedTFN}
  Append to list          ${numList}             8995551212
  Log                     ${numList}
  Log                     ${NUM_QRY_Data}
  ${Num_V2_QUERY}=        Set Variable           /v3/ip/num/tfn/query
  ${oauthToken}=          Set Variable           ${token}
  ${requestData}=         evaluate               json.loads('''${NUM_QRY_Data}''')    json
  set to dictionary       ${requestData}         numList=${numList}
  set to dictionary       ${requestData}         requestDesc=${numDesc}
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_QUERY}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     202
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  dictionary should contain key           ${resp}    blkId
  dictionary should contain key           ${resp}    subDtTm
  Sleep    30sec
  ${Bulk_Id}       get from dictionary    ${resp}    blkId
  ${MNQ_resp}      GET Method      ${token}      ${MNQ_GET_URI}/${Bulk_Id}        ${SuccessResponse}
  log   ${MNQ_resp}
  ${queryResult}      get from dictionary             ${MNQ_resp}                queryResult
  ${x}                get length                      ${queryResult}
  Log                 ${x}
  FOR     ${i}       IN RANGE         0        ${x}
    ${responsedata}     get from list                   ${queryResult}         ${i}
    ${num}              get from dictionary             ${responsedata}        num
    should not be empty         ${num}
    ${resultStatus}     get from dictionary             ${responsedata}        resultStatus
    should not be empty         ${resultStatus}
    ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${responsedata}   failReason
    Log                ${err_found}
    Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${responsedata}     failReason
    Run Keyword If    '${err_found}'=='False'         Get Status from Dictionary      ${responsedata}     status
    Run Keyword If    '${err_found}'=='False'         Get CtrlRO from Dictionary      ${responsedata}     ctrlRespOrgId
  END
  #Close Session

Update_Number_01
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Update
  ${token}=               get token
  ${reservedTFN}=         get Reserve Random Number      ${token}     ${ReqData}
  ${numList}=             Create List            ${reservedTFN}
  ${Num_V2_UPDT}=         Set Variable           /v3/ip/num/tfn/update
  ${oauthToken}=          Set Variable           ${token}
  ${shrtNotes}=           Set Variable           Added New EMAIL ADDRESS
  ${Reserved_State_Number}=        Set Variable                                   ${reservedTFN}
  ${responsedata}=        Do Number Query     ${token}    ${Reserved_State_Number}     ${SuccessResponse}
  log         ${responsedata}
  ${queryResult}          get from dictionary             ${responsedata}       queryResult
  ${responsedata}         get from list                   ${queryResult}        0
  ${effDtTm}              get from dictionary             ${responsedata}       effDt
  should not be empty                   ${effDtTm}
  ${recVersionId}         get from dictionary             ${responsedata}       recVersionId
  should not be empty                   ${recVersionId}
  ${status}               get from dictionary             ${responsedata}       status
  should be equal as strings            ${RESERVED}       ${status}
  ${numTFN}               get from dictionary             ${responsedata}       num
  ${previous_reservedTFN}=        Set Variable                                        ${reservedTFN}
  should be equal as strings            ${numTFN}      ${previous_reservedTFN}
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData["tfNumList"][0]}          recVersionId=${recVersionId}
  set to dictionary        ${requestData["tfNumList"][0]}          num=${reservedTFN}
  set to dictionary        ${requestData}                          email=${email}
  Set to dictionary        ${requestData}                          shrtNotes=${shrtNotes}
  remove from dictionary   ${requestData}                          conName
  remove from dictionary   ${requestData}                          conPhone
  remove from dictionary   ${requestData}                          resUntilDt
  remove from dictionary   ${requestData}                          status
  remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData}                          requestDesc
  remove from dictionary   ${requestData}                          asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_UPDT}     data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${updateResult}=      get from dictionary             ${resp}                    updateResult
  Convert to dictionary                                 ${updateResult}
  ${recVersionId}=      get from dictionary             ${updateResult[0]}            recVersionId
  ${num}=               get from dictionary             ${updateResult[0]}            num
  Set Suite Variable     ${num}
  #Close Session

Update_Number_02
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Update
  ${token}=               get token
  ${Num_V2_UPDT}=         Set Variable           /v3/ip/num/tfn/update
  ${oauthToken}=          Set Variable           ${token}
  ${shrtNotes}=           Set Variable           conName and ctrlRespOrgId
  ${ConName}=             Set Variable           Jim Petersen
  ${ctrlRespOrgId1}=      Set Variable           LGT01
  Set Suite Variable      ${ctrlRespOrgId1}
  ${reservedTFN}=         Set Variable           ${num}
  ${Reserved_State_Number}=        Set Variable                                   ${reservedTFN}
  ${responsedata}=        Do Number Query     ${token}    ${Reserved_State_Number}     ${SuccessResponse}
  ${queryResult}          get from dictionary             ${responsedata}       queryResult
  ${responsedata}         get from list                   ${queryResult}        0
  ${effDtTm}              get from dictionary             ${responsedata}       effDt
  should not be empty                   ${effDtTm}
  ${recVersionId}         get from dictionary             ${responsedata}       recVersionId
  should not be empty                   ${recVersionId}
  ${status}               get from dictionary             ${responsedata}       status
  should be equal as strings            ${RESERVED}       ${status}
  ${numTFN}               get from dictionary             ${responsedata}       num
  ${previous_reservedTFN}=        Set Variable                                        ${reservedTFN}
  should be equal as strings            ${numTFN}      ${previous_reservedTFN}
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData["tfNumList"][0]}          recVersionId=${recVersionId}
  set to dictionary        ${requestData["tfNumList"][0]}          num=${reservedTFN}
  #set to dictionary        ${requestData}                          email=${email}
  Set to dictionary        ${requestData}                          shrtNotes=${shrtNotes}
  Set to dictionary        ${requestData}                          conName=${conName}
  Set to dictionary        ${requestData}                          ctrlRespOrgId=${ctrlRespOrgId1}
  #remove from dictionary   ${requestData}                          conName
  remove from dictionary   ${requestData}                          conPhone
  remove from dictionary   ${requestData}                          resUntilDt
  remove from dictionary   ${requestData}                          status
  remove from dictionary   ${requestData}                          email
  #remove from dictionary   ${requestData}                          ctrlRespOrgId
  remove from dictionary   ${requestData}                          requestDesc
  remove from dictionary   ${requestData}                          asyncId
  Log                      ${requestData}
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_UPDT}     data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${updateResult}=      get from dictionary             ${resp}                       updateResult
  Convert to dictionary                                 ${updateResult}
  ${recVersionId}=      get from dictionary             ${updateResult[0]}            recVersionId
  ${same_num}=          get from dictionary             ${updateResult[0]}            num
  #Close Session

Query_Number_Data_03
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query
  ${token}=               get token
  ${Reserved_State_Number}=        Set Variable                                   ${num}
  ${responsedata}=        Do Number Query     ${token}    ${Reserved_State_Number}     ${SuccessResponse}
  ${queryResult}          get from dictionary             ${responsedata}       queryResult
  ${responsedata}         get from list                   ${queryResult}        0
  ${effDtTm}              get from dictionary             ${responsedata}       effDt
  should not be empty                   ${effDtTm}
  ${recVersionId}         get from dictionary             ${responsedata}       recVersionId
  should not be empty                   ${recVersionId}
  ${status}               get from dictionary             ${responsedata}       status
  should be equal as strings            ${RESERVED}       ${status}
  ${numTFN}               get from dictionary             ${responsedata}       num
  ${previous_reservedTFN}=        Set Variable                                        ${num}
  should be equal as strings            ${numTFN}      ${previous_reservedTFN}
  ${ctrlRespOrgId2}=      get from dictionary             ${responsedata}       ctrlRespOrgId
  should be equal as strings            ${ctrlRespOrgId2}      ${ctrlRespOrgId1}
  #Close Session


Search_Random_Numbers_01
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search
  ${token}=               get token
  ${Num_V2_RSCH}=         Set Variable           /v3/ip/num/tfn/random
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
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_RSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session


Search_Random_Numbers_02
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search
  ${token}=               get token
  ${Num_V2_RSCH}=         Set Variable           /v3/ip/num/tfn/random
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           3
  ${requestData}=         evaluate               json.loads('''${NUM_RSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         npa=844
  set to dictionary       ${requestData}         cons=N
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_RSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session

Search_Random_Numbers_03
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search
  ${token}=               get token
  ${Num_V2_RSCH}=         Set Variable           /v3/ip/num/tfn/random
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           6
  ${requestData}=         evaluate               json.loads('''${NUM_RSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         npa=866
  set to dictionary       ${requestData}         cons=N
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_RSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${numList}=             get from dictionary        ${resp}    numList
  ${x}=                   get length                 ${numList}
  should be equal as strings         ${x}                       ${qty}
  ${spare_numList}=       copy list                 ${numList}
  set suite variable      ${spare_numList}
  #Close Session

Search_Random_Numbers_04
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search
  ${token}=               get token
  ${Num_V2_RSCH}=         Set Variable           /v3/ip/num/tfn/random
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           10
  ${requestData}=         evaluate               json.loads('''${NUM_RSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         npa=877
  set to dictionary       ${requestData}         cons=N
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_RSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session




Search_Random_Numbers_05
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search
  ${token}=               get token
  ${Num_V2_RSCH}=         Set Variable           /v3/ip/num/tfn/random
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           13
  ${requestData}=         evaluate               json.loads('''${NUM_RSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         npa=888
  set to dictionary       ${requestData}         cons=N
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_RSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session

Search_Random_Numbers_06
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search
  ${token}=                 get token
  ${Num_V2_RSCH}=           Set Variable           /v3/ip/num/tfn/random
  ${oauthToken}=            Set Variable           ${token}
  ${qty}=                   Set variable           10
  ${invNPA}=                Set Variable           899
  ${cons}=                  Set Variable           N
  ${requestData}=           evaluate               json.loads('''${NUM_RSCH_Data}''')       json
  set to dictionary         ${requestData}         qty=${qty}
  set to dictionary         ${requestData}         npa=${invNPA}
  set to dictionary         ${requestData}         cons=${cons}
  remove from dictionary    ${requestData}         nxx
  remove from dictionary    ${requestData}         line
  remove from dictionary    ${requestData}         asyncId
  ${reqBody}=               evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_RSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}                  To Json            ${resp.content}
  log                      ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session


Search_Specific_Numbers_01
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search  Specific
  ${token}=                 get token
  ${Num_V2_SSCH}=           Set Variable           /v3/ip/num/tfn/specific
  ${oauthToken}=            Set Variable           ${token}
  #${reservedTFN}=           get Reserve Random Number      ${token}     ${ReqData}
  ${numList}=               Set variable           ${spare_numList}
  ${qty}=                   Set variable           6
  ${requestData}=           evaluate               json.loads('''${NUM_SSCH_Data}''')       json
  set to dictionary         ${requestData}         numList=${numList}
  remove from dictionary    ${requestData}         asyncId
  ${reqBody}=               evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_SSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}                  To Json            ${resp.content}
  log                      ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session

Search_Specific_Numbers_02
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search  Specific
  ${token}=                 get token
  ${Num_V2_SSCH}=           Set Variable           /v3/ip/num/tfn/specific
  ${oauthToken}=            Set Variable           ${token}
  ${reservedTFN}=           get Reserve Random Number      ${token}     ${ReqData}
  ${numList}=               Create List            ${reservedTFN}
  Append to List            ${numList}             8005874510
  ${qty}=                   Set variable           1
  ${requestData}=           evaluate               json.loads('''${NUM_SSCH_Data}''')       json
  set to dictionary         ${requestData}         numList=${numList}
  remove from dictionary    ${requestData}         asyncId
  ${reqBody}=               evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_SSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}                  To Json            ${resp.content}
  log                      ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session

Search_Specific_Numbers_03
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search  Specific
  ${token}=                 get token
  ${Num_V2_SSCH}=           Set Variable           /v3/ip/num/tfn/specific
  ${oauthToken}=            Set Variable           ${token}
  ${reservedTFN}=           get Reserve Random Number      ${token}     ${ReqData}
  ${numList}=               Create List            ${spare_numList[0]}
  Append to List            ${numList}             ${reservedTFN}
  Append to List            ${numList}             ${spare_numList[1]}
  Append to List            ${numList}             ${spare_numList[2]}
  Append to List            ${numList}             ${spare_numList[3]}
  Append to List            ${numList}             ${spare_numList[4]}
  ${qty}=                   Set variable           1
  ${requestData}=           evaluate               json.loads('''${NUM_SSCH_Data}''')       json
  set to dictionary         ${requestData}         numList=${numList}
  remove from dictionary    ${requestData}         asyncId
  ${reqBody}=               evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_SSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}                  To Json            ${resp.content}
  log                      ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session


Search_Wildcard_Numbers_01
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search  Wildcard
  ${token}=               get token
  ${Num_V2_WSCH}=         Set Variable           /v3/ip/num/tfn/wildcard
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           1
  ${wildCardNum}=         Set Variable           *&&*******
  ${requestData}=         evaluate               json.loads('''${NUM_WSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  #set to dictionary       ${requestData}         npa=833
  set to dictionary       ${requestData}         cons=N
  set to dictionary       ${requestData}         wildCardNum=${wildCardNum}
  remove from dictionary  ${requestData}         npa
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_WSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session


Search_Wildcard_Numbers_02
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search  Wildcard
  ${token}=               get token
  ${Num_V2_WSCH}=         Set Variable           /v3/ip/num/tfn/wildcard
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           5
  ${wildCardNum}=         Set Variable           *&&*****&&
  ${requestData}=         evaluate               json.loads('''${NUM_WSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         cons=Y
  set to dictionary       ${requestData}         wildCardNum=${wildCardNum}
  remove from dictionary  ${requestData}         npa
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_WSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Log                      ${err_found}
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList   ${qty}
  #Close Session


Search_Wildcard_Numbers_03
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search  Wildcard
  ${token}=               get token
  ${Num_V2_WSCH}=         Set Variable           /v3/ip/num/tfn/wildcard
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           5
  ${wildCardNum}=         Set Variable           *&&*******
  ${requestData}=         evaluate               json.loads('''${NUM_WSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         cons=Y
  set to dictionary       ${requestData}         wildCardNum=${wildCardNum}
  remove from dictionary  ${requestData}         npa
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_WSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Log                      ${err_found}
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session

Search_Wildcard_Numbers_04
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Search  Wildcard
  ${token}=               get token
  ${Num_V2_WSCH}=         Set Variable           /v3/ip/num/tfn/wildcard
  ${oauthToken}=          Set Variable           ${token}
  ${qty}=                 Set variable           5
  ${wildCardNum}=         Set Variable           *&&*******
  ${requestData}=         evaluate               json.loads('''${NUM_WSCH_Data}''')       json
  set to dictionary       ${requestData}         qty=${qty}
  set to dictionary       ${requestData}         cons=Y
  set to dictionary       ${requestData}         wildCardNum=${wildCardNum}
  remove from dictionary  ${requestData}         npa
  remove from dictionary  ${requestData}         nxx
  remove from dictionary  ${requestData}         line
  remove from dictionary  ${requestData}         asyncId
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Put Request        endpoint       ${Num_V2_WSCH}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}
  log          ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Log                      ${err_found}
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session

Reserve_Numbers_01
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Reserve
  ${token}=                 get token
  ${Num_V2_RSV}=            Set Variable           /v3/ip/num/tfn/reserve
  ${oauthToken}=            Set Variable           ${token}
  ${conName}=               Set Variable           Jim Petersen
  ${conTel}=                Set Variable           9089565118
  #${reservedTFN}=           get Reserve Random Number      ${token}     ${ReqData}
  ${numList}=               Create List            ${spare_numList[0]}
  #Append to List            ${numList}             ${reservedTFN}
  #Append to List            ${numList}             ${spare_numList[1]}
  #Append to List            ${numList}             ${spare_numList[2]}
  #Append to List            ${numList}             ${spare_numList[3]}
  #Append to List            ${numList}             ${spare_numList[4]}
  ${qty}=                   Set variable           1
  ${requestData}=           evaluate               json.loads('''${NUM_RSRV_Data}''')       json
  set to dictionary         ${requestData}         conName=${conName}
  set to dictionary         ${requestData}         conTel=${conTel}
  #set to dictionary         ${requestData}         wildCardNum=${wildCardNum}
  #remove from dictionary    ${requestData}         npa
  #remove from dictionary    ${requestData}         nxx
  #remove from dictionary    ${requestData}         line
  #remove from dictionary    ${requestData}         asyncId
  set to dictionary         ${requestData}         numList=${numList}
  remove from dictionary    ${requestData}         asyncId
  ${reqBody}=               evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Post Request        endpoint       ${Num_V2_RSV}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}                  To Json            ${resp.content}
  log                      ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session


Reserve_Numbers_02
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Reserve
  ${token}=                 get token
  ${Num_V2_RSV}=            Set Variable           /v3/ip/num/tfn/reserve
  ${oauthToken}=            Set Variable           ${token}
  ${conName}=               Set Variable           Jim Petersen
  ${conTel}=                Set Variable           9089565118
  ${reservedTFN}=           get Reserve Random Number      ${token}     ${ReqData}
  ${numList}=               Create List            ${spare_numList[5]}
  Append to List            ${numList}             ${reservedTFN}
  ${qty}=                   Set variable           2
  ${requestData}=           evaluate               json.loads('''${NUM_RSRV_Data}''')       json
  set to dictionary         ${requestData}         conName=${conName}
  set to dictionary         ${requestData}         conTel=${conTel}
  set to dictionary         ${requestData}         numList=${numList}
  remove from dictionary    ${requestData}         asyncId
  ${reqBody}=               evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Post Request        endpoint       ${Num_V2_RSV}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}                  To Json            ${resp.content}
  log                      ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session


Reserve_Numbers_03
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Reserve
  ${token}=                 get token
  ${Num_V2_RSV}=            Set Variable           /v3/ip/num/tfn/reserve
  ${reservedTFN}=           get Reserve Random Number      ${token}     ${ReqData}
  ${oauthToken}=            Set Variable           ${token}
  ${conName}=               Set Variable           Jim Petersen
  ${conTel}=                Set Variable           ${reservedTFN}
  ${numList}=               Create List            ${spare_numList[4]}
  Append to List            ${numList}             ${reservedTFN}
  ${qty}=                   Set variable           2
  ${requestData}=           evaluate               json.loads('''${NUM_RSRV_Data}''')       json
  set to dictionary         ${requestData}         conName=${conName}
  set to dictionary         ${requestData}         conTel=${conTel}
  set to dictionary         ${requestData}         numList=${numList}
  #remove from dictionary    ${requestData}         conTel
  remove from dictionary    ${requestData}         asyncId
  ${reqBody}=               evaluate               json.dumps(${requestData})    json
  Create Session            endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}
  ${resp}=     Post Request        endpoint       ${Num_V2_RSV}    data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}                  To Json            ${resp.content}
  log                      ${resp}
  ${err_found}     Run Keyword and Return Status    Dictionary Should Contain Key   ${resp}     errList
  Run Keyword If    '${err_found}'=='True'          Get Errors from dictionary      ${resp}     errList
  Run Keyword If    '${err_found}'=='False'         Get Numbers from dictionary     ${resp}     numList    ${qty}
  #Close Session



Retrieve_Reserved_Number_List
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  RNL
  ${token}=                   get token
  ${Num_V2_RNL}=              Set Variable           /v3/ip/num/rnl
  ${GET_ACTION_URI}=          Set Variable           ${NUM_V2_RNL}
  Create Session  endpoint    ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
  ${resp}=        Get Request   endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
  ${responsejsondata1}       run keyword if      ${status}==True        To Json  ${resp.content}
  ${responsejsondata2}       run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
  ${responsejsondata}        set variable if     ${status}==True        ${responsejsondata1}      ${responsejsondata2}
  Log                        ${responsejsondata1}
  ${rsv_Until_Dt}=           get Time                     year month day            UTC + 1 day
  ${form_Dt}=                Set variable                 ${rsv_Until_Dt}[0]-${rsv_Until_Dt}[1]-${rsv_Until_Dt}[2]
  ${TFN_List}=               get from dictionary          ${responsejsondata1}      numList
  ${len_TFN_List}=           get length                   ${TFN_List}
  #${len_TFN_List_2}=         evaluate                     ${len_TFN_List} / 2
  #${index}=                  Convert to Integer           ${len_TFN_List_2}
  ${index}=                  Convert to Integer           ${len_TFN_List}

  FOR     ${i}       IN RANGE         0        ${index}
        ${number}=                 get from dictionary          ${TFN_List[${i}]}            num
        Update Reserved to Spare    ${token}    ${number}
  END
  #Close Session

Retrieve_Number_Reservation_Limits
  #UserProfile Login        ${API_User_Credentials_Track2}
  [Tags]     REGRESSION  NA    Query  Reserve Limits
  ${token}=                   get token
  ${reservedTFN}=             get Reserve Random Number      ${token}     ${ReqData}
  ${numList}=                 Create List            ${reservedTFN}
  ${NUM_V2_NRL}=              Set Variable          /v3/ip/num/res/limits
  ${GET_ACTION_URI}=          Set Variable          ${NUM_V2_NRL}
  Create Session  endpoint    ${HOST}
  ${headers}=     Create Dictionary  Content-Type=application/json   Accept=application/json      Authorization=Bearer ${token}
  ${resp}=        Get Request   endpoint    ${GET_ACTION_URI}   headers=${headers}
  Log                         ${resp}
  ${status}       run keyword and return status       should be equal as Strings     ${resp.status_code}     ${status_code}
  ${responsejsondata1}       run keyword if      ${status}==True        To Json  ${resp.content}
  ${responsejsondata2}       run keyword if      ${status}==False       Retrieve Response For 202 Success Response      ${token}       ${resp}        ${GET_ACTION_URI}     ${202Accepted}
  ${responsejsondata}        set variable if     ${status}==True        ${responsejsondata1}      ${responsejsondata2}
  Log                        ${responsejsondata1}
  ${entity}=                 get from dictionary          ${responsejsondata1}            entity
  ${remainingRes}=           get from dictionary          ${responsejsondata1}            remainingRes
  ${maxResLimit}=            get from dictionary          ${responsejsondata1}            maxResLimit
  ${resNumCnt}=              get from dictionary          ${responsejsondata1}            resNumCnt
  ${chkremainingRes}=        evaluate       ${maxResLimit} - ${resNumCnt}
  Should be equal            ${remainingRes}        ${chkremainingRes}
  #Close Session


Close_session_with_Resp_Org
    Close Session

*** Keywords ***


Update Reserved Until Date
  [Arguments]    ${token}    ${number}    ${new_Date}
  ${Num_V2_UPDT}=          set variable        /v3/ip/num/tfn/update
  ${responsedata}=         Do Number Query     ${token}    ${number}     ${SuccessResponse}
  ${queryResult}=          get from dictionary             ${responsedata}       queryResult
  ${responsedata}=         get from list                   ${queryResult}        0
  ${recVersionId}=         get from dictionary             ${responsedata}       recVersionId
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData["tfNumList"][0]}             recVersionId=${recVersionId}
  set to dictionary        ${requestData["tfNumList"][0]}             num=${number}
  set to dictionary        ${requestData}                             resUntilDt=${new_Date}
  remove from dictionary   ${requestData}                             conPhone
  remove from dictionary   ${requestData}                             conName
  remove from dictionary   ${requestData}                             status
  remove from dictionary   ${requestData}                             email
  remove from dictionary   ${requestData}                             ctrlRespOrgId
  remove from dictionary   ${requestData}                             requestDesc
  remove from dictionary   ${requestData}                             asyncId
  remove from dictionary   ${requestData}                             shrtNotes
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  Create Session          endpoint               ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}
  ${resp}=     Put Request        endpoint       ${Num_V2_UPDT}     data=${reqBody}               headers=${headers}
  should be equal as Strings      ${resp.status_code}     ${status_code}
  ${resp}      To Json            ${resp.content}

Update Reserved to Spare
  [Arguments]    ${token}    ${number}
  ${Num_V2_UPDT}=          set variable        /v3/ip/num/tfn/update
  ${responsedata}=         Do Number Query     ${token}    ${number}     ${SuccessResponse}
  ${queryResult}=          get from dictionary             ${responsedata}       queryResult
  ${responsedata}=         get from list                   ${queryResult}        0
  ${recVersionId}=         get from dictionary             ${responsedata}       recVersionId
  ${requestData}=          evaluate               json.loads('''${NUM_UPDT_Data}''')       json
  set to dictionary        ${requestData["tfNumList"][0]}             recVersionId=${recVersionId}
  set to dictionary        ${requestData["tfNumList"][0]}             num=${number}
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
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}
  ${resp}=     Put Request        endpoint       ${Num_V2_UPDT}     data=${reqBody}               headers=${headers}
  Parse Return Code               ${resp}        Parse Update Response

Parse Update Response
  [Arguments]       ${response}
  Dictionary Should Contain Key    ${response}       updateResult
  ${updateResult}=                 get from dictionary          ${response}        updateResult


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



Get Errors from dictionary
  [Arguments]       ${dictionary_name}   ${key}

  ${errList}=                Get from Dictionary         ${dictionary_name}                     ${key}
  Should not be empty         ${errList}
  Log   ${errList}
  ${err_msg}=                Get from Dictionary         ${errList[0]}                             errMsg
  ${err_code}=               Get from Dictionary         ${errList[0]}                             errCode


Get Numbers from dictionary
  [Arguments]       ${dictionary_name}   ${key}  ${qty}
  ${numList}=             get from dictionary       ${dictionary_name}     ${key}
  ${x}=                   get length                ${numList}
  should be equal as strings        ${x}                      ${qty}


Get Status from Dictionary
  [Arguments]       ${dictionary_name}   ${key}

  ${numStatus}=      get from dictionary    ${dictionary_name}    ${key}
  Should not be Empty             ${numStatus}
  should be equal as strings      ${RESERVED}     ${numStatus}
  Log     ${numStatus}

Get CtrlRO from Dictionary
  [Arguments]       ${dictionary_name}   ${key}

  ${CtrlRO}=      get from dictionary    ${dictionary_name}    ${key}
  Should not be Empty             ${CtrlRO}
  Log     ${CtrlRO}
