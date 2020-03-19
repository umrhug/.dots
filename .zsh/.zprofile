## .zprofile
#
#

## pyenv path
#
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="$HOME/.nodebrew/current/bin:$PATH"


##
#
autoload -U compinit
compinit

##
#
autoload -Uz colors
colors


export PATH="$HOME/.cargo/bin:$PATH"
