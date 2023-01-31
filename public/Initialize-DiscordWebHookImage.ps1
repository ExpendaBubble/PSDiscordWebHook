function Initialize-DiscordWebHookImage {
    <#
    .SYNOPSIS
        Creates a new Discord image object.
    .DESCRIPTION
        Creates a Discord image object for use within an embed.
        The alias can be used to distinguish the image's use in your code.
    .PARAMETER Url
        The web address of the image.
    .EXAMPLE
        PS C:\> Initialize-DiscordWebHookImage -Url 'https://upload.wikimedia.org/wikipedia/en/5/5f/TomandJerryTitleCardc.jpg'

        Creates a Discord picture image object for use within an embed.
    .EXAMPLE
        PS C:\> Initialize-DiscordWebHookThumbnail -Url 'https://upload.wikimedia.org/wikipedia/commons/2/20/Tom_%C3%A9s_Jerry.png'

        Creates a Discord thumbnail image object for use within an embed.
    .INPUTS
        System.String for the url, System.Int32 for the width and height.
    .OUTPUTS
        System.Collections.Specialized.OrderedDictionary
    .LINK
        Initialize-DiscordWebHookEmbed
    #>
    [Alias('Initialize-DiscordWebHookThumbnail')]
    [CmdletBinding()]
    [OutputType([System.Collections.Specialized.OrderedDictionary])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidatePattern('^https://|http://')]
        [string]$Url
    )
    end {
        $ErrorActionPreference = 'Stop'
        $image = [ordered] @{
            url = $Url
        }
        $image
    }
}
