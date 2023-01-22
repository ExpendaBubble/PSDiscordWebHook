function Initialize-DiscordWebHookField {
    <#
    .SYNOPSIS
        Creates a new Discord field object.
    .DESCRIPTION
        Creates a Discord field object for use within an embed.
    .PARAMETER Name
        The title of the field.
    .PARAMETER Value
        The content of the field.
    .PARAMETER Inline
        Whether or not this field should be on the same line/row or not. Only works if preceding or following field is also inline.
    .EXAMPLE
        PS C:\> Initialize-DiscordWebHookField -Name 'Note' -Value 'This is a field'

        Creates a Discord field object with title 'Note' and content 'This is a field'.
    .EXAMPLE
        PS C:\> Initialize-DiscordWebHookField -Name 'Part 1' -Value 'First field' -Inline
        PS C:\> Initialize-DiscordWebHookField -Name 'Part 2' -Value 'Second field' -Inline

        Creates a Discord field object with title 'Part 1' and content 'First field'.
        Creates a Discord field object with title 'Part 2' and content 'Second field' on the same line/row.
    .INPUTS
        System.String for the name and value, and System.Switch for inline.
    .OUTPUTS
        System.Collections.Specialized.OrderedDictionary
    .LINK
        Initialize-DiscordWebHookEmbed
    #>
    [CmdletBinding()]
    [OutputType([System.Collections.Specialized.OrderedDictionary])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Value,

        [switch]$Inline
    )
    end {
        $ErrorActionPreference = 'Stop'
        $field = [ordered] @{
            name   = $Name
            value  = $Value
            inline = $inline.IsPresent
        }
        $field
    }
}
