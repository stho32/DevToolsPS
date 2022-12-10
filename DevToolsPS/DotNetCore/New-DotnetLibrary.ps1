function New-DotnetLibrary {
    <#
        .SYNOPSIS
        create a new library with this name in the current directory
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Name
    )

    process {
        mkdir "$Name"
        Set-Location "$Name"
        dotnet new classlib
        Set-Location ..
    }
}
