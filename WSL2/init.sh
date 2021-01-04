#!/bin/bash
sudo apt update
sudo apt upgrade
# Homebrew install
sudo apt-get install vim tmux build-essential curl file git
curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh | sh
brew update