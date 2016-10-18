#
# Executes commands at the start of an interactive session.
#

#
# Prezto
#
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


#
# Base16 Shell
#
BASE16_SCHEME="tomorrow-night"
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-$BASE16_SCHEME.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL


#
# fzf
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
# To apply the command to FZF's other shortcuts
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"


#
# Lazy loaded version managers
#
rvm() {
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  command rvm "$@"
}
pyenv() {
  eval "$(command pyenv init -)"
  pyenv "$@"
}
nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm "$@"
}


#
# Misc functions
#
# Create and cd in one command
function take() {
  mkdir -p $1
  cd $1
}
# Shortcut to get help for zshbuiltins
zshman() {
  man zshbuiltins | less -p "^       $1"
}
