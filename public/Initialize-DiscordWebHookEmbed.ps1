function Initialize-DiscordWebHookEmbed {
    <#
    .SYNOPSIS
        Constructs a Discord embed object for use within a message.
    .DESCRIPTION
        Creates an embed that can be part of a rich message consisting of various components such as fields and image, a thumbnail, etc.
    .PARAMETER Author
        Name of the author, possible with icon and clickable link, displayed at the top of the embed.
    .PARAMETER ColorName
        Name of color to use for the left border of the embed.
    .PARAMETER ColorHex
        Hex value of color to use for the left border of the embed.
    .PARAMETER Description
        Text displayed below the title of the embed.
    .PARAMETER Fields
        One or more blocks of content displayed as part of the embed.
    .PARAMETER Footer
        Text displayed at the bottom of the embed, with optional icon.
    .PARAMETER Image
        A picture to add below the content and fields.
    .PARAMETER Thumbnail
        A thumbnail picture to add in the top right corner of the embed.
    .PARAMETER Title
        Title text of the embed, displayed just after the author.
    .EXAMPLE
        PS C:\> Initialize-DiscordWebHookEmbed -Title 'Embed Title' `
                -Description 'Embed Description' `
                -Fields $field1,$field2,$field3 `
                -Author $author `
                -ColorName 'CamouflageGreen' `
                -Image $image `
                -Thumbnail $image

        Creates a rich Discord embed object with an author, thumbnail, title, description, 3 fields and a picture.
    .INPUTS
        System.String and System.Collections.IDictionary
    .OUTPUTS
        System.Collections.IDictionary
    .LINK
        Initialize-DiscordWebHookAuthor
    .LINK
        Initialize-DiscordWebHookField
    .LINK
        Initialize-DiscordWebHookImage
    .LINK
        Initialize-DiscordWebHookMessage
    #>
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [OutputType([System.Collections.Specialized.OrderedDictionary])]
    param (
        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'ColorName')]
        [Parameter(ParameterSetName = 'ColorHex')]
        [ValidateNotNullOrEmpty()]
        [System.Collections.IDictionary]$Author,

        [Parameter(ParameterSetName = 'ColorName')]
        [ValidateScript({ $_ -in $script:colors.Keys })]
        [string]$ColorName,

        [Parameter(ParameterSetName = 'ColorHex')]
        [ValidatePattern('^#?([A-Fa-f0-9]{6})$')]
        [string]$ColorHex,

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'ColorName')]
        [Parameter(ParameterSetName = 'ColorHex')]
        [ValidateNotNullOrEmpty()]
        [string]$Description,

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'ColorName')]
        [Parameter(ParameterSetName = 'ColorHex')]
        [ValidateNotNullOrEmpty()]
        [System.Collections.IDictionary[]]$Fields,

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'ColorName')]
        [Parameter(ParameterSetName = 'ColorHex')]
        [ValidateNotNullOrEmpty()]
        [System.Collections.IDictionary]$Footer,

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'ColorName')]
        [Parameter(ParameterSetName = 'ColorHex')]
        [ValidateNotNullOrEmpty()]
        [System.Collections.IDictionary]$Image,

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'ColorName')]
        [Parameter(ParameterSetName = 'ColorHex')]
        [ValidateNotNullOrEmpty()]
        [System.Collections.IDictionary]$Thumbnail,

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'ColorName')]
        [Parameter(ParameterSetName = 'ColorHex')]
        [ValidateNotNullOrEmpty()]
        [string]$Title
    )
    end {
        $ErrorActionPreference = 'Stop'
        $embed = [ordered] @{
            title       = $Title
            description = $Description
            fields      = @()
        }
        $field = foreach ($Fld in $Fields) {
            if ($null -ne $Fld) {
                $Fld
            }
        }
        $embed.fields = @($field)
        if ($ColorName) {
            $embed.color = ConvertFrom-Color -Name $ColorName
        }
        if ($Footer) {
            $embed.footer = $Footer
        }
        if ($ColorHex) {
            $embed.color = ConvertFrom-Color -Hex $ColorHex
        }
        if ($Author) {
            $embed.author = $Author
        }
        if ($Image) {
            $embed.image = $Image
        }
        if ($Thumbnail) {
            $embed.thumbnail = $Thumbnail
        }
        $embed
    }
}
