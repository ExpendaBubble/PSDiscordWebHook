function Send-DiscordWebHookMessage {
    <#
    .SYNOPSIS
        Send a Discord message.
    .DESCRIPTION
        Sends a Discord message by webhook.
    .PARAMETER Body
        Body to send.
    .PARAMETER Url
        Webhook url.
    .EXAMPLE
        PS C:\> Send-DiscordWebHookMessage -Body $body -Url https://discord.com/api/webhooks/0987654321098765432/dFg_5g54KgjP42ger-KL7-rGJk45jpSDvm1WDCXBnKdzHAerBCidpvKWFNDS721KfALV

        Sends Discord message.
    .INPUTS
        System.Collections.IDictionary for the body and System.String for the url.
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .LINK
        Initialize-DiscordWebHookMessage
    .LINK
        Remove-DiscordWebHookMessage
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [System.Collections.IDictionary]$Body,

        [Parameter(Mandatory = $true)]
        [ValidatePattern('^https://discord.com/api/webhooks/[0-9]+/')]
        [string]$Url
    )
    begin {
        $ErrorActionPreference = 'Stop'
        $WebHookUrl = $Url + '?wait=true'
    }
    process {
        if ($null -eq $Body.content -and $null -eq $Body.embeds) {
            throw 'When sending a message, you must provide a value for at least content or embeds'
        }
        $json = $Body | ConvertTo-Json -Depth 6
        if ($PSCmdlet.ShouldProcess("$([System.Environment]::NewLine)$Body", 'POST')) {
            $request = Invoke-RestMethod -Uri $WebHookUrl -Body $json -Method Post -ContentType 'application/json; charset=UTF-8'
            return $request
        }
    }
}
