function Initialize-DiscordWebHookMessage {
    <#
    .SYNOPSIS
        Constructs a message object to send to Discord via web hook.
    .DESCRIPTION
        Discord web hook message object. Must contain at least some content or one or more embeds.
    .PARAMETER AvatarUrl
        Url to avatar image for user.
    .PARAMETER Content
        Plain text content to send.
    .PARAMETER Embeds
        Rich content to send.
    .PARAMETER TextToSpeech
        Enables text-to-speech for content.
    .PARAMETER UserName
        User name to use for the message posted by the web hook.
    .EXAMPLE
        PS C:\> Initialize-DiscordWebHookMessage -Content 'Hello World!' -UserName 'Brian Kernighan'

        Constructs a simple Discord webhook message object.
    .EXAMPLE
        PS C:\> Initialize-DiscordWebHookMessage -Embeds $embed -UserName 'Gordon Freeman'

        Constructs a rich Discord webhook message object.
    .INPUTS
        System.Collections.IDictionary for embeds, System.Boolean for TTS and System.String for everything else.
    .OUTPUTS
        System.Collections.IDictionary
    .LINK
        Initialize-DiscordWebHookEmbed
    .LINK
        Send-DiscordWebHookMessage
    #>
    [CmdletBinding()]
    [OutputType([System.Collections.Specialized.OrderedDictionary])]
    param (
        [Parameter(Mandatory = $false)]
        [ValidatePattern('^https://|http://')]
        [string]$AvatarUrl,

        [ValidateNotNullOrEmpty()]
        [string]$Content,

        [ValidateNotNullOrEmpty()]
        [System.Collections.IDictionary[]]$Embeds,

        [switch]$TextToSpeech,

        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]$UserName
    )
    $ErrorActionPreference = 'Stop'
    if ($TextToSpeech -and (-not($Content))) {
        throw 'Cannot use text-to-speech without content.'
    }
    if ($Content -or $Embeds) {
        $message = [ordered] @{
            "embeds" = @()
        }
        if ($Embeds) {
            foreach ($embed in $Embeds) {
                $message.embeds += $embed
            }
        }
        if ($Content) {
            if ($TextToSpeech) {
                $message.tts = $true
            }
            $message.content = $Content
        }
        if ($UserName) {
            $message.username = $UserName
        }
        if ($AvatarUrl) {
            $message.avatar_url = $AvatarUrl
        }
        return $message
    }
    else {
        throw 'When constructing a message, you must provide a value for at least content or embeds'
    }
}
