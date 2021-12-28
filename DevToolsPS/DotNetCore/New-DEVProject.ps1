function New-DEVProject {
    <#
        .SYNOPSIS
        create a new project with my standard libraries and unit tests
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name
    )
    
    process {
        mkdir $Name
        Set-Location $Name

        dotnet new sln

        mkdir "$Name.BL"
        Set-Location "$Name.BL"
        dotnet new classlib
        Set-Location ..

        mkdir "$Name.Console"
        Set-Location "$Name.Console"
        dotnet new console
        Set-Location ..

        mkdir "$Name.BL.Tests"
        Set-Location "$Name.BL.Tests"
        dotnet new classlib
        dotnet add package Microsoft.NET.Test.Sdk
        dotnet add package xunit
        dotnet add package xunit.runner.visualstudio
        Set-Location ..

        mkdir "$Name.Interfaces"
        Set-Location "$Name.Interfaces"
        dotnet new classlib
        Set-Location ..

        dotnet sln "./$Name.sln" add "./$Name.BL/"
        dotnet sln "./$Name.sln" add "./$Name.Console/"
        dotnet sln "./$Name.sln" add "./$Name.BL.Tests/"
        dotnet sln "./$Name.sln" add "./$Name.Interfaces/"
    }
}
