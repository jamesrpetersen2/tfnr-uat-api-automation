*** Settings ***
Documentation   This Suite Consists of API for the Number Administration Microservice
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
${API_Admin_User_Credentials_for_UAT_AWS}     {"usrName": "${UAT_AWS_Admin_USER}","password": "${UAT_AWS_Admin_PASSWORD}","withPerm": true}
${ReqBody_Mandatory_params}                   {"num":"8556664830","cmd":"U","effDtTm":"2018-03-10T10:00Z","agent":"NEWAG","notes":"NEW CAD","onAccCust":"1234A","endSubAddr":"NEW SAMPLE endSubAddr","suppFormNum":"adcdqw","svcOrderNum":"asagh","intraLATACarrier":["0555"],"interLATACarrier":["0555"],"aos":{"aosNet":["${validAosNet_CRO}"]},"destNums":[{"destNum":"8556664830","numTermLine":100}]}
#${Password_Change_Data}                       {"usrName": "${UAT_AWS_USER}","oldPassword": "${UAT_AWS_Admin_PASSWORD}","newPassword": "${UAT_AWS_Admin_PASSWORD}"}
${UCI_UPDT_Data}                              {"loginId": "string","primaryEmail": "user@example.com","ntfnInd": "Y","conName": "string","conPhone": "string","shrtNotes": "string","prefTmZn": "A","recVersionId": "string"}
${NUM_QRY_Data}                               {"numList": ["8555551212"]}
${NUM_UPDT_Data}                              {"tfNumList": [{"num": "string","recVersionId": "string"}],"requestDesc": "string","email": "user@example.com","ctrlRespOrgId": "string","conName": "string","conPhone": "string","resUntilDt": "string","status": "SPARE","shrtNotes": "string","asyncId": "string"}
${ReqData}                                    {"conName":"PALLA","conTel":"${UserProfileCreate_PhoneNum}"}
${NUM_RSCH_Data}                              {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string"}
${NUM_SSCH_Data}                              {"numList": ["string"],"asyncId": "string"}
${NUM_WSCH_Data}                              {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","asyncId": "string","wildCardNum": "string"}
${NUM_RSRV_Data}                              {"conName": "string","conTel": "string","shrtNotes": "string","numList": ["string"],"asyncId": "string"}
${NUM_RRSV_Data}            {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","conName": "string","conTel": "string","shrtNotes": "string","asyncId": "string"}
${NUM_WRSV_Data}            {"qty": 1,"npa": "string","nxx": "string","line": "string","cons": "Y","conName": "string","conTel": "string","shrtNotes": "string","asyncId": "string","wildCardNum": "string"}



*** Test Cases ***

TC000 OpenSession_Login_with_Resp_Org
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

 TC001 Query_a_Reserved_TFN
   ###############################################################################################################
   BuiltIn.Comment                RESERVE A TOLL FREE NUMBER
   ###############################################################################################################
   ${token}         get token
   ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
   set test variable     ${reservedTFN}
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
   ###############################################################################################################
   ${numList}=             Create List            ${reservedTFN}
   #${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
   Create Session        endpoint              ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}     Accept-Version=${Accept-Version}
   #${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
   #Log             ${resp}
   ${keyword}=     set variable       Parse Number Query Response
   #Parse Return Code   ${resp}        ${keyword}
   #should be equal     ${Query_status}        ${RESERVED}
   ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query
   ${requestData}=         evaluate               json.loads('''${NUM_QRY_Data}''')       json
   set to dictionary       ${requestData}         numList=${numList}
   ${reqBody}=             evaluate               json.dumps(${requestData})    json
   ${resp}=     Put Request   endpoint    ${GET_ACTION_URI}        data=${reqBody}        headers=${headers}
   Parse Return Code   ${resp}        ${keyword}
   Add to Transaction Total   ${reservedTFN};${Query_effDt};${Query_resUntilDt};${Query_status}  ${ROID}   ${HOST}
   #Add to Transaction Total   ${reservedTFN};${CAD_EffDT}:${CAD_Status}  ${resporgId}  ${HOST}






 TC002 Search_for_one_Random_TFN
   [Documentation]  Accept-Version = ${Accept-Version}

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
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log          ${resp}
   ${keyword}=     set variable       Parse Number Search Response
   Parse Return Code   ${resp}        ${keyword}
   set suite variable    ${spare_number}         ${number}


 TC003 Search_for_ten_Random_TFNs
   [Documentation]  Accept-Version = ${Accept-Version}

   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=S (RANDOM)
   ###############################################################################################################
   ${token}=               get token
   ${GET_ACTION_URI}=         Set Variable           /v3/ip/num/tfn/random
   ${oauthToken}=          Set Variable           ${token}
   ${qty}=                 Set variable           10
   ${requestData}=         evaluate               json.loads('''${NUM_RSCH_Data}''')       json
   set to dictionary       ${requestData}         qty=${qty}
   set to dictionary       ${requestData}         npa=833
   set to dictionary       ${requestData}         cons=N
   remove from dictionary  ${requestData}         npa
   remove from dictionary  ${requestData}         nxx
   remove from dictionary  ${requestData}         line
   remove from dictionary  ${requestData}         asyncId
   ${reqBody}=             evaluate               json.dumps(${requestData})    json
   Create Session          endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log          ${resp}
   ${keyword}=     set variable       Parse Number Search Response
   Parse Return Code   ${resp}        ${keyword}
   Log List  ${src_numList}
   ${X}=      get length     ${src_numList}
   FOR    ${index}    IN RANGE     0  ${X}
         ${Number_Status}=     Get TFN Status     ${token}      ${src_numList[${index}]}
         should be equal      ${Number_Status}     ${SPARE}
   END

 TC004 Search_for_ten_Random_TFNs_2
   [Documentation]  Accept-Version = ${Accept-Version}

   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=S (RANDOM)
   ###############################################################################################################
   ${token}=               get token
   ${GET_ACTION_URI}=         Set Variable           /v3/ip/num/tfn/random
   ${oauthToken}=          Set Variable           ${token}
   ${qty}=                 Set variable           10
   ${requestData}=         evaluate               json.loads('''${NUM_RSCH_Data}''')       json
   set to dictionary       ${requestData}         qty=${qty}
   set to dictionary       ${requestData}         npa=800
   set to dictionary       ${requestData}         nxx=999
   #set to dictionary       ${requestData}         line=9000
   set to dictionary       ${requestData}         cons=N
   #remove from dictionary  ${requestData}         npa
   #remove from dictionary  ${requestData}         nxx
   remove from dictionary  ${requestData}         line
   remove from dictionary  ${requestData}         asyncId
   ${reqBody}=             evaluate               json.dumps(${requestData})    json
   Create Session          endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log          ${resp}
   ${keyword}=     set variable       Parse Number Search Response
   Parse Return Code   ${resp}        ${keyword}
   Log List  ${src_numList}
   ${X}=      get length     ${src_numList}
   FOR    ${index}    IN RANGE     0  ${X}
         ${Number_Status}=     Get TFN Status     ${token}      ${src_numList[${index}]}
         should be equal      ${Number_Status}     ${SPARE}
   END



 TC005 Search_for_one_Specific_TFN
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUM="${spare_number}";
   ...      RSP-NSR:,2020-08-07,10-09-48- CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM=${spare_number}
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=S (SPECIFIC)
   ###############################################################################################################
   ${token}=               get token
   ${GET_ACTION_URI}=        Set Variable           /v3/ip/num/tfn/specific
   ${oauthToken}=            Set Variable           ${token}
   ${numList}=               Create List            ${spare_number}
   ${requestData}=           evaluate               json.loads('''${NUM_SSCH_Data}''')       json
   set to dictionary         ${requestData}         numList=${numList}
   remove from dictionary    ${requestData}         asyncId
   ${reqBody}=               evaluate               json.dumps(${requestData})    json
   Create Session          endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log          ${resp}
   ${keyword}=     set variable       Parse Number Search Response
   Parse Return Code   ${resp}        ${keyword}
   Log List  ${src_numList}
   ${X}=      get length     ${src_numList}
   FOR    ${index}    IN RANGE     0  ${X}
         ${Number_Status}=     Get TFN Status     ${token}      ${src_numList[${index}]}
         should be equal      ${Number_Status}     ${SPARE}
   END


 TC006 Search/Reserve_for_one_Specific_TFN
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=R,NUM="${spare_number}";
   ...      RSP-NSR:,2020-08-07,10-09-48- CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM=${spare_number}
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=R (SPECIFIC)
   ###############################################################################################################
   ${token}=                 get token
   ${GET_ACTION_URI}=        Set Variable           /v3/ip/num/tfn/srchres/specific
   set test variable         ${GET_ACTION_URI}
   ${oauthToken}=            Set Variable           ${token}
   ${conName}=               Set Variable           JAMES PETERSEN
   ${conTel}=                Set Variable           9089565118
   ${numList}=               Create List            ${spare_number}
   ${requestData}=           evaluate               json.loads('''${NUM_SSCH_Data}''')       json
   set to dictionary         ${requestData}         numList=${numList}
   set to dictionary         ${requestData}         conName=${conName}
   set to dictionary         ${requestData}         conTel=${conTel}
   remove from dictionary    ${requestData}         asyncId
   ${reqBody}=               evaluate               json.dumps(${requestData})    json
   Create Session            endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log                  ${resp}
   ${keyword}=          set variable       Parse Number Reserve Response
   Parse Return Code    ${resp}            ${keyword}
   ###############################################################################################################
   BuiltIn.Comment                CHECK THAT TFN IS RESERVED
   ###############################################################################################################
   Log List  ${rsv_numList}
   ${X}=      get length     ${rsv_numList}
   FOR    ${index}    IN RANGE     0  ${X}
         ${Number_Status}=     Get TFN Status     ${token}      ${rsv_numList[${index}]}
         Run Keyword If      '${Number_Status}'=='${RESERVED}'    Spare Reserved TFN     ${token}    ${rsv_numList[${index}]}
   END




 TC007 Search_for_several_Wildcard_TFNs_and_Reserve_one
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=S,QT=2,CONT=N,NUM="866*******";
   ...      RSP-NSR:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=02:NUM="866*******":NUM="866*******"
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=S (WILDCARD)
   ###############################################################################################################
   ${token}=               get token
   ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/wildcard
   ${oauthToken}=          Set Variable           ${token}
   ${qty}=                 Set variable           5
   ${wildCardNum}=         Set Variable           *****CASH*
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
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log          ${resp}
   set test variable    ${GET_ACTION_URI}
   ${keyword}=     set variable       Parse Number Search Response
   Parse Return Code   ${resp}        ${keyword}
   set test variable   ${src_numList}
   ${X}=      get length     ${src_numList}
   FOR    ${index}    IN RANGE     0  ${X}
         ${Number_Status}=     Get TFN Status     ${token}      ${src_numList[${index}]}
         should be equal      ${Number_Status}     ${SPARE}
   END
   ###############################################################################################################
   ${token}=                 get token
   ${GET_ACTION_URI}=        Set Variable           /v3/ip/num/tfn/srchres/specific
   ${oauthToken}=            Set Variable           ${token}
   ${conName}=               Set Variable           JAMES PETERSEN
   ${conTel}=                Set Variable           9089565118
   ${numList}=               Create List            ${src_numList[2]}
   ${requestData}=           evaluate               json.loads('''${NUM_SSCH_Data}''')       json
   set to dictionary         ${requestData}         numList=${numList}
   set to dictionary         ${requestData}         conName=${conName}
   set to dictionary         ${requestData}         conTel=${conTel}
   remove from dictionary    ${requestData}         asyncId
   ${reqBody}=               evaluate               json.dumps(${requestData})    json
   Create Session            endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log                  ${resp}
   ${keyword}=          set variable       Parse Number Reserve Response
   Parse Return Code    ${resp}            ${keyword}
   ###############################################################################################################
   BuiltIn.Comment                CHECK THAT TFN IS RESERVED
   ###############################################################################################################
   Log List  ${rsv_numList}
   ${X}=      get length     ${rsv_numList}
   FOR    ${index}    IN RANGE     0  ${X}
         ${Number_Status}=     Get TFN Status     ${token}      ${rsv_numList[${index}]}
         Run Keyword If      '${Number_Status}'=='${RESERVED}'    Spare Reserved TFN     ${token}    ${rsv_numList[${index}]}
   END



 TC008 Search_and_Reserve_for_two_Random_TFNs
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=R,NCON="SOMOS",CTEL="9089565118",NPA=866;
   ...      RSP-NSR:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM="866*******"
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
   #remove from dictionary  ${requestData}         qty
   remove from dictionary  ${requestData}         cons
   remove from dictionary  ${requestData}         shrtNotes
   remove from dictionary  ${requestData}         line
   remove from dictionary  ${requestData}         asyncId
   ${reqBody}=             evaluate               json.dumps(${requestData})    json
   Create Session            endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log          ${resp}
   ${keyword}=     set variable       Parse Number Reserve Response
   Parse Return Code   ${resp}        ${keyword}
   Log List  ${rsv_numList}
   ${X}=      get length     ${rsv_numList}
   FOR    ${index}    IN RANGE     0  ${X}
         ${Number_Status}=     Get TFN Status     ${token}      ${rsv_numList[${index}]}
         Run Keyword If      '${Number_Status}'=='${RESERVED}'    Spare Reserved TFN     ${token}    ${rsv_numList[${index}]}
   END



 TC009 Search_and_Reserve_for_one_Wildcard_TFN
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=R,NCON="SOMOS",CTEL="9089565118":QT=1:NUM="8**9**0023";
   ...      RSP-NSR:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM="8**9**0023"
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
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Post Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log          ${resp}
   ${keyword}=     set variable       Parse Number Reserve Response
   Parse Return Code   ${resp}        ${keyword}
   ${X}=      get length     ${rsv_numList}
   FOR    ${index}    IN RANGE     0  ${X}
         ${Number_Status}=     Get TFN Status     ${token}      ${rsv_numList[${index}]}
         Run Keyword If      '${Number_Status}'=='${RESERVED}'    Spare Reserved TFN     ${token}    ${rsv_numList[${index}]}
   END



 TC010 Spare_one_Reserved_TFN
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUM="${reservedTFN}";
   ...      RSP-NSC:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUM=${reservedTFN}
   [Tags]     D-13864
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
   ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
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
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse Number Update Response
   Parse Return Code   ${resp}        ${keyword}
   ${Number_Status}=     Get TFN Status     ${token}      ${reservedTFN}
   should be equal      ${Number_Status}     ${SPARE}


TC011 Spare_one_Reserved_TFN_2
  #Pass Execution    Work in Progress.
  ${token}         get token
  ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
  set test variable     ${reservedTFN}
  ${numList}=             Create List            ${reservedTFN}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}     Accept-Version=${Accept-Version}
  ${keyword}=     set variable       Parse Number Query Response
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query
  ${requestData}=         evaluate               json.loads('''${NUM_QRY_Data}''')       json
  set to dictionary       ${requestData}         numList=${numList}
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  ${resp}=     Put Request   endpoint    ${GET_ACTION_URI}        data=${reqBody}        headers=${headers}
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
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Number Update Response
  Parse Return Code   ${resp}        ${keyword}
  ${Number_Status}=     Get TFN Status     ${token}      ${reservedTFN}
  should be equal      ${Number_Status}     ${SPARE}



 TC012 Change_Parameters_of_one_Reserved_TFN
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUM="${reservedTFN}";
   ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=C,NUM="",NEWRO=BRSAC,RU="",NCON="HELLO WORLD ";
   ...      Change conName, ctrlRespOrgId
   [Tags]     D-13864
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
   ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
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
   remove from dictionary   ${requestData}                             status
   remove from dictionary   ${requestData}                             email
   remove from dictionary   ${requestData}                             requestDesc
   remove from dictionary   ${requestData}                             asyncId
   remove from dictionary   ${requestData}                             shrtNotes
   ${reqBody}=             evaluate               json.dumps(${requestData})    json
   Create Session          endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse Number Update Response
   Parse Return Code   ${resp}        ${keyword}
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
   ###############################################################################################################
   ${token}         get token
   ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
   Create Session        endpoint              ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
   ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
   Log             ${resp}
   ${keyword}=     set variable       Parse Number Query Response
   Parse Return Code   ${resp}        ${keyword}
   ${Number_Status}=     Get TFN Status     ${token}      ${reservedTFN}
   should be equal      ${Number_Status}     ${RESERVED}


 TC013 Change_Parameters_of_one_Reserved_TFN_2
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUM="${reservedTFN}";
   ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=C,NUM="",NEWRO=BRSAC,RU="",NCON="HELLO WORLD ";
   ...      Change conName, ctrlRespOrgId
   [Tags]     D-13740
   #Pass Execution    Work in Progress.
   ${token}         get token
   ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
   set test variable     ${reservedTFN}
   ${numList}=             Create List            ${reservedTFN}
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
   ###############################################################################################################
   Create Session        endpoint              ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}     Accept-Version=${Accept-Version}
   ${keyword}=     set variable       Parse Number Query Response
   ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query
   ${requestData}=         evaluate               json.loads('''${NUM_QRY_Data}''')       json
   set to dictionary       ${requestData}         numList=${numList}
   ${reqBody}=             evaluate               json.dumps(${requestData})    json
   ${resp}=     Put Request   endpoint    ${GET_ACTION_URI}        data=${reqBody}        headers=${headers}
   ${keyword}=     set variable       Parse Number Query Response
   Parse Return Code   ${resp}        ${keyword}
   Add to Transaction Total   ${reservedTFN};${Query_effDt};${Query_resUntilDt};${Query_status}  ${ROID}  ${HOST}
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
   remove from dictionary   ${requestData}                             status
   remove from dictionary   ${requestData}                             email
   remove from dictionary   ${requestData}                             requestDesc
   remove from dictionary   ${requestData}                             asyncId
   remove from dictionary   ${requestData}                             shrtNotes
   ${reqBody}=             evaluate               json.dumps(${requestData})    json
   Create Session          endpoint               ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse Number Update Response
   Parse Return Code   ${resp}        ${keyword}
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
   ###############################################################################################################
   Create Session        endpoint              ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}     Accept-Version=${Accept-Version}
   ${keyword}=     set variable       Parse Number Query Response
   ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query
   ${requestData}=         evaluate               json.loads('''${NUM_QRY_Data}''')       json
   set to dictionary       ${requestData}         numList=${numList}
   ${reqBody}=             evaluate               json.dumps(${requestData})    json
   ${resp}=     Put Request   endpoint    ${GET_ACTION_URI}        data=${reqBody}        headers=${headers}
   ${keyword}=     set variable       Parse Number Query Response
   Parse Return Code   ${resp}        ${keyword}
   ${Number_Status}=     Get TFN Status     ${token}      ${reservedTFN}
   should be equal      ${Number_Status}     ${RESERVED}
   Add to Transaction Total   ${reservedTFN};${Query_effDt};${Query_resUntilDt};${Query_status}  ${ROID}   ${HOST}




 TC014 Spare_one_Reserved_TFN_Automation
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUML="${reservedTFN}";
   ...      RSP-NSC:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUML=${reservedTFN}
   [Tags]      D-13864
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
   ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
   ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
   Log             ${resp}
   ${keyword}=     set variable       Parse Number Query Response
   Parse Return Code   ${resp}        ${keyword}
   Add to Transaction Total   ${reservedTFN};${Query_effDt};${Query_resUntilDt};${Query_status}  ${ROID}  ${HOST}
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
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse Number Update Response
   Parse Return Code   ${resp}        ${keyword}
   ${Number_Status}=     Get TFN Status     ${token}      ${reservedTFN}
   should be equal      ${Number_Status}     ${SPARE}




 TC015 Spare_one_Reserved_TFN_Automation_2
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSC::::::ID=BRMGIU1,RO=BRSAC,AC=S,NUML="${reservedTFN}";
   ...      RSP-NSC:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=01:NUML=${reservedTFN}
   #Pass Execution    Work in Progress.
   ${token}         get token
   ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
   set test variable     ${reservedTFN}
   ${numList}=             Create List            ${reservedTFN}
   #Append to List          ${numList}             8003569377
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
   ###############################################################################################################
   Create Session        endpoint              ${HOST}
   ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}     Accept-Version=${Accept-Version}
   ${keyword}=     set variable       Parse Number Query Response
   ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query
   ${requestData}=         evaluate               json.loads('''${NUM_QRY_Data}''')       json
   set to dictionary       ${requestData}         numList=${numList}
   ${reqBody}=             evaluate               json.dumps(${requestData})    json
   ${resp}=     Put Request   endpoint    ${GET_ACTION_URI}        data=${reqBody}        headers=${headers}
   Parse Return Code   ${resp}        ${keyword}
   Add to Transaction Total   ${reservedTFN};${Query_effDt};${Query_resUntilDt};${Query_status}  ${ROID}   ${HOST}
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
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse Number Update Response
   Parse Return Code   ${resp}        ${keyword}
   ${Number_Status}=     Get TFN Status     ${token}      ${reservedTFN}
   should be equal      ${Number_Status}     ${SPARE}




 TC016 Query_Several_TFN_Automation
   [Documentation]  Accept-Version = ${Accept-Version}
   [Tags]     D-13884
   #Pass Execution    Automation API doesn't work yet.
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
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse Multi Number Query Response
   ${blkType}=     set variable       mnq
   set test variable        ${blkType}
   Sleep  1m
   Parse Return Code   ${resp}        ${keyword}




 TC017 Query_one_TFN_Automation
   [Documentation]  Accept-Version = ${Accept-Version}
   [Tags]     D-13884
   #Pass Execution    Automation API doesn't work yet.
   ${token}         get token
   ${reservedTFN}=       get Reserve Random Number      ${token}     ${ReqBody_Reservetfn}
   set test variable     ${reservedTFN}
   ${numList}=             Create List           ${reservedTFN}
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
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
   ${keyword}=     set variable       Parse Number Query Response
   Parse Return Code   ${resp}        ${keyword}
   Add to Transaction Total   ${reservedTFN};${Query_effDt};${Query_resUntilDt};${Query_status}  ${ROID}   ${HOST}

 TC018 Search_for_many_Wildcard_TFNs
   [Documentation]  Accept-Version = ${Accept-Version}
   ...      REQ-NSR::::::ID=BRMGIU1,RO=BRSAC,AC=S,QT=2,CONT=N,NUM="866*******";
   ...      RSP-NSR:,2020-08-07,10-09-48-CST:::COMPLD,00::ID=BRMGIU1,RO=BRSAC:CNT=02:NUM="866*******":NUM="866*******"
   ###############################################################################################################
   BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=S (WILDCARD)
   ###############################################################################################################
   ${token}=               get token
   ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/wildcard
   ${oauthToken}=          Set Variable           ${token}
   ${qty}=                 Set variable           10
   ${wildCardNum}=         Set Variable           **********
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
   ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${oauthToken}      Accept-Version=${Accept-Version}
   ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}    data=${reqBody}               headers=${headers}
   log          ${resp}
   set test variable    ${GET_ACTION_URI}
   ${keyword}=     set variable       Parse Number Search Response
   Parse Return Code   ${resp}        ${keyword}
   set test variable   ${src_numList}
   ${X}=      get length     ${src_numList}
   FOR    ${index}    IN RANGE     0  ${X}
         ${Number_Status}=     Get TFN Status     ${token}      ${src_numList[${index}]}
         should be equal      ${Number_Status}     ${SPARE}
   END
   ###############################################################################################################







