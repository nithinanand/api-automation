*** Settings ***
Library         SeleniumLibrary
Library		    helper.py
Library         Collections
Library         String
Library         RequestsLibrary
Library         JSONLibrary

*** Variables ***
${account_id}=  0
${baseurl}=	https://app.dev.codeus.ai/login
${base_api_url}=    https://api.dev.codeus.ai
${token}=   eyJhbGciOiJSUzI1NiIsImtpZCI6ImVmY2U5YWI3MmY1MTk0Zjc3MTNlMzZhZGFjN2VkZWNlZDFjOWNjOWEwZDM3MDRjMDNkYjU3MGU3YjNlMjNmMjEiLCJ0eXAiOiJhdCtqd3QifQ.eyJuYmYiOjE2NjA4OTQyNzQsImV4cCI6MTY2MDg5NDU3NCwiaXNzIjoiaHR0cHM6Ly9pZC5kZXYuY29kZXVzLmFpIiwiYXVkIjoiZnJvbnRlbmRhcGkiLCJjbGllbnRfaWQiOiJ3ZWJ1aSIsInN1YiI6IjEwMjI3NjY0MDIiLCJhdXRoX3RpbWUiOjE2NjA4OTQyNzMsImlkcCI6Im1pY3Jvc29mdCIsIm5hbWUiOiJNYWJsIEFkbWluIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS9pZGVudGl0eS9jbGFpbXMvb2JqZWN0aWRlbnRpZmllciI6ImYxMGRhZTUyLWM5ZTAtNDhmNy05NmZhLWEzYWU1NWMxMjlmYSIsInByZWZlcnJlZF91c2VybmFtZSI6Im1hYmwtYWRtaW5AY3VkYWNvZGV1cy5vbm1pY3Jvc29mdC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL2lkZW50aXR5L2NsYWltcy90ZW5hbnRpZCI6IjQ0ODJkMTE0LWZhZWMtNDllMS1iN2UzLTk1NmM3MDhkMDllMyIsImh0dHA6Ly9zY2hlbWFzLmJhcnJhY3VkYS5jb20vZGF0YWluc3BlY3Rvci9iY2NfdXNlcl9pZCI6IjEwMjI3NjY0MDIiLCJodHRwOi8vc2NoZW1hcy5iYXJyYWN1ZGEuY29tL2RhdGFpbnNwZWN0b3IvZW1haWwiOiJtYWJsLWFkbWluQGN1ZGFjb2RldXMub25taWNyb3NvZnQuY29tIiwidWlkIjoiOTg5NzBkMWQtYmFmOC00MGUyLTkzZGYtMDhkODRkZGNkM2E1IiwiaHR0cDovL3NjaGVtYXMuYmFycmFjdWRhLmNvbS9kYXRhaW5zcGVjdG9yL3VzZXJfaGFzaCI6IjhiMjEzNTg0ZGU3YWJkZmM0MDdmMTAzYjlmZWM4OWIzNjcwNGI2OTA1Yzc2ZTZmNTFjNWI0Mjg0NTJhN2I1MjAiLCJqdGkiOiI4NDdCQjNGMjdDMDVCQzIwOTM3QTRBRkQ3NkY0NDZEMSIsInNpZCI6IjZFQjU2Q0MzQkRFNEU5RkYyMzIwRUZGMjRFMkQ2QTQwIiwiaWF0IjoxNjYwODk0Mjc0LCJzY29wZSI6WyJmcm9udGVuZGFwaSIsIm9wZW5pZCJdLCJhbXIiOlsiZXh0ZXJuYWwiXX0.dWnrnRkrpK1YduOXVSitXcuB6adPDIkUKjcRH64qt4LmfFiKk1me2mSgaJ5u585pylzUdWg1S0qmt5DseSTKy7krcq0FZrsxucSbU0sho3HZhbWYj26f0NE_U0gte9ntioRYTgSqfZ-6jn5gBh5Loa2wXlh4EDflDRQgZBcuktd8FQsGRTnXyGSLdreE6O__fKgwBiKHQWYfWNqWwFZz2j5yeXz_QlsSOlR1hQa7_3aY8oFuZi-UMJttkPPey4uh6QGxOMHREb0NHL6xjY956z6okH4bWVpqoNKmAkheRZ4Ds4KbZcYVF6yZ7nh7wah8wGBvbOn9dbMB4vWxE7PBsMxnpEFMQ9v138d9ZDeNUaMMsMXIoJFW-gdAJ94CTQyrYoriM0ti_0CEaG4F5TPeSZginm3T_hZQlmc2Vuf0v5oaXJRJO-_N2k7Z6y6Zvh81Dv00yRtAH90NXYr6xhKlnFxsoNWXc-yMK844-Ra5xHmF_QXePx6jw0xNlBTtEDmf2vOLWzMfcNDD1qwgfEGkt_gaGnToe-rfyYfzuensQVS3ki4vAYbvLw2zUwEMq-MeXRNTpvY_zx02Lj2-i2FUGxDLyE8eIFdrfOvmaRfMom7xQ5IfR_wqE8C0J2-iyvM6TKySAj0nrqyoMwSt1vMRH74EsrvskENOVANyaIaGuS4
${bearer_token}=    Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImVmY2U5YWI3MmY1MTk0Zjc3MTNlMzZhZGFjN2VkZWNlZDFjOWNjOWEwZDM3MDRjMDNkYjU3MGU3YjNlMjNmMjEiLCJ0eXAiOiJhdCtqd3QifQ.eyJuYmYiOjE2NjA4OTQyNzQsImV4cCI6MTY2MDg5NDU3NCwiaXNzIjoiaHR0cHM6Ly9pZC5kZXYuY29kZXVzLmFpIiwiYXVkIjoiZnJvbnRlbmRhcGkiLCJjbGllbnRfaWQiOiJ3ZWJ1aSIsInN1YiI6IjEwMjI3NjY0MDIiLCJhdXRoX3RpbWUiOjE2NjA4OTQyNzMsImlkcCI6Im1pY3Jvc29mdCIsIm5hbWUiOiJNYWJsIEFkbWluIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS9pZGVudGl0eS9jbGFpbXMvb2JqZWN0aWRlbnRpZmllciI6ImYxMGRhZTUyLWM5ZTAtNDhmNy05NmZhLWEzYWU1NWMxMjlmYSIsInByZWZlcnJlZF91c2VybmFtZSI6Im1hYmwtYWRtaW5AY3VkYWNvZGV1cy5vbm1pY3Jvc29mdC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL2lkZW50aXR5L2NsYWltcy90ZW5hbnRpZCI6IjQ0ODJkMTE0LWZhZWMtNDllMS1iN2UzLTk1NmM3MDhkMDllMyIsImh0dHA6Ly9zY2hlbWFzLmJhcnJhY3VkYS5jb20vZGF0YWluc3BlY3Rvci9iY2NfdXNlcl9pZCI6IjEwMjI3NjY0MDIiLCJodHRwOi8vc2NoZW1hcy5iYXJyYWN1ZGEuY29tL2RhdGFpbnNwZWN0b3IvZW1haWwiOiJtYWJsLWFkbWluQGN1ZGFjb2RldXMub25taWNyb3NvZnQuY29tIiwidWlkIjoiOTg5NzBkMWQtYmFmOC00MGUyLTkzZGYtMDhkODRkZGNkM2E1IiwiaHR0cDovL3NjaGVtYXMuYmFycmFjdWRhLmNvbS9kYXRhaW5zcGVjdG9yL3VzZXJfaGFzaCI6IjhiMjEzNTg0ZGU3YWJkZmM0MDdmMTAzYjlmZWM4OWIzNjcwNGI2OTA1Yzc2ZTZmNTFjNWI0Mjg0NTJhN2I1MjAiLCJqdGkiOiI4NDdCQjNGMjdDMDVCQzIwOTM3QTRBRkQ3NkY0NDZEMSIsInNpZCI6IjZFQjU2Q0MzQkRFNEU5RkYyMzIwRUZGMjRFMkQ2QTQwIiwiaWF0IjoxNjYwODk0Mjc0LCJzY29wZSI6WyJmcm9udGVuZGFwaSIsIm9wZW5pZCJdLCJhbXIiOlsiZXh0ZXJuYWwiXX0.dWnrnRkrpK1YduOXVSitXcuB6adPDIkUKjcRH64qt4LmfFiKk1me2mSgaJ5u585pylzUdWg1S0qmt5DseSTKy7krcq0FZrsxucSbU0sho3HZhbWYj26f0NE_U0gte9ntioRYTgSqfZ-6jn5gBh5Loa2wXlh4EDflDRQgZBcuktd8FQsGRTnXyGSLdreE6O__fKgwBiKHQWYfWNqWwFZz2j5yeXz_QlsSOlR1hQa7_3aY8oFuZi-UMJttkPPey4uh6QGxOMHREb0NHL6xjY956z6okH4bWVpqoNKmAkheRZ4Ds4KbZcYVF6yZ7nh7wah8wGBvbOn9dbMB4vWxE7PBsMxnpEFMQ9v138d9ZDeNUaMMsMXIoJFW-gdAJ94CTQyrYoriM0ti_0CEaG4F5TPeSZginm3T_hZQlmc2Vuf0v5oaXJRJO-_N2k7Z6y6Zvh81Dv00yRtAH90NXYr6xhKlnFxsoNWXc-yMK844-Ra5xHmF_QXePx6jw0xNlBTtEDmf2vOLWzMfcNDD1qwgfEGkt_gaGnToe-rfyYfzuensQVS3ki4vAYbvLw2zUwEMq-MeXRNTpvY_zx02Lj2-i2FUGxDLyE8eIFdrfOvmaRfMom7xQ5IfR_wqE8C0J2-iyvM6TKySAj0nrqyoMwSt1vMRH74EsrvskENOVANyaIaGuS4
${delete_flag}=     false
${username}=    'mabl-admin@cudacodeus.onmicrosoft.com'
${password}=    'Kar24156'

