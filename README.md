# dotfiles

[![Github issues](https://img.shields.io/github/issues/borley1211/dotfiles)](https://github.com/borley1211/dotfiles/issues)
[![Github forks](https://img.shields.io/github/forks/borley1211/dotfiles)](https://github.com/borley1211/dotfiles/network/members)
[![Github stars](https://img.shields.io/github/stars/borley1211/dotfiles)](https://github.com/borley1211/dotfiles/stargazers)
[![Github license](https://img.shields.io/github/license/borley1211/dotfiles)](https://github.com/borley1211/dotfiles/)

## Tags

`zsh` `bash` `dotfiles`

## Short Description

The configuration files repository.

This repo is inspired by [this project](https://github.com/b4b4r07/dotfiles).

## Requirements

Before setup, please install these packages.

- git
- make
- tar
- curl

ex:

```console:
sudo apt install git make tar curl
```

## Advantages

(I don't know)

## Installation

### on Unix

```console:
curl -L https://raw.githubusercontent.com/borley1211/dotfiles/master/etc/install | bash
```

### on Windows (DEPRECATED_NOW)

**Please run it in _WSL_.**

```console:
curl -L https://raw.githubusercontent.com/borley1211/dotfiles/master/etc/install-win | bash
```

## Deployment

```console:
cd ${DOTPATH}
make deploy
```

## Contributors

- [borley1211](https://github.com/borley1211)
- [renovate-bot](https://github.com/renovate-bot)
