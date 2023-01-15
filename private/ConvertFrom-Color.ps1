function ConvertFrom-Color {
    <#
    .SYNOPSIS
        Converts a supported color input to its decimal value.
    .DESCRIPTION
        Converts a color name or hex code to a decimal value for use with a Discord message embed.
    .PARAMETER Name
        Color name.
    .PARAMETER Hex
        Color hex code.
    .EXAMPLE
        PS C:\> ConvertFrom-Color -Name Blue

        Returns 255
    .EXAMPLE
        PS C:\> ConvertFrom-Color -Hex '#0000ff'

        Returns 255
    .INPUTS
        System.String
    .OUTPUTS
        System.Int64
    .LINK
        ConvertTo-HexColor
    .LINK
        Initialize-DiscordWebHookEmbed
    #>
    [CmdletBinding()]
    [OutputType([System.Int64])]
    param (
        [Parameter(Mandatory=$true,ParameterSetName = 'Name',Position = 0)]
        [ValidateScript({$_ -in $colors.Keys})]
        [string]$Name,

        [Parameter(Mandatory=$true,ParameterSetName = 'Hex',Position = 0)]
        [ValidatePattern('^#?([A-Fa-f0-9]{6})$')]
        [string]$Hex
    )
    switch ($PsCmdlet.ParameterSetName) {
        'Name' {
            $value = $colors.$Name
            $HexValue = ConvertTo-HexColor -RGB $value
            return [Convert]::ToInt64($HexValue,16)
        }
        'Hex' {
            $HexValue = $Hex.TrimStart('#')
            return [Convert]::ToInt64($HexValue,16)
        }
    }
}
