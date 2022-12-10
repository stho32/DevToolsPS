function New-DotnetConsoleApp {
    <#
        .SYNOPSIS
        create a new console app with this name in the current directory
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Name
    )

    process {
        mkdir "$Name"
        Set-Location "$Name"
        dotnet new console
        Set-Location ..
    }
}
