function Update-GitRepositories {
    <#
        .SYNOPSIS
        will walk through the current directory going through all sub-directories. In case the sub-directory is a GIT repository it will pull updates.
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        $dirs = Get-ChildItem -Directory

        foreach ($dir in $dirs)
        {
            Set-Location $dir
            Write-Host "- checking $dir ..." -ForegroundColor Cyan

            if (Test-Path -Path '.git')
            {
                git pull
            }
            else 
            {
                Write-Host "  -> this is not a git repository" -ForegroundColor Yellow
            }

            Set-Location ..
        }
    }    
}