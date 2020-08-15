#!/usr/bin/env zsh


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# export CHROME_BIN='/usr/bin/chromium-browser'
export CHROME_BIN='/usr/bin/google-chrome-stable'

export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin"


