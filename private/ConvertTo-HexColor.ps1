function ConvertTo-HexColor {
    <#
    .SYNOPSIS
        This color converter returns the hex value of an RGB array.
    .DESCRIPTION
        This color converter gives you the hex values of your RGB colors. Use it to convert your colors and prepare your graphics and HTML web pages.
    .PARAMETER RBG
        Enter the Red Green Blue value comma separated. red: 51, green: 51 & blue: 204 for example needs to be entered as 51,51,204.
    .EXAMPLE
        PS C:\> Convert-HexColor -RGB 123,200,255

        Converts red = 123, green = 200 & blue = 255 to hex value 7bc8ff
    .INPUTS
        System.Int32
    .OUTPUTS
        Hex as System.String
    .LINK
        ConvertFrom-Color
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidatePattern('^([01]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])$')]
        [int[]]$Rgb
    )

    if ($null -eq $Rgb[2]) {
        Write-Error 'Value missing. Please enter all three values seperated by comma.'
    }
    $red = [convert]::Tostring($Rgb[0], 16)
    $green = [convert]::Tostring($Rgb[1], 16)
    $blue = [convert]::Tostring($Rgb[2], 16)
    if ($red.Length -eq 1) {
        $red = '0' + $red
    }
    if ($green.Length -eq 1) {
        $green = '0' + $green
    }
    if ($blue.Length -eq 1) {
        $blue = '0' + $blue
    }
    return $red + $green + $blue
}
