*** Variables ***
####  UI T1 Login Data Variables ####
${LOGIN URL}        ${T1D1_QA_URL}
${VALID USER}       ${T1D1_QA_USER}
${VALID PASSWORD}   ${T1D1_QA_PASSWORD}
####  UI T2 Login Data Variables ####
#${LOGIN URL T2}        ${T2_QA_URL}
#${LOGIN_URL_T2}        ${UAT_URL}
${LOGIN_URL_T2}        ${T2_REG_URL}
${VALID USER T2}       ${T2_RESP_USER}
${VALID PASSWORD T2}   ${T2_RESP_USER_PASSWORD}
${T2_THROTTLING_SLEEP}      0

#### API Login Data Variables ####
#${HOST}         ${T2_REG_HOST}
${HOST}         ${UAT_ADMIN_HOST}
#${HOST}         ${QA3_ADMIN_HOST}
${User_Credentials}         {"usrName": "${T1D1_QA_USER}","password": "${T1D1_QA_PASSWORD}","withPerm": true}
${User_Credentials_Track2}      {"usrName": "${T2_RESP_USER}","password": "${T2_RESP_USER_PASSWORD}","withPerm": true}

${API_User_Credentials_Track2}    {"usrName": "${UAT_USER}","password": "${UAT_PASSWORD}","withPerm": true}
${sessionOpenData_validuser1}     {"usrName": "${T1D1_QA_USER}","password": "${T1D1_QA_PASSWORD}","withPerm": true}
${UnauthorizedUserCredentialsTrack2}     {"usrName": "${T2_UNAUTH_USER}","password": "${T2_UNAUTH_USER_PASSWORD}","withPerm": true}
${LockUnlock_User_Credentials_Track2}         {"usrName": "LOCKUSER","password": "Fail@123","withPerm": true}
${User_Credentials_AT_Resp_org}         {"usrName": "${T2_ATRESP_USER}","password": "${T2_ATRESP_USER_PASSWORD}","withPerm": true}
${Admin_Credentials_Track2}     {"usrName": "${T2_ADMIN_USER}","password": "${T2_ADMIN_USER_PASSWORD}","withPerm": true}

${API_Admin_Credentials_Track2}    {"usrName": "${API_T2_ADMIN_USER}","password": "${API_T2_ADMIN_USER_PASSWORD}","withPerm": true}
${API_Admin_QA3Credentials_Track2}    {"usrName": "${QA3_USER}","password": "${QA3_PASSWORD}","withPerm": true}
${User_Credentials_View_Perm}         {"usrName": "${T2_VIEW_USER}","password": "${T2_VIEW_USER_PASSWORD}","withPerm": true}
${User_Credentials}         { }
${TEST_SCOPE}    default
${CIS_Credentials}                {"usrName": "${T2_CAA_ADMIN_USER}","password": "${T2_CAA_ADMIN_PSWD}","withPerm": true}
${User_Credentials_OtherRespOrg}      {"usrName": "${T2_ATRESP_USER}","password": "${T2_ATRESP_USER_PASSWORD}","withPerm": true}
${API_CIS_Credentials}                {"usrName": "${API_T2_CAA_ADMIN_USER}","password": "${API_T2_CAA_ADMIN_PSWD}","withPerm": true}
${API_User_Credentials_OtherRespOrg}      {"usrName": "${API_T2_CAA_RESP_USER}","password": "${API_T2_CAA_RESP_PSWD}","withPerm": true}
${User_Credentials_OtherRespOrg_BROPR}      {"usrName": "${T2_BROPR_RESP_USER}","password": "${T2_BROPR_RESP_PSWD}","withPerm": true}
${User_Credentials_ATX02_View}      {"usrName": "${T2_ATX02_VRESP_USER}","password": "${T2_ATX02_VRESP_PSWD}","withPerm": true}
${ResporgAdmin_Credentials}        {"usrName": "${RESPADMIN_USER}","password": "${RESPADMIN_PSWD}","withPerm": true}
${Other_ResporgAdmin_Credentials}        {"usrName": "${OtherRESPADMIN_USER}","password": "${OtherRESPADMIN_PSWD}","withPerm": true}

