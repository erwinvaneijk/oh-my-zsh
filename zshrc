# Path to your oh-my-zsh configuration.

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
  }

ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="eastwood"
#ZSH_THEME="strug"
ZSH_THEME="bullet-train"

HISTFILE=${HOME}/.zshhistory.${HOST}
BULLETTRAIN_PROMPT_CHAR='»'
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_PROMPT_SEPARATE_LINE=true
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_EXEC_TIME_SHOW=true
BULLETTRAIN_CONTEXT_SHOW=true

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent id_rsa identity id_dsa

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting
# for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in
# ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Excluded: vi-mode.
plugins=(svn gitfast mercurial)
plugins=($plugins python rake cabal)
plugins=($plugins sbt scala gradle mvn)
plugins=($plugins jsontools)
plugins=($plugins ag pip)
plugins=($plugins autoenv)
plugins=($plugins systemd)
plugins=($plugins common-aliases)
plugins=($plugins autojump up z colored-man ssh rsync screen)
plugins=($plugins own_hosts reload namedir dircycle which)
plugins=($plugins history-substring-search)
plugins=($plugins pass)
plugins=($plugins thefuck)
plugins=($plugins gpg-agent)
plugins=($plugins vi-mode)
plugins=($plugins xmonad)
plugins=($plugins adb)
#plugins=($plugins emacs)        # Don't use this for now, we're not really
#                                # using the plugin like it's intended.'
plugins=($plugins themes)
if [ -f /etc/debian_version ]; then
	plugins=($plugins ubuntu)
fi

source $ZSH/oh-my-zsh.sh

if [ -x /usr/bin/gpg2 ]; then
	alias gpg=/usr/bin/gpg2
fi

export MANPAGER="env MAN_PN=1 /usr/local/bin/vim -M +MANPAGER -"
vim() {
    /usr/local/bin/vim $*
}
alias vi=/usr/local/bin/vim

setopt incappendhistory
unsetopt share_history


bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey -M viins '^f' forward-char
bindkey -M viins '^b' backward-char

export KEYTIMEOUT=1

# Make sure we get EURO's, I don't care about the rest.
export LC_MONETARY=en_IE.UTF-8

# Start liquidprompt if we're interactive.
# [[ $- = *i* ]] && source ~/.zsh-liquidprompt/liquidprompt

if [[ "$TERM" == "dumb" ]]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
else
    if [ -e ~/.fzf ]; then
        # Setup fzf
        # ---------
        if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
            export PATH="$PATH:${HOME}/.fzf/bin"
        fi
        [[ $- == *i* ]] && source "${HOME}/.fzf/shell/completion.zsh" 2> /dev/null
        source "${HOME}/.fzf/shell/key-bindings.zsh"
    fi
    if _has fzf && _has ag; then
        export FZF_DEFAULT_OPTS='
            --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
            --color info:108,prompt:109,spinner:108,pointer:168,marker:168
            '
    fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# end of file
