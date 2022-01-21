*** Settings ***
Resource        ../../data_files/api/Track2/Testdata.robot
*** Variables ***
################Error Messages################################
${Invalid_input_error}      ECMA 262 regex "^((800)|(888)|(877)|(866)|(855)|(844)|(833))[0-9a-zA-Z]{7}$" does not match input string
${Spare_TFN_error}      Number is SPARE. Go to 'NUS' to reserve number
${EffDtTm_lessthan_Error}       Effective Date: Must be a calendar date in 'MM/DD/YY' format. Must be a date in the future but within the industry-set time period from current date (0106)
${Missing_Mandatory_Param_Error}        object has missing required properties
${Invalid_EffDtTm_Error}        ECMA 262 regex \"^(?:[1-9]\\d{3}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1\\d|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[1-9]\\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00)-02-29)T(?:[01]\\d|2[0-3]):(00|15|30|45):[0-5]\\d[Z]$|^(?:[1-9]\\d{3}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1\\d|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[1-9]\\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00)-02-29)$|^(NOW)$\
${Invalid_SrvOrdNum_Error}          ECMA 262 regex "^[a-zA-Z]{1}[a-zA-Z0-9]{3,11}[a-zA-Z]{0,1}$|^$" does not match input string "A*dhgtajkjaks" for attribute /svcOrderNum
${TFN_Template_Name_Error}          ECMA 262 regex "^[*][a-zA-Z]{2}[a-zA-Z0-9-]{1,12}$" does not match input string "%^&%$#^^
${Invalid_reqSntFrom_Error}               not found in enum (possible values: [\"REC\",\"TEC\",\"CAD\",\"TAD\",\"PAD\"])
${Invalid_destNum_Error}            ECMA 262 regex \"^[0-9]{3}[a-zA-Z0-9]{7}$\" does not match input string
${TemplateName_Error}               ECMA 262 regex \"^[*][a-zA-Z]{2}[a-zA-Z0-9-]{1,12}$\" does not match input string
${SrvOrdNum_Toolong_Error}      ECMA 262 regex "^[a-zA-Z]{1}[a-zA-Z0-9]{3,11}[a-zA-Z]{0,1}$|^$" does not match input string "A1dhgtajkjaksqwq" for attribute /svcOrderNum
${Input_size}       is too long
${PR_Create_SameEffDt_Error}        Cannot process a 'New' action,since the record already exists
${Error_Invalid_InterLATA}      ECMA 262 regex "^[a-zA-Z]{3}$|^[0-9]{4}$|^[a-zA-Z]{3}[-][0-9]{4}$|^[0-9]{4}[-][a-zA-Z]{3}|^[a-zA-Z]{3}[0-9]{4}$|^[0-9]{4}[a-zA-Z]{3}$|^$" does not match input string
${Error_Resporg_trys_to view_diff Redrd}    User has no involvement with the customer record
${Error_Resporg_trys_to view_diff RedrdErrCode}     505002
${Past_E.D.T_Error}         Effective Date: Must be a calendar date in 'MM/DD/YYYY' format. Must be a date in the future but within the industry-set time period from current date (0106)
${Wrong_FieldName_Error}            object instance has properties which are not allowed by the schema
${E.D.T_bad_req_err}      invalid against requested date format(s) [yyyy-MM-dd\'T\'HH:mm:ssZ, yyyy-MM-dd\'T\'HH:mm:ss.SSSZ]
${Error_Resporg_trys_to view_diff Redrd}    User has no involvement with the customer record
${ErrorMessage_With_ErrorCode_8003}=    Original version sent. Your changes not accepted. Create another record. (8003)
${ErrorLevel}=    ERROR
${Error_Invalid_LAD_Lata_With_ErrorCode_1038}       LATA LAD/LT/*LATA1 ${SPACE}:ASQWZX ${SPACE} ${SPACE} ${SPACE} : Must be an existing 3-digit LATA Code known to SMS (1038).
${Error_Invalid_LAD_Time_With_ErrorCode_1074}       Time: Must be a time range like '10:30A-6:30P'. Range cannot cross midnight. Minutes must be in quarter hours(00\\,15\\,30\\,45). LAD/TI/*TIME ${SPACE} :AM:PM  ${SPACE}     ${SPACE}   ${SPACE}     ${SPACE}    (1074).
${EffDtTm_Now_ErrorMessage}     ECMA-262-regex-"^(?:[1-9]\\d{3}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1\\d|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[1-9]\\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00)-02-29)T(?:[01]\\d|2[0-3]):(00|15|30|45):[0-5]\\d[Z]$|^(?:[1-9]\\d{3}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1\\d|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[1-9]\\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00)-02-29)$"-does-not-match-input-string-"NOW"-for--attribute-/effDtTm
${EffDtTm_NowAndTime_ErrorMessage}=        ECMA-262-regex-"^(?:[1-9]\\d{3}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1\\d|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[1-9]\\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00)-02-29)T(?:[01]\\d|2[0-3]):[0-5]\\d:[0-5]\\d[Z]$|^(?:[1-9]\\d{3}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1\\d|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[1-9]\\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00)-02-29)$"-does-not-match-input-string-"NOWT10:00:00Z"-for--attribute-/effDtTm
${Invalid_TermNumber_Error}=    numeric-instance-is-greater-than-the-required-maximum-(maximum:-9999,-found:-99999)-for--attribute-/destNums/0/numTermLine
${Invalid_Time_Error}     Time: Must be a time range like '10:30A-6:30P'. Range cannot cross midnight. Minutes must be in quarter hours(00\\,15\\,30\\,45). $$ (1074).
${DifferentRespOrg_User_Updating_CAD_ErrorCode_0103}   Permission Denied - Logon ID can not update Resp Org's records. (0103)
${ErrorMessage_Without_Effdttm}=    object-has-missing-required-properties-(["effDtTm"])-for--attribute-
${ErrorMessage_Without_tgtNum}=     object-has-missing-required-properties-(["tgtNum"])-for--attribute-
${ErrorMessage_With_PastEffdate}    Record can't precede eff date/time of new service(8007).
${DifferentRespOrg_User_Copy_CR_ErrorCode_1508}    Control RESP ORG: the entered RESP ORG is not known to SMS (1508).
${DifferentRespOrg_User_Copy_PR_ErrorCode_1716}     Only ACTIVE\,SENDING\,DISCONNECT\,OLD\,and future pending records can be viewed(1716).
${NonExisting_EffectiveDtTm_ErrorMsg}       To process 'Change' action, you must have a record associated with this number. (0300)
${Diff_RespOrg_Retrieve_Msg}     Control RESP ORG: the entered RESP ORG is not known to SMS (1508).

${Description_AT23739}      objecthasmissingrequiredproperties(["aos","destNums","hldIndFlag","reqSntFrom"])forattribute|anyofsvcOrderNumorsuppFormNumismandatory.||anyofinterLTCarorintraLTCarismandatory.|
${Description_AT_23740}     objecthasmissingrequiredproperties(["aos","destNums","hldIndFlag"])forattribute|anyofsvcOrderNumorsuppFormNumismandatory.||anyofinterLTCarorintraLTCarismandatory.|
${ErrorMsg_AT_23759}        Effective Date/Time: Must equal 'NOW' or today's date when updating with high priority. (7562)
${ErrorMsg1_AT_23771}       StateLAD/ST/*STNAMES:123:Mustbeanexisting2-alphaStateabbreviationknowntoSMS(e.g.,NJ)(1041).
${StateErr_Msg_AT_23771}    StateLAD/ST/*STNAMES:345:Mustbeanexisting2-alphaStateabbreviationknowntoSMS(e.g.,NJ)(1041).
${ErrorLevel}               ERROR
${ErrorMsg1_AT_23772}       EffectiveDate:Mustbeacalendardatein'MM/DD/YYYY'format.Mustbeadateinthefuturebutwithintheindustry-settimeperiodfromcurrentdate(0106).
${Description_AT_23775}     ECMA262regex"^[SMms]{1}[0-9A-Za-z%#]{1,7}$"doesnotmatchinputstring""forattribute/cprSectName/0/name
${Description_AT_23776}     ECMA262regex"^[SMms]{1}[0-9A-Za-z%#]{1,7}$"doesnotmatchinputstring"KMAIN"forattribute/cprSectName/0/name
${Description_AT_23890}     instance value (\"BB\") not found in enum
${NPAErr_Msg_AT_23774}      	NPALAD/AC/*AREA1:20112:Mustbeanexisting3-digitAreaCodeknowntoSMS(e.g.,201)(1037).
${LATAErr_Msg_AT_23774}         LATALAD/LT/*LATA:1526:Mustbeanexisting3-digitLATACodeknowntoSMS(1038).
${LADErr_Msg_AT_23774}          LAD Definition: Must be a value, cannot use a label name
${10DigErr_Msg_AT_23774}        10-Digit, Tel#: Must be a standard phone# known to SMS
${TimeDigErr_Msg_AT_23774}      Time:Mustbeatimerangelike'10:30A-6:30P'.Rangecannotcrossmidnight.Minutesmustbeinquarterhours(00,15,30,45).LAD/TI/*TIME:01/12/17(1074).
${6DigErr_Msg_AT_23774}         6-Digit: Must be the first 6 digits of a standard phone#
${NPAErr_Msg_AT_23778}      	NPALAD/AC/*AREA1:20:Mustbeanexisting3-digitAreaCodeknowntoSMS(e.g.,201)(1037).
${ErrorMsg_AT_23760}        User not allowed to perform high priority CR updates for Entity BR. (7563)
${EffDtTm_Update_Now_ErrorMessage}      ECMA 262 regex "^(?:[1-9]\\d{3}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1\\d|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[1-9]\\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00)-02-29)T(?:[01]\\d|2[0-3]):(00|15|30|45):[0-5]\\d[Z]$|^(?:[1-9]\\d{3}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1\\d|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[1-9]\\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00)-02-29)$" does not match input string "NOW" for attribute /effDtTm
${Invalid_Token_Msg}     Invalid Credentials
${PR_Copy_CPR/LAD_Err_Msg}   Cannot Copy/Transfer CPR/LAD from Regular CR or Template to Pointer CR. (7763)
${Spare_TFN_Error_Msg}   Number is SPARE. Go to 'NUS' to reserve number. (8618)
${PR_Copy_Without_Parameters}    object has missing required properties (["custRecCompPart","effDtTm","num","reqSntFrom","srcEffDtTm","tgtNum"])
################Error Messages################################
################Error Messages################################

########################################Track2 Messages####################################################################################
${Error_Value}      true
${Error_Code}       400
${ERROR}            ERROR
${WARN}             WARN
${ErrLvl_INFO}       INFO
${Invalid_Username_Error_Msg}       Logon Failed. Invalid Credentials
${Expected_Locked_User_Error_Message}   User is Locked
${Error_Msg_For_Closed_NPA}            NXX closed
${Error_Msg_For_Invalid_Number}       Invalid number. The dial number must contain 10 alphanumeric characters and no wildcard characters allowed
${Error_Msg_For_Invalid_ResUntilDate}      Invalid Reserve Until Date
${Invalid_Credentials_Error_Message}   Invalid Credentials
${Error_Description}    Access failure for API: /v2/ip/sec, version: v2 status: (900901) - Invalid Credentials. Make sure you have given the correct access token
${orgErrorDescription}    Access failure for API: /v2/ip/org, version: v2 status: (900901) - Invalid Credentials. Make sure you have given the correct access token
${relErrorDescription}      Access failure for API: /v2/ip/num, version: v2 status: (900901) - Invalid Credentials. Make sure you have given the correct access token
${Error_Value}      true
${Invalid_Login_Error_Msg}      Logon Failed. Invalid Credentials
${Locked_User_Error_Message}   Login Failed. User is Locked-Contact the Help Desk for Assistance
${Invalid_Token_Description}     Invalid Credentials. Make sure you have given the correct access token
${Invalid_LATA_Error_Msg}  is not a LATA known to SMS/800 TFN Registry. Enter another value.
${Invalid_NPA_Error_Msg}   is not known to SMS/800 TFN Registry. Enter another value.
${Invalid_NXX_Error_Msg}   is not known to SMS/800 TFN Registry or not active. Enter another value.
${Unauthor_User_NXL_Error_Message}   User does not have requisite permissions
${ResOrgEntityCreate_Error_Message}       Resp Org Entity Exists. Use a different Entity code
${ResOrgEntityDelete_Error_Message}       Delete not possible. Resp Org Entity has Resp Units tagged to it
${InvalidResOrgEntityRetrieve_Error_Message}       Invalid RespOrg Enity
${Invalid_WithPerm_Error_Message}   does not match any allowed primitive type
#${InvalidDateErrorMsg}      Effective Date:2019-10-12 cannot be more than 1 year from now.
${InvalidDateErrorMsg}        cannot be more than 1 year from now.
${InvalidNPADateInPOTSTableErrorMsg1}    effDt: must be
${InvalidNPADateInPOTSTableErrorMsg2}     or later.
${TfnNpaErrorMessage}     NPA must be 3 numeric characters in the range from 000-999, excluding all X00, X11, and 8XX (toll-free) codes.
${NxlNpaNotMappedLataErrorMessage}     LATA 222: does not map to NPA. Cannot Add.
${RespOrgUnitAlreadyCreatedErrorMessage}     Resp Org Entity does not exist
${UnknownResporg_Error_Msg}        Invalid RESP ORG
${RespOrgExceededResLimit_Error_Msg}    Change Denied - new Resp Org is at Reservation Limit
${Update_Active/Disconnect/old_Error_Msg}   Record cannot be updated or deleted when the status is Active or Old
${Invalid_OCN_Error_Msg}  is not known to SMS/800 TFN Registry. Enter another value
${Invalid_CO_Error_Msg}  is not known to SMS/800 TFN Registry. Enter another value
${Record_Not_Found_Error_Msg}       Record doesn't exist
${ChangePswd_5Pwsd Differe From OldPswd_Msg}        New Password is same as recently used Old Password. Please Enter a New Password again
${ChangePswd_OnlyAtOnePossion_Msg}      New password entered is invalid
${Invalid_OldPswd_ErrMsg}       Logon Failed. Invalid Credentials
${Invalid_OldPswd_ErrorMsg}       Old Password entered is Invalid
${Invalid_OldPswd_ErrorCode}        702001
${UserId_Locked_ErrMsg}     Password change attempts exceeded. User is locked. Please Contact Help Desk at 844-Hey-Somos
${InValid_NewPassword_ErrMsg}       Password doesnt meet required criteria
${activeRecordErrorMsg}     Record cannot be updated or deleted when the status is Active or Old
${moreThan_50_UserRoles_ErrMsg}     array is too long: must have at most 50 elements but instance has 51 elements for attribute/roleLst
${Specific_UserRole_Msg}        Specified User Role
${Already_Available_Msg}        already available
${Not_Available_Msg}        not available
${UnableToDelete_UserRole_Msg}     Unable to Delete - Specified User Role
${In_Use_Msg}       in use.
${Specific_Role_Msg}        Specified Role
${Already_Assigned_Msg}     already assigned to User
${Missing_Mandatory_Parameter_Msg}      Missing Mandatory parameter {0}
${NotValid_UserRole_Msg}        Not valid User Role
${RequestFailed_Msg}     Request Failed. Logon Id
${Not_Found_Msg}    not found in DB
${NonExistLoginIDErr}        {u'errList': [{u'errCode': u'703012', u'errMsg': u"Logon ID doesn't exist", u'errLvl': u'ERROR'}]}
${AlreadyExistingLoginIDCreateErrorMsg}       Logon ID already exists
${InvalidLengthLoginIDErrMsg}     Logon ID doesn't meet required criteria.
${InvalidNameErrMsg}            Invalid Name.
${PasswdSameAsLoginIDErrMsg}          Password doesn't meet required criteria
${InvalidRespOrgIDErrMsg}       Invalid Resp Org.
${InvalidUserClassErrMsg}      Not valid User Class
${InvalidTelcoErrMsg}     Not valid Telco.
${NonExistLoginIDErrMsg}     Logon ID doesn't exist
${InvalidRespOrgInUpdateLstErroMsg}     Invalid entry in Update List
${InvalidRespOrgInViewLstErrorMsg}         Invalid entry in View List
${UnauthorizedUserAccessResponseMsg}    User does not have requisite permissions
${InvalidPhoneNumErrMsg}       Invalid Phone number
${InvalidLocationErrMsg}    Invalid Location
${InvalidEmailErrMsg}        Email Address doesn't meet required criteria
${InvalidUserRoleErrMsg}       Not valid User Role.
${InvalidAutoLogoffFlagErrMsg}        Not valid Auto Logoff Flag
${InvalidInactiveIndicatorErrMsg}      Invalid Inactive
${InvalidIdentifyIndicatorErrMsg}       Not valid Identify Indicator
${InvalidExemptIndicatorErrMsg}       Not valid Exempt Indicator
${InvalidUserFullNameErrMsg}     Invalid Name
${EmptyUserProfileViewErrMsg}       Missing Mandatory parameter reqId
${InvalidLockIndicatorErrMsg}    Not valid Lock Indicator
${RespOrgUnitIdAlreadyCreatedErrorMessage}     Resp Org ID Exists. Use a different Resp Org ID
${InvalidTroubleReferralNumberErrorMessage}     Invalid Trouble Referral Number
${InvalidEmailIdErrMsg}     Invalid Resp Org Unit Email Address
${InvalidRespOrgEntity}     First two characters of Resp Org Unit must match with Resp Org Entity.
${InvalidRespOrgUnitErrMsg}     Invalid Resp Org Unit. Enter 5 alphanumeric like 'BANJ1'
${RecordDoesNotExistErrMsg}     Record does not exist
${InvalidStatusErrMsg}  Invalid Status. Only 'Active' or 'Disconnect' allowed
${InvalidEntityEmailIdErrMsg}   Invalid Entity Email Address
${InvalidRespOrgUnitErrorMessage}     Resp Org Unit does not exist
${InvalidTroubleReferralErrorMessage}     Invalid Trouble Referral Number
${DisconnectedRespOrgUnitErrorMessage}     Resp Org Unit Id is invalid
${InvalidTroubleReferralNumberErrorMessage}     Invalid Trouble Referral Number
${Unauthor_User_Error_Message}   User does not have requisite permissions
${ActiveSessionLoginIDDeleteErrMsg}      Logon ID cannot be deleted. Session remains active. User must be logged off first
${existsTCOErrorMsg}        Telephone Company Code exists
${nonExistsTCOErrorMsg}     Cannot perform the operation. Telephone Company Code does not exist
${retrieveNonExistsTelcoErrorMsg}       Record does not exist
${TCOassociatedCR_ErrorMsg}             Record cannot be deleted. Associated data needs to be deleted first
${RespOrgEntityDoesNotExistErrorMessage}      Resp Org Entity does not exist
${ControlRespOrgErrorMessage}      Control Resp Org can't be deleted
${username_not_Exist_ErrMsg}	Invalid Logon ID${SPACE}
${ENADataDoesntExistErrorMsg}                 ENA data does not exist for given inputs
${ENANonExistingErrorMsg}                      Carrier (CIC) 9032 is not known to TFN Registry
${ENAImpropernetworkIdErrorMsg}     The network ID can only be used with Carrier (CIC) 0110, like '0110-BA
${ENAResporgFieldValidErrorMsg}   Entity/Resp Org: Required field. Must be a 2-alphanumeric Entity or a 5-alphanumeric Resp Org known to TFN Registry (like: 'BR' or 'BR001')
${ENAResporgEntityErrorMsg}            Invalid Entry. Resp Org Entity/Unit value is not defined in TFN Registry or is in Disconnected Status.
${CicNonExistingErrorMessage}               Carrier (CIC)${SPACE}
${TFNRegistryNotKnown}                      ${SPACE}is not known to TFN Registry
${ENAInactiveErrorMsg}                      Only Active CIC is allowed as input
${ENADuplicateEntryErrorMsg}                Duplicate Entry. Record for supplied key already exists. Create Failed
${ENANonExistingNetworkIdErrMsg}             CCS Network ID:${SPACE}
${No_Data_APR_ErrMsg}       No Carrier Approval data exists.
${netwrkFieldValidationErrMsg}          CCS Network ID required with CIC-0110. Must be a 2-character Network ID known to TFN Registry
#${cicFieldValidationErrMsg}         Carrier (CIC): Required. Must be 4-digit CIC or 0110 with Network (e.g., 0110-BA)
${cicFieldValidationErrMsg}         Carrier (CIC): Required. Must be 4-digit CIC or '0110' with Network (e.g., 0110-BA)
${cicCode_0110_ErrMsg}      CIC-0110 is not applicable for Approvals
${invalidStrtEffDate_ErrMsg}    The start date must be less than (earlier) or the same as the end date
${inactiveCicCode_ErrMsg}       Only Active CIC is allowed as input
####CR Create####
${InValid_TFN_ErrMsg}      Toll-Free Number: Allows 10 alphanumeric and optionally 2 dashes '-'
${InValid_Time_ErrMsg}       Effective Time: Format is: HH:MMZ, where Z denote UTC Time Zone
${InValid_Date_ErrMsg}       Effective Date: Must be a calendar date in YYYY-MM-DD.
${Invalid_Mins_Format_ErrMsg}   Minutes part must be in quarter hours (00, 15, 30, 45) E.G. '10:45'
${invalidInterIntraLATAErrorMsg}        Carrier $$ is not allowed for use in CCS Networks where $$ replaced by the entered IntraLATA or InterLATA carrier
${invalidDestinationNumErrorMsg}        Destination Number $$: Must be a standard phone number (e.g., 2015551000) or a turnaround in numeric. The first 6 characters must be an NPANXX known to TFN Registry
${CIC_Approval_Warning_Msg}             Warning: Approvals are required by at least one carrier (CIC) before record goes ACTIVE
${CIC_Not_Listed_ErrorMsg}              There is at least one CIC for which NO RESPORG-TO-CIC arrangement has been defined.
#${differentRespOrgErrorMsg}             Permission Denied - The Resp Org does not belong to the Logon ID.
${notDefinedRespOrgErrorMsg}            Must be a RESP ORG known to TFN Registry
${invalidNetworkErrorMsg}               Network $$: Must be an existing 2-alpha Network Code known to TFN Registry (e.g., AM)
${invalidStateErrorMsg}                 State $$: Must be an existing 2-alpha State abbreviation known to TFN Registry
${invalidAOSNPAErrorMsg}                NPA $$: Must be an existing 3-digit Area Code known to TFN Registry (e.g., 201) where $$ replaced by Area code entry
${invalidAOSLATAErrorMsg}               Must be an existing 3-digit LATA Code known to TFN Registry where $$ replaced by LATA code entry
${WARNING}      WARNING
${UserRole_NotAvailablePart1_ErrMsg}     Specified User Role
${UserRole_NotAvailablePart2_ErrMsg}     not available
${InvalidPermissionSet_ErrorMsg}         Specified User Permissions not available
${Password_Expired_ErrorMsg}        Logon Failed. Password Expired
#GNA ErrorMsg
${GNAWithInvalidCICErrMsg}            Carrier (CIC) 9032 is not known to TFN Registry
${CreateGNACICWithOutCAGErrMsg}             Carrier Agreements does not exist for the given CIC
${CreateGNAWithAlreadyGNAexistCICErrMsg}        Duplicate Entry. Record for supplied key already exists. Create Failed
${CreateGNAWithInvalidInputNotificationErrMsg}          Either online or mgi-clli must be 'Yes' for Notification
${GNAWithImproperNetworkIDErrMsg}            Network ID required with CIC-0110. Must be a 2-character Network ID known to TFN Registry
${CreateGNAWithInvalidCLLIErrMsg}               CLLI: Must be an 11-alphanumeric source node name belonging to your entity
${CreateGNAWithEmptyCLLIErrMsg}           CLLI must be entered when the user has chosen MGI
${CreateGNAWithInactiveCICErrMsg}           Only Active CIC is allowed as input
${CreateGNAWithInactiveNetworkIDErrMsg}         CCS Network ID is not Active
${CreateGNAWithUnKnownNetworkIDErrMsg}          CCS Network ID: ${UnknownNetworkID}  is not known to TFN Registry
${NonExistingGNARetrieveErrMsg}              GNA data does not exist
${CICWithoutNetworkIDDeleteErrMsg}      Network ID is required for CIC-0110
${NonExistingGNAUpdateErrMsg}                 GNA data does not exist
${InvalidInputNotificationErrMsg}          Invalid input, both 'Yes' and both 'No' not allowed for Notification
${UnauthorizedUserAccessErrorMsg}             Permission Denied: No permissions to perform the operation for the requested Resp Org Unit
${InvalidCICWithNetworkIDDeleteErrMsg}          The network ID can only be used with Carrier (CIC) 0110, like '0110-BA
${InactiveCICErrMsg}         Only Active CIC is allowed as input
${InactiveNetworkIDErrMsg}          CCS Network ID is not Active
${respOrgChangeOnlineNotificationsErrorMsg}      Use ORC screen to setup Resp Org Change On-Line Notifications and use GNA screen to set up Resp Org Change Notifications via MGI, not via On-Line
${aslBlankSpaceErrorMsg}            Label Name: Cannot contain blanks or special symbols
${aslLabelnotExistsErrorMsg}                No set exists for entered key. Ready to create a new set
${aslErrorDescription}    Access failure for API: /v2/ip/adm, version: v2 status: (900901) - Invalid Credentials. Make sure you have given the correct access token
${EffDateNotinDB}       No unit matches the entered Effective Date. The first unit is displayed.
${controlRespOrgIdErrorMessage}     Control Resp Org Required,please enter a valid active Resp Org ID known to TFN Registry
${EffectiveDateMoreThan1YearErrorMessageFirst}     Effective Date${SPACE}
${EffectiveDateMoreThan1YearErrorMessageLast}     cannot be more than 1 year from now
${AslErrorDescription}    Access failure for API: /v2/ip/adm, version: v2 status: (900901) - Invalid Credentials. Make sure you have given the correct access token
${EffectiveDateErrorUnitErrorMessage}    A unit with this Effective Date already exists, please enter another Effective Date
${EffectiveDateErrorMessageFirst}    Effective Date must be${SPACE}
${EffectiveDateErrorMessageLast}     ${SPACE}or later
${NPAErrorMessageFirst}      NPA:${SPACE}
${NPANXXErrorMessage}      NPA-NXX:${SPACE}
${NPAErrorMessageLast}      ${SPACE}is not known to TFN Registry. Please enter another value
${NPANXXErrorMessageLast}      ${SPACE}is not known to TFN Registry. Please enter another value
${NumUpdateInvalidInputErrMsg}      Invalid number status for update. Number is spare.
${InvalidLATAErrMsg}        LATA must be a 3-digit existing LATA code like '220'
${InvalidLATAErrCode}       302127
${InvalidNPAErrorMessageFirst}      NPA${SPACE}
${InvalidNPANXXErrorMessageFirst}      NPA-NXX${SPACE}
${InvalidNPAErrorMessageLast}      ${SPACE}is not known to TFN Registry. Please enter another value
${InvalidNPANXXErrorMessageLast}      ${SPACE}is not known to TFN Registry. Please enter another value
${InvalidLATAErrorMessageFirst}      LATA${SPACE}
${InvalidLATAErrorMessageLast}      ${SPACE}is not known to TFN Registry. Please enter another value
${InvalidSTATEErrorMessageFirst}      State${SPACE}
${InvalidSTATEErrorMessageLast}      ${SPACE}is not known to TFN Registry. Please enter another value
${MaxNPAErrorMessage}      Maximum of 56 values are allowed for label type NPA
${MaxNPANXXErrorMessage}      Maximum of 255 values are allowed for label type NPA-NXX
${InvalidLabelTypeErrorMessage}      Label Type Required. Must enter 'NPA', 'STATE', 'LATA' or 'NPA-NXX'
${InvalidLATAErrMsg}    LATA must be a 3-digit existing LATA code like '220'
${labelConstant}    Label${SPACE}
${InvalidLabelNameErrorMessage}     ${SPACE}does not exist. Please enter another Label Name
${InvalidLabelNameTypeErrorMessage}      Label Type Required. Must enter NPA, STATE, LATA or NPA-NXX
${UnitDoesNotExistsFirstErrorMessage}    No unit matches the supplied Type and/or Effective Date. Please select another Unit
${UnitDoesNotExistsSecondErrorMessage}    . Units in effect on this date are displayed
${AslMissingParametersErrorMessage}     Missing Mandatory parameter aslType
${targetEffectiveDateErrorMessage}     Target Effective Date can't be less than source effective date.
${InvalidEntity_ErrMsg}     Invalid Entity
${InvalidcicCode_NoGNA_Data_errorMsg}     GNA data does not exist
${InvalidnetWrkId_errorMsg}     Network ID required with CIC-0110. Must be a 2-character Network ID known to TFN Registry
${Differentcic_netWrkId_errorMsg}       The network ID can only be used with Carrier (CIC) 0110, like '0110-BA
${InvalidcicCode<4digits_errorMsg}     Carrier (CIC): Required. Must be 4-digit CIC or '0110' with Network (e.g., 0110-BA)
${reservationLimitExceed_errorMsg}        Reservation Limit Exceeded
${InvalidNPA_errorMsg}        Invalid NPA. Must be a valid Toll-Free NPA Code
${InvalidcicCode_Data_errorMsg_TC002_P1}     Carrier (CIC)
${InvalidcicCode_Data_errorMsg_TC002_P2}    is not known to TFN Registry
${ASLlabel}     Label
${nonExistsLabelErrorMessage}       does not exist. Please enter another Label Name
${differentResporgErrorMsg}     Permission Denied: Resp Org of this record does not match your Security Profile
${reservationLimitExceed_errorMsg_TC003}        Reservation Limit Exceeded
${InvalidNPA_errorMsg_TC014}        Invalid NPA. Must be a valid Toll-Free NPA Code
${disconnectedRecordErrorMessage}     Disconnect record already exists.
${permissionDeniedErrorMessage}     Permission Denied: Resp Org of this record does not match your Security Profile
${sourceEffDateBlankErrorMessage}     Source Effective date cannot be blank.
${Missing_Username_Msg}     Missing Mandatory parameter
${Username_Doesntexist_Msg}     Invalid Logon ID
${LoginID_Doesntexist_ErrMsg}     Login ID doesn't exist
${LoginID_Locked_ErrMsg}        Login ID is Locked. Please contact the Help Desk
${EAFWithResporgUserErrCode}        099064
###########TRQ Error Msg#############
${Invalid_Number_ErrMsg}        Invalid Toll-Free Number
${Limit_Exceed_ErrMsg}      Maximum limit for TFN (10) exceeded

###########ORC Error Msg#############
${ORC_RespOrgControlInfo_exists_Errmsg}     Resp Org Report Control Information already exists for the Resp Org Unit
${ORC_NotExistResporgUnit_Errmsg}       Cannot perform the operation. Resp Org Unit does not exist
${ORC_MissingParams_ErrMsg}     Missing Mandatory parameter genEmail/webPrmry/cusFailRpt/respNtfRpt/cnaRpt
${ORC_MissingRecVersionId_ErrMsg}   Missing Mandatory parameter recVersionId
${ORC_MissingRecVersionID_ErrMsg}     Missing Mandatory parameter genEmail/webPrmry/cusFailRpt/respNtfRpt/cnaRpt
${ORC_MissingEmailselection_ErrMsg}     Missing email address for the selection
${ORC_NoRecordInDB_ErrMsg}      Record does not exist. Do you want to create a new record
${ORC_DeleteWithNonExistRespOrg_ErrMsg}      Cannot perform the operation. Resp Org Report Control Information does not exist
${ORC_NoPermtoDeleteRespOrgUnit_ErrMsg}       Permission Denied. No permissions to perform the operation for the requested Resp Org Unit

################CIS#####################
${UnknownCICErrorMsg}       Carrier (CIC)${SPACE}
${CICCodes}       4-digit CIC code(s):${SPACE}
${ExistErrorMsg}        ${SPACE}assigned to another Carrier
${ACNAAlreadyExistErrMsg}     CIS record already exists for ACNA${SPACE}
${NonExistingRespOrgIdErrMsg}       RESP ORG: Must be a RESP ORG known to TFN Registry
${CISWithInactiveRespOrgIdErrMsg}       is not Active,cannot perform any new transactions.
${RespOrg}             Resp Org:${SPACE}
${NotActive}            ${SPACE}is not Active,cannot perform any new transactions.
#${CISPermDeniedErrMsg}           Permission Denied
${CISPermDeniedErrMsg}           Permission Denied: Please contact the Help Desk
${NonExistingACNAErrorMsg}      Carrier Name${SPACE}
#${DoesNotExist}     ${SPACE}doesnt exist
${DoesNotExist}     ${SPACE}does not exist
${DoesNtExist}     ${SPACE}doesn't exist
${CICOrACNANonExistingErrorMsg}  ACNA and CIC should exist and associate each other, CIC${SPACE}
${NotFoundErrorMsg}   not found in TFN Registry
${ActiveStateCICDeleteErrormsg}      CIC should be in DISCONNECT state before delete
${CIS_CIC}  CIC${SPACE}
${CICNotAssociatedWithACNA}         ${SPACE}is not associated with ACNA${SPACE}
${MaxNumberOfSecondaryCICsExceedErrorMsg}           Maximum Allowed Secondary CICs per ACNA Exceeded
${DoesNotExistReadytoCreate}        ${SPACE}doesnt exist. Ready to create
${DoesNtExistReadytoCreate}        ${SPACE}doesn't exist. Ready to create
${AvtiveStateCICDeleteErrMsg}       CIC should be in DISCONNECT state before delete
${InvalidLengthACNAErrMsg}       Invalid Carrier Name, must be 3 Alphabetic Characters
${NotKnownToTFNRegisteryErrMsg}     ${SPACE}is not known to TFN Registry
${ACNADeleteFailedErrMsg}     Delete Failed. Due to dependency on other records ACNA deletion failed.
${ACNAAssociatedWithCustomerRecordErrMsg}       Delete Failed. Due to dependency on other records ACNA deletion failed
${ACNAAssociatedWithCustomerRecordSecondaryCICdeleteErrMsg}       Delete Failed. Carrier Code 0222 Still Exists on Other Records in the System
${NonExistingCAGRetrieveErrMsg}     No Carrier Agreement data exists for the specified CIC. Ready to create
${MoreThanAllowedEntitiesErrMsg}         Maximum of 240 Entities are allowed
${OTCPrimaryOtherThan0110ErrMsg}     CIC 0110 is allowed only along with ACNA OTC
${InvalidPrimaryCICRecForCIC0110ErrMsg}         prmryCICRec or secndryCICRec cannot be passed with ACNA OTC
${CreateWithUnKnownNetworkIDErrMsg}          CCS Network ID: ${UnknownNetworkID}  is not known to TFN Registry
${CreateWithInactiveNetworkIDErrMsg}         CCS Network ID is not Active
${CICcodeNotMappedToACNAErrMsg}     CIC 0110 can be passed only along with ACNA OTC
${UnKnownNetworkIDErrMsg}          CCS Network ID: ${UnknownNetworkID}  is not known to TFN Registry
${CCSNetWorkID}         CCS Network ID:${SPACE}
${CAGNotExistsErrMsg}      Carrier Agreement data exists for the specified CIC. Ready
${DuplicateEntty}        Duplicate Entity${SPACE}
${NotAllowed}        ${SPACE}is not allowed.
${InactiveNetWrkIDInputErrMsg}     Network ID given as input is not active
${InvalidEntityListErrMsg}      If ** is entered, there should not be any other entity entered
${CAGAlreadyExistsErrMsg}       Carrier Agreements with Entities already exists
${Entity}       Entity${SPACE}
${EmptyEntityListErrMsg}      Entity must be 2 alphanumeric characters(Service Provider) or '**'
${NOFInfoNotExistsErrMsg}       No Carrier Notification data is found
${RetrieveNPAWithOutNOFRecordsErrMsg}        No NPA records are found that have Carrier Notification data
${RetrieveTemplateRecordWithOutNOFErrMsg}       No template records are found that have Carrier Notification data
${StartDTGreaterthanEndDtErrMsg}       Start Date must be equal to or earlier than the end date
${CICWithoutNetworkIDErrMsg}      Network ID is required for CIC-0110
${NoNPARecordExistsErrMsg}     No NPA records are found that have Carrier Notification data
${NoTemplateRecordExistsErrMsg}          No template records are found that have Carrier Notification data
${NOTKNOWNTFN}      TFN${SPACE}
${TFNs}          TFN(s)${SPACE}
${Template_Name}        Template Name${SPACE}
${DoesNotExistsinTFNReg}        ${SPACE}does not exist in TFN Registry
${EAPWithCIC0110ErrMsg}         CIC -0110 is not allowed for approvals
${TFNAlreadyExists}              ${SPACE}already exists
${DuplicateTFN}             Duplicate TFN${SPACE}
${DuplicateTFNs}             Duplicate TFN(s)${SPACE}
${EntryNotAllowed}         ${SPACE}Entry is not allowed
${NoEAPDataExistsErrMsg}           No EAP data exists for this CIC
${InactiveCICErrorMsg}     CIC entered by you is not active
${InvalidLengthCICCodeErrMsg}       CIC must be a 4-digit numeric value
${NonExistRespOrgIdErrMsg}       : Must be a RESP ORG known to Toll-Free Number Registry
${LastAttemptErrorMessage}     Password change attempts exceeded. User is locked. Please Contact Help Desk at 844-Hey-Somos
${GNAInvalidInputErrMsg}           Either on-line or mgi-clli Delivery method is required in Notify Request
${NoENODataExistsErrMsg}            ENO data exists for this CIC
${RecordExists}      ${SPACE}record already exists
${RecordExistsErrorCode}     099060
${ENOInactiveCICErrorMsg}      CIC entered by you is not active
${ENODuplicateEntry}     ${SPACE}is a duplicate entry
${NoENODataErrMsg}      No ENO data is found
${UnknownNWID}          CCS Network ID:${SPACE}
${RecordAlreadyExsistsErrMsg}           Record already exists.
################CIS#####################
###############OCN##########
${NonExistingOCNErrMsg}     No matching Carrier Operating Company Numbers data found for the entered Resp Org Entity
${EntityNotInDBErrMsg}      Resp Org Entity must be defined in Resp Org Entity table
${OCNMsg}          Carrier Operating Company Number(s)${SPACE}
${OCNDoesntExistsMsg}       ${SPACE}does not exists in base Carrier Operating Company Numbers table
${OCNAlreadyAssociatedErrMsg}         ${SPACE}already associated with Entity
${EntityAlreadyMappedErrMsg}        Entity to Carrier Operating Company Numbers mapping already created
${DuplicateEntryMsg}        Duplicate Entry${SPACE}
${PleaseEraseDuplicatesErrMsg}         ${SPACE}not allowed. Please erase duplicates
${InActiveOCNIDErrMsg}      ${SPACE}should be in ACTIVE state to use in any other records
${OCNNumberNotFoundErrMsg}      No Carrier Operating Company Numbers data found
${OCNMappingDoesNotExistsErrMsg}    OCN mapping does not exists for given Entity
############NUS######################
${ReservationLimitExceededErrMsg}           Reservation Limit Exceeded.
${InvalidQuantityErrMsg}            Invalid quantity.
${MissingMandatoryParamNumlistErrMsg}     Missing Mandatory parameter: numList
${NoRecordsFoundErrMsg}       No records found
${InvalidCarrierErrMsg}         Invalid Carrier Code Entered
###################################### Error Codes ######################################
################NUS##############
${NoRecordsFoundErrCode}        97987
${ReservationLimitExceededErrCode}          801117
${MissingMandatoryParamNumlistErrCode}          099027
${InvalidQuantityErrCode}           801105
#####################OCN#############
${OCNMappingDoesNotExistsErrCode}        213012
${NonExistingOCNErrCode}         213004
${EntityNotInDBErrCode}         213002
${OCNDoesntExistsCode}       213006
${OCNIDAlreadyAssociatedErrCode}            213009
${EntityAlreadyMappedErrCode}        213011
${DuplicateEntryPleaseEraseDuplicatesErrMsg}        213001
${InActiveOCNIDErrCode}      213007
${OCNNumberNotFoundErrCode}      213010
################CIS#####################
${InvalidCarrierErrCode}         201108
${NoENODataErrCode}          207020
${ENOInactiveCICErrorCode}      207021
${NoENODataExistsErrCode}       207019
${ENOTFNAlreayExistsErrCode}             207001
${ENODuplicateEntryNotAllowedErrCode}       207023
${GNAInvalidInputErrCode}           205027
${LastAttemptErrorCode}             702003
${InvalidLengthCICCodeErrCode}          208012
${EAPInactiveCICErrorCode}     208007
${NoEAPDataExistsErrCode}            208015
${DuplicateEntryNotAllowedErrCode}         208001
${TFNAlreadyexistsErrCode}            208017
${EAPWithCIC0110ErrCode}     208005
${TFNNotKnownErrCode}       209020
${NoNOFRecordExistsErrCode}    209015
${TemplateDoesNotExistsErrCode}     209019
${NoTemplateRecordExistsErrCode}        209009
${RetrieveNPAWithOutNOFRecordsErrCode}      209015
${RetrieveTemplateRecordWithOutNOFErrCode}      209009
${CICWithoutNetworkIDErrCode}                 099040
${StartDTGreaterthanEndDtErrCode}        209002
${NOFInfoNotExistsErrCode}      209016
${EmptyEntityListErrCode}     204003
${EntityNotKnownToTFNRegistryErrCode}              203002
${InvalidEntityListErrCode}      203019
${CAGAlreadyExistsErrCode}       203020
${InactiveNetWrkIDInputErrCode}     203011
${DulpicateEntityErrCode}         203001
${CAGNotExistsErrCode}      203006
${UnKnownNetworkIDErrCode}          099039
${InvalidPrimaryCICRecForCIC0110ErrCode}         201137
${OTCPrimaryOtherThan0110ErrCode}     201136
${CreateWithUnKnownNetworkIDErrCode}               099039
${CreateWithInactiveNetworkIDErrCode}              201139
${CICcodeNotMappedToACNAErrCode}     201136
${InActiveCICErrorCode}     203008
${MoreThanAllowedEntitiesErrCode}         203015
${NonExistingCAGRetrieveErrCode}     203006
${MaxNumberOfSecondaryCICsExceedErrorCode}       201113
${ACNAAssociatedWithCustomerRecordSecondaryCICdeleteErrCode}        201114
${ACNAAssociatedWithCustomerRecordErrCode}      201114
${InvalidLengthACNAErrCode}     201103
${AvtiveStateCICDeleteErrCode}      201123
${CICNotAssociatedWithACNAErrCode}      201131
${NonExistingACNAErrCode}       201104
${CISPermDeniedErrCode1}      099047
${CISPermDeniedErrCode}      099064
${ActiveStateCICDeleteErrorCode}    201123
${NonExistingACNAErrorCode}     201105
${CISCreateWithRespOrgUserErrCode}          201101
${CISWithInactiveRespOrgIdErrCode}            201125
${NonExistingRespOrgIdErrCode}          099018
${CICCodeAlreayExistErrorCode}          201110
${ACNAAlreadyExistErrCode}              201133
${UnknownCICErrorCode}          201104
${CICOrACNANonExistingErrorCode}    201142
#${UnknownCICErrorCode}          099035
${UnknownCAGErrorCode}          099035
################CIS#####################
${InvalidEntity_ErrCode}     607103
${InvalidNPAErrorCode}     301110
${ASLInvalidNPAErrorCode}     302130
#${InvalidNPAErrorCode}     302130
#${InvalidLATAErrorCode}      302128
${InvalidLATAErrorCode}      301109
${InvalidLATAErrCode}       302127
${ASLInvalidLATAErrorCode}      302128
${InvalidNPANXXErrorCode}      302142
${InvalidSTATEErrorCode}      302157
${MaxNPAErrorCode}      302116
${MaxNPANXXErrorCode}      302117
${InavalidLabelTypeErrorCode}      302112
${NumUpdateInvalidInputErrCode}         802118
${Error_Code_For_Inavlid_ResUntilDate}       802122
${Error_Code_For_Closed_NPA}        802102
${Error_Code_For_Invalid_Number}       802101
${ResOrgEntityCreate_Error_Code}       101103
${ResOrgEntityDelete_Error_Code}       101112
${InvalidResOrgEntityRetrieve_Error_Code}       101113
${Error_Code_For_Login}    701000
${Error_Code_For_Locked_User}  701001
${Invalid_LATA_Error_Code}         301109
${Invalid_NPA_Error_Code}           	301110
${Invalid_NXX_Error_Code}           301132
${Unauthor_User_NXL_Error_Code}     099011
${InvalidDateErrorCode}           301120
${InvalidNPADateInPotsTableErrorCode}       301116
${TfnNpaErrorCode}           301113
${NxlNpaNotMappedLataErrorCode}     301104
${RespOrgUnitIdAlreadyCreatedErrorCode}     101107
${Invalid_Credential_Error_Code}    900901
${UnknownRespOrg_Error_Code}       802115
${RespOrgExceededResLimit_Error_Code}       802110
${Invalid_CO_Error_Code}        301105
${Invalid_OCN_Error_Code}       301106
${Record_Not_Found_Error_Code}  301134
${Invalid_Past_Date_Error_Code}     301116
${Invalid_Future_Date_Error_Code}     301120
${Update_Active/Disconnect/old_Error_Code}   301130
${ChangePswd_5Pwsd Differe From OldPswd_Code}    702004
${ChangePswd_OnlyAtOnePossion_Code}     702000
${Invalid_OldPswd_ErrCode}      701000
${UserId_Locked_ErrCode}     702003
${InValid_NewPassword_ErrCode}     703002
${activeRecordErrorCode}        301130
${Duplicate_UserRole_ErrorCode}     704009
${NotAvailable_UserRole_ErrorCode}     704002
${DeleteInUse_UserRole_ErrorCode}      704004
${Assign_Exisitng_Role_ErrorCode}     704012
${Missing_Mandatory_Parameter_ErrorCode}        099027
${NotValid_UserRole_ErrorCode}        703015
${RequestFailed_ErrorCode}      704001
${moreThan_50_UserRoles_ErrCode}
${AlreadyExistingLoginIDCreateErrorCode}         703000
${InavlidLengthLoginIDErrCode}       703001
${PasswdSameAsLoginIDErrCode}       703002
${InvalidNameErrCode}       703003
${InvalidRespOrgIDErrCode}     703007
${InvalidTelcoErrCode}     703009
${InvalidUserClassErrCode}      703008
${NonExistLoginIDErrCode}    703012
${InvalidRespOrgInUpdateLstErroCode}     703010
${InvalidRespOrgInViewLstErrorCode}         703011
${InvalidPhoneNumErrCode}       703004
${InvalidLocationErrCode}       703005
${InvalidEmailErrCode}          703006
${InvalidUserRoleErrCode}        703015
${InvalidAutoLogoffFlagErrCode}      703016
${InvalidInactiveIndicatorErrCode}      703020
${InvalidIdentifyIndicatorErrCode}      703018
${InvalidExemptIndicatorErrCode}        703019
${InvalidUserFullNameErrCode}           703003
${InvalidLockIndicatorErrCode}          703017
${RespOrgUnitAlreadyCreatedErrorCode}     101107
${InvalidTroubleReferralNumberErrorCode}   101109
${InvalidEmailIdErrCode}     101110
${InvalidEntityUpdateErrCode}        101118
${InvalidRespOrgUnitErrCode}      099004
${InvalidStatusErrCode}      101117
${InvalidRespOrgUnitErrorCode}   101116
${InvalidEntityEmailIdErrCode}       101106
${DisconnectedRespOrgUnitErrorCode}     101115
${InvalidRespOrgUnitErrorCode1}          101115
${InvalidTroubleReferralErrorCode}     101109
${InvalidTroubleReferralNumberErrorCode}   101109
${Unauthor_User_Error_Code}     099011
${ActiveSessionLoginIDDeleteErrCode}  703013
${UnauthorizedUserAccessResponseCode}       099011
${existsTCOErrorCode}       104103
${nonExistsTCOErrorCode}    104106
${retrieveNonExistsTelcoErrorCode}      099029
${RecordDoesNotExistsErrCode}      099029
${TCOassociatedCR_ErrorCode}     099028
${RespOrgEntityDoesNotExistErrorCode}       101117
${ControlRespOrgErrorCode}      101111
${ControlRespOrgIdErrorCode}     302156
${EffectiveDateErrorCode}   302139
${EffectiveDateMoreThan1YearErrorCode}    302133
${EffectiveDateErrorUnitErrorCode}    302134
${NPAErrorCode}     302142
${UnitDoesNotExistsFirstErrorCode}      302159
${InvalidLabelNameErrorCode}     302162
${AslMissingParametersErrorCode}     099027
${targetEffectiveDateErrorCode}     302154
${ASL_Invalid_Past_Date_Error_Code}     302139
${nonExistsLabelErrorCode}          302162
${differentResporgErrorCode}        302153
${invalidcicCode<4digits_errorCode}      205016
${netWrkId_diffcic_errorCode}      099041
${invalidnetWrkId_errorCode}      205009
${invalidcicCode_NoGNA_Data_errorCode}      205002
${invalidcicCode_Data_errorCode}      099035
${permissionDeniedErrorCode}     302153
${disconnectedRecordErrorCode}     302121
${sourceEffDateBlankErrorCode}      302155
${reservationLimitExceed_errorCode_TC003}       801117
${InvalidNPA_errorCode_TC014}       801116
${username_not_Exist_ErrCode}	607102
${ORC_RespOrgControlInfo_exists_Code}       103108
${ORC_NotExistResporgUnit_Code}       103111
${ORC_MissingParams_Code}     099027
${ORC_MissingEmailselection_ErrCode}        103109
${ORC_NoRecordInDB_ErrCode}     099030
${ORC_DeleteWithNonExistRespOrg_ErrCode}     103110
${ORC_NoPermtoDeleteRespOrgUnit_ErrCode}     103107
${Invalid_Number_ErrCode}   805102
${Limit_Exceed_ErrCode}     099042
${LoginID_Doesntexist_ErrCode}      703012
${LoginID_Locked_ErrCode}        703106
${ENADataDoesntExistErrorCode}           206018
${ENANonExistingErrorCode}          099035
${ENAImpropernetworkIdErrorCode}    099041
${ENAResporgFieldValidErrorCode}              206006
${ENAResporgEntityErrorCode}               206008
${CicNonExistingErrorcode}                  099035
${ENAInactiveErrorCode}                      206013
${ENADuplicateEntryErrorCode}                   206011
${ENANonExistingNetworkIdErrCode}                  099039
${No_Data_APR_ErrCode}          210016
${netwrkFieldValidationErrCode}     206005
${cicValidationErrCode}            206003
${cicCode_0110_ErrCode}     210005
${invalidStrtEffDate_ErrCode}      210007
${inactiveCicCode_ErrCode}      210017
${duplicateTFNnotAllowed_ErrCode}       210025
${invalidTempName_ErrCode}      210013
${updateGrantedStatus_ErrCode}      210026
${withoutGNA_APRrecord_ErrCode}     210015
####CR Create####
${InValid_TFN_ErrCode}      099012
${Invalid_Time_ErrorCode}       099025
${Invalid_Date_ErrorCode}       099024
${Invalid_Mins_Format_ErrCode}  099026
${CIC_Not_Listed_ErrorCode}             599025
${CIC_Approval_Warning_Code}            599059
${invalidInterIntraLATAErrorCode}       599045
${invalidDestinationNumErrorCode}       599031
${differentRespOrgErrorCode}            599007
${notDefinedRespOrgErrorCode}           099018
${invalidNetworkErrorCode}              599008
${invalidStateErrorCode}                599009
${invalidAOSNPAErrorCode}               599010
${invalidAOSLATAErrorCode}              599011
${UserRole_NotAvailable_ErrCode}    704002
${Password_Expired_ErrorCode}        701004
${aslLabelnotExistsErrorCode}            302151
${EffDateNotinDBErrorCode}                        302150
${InvalidPermissionSet_ErrorCode}    704003
##################################### Customer Record Error Messages #####################################

${AOS}
${AOSNotExistingErrorMessage}   AOS Label ${AOS}: Must be an existing AOS Label name in TFN Registry”,
${AOSNotExistingErrorCode}   599061
${InterLATACarrierOTCErrorMessage}   AOS Label $$ does not belong to entity $$
${InterLATACarrierOTCErrorCode}   599021

${InterLATACarrierOTCErrorMessage}   InterLATA Carrier: 'OTC' cannot be an InterLATA carrier
${InterLATACarrierOTCErrorCode}   599026

${InterLATACarrierOTXErrorMessage}   InterLATA Carrier: 'OTX' cannot be an InterLATA carrier
${InterLATACarrierOTXErrorCode}   599027

${DuplicateDestinationNumbersErrorMessage}      Destination Number$$: Duplicate entries found. Please remove duplicate
${DuplicateDestinationNumbersErrorCode}     599029

${DifferentTurnAroundNumberErrorMessage}      Destination Number $$: If a turnaround is entered, it must be the same as the Toll-Free Number
${DifferentTurnAroundNumberErrorCode}     599030

${DestinationNumberNPANXXUnknownErrorMessage}      Destination Number $$: The first 6 characters must be an NPANXX known to TFN Registry
${DestinationNumberNPANXXUnknownErrorCode}     599062


${POTSDestinationNumberWithoutLSOErrorMessage}      LSO is required if Destination Number is a POTS number
${POTSDestinationNumberWithoutLSOErrorCode}     599032

${LSONotValidNPANXXFormatErrorMessage}      LSO $$: Enter a valid NPANXX. where $$ replaced with user entered LSO
${LSONotValidNPANXXFormatErrorCode}     599033

${LSONPANXXDoesNotMatchPOTSNPANXXErrorMessage}     LSO $$: Must be an NPANXX known to TFN Registry.
${LSONPANXXDoesNotMatchPOTSNPANXXErrorCode}       599034

${WithLSOBlankDestinationNumberErrorMessage}        If Destination Number is blank, LSO must be blank
${WithLSOBlankDestinationNumberErrorCode}       599035

${POTSDestinationNumberBlankNumberOfLinesErrorMessage}      Number of Lines’ is required if a Destination Number is entered
${POTSDestinationNumberBlankNumberOfLinesErrorCode}     599036

${NumberOfLinesBlankDestinationNumberErrorMessage}      If Destination Number is blank, ‘Number of Lines’ must be blank
${NumberOfLinesBlankDestinationNumberErrorCode}     599037

${FOSBlankDestinationNumberErrorMessage}        If Destination Number is blank, FSO must be blank
${FOSBlankDestinationNumberErrorCode}       599039

${FOSIncorrectPOTSNPANXXErrorMessage}       FSO $$: Enter a valid NPANXX.where $$ replaced with user entered FSO
${FOSIncorrectPOTSNPANXXErrorCode}      599040

${FOSNPANXXNotInNXLTableErrorMessage}       FSO $$: Must be an NPANXX known to TFN Registry
${FOSNPANXXNotInNXLTableErrorCode}      599041

${TelcoDoesNotMatchReferenceTableErrorMessage}       Telco: Must be known to TFN Registry.
${TelcoDoesNotMatchReferenceTableErrorCode}      599047

${MissingSoSfErrorMessage}       Must enter a Service Order Number or a Supplemental Form Number
${MissingSoSfErrorCode}      599048

${ContactNumberUnknownToTFNRegistryErrorMessage}       Contact Number: The first 6 digits must be an NPA-NXX combination known to TFN Registry
${ContactNumberUnknownToTFNRegistryErrorCode}      599051

${EffD&TAsNowErrorMessage}      Carrier Approval Required, Therefore ‘NOW’ is REJECTED
${EffD&TAsNowErrorCode}     599060
#GNA CreateError code
${GNAWithInvalidCICErrCode}               099035
${CreateGNACICWithOutCAGErrCode}                205007
${CreateGNAWithAlreadyGNAexistCICErrCode}       205012
${CreateGNAWithInvalidInputNotificationErrCode}     205031
${GNAWithImproperNetworkIDErrCode}            205009
${CreateGNAWithInvalidCLLIErrCode}                  205003
${CreateGNAWithEmptyCLLIErrCode}                    205005
${CreateGNAWithInactiveCICErrCode}                  205013
${CreateGNAWithInactiveNetworkIDErrCode}              205014
${CreateGNAWithUnKnownNetworkIDErrCode}               099039
${NonExistingGNARetrieveErrCode}                     205002
${CICWithoutNetworkIDDeleteErrCode}                 099040
${NonExistingGNAUpdateErrCode}           205002
${InactiveCICErrCode}        205013
${InactiveNetworkIDErrCode}              205014
${InvalidInputNotificationErrCode}     205018
${UnauthorizedUserAccessErrorCode}       099038
${InvalidCICWithNetworkIDDeleteErrCode}         099041
${Username_Doesntexist_ErrorCode}       607102
${Missing_Username_ErrorCode}        099027
${respOrgChangeOnlineNotificationsErrorCode}     205028
###########REL###################################
${RELInvalidEnableBlockingErrorMsg}             enableBlocking accepts only Y or N
${RELInvalidEnableBlockingErrorCode}            099032
${RELInvalidEnableNumAllocIndErrorMsg}          numAllocInd accepts only Y or N
${RELInvalidEnableNumAllocIndErrorCode}         099032
${RELInvalidnumResLimitValueErrorMsg}           numResLimit: Value
${RELInvalidpctWorkNumValueErrorMsg}            pctWorkNums: Value
${RELInvalidresTimeMinsErrorMsg}                resTimeMins: Value
${RELInvalidextLockoutMinsErrorMsg}             extLockoutMins: Value
${RELInvalidlockoutCleanupErrorMsg}             lockoutCleanup: Value
${RELInvalidpctSpareLimitErrorMsg}              pctSpareLimit: Value
${PermissionDenied}                             Permission Denied
${RELPermissionDeniedErrorCode}                 803103
${RELOutOfRange}                                out of Range
${RELRELInvalidnumResLimitValueErrorCode}       803102
${RELMissingParamaterErrorMsg}                  Missing Mandatory parameter recVersionId
${RELMissingParamaterErrorCode}                 099027
${RELInvalidDataTypeErrorMsg}                   Invalid Data-type:
${RELInvalidDataTypeErrorCode}                  099043
${RELInvalidTimeFormatErrorMsg}                 Time: must be in format HH:MM
${RELInvalidTimeFormatErrorCode}                099044


################################ AND Error Messages ################
${AND_ExistsNPAErrMsg}        NPA already exists
${AND_WithoutParametersErrMsg}     Atleast one of the parameters need to be specified: addNPAList/deleteNPAList/startNPA
${AND_ADD_Delete_SameNPAErrMsg}     List of arguments for Add and Delete NPA cannot have same values
${AND_Invalid_NPAErrMsg}        Invalid NPA
${AND_PotsNPAErrMsg}        Allowable NPA can not be an existing geographic NPA
${AND_NonExistingNPAErrMsg}     Only Allowable NPA allowed
${AND_StartNPADeleteErrMsg}     Default NPA delete not allowed. Change the default NPA first

${AND_ExistsNPAErrCode}      810103
${AND_WithoutParametersErrCode}     099023
${AND_ADD_Delete_SameNPAErrCode}     810109
${AND_Invalid_NPAErrCode}       810102
${AND_PotsNPAErrCode}        810104
${AND_NonExistingNPAErrCode}     810106
${AND_StartNPADeleteErrCode}     810108

### NUS Messages ###
${InvalidStart_NXXErrMsg}     Invalid start NXX.
${InvalidQuantity_ErrMsg}     Invalid quantity.
${InvalidNPA_ErrMsg}        : Invalid NPA. Must be a valid Toll-Free NPA Code.
${TFN_NotSpareErrMsg}     Number not spare.
${NUS_NOSpareNumber_ErrMsg}     No spare numbers meeting your search criteria found.
${NUS_RLExceeded_ErrMsg}        Reservation Limit Exceeded
${NUS_CannotFoundReqQty_ErrMsg}     Cannot find enough spare numbers that meet your search criteria for requested quantity.
${InvalidLineNumber_ErrMsg}      Invalid Start Line Number.
${SingleAndErrorMsg}        Number cannot contain a single '&'
${InvalidWildCardNumberErrMsg}       ${space}must be 10 character length and contain atleast one wildcard characters '*' or '&' at NXX and XXXX.
${NoWildCardErrMsg}     If input is one dial number and the quantity is greater than 1, then the number must contain either an '*' and/or '&'
${InvalidConsParameterErrMsg}      cons accepts only Y or N.
${NUS_LastCharNot*ErrMsg}       Number - Last character must equal '*' if consecutive is selected
${NUS_StartNXX_NoWildCardInNXXErrMsg}       Number - Character positions 4-6 must be '*' or '&' with Start NXX entry.
${NUS_StartXXXX_NoWildCardInXXXXErrMsg}        Number - Last 4 characters must be '*' or '&' with Start Line # entry.
${NUS_TFN_InPreReservationErrMsg}   TFN is in pre-reservation state.
${NUS_TFN_InPreReservationErrCode}       801125
${InvalidNPA_ErrCode}       801116
${TFN_NotSpareErrCode}       801124
${NUS_NOSpareNumber_ErrCode}    801122
${NUS_RLExceeded_ErrCode}       801117
${NUS_CannotFoundReqQty_ErrCode}        801104
${InvalidQuantity_ErrCode}      801105
${InvalidStart_NXXErrCode}           801108
${InvalidLineNumber_ErrCode}   801107
${SingleAndErrorCode}       801113
${InvalidWildCardNumberErrCode}        801128
${NoWildCardErrCode}     801115
${InvalidConsParameterErrCode}      099032
${NUS_LastCharNot*ErrCode}       801114
${NUS_StartNXX_NoWildCardInNXXErrCode}       801111
${NUS_StartXXXX_NoWildCardInXXXXErrCode}      801112

### NUSR Messages And Codes
${NUSR_MissingMandatoryParametersErrorMsg}      Missing Mandatory parameter:
${NUSR_MissingMandatoryParametersErrorCode}      099027
${NUSR_InvalidNumberErrorMsg}      ${space}: Invalid number. The dial number must contain 10 alphanumeric characters and no wildcard characters allowed.
${NUSR_InvalidNumberErrorCode}      802101
${NUSR_InvalidNPAErrMsg}        Invalid NPA. Must be a valid Toll-Free NPA Code
${NUSR_InvalidNPAErrCode}        801116
${NUR_InvalidContactNameErrMsg}     Invalid Contact Name
${NUR_InvalidContactNameErrCode}     801120
${NUR_InvalidContactNumberErrMsg}     Invalid Contact Number
${NUR_InvalidContactNumberErrCode}        801121
${NUR_ReserveReservedTFNErrMsg}     : Number not spare.
${NUR_ReserveReservedTFNErrCode}     801124
### NUC Messages And Codes ###
${NPA_NXX_Already_Exists_ErrNsg}      NPA-NXX exists
${NPA_NXX_Invalid_NXX_ErrMsg}         Invalid NXX. NXX Must be in the Range of 000 to 999
${NPA_NXX_Invalid_NPA_ErrMsg}         Invalid NPA. A Valid Toll-Free NPA is Required
${NPA_NXX_Not_Exits_ErrMsg}           Record does not exist. Do you want to create a new record
${NPA_NXX_ViewUser_Not_Exits_ErrMsg}  Record does not exist
${NPA_NXX_Invalid_ErrMsg}             Invalid Status. Allowable Values are OPEN or CLOSED
${NPA_NXX_Update_NotExits_ErrMsg}     NPA-NXX does not exist
${RandomLimit_OutOfRange_ErrMsg}      Random Select Limit out of range
${NPA_NXX_Already_Exists_ErrCode}     811106
${NPA_NXX_Invalid_NXX_ErrCode}        811103
${NPA_NXX_Invalid_NPA_ErrCode}        811102
${NPA_NXX_Not_Exits_ErrCode}          099030
${NPA_NXX_ViewUser_Not_Exits_ErrCode}  099029
${NPA_NXX_Invalid_ErrCOde}            811104
${NPA_NXX_Update_NotExits_ErrCode}    811107
${NPA_NXX_Missing_Mand_Param_ErrCode}    099027
${Invalid_NUC_NPA_ErrCode}                811102
${Invalid_NXX_ErrCode}                811103
${RandomLimit_OutOfRange_ErrCode}      811105

${DisconnectedResporgUnitErrMsg}     Cannot perform the operation. Resp org unit is in Disconnect status
${DisconnectedResporgUnitErrCode}       099050
${AND_InvalidInputErrMsg}           Invalid Data-type: addNPAList
${AND_InvalidInputErrCode}          099043

##### LAD Messages and codes ########
${LAD_Labelname_DuplicateErrorMsg}              : Duplicate LAD label name exists.Use another label name.
${LAD_State}                                    LAD/State/
${LAD}                                          LAD/
${LAD_Labelvalue_DuplicateErrorMsg}             : Duplicate definition found. Please remove duplicate
${LAD_lABEL_Notpresentin_AOS_ErrorMsg}          : Label contains definition that is not included in CR's AOS.
${LAD_Invalid_Sixdig_ErrorMsg}                  : Must be an existing 6-digit code known to TFN Registry.
${LAD_Invalid_Tendig_ErrorMsg}                  : Must be an existing 10-digit code known to TFN Registry.
${LAD_Invalid_LabelName_ErrorMsg}               : Label Name Must start with the * symbol, followed by 1 to 7 alphanumeric.
${LAD_Invalid_LabelType_ErrorMsg}               : Label Type Must be Area Code, Date, LATA, NXX, 6-Digit, State, 10-Digit, Time or Tel#.
${LAD_Invalid_LabelVal_ErrorMsg}                : Must be an existing 3-digit Area code known to TFN Registry (e.g.,201).
${LAD_Duplicate_LabelVal_ErrorMsg}              : Duplicate definition found. Please remove duplicate
${Invalid_Statevalue_Errormsg}                  : Must be an existing 2-alpha State abbreviation known to TFN Registry (e.g.,NJ).
${Invalid_LATAvalue_Errormsg}                   : Must be an existing 3-digit LATA code known to TFN Registry.
${LAD_Labels_exceeds_ErrorMsg}                  : Maximum of 999 LAD labels allowed.
${LAD_same_start_end_dates_ErrorMsg}            : Start and end values in a range entry cannot be same.
${Invalidsorting_Errormsg}                      Not all labels indicated were sorted. The type(Date/Time/Tel#) does not allow sorting or total number of labels exceed LAD limit.
${Invalid_lbltype_errormsg}                     : Label Type Must be Area Code, Date, LATA, NXX, 6-Digit, State, 10-Digit, Time or Tel#.
${Invalid_timelblsErrMsg}                       : Must be a time range like '10:30-18:30'. Range cannot cross midnight. Minutes must be in quarter hours (00,15,30,45).
${Invalid_cust_status_Errormsg}                 Invalid record status. Only ACTIVE, SENDING, and DISCONNECT records can be explicitly requested
${No_Custrec_for_Tfn_Errormsg}                  No customer record exists for this number
${LAD_Empty_Labvals_Errmsg}                     LAD/Area Code/*AREA: Number of definitions must be 1-255 for labels of type Area Code. Use a new label or remove extra definitions.
${Non_Existing_tel_num_Errmsg}                  : The NPA-NXX combination must be known to Toll-Free Number Registry.
${LAD_Labelname_DuplicateErrorCode}             599101
${LAD_Labelvalue_DuplicateErrorCode}            599120
${LAD_lABEL_Notpresentin_AOS_ErrorMsg}          599112
${LAD_Invalid_Sixdig_ErrorCode}                 599109
${LAD_Invalid_Tendig_ErrorCode}                 599110
${LAD_Invalid_LabelName_ErrorCode}              599100
${LAD_Invalid_LabelType_ErrorCode}              599103
${LAD_Invalid_LabelVal_ErrorCode}               599108
${LAD_Duplicate_LabelVal_ErrorCode}             599120
${Invalid_Statevalue_Errorcode}                 599104
${Invalid_LATAvalue_Errorcode}                  599105
${LAD_Labels_exceeds_Errorcode}                 599102
${LAD_same_start_end_dates_ErrorCode}           599121
${Invalidsorting_ErrorCode}                     599114
${Invalid_lbltype_errorCode}                    599103
${Invalid_timelblsErrCode}                      599117
${Invalid_cust_status_Errorcode}                505005
${No_Custrec_for_Tfn_ErrorCode}                 505001
${LAD_Empty_Labvals_ErrCode}                    599116
${Non_Existing_tel_num_ErrCode}                 599111
${LAD_Transfer_SourceCRwithoutLAD_ErrMsg}       The Transfer request cannot be processed as the source Customer Record does not contain the portion(s) being transferred.
${LAD_Transfer_SourceCRwithoutLAD_ErrCode}      508019
${LAD_Transfer_WithNotAllowedSorting_ErrMsg}    Not all labels indicated were sorted. The type(Date/Time/Tel#) does not allow sorting or total number of labels exceed LAD limit.
${LAD_Transfer_WithNotAllowedSorting_ErrCode}   599114
${LAD_Transfer_ExistingCR_overWriteFlagNo_ErrMsg}     The Transfer request cannot be processed as the Target Customer Record already contains the CR portions that are being transferred.
${LAD_Transfer_ExistingCR_overWriteFlagNo_ErrCode}    508018
${CopyCannnotBeProcessedErrMsg}         The Copy request cannot be processed as the source Customer Record does not contain the portion(s) being copied.
${CopyCannnotBeProcessedErrCode}        506024
${LAD_Target_TFN_Spare_Errmsg}          To process copy request, the Target TFN must be RESERVED or UNAVAILABLE status or be the same TFN as source TFN.
${LAD_Target_TFN_Spare_ErrCode}         506002
${LAD_Target_Rec_Past_Errmsg}           The Copy request cannot be processed as the Target Effective Date/Time is in past.
${LAD_Target_Rec_Past_ErrCode}          506007
${LAD_Target_Rec_Earlier_Errmsg}        The Copy request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Customer Record of the Toll-Free Number/Template Name.
${LAD_Target_Rec_Earlier_ErrCode}       506006
${LAD_User_permissions_Srctfn_Errmsg}          Permission Denied: User does not have permissions to Update Source Toll-Free Number's Control Resp Org's records.
${LAD_User_permissions_Tgttfn_Errmsg}          Permission Denied: User does not have permissions to Update Target Toll-Free Number's Control Resp Org's records.
${LAD_User_permissions_ErrCode}         599071
${LAD_Disconnect_SourceCRwithoutLAD_ErrMsg}           The Disconnect request cannot be processed as the source Customer Record does not contain the portion(s) being copied
${LAD_Disconnect_SourceCRwithoutLAD_ErrCode}          512024
${LAD_Disconnect_TargetEffDtTm_NOW_ErrMsg}            The Disconnect request cannot be processed since CPR/LAD portions Copy is not allowed if the Target Effective Date/Time is NOW.
${LAD_Disconnect_TargetEffDtTm_NOW_ErrCode}           512019
${LAD_Disconnect_TargetEDTExists_OWI_No_ErrMsg}       The Disconnect request cannot be processed as the Target Customer Record already contains the CR portions that are being copied.
${LAD_Disconnect_TargetEDTExists_OWI_No_ErrCode}      512009
${LAD_Disconnect_TargetTFN_NoCR_ErrMsg}     The Disconnect request cannot be processed since CPR/LAD portions Copy is allowed only if Customer Record(s) exist for the specified Target TFN.
${LAD_Disconnect_TargetTFN_NoCR_ErrCode}    512023
${CRAlreadyCopiedErrMsg}                The Copy request cannot be processed as the Target Customer Record already contains the CR portions that are being copied.
${CRAlreadyCopiedErrCode}               506023
${LAD_CopyWithNoTime_ErrorMsg}          Source Effective Time must also be specified as the source TFN has more than one Customer Records on the specified source Effective Date.
${LAD_CopyWithNoTime_ErrorCode}         506004
${LAD_Copyprocess_Cantbeprocessed_Errmsg}             Cannot Copy Customer Record whose status is INVALID, FAILED, MUST CHECK or OLD.
${LAD_Copyprocess_Cantbeprocessed_ErrCode}            506011
${LAD_No_AssociatedCR_Errmsg}                         The Copy request cannot be processed as no Customer Records exist for the source TFN with the specified Source Effective Date/Time.
${LAD_No_AssociatedCR_ErrCode}                        506012
${LAD_Target_TFN_Transitional_Errmsg}                 To process copy request, the Target TFN must be RESERVED or UNAVAILABLE status or be the same TFN as source TFN.
${LAD_Target_TFN_Transitional_ErrCode}                506002
${LAD_Notime_Multiplerecords_Errmsg}                  Source Effective Time must also be specified as the source TFN has more than one Customer Records on the specified source Effective Date
${LAD_Notime_Multiplerecords_ErrCode}                 506004
${LAD_Target_Non_Reservedstate_Errmsg}                To process copy request, the Target TFN must be RESERVED or UNAVAILABLE status or be the same TFN as source TFN.
${LAD_Target_Non_Reservedstate_ErrCode}               506002
${LAD_No_Rec_SourceTFN_Errmsg}      The Copy request cannot be processed as no Customer Records exist for the specified Source TFN.
${LAD_No_Rec_SourceTFN_ErrCode}     506001

############## CAD Error messages ###############
${invalidTfnNPAErrorMessage}        : Must be an existing 3-digit 8xx toll-free area code known to Toll-Free Number Registry (e.g., 800).
${invalidTfnNPAErrorCode}           099013
${NoCRexits_ErrorMessage}           No customer record exists for this TFN.
${NoCRexits_ErrorCode}              504001
${CAD_InvalidaosLATA_ErrorMsg}                  : Must be an existing 3-digit LATA Code known to TFN Registry
${Missing_svcOrderNum_SuppFormNum_ErrMsg}       Must enter a Service Order Number or a Supplemental Form Number
${Missing_svcOrderNum_SuppFormNum_ErrCode}      599048
${Missing_intra_inter_LATAs_ErrMsg}             CARRIERS: Entry is required in either the InterLATA or IntraLATA field
${Missing_intra_inter_LATAs_ErrCode}            599022
${invalidLso_ErrMsg}                            : Must be an NPANXX known to TFN Registry
${invalidLso_ErrCode}                           599034
${NpaNxxNotKnownDestNum_ErrMsg}                 : Must be a standard phone number (e.g., 2015551000) or a turnaround in numeric. The first 6 characters must be an NPANXX known to TFN Registry
${NpaNxxNotKnownDestNum_ErrCode}                599031
${CAD_Duplicate_DestNum_ErrMsg}                 : Duplicate entries found.Please remove duplicate
${CAD_Duplicate_DestNum_ErrCode}                599029
${CAD_TurnAround_DestNum_ErrMsg}                : If a turnaround is entered, it must be the same as the Toll-Free Number
${CAD_TurnAround_DestNum_ErrCode}               599030
${CAD_invalidAosLabel_ErrMsg}                   : Must be an existing AOS Label name in TFN Registry
${CAD_invalidAosLabel_ErrCode}                  599061
${CAD_CR_Missing_ErrCode}                       505001
${CAD_CR_Missing_ErrMsg}                        No customer record exists for this number.
${CR_create_existingRecordTFN_ErrMsg}           Customer Record(s) already exist for the given Toll-Free Number.
${CR_create_existingRecordTFN_ErrCode}          502002
${CR_delete_EffDtTm_NOW_ErrMsg}                 The Delete request cannot be processed as the Effective Date and Time cannot be 'NOW'
${CR_delete_EffDtTm_NOW_ErrCode}                507004
${CAD_Create_With_SpareTFN_ErrMsg}      The Create request cannot be processed as the Toll-Free Number Status is SPARE.
${CAD_Create_With_SpareTFN_ErrCode}     502005
${CAD_Create_With_Invalid_FSO_LSO_ErrMsg}       Must be an NPANXX known to TFN Registry
${CAD_Create_With_EffDateTime_More_ErrMsg}      Must be a date in the future but within the industry-set time period (6 Calendar Months) from current date.
${CAD_Create_With_EffDateTime_More_ErrCode}     599001
${CAD_Create_With_EffDate_Past_ErrMsg}     Cannot create CR. Please enter a future Effective Date and Time.
${CAD_Create_With_EffDate_Past_ErrCode}     502004
${CAD_Create_With_Invalid_AOSNet_ErrMsg}        Must be an existing 2-alpha Network Code known to TFN Registry (e.g., AM)
${CADInvalidNPAErrMsg}      : Must be an existing 3-digit 8xx toll-free area code known to Toll-Free Number Registry (e.g., 800)
${NoCADExistsErrCode}     505001
${CADInvalidNPAErrCode}         099013
${MultipleRecordsExistsWarnMsg}             Warning: More than one record exists.
${MultipleRecordsExistsWarnCode}        505004
${CAD_More_DestNumsErrorMsg}                    The customer record requires more data that must be entered in a CPR
${CAD_More_DestNumsErrorCode}                   599057
${CR_delete_EffDtTm_invalid_ErrMsg}             The Delete request cannot be processed as no Customer Record exist for the TFN with the specified Effective Date/Time.
${CR_delete_EffDtTm_invalid_ErrCode}            507002
${CR_delete_EffDtTm_invalidNpa_ErrMsg}          : Must be an existing 3-digit 8xx toll-free area code known to Toll-Free Number Registry (e.g., 800)
${CR_delete_EffDtTm_invalidNpa_ErrCode}         099013
${CR_delete_DiffResporg_ErrMsg}                 User does not have requisite permissions
${CR_delete_DiffResporg_ErrCode}                099011
${CR_create_excessAosLabels_ErrMsg}           AOS Labels: You can only enter up to 16
${CR_create_excessAosLabels_ErrCode}          599016
${CR_create_excessAosLATAs_ErrMsg}           AOS LATAs: You can only enter up to 34
${CR_create_excessAosLATAs_ErrCode}          599015
${CR_create_excessAosNets_ErrMsg}           AOS Networks: You can only enter up to 23
${CR_create_excessAosNets_ErrCode}          599012
${CR_create_NoOtherAosNets_ErrMsg}          Network: No other AOS entries are allowed if Network is US, XA, XB, or XC.
${CR_create_NoOtherAosNets_ErrCode}         599017
${CR_create_pastEffDtTm_ErrMsg}             The Delete request cannot be processed as the Effective Date/Time of the Customer Record is in past
${CR_create_pastEffDtTm_ErrCode}            507005
${CR_create_FutureCrDelete_ErrMsg}          The Delete request cannot be processed. All the future Customer Records must be deleted before deleting New Service (very first) Customer Record.
${CR_create_FutureCrDelete_ErrCode}         507006
${CAD_Create_HPUyes_HIyes_ErrMsg}       High Priority Update of a Customer Record cannot be performed if the Hold Indicator is set to Yes
${CAD_Create_HPUyes_HIyes_ErrCode}      510002
${CAD_Create_HPUwithFutureEffDtTm_ErrCode}     510001
${CAD_Create_HPUwithFutureEffDtTm_ErrMsg}         Effective Date/Time must equal 'NOW' or Today's date when updating with high priority.
${CR_create_doesNotBelong_ErrMsg}           does not belong to entity
${CR_create_UsageNotAllowed_ErrMsg}         . Usage not allowed.
${CR_create_diffEntityAosLabels_ErrCode}          599021
${CR_Create_NonExisting_Carrier_ErrMsg}       is not allowed for use in CCS Networks BX.
${CR_Create_NonExisting_Carrier_ErrCode}       599045
${CR_Create_Without_InterLATACar_ErrMsg}        InterLATA Carrier: Required. Enter a valid CIC.
${CR_Create_Without_InterLATACar_ErrCode}       599043
${CR_Create_User_With_NoHPUPermissions_ErrMsg}      HPU for Entity D4 needs to be defined by the Help Desk.
${CR_Create_User_With_NoHPUPermissions_ErrCode}     510004
${CR_Create_With_HPU_LimitExceeded_ErrMsg}      Allowed number of High Priority Customer Record updates exceeded for Entity BR.
${CR_Create_With_HPU_LimitExceeded_ErrCode}     510003
${CR_current_quarter_hour_ErrMsg}         The Create request cannot be processed as the Effective Date is in past or Effective Date & Time is earlier than the current quarter hour.
${CR_current_quarter_hour_ErrCode}          502007
${emptyDestinationErrorMessage}     You must enter at least one Destination Number
${emptyDestinationErrorCode}        599028
${DestinationNumber}                Destination Number
${DiffturnAroundNumErrorMessgae}        : If a turnaround is entered, it must be the same as the Toll-Free Number.
${DiffturnAroundNumErrorCode}           599030
${DuplicateEntryErrorMessage}           : Duplicate entries found.Please remove duplicate.
${DuplicateEntryErrorCode}              599029
${LSOMissingErrorMessage}               LSO is required if Destination Number is a POTS number.
${LSOMissingErrorCode}               599032
${numTermLineMissingErrorMessage}   Missing mandatory parameter numTermLine in destNums[0].
${numTermLineMissingErrorCode}      099027
${NPANXX known to TFN Registry}          : Must be an NPANXX known to TFN Registry.
${Contact Number}                   Contact Number:
${ContactNumberNotKnownErrorMessage}    The first 6 digits must be an NPA-NXX combination known to TFN Registry.
${ContactNumberNotKnownErrorCode}       599051
${CRPastDateErrorMessage}           The Update request cannot be processed as the Effective Date/Time of the Customer Record is in past.
${CRPastDateErrorCode}              511006
${DestinationNumberInvalidNPANXXErrorMesage}        : Must be a standard phone number (e.g., 2015551000) or a turnaround in numeric. The first 6 characters must be an NPANXX known to TFN Registry.
${DestinationNumberInvalidNPANXXErrorCode}          599031
${CRnotExixtsErrorMessage}                  The Update request cannot be processed as no Customer Record exist for the TFN with the specified Effective Date/Time.
${CRnotExixtsErrorCode}                     511005
${Invalid_LATAvalue_ErrorMsg}      : Must be an existing 3-digit LATA Code known to TFN Registry
${Invalid_LATAvalue_ErrorCode}      599011
${CAD_Diff_Date_ErrorMsg}          The Update request cannot be processed as no Customer Record exist for the TFN with the specified Effective Date/Time
${CAD_Diff_Date_ErrorCode}         511005
${CAD_No_Cr_ErrorMsg}              The Update request cannot be processed as no Customer Records exist for the specified TFN
${CAD_No_Cr_ErrorCode}             511001
${CAD_No_IntraLATA_ErrorMsg}       IntraLATA Carrier: Required. Enter a valid CIC or the special CIC 0110
${CAD_No_IntraLATA_ErrorCode}      599042
${CAD_CR_PastrecErrorMsg}          The Update request cannot be processed as the Effective Date/Time of the Customer Record is in past
${CAD_CR_PastrecErrorCode}         511006
${CAD_InvalidTelco_ErrorMsg}       Telco: Must be known to TFN Registry.
${CAD_InvalidTelco_ErrorCode}      599047
${CAD_Invalid_aosnet_ErrorMsg}     : Must be an existing 2-alpha Network Code known to TFN Registry (e.g., AM)
${CAD_Invalid_aosnet_ErrorCode}    599008
${CAD_Invalid_aoslabel_ErrorMsg}   does not belong to entity BR. Usage not allowed
${CAD_Invalid_aoslabel_ErrorCode}  599021
${CAD_NoRecord_ErrorMsg}           The Update request cannot be processed as no Customer Records exist for the specified TFN
${CAD_NoRecord_ErrorCode}          511001
${CAD_Transfer_withoutCR_ErrMsg}           The Transfer request cannot be processed as no Customer Records exist for the Source TFN.
${CAD_Transfer_withoutCR_ErrCode}          508001
${CAD_Transfer_withoutSrcEffctDtTm_ErrMsg}           Source Effective Date or Source Effective Date & Time must be specified as the source TFN has more than one Customer Record.
${CAD_Transfer_withoutSrcEffctDtTm_ErrCode}          508002
${CAD_Transfer_withonlySrcEffctDt_ErrMsg}           Source Effective Time must also be specified as the TFN has more than one Customer Records on the specified Effective Date.
${CAD_Transfer_withonlySrcEffctDt_ErrCode}          508003
${CAD_Transfer_SrcEffctDt_notExists_ErrMsg}           The Transfer request cannot be processed as no Customer Records exist for the source TFN with the specified Source Effective Date/Time.
${CAD_Transfer_SrcEffctDt_notExists_ErrCode}          508004
${CAD_Transfer_TrgtEffctDt_inPast_ErrMsg}           The Transfer request cannot be processed as the Target Effective Date/Time is in past.
${CAD_Transfer_TrgtEffctDt_inPast_ErrCode}          508007
${CAD_Transfer_crExistBetweenSrcAndTgt_ErrMsg}           The Transfer request cannot be processed as other Customer Records exist for the TFN between Source and Target.
${CAD_Transfer_crExistBetweenSrcAndTgt_ErrCode}          508008
${CAD_Transfer_TrgtCRexists_ErrMsg}           The Transfer request cannot be processed as the Target Customer Record already exists.
${CAD_Transfer_TrgtCRexists_ErrCode}          508013
${CAD_Transfer_sameSrcAndTgt_ErrMsg}           The Transfer request cannot be processed as the specified Source and Target Customer Records have same Effective Date & Time.
${CAD_Transfer_sameSrcAndTgt_ErrCode}          508009
${CAD_Transfer_diffTgtNum_ErrMsg}           The Transfer request cannot be processed since Transfer of entire Customer Record to a different Toll-Free Number (or) a Template Name is not allowed.
${CAD_Transfer_diffTgtNum_ErrCode}          508012
${CR_transfer_NoOtherAosNets_ErrMsg}          Network: No other AOS entries are allowed if Network is US, XA, XB, or XC.
${CR_transfer_NoOtherAosNets_ErrCode}         599017
${CAD_Lock_With_InvalidAction_ErrMsg}   custRecAction: Invalid Value: CREATE. Allows only COPY UPDATE DISCONNECT TRANSFER ALL .
${CAD_Lock_With_InvalidAction_ErrCode}      099037
${CAD_Transfer_Lock_With_TargetTFN_ErrMsg}      The Transfer request cannot be processed since Transfer of entire Customer Record to a different Toll-Free Number (or) a Template Name is not allowed.
${CAD_Transfer_Lock_With_TargetTFN_ErrCode}     508012
${CAD_Copy_Response_For_MustCheck_WarnMsg}       Future Effective Customer Records exist for this TFN and should be checked.
${CAD_Copy_Response_For_MustCheck_WarnCode}      506019
${CAD_TL_With_O_S_D_A_CR_ErrMsg}    The Transfer request cannot be processed since Customer Records in OLD, SENDING, ACTIVE, or DISCONNECT status cannot be Transferred.
${CAD_TL_With_O_S_D_A_CR_ErrCode}       508006
${CAD_Transfer_MoreThanTwoDestNums_ErrMsg}      The customer record requires more data that must be entered in a CPR.
${CAD_Transfer_MoreThanTwoDestNums_ErrCode}     599057
${CAD_InvalidTelco_ErrorCode}      599047
${CAD_Invalid_aosnet_ErrorMsg}     : Must be an existing 2-alpha Network Code known to TFN Registry (e.g., AM)
${CAD_Invalid_aosnet_ErrorCode}    599008
${CAD_Invalid_aoslabel_ErrorMsg}   does not belong to entity BR. Usage not allowed
${CAD_Invalid_aoslabel_ErrorCode}  599021
${CAD_NoRecord_ErrorMsg}           The Update request cannot be processed as no Customer Records exist for the specified TFN
${CAD_NoRecord_ErrorCode}          511001
${InvalidConTelErrorMsg}           Contact Number: The first 6 digits must be an NPA-NXX combination known to TFN Registry.
${InvalidConTelErrorCode}            599051
${MissingServiceOrderErrMsg}     Must enter a Service Order Number or a Supplemental Form Number.
${MissingServiceOrderErrCode}     599048
${MissingInter0rIntraLataErrMsg}        CARRIERS: Entry is required in either the InterLATA or IntraLATA field.
${MissingInter0rIntraLataErrCode}        599022
${CR_transfer_TrgtEfftTimeOnly_ErrMsg}          Target Effective Time must also be specified as the Transfer was requested after the Default CR Effective Time Range.
${CR_transfer_TrgtEfftTimeOnly_ErrCode}         508005
${CR_transfer_ControlRespOrgchange_ErrMsg}          The Transfer request cannot be processed since the Control Resp Org change of a TFN is allowed only when Target Effective Date & Time is NOW.
${CR_transfer_ControlRespOrgchange_ErrCode}         508011
${CR_transfer_invalidTFN_ErrMsg}          Invalid Toll-Free Number format. It must contain 10 alphanumeric characters.
${CR_transfer_invalidTFN_ErrCode}         099012
${CR_transfer_diffResporg_ErrMsg}          Permission Denied - Logon ID cannot update Resp Org's records.
${CR_transfer_diffResporg_ErrCode}         599006
${CR_transfer_validCic_ErrMsg}          InterLATA Carrier: Required. Enter a valid CIC.
${CR_transfer_validCic_ErrCode}         599043
${CR_transfer_diffInterIntraLatas_ErrMsg}          POTS# required, Else Intra & Inter LATA Carriers must be the same.
${CR_transfer_diffInterIntraLatas_ErrCode}         599058
${CR_transfer_cannotProcess_ErrMsg}               The Transfer request cannot be processed at this time.
${CR_transfer_someoneElseWorking_ErrMsg}          is working on the Source Record.
${CR_transfer_someoneElseWorking_ErrCode}         508010
${CR_transfer_missingIntraLata_ErrMsg}          IntraLATA Carrier: Required. Enter a valid CIC or the special CIC 0110.
${CR_transfer_missingIntraLata_ErrCode}         599042
${CAD_NoRecordDisconnect_ErrorMsg}      The Disconnect request cannot be processed as no Customer Records exist for the specified TFN.
${CAD_NoRecordDisconnect_ErrorCode}     512001
${CAD_DisconnectWithExistingRecordTargetEffectivedate_ErrorMsg}     The Disconnect request cannot be processed as the Target Customer Record already exists.
${CAD_DisconnectWithExistingRecordTargetEffectivedate_ErrorCode}        512004
${CAD_DisconnectWithNoRecordExistingEffdtTm_ErrorMsg}        The Disconnect request cannot be processed as no Customer Records exist for the TFN with the specified Source Effective Date/Time.
${CAD_DisconnectWithNoRecordExistingEffdtTm_ErrorCode}       512002
${CAD_DisconnectWithNoTime_ErrorMsg}      Source Effective Time must also be specified as the source TFN has more than one Customer Records on the specified source Effective Date.
${CAD_DisconnectWithNoTime_ErrorCode}        512005
${CAD_DisconnectWithEffDateEarliarThanTheRecord_ErrorMsg}        The Disconnect request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Disconnect Customer Record of the TFN.
${CAD_DisconnectWithEffDateEarliarThanTheRecord_ErrorCode}        512003
${CAD_DisconnectWithSameSrcAndTgtEffDate_ErrorMsg}      The Disconnect request cannot be processed as the specified Source and Target Customer Records have same Effective Date & Time.
${CAD_DisconnectWithSameSrcAndTgtEffDate_ErrorCode}      512006
${CAD_DisconnectWithEffDateEqualOrEarlierThanTargetRecordsDate}     The Disconnect request cannot be processed as the Target Effective Date/Time is earlier than (or) equal to that of the earliest record of the Target Toll-Free Number/Template Name.
${CAD_DisconnectWithRecordInBetweenSrcAndTgtEffDate_ErrorMsg}       The Disconnect request cannot be processed as other Customer Records exist for the TFN between Source and Target.
${CAD_DisconnectWithRecordInBetweenSrcAndTgtEffDate_ErrorCode}       512007
${CAD_DisconnectInvalidCRErrorMsg}      The Disconnect request cannot be processed as the Source Customer Record is in INVALID, FAILED or MUST CHECK or OLD status.
${CAD_DisconnectInvalidCRErrorCode}      512008
${CAD_DisconnectOLDRecordErrorMsg}      The Disconnect request cannot be processed since only CPR/LAD portions of a Customer Record in OLD status can be copied.
${CAD_DisconnectOLDRecordErrorCode}      512009
${CAD_EndInterceptdateEarilierThanCREffDateErrorMsg}        End Intercept Date: Must not be earlier than the Effective Date of this Disconnect CR and Must be within the industry-set time period (180 Calendar Days) from the TFN's disconnect date.
${CAD_EndInterceptdateEarilierThanCREffDateErrorCode}     512015
${CAD_DisconnectEndInterceptdateAsNowErrorMsg}      End Intercept Date: 'NOW' is allowed only when the Target Customer Record's Effective date is current date or 'NOW'.
${CAD_DisconnectEndInterceptdateAsNowErrorCode}      512016
${CAD_DisconnectUnavailableTFNReferralAsYErrorMsg}     Referral cannot be Yes for Disconnect Customer Records of a TFN in UNAVAILABLE status.
${CAD_DisconnectUnavailableTFNReferralAsYErrorCode}     512017
${CAD_DisconnectLockedTFNErrorMsg}      The Disconnect request cannot be processed at this time.
${CAD_Disconnect_RespOrgChangeErrMsg}       The Disconnect request cannot be processed since the Control Resp Org change of a Toll-Free Number is allowed only when Target Effective Date & Time is NOW.
${CAD_Disconnect_RespOrgChangeErrCode}       512012
${IsWorkingErrorMsg}        ${space}is working on the Source Record.
${CAD_DisconnectLockedTFNErrorCode}      512011
${CAD_DisconnectUserWithNoUpdatePermsErrorMsg}      User does not have requisite permissions.
${CAD_DisconnectUserWithNoUpdatePermsErrorCode}      099011
${CAD_DisconnectWithTgTEfDateEarlierThanExistingRecordErrorMsg}     Future Effective Customer Records exist for this TFN and should be checked.
${CAD_DisconnectWithTgTEfDateEarlierThanExistingRecordErrorCode}     512018
${CADCopyMultipleCRsWithSameEffDateErrMsg}     The Copy request cannot be processed as no Customer Records exist for the source TFN with the specified Source Effective Date/Time.
${CADCopyMultipleCRsWithSameEffDateErrCode}     506012
${CADCopyWithEarlierEffdateErrMsg}       The Copy request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Customer Record of the Toll-Free Number/Template Name.
${CADCopyWithEarlierEffdateErrCode}         506006
${CADCopyWithPastEffdateErrMsg}             The Copy request cannot be processed as the Target Effective Date/Time is in past.
${CADCopyWithPastEffdateErrCode}            506007
${CADAlreadyExistsErrMsg}        The Copy request cannot be processed as the Target Customer Record already exists.
${CADAlreadyExistsErrCode}       506010
${CADwithSameEfDtAndTmErrMsg}       The Copy request cannot be processed as the specified Source and Target Customer Records have same Effective Date & Time.
${CADwithSameEfDtAndTmErrCode}          506009
${CADcopyWithInvalidStatusErrMsg}       Cannot Copy Customer Record whose status is INVALID, FAILED, MUST CHECK or OLD.
${CADcopyWithInvalidStatusErrCode}      506011
${CAD_CopyWithNoTime_ErrorMsg}      Source Effective Time must also be specified as the source TFN has more than one Customer Records on the specified source Effective Date.
${CAD_CopyWithNoTime_ErrorCode}     506004
${CADUpdateWithUnauthorizedSourceTFNUserErrMsg}     Permission Denied: User does not have permissions to Update Source Toll-Free Number's Control Resp Org's records.
${CADUpdateWithUnauthorizedSourceTFNUserErrCode}         599071
${LADDisconnectErrMsg}         Permission Denied: Customer/Agent users can update only CPR/LAD portions of a Customer Record.
${LADDisconnectErrCode}     599072
${CADUpdateWithUnauthorizedTargetTFNUserErrMsg}     Permission Denied: User does not have permissions to Update Target Toll-Free Number's Control Resp Org's records.
${CADUpdateWithUnauthorizedTargetTFNUserErrCode}            599071
${InvalidSrcEffDtErrMsg}        The Copy request cannot be processed as no Customer Records exist for the source TFN with the specified Source Effective Date/Time.
${copyRequestCannotBeProcessedErrMsg}       The Copy request cannot be processed at this time.
${UserIsWorkingErrMsg}      is working on the Source Record
${copyRequestCannotBeProcessedErrCode}      506016
${InvalidSrcEffDtErrCode}     506020
${NOCRExistsErrMsg}     The Copy request cannot be processed as no Customer Records exist for the specified Source TFN.
${NOCRExistsErrCode}     506001
${CADExistsBetweenSrcAndTagrgetEffDtErrMsg}      The Copy request cannot be processed as other Customer Records exist for the TFN between Source and Target.
${CADExistsBetweenSrcAndTagrgetEffDtErrCode}             506008
${CADCopyToInvalidStateNumberErrmsg}         To process copy request, the Target TFN must be in RESERVED status or the Target TFN must be same as source TFN.
${CADCopyToInvalidStateNumberErrCode}        506003
${CAD_DisconnectUpdateReferralMissingErrorMsg}        Referral must be specified if the Source CR is a non-Disconnect CR.
${CAD_DisconnectUpdateReferralMissingErrorCode}        512026
${CAD_DisconnectUpdateReferralMissingErrorCode}        512019
${CAD_Disconnect_EffDtTm_NOW_ErrorMsg}      The Disconnect request cannot be processed since CPR/LAD portions Copy is not allowed if the Target Effective Date/Time is NOW.
${CAD_UpdateReq_ErrorMsg}        The Update request cannot be processed at this time.
${CAD_workingOnRec_ErrMsg}       is working on this Customer Record.
${CAD_UpdateReq_ErrorCode}        511008
${CADWithMultipleRecordsErrMsg}     Effective Date or Effective Date & Time must be specified as the TFN has more than one Customer Record
${CADWithMultipleRecordsErrCode}     511003
${CADWithMultipleRecordsExistsOnDateErrMsg}     Effective Time must also be specified as the TFN has more than one Customer Record on the specified Effective Date.
${CADWithMultipleRecordsExistsOnDateErrCode}     511004
${CADFutureRecordsExistsErrMsg}     Future Customer Records exist for this TFN and should be checked.
${CADFutureRecordsExistsErrCode}        511010
${CAD_Disconnect_EffDtTm_string}        Effective Date/Time
${CAD_Disconnect_HPU_ErrMsg}        must equal 'NOW' or Today's date when updating with high priority.
${CAD_Disconnect_HPU_ErrCode}        510001
${CAD_Disconnect_EffctvTmRange_ErrMsg}        Target Effective Time must also be specified as the Disconnect was requested after the Default CR Effective Time Range.
${CAD_Disconnect_EffctvTmRange_ErrCode}        512010
${CAD_DisconnectUpdateCtrlRespOrgIdErrorMsg}        The Disconnect request cannot be processed since the Control Resp Org change of a Toll-Free Number is allowed only when Target Effective Date & Time is NOW.
${CAD_DisconnectUpdateCtrlRespOrgIdErrorCode}       512012
${NoCADErrMsg}  No customer record exists for this number.
${NoCADErrCode}     505001
${CopyUpdateCtrlRespOrgWithOutEffDateErrMsg}     The Copy request cannot be processed since the Control Resp Org change of a TFN is allowed only when Target Effective Date & Time is NOW.
${CADcopyWithInvalidStateTargetNumberErrMsg}       To process copy request, the Target TFN must be RESERVED or UNAVAILABLE status or be the same TFN as source TFN.
${CADcopyWithInvalidStateTargetNumberErrCode}       506002
${CopyUpdateCtrlRespOrgWithOutEffDateErrCode}     506018
${UserIsWorkingTgtRecordErrMsg}      is working on the Target Record.
${UserIsWorkingTgtRecordErrCode}         506017
${CAD_Delete_ErrMsg}        The Delete request cannot be processed at this time.
${CAD_Delete_ErrCode}        507007
${CAD_DuplicateVlauesErrorMsg}      Duplicate value(s)
${CAD_RemoveDuplicatesErrorMsg}     found. Please remove duplicates.
${LAD_Transfer_CrDoesNotExist_ErrMsg}           The Transfer request cannot be processed since CPR/LAD portions Transfer is allowed only if Customer Record(s) exist for the specified Target Toll-Free Number (or) Template Name.
${LAD_Transfer_CrDoesNotExist_ErrCode}          508015
${LAD_Transfer_EffctDtTmNow_ErrMsg}           The Transfer request cannot be processed since CPR/LAD portions Transfer is not allowed if the Target Effective Date/Time is NOW.
${LAD_Transfer_EffctDtTmNow_ErrCode}          508016
${LAD_Transfer_SrcEffctDtTmNotExists_ErrMsg}           The Transfer request cannot be processed as no Customer Records exist for the source TFN with the specified Source Effective Date/Time.
${LAD_Transfer_SrcEffctDtTmNotExists_ErrCode}          508004
${LAD_Transfer_SrcEffctTmShouldspecify_ErrMsg}           Source Effective Time must also be specified as the TFN has more than one Customer Records on the specified Effective Date.
${LAD_Transfer_SrcEffctTmShouldspecify_ErrCode}          508003
${LAD_Transfer_OldCrCannotBeTransferred_ErrMsg}           The Transfer request cannot be processed since Customer Records in OLD, SENDING, ACTIVE, or DISCONNECT status cannot be Transferred.
${LAD_Transfer_OldCrCannotBeTransferred_ErrCode}          508006
${LAD_Transfer_CADportionCannotBeTransferred_ErrMsg}           The Transfer request cannot be processed as the source Customer Record does not contain the portion(s) being transferred.
${LAD_Transfer_CADportionCannotBeTransferred_ErrCode}          508019
${CADHPUWithInvalidEffDtTmErrMsg}           Effective Date/Time must equal 'NOW' or Today's date when updating with high priority.
${CADHPUWithInvalidEffDtTmErrCode}          510001
${CADHPUWithHldIndFlagErrMsg}       High Priority Update of a Customer Record cannot be performed if the Hold Indicator is set to Yes.
${CADHPUWithHldIndFlagErrCode}       510002
${CADCopyAfterDefaultCREffDtTimeErrMsg}     Target Effective Time must also be specified as the Copy was requested after the Default CR Effective Time Range
${CADCopyAfterDefaultCREffDtTimeErrCode}         506015
${CADUpdateOtherResporgErrMsg}        Permission Denied - Logon ID cannot update Resp Org's records
${CADUpdateOtherResporgErrCode}      599006
${LAD_Transfer_overWiteN_ErrMsg}           The Transfer request cannot be processed as the Target Customer Record already contains the CR portions that are being transferred.
${LAD_Transfer_overWiteN_ErrCode}          508018
${LAD_Transfer_TgtBeingWorkedOn_ErrCode}          508014
${LAD_Disconnect_diffTfn_ErrMsg}           The Disconnect request cannot be processed since Target TFN and Source TFN must be same when CAD (or) CAD and CPR/LAD is to be copied from Source Record.
${LAD_Disconnect_diffTfn_ErrCode}          512022
${LADDisconnectWithInvalidInputErrCode}     511016
${LADDisconnectWithReservedNumErrMsg}     The Disconnect request cannot be processed as no Customer Records exist for the specified TFN.
${LADDisconnectWithReservedNumErrCode}     512001
${LADDisconnectWithoutLADPortionErrMsg}        The Disconnect request cannot be processed as the source Customer Record does not contain the portion(s) being copied
${LADDisconnectWithoutLADPortionErrCode}     512024
${LADdisconnectWithInvalidEffDtErrCode}        512002
${LADdisconnectSrcLockErrCode}  512011
${LADdisconnectTgtLockErrCode}         512020
${LADdisconnectWithInvalidEffDtErrMsg}            The Disconnect request cannot be processed as no Customer Records exist for the TFN with the specified Source Effective Date/Time.
${LADDisconnectWithCADportionErrMsg}        The Disconnect request cannot be processed since Target TFN and Source TFN must be same when CAD (or) CAD and CPR/LAD is to be copied from Source Record.
${LADDisconnectWithCADportionErrCode}           512022
${LADDisconnectWithInvalidInputErrMsg}     Cannot Update the earliest Customer Record of a TFN with End Intercept Date/Referral.
${LADDisconnectWithInvalidInputErrorCode}    511016
${LAD_CopyWithNoExistingRecordsFortargetTFNErrorMsg}        The Copy request cannot be processed since CPR/LAD portions Copy is allowed only if Customer Record(s) exist for the specified Target Toll-Free Number/Template Name.
${LAD_CopyWithNoExistingRecordsFortargetTFNErrorCode}        506020
${LAD_CopyLockWithEffDateNowErrMsg}     The Copy request cannot be processed since CPR/LAD portions Copy is not allowed if the Target Effective Date/Time is NOW.
${LAD_CopyLockWithEffDateNowErrCode}     506021
${LAD_CopyCR_PortionsAlreadyCopiedErrMsg}       The Copy request cannot be processed as the Target Customer Record already contains the CR portions that are being copied.
${LAD_CopyCR_PortionsAlreadyCopiedErrCode}       506023
${PAD_Disconnect_endInterceptDate_ErrMsg}       The Effective Date of this record is greater than the End Intercept Date of the previous Disconnect record (or) End Intercept Date of this record is less than the Effective Date of the next Disconnect record.
${PAD_Disconnect_endInterceptDate_ErrCode}       534020

#CPR error messages
${CPR_missingStateLad_ErrMsg}           CPR/MAIN1/State/*STATE: Label definition not found in the LAD.
${CPR_missingStateLad_ErrCode}          599200
${CPR_mismatchingPrimInterLata_ErrMsg}           CPR/Primary InterLATA Carrier: CARRIER 0022 entered in CPR is not listed in CAD or TAD.
${CPR_mismatchingPrimInterLata_ErrCode}          599202
${CPR_mismatchingPrimIntraLata_ErrMsg}           CPR/Primary IntraLATA Carrier: CARRIER 0022 entered in CPR is not listed in CAD or TAD.
${CPR_mismatchingPrimIntraLata_ErrCode}          599203
${CPR_mismatchingRowsNodes_ErrMsg}           CPR/MAIN1: The number of entries in the CPR row does not match the number of CPR nodes.
${CPR_mismatchingRowsNodes_ErrCode}          599204
${CPR_morethan4states_ErrMsg}           CPR/MAIN1: Maximum of 4 value(s) are allowed for State node in a CPR row.
${CPR_morethan4states_ErrCode}           599205
${CPR_duplicatestates_ErrMsg}           CPR/MAIN1/State/CA: Duplicate entries found. Please remove duplicate.
${CPR_duplicatestates_ErrCode}           599206
${CPR_invalidState_ErrMsg}           CPR/MAIN1/State/AA: Must be an existing 2-alpha State abbreviation known to TFN Registry (e.g., NJ).
${CPR_invalidState_ErrCode}           599211
${CPR_invalidAosState_ErrMsg}           State HH: Must be an existing 2-alpha State abbreviation known to TFN Registry (e.g., NJ).
${CPR_invalidAosState_ErrCode}           599009
${CPR_OtherForCarrier_ErrMsg}           CPR/MAIN1: Cannot use 'OTHER' value in Carrier, Switch, Percent, Announcement, or Tel# nodes.
${CPR_OtherForCarrier_ErrCode}           599226
${CPR_TelCarrierWithAnn_ErrMsg}           CPR/MAIN1: Cannot populate TEL# and CARRIER when ANNOUNCEMENT node is Used.
${CPR_TelCarrierWithAnn_ErrCode}           599230
${CPR_TelCarrierWithTermnumString_ErrMsg}         ],termNum:[
${CPR_TelCarrierWithAnnString_ErrMsg}         ],announcement:[VCA]}.
${CPR_TelNotListedinCad_String}           CPR/MAIN1/Tel#/
${CPR_TelNotListedinCad_ErrMsg}           : TEL# value is not listed in CAD. Check terminating TEL# information.
${CPR_TelNotListedinCad_ErrCode}           599231
${endBraces}                              ]}.
${CPR_Create_AllPossibilitiesNotCoveredInAosState_ErrMsg}      CPR/MAIN/State: OTHER must be specified so that all possibilities are covered.
${CPR_CarrierNotInCad_ErrMsgFirst}           CPR/MAIN1/Carrier/
${CPR_CarrierNotInCad_ErrMsg}            : Specified Carrier is not listed in 'CAD'. Check the 'CAD'.
${CPR_CarrierNotInCad_ErrCode}           599233
${CPR_FirstColumnMissing_ErrMsg}           CPR/MAIN: The first column of all rows must contain data.
${CPR_FirstColumnMissing_ErrCode}           599238
${CPR_DuplicateRowData_ErrMsg}           CPR/MAIN1: Two CPR rows contain the same data. Remove the Duplicate.
${CPR_DuplicateRowData_ErrCode}           599239
${CPR_CarrierstateAnn_ErrMsg}           CPR/MAIN1: The first CPR node cannot be: Carrier, Tel#, or Announce.
${CPR_CarrierstateAnn_ErrCode}           599240
${CPR_rowsDifferActionNodes_ErrMsg}           CPR/MAIN1: Cannot have CPR rows that only differ in action node values.
${CPR_rowsDifferActionNodes_ErrCode}          599248
${CPR_CoverOtherPossibilities_ErrMsg}           CPR/MAIN1/State: Entries in a CPR node must include all possible cases. Missing State:
${CPR_CoverOtherPossibilities_ErrCode}          599283
${CPR_CoverOtherPossibilitiesNotNeeded_ErrMsg}           CPR/MAIN1/State: OTHER is not needed since all possible cases are covered.
${CPR_CoverOtherPossibilitiesNotNeeded_ErrCode}          599254
${CPR_CoverOtherPossibilitiesToUseOTHER_ErrMsg}           CPR/MAIN1/State: To use OTHER, some other possibilities must be specified.
${CPR_CoverOtherPossibilitiesToUseOTHER_ErrCode}          599253
${CPR_TimeCrossesMidnight_ErrMsg}           CPR/MAIN1/Time/10:00-00:30: Must be a valid time range in 24-hour format like '10:30-18:30'. Range cannot cross midnight. Minutes must be in quarter hours (00,15,30,45).
${CPR_TimeCrossesMidnight_ErrCode}          599218
${CPR_TimeOtherNotSpecified_ErrMsg}           CPR/MAIN1/Time: Entries in a CPR node must include all possible cases. Missing Time:
${CPR_TimeOtherNotSpecified_ErrCode}          599252
${CPR_MoreThan10OFFSwitch_ErrMsg}           SWITCH Cannot have More than 10 'OFF'. Check the use of common suffix.
${CPR_MoreThan10OFFSwitch_ErrCode}          599246
${CPR_string}       CPR/MAIN1:
${CPR_MoreThan1OnSwitch_ErrMsg}           SWITCH cannot have more than 1 'ON'. Check the use of common suffix.
${CPR_MoreThan1OnSwitch_ErrCode}          599245
${CPR_2ValuesIn1Switch_ErrMsg}           CPR/MAIN1: Maximum of 1 value(s) are allowed for switch node in a CPR row.
${CPR_2ValuesIn1Switch_ErrCode}          599205
${CPR_TransferEntireCRDiffTfn_ErrMsg}       The Transfer request cannot be processed since Transfer of entire Customer Record to a different Toll-Free Number (or) a Template Name is not allowed.
${CPR_TransferEntireCRDiffTfn_ErrCode}      508012
${CPR_TransferMissingEffDtTmMultipleCRs_ErrMsg}       Source Effective Date or Source Effective Date & Time must be specified as the source TFN has more than one Customer Record.
${CPR_TransferMissingEffDtTmMultipleCRs_ErrCode}      508002
${CPR_TransferOnlyEffDtMultipleCRs_ErrMsg}       Source Effective Time must also be specified as the TFN has more than one Customer Records on the specified Effective Date.
${CPR_TransferOnlyEffDtMultipleCRs_ErrCode}      508003
${CPR_TransferNoPermissions_ErrMsg}                 User does not have requisite permissions
${CPR_TransferNoPermissions_ErrCode}                099011

${CPR_NPA_Decision_Node_ErrMsg}         CPR/MAIN/Area Code/813: Decision Node value not defined in CR's AOS.
${CPR_AreaCode_ErrMsg}          CPR/MAIN/Area Code: Entries in a CPR node must include all possible cases. Missing Area Code:
${CPR_NPA_Decision_Node_ErrCode}        599216
${CPR_AreaCode_ErrCode}         599252
${CPR_Lata_Decision_Node_ErrMsg}        CPR/MAIN/LATA/738: Decision Node value not defined in CR's AOS.
${CPR_Lata_Decision_Node_ErrCode}       599216
${CPR_DecisionNode_Mismatch_ErrMsg}     CPR/MAIN/State/CA: Decision Node value not defined in CR's AOS.
${CPR_Specification_ErrMsg}     CPR/MAIN/State: Entries in a CPR node must include all possible cases. Missing State:
${CPR_DecisionNode_Mismatch_ErrCode}        599216
${CPR_Specification_ErrCode}        599252
${DisconnectBetwwenNonDiscoonectRecordsErrMSg}      The Disconnect request cannot be processed since a Disconnect Record cannot be inserted between Non-Disconnect Records.
${DisconnectBetwwenNonDiscoonectRecordsErrCode}      512027
${CPR_TransferSrcCad_ErrMsg}       The Transfer request cannot be processed as the source Customer Record does not contain the portion(s) being transferred.
${CPR_TransferSrcCad_ErrCode}      508019

${CPR_TransferToDisconectCRwithRefererralN_ErrMsg}       The Transfer request cannot be processed since Transfer to a Target TFN in DISCONNECT status and referral set to 'N' is not allowed.
${CPR_TransferToDisconectCRwithRefererralN_ErrCode}      508017
${CPR_TransferAosNotDefined_ErrMsg}       CPR/MAIN1/State/CA: Decision Node value not defined in CR's AOS.
${CPR_TransferAosNotDefined_ErrCode}      599216

#SAP Error messages
${NpaFormatErrorMsg}     Must be an existing 3-digit 8xx toll-free area code known to TFN Registry (e.g., 800).
${Cic_0110_not_allowed}   CIC 0110 is not allowed.
${Start_End_effct_date}  The Start Effective Date must be prior to the End Effective Date.

#DAP Error messages
${noTemplateInDb_ErrMsg}   Template Name does not exist in TFN Registry.
${noTfnumInDB_ErrMsg}      Toll Free Number does not exist in TFN Registry.

#DAP Error codes
${noTemplateInDb_ErrCode}   212005
${noTfnumInDB_ErrCode}      212003

##################CLE###########################
${NoCLEDataErrMsg}                      Carrier IntraLATA Exceptions data does not exist
${NoCLEDataErrCode}                     215010
${UnknownResporgEntityErrMsg}           Resp Org Entity: Must be a Resp Org Entity known to Toll-Free Number Registry.
${UnknownResporgEntityErrCode}          099031
${OCNMappingDoesNotExistErrMsg}         Operating Company Numbers (OCN) entry does not exist for the given Resp Org entity.
${OCNMAppingDoesNotExistErrCode}        215002
${CLERecordExistsErrMsg}                Carrier IntraLATA Exceptions with an Entity already exists.
${CLERecordExistsErrCode}               215016
${NPA-NXX-NotExistErrMsg}               Entry 854785 does not contain a valid NPA-NXX.
${NPA-NXX-NotExistErrCode}              215005
${DuplicatePOTSErrMSg}                  Duplicate POTS number(s) 315708 is not allowed.
${DuplicatePOTSErrCode}                 215004
${CLEEntityNotInDBErrMsg}               Resp Org Entity: Must be a Resp Org Entity known to Toll-Free Number Registry
${CLEEntityNotInDBErrCode}              099031

##################CLA###########################
${NoCLADataErrMsg}      Carrier IntraLATA Agreement data does not exist.
${NoCLADataErrCode}     214015
${UnknownResporgUnitErrMsg}       WIPRO: Must be a RESP ORG known to Toll-Free Number Registry.
${UnknownResporgUnitErrCode}      099018
${CLAWildCardErrMsg}        Cannot enter Resp Org BR*** both with and without wildcards.
${CLAWildCardErrCode}       214016
${DuplicateResporgErrMSg}       Duplicate Resp Org unit BRSAC is not allowed
${DuplicateResporgErrCode}      214004
${CLARecordExistsErrMsg}        Carrier IntraLATA Agreement with an Entity already exists
${CLARecordExistsErrCode}       214014
${InactiveResporgErrMsg}        InActive Resp Org unit VTC30 is not allowed.
${InactiveResporgErrCode}       214013
${OCNDoesNotExistErrMsg}        Operating Company Numbers (OCN) entry does not exist for the given Resp Org entity.
${OCNDoesNotExistErrCode}       214007
${CLAEntityNotInDBErrMsg}          Resp Org Entity: Must be a Resp Org Entity known to Toll-Free Number Registry.
${CLAEntityNotInDBErrCode}         099031
${recVersionIdmismatchErrMsg}       Sorry! Someone has updated this record while you were working on it. Please retrieve again
${recVersionIdmismatchErrCode}      099003

##############EAF####################################

${entityNotKnownErrorMessage}       is not an Entity known to TFN Registry.
${entityNotKnownErrorCode}          102101
${DuplicateEntity}                  Duplicate Entity
${entityDuplicateErrorMessage}      not allowed. Please remove duplicates.
${entityDuplicateErrorCode}         102102
${alreadyAffiliatedErrorMessgae}    Primary Entity is already associated with Entity Affiliation
${alreadyAffiliatedErrorCode}       102106
${primaryAsAffiliatedErrorMessage}  Primary Entity should not be entered in the Entity Affiliation table (List of Entities)
${primaryAsAffiliatedErrorCode}     102108
${affiliatedEnityAlreadyAssociatedErrorMessage}     is already associated with Entity Affiliation
${affiliatedEnityAlreadyAssociatedErrorCode}        102107

################### RDC #############################
${RDCPermissionDeniedErrMsg}            Permission Denied: Please contact the Help Desk.
${RDCPermissionDeniedErrCode}           099064
${RDCRecordDoesNotExistErrMsg}          No matching data found for the entered POTS. Ready to enter data.
${RDCRecordDoesNotExistErrCode}          220101
${RDCInvalidPotsNPANXXErrMsg}            POTS#: 1000118234 does not contain a valid NPA-NXX.
${RDCInvalidPotsNPANXXErrCode}            220104
${RDCCannotbeAllowedErrMsg}             Resp Org Allowed/Disallowed Using CIC 0110 10-digit may exist within the same 1K number block.
${RDCCannotbeAllowedErrCode}            220106
${CannotCreateRDCErrMsg}                Cannot create both Resp Org Allowed Using CIC 0110 & Resp org Disallowed Using CIC 0110 for the same POTS#
${CannotCreateRDCErrCode}               220105

#################RAC#######################
${RAC_RecordAlreadyExistsErrorMessage}      Resp Org Allowed/Disallowed Using CIC 0110 10-digit may exist within the same 1K number block
${RAC_RecordAlreadyExistsErrorCode}         219106
${RAC_RespOrgWildCardErrorMessage}          Cannot enter Resp Org BR*** both with and without wildcards
${RAC_RespOrgWildCardErrorCode}             219108
${RAC_DuplicateRespOrgIdErrorMessage}       Duplicate Resp Org not allowed. Please remove duplicates
${RAC_DuplicateRespOrgIdErrorCode}          219110
${nonExistsPotsNumErrorMessage}             does not contain a valid NPA-NXX
${nonExistsPotsNumErrorCode}                219104
${POTS#}        POTS#:
${RACRecordDoesNotExistsErrorMessage}                   No matching data found for the entered POTS. Ready to enter data
${RACRecordDoesNotExistsErrorCode}                      219101
${recVersionIdErrorMessage}                 Sorry! Someone has updated this record while you were working on it. Please retrieve again.
${recVersionIdErrorCode}                    099003

###############CPR Error Messages and Codes################
${CPR_Create_With_UnusedLabels_ErrMsg}            : Label not used in CPR portion of the record.
${CPR_Create_With_InvalidNxxNode}                 NXX node entries can be a LAD label or values. If NXX values are entered, they must be preceded by an Area Code node with a single area code value.
${CPR_Create_With_UnusedLabels_ErrCode}           599113
${CPR_Create_With_NpaNxxMismatch_ErrCode}         599229
${CPR_Create_With_NpaOtherNxxSomeValue_ErrCode}   599227
${CPR_Create_MismatchCurrentNodeWithPrecedingNode_ErrMsg}    Current AOS related node contains value that does not match the preceding Area of Service.
${CPR_Create_MismatchCurrentNodeWithPrecedingNode_ErrCode}   599251
${CPR_Create_NxxSixdigit#NodesUsedTogether_ErrMsg}      CPR/MAIN: NXX node and 6-digit node cannot be used together.
${CPR_Create_NxxSixdigit#NodesUsedTogether_ErrCode}     599243
${CPR_Create_With_FirstColumnEmpty_ErrMsg}      Value specified for node is empty for all the call routing paths.
${CPR_Create_With_FirstColumnEmpty_ErrCode}     599276
${CPR_Create_With_NonExistingAosLabel_ErrMsg}    Must be an existing AOS Label name in TFN Registry.
${CPR_Create_With_NonExistingAosLabel_ErrCode}    599061
${CPR_Create_With_MoreThanAllowedDaysInNode_ErrMsg}     CPR/MAIN: Maximum of 5 value(s) are allowed for Day node in a CPR row.
${CPR_Create_With_MoreThanAllowedDaysInNode_ErrCode}    599205
${CPR_Create_AllPossibilitiesNotCoveredInDayOfWeek_ErrMsg}     CPR/MAIN/Day: Entries in a CPR node must include all possible cases. Missing Day:
${CPR_Create_AllPossibilitiesNotCoveredInDate_ErrMsg}     CPR/MAIN/Date: Entries in a CPR node must include all possible cases. Missing Date:
${CPR_Create_With_Duplicated_Entries_DateNode_ErrMsg}       Value occurs more than once. Please remove duplicate.
${CPR_Create_With_Duplicated_Entries_DateNode_ErrCode}      599259
${CPR_Copy_Missing_MandatoryParameterTgtEffDtTm_ErrMsg}       Missing Mandatory parameter tgtEffDtTm.
${CPR_Copy_Missing_MandatoryParameterTgtEffDtTm_ErrCode}      099027
${CPR_Copy_Missing_MandatoryParametersrcRecVersionId_ErrMsg}           Missing Mandatory parameter srcRecVersionId.
${CPR_Copy_Missing_MandatoryParametersrcRecVersionId_ErrCode}           099027
${CPR_Copy_Missing_MandatoryParametersrcEffDtTm_ErrMsg}           Missing Mandatory parameter srcEffDtTm.
${CPR_Copy_Missing_MandatoryParametersrcEffDtTm_ErrCode}            099027
${CPR_Copy_HighPriorityUpdate_ErrMsg}           The Copy request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Customer Record of the Toll-Free Number/Template Name.
${CPR_Copy_HighPriorityUpdate_ErrCode}           506006
${CPR_Create_With_Percent_Ann_Nodes_ErrMsg}     CPR/MAIN: A CPR path cannot have a Percent node and an Announcement node.
${CPR_Create_With_Percent_Ann_Nodes_ErrCode}        599244
${CPR_Create_With_PercentNodeValuesNotSummedUpto100_ErrMsg}     Total % values must add up to 100.
${CPR_Create_With_PercentNodeValuesNotSummedUpto100_ErrCode}    599249
${CPR_DisconnectWithEarlierTgtEffDateAndTimeErrMsg}         The Disconnect request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Customer Record of the Target TFN.
${CPR_Missing_PossibleCases_ErrMsg}     Entries in a CPR node must include all possible cases.
${CPR_Missing_PossibleCases_ErrCode}        599283
################## CNA #####################
${Approvals_Required_Errmsg}        Warning: Approvals are required by at least one carrier (CIC) before record goes ACTIVE.
${Approvals_Required_ErrCode}       599059
${No_APR_record_ErrCode}        210015
${No_CNA_Data_ErrMsg}           No NPA records are found that have Carrier Notification data.
${No_CNA_Data_ErrCode}          209015

######## CR Invoved View ###############
${CR_Non_Involvement_ErrMsg}        User has no involvement with the customer record.
${CR_Non_Involvement_ErrCode}       505002
${CR_Involvement_ErrMsg}        Warning: User has involvement with the customer record but is not the Control Resp Org.
${CR_Involvement_ErrCode}        505003
${TAD_involvement_Errmsg}           User has involvement with the Template but is not the Control respOrg.
${TAD_involvement_Errcode}      540003

######## NET ########
${NET_CreateRespOrgUserErrMsg}       Permission Denied: Please contact the Help Desk.
${NET_CreateRespOrgUserErrCode}      099064
${ExistingNetworkCreateErrMsg}      CCS Network data already exists.
${ExistingNetworkCreateErrCode}      401012
${ExistingCountryCodeAsNetworkCreateErrMsg}     is a country code and cannot be used as a Network. Enter another value.
${ExistingCountryCodeAsNetworkCreateErrCode}     401003
${NetworkIdNotExistsErrMsg}     Record does not exist.
${NetworkIdNotExistsErrCode}     099029
${UpdateNetworkIdUsedInSCPErrMsg}           Update failed: Cannot disconnect CCS Network ID when it is being used in SCP.
${UpdateNetworkIdUsedInSCPErrCode}      401009
${DeleteActiveNetworkIdErrMsg}      Delete cannot be performed unless the Network is in DISCONNECT status.
${DeleteActiveNetworkIdErrCode}     401005
${DeleteNetworkWithDependencyErrMsg}        Cannot delete CCS Network due to dependency with other tables.
${DeleteNetworkWithDependencyErrCode}        401006

####################NCC######################
${NCCDataNotExistsErrMsg}       Network Company Codes data does not exist.
${NCCDataNotExistsErrCode}          402012
${PermissionDeniedForUserErrMsg}     Permission Denied: Please contact the Help Desk.
${PermissionDeniedForUserErrCode}        099064
${CannotUpdateNetWrkIdErrMsg}       Cannot Perform the operation. Network:${SPACE}
${IsInDisConnectStatus}     ${SPACE}is in Disconnect status.
${CannotUpdateNetWrkIdErrCode}      099059
${CmpyCode}     Company Code${SPACE}
${CmpyCodeNotvalidErrCode}      402006
${DuplicateCmpnyCodeErrMsg}     Duplicate Company Code not allowed. Please remove duplicate${SPACE}
${DuplicateCmpnyCodeErrCode}        402008
${CCSNetWrkAlreadyAssociatedErrMsg}     ${Space}is already associated with CCS Network
${CCSNetWrkAlreadyAssociatedErrCode}        402007
${InactiveComnyCodeErrMsg}      InActive Company Code${Space}
${IsNotAllowed}     is not allowed.
${InactiveComnyCodeErrCode}      402014

######GSA Msg#######
${GSA_Invalid_CntrlResp_ErrMsg}         Control Resp Org must be 5 alphanumeric like 'BANJ1'
${GSA_Invalid_CntrlResp_ErrCode}         612019
${GSA_PermissionDeniedErrMsg}            Permission Denied: Please contact the Help Desk.
${GSA_PermissionDeniedErrCode}           099064
${UnauthorizedUserAccess_ErrMsg}             Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.

#################################NAC###################################
${NAC_CreateRespOrgUserErrMsg}       Permission Denied: Please contact the Help Desk.
${NAC_CreateRespOrgUserErrCode}      099064
${NAC_NotExistsErrMsg}     Record does not exist.
${NAC_NotExistsErrCode}     099029
${NAC_UpdateRespOrgUserErrMsg}       Permission Denied: Please contact the Help Desk.
${NAC_UpdateRespOrgUserErrCode}      099064

######NAC######
${NCA_Resporg_list_ErrMsg}            Network Carrier Agreements data does not exist.
${NCA_Resporg_list_ErrCode}           412017

########NXX#################
${No_SID_ErrMsg}             No SID data is found.
${No_SID_ErrCode}               408012
${SPID_NOT_Known_ErrMsg}     SCP ID is not known to TFN Registry.
${SPID_NOT_Known_ErrCode}       410105
${SCP_NPA_NXX_list_Not_Exist_ErrMsg}      SCP NPA-NXX list details does not exist.
${SCP_NPA_NXX_list_Not_Exist_ErrCode}       410126
${SCP_Not_Allow_Accsss_SCPID_ErrMsg}      User is not allowed to access SCP ID.
${SCP_Not_Allow_Accsss_SCPID_ErrCode}     410124
${No_Record_Exist_OnEffDate_ErrMsg}         Record does not exist with given effective date, the default record is displayed.
${No_Record_Exist_OnEffDate_ErrCode}        410119

######### SID ###########
${No_Record_ErrMsg}             Record does not exist.
${No_Record_ErrCode}            099029
${No_CCSNet_ErrMsg}             No CCS Network data is found.
${No_CCSNet_ErrCode}            408019
${Unauthorised_SCPAdmin_ErrMsg}     User is not allowed to access SCP ID.
${Unauthorised_SCPAdmin_ErrCode}         408011

#####LCN#######
${Authoriseduser_permdenied_Errmsg}        Permission Denied: Please contact the Help Desk.
${Authoriseduser_permdenied_ErrCode}       099064
${Non_Existing_lata_Errmsg}                LATA is not known to TFN Registry.
${Non_Existing_lata_ErrCode}               403002
${past_Effectivedate_Errmsg}               Effective Date cannot be equal or less than the current date.
${past_Effectivedate_ErrCode}              403012
${Morethanyr_Effectivedate_Errmsg}         Effective Date cannot be greater than 1 year from the current date.
${Morethanyr_Effectivedate_ErrCode}        403013
${Recordexists_Errmsg}                     Record already exists.
${Recordexists_ErrCode}                    099060
${Authoriseduser_permdenied_Errmsg}        Permission Denied: Please contact the Help Desk.
${Authoriseduser_permdenied_ErrCode}       099064
${Non_Existing_lata_Registry_Errmsg}       LATA is not known to TFN Registry.
${Non_Existing_lata_Registry_ErrCode}      403002
${Invalid_ntwrkID}                         CCS Network ID:
${Notknown}                                is not known to TFN Registry.
${Invalid_ntwrkID_ErrCode}                 099039
${Norecords_todisconnect_Errmsg}           No Active or Pending records exist to Disconnect prior to the given date.
${Norecords_todisconnect_ErrCode}          403011
${LCN_NotExistsErrMsg}                     Record does not exist.
${LCN_NotExistsErrCode}                    099029

#### GAN#####
${GAN_disconnect_ErrMsg}        Resp Org ID is in Disconnect Status.
${GAN_disconnect_ErrCode}       304006
${GAN_Max_CLLI_ErrMsg}          Maximum limit for CLLI code 20 exceeded.
${GAN_Max_CLLI_ErrCode}         099042
${GAN_Max_Domain_ErrMsg}        Maximum limit for Domain and Port 20 exceeded.
${GAN_Max_Domain_ErrCode}       099042
${GAN_NoRecord_ErrMsg}          No MGI Activation Notice Control records are found.
${GAN_NoRecord_ErrCode}         304007
${GAN_NoCLLI_ErrMsg}            Requires atleast one CLLI code or Domain/Port value.
${GAN_NoCLLI_ErrCode}           304003
${GAN_InValidMgi_ErrMsg}        mgiNotice.actvtn accepts only Y or N.
${GAN_InValidMgi_ErrCode}           099032

###GUN####
${GUN_NoRecord_ErrMsg}                  No MGI Unsolicited Notice Control data exists for this Resp Org.
${GUN_NoRecord_ErrCode}                 306006
${GUN_NoClliOrDomain_ErrMsg}            Requires at least one CLLI code or Domain/Port for Control RespOrg Change.
${GUN_NoClliOrDomain_ErrCode}           306008
${GUN_NoClliForCarAprv_ErrMsg}          Requires at least one CLLI code for Carrier Approval Status - All Approved.
${GUN_NoClliForCarAprv_ErrCode}         306013
${GUN_NoDomPortForCarAprv_ErrMsg}       Requires at least one domain name and port for Carrier Approval Status - All Approved.
${GUN_NoDomPortForCarAprv_ErrCode}      306010
${GUN_RespOrg_Discon_Clli_ErrMsg}       Resp Org ID is in Disconnect Status.
${GUN_RespOrg_Discon_Clli_ErrCode}      304006

###### ROC ####
${NonExistingRespOrgErrMsg}     : Must be a RESP ORG known to Toll-Free Number Registry.
${DuplicteEntryErrMsg}      : Duplicate entry exist.
${DuplicteEntryErrCode}      099051
${ROC_Create_EmptyCicCodeListErrMsg}        cicCodeList: Atleast one entry is required.
${ROC_Create_EmptyCicCodeListErrCode}        099046
${ROC_Create_InactiveRespOrgErrMsg}     Cannot perform the operation. Resp Org Unit is in Disconnect status.
${ROC_Create_InactiveRespOrgErrCode}     099050
${CannotPerformErrMsg}      Cannot perform the operation CIC${space}
${ROC_CreateInactiveCicErrCode}     218009
${ROC_DeleteNonPendingRecordErrMsg}     Delete shall be performed when the Resp Org Associated Carrier record is in PENDING/PENDING-DISCONNECT status
${ROC_DeleteNonPendingRecordErrCode}     218006
${ROC_Morethanyr_Effectivedate_ErrCode}      218003
${PastEffDatetime_ErrMsg}       Effective Date cannot be less than the current date.
${PastEffDatetime_ErrCode}       218002
${ROC_Delete_PendingFollowedByPendingDisconnectErrMsg}      Cannot delete a Pending record that is followed by a Pending-Disconnect record.
${ROC_Delete_PendingFollowedByPendingDisconnectErrCode}      218007
${ROC_DisconnectEffDatePriorToEarliestDateErrMsg}      No Active or Pending records exist to Disconnect prior to the given date.
${ROC_DisconnectEffDatePriorToEarliestDateErrCode}     218004
${ROC_DisconnectWithExistingDisconnectRecorddateErrMsg}        Another Pending Disconnect record already exists that includes the same records.
${ROC_DisconnectWithExistingDisconnectRecorddateErrCode}       218005
${ROC_CopySameSrcAndTgtDateErrMsg}      Target Effective date cannot be same as source effective date
${ROC_CopySameSrcAndTgtDateErrCode}     218010

#####WRA#####
${WRA_InvalidEntity_ErrMsg}             Invalid Resp Org Entity. Enter two alphanumeric.
${WRA_InvalidEntity_ErrCode}            099053
${WRA_NonExistingEntity_ErrMsg}         Resp Org Entity: Must be a Resp Org Entity known to Toll-Free Number Registry.
${WRA_NonExistingEntity_ErrCode}        099031
${WRA_OtherRespEntity_ErrMsg}           Allowed to view only own Resp Org Entity's Reservation Allocation limits
${WRA_OtherRespEntity_ErrCode}          806010

######EXL############
${EXL_SCP_NotinDB_Errmsg}       SCP ID:
${notknownto_TFN}                 is not known to TFN Registry.
${EXL_SCP_NotinDB_ErrCode}     312002

###### NCO ############
${NCO_Misssing_NetworkandNPA_Mapping_ErrMsg}        Missing CCS Network coverage for the new NPA. Check all Routing CCS Networks that are to be associated with both the old and new NPAs.
${NCO_Misssing_NetworkandNPA_Mapping_ErrCode}       309121
${NCO_Missing_LATAtoNPA_Mapping_ErrMsg}             Missing LATA coverage for the new NPA. Check all LATAs that are to be associated with both the old and new NPAs.
${NCO_Missing_LATAtoNPA_Mapping_ErrCode}            309120
${NCO_Record_CantBe_Updated_ErrMsg}             Record cannot be updated, it is in status COMPLETED.
${NCO_Record_CantBe_Updated_ErrCode}            309134
${NCO_Record_CantBe_Deleted_ErrMsg}             Record cannot be deleted, it is in status COMPLETED.
${NCO_Record_CantBe_Deleted_ErrCode}            309133
${NCO_NPA_Already_Exists_ErrMsg}                The New NPA already exists. The New NPA must be an unused 3 numeric NPA code.
${NCO_NPA_Already_Exists_ErrCode}               309103
${NCO_State_Err_Msg}                        State ZA is not known to TFNRegistry. Enter another value.
${NCO_State_ErrCode}                         309105

##############################ORGAsync#########################################
${Org_Async_Permission_Denied_ErrMsg}                   Permission Denied: Please contact the Help Desk.
${Org_Async_Permission_Denied_ErrCode}                  099064

${RMS_EAFErrMsg}        Entity Affiliation is turned On. User's Resp. Org Entity must be affiliated.
${RMS_EAFErrCode}        801102
${WRA_permissionDenied_ErrMsg}           Permission Denied.
${WRA_permissionDenied_ErrCode}          803103

${WRA_ChildEntityUpdate_ErrMsg}           Manual Allocation Limit: When Affiliation is ON, Manual Allocation can be set for affiliated entities by setting limit for Primary entity
${WRA_ChildEntityUpdate_ErrCode}          806011

########IVR#######
${Invalid_TFN_IVR_ErrMsg}      num: Invalid Toll-Free Number format. It must contain 10 alphanumeric characters.
${Invalid_TFN_IVR_ErrCode}     099012
${Invalid_TMPL_IVR_ErrMsg}     Template Name: Must start with '*', then a valid 2 character Entity ID, followed by 1-12 alphanumerics. Must be 4-15 characters wide. Dashes are optional in the 4th-15th character positions.
${Invalid_TMPL_IVR_ErrCode}    520001

##########################HPU########################
${NotKnownToTFNR_RegistryErrMsg}        Must be known to Toll-Free Number Registry.
${NotKnownToTFNR_RegistryErrCode}        099070
${DuplicateErntriesErrMsg}      : Duplicate entries exist.
${HPU_MissingMandatoryParametersErrMsg}     At-least one of the parameters need to be specified: allowAll or allowedLoginIds
${HPU_MissingMandatoryParametersErrCode}     099023
${HPU_CreateMGILoginIdErrMsg}       MGI Login ID BRSAC002 cannot be set as admin for Resp Org Entity.
${HPU_CreateMGILoginIdErrCode}       610002
${HPU_ResporgNotMatchingMgilogonIdErrMsg}     Cannot pass MGI Login ID which does not have permission for
${HPU_ResporgNotMatchingMgilogonIdErrCode}     610004
${HPUNotDefinedForUserRespOrgEntityerrMsg}      HPU for Entity BR needs to be defined by the Help Desk.
${HPUNotDefinedForUserRespOrgEntityerrCode}      510004
${HPU_LoginIdNotListedErrMsg}       User not allowed to perform High Priority Customer Record updates for Entity BR.
${HPU_LoginIdNotListedErrCode}       510005

#### TRL########
${TRL_noMatchingErrMsg}           No data matching search criteria
${TRL_noMatchingErrCode}          539004
${TRL_TemplnotExistingErrMsg}      No Template records exist for the requested keys.
${TRL_TemplnotExistingErrCode}     539002

################# PAD #####################
${PAD_InvalidStateTemplateErrMsg}       Template Name: Template must be ACTIVE.
${PAD_InvalidStateTemplateErrCode}       528002
${PAD_TemplateName}     Template Name:${space}
${OthereThanResporgEntityErrMsg}        ${space}does not belong to Pointer Record owner's Entity
${TemplateOthereThanResporgEntityErrCode}       528003
${NotKnownToTfnRegistryErrMsg}      ${space}is not known to the TFN Registry.
${TemplateNotKnownErrCode}      528004
${PAD_MissingTemplateNameErrMsg}       Template Name is mandatory for a Pointer Record
${PAD_MissingTemplateNameErrCode}       528005
${PAD_InvalidDestinationNumErrMsg}      Destination Number must be same as TFN of Pointer Record
${PAD_InvalidDestinationNumErrCode}      528006
${PAD_MoreThanOneDestNumErrMsg}     Only one Destination Number is allowed for Pointer Record
${PAD_MoreThanOneDestNumErrCode}     528007
${PAD_CreateWithSpareTFNErrCode}     529005
${PAD_InvalidTelco_ErrorMsg}       Telco: Must be known to TFN Registry.
${NoPADExistsErrCode}     530001
${atleastOneDestinationNumErrorMessage}         You must enter at least one Destination Number.
${atleastOneDestinationNumErrorCode}            599028
${Noreferral_Errmsg}                            referral accepts only Y or N
${Noreferral_Errcode}                           099032
${Endintercept_lessthan_PRdate_Errmsg}          End Intercept Date: Must be earlier than the Effective Date of this Disconnect Pointer Record or within the industry-set time period (180 Calendar Days) from the Toll-Free Number's disconnect date.
${Endintercept_lessthan_PRdate_Errcode}         534014
${Endintercept_NOW_Errmsg}                      End Intercept Date: 'NOW' is allowed only when the Target Pointer Record's Effective date is current date or 'NOW'
${Endintercept_NOW_Errcode}                     534015
${MoreThanOneRecordWarningMsg}      Warning: More than one record exists.
${MoreThanOneRecordWarningCode}      530004
${PAD_CopyWithNoTime_ErrorMsg}      Source Effective Time must also be specified as the source Toll-Free Number has more than one Pointer Records on the specified source Effective Date.
${PAD_CopyWithNoTime_ErrorCode}      531004
${PADExistsBetweenSrcAndTagrgetEffDtErrMsg}     The Copy request cannot be processed as other Pointer Records exist for the Toll-Free Number between Source and Target
${PADExistsBetweenSrcAndTagrgetEffDtErrCode}         531008
${PAD_No_AssociatedCR_ErrMsg}       The Copy request cannot be processed as no Pointer Records exist for the source Toll-Free Number with the specified Source Effective Date/Time.
${PAD_No_AssociatedCR_ErrCode}       531012
${PAD_TgtNumberInUnavailableStateErrMsg}     To process copy request, the Target Toll-Free Number must be in RESERVED status or the Target Toll-Free Number must be same as source Toll-Free Number.
${PAD_TgtNumberInUnavailableStateErrCode}     531003
${PAD_TgtNumberNotInReservedErrMsg}     To process copy request, the Target Toll-Free Number must be RESERVED or UNAVAILABLE status or be the same Toll-Free Number as source Toll-Free Number.
${PAD_TgtNumberNotInReservedErrCode}      531002
${PAD_RespOrgChangeErrMsg}      The Copy request cannot be processed since the Control Resp Org change of a Toll-Free Number is allowed only when Target Effective Date & Time is NOW.
${PAD_RespOrgChangeErrCode}      531018
${PAD_CopyWithEarlierDateErrMsg}    The Copy request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Pointer Record of the Toll-Free Number.
${PAD_CopyWithEarlierDateErrCode}    531006
${PAD_CopyOtherThanPendingOrActiveRecordErrMsg}     Cannot Copy Pointer Record whose status is INVALID, FAILED, MUST CHECK or OLD.
${PAD_CopyOtherThanPendingOrActiveRecordErrCode}     531011
${PAD_CopyNoPointerRecordsExistErrMsg}       The Copy request cannot be processed as no Pointer Records exist for the specified Source Toll-Free Number.
${PAD_CopyNoPointerRecordsExistErrCode}     531001
${PADCopyWithPastEffdateErrCode}        531007
${PAD_DisconnectLockedTFNErrorCode}      534010
${PAD_UpdateCtrlRespOrgID_ErrorMessage}         The Transfer request cannot be processed since the Control Resp Org change of a TFN is allowed only when Target Effective Date & Time is NOW.
${PAD_UpdateCtrlRespOrgID_ErrorCode}            532011
${PAD_EndInterceptDateAsNow_errorMessage}       End Intercept Date: 'NOW' is allowed only when the Target Pointer Record's Effective date is current date or 'NOW'.
${PAD_EndInterceptDateAsNow_errorCode}          534015
${PAD_referralAsNO_errorMessage}        Pointer Record converted to Customer Record for Disconnect with Referral set to NO
${PAD_referralAsNO_errorCode}           535013
${IsWorkingErrMsg}          ${space}is working on this Record.
${PAD_Disconnect_RespOrgChangeErrCode}      534011
${PAD_EndInterceptdateEarilierThanCREffDateErrorMsg}        End Intercept Date: Must be earlier than the Effective Date of this Disconnect Pointer Record or within the industry-set time period (180 Calendar Days) from the Toll-Free Number's disconnect date.
${PAD_EndInterceptdateEarilierThanCREffDateErrorCode}            534014
${PADUpdateFromRECErrMsg}       The Update request cannot be processed since Customer Record Data cannot be updated from Customer Record Selection
${PADUpdateFromRECErrCode}       511014
${PADUnlockWithotherUserErrMsg}     Unlock request cannot be processed as the TFN is not locked for Customer Record Updates.
${PADUnlockWithotherUserErrCode}     511011
#### Bulk Search&Reserve ####
${Bulk_ExpiredToken_ErrMsg}               Access failure for API: /v2/ip/sys, version: v2 status: (900901) - Invalid Credentials. Make sure you have given the correct access token
${Bulk_ExpiredToken_ErrCode}              900901
${Bulk_ID_nonExits_ErrMsg}                Invalid Request Id. No results found.
${Bulk_ID_nonExits_ErrCode}               099057
${Bulk_FailedID_Retrieve_ErrMsg}          System error. Contact the Help Desk.
${Bulk_FailedID_Retrieve_ErrCode}         099069
${Bulk_ID_Deleted_ErrMsg}                 Record does not exist.
${Bulk_ID_Deleted_ErrCode}                099029
${Bulk_ID_ConsSearch_ErrMsg}              Consecutive is not allowed for bulk request.
${Bulk_ID_ConsSearch_ErrCode}             801201

####TAL####
${TAL_INVALID_MaxroutLimitErrMsg}       Maximum Routing Templates Allowed: Enter 1 to 4 digits(0 to 9999)
${TAL_INVALID_MaxroutLimitErrCode}      521002

####TAD####
${TAD_DoesnotExists_ErrMsg}        Template Name does not exist in TFN Registry
${TAD_DoesnotExists_ErrCode}       540001
${Invalid_TmplName_ErrMsg}         Template Name: Must start with '*', then a valid 2 character Entity ID, followed by 1-12 alphanumerics. Must be 4-15 characters wide. Dashes are optional in the 4th-15th character positions.
${Invalid_TmplName_ErrCode}        537001
${OtherUser_TmplUpdate_ErrMsg}     Permission Denied: User does not have permissions to Update Template Name's Control Resp Org's records.
${OtherUser_TmplUpdate_ErrCode}    599071
${OtherRespOrg_Tmplname_ErrMsg}    Template Name: Characters 2 and 3 of the Template Name must match the first two characters of it's Control Resp Org.
${OtherRespOrg_Tmplname_ErrCode}   537008
${TAD_PastDate_ErrMsg}             The Create request cannot be processed as the Effective Date is in past or Effective Date & Time is earlier than the current quarter hour.
${TAD_PastDate_ErrCode}            502007
${Carriers_required_Errmsg}            			CARRIERS: Entry is required in either the InterLATA or IntraLATA field.
${Carriers_required_ErrCode}           			599022
${TAD_Priority_Yes_Savedrecord_Errmsg}          High Priority Flag cannot be set to 'Y' for Customer Record Save.
${PAD_Priority_Yes_Savedrecord_ErrCode}          599073
${TAD_Priority_Yes_Savedrecord_ErrCode}         509001
${TAD_TR_Missing_ErrMsg}                        Template Name does not exist in TFN Registry
${TAD_TR_Missing_ErrCode}                       540001
${TAD_Missingnumtermline_Errmsg}                Missing Mandatory parameter numTermLine.
${TAD_Missingnumtermline_ErrCode}               099027
${Non_Existingcontactnum_Errmsg}                Contact Number: The first 6 digits must be an NPA-NXX combination known to TFN Registry.
${Non_Existingcontactnum_ErrCode}               599051
${Unknown_Network_Errmsg}                       : Must be an existing 2-alpha Network Code known to TFN Registry (e.g., AM).
${Unknown_Network_ErrCode}                      599008
${Delete_NoTmplOnDate_ErrMsg}      The Delete request cannot be processed as no TR exist for the Template Name with the specified Effective Date/Time.
${Delete_NoTmplOnDate_ErrCode}     546002
${Delete_TmplPastDate_ErrMsg}      The Delete request cannot be processed as the Effective Date/Time of the TR is in past.
${Delete_TmplPastDate_ErrCode}     546005
${Update_effDtTmNOw_ErrMsg}        The update request cannot be processed as the Effective Date and Time cannot be 'NOW'.
${Update_effDtTmNOw_ErrCode}       544007
${Update_Tmpl_HPwithoutNOW_erroMsg}     Effective Date/Time must equal 'NOW' or Today's date when updating with high priority.
${Update_Tmpl_HPwithoutNOW_erroCode}    510001
${Update_Tmpl_WithoutAOS_erroMsg}       Areas of Service: At least one Areas of Service entry is required.
${Update_Tmpl_WithoutAOS_erroCode}       599070
${Update_Tmpl_WithoutLata_erroMsg}      CARRIERS: Entry is required in either the InterLATA or IntraLATA field.
${Update_Tmpl_WithoutLata_erroCode}     599022
${Update_Tmpl_WrongDtTm_ErrMsg}         The Update request cannot be processed as no Template Record exist for the Template Name with the specified Effective Date/Time.
${Update_Tmpl_WrongDtTm_Errcode}         544005
${Tmpl_CoverAllPossibilities_tenDigit_ErrMsg}   CPR/MAIN/10-digit#: OTHER must be specified so that all possibilities are covered.
${Tmpl_CoverAllPossibilities_tenDigit_ErrCode}   599252
${TAD_UnlockWithOtherUserErrMsg}        Unlock request cannot be processed as${space}
${IsWorkingonRecordErrMsg}          ${space}is working on this record.
${TAD_UnlockWithOtherUserErrCode}        544015
${TAD_UpdateFromTEcRequestErrMsg}       The Update request cannot be processed since Template Record Data cannot be updated from Template Record Selection.
${TAD_UpdateFromTEcRequestErrCode}      544013
${ActiveTemplateUpdateErrorMsg}         The Update request cannot be processed as the Effective Date/Time of the Template Record is in past.
${ActiveTemplateUpdateErrorCode}        544006
${CPR_onlysubsection_Errmsg}           CPR: A CPR must have at least one Main section.
${CPR_onlysubsection_ErrCode}          599262
${ComplexTADCreateWithOnlySubSectionErrMsg}     CPR: A CPR must have at least one Main section
${ComplexTADCreateWithOnlySubSectionErrCode}         599262
${ComplexTADCreateWithNotValidLastNodeErrMsg}       The last (rightmost) CPR node must be a Tel# or an Announcement node.
${ComplexTADCreateWithNotValidLastNodeErrCode}      599241
${ComplexTADCreateWithMainSubSectionErrMsg}     Must be an existing Sub section name in the CPR starting with 'S'.
${ComplexTADCreateWithMainSubSectionErrCode}             599264
${ComplexTADCreateWithInvalidLastNodeErrMsg}        Tel#, GoTo, or Announce must be last node. Nothing can follow it.
${ComplexTADCreateWithInvalidLastNodeErrCode}        599242
${ComplexTADCreateWitInvalidSubsectionNameErrMsg}      Must start with 'M' (denoting Main section) or 'S' (denoting Sub section), followed by up to 7 alphanumeric characters and may include % or #.
${ComplexTADCreateWitInvalidSubsectionNameErrCode}       599263
${ComplexTADCreateWithMultipleGOTOValuesErrMsg}     Invalid Data-type: values
${ComplexTADCreateWithMultipleGOTOValuesErrCode}     099043
${ComplexTADCreateWithAllPossibileDayOfWeeksCoveredErrMsg}     CPR/MAIN/Day: Entries in a CPR node must include all possible cases.
${ComplexTADCreateWithAllPossibileDayOfWeeksCoveredErrCode}     599283
${TADCreateWithInvalidTemplateFormatErrMsg}     Template Name: Must start with '*', then a valid 2 character Entity ID, followed by 1-12 alphanumerics. Must be 4-15 characters wide. Dashes are optional in the 4th-15th character positions.
${TADCreateWithInvalidTemplateFormatErrCode}     537001
${ComplexTADCreateWithCCSNetworkErrMsg}     CCS Network is not allowed for Template Records
${ComplexTADCreateWithCCSNetworkErrCode}    599074
${ComplexTADCopiyingExistingPartsErrMsg}        The Copy request cannot be processed as the Target Template Record already contains the CR portions that are being copied.
${ComplexTADCopiyingExistingPartsErrCode}        542019
${TAD_Copy_Response_For_MustCheck_WarnMsg}      Future Effective Template Records exist for this Template Name and should be checked.
${TAD_Copy_Response_For_MustCheck_WarnCode}      544010
${TAD_MoreThanOneRecordWarnMsg}      More than one record exists.
${TAD_MoreThanOneRecordWarnCode}      540004
${TAD_CannotCopyErrMsg}     Cannot Copy Template Record whose status is INVALID, FAILED, MUST CHECK or OLD
${TAD_CannotCopyErrCode}     542015
${TAD_CopyWithSameSrcTgtEffDateErrMsg}            The Copy request cannot be processed as the specified Source and Target Template Records have same Effective Date & Time
${TAD_CopyWithSameSrcTgtEffDateErrCode}              542005
${TAD_CopyWithEarlierDateErrMsg}        The Copy request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Template Record of the Template Name
${TAD_CopyWithEarlierDateErrCode}        542003
${TAD_CopyWithExistingDateErrMsg}       The Copy request cannot be processed as the Target Template Record already exists
${TAD_CopyWithExistingDateErrCode}       542014
${TAD_CopySourceRecordLockedRecordErrCode}      542010
${TAD_CopyTargetRecordLockedRecordErrCode}      542011
${TAD_CopyUpdateCtrlRespOrgWithOutEffDateErrMsg}     The Copy request cannot be processed since the Control Resp Org change of a Template Name is not allowed
${TAD_CopyUpdateCtrlRespOrgWithOutEffDateErrCode}     542016
${TAD_TransferWithoutEDTMoreThanOneTRForSourceErrMsg}    Source Effective Date or Source Effective Date & Time must be specified as the source Template Name has more than one Template Record.
${TAD_TransferWithoutEDTMoreThanOneTRForSourceErrCode}   543002
${TAD_TransferWithTargetEDTinPastErrMsg}    The Transfer request cannot be processed as the Target Effective Date/Time is in past.
${TAD_TransferWithTargetEDTinPastErrCode}    543007
${TAD_TransferWithTargetEDTasNOWErrCode}    543016
${TAD_TransferWithOverwriteTgtNoErrMsg}   The Transfer request cannot be processed as the Target Template Record already contains the CR portions that are being transferred.
${TAD_TransferWithOverwriteTgtNoErrCode}   543017
${TAD_TransferWhenSourceIsLocked_ErrCode}    543009
${TAD_TransferWhenTargetIsLocked_ErrCode}    543010
${TAD_TransferWithNoTRsForSource_ErrMsg}     The Transfer request cannot be processed as no Template Records exist for the Source Template Name.
${TAD_TransferWithNoTRsForSource_ErrCode}    543001
${TAD_DisconnectwithAlreadyEistingPartsErrMsg}      The Disconect request cannot be processed as the Target Record already contains the portions that are being copied.
${TAD_DisconnectwithAlreadyEistingPartsErrCode}     545017
${TAD_DisconnectSourceRecordLockedRecordErrCode}     545007
${TAD_DisconnectTargetRecordLockedRecordErrCode}    545008
${TAD_Disconnectwithearlierdate_Errmsg}     The Disconnect request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Disconnect Record of the Target Template Name (or) Target Toll-Free Number.
${TAD_Disconnectwithearlierdate_ErrCode}    545003
${TAD_Notemplaterecord_Errmsg}    The Disconnect request cannot be processed as no Template Records exist for the Source Template Name with the specified Source Effective Date/Time.
${TAD_Notemplaterecord_ErrCode}   545002
${disconnectrecord_btnpendingrecords_Errmsg}    The Disconnect request cannot be processed since a Disconnect Record cannot be inserted between Non-Disconnect Records.
${disconnectrecord_btnpendingrecords_ErrCode}    545019
${TAD_Valid_DisInd_Errmsg}      dscInd accepts only Y or N.
${TAD_Valid_DisInd_ErrCode}     099032
${TAD_Audit_Tmpl_Response_Info_Msg}    The Audit request has been submitted. Detailed results will be sent to user's SMS/800 Toll-Free Number Registry mailbox.
${TAD_Audit_Tmpl_Response_Info_Code}   516016
${TAD_Resend_Tmpl_Response_Info_Msg}   The Resend request has been submitted. Detailed results will be sent to user's SMS/800 Toll-Free Number Registry mailbox.
${TAD_Resend_Tmpl_Response_Info_Code}   516017
${TAD_CopyLockWithEffDateNowErrCode}       542018
${TAD_User_permissions_TgtTR_Errmsg}        Permission Denied: User does not have permissions to Update Source Template Name's Control Resp Org's records.
${TAD_Disconnect_TargetEffDtTm_NOW_ErrCode}   545015
${TAD_DisconnectwithCtrlRespOrgChangeErrMsg}   The Disconnect request cannot be processed since the Control Resp Org change of a Template Name is not allowed.
${TAD_DisconnectwithCtrlRespOrgChangeErrCode}    545013
${TAD_DisconnectWithNonExistingPortionsErrMsg}    The Disconnect  request cannot be processed as the source Template Record does not contain the portion(s) being copied.
${TAD_DisconnectNotValidRecordErrMsg}     The Disconnect request cannot be processed as the Source Template Record is in INVALID, FAILED, MUST CHECK or OLD status.
${TAD_DisconnectNotValidRecordErrCode}    545012
${TAD_DisconnectWithNonExistingPortionsErrMsg}    The Disconnect request cannot be processed as the source Template Record does not contain the portion(s) being copied.
${TAD_DisconnectWithNonExistingPortionsErrCode}    545021
${TAD_CopyWithSameSrcAndTgtDateErrMsg}     The Copy request cannot be processed as the specified Source and Target Template Records have same Effective Date & Time
${TAD_CopyWithSameSrcAndTgtDateErrCode}     542005
${TAD_CopyDisconnectRecordToAnotherTemplateErrMsg}   The Copy request cannot be processed since Disconnect or Revised Disconnect Template Records cannot be copied to a Toll-Free Number or a different Template Name.
${TAD_CopyDisconnectRecordToAnotherTemplateErrCode}    542007
${TR_create_FutureCrDelete_ErrMsg}     The Delete request cannot be processed. All the future TRs must be deleted before deleting this TR.
${TR_create_FutureCrDelete_ErrCode}   546006
${TAD_CopyDifferentTemplateAlreadyExistingRecordErrMsg}   The Copy request cannot be processed since Template Records already exist for the Target Template Name (different form source Template Name)
${TAD_CopyDifferentTemplateAlreadyExistingRecordErrCode}    542012
${TAD_CopyWithPastDate_ErrMsg}     The Copy request cannot be processed as the Target Effective Date/Time is in past
${TAD_CopyWithPastDate_ErrCode}     542004

##MNQ##
${Invalid_ReqId_Errmsg}           Invalid Request Id. No results found
${Invalid_ReqId_ErrCode}        099057

##MSP##
${Permission_Denied_otherResporg_Errmsg}           Permission Denied: No permissions to perform the operation for the requested Resp Org Unit.
${Permission_Denied_otherResporg_ErrCode}           099038
${Incorrect_TFN_Errmsg}           Invalid number status. Number status must be Reserved or Transitional.
${Incorrect_TFN_ErrCode}           802119

${SPH_UpdateCRParam_MaxOtherBranches_ErrMsg}        CPR: No more than 1 consecutive rows may contain the value OTHER.
${SPH_UpdateCRParam_MaxOtherBranches_ErrCode}       599258
${SPH_Update_WithSameStartEndDefaultTime_ErrMsg}    Default Effective Time for CR Start and End times cannot be the same.
${SPH_Update_WithSameStartEndDefaultTime_ErrCode}   303001
${SPH_Update_WithInvalidStartEndDefaultTime_ErrMsg}    Start/End Time must fall on the quarter hour, like 10:15 AM.
${SPH_Update_WithInvalidStartEndDefaultTime_ErrCode}    303004
${SPH_Update_WithInvalidNetworkId_ErrMsg}       Network ID ABCD must be 2 alpha.
${SPH_Update_WithInvalidNetworkId_ErrCode}      303005
${SPH_Update_WithNetworkIdNotKnownToRegistry_ErrMsg}      Network ID: XX is not known to TFN Registry.
${SPH_Update_WithNetworkIdNotKnownToRegistry_ErrCode}     303006
${SPH_Update_WithInvalidHPUParamValue_ErrMsg}       HIGH_PRIORITY_CR_CTRL: Invalid Value: [AABB]. Allows only ON/OFF.
${SPH_Update_WithInvalidHPUParamValue_ErrCode}      099037
${SPH_Update_WithInvalidCountryCode_ErrMsg}         CountryCode ABC must be 2 alpha.
${SPH_Update_WithInvalidCountryCode_ErrCode}        303008
${SPH_Update_WithCountryCodeNotKnownToRegistry_ErrMsg}     CountryCode: XY is not known to TFN Registry.
${SPH_Update_WithCountryCodeNotKnownToRegistry_ErrCode}    303009
${ParameterMismatch}        Parameter Mismatch.
${ParameterMismatchErrCode}     099075
${InvalidSPhParameterValueErrMsg}       Allows only NUM_ALLOC_NPA NUM_AFFIL_NPA NA_RSV NO_AGING_SPARE NO_AGING_DISCONNECT ALLOC_CTRL_PERIOD ALLOC_CTRL_DAILY_RCALC ALLOC_CTRL_WKLY_RCALC_DAY ALLOC_CTRL_WKLY_RCALC_TM.
${InvalidMethodErrMsg}      Method not allowed for given API resource
${SPHValidParameterValues}       Allows only NUM_ALLOC_NPA NUM_AFFIL_NPA NA_RSV NO_AGING_SPARE NO_AGING_DISCONNECT ALLOC_CTRL_PERIOD ALLOC_CTRL_DAILY_RCALC ALLOC_CTRL_WKLY_RCALC_DAY ALLOC_CTRL_WKLY_RCALC_TM SGGEST_SRCH PRDCT_SRCH SAVED_SRCH SCHDLD_SRCH SAVED_SRCH_AUTO_RUN SPAR_NOTIF_ENABLE.
${SPHValidParameters}     Allows only CR SR BLG SNA GP ALERTS_INFO.
${InvalidDaysParameterValueErrmsg}      ${space}Allows only Days.
${InvalidWeeklyParameterValueErrmsg}      ${space}Allows only WEEKLY/DAILY.
${InvalidTimeParameterValueErrmsg}      ${space}Allows only Time.
${InvalidBooleanParameterValueErrMsg}       ${space}Allows only ON/OFF.
${SPH_InvalidNPAErrMsg}        : Must be an existing 3-digit 8xx Toll-Free NPA code known to the TFN Registry (e.g., 800)
###OCA ###
${OCA_NonActive_Templ_ErrMsg}                  Template Name: Template must be ACTIVE.
${OCA_NonActive_Templ_ErrCode}                 528002
${OCA_WildCardLastdigit&_ErrMsg}               Number - Last character must equal '*' if consecutive is selected.
${OCA_WildCardLastdigit&_ErrCode}              801114
${OCA_TempLName_Missing_ErrMsg}                Missing Mandatory parameter: tmplName.
${OCA_TempLName_Missing_ErrCode}               099027
${OCA_WildCardContainsingle&_ErrMsg}           Number cannot contain a single '&'.
${OCA_WildCardContainsingle&_ErrCode}          801113
${OCA_PastDate_ErrMsg}                         Cannot create PR. Please enter a future Effective Date and Time.
${OCA_PastDate_ErrCode}                         529004

####CR_TR#####
${CR_TR_Disc_TmplNotExists_ErrMsg}            The Disconnect request cannot be processed since CPR/LAD portions Copy is allowed only if Customer Record(s) exist for the specified Target Toll-Free Number/Template Name.
${CR_TR_Disc_TmplNotExists_ErrCode}           512023
${CR_TR_Disc_EffDtEarlier_ErrMsg}             The Disconnect request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Customer Record of the Target Toll-Free Number/Template Name.
${CR_TR_Disc_EffDtEarlier_ErrCode}            512024
${CR_TR_Disc_CPRNotPresent_ErrMsg}            The Disconnect request cannot be processed as the source Customer Record does not contain the portion(s) being copied
${CR_TR_Disc_CPRNotPresent_ErrCode}           512024
${CR_TR_Disc_CADLADCPR_ErrMsg}                The Disconnect request cannot be processed since Target cannot be a Template Name when CAD (or) CAD and CPR/LAD is to be copied from Source Record..
${CR_TR_Disc_CADLADCPR_ErrCode}               512029
${TR_CR_Disc_CPRNotPresent_ErrMsg}            The Disconnect ${SPACE}request cannot be processed as the source Template Record does not contain the portion(s) being copied.
${TR_CR_Disc_CPRNotPresent_ErrCode}           545021
${TR_CR_Disc_BtwDiscRecord_ErrMsg}            The Disconnect request cannot be processed since a Disconnect Record cannot be inserted between Non-Disconnect Records.
${TR_CR_Disc_BtwDiscRecord_ErrCode}           545019
${CRTOPRCopyDisconnectRecordErrMsg}     The Copy request cannot be processed since Disconnect or Revised Disconnect Customer Records cannot be copied to a different TFN.
${CRTOPRCopyDisconnectRecordErrCode}     506013
${CopyWithNonExistingSrcDateErrMsg}       The Copy request cannot be processed as no Template Records exist for the source Template Name with the specified Source Effective Date/Time.
${CopyWithNonExistingSrcDateErrCode}       542006
${CopyLADCPRToNewRecordErrMsg}      The Copy request cannot be processed since CPR/LAD portions Copy is allowed only if Target Template Name (or) Target Toll-Free Number has at least one record.
${CopyLADCPRToNewRecordErrCode}      542017
${InvalidParametersForTADErrMsg}        Service order, Supplemental form, Customer, Agent, Hold Indicator, Telco, Destination, End Intercept Date and Referral parameters are not applicable for Template Records.
${ConversionWithNonExistingSrcDateErrMsg}       The Convert request cannot be processed as no Customer Records exist for the Toll-Free Number with the specified Source Effective Date/Time.
${ConversionWithNonExistingSrcDateErrCode}      551002
${ConversionWithTemplateNotHavingActiveRecordErrMsg}        The Convert request cannot be processed as the specified Template Name does not have an Active Template Record.
${ConversionWithTemplateNotHavingActiveRecordErrCode}        551008
${ConversionWithDareEarlierThanDisconectRecordErrMsg}       The Convert request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Disconnect Customer Record of the Toll-Free Number.
${ConversionWithDareEarlierThanDisconectRecordErrCode}      551006
${ConversionWithOtherEntityTemplateErrMsg}      The Convert request cannot be processed as the Control Resp Org Entity of the Template Name is not same as that of the Toll-Free Number.
${ConversionWithOtherEntityTemplateErrCode}      551015
${ConversionWith_MustCheck_WarnMsg}     Future Effective Customer Records exist for this Toll-Free Number and should be checked.
${ConversionWith_MustCheck_WarnCode}     551014
${Covert_Cannot_Be_Processed_ErrCode}       535002
${Conv_TgtEffDt_Earlier_ErrMsg}             The Convert request cannot be processed as the Target Effective Date/Time is earlier than that of the earliest Customer Record of the Toll-Free Number.
${Conv_TgtEffDt_Earlier_ErrCode}            535004
${Conv_EffDate_earlier_than_Discnt_ErrCode}     535006
${Conv_record_Locked_ErrMsg}            The Convert request cannot be processed at this time.
${Conv_record_Locked_ErrCode}       535011
${PR_Converted_To_CR_ErrMsg}        Pointer Record converted to Customer Record because new Control Resp Org does not control the Template Name.
${PR_Converted_To_CR_ErrCode}       535014
############NRC##################################
${NRC_Invalid_SCPID_ErrMsg}                    SCP must be 4- character alphanumeric value. First two characters must be a network code. The last two characters must be a number in the range of 00-99.
${NRC_Invalid_SCPID_ErrCode}                   413002

#########################PRC#######################################
${PRC_Invalid_SCPID_ErrMsg}                    SCP must be 4-character alphanumeric value. First two characters must be a network code. The last two characters must be a number in the range of 00-99.
${PRC_Invalid_SCPID_ErrCode}                   414002

####TLC####
${TLC_PermDenied_ErrMsg}                         Permission Denied.
${TLC_PermDenied_ErrCode}                         099038
${LAD_User_permissions_Errmsg}       Permission Denied: User does not have permissions to Update Toll-Free Number's Control Resp Org's records.
${PAD_Create_With_SpareTFN_ErrMsg}      The Create request cannot be processed as the Toll-Free Number Status is SPARE.

##### SRC#####
${Invalid_Email_SRC}    Invalid Email format sumitwipro.com. Email address must be in the format userId@domain with no spaces. Special characters allowed are !#$%&'*+-/=?^_`.{|}~. Maximum length of 60 characters.
${empty_bncdMsgEmail}   Missing mandatory field 'Bounced Messages Email
${Error_Code_SRC}    099061
${Error_Code_SRC_failedLogonRptEmail}                   099043

####URC_ERROR#####
${Permission_Denied_ErrMsg}              Permission Denied.
${Permission_Denied_ErrCode}             099038
${InvalidLogInID_ErrMsg}                 Invalid Login Id.
${InvalidLogInID_ErrCode}                605001
${Email_ErrMsg}                          Invalid Email format. Email address must be in the format userId@domain with no spaces. Special characters allowed are !#$%&'*+-/=?^_`.{|}~. Maximum length of 60 characters.
${Email_ErrCode}                         099061

#### BX01 ########
${Pots_Not_Supported_ErrMsg}        POTS# is not supported by Network BX.
${Pots_Not_Supported_ErrCode}       599073
${Split_Carrier_Not_SupportedErrCode}       599282
${Pots_Not_Supported_In_CPR_ErrMsg}         599281
${Split_Carrier}      CPR/MAIN/CARRIER: Split Carriers
${NotSupported}     are not supported by Network BX.

${RespOrgChangeForSpareNumberErrMsg}        Cannot perform the requested operation due to the current status of record.
${RespOrgChangeForSpareNumberErrCode}       099052

${CADRecordDeleteFromPADAPIErrMsg}       Customer Record API must be used if the source record is a Regular Customer Record
${CADRecordDeleteFromPADAPIErrCode}           599082
${PADRecordDeleteFromCADAPIErrMsg}      Pointer Record API must be used if the source record is a Pointer Record
${PADRecordDeleteFromCADAPIErrCode}     599081

########## SEC #############
${Sec_Missing_Mandatory_par_Errmsg}         Missing Mandatory parameter rspAdmAcc.
${Sec_Missing_Mandatory_par_ErrCode}        099027
${RspAdm_ErrMsg}                        rspAdmAcc accepts only Y or N.
${RspAdm_ErrCode}                   099032
${Sec_MissingRoleName_ErrMsg}           Missing Mandatory parameter roleName.
${Sec_MissingRoleName_ErrCode}          099027
${Sec_invalid_perms_ErrMsg}                 Invalid Data-type: fnPermissions
${Sec_invalid_perms_ErrCode}                099043
${Invalid_UserPerms_Errmsg}                 Specified User Permissions not available.
${Invalid_UserPerms_ErrCode}                704003
${Sec_Mandatory_Parm_ErrMsg}                Missing Mandatory parameter .
${Sec_Mandatory_perm_ErrCode}               099027
${Invalid_Fun_Errmsg}                   Specified Function not available.
${Invalid_Fun_ErrCode}                  704006
${SEC_Not_Available_ErrMsg}          not available.

######### SUD #############
${User_Doesnt_Have_Perms_ATX01_ErrMsg}          User does not have requisite permissions of ATX01 for respOrgId
${User_Doesnt_Have_Perms_ATX01_ErrCode}         099011
${User_Doesnt_Have_Perms_ATX01_ViewListErrMsg}     User does not have requisite permissions of AT*** for viewLst
${User_Doesnt_Have_Perms_ATX01_ViewListErrCode}     099011
${User_Doesnt_Have_Perms_ATX01_updateListErrMsg}    User does not have requisite permissions of AT*** for updtLst
${User_Doesnt_Have_Perms_ATX01_updateListErrCode}     099011
${User_Doesnt_Have_Perms_ATX01_AstriekViewListErrMsg}     User does not have requisite permissions of ***** for viewLst
${User_Doesnt_Have_Perms_ATX01_AstriekViewListErrCode}     099011
${User_Doesnt_Have_Perms_ATX01_AstriekupdateListErrMsg}    User does not have requisite permissions of ***** for updtLst
${User_Doesnt_Have_Perms_ATX01_AstriekupdateListErrCode}     099011
${User_Doesnt_Have_Perms_BRSAC_ErrMsg}                  User does not have requisite permissions of BRSAC for respOrgId
${User_Doesnt_Have_Perms_BRSAC_ViewListErrMsg}          User does not have requisite permissions of BR*** for viewLst
${User_Doesnt_Have_Perms_BRSAC_updateListErrMsg}        User does not have requisite permissions of BR*** for updtLst
${AutologOff_ErrMsg}                            User does not have requisite permissions of N for autoLogOff
${AutologOff_ErrCode}                           099011
${ExemptIndicator_ErrMsg}                   User does not have requisite permissions of Y for exemptInd
${ExemptIndicator_ErrCode}                  099011
${LogonId_Missing_ErrMsg}               Missing Mandatory parameter: loginId.
${Session_Active_ErrMsg}                Logon ID cannot be deleted. Session remains active. User must be logged off first.
${LogonID_Missing_ErrMsg}               Missing Mandatory parameter: userLst[0].loginId.
${AdminUsrClass_ErrMsg}                 User does not have requisite permissions of ADMINISTRATOR  for usrClass
${SUD_LoginId_Doesnt_exist_ErrMsg}              Logon ID doesn't exist.

################## SNN ######################
${SNNFeatureDisabledinSPHErrMsg}        Spare Number Notification is not enabled
${SNNFeatureDisabledinSPHErrCode}
${SNNCreateListExceededErrMsg}      Number of records in your Spare Number Notification list exceeded maximum limit 5
${SNNCreateListExceededErrCode}      801180
${TFNAvailabletoReserveMsg}     is available to be reserved.
${SNNListEmptyErrMsg}       Spare Number list is empty.
${SNNListEmptyErrCode}       801184
${TFNAvailabletoReserveCode}     801179
${TFNAlreadyInSNNListErrMsg}        is already exists in user's spare numbers list.
${TFNAlreadyInSNNListErrCode}        801181
${SNN_NumlistEmptyErrMsg}       Spare Number list can not be empty.
${SNN_NumlistEmptyErrCode}       801186
${SNNDeleteNonExistingTFNErrMsg}        does not exist in Spare Number Notification list.
${SNNDeleteNonExistingTFNErrCode}        801182
${InvalidTollFreeFormat}    Invalid Toll-Free Number format
${TollFreeNumberFormat}     Toll-Free Number must contain 10 alphanumeric characters.
${SNNotEnabledErrMsg}      Spare Number Notification is not enabled.
${SNNotEnabledErrCode}      801185
${SNN_InvalidParameterErrMsg}       Invalid Parameter${space}
${SNN_InvalidParameterErrCode}      099033
${SNSResponseWarningErrCode}        801101

######################## UAA ########################
${InvalidInterfaceErrMsg}       Invalid Interface.
${InvalidInterfaceErrCode}       607105
${UAA_NotValidOperationErrMsg}      Not a valid operation for this type of user.
${UAA_NotValidOperationErrCode}      607106
${NoRecordsErrMsg}      No records found.
${NoRecordsErrCode}      097987
${InvalidEntityErrMsg}      Invalid Entity ID
${InvalidLogoffStatusErrMsg}        logoffStatus: Invalid Value: N. Allows only Y.

################ PNS ################
${PNS_NoNumbersFoundErrMsg}     No numbers found from prediction.
${PNS_NoNumbersFoundErrCode}     801129
${InvalidConNameErrMsg}      Contact Name: Maximum 30 characters. Allowed characters are letters (A-Z or a-z), digits (0-9), spaces and special characters (`'!@#$%&*()-_+={}[]:;<>,.?/).
${InvalidConNameErrCode}     099055
${BooleanValuesMsg}     accepts only Y or N
${InvaliNotesParameterErrMsg}     Invalid entry in Notes.
${InvaliNotesParameterErrCode}     605002
${ValidTimeZones}       Time Zone: Must be A,B,C,E,H,M,N,P,Y,CH.
${InvaliTimeZoneErrCode}        099016
${InvaliNotificationIndicatorErrMsg}        ntfnInd accepts only Y or N.
${PNSNotEnabledErrMsg}      Predictive Number Search feature is turned off.
${PNSNotEnabledErrCode}      801109
${InvalidTollFreeErrMsg}     Invalid Toll Free Number
${InvalidTollFreeErrCode}     802103

########### Suggestive Numbe Search ##############
${SuggestedNumberWarningMsg}        Suggested number returned in response.
${SuggestedNumberWarningCode}        801101


############ WAVE3 SUD #####################
${DuplicateErrorCode}        703022
${DuplicateUpdateList}      Duplicate Resp Org Id(s) [BRSAC ATX01] exist in updtLst.
${DuplicateViewList}      Duplicate Resp Org Id(s) [BRSAC ATX01] exist in viewLst.
${DuplicateForSingleUpdateList}      Duplicate Resp Org Id [BRSAC] exist in updtLst.
${DuplicateForSingleViewList}      Duplicate Resp Org Id [BRSAC] exist in updtLst.
${AdditionalEntriesErrorCode}        703023
${AdditionalEntriesForATWilcardUpdateList}      Additional Entries [ATX01] exist for the Resp Org mask [AT***] in updtLst.
${AdditionalEntriesForATWilcardViewList}      Additional Entries [ATX01] exist for the Resp Org mask [AT***] in viewLst.
${AdditionalEntriesForBRWilcardUpdateList}      Additional Entries [BRSAC] exist for the Resp Org mask [BR***] in updtLst.
${AdditionalEntriesForBRWilcardViewList}      Additional Entries [BRSAC] exist for the Resp Org mask [BR***] in viewLst.
${AdditionalEntriesWilcardUpdateList}      Additional Entries [BR*** ATX** BRSAC ATX01] exist for the Resp Org mask [*****] in updtLst.
${AdditionalEntriesWilcardViewList}      Additional Entries [BR*** ATX** BRSAC ATX01] exist for the Resp Org mask [*****] in viewLst.
${AdditionalEntriesLowercaseUpdateList}      Additional Entries [ATX01 ATX02] exist for the Resp Org mask [A****] in updtLst.
${AdditionalEntriesLowercaseViewList}      Additional Entries [ATX01 ATX02] exist for the Resp Org mask [A****] in viewLst.
${MaximumUpdateList}		Maximum limit for updtLst (999) exceeded.
${MaximumViewList}		Maximum limit for viewLst (999) exceeded.
${MaximumErrorCode}		099042