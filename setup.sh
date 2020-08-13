#!/usr/bin/env bash
#
# setup.sh: run the workstation setup on Ubuntu's WSL

# ZSH
sudo apt-get install zsh
sudo apt-get install git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


source /home/yoyo/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# export CHROME_BIN='/usr/bin/chromium-browser'
export CHROME_BIN='/usr/bin/google-chrome-stable'

export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin"


# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.bashrc
nvm install node

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn


# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER

