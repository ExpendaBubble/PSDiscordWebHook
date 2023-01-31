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
    [CmdletBinding(DefaultParameterSetName = 'Name')]
    [OutputType([System.Int64])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'Name')]
        [ValidateScript({ $_ -in $script:colors.Keys })]
        [string]$Name,

        [Parameter(Mandatory = $true, ParameterSetName = 'Hex')]
        [ValidatePattern('^#?([A-Fa-f0-9]{6})$')]
        [string]$Hex
    )
    switch ($PsCmdlet.ParameterSetName) {
        'Name' {
            $value = $script:colors.$Name
            $hexValue = ConvertTo-HexColor -Rgb $value
            [Convert]::ToInt64($hexValue, 16)
            break
        }
        'Hex' {
            $hexValue = $Hex.TrimStart('#')
            [Convert]::ToInt64($hexValue, 16)
            break
        }
    }
}
