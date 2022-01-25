*** Settings ***
Documentation   Keywords that are used by UAT suites that test API found in Developer Resources Documents
Library     Collections
Library     String
Library     RequestsLibrary
Library     OperatingSystem
Library     DateTime
Resource    ./Track2_Keywords.robot
*** Variables ***

${cicCode}
${acna}
${PENDING}               PENDING
${SCPNPANXX_List}        False
${Disconnect_Pointer}    False
${blkType}

*** Keywords ***

Parse Return Code
  [Arguments]       ${response}    ${keyword_to_run}
  ${status}=                  set variable            ${response.status_code}
  ${responsejsondata1}=       run keyword if      ${status}==200        Process 200 Return Code    ${response}  ${keyword_to_run}
  ${responsejsondata2}=       run keyword if      ${status}==202        Process 202 Return Code    ${response}  ${keyword_to_run}
  ${errorList}=               run keyword if      ${status}==400        Process 400 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==401        Process 401 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==403        Process 403 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==404        Process 404 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==409        Process 409 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==500        Process 500 Return Code    ${response}
  ${errorList}=               run keyword if      ${status}==504        Process 504 Return Code    ${response}


Process 200 Return Code
  [Arguments]       ${response}   ${keyword_to_run}
  Set Test Variable      ${RC}       200
  ${responsejsondata1}=           To Json       ${response.content}
  ${resltUpdt}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${responsejsondata1}     updateResult
  ${result_update}=        Run Keyword If  '${resltUpdt}'=='True'    Get UpdtResult from dictionary   ${responsejsondata1}     updateResult
  ${responsejsondata}=    Set Variable If  '${resltUpdt}'=='True'     ${result_update[0]}    ${responsejsondata1}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${responsejsondata}     errList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${responsejsondata}     errList
  Run Keyword If    '${err_found}'=='False'           ${keyword_to_run}               ${responsejsondata}
  [Return]      ${responsejsondata1}


Get UpdtResult from dictionary
   [Arguments]       ${response}   ${keyword_to_run}
   ${updateResult}=    Get From Dictionary      ${response}     updateResult
   [Return]    ${updateResult}





Process 202 Return Code
  [Arguments]       ${response}   ${keyword_to_run}
  Set Test Variable      ${RC}       202
  ${token}=            get token
  #${responsejsondata}=           To Json       ${response.content}
  ${responsejsondata2}=  Retrieve Response For 202 Success Response2    ${token}    ${response}       ${RC}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${responsejsondata2}     errList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${responsejsondata2}     errList
  Run Keyword If    '${err_found}'=='False'           ${keyword_to_run}               ${responsejsondata2}

Retrieve Response For 202 Success Response2
    [Arguments]  ${token}       ${responsedata}          ${status_code}
    Should Be Equal As Strings  ${responsedata.status_code}     ${status_code}
    ${responsedata}=     To Json  ${responsedata.content}
    log       ${blkType}
    Run keyword if          '${blkType}'=='mnq'      Get Bulk Result   ${token}       ${responsedata}
    ...         ELSE IF     '${blkType}'=='mnd'      Get Bulk Result   ${token}       ${responsedata}
    ...         ELSE          GET METHOD FOR SYNC TIMEOUT2      ${token}    ${responsedata}      ${SuccessResponse}
    #${response}    GET METHOD FOR SYNC TIMEOUT      ${token}    ${PUT_ACTION_URI}         -${reqId}         ${SuccessResponse}
    [Return]    ${jsondata}


GET METHOD FOR SYNC TIMEOUT2
    [Arguments]    ${token}       ${responsedata}       ${status_code}

    ${reqId}=        get from dictionary     ${responsedata}     reqId
    sleep       ${T2_THROTTLING_SLEEP}
    ${jsondata}     set variable    0
    ${headers}=  Create Dictionary  Content-Type=application/json     Accept=application/json       Authorization=Bearer ${token}
    FOR    ${i}    IN RANGE    0       70
       ${resp}=         Get Request   endpoint    ${GET_ACTION_URI}?reqId=${reqId}   headers=${headers}
       ${status}=       run keyword and return status   Should Be Equal As Strings  ${resp.status_code}     ${status_code}
       run keyword if      ${status}==False     Should Be Equal As Strings  ${resp.status_code}     ${202Accepted}
       ${jsondata}=    run keyword if      ${status}==False     run keywords     Sleep     ${SLEEP2Sec}      AND      continue for loop       ELSE       To json      ${resp.content}
       run keyword if      ${status}==True        exit for loop
    END
    set test variable      ${jsondata}
    Log      ${jsondata}
    [Return]        ${jsondata}


Process 400 Return Code
  [Arguments]       ${response}
  Set Test Variable      ${RC}       400
  ${errorList}=      To Json     ${response.content}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${errorList}     errList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${errorList}     errList

Process 401 Return Code
  [Arguments]       ${response}
  Set Test Variable      ${RC}       401
  ${errorList}=      To Json     ${response.content}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${errorList}     errList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${errorList}     errList


Process 403 Return Code
  [Arguments]       ${response}
  Set Test Variable      ${RC}       403
  ${errorList}=      To Json     ${response.content}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${errorList}     errList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${errorList}     errList


Process 404 Return Code
  [Arguments]       ${response}
  Set Test Variable      ${RC}       404
  ${errorList}=      To Json     ${response.content}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${errorList}     errList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${errorList}     errList


