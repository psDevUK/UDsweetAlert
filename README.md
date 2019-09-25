# UDsweetAlert
Adds a sweetalert2 modal to universaldashboard

New-UDSweetAlert 
This has one mandatory parameter which is type and can be one of the following:-
"success", "error", "warning", "info", "question"
The position parameter has the following valid items:-
'center', 'top', 'top-start', 'top-end', 'center-start', 'center-end', 'bottom', 'bottom-start', 'bottom-end'

I thought when creating this component that it would give better notification on New-UDInputAction 
E.G
<br>
Import-Module -Name UniversalDashboard.Community
Import-Module UniversalDashboard.UDSweetAlert
Get-UDDashboard | Stop-UDDashboard
$Endpoint = New-UDEndpointInitialization -Module @("UniversalDashboard.UDSweetAlert")
Start-UDDashboard -Port 10005 -Dashboard (
    New-UDDashboard -Title "Powershell UniversalDashboard" -Content {
        New-UDTabContainer -Tabs {
            New-UDTab -Text "LandingPage" -Content {
                New-UDSweetAlert -Type info -Text "Hello" -Timer 1500 -ConfirmButtonText "I Agree" -Position top
                New-UDInput -Title "User Data" -Endpoint {
                    param($Name, [bool]$Yes)

                    if ($Yes) {
                        New-UDInputAction -Content { New-UDSweetAlert -type "success" -title "$Name" -Text "you completed the form successfully!" }
                    }
                    else {
                        New-UDInputAction -Content { New-UDSweetAlert -type "error" -title "$Name" -Text "no you were supposed to tick YES!" }
                    }
                }

            }
        }
    } -EndpointInitialization $Endpoint
)
