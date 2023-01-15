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
[CmdletBinding(SupportsShouldProcess)]
param (
    [Parameter(Mandatory = $false)]
    [switch]$Analyze
)

# Vars
$AliasesToExport = @('New-DiscordWebHookThumbnail')
$Author = 'ExpendaBubble'
$CompatiblePSEditions = @('Core','Desktop')
$CmdletsToExport = @()
$Description = 'A PowerShell module that makes it easy to send, edit and delete Discord messages via web hook.'
$LicenseUri = 'https://github.com/ExpendaBubble/PSDiscordWebHook/blob/main/LICENSE'
$ModuleVersion = '0.9.0.0'
$Name = 'PSDiscordWebHook'
$PowerShellVersion = '5.1'
$ProjectUri = 'https://github.com/ExpendaBubble/PSDiscordWebHook'
$Tags = @('Discord', 'Web Hook', 'Social Media', 'Messaging')
$VariablesToExport = @()

# Clean and create directory and files
If (Test-Path -Path "$PSScriptRoot\build") {
    Remove-Item -Path "$PSScriptRoot\build" -Recurse
}
New-Item -Path "$PSScriptRoot\build" -ItemType Directory | Out-Null
New-Item -Path "$PSScriptRoot\build\$Name.psd1" -ItemType File | Out-Null
New-Item -Path "$PSScriptRoot\build\$Name.psm1" -ItemType File | Out-Null

# Get functions and build module
$public = @( Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1" -ErrorAction SilentlyContinue )
$private = @( Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1" -ErrorAction SilentlyContinue )
$functions = $public + $private | Sort-Object -Property Name
$functions | ForEach-Object {
    (Get-Content -Path $_.FullName -Raw) + '' | Out-File -FilePath "$PSScriptRoot\build\$Name.psm1" -Append
}

# Build manifest
$manifest = @{
    AliasesToExport = $AliasesToExport
    Author = $Author
    CmdletsToExport = $CmdletsToExport
    CompatiblePSEditions = $CompatiblePSEditions
    Description = $Description
    FunctionsToExport = @($public.BaseName)
    Guid = (New-Guid)
    LicenseUri = $LicenseUri
    ModuleVersion = $ModuleVersion
    Path = "$PSScriptRoot\build\$Name.psd1"
    PowerShellVersion = $PowerShellVersion
    ProjectUri = $ProjectUri
    RootModule = "$Name.psm1"
    Tags = $Tags
    VariablesToExport = $VariablesToExport
}
New-ModuleManifest @manifest

# PS Script Analyzer
if ($Analyze) {
    Invoke-ScriptAnalyzer -Path "$PSScriptRoot\build" -Settings PSGallery
}
