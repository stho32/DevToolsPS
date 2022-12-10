function New-DotnetTestingPackages {
    <#
        .SYNOPSIS
        Add nuget packages for testing to the project
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Name
    )

    process {
        Set-Location "$Name"
        dotnet add package Microsoft.NET.Test.Sdk
        dotnet add package xunit
        dotnet add package xunit.runner.visualstudio
        Set-Location ..
    }
}