*** Test Cases ***
baseurl Access
    #Create webdriver    Chrome
	Open browser	    ${baseurl}      headlesschrome
	Set Window Size		1536	722
	Sleep	15

Accept cookies
    Click element   //button[@id="onetrust-accept-btn-handler"]

login
    Click element   xpath://a[contains(text(),'Sign In')]
    Sleep   10

user data
    IF    ${delete_flag} == true
        set global variable     ${username}=    'mabl-admin@cudacodeus.onmicrosoft.com'
        set global variable     ${password}=    'Kar24156'
    ELSE
        set global variable     ${username}=    'admin@nitqatest7.onmicrosoft.com'
        set global variable     ${password}=    'Clearedin123'
    END

valid username
	input text	xpath://input[@name='loginfmt']		${username}
	Click element	xpath://input[@type='submit']
	Sleep	5

valid password

	input text	xpath://input[@name='passwd']		${password}
	click element	xpath://input[@type='submit']
	Sleep	15

skip remember password
	click element	xpath://input[@value='No']
	Sleep	15

Get Token
	${token}    Execute Javascript       return window.localStorage.getItem('oidc.user:https://id.dev.codeus.ai:webui');const obj = JSON.parse(jwtString);let acc_token = obj.access_token;
	log     ${token}
    ${response_string}=    convert to string    ${token}
    ${response_json}=    convert string to json    ${response_string}
	${token}        get value from json     ${response_json}      $.access_token
	${token}    set val    ${token}
	${bearer_token}=    catenate    Bearer  ${token}
	log        ${bearer_token}
    Set Global Variable      ${token}
    Set Global Variable      ${bearer_token}
    close browser

