#
# Convenience aliases for eza
#

alias ls="eza --group-directories-first"
alias l="eza -lbF --git --group-directories-first"
alias ll="eza -lbGF --git --group-directories-first"
alias llm="eza -lbGF --git --sort=modified --group-directories-first"
alias la="eza -lbhHigUmuSa --time-style=long-iso --git --color-scale --group-directories-first"
alias lx="eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --group-directories-first"
alias lS="eza -1 --group-directories-first"
alias lt="eza --tree --level=2 --group-directories-first"