#NOTE:Before Executing Password expiry scripts Provide Four Expired Password UserCredentials below.########
${PE_Credentials_01_Track2}           {"withPerm": "true", "password": "Ind@123", "usrName": "USQWPASS"}
${PE_Credentials_02_Track2}     {"withPerm": "true", "password": "Aus@123", "usrName": "PSWDEXP2"}
${PE_Credentials_03_Track2}     {"withPerm": "true", "password": "Aus@123", "usrName": "PSWDEXP3"}
${PE_Credentials_04_Track2}     {"withPerm": "true", "password": "Aus@123", "usrName": "PSWDEXP4"}
######################################### UI Test Data ##########################################################
#### UI Somos URLs ####
${BROWSER}          googlechrome

${QA_URL}           http://10.0.9.13/smsnow-ui/master.html#
${DIT_URL}           http://10.0.9.89/smsnow-ui/master.html#
${E2E_URL}          http://10.0.9.15/smsnow-ui/master.html#
#${UAT_URL}          http://10.0.16.121/smsnow-ui/master.html#
${UAT_URL}          https://uat2-tfnregistry.somos.com/smsnow-ui/master.html#/
${Dev_URL}          https://devp-tfnregistry.somos.com/smsnow-ui/master.html#/
${T1D1_QA_URL}      http://10.0.9.10/smsnow-ui/master.html#/
${T2_QA_URL}        http://10.0.13.6/smsnow-ui/master.html#/
${T2_DIT_URL}        http://10.0.13.55/smsnow-ui/master.html#/
${T2_REG_URL}        https://reg2-tfnregistry.somos.com/smsnow-ui/master.html#/
${T2_E2E_URL}        https://e2e2-tfnregistry.somos.com/smsnow-ui/master.html#/
${T2_DEV_URL}        https://devp2-tfnregistry.somos.com/smsnow-ui/master.html#/
${T2_ADMIN_URL}     https://reg2-admin-tfnregistry.somos.com/smsnow-ui/master.html#/
${T2_RESPORG_URL}   https://reg2-tfnregistry.somos.com/smsnow-ui/master.html#/

###################### BATCH IPs ##############################################################################

${T2_E2E_Batch_ServerIp}            10.0.13.167
#### UI Users Credentials for Different Environments ####
${QA_USER}          QAANKITA
${QA_PASSWORD}      pass1234

${DIT_USER}          moghalu
${DIT_PASSWORD}      test1234

${T1D1_QA_USER}     qagarun
${T1D1_QA_PASSWORD}     pass1234

${UAT_USER}         BRSN3SR1
${UAT_PASSWORD}     6Sixes=36
#${UAT_USER}         BRSNTST1
#${UAT_PASSWORD}     20+Two=22

${QA3_USER}         BRJPQ3AD
${QA3_PASSWORD}     22=20+Two

${Dev_USER}         BRSN3SS1
${Dev_PASSWORD}     uat1234

${QA1_No_NUS_User}  QAEXTCR1
${QA1_No_NUS_Pswrd}  test1234

${QA1_No_CAD_User}      QANOCAD
${QA1_No_CAD_Pswrd}     pass1234

${QA_NO_PAD}            qanopad
${QA_NO_PAD_Pass}       pass1234

${HelpDesk_SAC_User}        QAPADMA
${HelpDesk_SAC_Password}    pass1234

${T2_RESP_USER}     USQWGRBW
${T2_RESP_USER_PASSWORD}     5Xnine=45

${API_T2_RESP_USER}         USQWUNTO
${API_T2_RESP_USER_PASSWORD}           India@123

#${T2_ADMIN_USER}     E2EUSER0
${T2_ADMIN_USER}     E2EUSER1
#${T2_ADMIN_USER_PASSWORD}     Login@12
${T2_ADMIN_USER_PASSWORD}     9Xfive=45

${API_T2_ADMIN_USER}        USQWCQJB
${API_T2_ADMIN_USER_PASSWORD}       India@123

