<#
    .SYNOPSIS
        Build and optionally analyze module.
    .DESCRIPTION
        Creates PowerShell module and manifest.
        Optionally uses PSScriptAnalyzer for analysis with PSGallery ruleset.
    .PARAMETER Analyze
        Body to update message with.
    .EXAMPLE
        PS C:\> .\build.ps1 -Analyze

        Creates module files and returns PSScriptAnalyzer results.
#>
[CmdletBinding(SupportsShouldProcess = $true)]
param (
    [switch]$Analyze
)

# Module variables
$moduleVersion = '0.9.0'
$name = 'PSDiscordWebHook'
$author = 'ExpendaBubble'

# Build variables
$buildDir = "$PSScriptRoot\build\$name\$moduleVersion"
$manifestPath = "$buildDir\$name.psd1"
$rootModulePath = "$buildDir\$name.psm1"

# Build manifest parameters
$manifest = @{
    AliasesToExport      = 'New-DiscordWebHookThumbnail'
    Author               = $author
    CompanyName          = $author
    CmdletsToExport      = @()
    CompatiblePSEditions = 'Core', 'Desktop'
    Description          = 'A PowerShell module that makes it easy to send, edit and delete Discord messages via web hook.'
    LicenseUri           = "https://github.com/$author/$name/blob/main/LICENSE"
    ModuleVersion        = $moduleVersion
    Path                 = $manifestPath
    PowerShellVersion    = '5.1'
    ProjectUri           = "https://github.com/$author/$name"
    Tags                 = 'Discord', 'Hook', 'Messaging', 'REST', 'Web'
    VariablesToExport    = @()
}

# Clean and create directory and files
$guid = New-Guid
if (Test-Path -Path $buildDir) {
    if (Test-Path -LiteralPath $manifestPath) {
        $guid = (Import-PowerShellDataFile -Path $manifestPath).GUID
    }
    Remove-Item -Path $buildDir -Recurse
}
New-Item -Path $buildDir -ItemType Directory | Out-Null

# Get functions and build module
[array] $public = Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1"
[array] $private = Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1"
$functions = $public + $private | Sort-Object -Property Name
$functions | ForEach-Object {
    Get-Content -Path $_.FullName -Raw | Out-File -FilePath $rootModulePath -Append
}

# Build manifest
New-ModuleManifest @manifest -RootModule "$name.psm1" -FunctionsToExport $public.BaseName -Guid $guid

# PS Script Analyzer
if ($Analyze) {
    Invoke-ScriptAnalyzer -Path $buildDir -Settings PSGallery
}