Close_session_with_Resp_Org
    Close Session

*** Keywords ***

Spare Reserved TFN
  [Arguments]       ${token}  ${reservedTFN}
  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSR AC=Q
  ###############################################################################################################
  #${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  #Create Session        endpoint              ${HOST}
  #${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
  #${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  #Log             ${resp}
  #${keyword}=     set variable       Parse Number Query Response
  #Parse Return Code   ${resp}        ${keyword}
  Get TFN Status     ${token}    ${reservedTFN}

  ###############################################################################################################
  BuiltIn.Comment                NUMBER ADMINISTRATION  NSC AC=S
  ###############################################################################################################
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
  ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}    Accept-Version=${Accept-Version}
  ${resp}=     Put Request        endpoint       ${GET_ACTION_URI}     data=${reqBody}               headers=${headers}
  ${keyword}=     set variable       Parse Number Update Response
  Parse Return Code   ${resp}        ${keyword}

Get TFN Status
  [Arguments]       ${token}  ${TFN}
  #${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${TFN}
  #Create Session        endpoint              ${HOST}
  #${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
  #${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  #Log             ${resp}
  #${keyword}=     set variable       Parse Number Query Response
  #Parse Return Code   ${resp}        ${keyword}

  #${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query/tfn/${reservedTFN}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}     Accept-Version=${Accept-Version}
  #${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  #Log             ${resp}
  ${keyword}=     set variable       Parse Number Query Response
  #Parse Return Code   ${resp}        ${keyword}
  #should be equal     ${Query_status}        ${RESERVED}
  ${numList}=             Create List            ${TFN}
  ${GET_ACTION_URI}=      Set Variable           /v3/ip/num/tfn/query
  ${requestData}=         evaluate               json.loads('''${NUM_QRY_Data}''')       json
  set to dictionary       ${requestData}         numList=${numList}
  ${reqBody}=             evaluate               json.dumps(${requestData})    json
  ${resp}=     Put Request   endpoint    ${GET_ACTION_URI}        data=${reqBody}        headers=${headers}
  Parse Return Code   ${resp}        ${keyword}








  [Return]        ${Query_status}
