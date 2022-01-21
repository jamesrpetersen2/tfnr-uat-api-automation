*** Settings ***
Library  Collections
Library  String
Library  RequestsLibrary
Library  OperatingSystem
Library         HttpLibrary.HTTP
Library     Selenium2Library
Library     Collections
Resource        ../../data_files/api/Utilities_testdata.robot


*** Keywords ***
DO POST REQUEST
    [Arguments]     ${token}    ${POST_URL}     ${Request_Data}    ${status_code}
    Create Session  endpoint    ${HOST}
    ${headers}=  Create Dictionary  Content-Type=application/json   Accept=application/json         Authorization=Bearer ${token}
    ${resp}=    POST REQUEST   endpoint    ${POST_URL}       headers=${headers}  data=${Request_Data}
    log         ${resp}
    Should Be Equal As Strings  ${resp.status_code}  ${status_code}
    ${jsondata}     To json     ${resp.content}
    [Return]    ${jsondata}

Invalid_Input_Scenario
    [Arguments]     ${token}    ${POST_URL}     ${Request_Data}    ${status_code}     ${Response_Error}

    ${responsedata}=    DO POST REQUEST    ${token}    ${POST_URL}     ${Request_Data}    ${status_code}
    should not be empty     ${responsedata}
    dictionary should contain key     ${responsedata}     error
    ${error}=   get from dictionary     ${responsedata}     error
    should be equal as strings      ${error}        true
    dictionary should contain key     ${responsedata}       code
    ${code}=    get from dictionary     ${responsedata}     code
    should be equal as strings      ${code}        ${status_Code}
    dictionary should contain key     ${responsedata}       description
    ${description}=     get from dictionary     ${responsedata}     description
    ${description}=     Replace String      ${description}      ${space}${space}        ${space}
    should contain      ${description}      ${Response_Error}
    [Return]    ${Response_Error}