Process 409 Return Code
  [Arguments]       ${response}
  Set Test Variable      ${RC}       409
  ${errorList}=      To Json     ${response.content}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${errorList}     errList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${errorList}     errList


Process 500 Return Code
  [Arguments]       ${response}
  Set Test Variable      ${RC}       500
  ${errorList}=      To Json     ${response.content}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${errorList}     errorList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${errorList}     errorList

Process 504 Return Code
  [Arguments]       ${response}
  Set Test Variable      ${RC}       504
  ${errorList}=      To Json     ${response.content}
  ${err_found}=     Run Keyword and Return Status    Dictionary Should Contain Key    ${errorList}     errorList
  Run Keyword If    '${err_found}'=='True'            Get Errors from dictionary      ${errorList}     errorList

Get Errors from dictionary
  [Arguments]       ${dictionary_name}   ${key}
  Log         ${RC}
  ${errList}=                Get from Dictionary         ${dictionary_name}         ${key}
  Should not be empty         ${errList}
  ${err_msg}=                Get from Dictionary         ${errList[0]}              errMsg
  ${err_code}=               Get from Dictionary         ${errList[0]}              errCode
  ${errLvl}=                 Get from Dictionary         ${errList[0]}              errLvl
  set test variable          ${err_msg}
  set test variable          ${err_code}
  set test variable          ${errLvl}
  set test variable          ${RC}
  ${EEFound}=      run keyword and return status         Should be equal       ${err_msg}        ${Expected_Error}
  Pass Execution If          '${EEFound}'=='True'        Expected Error Returned - ${err_msg}
  Run Keyword If             '${errLvl}'=='WARN'         Parse Warning Response       ${dictionary_name}
  Run Keyword If             '${errLvl}'=='ERROR'        Fail                       ${RC} Error - ${err_msg}

Get Bulk Result
  [Arguments]  ${token}       ${responsedata}
  ${blkId}=                      get from dictionary          ${responsedata}   blkId
  ${GET_ACTION_URI}=              set variable           /v3/ip/sys/${blkType}/blkId/${blkId}
  Create Session        endpoint              ${HOST}
  ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json    Authorization=Bearer ${token}   Accept-Version=${Accept-Version}
  ${resp}=     Get Request   endpoint    ${GET_ACTION_URI}        headers=${headers}
  Log             ${resp}
  ${keyword}=     set variable if  '${blkType}'=='mnq'      Parse Bulk MNQ Result        Parse Bulk MND Result
  set test variable          ${keyword}
  log            ${keyword}
  Parse Return Code      ${resp}        ${keyword}


Add to Transaction Total
    [Arguments]      ${No_Trans}     ${RO}   ${HOST}
    ${Time}=        Get Time
    ${content}=     set variable    ${HOST};${RO};${Time};${No_Trans}${\n}
    Log     ${content}
    #run keyword if    '${TEST STATUS}'=='PASS'      Append to file  ./MGI_Transaction_file   ${content}
    Append to file  ./UAT_Transaction_file   ${content}






Parse Bulk MNQ Result
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         queryResult
  ${queryResult}=               Get from Dictionary         ${dictionary_name}         queryResult
  ${X}=                         get length                  ${queryResult}
  FOR     ${Index}      IN RANGE    0     ${X}
       Parse Multi Number Query Response        ${queryResult[${Index}]}
  END
  Pass Execution        MNQ Result Parsed

Parse Bulk MND Result
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         queryResult
  ${queryResult}=               Get from Dictionary         ${dictionary_name}         queryResult
  ${X}=                         get length                  ${queryResult}
  FOR     ${Index}      IN RANGE    0     ${X}
       Parse Multi Number Query Response        ${queryResult[${Index}]}
  END
  Pass Execution        MND Result Parsed

Parse Warning Response
  [Arguments]       ${dictionary_name}
  Run Keyword if            ${Disconnect_Pointer}      Parse Disconnect Pointer Record Response         ${dictionary_name}
  Run Keyword if            ${SCPNPANXX_List}          Parse SCPNXX List         ${dictionary_name}
  ...        ELSE      Pass Execution If          '${errLvl}'=='WARN'         ${RC} Warning Found - ${err_msg}


Parse Multi Number Query Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         num
  ${num}=                       Get from Dictionary         ${dictionary_name}         num
  ${effDt}=                     Get from Dictionary         ${dictionary_name}         effDt
  ${status}=                    Get from Dictionary         ${dictionary_name}         status
  ${ctrlRespOrgId}=             Get from Dictionary         ${dictionary_name}         ctrlRespOrgId
  ${resultStatus}=              Get from Dictionary         ${dictionary_name}         resultStatus
  ${auctnInd}=                  Get from Dictionary         ${dictionary_name}         auctnInd
  ${la_flag}=       run keyword and return status      Dictionary should contain key       ${dictionary_name}         lastActDt
  run keyword if    ${la_flag}    Get Last Active Date      ${dictionary_name}
  run keyword if    '${status}' == '${RESERVED}'            Get Reserved Parameters        ${dictionary_name}

