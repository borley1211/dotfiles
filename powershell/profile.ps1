Set-Alias ls "$HOME\scoop\shims\ls.exe"
Set-Alias ln "$HOME\scoop\shims\ln.exe"
Set-Alias mkdir "$HOME\scoop\shims\mkdir.exe"

switch ($PSEdition) {
    "Core" {$PSNAME = "pwsh"}
    Default {$PSNAME = "powershell"}
}

function reshell {
    Invoke-Expression "${PSNAME} -NoLogo"
}

Invoke-Expression (&starship init powershell)