${T2_VIEW_USER}     USQWVDWV
${T2_VIEW_USER_PASSWORD}     India@123

${T2_UNAUTH_USER}     USQWMLAK
${T2_UNAUTH_USER_PASSWORD}     India@123

${T2_ADMIN_NO_HPU_USER}     ADMINHPU
${T2_ADMIN_NO_HPU_USER_PASSWORD}    hpu@123

${T2_RESP_NO_HPU_USER}     RESPHPU
${T2_RESP_NO_HPU_USER_PASSWORD}    hpu@123

# QA1 Credentials
#${T2_RESP_USER}     AUTHUSER
#${T2_RESP_USER_PASSWORD}     Sms@123
#
#${T2_ADMIN_USER}     USER113
#${T2_ADMIN_USER_PASSWORD}     Pass@123
#
#${T2_VIEW_USER}     USERVIEW
#${T2_VIEW_USER_PASSWORD}     Sms@123
#
#${T2_UNAUTH_USER}     NOPERM
#${T2_UNAUTH_USER_PASSWORD}     Pass@123

${T2_VIEW_USER_ResPo_BANJI}     VIEWUSR
${T2_VIEW_USER_ResPo_Paswd}     test@123

${T2_ATRESP_USER}     USQWAVAF
${T2_ATRESP_USER_PASSWORD}     5Xnine=s45

${T2_DIT_USER}     AUTODIT
${T2_DIT_PASSWORD}     Somos@12

${T2_CAA_RESP_USER}          USQWHXCT
${T2_CAA_RESP_PSWD}       India@123

${T2_GNA_RESP_USER}     GNAUSER1
${T2_GNA_RESP_PSWD}     Sms@123

${T2_GNA_ADMIN_USER}    GNAAdm1
${T2_GNA_ADMIN_PSWD}    Sms@123

${T2_CAA_ADMIN_USER}           USQWIXNN
${T2_CAA_ADMIN_PSWD}       India@123

${API_T2_CAA_ADMIN_USER}        USQWCQJB
${API_T2_CAA_ADMIN_PSWD}        Ind@123

${API_T2_CAA_RESP_USER}     USQWUNTO
${API_T2_CAA_RESP_PSWD}     Ind@123

${T2_UAA_VIEW_User}     UAAVIEW
${T2_UAA_VIEW_User_Password}    Pass@123

${T2_BROPR_RESP_USER}     USQWWYXF
${T2_BROPR_RESP_PSWD}    Ind@123

${T2_ATX02_VRESP_USER}     USQWGRXP     #PROD env
${T2_ATX02_VRESP_PSWD}    India@123

${RESPADMIN_USER}       USQWJIQY
${RESPADMIN_PSWD}       India@123

${OtherRESPADMIN_USER}      USQWAQMF
${OtherRESPADMIN_PSWD}        India@123

${T2_Somos_ID}              somos\\epillai
${T2_Somos_Password}        Kaali@123

########################################## API Test Data ################################################
#### Somos API URIs ####
${PORT}     8243
${UAT_HOST}     https://api-uat2-tfnregistry.somos.com
#${UAT_HOST}     https://api-qa3-tfnregistry.somos.com
${E2E_HOST}     https://10.0.10.11:${PORT}
${QA_HOST}      https://10.0.10.174:${PORT}
${T2_DIT_HOST}       https://10.0.13.212:${PORT}
${DIT_HOST}     https://10.0.10.84:${PORT}
${T1D1_QA_HOST}      https://10.0.10.178:${PORT}
${T2_QA_HOST}       https://10.0.13.223:${PORT}
${T2_DIT_HOST}       https://10.0.13.212:${PORT}
${T2_REG_HOST}       https://api-e2e2-tfnregistry.somos.com
${T2_E2E_HOST}      https://api-e2e2-tfnregistry.somos.com
${T2_DEV_HOST}      https://devp2-api-tfnregistry.somos.com
#${T2_ADMIN_HOST}    https://e2e2-admin-api-tfnregistry.somos.com
${UAT_ADMIN_HOST}    https://uat2-admin-api-tfnregistry.somos.com
#${UAT_ADMIN_HOST}          https://qa3-admin-api-tfnregistry.somos.com
#${T2_RESPORG_HOST}  https://api-uat2-tfnregistry.somos.com
${UAT_RESPORG_HOST}  https://uat2-api-tfnregistry.somos.com
#${UAT_RESPORG_HOST}        https://api-qa3-tfnregistry.somos.com
#${UAT_RESPORG_HOST}  https://qa3-api-tfnregistry.somos.com
${QA3_ADMIN_HOST}          https://qa3-admin-tfnregistry.somos.com

