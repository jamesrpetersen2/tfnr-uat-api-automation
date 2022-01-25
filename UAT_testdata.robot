*** Variables ***
#                This Data contains password for USER for UAT suites
#...             Change the password here when required. Change Host info here when running against new versions.
#...             Change ROID and Accept-Version as needed for tests

${UAT_UAT4}                                     https://uat4-api-tfnregistry.tfnregistrypoc.com
${UAT_UAT3}                                     https://uat3-api-tfnregistry.tfnregistrypoc.com
${UAT_UAT}                                      https://uat-api-tfnregistry.somos.com
#${UAT_AWS_HOST}                             ${UAT_UAT4}
#${UAT_AWS_HOST}                             ${UAT_UAT3}
${UAT_AWS_HOST}                             ${UAT_UAT}
${UAT_AWS_Admin_USER}                       TST02000
${UAT_AWS_Admin_PASSWORD}                   12=Twoxsix
${ROID}                                     BRSMS
${Accept-Version}                           3.7
${API_Admin_User_Credentials_for_UAT_AWS}     {"usrName": "${UAT_AWS_Admin_USER}","password": "${UAT_AWS_Admin_PASSWORD}","withPerm": true}
