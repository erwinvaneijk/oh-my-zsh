#
# Convenience aliases for exa
#

alias ls="exa --group-directories-first"
alias l="exa -lbF --git --group-directories-first"
alias ll="exa -lbGF --git --group-directories-first"
alias llm="exa -lbGF --git --sort=modified --group-directories-first"
alias la="exa -lbhHigUmuSa --time-style=long-iso --git --color-scale --group-directories-first"
alias lx="exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --group-directories-first"
alias lS="exa -1 --group-directories-first"
alias lt="exa --tree --level=2 --group-directories-first"
