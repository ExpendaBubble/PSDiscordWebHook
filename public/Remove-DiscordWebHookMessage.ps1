function Remove-DiscordWebHookMessage {
    <#
    .SYNOPSIS
        Deletes a Discord message that was created by the webhook.
    .DESCRIPTION
        Uses a message id to delete a message that was sent by the same webhook.
    .PARAMETER Id
        Message id to delete.
    .PARAMETER Url
        Webhook url.
    .EXAMPLE
        PS C:\> Remove-DiscordWebHookMessage -Id 1234567890123456789 -Url https://discord.com/api/webhooks/0987654321098765432/dFg_5g54KgjP42ger-KL7-rGJk45jpSDvm1WDCXBnKdzHAerBCidpvKWFNDS721KfALV

        Deletes Discord message with id 1234567890123456789.
    .INPUTS
        System.String
    .LINK
        Edit-DiscordWebHookMessage
    .LINK
        Send-DiscordWebHookMessage
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidatePattern('^[0-9]+$')]
        [string]$Id,

        [Parameter(Mandatory = $true)]
        [ValidatePattern('^https://discord.com/api/webhooks/[0-9]+/')]
        [string]$Url
    )
    begin {
        $ErrorActionPreference = 'Stop'
        $webHookUrl = $Url + '/messages/'
    }
    process {
        $restUri = $webHookUrl + $Id
        if ($PSCmdlet.ShouldProcess($Id, 'DELETE')) {
            $request = Invoke-RestMethod -Uri $restUri -Method Delete
            $request
        }
    }
}