account
	make request		${base_api_url}/api/accounts    	${token}

Get Account Id
    create session    mysession   ${base_api_url}
    log    ${bearer_token}
    ${headers}=     Create Dictionary    Authorization=${bearer_token}
    ${response}=    GET On Session     mysession     /api/accounts       headers=${headers}
    log   ${response.content}
    ${response}=     Set Variable     ${response.content}
    log    ${response}
    ${response_string}=    convert to string    ${response}
    ${response_json}=    convert string to json    ${response_string}
    log    ${response_json}
    ${account_id}=    get value from json     ${response_json}      $.data[0].id
    log     ${account_id}
    ${account_id}=  set val    ${account_id}
    set global variable    ${account_id}

offboard data
    delete data     ${account_id}   ${token}
    set global variable    ${delete_flag}= true

check offboard status
    make request    ${base_api_url}/api/accounts/${account_id}/delete       ${token}

remove delete request
    remove delete user      ${account_id}   ${token}

offboard data
    delete data     ${account_id}   ${token}
    BuiltIn.sleep    600

login as mabl-admin
    user data
    baseurl Access
    Accept cookies
    login
    valid username
    valid password
    skip remember password
    Get Token

check if account is deleted
    create session      session     ${base_api_url}/api/accounts/${account_id}
    ${headers}      create dictionary    Authorization=${bearer_token}
    ${response}     get request        session     /   headers=${headers}
    log    ${response.status_code}
    should be equal       ${response.status_code}    404

*** Keywords ***
make request
	[Arguments]	${url}	${token}
	@{response}=	Call Api	${url}	${token}
	Log	${response}
	[return]	${response}

delete data
    [Arguments]	${account_id}	${token}
	@{response}=	Delete User    	${account_id}	${token}
	Log	${response}
	[return]	${response}

remove delete user
    [Arguments]	${account_id}	${token}
    @{response}=    remove delete user queue    ${account_id}	${token}
    Log	${response}
	[return]	${response}

