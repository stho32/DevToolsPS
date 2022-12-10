function Get-GitRepositoryStatus {
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

            if (Test-Path -Path '.git')
            {
                $status = git status

                if ($status -like '*nothing to commit*')
                {
                    New-Object -Type PSObject -Property @{
                        Name = $dir
                        Status = "No changes"
                    }
                }
                else
                {
                    New-Object -Type PSObject -Property @{
                        Name = $dir
                        Status = "OPEN CHANGES"
                    }
                }
            } else {
                New-Object -Type PSObject -Property @{
                    Name = $dir
                    Status = "Not a git repository"
                }
            }

            Set-Location ..
        }
    }    
}