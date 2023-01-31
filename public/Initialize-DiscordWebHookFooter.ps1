function Initialize-DiscordWebHookFooter {
    <#
    .SYNOPSIS
        Creates a new Discord footer object.
    .DESCRIPTION
        The Discord footer object is added to and displayed at the bottom of an embed.
    .PARAMETER Text
        The footer text.
    .PARAMETER IconUrl
        A very tiny (24px x 24px) icon displayed left of the footer.
    .EXAMPLE
        PS C:\> Initialize-DiscordWebHookFooter -Text 'That's all folks!' -IconUrl 'https://upload.wikimedia.org/wikipedia/en/7/79/Bugsbunny2011.png'

        Creates a Discord footer object with text and an icon.
    .INPUTS
        System.String
    .OUTPUTS
        System.Collections.Specialized.OrderedDictionary
    .LINK
        Initialize-DiscordWebHookEmbed
    #>
    [CmdletBinding()]
    [OutputType([System.Collections.Specialized.OrderedDictionary])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Text,

        [ValidatePattern('^https://|http://')]
        [string]$IconUrl
    )
    end {
        $ErrorActionPreference = 'Stop'
        $author = [ordered] @{
            text     = $Text
            icon_url = $IconUrl
        }
        $author
    }
}
