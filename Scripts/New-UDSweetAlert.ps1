<#
.SYNOPSIS
    Modal notification control for UniversalDashboard.
.DESCRIPTION
    Adding a jazzy notification modal to your UniversalDashboard
.PARAMETER Id
    An id for the component default value will be generated by new-guid.
.EXAMPLE
    PS C:\> New-UDSweetAlert -Type info -Text "I agree to everything and anything" -Timer 1500 -ConfirmButtonText "I Agree" -Position top
    This will show a information modal lasting 1.5 seconds positioned at the top of the screen with a customised button saying I Agree
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    Thought this would best be used within the New-UDInputAction -Content {New-UDSweetAlert -type "success" -title "$Name" -Text "you completed the form successfully!"}
#>
function New-UDSweetAlert {
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter(Mandatory)]
        [ValidateSet("success", "error", "warning", "info", "question")]
        [string]$Type,
        [Parameter()]
        [string]$Title,
        [Parameter()]
        [string]$Text,
        [Parameter()]
        [string]$Footer = "",
        [Parameter()]
        [bool]$ShowLoading = $false,
        [Parameter()]
        [ValidateSet('center', 'top', 'top-start', 'top-end', 'center-start', 'center-end', 'bottom', 'bottom-start', 'bottom-end')]
        [string]$Position = 'center',
        [Parameter()]
        [int]$Timer,
        [Parameter()]
        [string]$ConfirmButtonText = 'OK',
        [Parameter()]
        [string]$CancelButtonText = 'Cancel',
        [Parameter()]
        [bool]$CancelButton = $false,
        [Parameter()]
        [bool]$CloseButton = $true
    )

    End {

        @{
            # The AssetID of the main JS File
            assetId           = $AssetId
            # Tell UD this is a plugin
            isPlugin          = $true
            # This ID must be the same as the one used in the JavaScript to register the control with UD
            type              = "UD-SweetAlert"
            # An ID is mandatory
            id                = $Id

            # This is where you can put any other properties. They are passed to the React control's props
            # The keys are case-sensitive in JS.
            text              = $Text
            types             = $Type
            title             = $Title
            footer            = $Footer
            showloading       = $ShowLoading
            position          = $Position
            timer             = $Timer
            confirmButtonText = $ConfirmButtonText
            showCancelButton  = $CancelButton
            cancelButtonText  = $CancelButtonText
            showCloseButton   = $CloseButton
        }

    }
}
