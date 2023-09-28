#!/bin/zsh

if (("$+commands[eza]")); then
	# Create alias override commands using 'eza'
	alias ls='eza  --icons --group-directories-first '
	alias ll='eza -lh --git'

elif (("$+commands[exa]")); then
	alias ls='exa  --icons --group-directories-first'
	# Use the --git flag if the installed version of exa supports git
	# Related to https://github.com/ogham/exa/issues/978
	if exa --version | grep -q '+git'; then
		alias ll='ls -lh --git'
	else
		alias ll='ls -lh'
	fi
else
	echo "ERROR: 'exa' or 'eza' command not found"
	return
fi

alias la='ll -a'
alias tree='ll --tree --level=2'
