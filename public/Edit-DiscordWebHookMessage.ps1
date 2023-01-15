function Edit-DiscordWebHookMessage {
    <#
    .SYNOPSIS
        Edits a Discord message that was created by the webhook.
    .DESCRIPTION
        Uses a message id to edit a message that was sent by the same webhook.
    .PARAMETER Body
        Body to update message with.
    .PARAMETER Id
        Message id to edit.
    .PARAMETER Url
        Webhook url.
    .EXAMPLE
        PS C:\> Edit-DiscordWebHookMessage -Body $body -Id 1234567890123456789 -Url https://discord.com/api/webhooks/0987654321098765432/dFg_5g54KgjP42ger-KL7-rGJk45jpSDvm1WDCXBnKdzHAerBCidpvKWFNDS721KfALV

        Edits Discord message with id 1234567890123456789.
    .INPUTS
        System.Collections.IDictionary for the body and System.String for the url.
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .LINK
        Remove-DiscordWebHookMessage
    .LINK
        Send-DiscordWebHookMessage
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [System.Collections.IDictionary]$Body,

        [Parameter(Mandatory = $true)]
        [ValidatePattern('^[0-9]+$')]
        [string]$Id,

        [Parameter(Mandatory = $true)]
        [ValidatePattern('^https://discord.com/api/webhooks/[0-9]+/')]
        [string]$Url
    )
    begin {
        $ErrorActionPreference = 'Stop'
        $WebHookUrl = $Url + '/messages/' + $Id
    }
    process {
        $json = $Body | ConvertTo-Json
        if ($PSCmdlet.ShouldProcess("$([System.Environment]::NewLine)$Body",'PATCH')) {
            $request = Invoke-RestMethod -Uri $WebHookUrl -Body $json -Method Patch -ContentType 'application/json; charset=UTF-8'
            return $request
        }
    }
}