#### TFN status ####
${PendingStatus}              Pending
${UI_Active_Status}           ACTIVE
${UI_MustCheck_Status}        Must Check
${PENDING_Status_Caps}        PENDING
${TFN_status_assigned}        ASSIGNED
${TFN_status_reserved}        RESERVED
${TFN_status_Unavailable}     UNAVAILABLE
${TFN_status_spare}           SPARE
${SAVED_Status_Caps}          SAVED
${FailedStatus}=        Failed
${ActiveStatus}=        Active
${InvalidStatus}=       Invalid
${InvalidStatus_string}=        INVALID
${TRANSITIONAL_status}          TRANSITIONAL
${MustCheckStatus}=             Must Check
${MUST_CHECK_Status_Caps}=      MUST_CHECK
${MustCheckStatus_string}       MUST CHECK
${HoldStatus}=          Hold
${HOLD_Status_Caps}=    HOLD
${SavedStatus}          Saved
${BadRequest}           400
${MUST_CHECK}           MUST CHECK
${FailedStatusCaps}     FAILED
${SendingStatus}        SENDING
${DisconnectStatus}     DISCONNECT
${DisconnectedStatus}   Disconnect
${OldStatus}            OLD
${Appr_Status_NR}       NOT REQUIRED
${Appr_Status_NA}       NOT APPLICABLE
${NoAgingDisconnect_string}     NO_AGING_DISCONNECT
${SuccessResponse}          200
${400BadRequest}=           400
${401unauthorizedResponse}  401
${403ForBidden}=            403
${409Conflict}              409
${202Accepted}              202
${SUCCESS}      success
##### URIs for different APIs ####
${PUT_CR_COPY_UPDATE}   v1/ip/cus/record/copyUpdate
${PUT_PR_COPY_UPDATE}   v1/ip/cus/pointer/copyUpdate
${POST_PR_CREATE}       /v1/ip/cus/pointer/create
${GET_Num_Query}        /v1/ip/num/number/query?num=
${PUT_NUS_ACTION}       /v1/ip/num/number/search
${PUT_NUSR_ACTION}      /v1/ip/num/number/srchres
${SESSIONOPEN}          /v1/ip/sec/session/open
${DEL_SESSION_CLOSE}    /v1/ip/sec/session/close
${POST_PRC_ACTION}      /v1/ip/cus/pointer/copy
${POST_CR_Create}       /v1/ip/cus/record/create
${GET_CR_RETRIVE}       /v1/ip/cus/record/view?num=
${GET_PR_RETRIVE}       /v1/ip/cus/pointer/view?num=
${PUT_Num_Update}       /v1/ip/num/number/update
${PUT_REL_UPDATE}       /v1/ip/num/limits/update
${PUT_CR_UPDATE}        /v1/ip/cus/record/update
${PUT_PR_UPDATE}        /v1/ip/cus/pointer/update
${POST_CR_COPY}         /v1/ip/cus/record/copy
${POST_CR_Create_ACTION}        /v1/ip/cus/record/create
${PASSWD_UPDATE}        /v2/ip/sec/password/update
${GET_NUSQ_ACTION}      /v1/ip/num/number/query?num=
${PUT_NU_ACTION}        /v1/ip/num/number/update


######################### Global UI Variables #########################
############## Sleep Values ##############
${SLEEP1}           1
${SLEEP2}           2
${SLEEP2Sec}           2s
${SLEEP3}           3
${SLEEP5}           5
${SLEEP10}         10
${SLEEP15}         15
${SLEEP20}         20

${SLEEP_ONE}         1
${SLEEP_TWO}         2
${SLEEP_THREE}       3
${SLEEP_FOUR}        4
${SLEEP_FIVE}        5
${SLEEP_SIX}         6
${SLEEP_SEVEN}       7
${SLEEP_EIGHT}       8
${SLEEP_NINE}        9
${SLEEP_TEN}         10
${SLEEP_FIFTEEN}     15
############### User Profile And Security ###########################
##### UI Login Credentials ####
${InvalidID_Four_Char}   Test
${InvalidID_greaterThen_Eight}   Test@12345
${Invalid_Numeric_ID}   4563287
${Invalid_SpecialChar_ID}   @@##$$
${Invalid_pwd}      Test@123
${Invalid_Psswd}        Test@123
################### Nus Variables ##################
${req_nums}     {"qty": 1}
${request_nusr}       { "conName": "SomosAdmin", "conPhone": "5712786753", "qty": 1 }
${request_nusr_VanityTFN}     {"conName":"SOMOSNOW","conPhone":"5712786753","numList":["8558140287"]}

${NUS_NPA}      833
${NUS_NXX}      200
${NUS_NPA_893}      893
${Spare_TFN}        8667402318
${Different_StatesOf_TFNs}          {"Reserved":"8448980888","Unavailable":"8442500650","Suspend":"8005739857","Transitional":"8445953290","Working":"8447427130"}
#=======
${Different_StatesOf_TFNs}      {"Reserved":"8448980888","Unavailable":"8442500650","Assigned":"8336372677","Suspend":"8005739857","Dissconnect":"8447751788","Transitional":"8445953290","Working":"8447427130"}
${Copy_Request_Body_CADonly}          {"srcNum": "","tgtEffDtTm":"","custRecCompPart": "CAD","cmd":"U","srcRecVersionId": ""}
${Copy_Request_Body_CAD_LAD_only}          {"srcNum": "","tgtEffDtTm":"","custRecCompPart": "CAD, LAD","cmd":"U","srcRecVersionId": ""}

################# CAD variables ################
${aosNPA}                   315
${invalidAosLATA}           555
${invalidLSO}               123456
${validLSO_Reg}             732699
${invalidDestinationNum}    9812344843
${valid_POTS_Number}        9898761234
${LataString}               LATA
${LSO_string}               LSO
${DestNum_string}           Destination Number
${AOSLabel_string}          AOS Label
${aosNetValid}              US
${Unavailable_TFN}          8339210071
${TFN_Disconnect_CR}        8339850092
${TFN_Failed_CR}            8338739539
${TFN_Active_CR}            8336820146
${TFN_Sending_CR}           8338463034
${TFN_Old_CR}               8446424272
${TFN_Unavailable_CR}       8002000287
${TFN_HOLD_CR}      8339890121
${TFN_INVALID_CR}      8003940645
${TFN_Disconnect_CR_Rerral_N}        8332823911
${validAosNet}      US
${validAosState}    CA
${validAosNpa}      209
${validAosLata}     728
${validNxx}         200
${validPotsNumberCPR}       2092001000

${validAosNet_1}    SP
${validAosState_1}  NH
${validAosNpa_1}    603
${validNxx_1}       200
${validAosLata_1}   122

${validAosNetXA}      XA        #XA include US and CN
${validAosNetXB}      XB        #XB include US and CR
${validAosNetXC}      XC        #XC include US, CR and CN

${nonUS_AosE2E}      670

####QA1 values####
${validAosNetQA1}      US
${validAosStateQA1}    CA
${validAosNpaQA1}      752
${validAosLataQA1}     230
${validNxxQA1}         323
${validPotsNumberCPRQA1}       7523231000

#####E2E values#####
${validAosNet_CRO}         YK
${validCicCode_CRO}        0222
${validAcna_CRO}           MCI
${validAosState_CRO}    FL
${validAosNpa_CRO}      772
${validAosLata_CRO}     460
${validNxx_CRO}         770
${validPotsNumberCPR_CRO}       7727701000
${SCP_Id_YK}        YK01
${clliCode_YK}    YKUSVAAAA01
