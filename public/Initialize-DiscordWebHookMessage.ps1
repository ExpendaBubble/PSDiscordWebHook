function Initialize-DiscordWebHookMessage {
    <#
    .SYNOPSIS
        Constructs a message object to send to Discord via webhook.
    .DESCRIPTION
        Discord webhook message object. Must contain at least some content or one or more embeds.
    .PARAMETER AvatarUrl
        Url to avatar image for user.
    .PARAMETER Content
        Plain text content to send.
    .PARAMETER Embeds
        Rich content to send.
    .PARAMETER TextToSpeech
        Enables text-to-speech for content.
    .PARAMETER UserName
        User name to use for the message posted by the webhook.
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
    [CmdletBinding(DefaultParameterSetName = 'Embeds')]
    [OutputType([System.Collections.Specialized.OrderedDictionary])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'Content')]
        [ValidateNotNullOrEmpty()]
        [string]$Content,

        [Parameter(Mandatory = $true, ParameterSetName = 'Embeds')]
        [ValidateNotNullOrEmpty()]
        [System.Collections.IDictionary[]]$Embeds,

        [ValidatePattern('^https://|http://')]
        [string]$AvatarUrl,

        [Parameter(ParameterSetName = 'Content')]
        [switch]$TextToSpeech,

        [ValidateNotNullOrEmpty()]
        [string]$UserName
    )
    end {
        $ErrorActionPreference = 'Stop'
        $message = [ordered] @{
            embeds = @()
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
        $message
    }
}
