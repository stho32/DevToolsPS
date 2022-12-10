function New-DotnetProject {
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
        dotnet new gitignore

        New-DotnetLibrary -Name "$Name.Domain"
        New-DotnetLibrary -Name "$Name.Domain.Tests"
        Add-DotnetTestingPackages -Name "$Name.Domain.Tests"
        New-DotnetConsoleApp -Name "$Name.Console"

        dotnet sln "./$Name.sln" add "./$Name.Domain/"
        dotnet sln "./$Name.sln" add "./$Name.Domain.Tests/"
        dotnet sln "./$Name.sln" add "./$Name.Console/"
    }
}
