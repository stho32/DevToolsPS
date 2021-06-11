<#
    DEVTOOLSPS - 
    
    Powershell Tools for DotNetCore Development on Linux
#>
$ErrorActionPreference = "Stop"

Push-Location $PSScriptRoot

Get-ChildItem -Filter "*.ps1" -Recurse | 
	ForEach-Object {
		. ($_.Fullname)
}

Pop-Location

Clear-Host
Write-Host "DevToolsPs is loaded... welcome to a new great day... :)" -ForegroundColor Cyan