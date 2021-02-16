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

        mkdir "$Name.BL.Tests"
        Set-Location "$Name.BL.Tests"
        dotnet new classlib
        Set-Location ..

        mkdir "$Name.Interfaces"
        Set-Location "$Name.Interfaces"
        dotnet new classlib
        Set-Location ..

        mkdir "$Name.Classes"
        Set-Location "$Name.Classes"
        dotnet new classlib
        Set-Location ..
    }
}