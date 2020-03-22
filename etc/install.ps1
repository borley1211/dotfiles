# General Utilities{{{1
function get_edition {
    switch ($PSEdition) {
        "Core" {return "pwsh"}
        Default {return "powershell"}
    }
}

function restart_shell {
    Invoke-Expression -Command get_edition -NoLogo 
}

function e_newline {
    Write-Output ""
}

function e_header($text) {
    Write-Output "${text}"
}

function e_arrow {
    Write-Output "➜ "
}

function e_done {
    $tmp = $host.ui.RawUI.ForegroundColor
    $host.ui.RawUI.ForegroundColor = "Green"
    Write-Output "✔...OK"
}

function ink($color, $text) {
    if (($args.Length -eq 0) -Or ($args.Length -gt 2 )) {
        Write-Output "Usage: ink <color> <text>"
        Write-Output "Colors:"
        Write-Output "  black, white, red, green, yellow, blue, purple, cyan, gray"
        return 1
    }
    
    $tmp = $host.ui.RawUI.ForegroundColor
    $host.ui.RawUI.ForegroundColor = "${color}"
    Write-Output "${text}"
    $host.ui.RawUI.ForegroundColor = "${tmp}"
}

function logging($mode, $text) {
    if (($args.Length -eq 0) -Or ($args.Length -gt 2 )) {
        Write-Output "Usage: ink <fmt> <msg>"
        Write-Output "Formatting Options:"
        Write-Output "  TITLE, ERROR, WARN, INFO, SUCCESS"
        return 1
    }

    $color;

    switch -Exact ($mode) {
        "TITLE" { $color = "yellow" }
        { ($_ -eq "ERROR") -Or ($_ -eq "WARN") } { $color = "red" }
        "INFO" { $color = "blue" }
        "SUCCESS" { $color = "green" }
        Default { $text = $color }
    }

    function timestamp {
        $date = Get-Date -UFormat "+%H:%M:%S"
        ink gray "["
        ink purple "${date}"
        ink gray "] "
    }

    timestamp
    ink "$color" "$text" | Write-Output
}

function log_fail($text) {
    logging "ERROR" "$text"
}

# is_debug returns true if $DEBUG is set
function is_debug {
    if ("$env:DEBUG") { return 0 } else { return 1 }
}

# Dotfile {{{1

# Set DOTPATH as default variable
if ("$env:DOTPATH" -eq $null) {
    $env:DOTPATH = $env:HOME + "/Dotfiles"
    [System.Environment]::SetEnvironmentVariable("DOTPATH", $env:DOTPATH, "User")
}

$env:DOTFILES_GITHUB = "https://github.com/borley1211/dotfiles"

$dotfiles_logo = '
      | |     | |  / _(_) |           
    __| | ___ | |_| |_ _| | ___  ___  
   / _` |/ _ \| __|  _| | |/ _ \/ __| 
  | (_| | (_) | |_| | | | |  __/\__ \ 
   \__,_|\___/ \__|_| |_|_|\___||___/ 

  *** WHAT IS INSIDE? ***
  1. Download "$env:DOTFILES_GITHUB".git
  2. Symlinking dot files to your home directory
  3. Execute all sh files within `etc/init/` (optional)

  See the README for documentation.
  "$env:DOTFILES_GITHUB"

  Copyright (c) 2014 "BABAROT" aka @b4b4r07.
  Edited by @borley1211 in 2019.
  Licensed under the MIT.
'

function dotfiles_download {
    if (!(Test-Path "$env:DOTPATH")) {
        log_fail "${env:DOTPATH}: already exists"
        exit 1
    }

    e_newline
    e_header "Downloading dotfiles..."

    if (is_debug) { }
    else {
        if (is_exists "git") {
            # --recursive equals to ...
            # git submodule init
            # git submodule update
            git clone --recursive "$DOTFILES_GITHUB".git "$DOTPATH"
        }
        elseif ((is_exists "curl") -Or (is_exists "wget")) {
            # curl or wget
            $tarball = "${DOTFILES_GITHUB}/archive/master.tar.gz"
            if (is_exists "curl") { curl -L "$tarball" | tar xvz }
            elseif (is_exists "wget") { wget -O - "$tarball" | tar xvz }
            if (!(Test-Path "dotfiles-master")) {
                log_fail "dotfiles-master: not found"
                exit 1
            }
            Move-Item -Force "dotfiles-master" "${DOTPATH}"
        }
        else {
            log_fail "curl or wget required"
            exit 1
        }
    }
    e_newline
    e_done "Download"
}

function dotfiles_deploy {
    if (!(Test-Path "$env:DOTPATH")) {
        log_fail "${env:DOTPATH}: already exists"
        exit 1
    }

    e_newline
    e_header "Deploying dotfiles..."

    if (is_debug) { }
    else { make deploy }
    e_newline
    e_done "Deploy"
}

function dotfiles_initialize($mode) {
    if ("${mode}" -eq "init") {
        e_newline
        e_header "Initializing dotfiles..."

        if (is_debug) { }
        else {
            if (Test-Path "Makefile") { make init }
            else {
                log_fail "Makefile: not found"
                exit 1
            }
        }
        e_newline
        e_done "Initialize"
    }
}

# A script for the file named "install"
function dotfiles_install($arg) {
    # 1. Download the repository
    # ==> downloading
    #
    # Priority: git > curl > wget
    dotfiles_download

    # 2. Deploy dotfiles to your home directory
    # ==> deploying
    dotfiles_deploy

    # 3. Execute all sh files within etc/init/
    # ==> initializing
    dotfiles_initialize "${arg}"
}

# -> cat a.ps1 | powershell

Write-Output "$dotfiles_logo"
dotfiles_install "$@"

# Restart shell
e_newline
e_arrow "Restarting your shell..."
