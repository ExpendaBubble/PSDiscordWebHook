function ConvertTo-HexColor {
    <#
    .SYNOPSIS
        This color converter returns the hex value of an RGB array.
    .DESCRIPTION
        This color converter gives you the hex values of your RGB colors. Use it to convert your colors and prepare your graphics and HTML web pages.
    .PARAMETER RBG
        Enter the Red Green Blue value comma separated. red: 51, green: 51 & blue: 204 for example needs to be entered as 51,51,204.
    .EXAMPLE
        PS C:\> Convert-HexColor -RGB 123, 200, 255

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
        [Parameter(Mandatory = $true)]
        [ValidateCount(3, 3)]
        [ValidateRange(0, 255)]
        [int[]]$Rgb
    )
    end {
        $color = [System.Drawing.Color]::FromArgb($Rgb[0], $Rgb[1], $Rgb[2])
        $color.R.ToString('X2') + $color.G.ToString('X2') + $color.B.ToString('X2')
    }
}
