## .zprofile
#
#

## pyenv path
#
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

export PATH="$HOME/.nodebrew/current/bin:$PATH"

#export PATH="/usr/local/opt/ruby/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/ruby/lib"
#export CPPFLAGS="-I/usr/local/opt/ruby/include"
#export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"


##if command -v rbenv 1>/dev/null 2>&1; then
##    eval "$(rbenv init -)"
##fi
##
##export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
##export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/readline/lib"
##export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/readline/include"
##export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig"
##
##export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
##
#
autoload -U compinit
compinit

##
#
autoload -Uz colors
colors


export PATH="$HOME/.cargo/bin:$PATH"

## opencv@3 installed with brew install opencv@3
#
export CPLUS_INCLUDE_PATH="/usr/local/opt/opencv@3/include/:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="/usr/local/opt/opencv@3/lib/:$LIBRARY_PATH"
export PATH="/usr/local/opt/opencv@3/bin:$PATH"
