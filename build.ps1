#Requires -Modules PlatyPS
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
    [string]$Guid,
    [switch]$Analyze
)

# Module variables
$moduleVersion = '0.9.1'
$name = 'PSDiscordWebHook'
$author = 'ExpendaBubble'

# Build variables
$buildDir = "$PSScriptRoot\build\$name\$moduleVersion"
$manifestPath = "$buildDir\$name.psd1"
$rootModulePath = "$buildDir\$name.psm1"
$projectUri = "https://github.com/$author/$name"
$docsFolder = 'docs'
$cabFolder = 'cab'

if ([string]::IsNullOrWhiteSpace($Guid)) {
    $Guid = New-Guid
}

# Build manifest parameters
$manifest = @{
    AliasesToExport      = 'New-DiscordWebHookThumbnail'
    Author               = $author
    CmdletsToExport      = @()
    CompanyName          = $author
    CompatiblePSEditions = 'Core', 'Desktop'
    Description          = 'A PowerShell module that makes it easy to send, edit and delete Discord messages via webhook.'
    Guid                 = $Guid
    HelpInfoUri          = "https://raw.githubusercontent.com/$author/$name/main/$cabFolder/"
    LicenseUri           = "$projectUri/blob/main/LICENSE"
    ModuleVersion        = $moduleVersion
    Path                 = $manifestPath
    PowerShellVersion    = '5.1'
    ProjectUri           = $projectUri
    Tags                 = 'Discord', 'Hook', 'Messaging', 'REST', 'Web'
    VariablesToExport    = @()
}

# Clean and create directory and files
if (Test-Path -Path $buildDir) {
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
New-ModuleManifest @manifest -RootModule "$name.psm1" -FunctionsToExport $public.BaseName

# Create the docs - one time only
# New-MarkdownHelp -Module $name -OutputFolder $docsFolder -UseFullTypeName -WithModulePage -HelpVersion $moduleVersion -FwLink ("$projectUri/$docsFolder/$name-help.xml") -Force

# Update docs
Import-Module -Name $manifestPath
Update-MarkdownHelp -Path $docsFolder -UseFullTypeName
New-ExternalHelp -Path $docsFolder -OutputPath $buildDir -Force | Out-Null
New-ExternalHelpCab -CabFilesFolder $buildDir -OutputFolder $cabFolder -LandingPagePath "$docsFolder\PSDiscordWebHook.md" | Out-Null


# PS Script Analyzer
if ($Analyze) {
    Invoke-ScriptAnalyzer -Path $buildDir -Settings PSGallery
}
