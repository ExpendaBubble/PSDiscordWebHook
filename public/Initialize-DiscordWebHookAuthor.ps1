function Initialize-DiscordWebHookAuthor {
    <#
    .SYNOPSIS
        Creates a new Discord author object.
    .DESCRIPTION
        The Discord author object is added to and displayed at the top of an embed.
    .PARAMETER Name
        The name of the author.
    .PARAMETER Url
        A clickable link to a website.
    .PARAMETER IconUrl
        A very tiny (24px x 24px) icon displayed left of the author's name.
    .EXAMPLE
        PS C:\> Initialize-DiscordWebHookAuthor -Name 'Jerry Mouse' -IconUrl 'https://upload.wikimedia.org/wikipedia/en/2/2f/Jerry_Mouse.png' -Url 'https://en.wikipedia.org/wiki/Jerry_Mouse'

        Creates a Discord author object for Jerry, with a link to his Wikipedia page and his portrait for an icon.
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
        [string]$Name,

        [Parameter(Mandatory = $false)]
        [ValidatePattern('^https://|http://')]
        [string]$Url,

        [Parameter(Mandatory = $false)]
        [ValidatePattern('^https://|http://')]
        [string]$IconUrl
    )
    $ErrorActionPreference = 'Stop'
    $author = [ordered] @{
        name           = $Name
        url            = $Url
        icon_url       = $IconUrl
    }
    return $author
}
