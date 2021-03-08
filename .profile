# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH="$PATH:$HOME/.local/bin"

# path settigs
if [ "$(uname)" == 'Darwin' ]; then
    export PATH=/usr/local/bin:$PATH
elif [ -e /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
elif [ -e /etc/debian_version ]; then
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
elif [ -e /etc/system-release ]; then
    amazonLinuxReleaseFile=$(cat /etc/system-release)
    if [[ $(echo $amazonLinuxReleaseFile | grep "Amazon Linux") ]]; then
        export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
    fi
fi

# linuxbrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if type brew &>/dev/null; then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
            [[ -r "$COMPLETION" ]] && source "$COMPLETION"
        done
    fi
fi

if grep -qE "(Microsoft|WSL)" /proc/version &>/dev/null; then
    # set wsl-ssh-agent
    SSH_AUTH_SOCK=/mnt/c/Apps/wsl-ssh-agent/ssh-agent.sock
    export SSH_AUTH_SOCK
fi

