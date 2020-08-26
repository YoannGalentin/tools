#!/usr/bin/env bash

#
# setup.sh: run the workstation set-up on Ubuntu's WSL
#

# Update distro
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

echo
echo "Tools install (git, ansible, vim, ...)"
echo
sudo apt-get install -y vim ansible git tig jq

echo
echo "WSL - Fonts"
echo
sudo apt-get install -y powerline fonts-powerline

# NVM
echo
echo "NVM install"
echo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.bashrc
nvm install node

# Yarn
echo
echo "Yarn install"
echo
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install --no-install-recommends -y yarn

# Docker
echo
echo "Docker install"
echo
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER

# ZSH
echo
echo "ZSH install"
echo
sudo apt-get install -y zsh
chsh -s $(which zsh) # change default to zsh

#!/bin/bash
count=$(ls -l ~/.oh-my-zsh 2>/dev/null | wc -l | xargs)
if [[ "$count" -eq "0" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  touch ~/.z
  sed -i .bak 's/^plugins=(.*/plugins=(yarn ansible cloudfoundry docker docker-compose gradle kubectl node nvm zsh-z zsh-autosuggestions)/' ~/.zshrc && rm ~/.zshrc.bak

  echo
  echo "ZSH Plugins install"
  echo
  git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

  sudo chmod -R 755 /home/yoyo/.oh-my-zsh/plugins/
  touch ~/.z

  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  echo
  echo "ZSH - use custom zshrc"
  echo
  cp zshrc-config.sh ~/zshrc-config.sh
  echo "source ~/zshrc-config.sh" > ~/.zshrc

  if [ ! -f ~/.ssh/id_rsa ]; then
    echo
    echo "Creating SSH key for this machine. Please complete the passphrase:"
    echo
    ssh-keygen -t rsa -b 4096
  fi
fi

echo
echo "direnv install"
echo
sudo apt-get install -y direnv

echo
echo "jenv install"
echo
git clone https://github.com/jenv/jenv.git ~/.jenv


echo
echo "dircolors install"
echo
git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors

## GIT
echo
echo "Setting up Git aliases..."
git config --global alias.gst git status
git config --global alias.st status
git config --global alias.di diff
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.cp cherry-pick
git config --global alias.br branch
git config --global alias.sta stash
git config --global alias.llog "log --date=local"
git config --global alias.flog "log --pretty=fuller --decorate"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.lol "log --graph --decorate --oneline"
git config --global alias.lola "log --graph --decorate --oneline --all"
git config --global alias.blog "log origin/master... --left-right"
git config --global alias.ds "diff --staged"
git config --global alias.fixup "commit --fixup"
git config --global alias.squash "commit --squash"
git config --global alias.amendit "commit --amend --no-edit"
git config --global alias.unstage "reset HEAD"
git config --global alias.rum "rebase master@{u}"
