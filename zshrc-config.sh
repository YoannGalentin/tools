##
# DO NOT MODIFY THIS FILE DIRECTLY.
##

# Disable annoying visual mode on mouse select
echo 'set mouse-=a' >> ~/.vimrc

# NVM Configuration
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Chrome Configuration
export CHROME_BIN='/usr/bin/google-chrome-stable'

# jenv Configuration
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# dircolors
eval `dircolors ~/.dircolors/dircolors-solarized/dircolors.256dark`

# WSL1
export DOCKER_HOST=tcp://localhost:2375

#Add git duet aliases
alias dci='git duet-commit'
alias drv='git duet-revert'
alias dmg='git duet-merge'
alias drb="git rebase -i --exec 'git duet-commit --amend --reset-author'"