Parse SCPNXX List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                               ${dictionary_name}         recVersionId
  ${recVersionId_SCPNXX}=                Get from Dictionary         ${dictionary_name}         recVersionId
  ${effDt_SCPNXX}=                       Get from Dictionary         ${dictionary_name}         effDt
  ${status}=                      Get from Dictionary         ${dictionary_name}         status
  Run keyword if             '${status}'=='${PENDING}'        Set Suite Variable        ${effDt_of_Pend}     ${effDt_SCPNXX}
  ${nxxList}=                     Get from Dictionary         ${dictionary_name}         nxxList
  ${other_recs}=             run keyword and return status      Dictionary should contain key       ${dictionary_name}         allOtherRecords
  run keyword if    ${other_recs}    Get All Other Records      ${dictionary_name}
  set suite variable              ${recVersionId_SCPNXX}
  set suite variable              ${effDt_SCPNXX}

Parse Delete SCPNXX List
  [Arguments]       ${dictionary_name}
  No Operation
  #
  Pass Execution     Delete SCP-NXX List Success

Get All Other Records
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                      ${dictionary_name}         allOtherRecords
  ${allOtherRecords}=                    Get from Dictionary         ${dictionary_name}         allOtherRecords
  #Find Effdt for Pending Records         ${allOtherRecords}

Find Effdt for Pending Records
  [Arguments]       ${dictionary_name}
  ${X}=             get Length           ${dictionary_name}
  FOR     ${Index}      IN RANGE    0     ${X}
       ${status}=        get from dictionary        ${dictionary_name[${Index}]}     status
       set test variable    ${i}          ${Index}
       Exit For Loop if    '${status}'=='${PENDING}'
  END
  log             ${dictionary_name[${i}]}
  ${effDt_of_Pend}=         get from dictionary       ${dictionary_name[${i}]}     effDt
  set Suite variable         ${effDt_of_Pend}

# Transaction Total
  #  [Arguments]      ${No_Trans}
  #  ${Time}=        Get Time
  #  ${content}=     set variable    ${Time}${SPACE}${No_Trans}${\n}
  #  Log     ${content}
  #  run keyword if    '${TEST STATUS}'=='PASS'      Append to file  ./MGI_Transaction_file   ${content}


Parse Number Query Response
  [Arguments]       ${dictionary_name}
  ${qr_flag}=       run keyword and return status      Dictionary should contain key     ${dictionary_name}    queryResult
  ${queryResult}=   run keyword if    ${qr_flag}       Get from Dictionary               ${dictionary_name}    queryResult
  ${dictionary_name}=   set variable if   ${qr_flag}    ${queryResult[0]}         ${dictionary_name}
  Get number Query Parameters     ${dictionary_name}

Get number Query Parameters
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         recVersionId
  ${Q_recVersionId}=            Get from Dictionary         ${dictionary_name}         recVersionId
  ${status}=                    Get from Dictionary         ${dictionary_name}         status
  ${auctnInd}=                  Get from Dictionary         ${dictionary_name}         auctnInd
  ${la_flag}=       run keyword and return status      Dictionary should contain key       ${dictionary_name}         lastActDt
  run keyword if    ${la_flag}    Get Last Active Date      ${dictionary_name}
  run keyword if    '${status}' == '${RESERVED}'            Get Reserved Parameters        ${dictionary_name}
  set Suite Variable              ${Q_recVersionId}
  set Suite Variable              ${Query_status}             ${status}

Get Reserved Parameters
  [Arguments]       ${dictionary_name}
  ${effDt}=                     Get from Dictionary         ${dictionary_name}         effDt
  ${ctrlRespOrgId}=             Get from Dictionary         ${dictionary_name}         ctrlRespOrgId
  ${conPhone}=                  Get from Dictionary         ${dictionary_name}         conPhone
  ${conName}=                   Get from Dictionary         ${dictionary_name}         conName
  ${resUntilDt}=                Get from Dictionary         ${dictionary_name}         resUntilDt
  set Suite Variable              ${Query_effDt}            ${effDt}
  set Suite Variable              ${Query_resUntilDt}       ${resUntilDt}

Get Last Active Date
  [Arguments]       ${dictionary_name}
  ${lastActDt}=                 Get from Dictionary         ${dictionary_name}         lastActDt

