# Alexis's devbox

## Description

An openSUSE Tumbleweed-based development container for Alexis. Nothing too special, just all the things I need for all my projects. Based on ublue-os/boxkit.

## How to use

### Create Box

If you use distrobox:

    distrobox create -i ghcr.io/alexispurslane/devbox -n boxkit
    distrobox enter boxkit
    
If you use toolbx:

    toolbox create -i ghcr.io/alexispurslane/devbox -c boxkit
    toolbox enter boxkit

### Pull down your config

Use `git` and `stow` to manage your dotfiles.
