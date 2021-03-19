## .bash_aliases
#
alias h='history'
alias pu='pushd'
alias po='popd'
alias jo='jobs -l'
#
alias ls='ls --color=auto -G'
alias ll='ls -alF -h'
alias la='ls -A'
alias l1='ls -1 -h'
alias l='ls -CF'
#
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
#
alias df='df -h'
alias du='du -h'
# 
alias grep='grep --color=always'
alias mkdir='mkdir -p'
#
alias which='type -a'
alias ctags='/usr/bin/ctags'
#
alias path='echo -e ${PATH//:/\\n}'
alias ..='cd ..'
#
alias g='git'

export LESS='-R'