Parse Customer Record Response
  [Arguments]       ${dictionary_name}
  ${index}=                 set variable            0
  ${lstEffDtTms}            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${custRecEntity}          get from dictionary     ${dictionary_name}             custRecEntity
  ${lastUpDt}               get from dictionary     ${dictionary_name}             lastUpDt
  ${lastUsr}                get from dictionary     ${dictionary_name}             lastUsr
  ${CADStatus}              get from dictionary     ${lstEffDtTms[${index}]}       custRecStat
  should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  #should be equal           ${custRecCompPart}      CAD
  ${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  ${apprStat}               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  should be equal           ${actionCode}           N

Parse Pointer Record Response
  [Arguments]       ${dictionary_name}
  ${index}=                 set variable            0
  ${lstEffDtTms}            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${num}                    get from dictionary     ${dictionary_name}             num
  ${effDtTm}                get from dictionary     ${dictionary_name}             effDtTm
  ${CADStatus}              get from dictionary     ${lstEffDtTms[${index}]}       custRecStat
  should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  should be equal           ${custRecCompPart}      PAD
  #${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
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
  #should be equal           ${CADStatus}            ${PENDING_STATE}
  ${custRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       custRecCompPart
  #should be equal           ${custRecCompPart}      ${key}
  ${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  #should be equal           ${effDtTm}              ${TgtEffDtTm}
  ${apprStat}               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  #should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  ${Q_effDtTm}=             set variable            ${effDtTm}
  set global variable       ${Q_effDtTm}
  set suite variable        ${Query_recVersionId}          ${recVersionId}
  set suite variable        ${CAD_Status}                  ${CADStatus}


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

Parse Customer Record Delete
  [Arguments]       ${dictionary_name}
  #No Operation
  ${num}=                    get from dictionary     ${dictionary_name}             num
  ${effDtTm}=                get from dictionary     ${dictionary_name}             effDtTm
  should be equal            ${effDtTm}              ${TgtEffDtTm}



Parse Pointer Record Delete
  [Arguments]       ${dictionary_name}
  Log               ${dictionary_name}

Parse Template Record Delete
  [Arguments]       ${dictionary_name}
  Log               ${dictionary_name}



Parse Customer Record Transfer
  [Arguments]       ${dictionary_name}
  #No Operation
  ${effDtTm}=                        get from dictionary     ${dictionary_name}             effDtTm
  ${srcRecVersionId}=                get from dictionary     ${dictionary_name}             srcRecVersionId
  should be equal            ${effDtTm}              ${TgtEffDtTm}

Parse Customer Record Copy
  [Arguments]       ${dictionary_name}
  #No Operation
  ${effDtTm}=                        get from dictionary     ${dictionary_name}             effDtTm
  ${recVersionId}=                   get from dictionary     ${dictionary_name}             recVersionId
  should be equal            ${effDtTm}              ${TgtEffDtTm}

Parse Customer Record Disconnect
  [Arguments]       ${dictionary_name}
  #No Operation
  ${effDtTm}=                        get from dictionary     ${dictionary_name}             effDtTm
  ${recVersionId}=                   get from dictionary     ${dictionary_name}             recVersionId
  #should be equal            ${effDtTm}              ${TgtEffDtTm}


Parse SCP Network List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         netWrkIdList
  ${netWrkIdList}=              Get from Dictionary         ${dictionary_name}         netWrkIdList
  Log List                 ${netWrkIdList}
  Set Suite Variable       ${netWrkIdList}

Parse SCP Network View
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         netWrkId
  ${netWrkId}=              Get from Dictionary             ${dictionary_name}         netWrkId
  Dictionary should contain key                             ${dictionary_name}         recVersionId
  ${recVersionId}=          Get from Dictionary             ${dictionary_name}         recVersionId
  Dictionary should contain key                             ${dictionary_name}         status
  ${status}=                Get from Dictionary             ${dictionary_name}         status
  ${netNameFound}=          run keyword and return status         Dictionary should contain key     ${dictionary_name}    netWrkName
  Run Keyword if            ${netNameFound}           Get Network Name            ${dictionary_name}


Get Network Name
  [Arguments]       ${dictionary_name}
  ${netWrkName}=            Get from Dictionary             ${dictionary_name}         netWrkName

Parse NLA Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         netWrkIdList
  ${netWrkIdList}=              Get from Dictionary         ${dictionary_name}         netWrkIdList
  Log List                 ${netWrkIdList}
  Set Suite Variable       ${netWrkIdList}

Parse NLE Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         netWrkIdList
  ${netWrkIdList}=              Get from Dictionary         ${dictionary_name}         netWrkIdList
  Log List                 ${netWrkIdList}
  Set Suite Variable       ${netWrkIdList}

Parse NAC Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         netWrkIdList
  ${netWrkIdList}=              Get from Dictionary         ${dictionary_name}         netWrkIdList
  Log List                 ${netWrkIdList}
  Set Suite Variable       ${netWrkIdList}

Parse NCA Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         netWrkIdList
  ${netWrkIdList}=              Get from Dictionary         ${dictionary_name}         netWrkIdList
  Log List                 ${netWrkIdList}
  Set Suite Variable       ${netWrkIdList}


Parse NAC Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         recVersionId
  ${recVersionId}=              Get from Dictionary         ${dictionary_name}         recVersionId
  Dictionary should contain key                             ${dictionary_name}         cicCodeList
  ${cicCodeList}=               Get from Dictionary         ${dictionary_name}         cicCodeList


Parse NCA Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         recVersionId
  ${recVersionId}=              Get from Dictionary         ${dictionary_name}         recVersionId
  Dictionary should contain key                             ${dictionary_name}         conName
  ${conName}=                   Get from Dictionary         ${dictionary_name}         conName
  Dictionary should contain key                             ${dictionary_name}         conPhone
  ${conPhone}=                  Get from Dictionary         ${dictionary_name}         conPhone
  Dictionary should contain key                             ${dictionary_name}         conEmail
  ${conEmail}=                  Get from Dictionary         ${dictionary_name}         conEmail
  Dictionary should contain key                             ${dictionary_name}         ocnList
  ${ocnList}=                   Get from Dictionary         ${dictionary_name}         ocnList
  Set Suite Variable            ${recVersionId_NCA}         ${recVersionId}

Parse NCC Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         recVersionId
  ${recVersionId}=              Get from Dictionary         ${dictionary_name}         recVersionId
  ${cmpnyCodes}=                Get from Dictionary         ${dictionary_name}         cmpnyCodes


Parse NLA Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         recVersionId
  ${recVersionId}=              Get from Dictionary         ${dictionary_name}         recVersionId
  Dictionary should contain key                             ${dictionary_name}         conName
  ${conName}=                   Get from Dictionary         ${dictionary_name}         conName
  Dictionary should contain key                             ${dictionary_name}         conPhone
  ${conPhone}=                  Get from Dictionary         ${dictionary_name}         conPhone
  Dictionary should contain key                             ${dictionary_name}         conEmail
  ${conEmail}=                  Get from Dictionary         ${dictionary_name}         conEmail
  Dictionary should contain key                             ${dictionary_name}         respOrgList
  ${respOrgList}=               Get from Dictionary         ${dictionary_name}         respOrgList
  set suite variable         ${recVersionId_NLA}         ${recVersionId}

Parse NLE Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         recVersionId
  ${recVersionId}=              Get from Dictionary         ${dictionary_name}         recVersionId
  Dictionary should contain key                             ${dictionary_name}         conName
  ${conName}=                   Get from Dictionary         ${dictionary_name}         conName
  Dictionary should contain key                             ${dictionary_name}         conPhone
  ${conPhone}=                  Get from Dictionary         ${dictionary_name}         conPhone
  Dictionary should contain key                             ${dictionary_name}         conEmail
  ${conEmail}=                  Get from Dictionary         ${dictionary_name}         conEmail
  Dictionary should contain key                             ${dictionary_name}         potsNumList
  ${potsNumList}=               Get from Dictionary         ${dictionary_name}         potsNumList


Parse NLA Success Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                 ${dictionary_name}         recVersionId
  ${recVersionId_NLA}=              Get from Dictionary         ${dictionary_name}         recVersionId
  set Suite Variable                ${recVersionId_NLA}

Parse NCA Success Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                 ${dictionary_name}         recVersionId
  ${recVersionId_NCA}=              Get from Dictionary         ${dictionary_name}         recVersionId
  set Suite Variable                ${recVersionId_NCA}


Parse MAC Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         numType
  ${numType}=                   Get from Dictionary         ${dictionary_name}         numType
  Should be equal               ${numType}     ${num_Type}
  ${scpList}=                   Get from Dictionary         ${dictionary_name}         scpList
  ${scpId}=                     Get from Dictionary         ${scpList[0]}              scpId
  ${mnlCtrlAlwd}=               Get from Dictionary         ${scpList[0]}              mnlCtrlAlwd

Parse MAS Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         recVersionId
  ${recVersionId}=              Get from Dictionary         ${dictionary_name}         recVersionId
  ${initGapInterval}=           Get from Dictionary         ${dictionary_name}         initGapInterval
  ${masList}=                   Get from Dictionary         ${dictionary_name}         masList
  Log list                      ${masList}
  FOR     ${Index}      IN RANGE    0     15
          ${thresholdLevel}=     Get from Dictionary     ${masList[${Index}]}     thresholdLevel
          ${numOfLines}=         Get From Dictionary     ${masList[${Index}]}     numOfLines
          ${surveillance}=       Get from Dictionary     ${masList[${Index}]}     surveillance
          ${control}=            Get from Dictionary     ${masList[${Index}]}     control
  END


Parse CCC Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         cccList
  ${cccList}=                   Get from Dictionary         ${dictionary_name}         cccList
  ${recVersionId_CCC}=          Get from Dictionary         ${cccList[0]}              recVersionId
  ${scpId}=                     Get from Dictionary         ${cccList[0]}              scpId
  ${cccStatus}=                 Get from Dictionary         ${cccList[0]}              cccStatus
  set Suite Variable                ${recVersionId_CCC}
  set test variable                 ${cccStatus}

Parse CCC Updt Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         cccList
  ${cccList}=                   Get from Dictionary         ${dictionary_name}         cccList
  ${recVersionId_CCC}=          Get from Dictionary         ${cccList[0]}              recVersionId
  ${scpId}=                     Get from Dictionary         ${cccList[0]}              scpId

Parse CRA Success Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                 ${dictionary_name}         recVersionId
  ${recVersionId_CRA}=              Get from Dictionary         ${dictionary_name}         recVersionId
  set Suite Variable                ${recVersionId_CRA}


Parse CRA Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         effDtTm
  ${effDtTm}=              Get from Dictionary              ${dictionary_name}         effDtTm
  Dictionary should contain key                             ${dictionary_name}         custRecStat
  ${custRecStat}=               Get from Dictionary         ${dictionary_name}         custRecStat
  Dictionary should contain key                             ${dictionary_name}         respOrgId
  ${respOrgId}=                 Get from Dictionary         ${dictionary_name}         respOrgId
  Dictionary should contain key                             ${dictionary_name}         scpRecs
  ${scpRecs}=                  Get from Dictionary          ${dictionary_name}         scpRecs
  Dictionary should contain key                             ${dictionary_name}         lstEffDtTms
  ${lstEffDtTms}=               Get from Dictionary         ${dictionary_name}         lstEffDtTms
  #Get Template parameters       ${lstEffDtTms[0]}
  set suite variable        ${scpRecs}
  set suite variable        ${lstEffDtTms}

Get Template parameters
  [Arguments]       ${dictionary_name}
  ${recordKey}=              Get from Dictionary             ${dictionary_name}     recordKey


Parse NLA Delete Response
  [Arguments]       ${dictionary_name}
  Log               ${dictionary_name}



Parse NCN List Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                              ${dictionary_name}         npaCCSList
  ${npaCCSList}=              Get from Dictionary            ${dictionary_name}         npaCCSList
  set Suite Variable                ${npaCCSList}

Parse NCN Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                           ${dictionary_name}         ncnList
  ${ncnList}=              Get from Dictionary            ${dictionary_name}         ncnList
  set Suite Variable                ${ncnList}


Parse LCN List Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                               ${dictionary_name}         lataCCSList
  ${lataCCSList}=              Get from Dictionary            ${dictionary_name}         lataCCSList
  set Suite Variable                ${lataCCSList}



Parse LCN Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                           ${dictionary_name}         lcnList
  ${lcnList}=              Get from Dictionary            ${dictionary_name}         lcnList
  set Suite Variable                ${lcnList}




Parse NRL List Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                ${dictionary_name}         netWrkIdList
  ${netWrkIdList}=              Get from Dictionary            ${dictionary_name}         netWrkIdList
  set Suite Variable                ${netWrkIdList}

Parse NRL Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                ${dictionary_name}         scpList
  ${scpList}=              Get from Dictionary                 ${dictionary_name}         scpList
  set Suite Variable                ${scpList}


Parse NRL Update Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                ${dictionary_name}         resultList
  ${resultList}=              Get from Dictionary              ${dictionary_name}         resultList
  set test Variable                ${resultList}

Parse NRC Create Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                  ${dictionary_name}         recVersionId
  ${NRC_recVersionId}=              Get from Dictionary          ${dictionary_name}         recVersionId
  set Suite Variable                ${NRC_recVersionId}

Parse NRC Delete Response
  [Arguments]       ${dictionary_name}
  Log               ${dictionary_name}


Parse NRC List Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                  ${dictionary_name}         scpIdList
  ${scpIdList}=              Get from Dictionary                 ${dictionary_name}         scpIdList
  set Suite Variable                ${scpIdList}


Parse PRC Create Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                  ${dictionary_name}         recVersionId
  ${PRC_recVersionId}=              Get from Dictionary          ${dictionary_name}         recVersionId
  set Suite Variable                ${PRC_recVersionId}

Parse PRC Delete Response
  [Arguments]       ${dictionary_name}
  Log               ${dictionary_name}



Parse PRC List Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                  ${dictionary_name}         scpIdList
  ${scpIdList}=              Get from Dictionary                 ${dictionary_name}         scpIdList
  set Suite Variable                ${scpIdList}


Parse PRL List Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                     ${dictionary_name}         netWrkIdList
  ${netWrkIdList}=              Get from Dictionary                 ${dictionary_name}         netWrkIdList
  set Suite Variable                ${netWrkIdList}


Parse PRL Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                   ${dictionary_name}         scpList
  ${PRLscpList}=              Get from Dictionary                 ${dictionary_name}         scpList
  set Suite Variable                ${PRLscpList}




Parse scpList from NRL
  [Arguments]       ${dictionary_name}
  Log    ${dictionary_name}
  Dictionary should contain key                                  ${dictionary_name}         recVersionId
  ${recVersionId}=              Get from Dictionary              ${dictionary_name}         recVersionId
  Dictionary should contain key                                  ${dictionary_name}         scpId
  ${scpId}=                     Get from Dictionary              ${dictionary_name}         scpId
  Dictionary should contain key                                  ${dictionary_name}         numListChg
  ${numListChg}=              Get from Dictionary                ${dictionary_name}         numListChg
  Dictionary should contain key                                  ${dictionary_name}         sspOverflow
  ${sspOverflow}=               Get from Dictionary              ${dictionary_name}         sspOverflow
  set test variable   ${recVersionId}
  set test variable   ${scpId}
  set test variable   ${numListChg}
  set test variable   ${sspOverflow}

Parse Scpid List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                            ${dictionary_name}         scpIdList
  ${scpIdList}=                Get from Dictionary         ${dictionary_name}         scpIdList
  Set Suite Variable            ${scpId}          ${scpIdList[0]}
  Set Suite Variable            ${scpIdList}

Parse SCPNXX Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                               ${dictionary_name}         recVersionId
  ${recVersionId_SCPNXX}=                Get from Dictionary         ${dictionary_name}         recVersionId
  set Suite Variable              ${recVersionId_SCPNXX}




Parse SID Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         scpDetails
  ${scpDetails}=                Get from Dictionary         ${dictionary_name}         scpDetails
  ${recVersionId_SID}=          Get from Dictionary         ${scpDetails[0]}              recVersionId
  ${scpId}=                     Get from Dictionary         ${scpDetails[0]}              scpId
  ${scpNodeId}=                 Get from Dictionary         ${scpDetails[0]}              scpNodeId
  ${tmplSupprtd}=               Get from Dictionary         ${scpDetails[0]}              tmplSupprtd
  ${node}=                      Get from Dictionary         ${scpDetails[0]}              node
  ${cmsDB}=                     Get from Dictionary         ${scpDetails[0]}              cmsDB
  #${mateScpId}=                 Get from Dictionary         ${scpDetails[0]}              mateScpId
  #${allowedMates}=              Get from Dictionary         ${scpDetails[0]}              allowedMates
  set Suite Variable                ${recVersionId_SID}
  set test variable                 ${scpNodeId}
  set test variable                 ${tmplSupprtd}

Parse SID Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                               ${dictionary_name}         recVersionId
  ${recVersionId_new_SID}=                Get from Dictionary         ${dictionary_name}         recVersionId
  set Suite Variable              ${recVersionId_new_SID}

Parse SID netList
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                               ${dictionary_name}         netWrkIdList
  ${netWrkIdList}=        Get from Dictionary         ${dictionary_name}         netWrkIdList
  set Suite Variable              ${netWrkIdList}

Parse SSP Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                               ${dictionary_name}         recVersionId
  ${recVersionId_new_SSP}=        Get from Dictionary         ${dictionary_name}         recVersionId
  set Suite Variable              ${recVersionId_new_SSP}

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

Parse MSP Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                          ${dictionary_name}         blkId
  ${blkId}=                  Get from Dictionary         ${dictionary_name}         blkId
  Dictionary should contain key                          ${dictionary_name}         subDtTm
  ${subDtTm}=                Get from Dictionary         ${dictionary_name}         subDtTm
  Set Global Variable        ${MSP_Resp_OK}              TRUE
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



Parse Template Record Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                     ${dictionary_name}             recVersionId
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  Dictionary should contain key                     ${dictionary_name}             tmplId
  ${tmplId}                 get from dictionary     ${dictionary_name}             tmplId
  Dictionary should contain key                     ${dictionary_name}             effDtTm
  ${effDtTm}                get from dictionary     ${dictionary_name}             effDtTm
  set suite variable        ${recVersionId_TMPR}              ${recVersionId}


Parse Template Record Query
  [Arguments]       ${dictionary_name}
  ${index}=                 set variable            ${Q_index}
  ${lstEffDtTms}            get from dictionary     ${dictionary_name}             lstEffDtTms
  ${x}=                     get length              ${lstEffDtTms}
  ${recVersionId}           get from dictionary     ${dictionary_name}             recVersionId
  ${ctrlRespOrgId}          get from dictionary     ${dictionary_name}             ctrlRespOrgId
  ${tmplId}                 get from dictionary     ${dictionary_name}             tmplId
  #${effDtTm}                get from dictionary     ${dictionary_name}             effDtTm
  ${tmplRecStat}            get from dictionary     ${lstEffDtTms[${index}]}       tmplRecStat
  should be equal           ${tmplRecStat}            ${PENDING_STATE}
  ${tmplRecCompPart}        get from dictionary     ${lstEffDtTms[${index}]}       tmplRecCompPart
  should be equal           ${tmplRecCompPart}      ${key}
  ${effDtTm}                get from dictionary     ${lstEffDtTms[${index}]}       effDtTm
  should be equal           ${effDtTm}              ${TgtEffDtTm}
  ${apprStat}               get from dictionary     ${lstEffDtTms[${index}]}       apprStat
  should be equal           ${apprStat}             NOT REQUIRED
  ${actionCode}             get from dictionary     ${lstEffDtTms[${index}]}       actionCode
  ${Q_effDtTm}=             set variable            ${effDtTm}
  set global variable       ${Q_effDtTm}
  set suite variable         ${Query_recVersionId}          ${recVersionId}



Parse Template List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         tmplList
  ${tmplList}=              Get from Dictionary             ${dictionary_name}         tmplList
  #Sort List                ${tmplList}
  Set Suite Variable       ${tmplList}
  Log List                 ${tmplList}

Get Active Template List
  [Arguments]       ${dictionary_name}
  ${ActiveList}=     Create List     FirstTemp
  ${x}=                        Get Length                    ${dictionary_name}
  FOR     ${Index}      IN RANGE    0     ${x}
          ${sI}=                      Convert to String       ${Index}
          ${tmplName}=            Get From Dictionary     ${dictionary_name[${Index}]}     tmplName
          ${effDtTm}=             Get from Dictionary     ${dictionary_name[${Index}]}     effDtTm
          ${custRecStat}=         Get from Dictionary     ${dictionary_name[${Index}]}     custRecStat
          run keyword if        '${custRecStat}'=='ACTIVE'     Append to List    ${ActiveList}    ${tmplName}
  END
  Remove Values from List       ${ActiveList}    FirstTemp
  [Return]         ${ActiveList}
  #Log List      ${ActiveList}

Get Pending Template List
  [Arguments]       ${dictionary_name}
  ${PendingList}=     Create List     FirstTemp
  ${x}=                        Get Length                    ${dictionary_name}
  FOR     ${Index}      IN RANGE    0     ${x}
          ${sI}=                      Convert to String       ${Index}
          ${tmplName}=            Get From Dictionary     ${dictionary_name[${Index}]}     tmplName
          ${effDtTm}=             Get from Dictionary     ${dictionary_name[${Index}]}     effDtTm
          ${custRecStat}=         Get from Dictionary     ${dictionary_name[${Index}]}     custRecStat
          ${no_of_Ptrs}=          Get from Dictionary     ${dictionary_name[${Index}]}     ptrCnt
          run keyword if        '${custRecStat}'=='PENDING'    Append to List    ${PendingList}    ${tmplName},${effDtTm},${no_of_Ptrs}
  END
  Remove Values from List       ${PendingList}    FirstTemp
  [Return]         ${PendingList}
  #Log List      ${ActiveList}

Get Template List 0 Pointers
  [Arguments]       ${dictionary_name}
  ${PendingList}=     Create List     FirstTemp
  ${x}=                        Get Length                    ${dictionary_name}
  FOR     ${Index}      IN RANGE    0     ${x}
          ${sI}=                      Convert to String       ${Index}
          ${tmplName}=            Get From Dictionary     ${dictionary_name[${Index}]}     tmplName
          ${effDtTm}=             Get from Dictionary     ${dictionary_name[${Index}]}     effDtTm
          ${custRecStat}=         Get from Dictionary     ${dictionary_name[${Index}]}     custRecStat
          ${no_of_Ptrs}=          Get from Dictionary     ${dictionary_name[${Index}]}     ptrCnt
          run keyword if        '${no_of_Ptrs}'=='0'    Append to List    ${PendingList}    ${tmplName},${effDtTm},${no_of_Ptrs}
  END
  Remove Values from List       ${PendingList}    FirstTemp
  [Return]         ${PendingList}



Parse GNA Success Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                 ${dictionary_name}         recVersionId
  ${recVersionId_GNA}=              Get from Dictionary         ${dictionary_name}         recVersionId
  set Suite Variable                ${recVersionId_GNA}

Parse GNA Delete Response
  [Arguments]       ${dictionary_name}
  Log               ${dictionary_name}

Parse GNA List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                           ${dictionary_name}         keyLst
  ${keyList}=              Get from Dictionary            ${dictionary_name}         keyLst
  Log List                 ${keyList}
  Set Suite Variable       ${keyList}


Parse GNA Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                 ${dictionary_name}         recVersionId
  ${recVersionId_GNA}=              Get from Dictionary         ${dictionary_name}         recVersionId
  ${cicCode}=                       Get from Dictionary         ${dictionary_name}         cicCode
  ${carrierActions}=                Get from Dictionary         ${dictionary_name}         carrierActions
  ${addRtng}=                       Get from Dictionary         ${carrierActions}          addRtng
  ${pssblRtng}=                     Get from Dictionary         ${carrierActions}          pssblRtng
  ${delRtngWork}=                   Get from Dictionary         ${carrierActions}          delRtngWork
  ${delRtngDscnt}=                  Get from Dictionary         ${carrierActions}          delRtngDscnt
  ${respChng}=                      Get from Dictionary         ${carrierActions}          respChng
  set Suite Variable                ${recVersionId_GNA}

Parse ENA Success Response
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                 ${dictionary_name}         recVersionId
  ${recVersionId_ENA}=              Get from Dictionary         ${dictionary_name}         recVersionId
  set Suite Variable                ${recVersionId_ENA}

Parse ENA Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                                 ${dictionary_name}         recVersionId
  ${recVersionId_GNA}=              Get from Dictionary         ${dictionary_name}         recVersionId
  ${cicCode}=                       Get from Dictionary         ${dictionary_name}         cicCode
  ${carrierActions}=                Get from Dictionary         ${dictionary_name}         carrierActions
  ${addRtng}=                       Get from Dictionary         ${carrierActions}          addRtng
  ${pssblRtng}=                     Get from Dictionary         ${carrierActions}          pssblRtng
  ${delRtngWork}=                   Get from Dictionary         ${carrierActions}          delRtngWork
  ${delRtngDscnt}=                  Get from Dictionary         ${carrierActions}          delRtngDscnt
  ${respChng}=                      Get from Dictionary         ${carrierActions}          respChng
  set Suite Variable                ${recVersionId_ENA}

Parse ENA List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                           ${dictionary_name}         cicLst
  ${cicList}=              Get from Dictionary            ${dictionary_name}         cicLst
  Log List                 ${cicList}
  Set Suite Variable       ${cicList}

Parse EAG List
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                           ${dictionary_name}         entityList
  ${entityList}=              Get from Dictionary         ${dictionary_name}         entityList
  Log List                 ${entityList}
  Set Suite Variable       ${entityList}

Parse EAG Record
  [Arguments]       ${dictionary_name}
  Dictionary should contain key                            ${dictionary_name}         cicCodeList
  ${cicCodeList}=              Get from Dictionary         ${dictionary_name}         cicCodeList
  Log List                 ${cicCodeList}
  Set Suite Variable       ${cicCodeList}

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


 Parse Number Search Response
   [Arguments]       ${dictionary_name}
   Dictionary should contain key                                 ${dictionary_name}         numList
   ${src_numList}=                   Get from Dictionary         ${dictionary_name}         numList
   ${x}=                         Get Length                  ${src_numList}
   FOR     ${Index}      IN RANGE    0     ${x}
           ${number}=     Get from list     ${src_numList}      ${Index}
   END
   set suite variable       ${number}
   set Test Variable        ${src_numList}

 Parse Number Reserve Response
   [Arguments]       ${dictionary_name}
   Dictionary should contain key                             ${dictionary_name}         numList
   ${rsv_numList}=               Get from Dictionary         ${dictionary_name}         numList
   ${x}=                         Get Length                  ${rsv_numList}
   FOR     ${Index}      IN RANGE    0     ${x}
           ${rsv_number}=     Get from list     ${rsv_numList}      ${Index}
   END
   set Test Variable         ${rsv_numList}
   set suite variable        ${rsv_number}


 Parse Number Update Response
   [Arguments]       ${dictionary_name}
  Dictionary should contain key                             ${dictionary_name}         recVersionId
   #${updateResult}=              Get from Dictionary         ${dictionary_name}         updateResult
   ${recVersionId}=              Get from Dictionary         ${dictionary_name}         recVersionId
   ${num}=                       Get from Dictionary         ${dictionary_name}         num

 Future Effective Date
   [Arguments]     ${Date}     ${Number of Days}
   ${Edit_Date}        Add Time To Date    ${Date}   ${Number of Days}days
   ${Date}    Convert Date    ${Edit_Date}    %Y-%m-%d
   [Return]    ${Date}
