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

check_process() {
	pgrep -f "$1" >/dev/null
}
up() {
	local proc_name="tmux"
	if check_process "$proc_name"; then
		byobu popup -E bash
	fi
}

export LESS='-R'

