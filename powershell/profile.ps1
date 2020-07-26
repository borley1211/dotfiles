# enable completion in current shell, use absolute path because PowerShell Core not respect $env:PSModulePath
Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"

Invoke-Expression (&starship init powershell)
