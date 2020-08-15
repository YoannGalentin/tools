#!/usr/bin/env bash

#
# setup.sh: run the workstation setup on Ubuntu's WSL
#

# Update distro
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

echo
echo "Tools install (git, ansible, vim, ...)"
echo
sudo apt-get install -y git
sudo apt-get install -y vim  ansible git

# Fonts
echo
echo "Fonts"
echo
sudo apt-get install -y powerline fonts-powerline

#
#echo
#echo "Jenv install"
#echo
#echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
#echo 'eval "$(jenv init -)"' >> ~/.zshrc
#
#source /home/yoyo/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NVM
echo
echo "NVM install"
echo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.bashrc
nvm install node

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER

# using dircolors.ansi-dark
# curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
#echo ""
### set colors for LS_COLORS
#eval `dircolors ~/.dircolors`

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install --no-install-recommends -y yarn

# ZSH
echo
echo "ZSH install"
echo
sudo apt-get install -y zsh
chsh -s $(which zsh) # change default to zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo
echo "ZSH Plugins install"
echo
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

sudo chmod -R 755 /home/yoyo/.oh-my-zsh/plugins/
touch ~/.z

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

