#*** Variables ***
#${request_nusr}       { "conName": "SAI PRIYA", "conPhone": "5712786753", "qty": 1 }
#${request_nusr_VanityTFN}     {"conName":"SOMOSNOW","conPhone":"5712786753","numList":["8558140287"]}
#${PORT}     8243
##${UAT_HOST}     https://10.0.16.159:${PORT}
#${UAT_HOST}     https://uatd3-api-tfnregistry.somos.com
#${E2E_HOST}     https://10.0.10.11:${PORT}
#${QA_HOST}      https://10.0.10.174:${PORT}
#${T2_HOST}       https://10.0.13.212:${PORT}
#${DIT_HOST}     https://10.0.10.89:${PORT}
#${T1D1_QA_HOST}      https://10.0.10.178:${PORT}
#${HOST}         ${T2_HOST}
#
#${QA_TEST_USER}             QASUMANA
#${QA_TEST_PASSWORD}         pass1234
#${TEST_SCOPE}    default
#${PUT_CR_COPY_UPDATE}   v1/ip/cus/record/copyUpdate
#${PUT_PR_COPY_UPDATE}   v1/ip/cus/pointer/copyUpdate
#${POST_PR_CREATE}       /v1/ip/cus/pointer/create
#${GET_Num_Query}    /v1/ip/num/number/query?num=
#${PUT_NUS_ACTION}       /v1/ip/num/number/search
#${PUT_NUSR_ACTION}      /v1/ip/num/number/srchres
#${SESSIONOPEN}      /v1/ip/sec/session/open
#${DEL_SESSION_CLOSE}    /v1/ip/sec/session/close
#${POST_PRC_ACTION}      /v1/ip/cus/pointer/copy
#${POST_CR_Create}   /v1/ip/cus/record/create
#${GET_CR_RETRIVE}   /v1/ip/cus/record/view?num=
#${GET_PR_RETRIVE}   /v1/ip/cus/pointer/view?num=
#${PUT_Num_Update}   /v1/ip/num/number/update
#${PUT_REL_UPDATE}       /v1/ip/num/limits/update
#${PUT_CR_UPDATE}        /v1/ip/cus/record/update
#${PUT_PR_UPDATE}        /v1/ip/cus/pointer/update
#${POST_CR_COPY}     /v1/ip/cus/record/copy
#${POST_CR_Create_ACTION}        /v1/ip/cus/record/create
#${sessionOpenData_validuser1}     {"usrName": "${QA_TEST_USER}","password": "${QA_TEST_PASSWORD}","withPerm": true}
#${User_Credentials}         {"usrName": "moghalu","password": "test1234","withPerm": true}
#${User_Credentials_AT_Resp_org}         {"usrName": "QASOMOS2","password": "pass1234","withPerm": true}
#${User_Credentials_Track2}         {"usrName": "QASUMANA","password": "Pass@123","withPerm": true}
#${Unauthorized_User_Cred_Track2}         {"usrName": "UNAUTHOR","password": "Wip@123","withPerm": true}
#${PASSWD_UPDATE}        v1/ip/sec/password/update
#${SuccessResponse}   200
#${400BadRequest}=       400
#${unauthorizedCode}     403
#${sessionOpenData_password_Morethan8Chars}     {"usrName": "SUDHAM12","password": "test1234fshiggojpo","withPerm": true}
#${sessionOpenData_UserName_Morethan8Chars}     {"usrName": "SUDHAM123456","password": "test1234","withPerm": true}
#${PasswdUpadte_Passwd_Sameas_UserName}     {"usrName": "SUDHAM12","oldPassword": "test1234","newPassword": "SUDHAM12"}
#
##TFN states
#${PendingStatus}       Pending
#${PENDING_Status_Caps}       PENDING
#${FailedStatus}=       Failed
#${ActiveStatus}=        Active
#${InvalidStatus}=       Invalid
#${MustCheckStatus}=       Must Check
#${MUST_CHECK_Status_Caps}=      MUST_CHECK
#${HoldStatus}=       Hold
#${SavedStatus}          Saved
#${BadRequest}           400
#${MUST_CHECK}  MUST CHECK
#${SendingStatus}     SENDING
#${DisconnectStatus}   DISCONNECT
#${OldStatus}     OLD
#${Index}
#${errMsg}
#${data}
#${TemplateName_UAT}     *BR-CAD-TEST2
