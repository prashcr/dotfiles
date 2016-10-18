# Author: Prashanth Chandra <coolshanth94@gmail.com>
#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


# Version dotfiles
alias config='/usr/bin/git --git-dir=/Users/prashanthcr/.cfg/ --work-tree=/Users/prashanthcr'
alias ssh='TERM=xterm-256color ssh'
alias st=subl
alias vi=vim


export ANDROID_HOME="usr/local/opt/android-sdk"
export GOBIN=$GOPATH/bin
export GOPATH=$HOME/code/Go
export NVM_DIR="/Users/prashanthcr/.nvm"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/bin/gradle
export PATH=$PATH:/usr/local/opt/android-sdk
export PATH=`pwd`/depot_tools:"$PATH"
export PG_CONNECTION_STRING="pg://prashanthcr@localhost:5432/prashanthcr"
