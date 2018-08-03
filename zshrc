# ALIAS
alias ls='ls -G'
alias ll='ls -lah'
alias "git add"='git add -u'
alias "git add -n"='git add'
alias "git get"='ghq get'

# Common
export EDITOR=vim

# Settings Zsh prompt
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
colors
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
PROMPT='%{$fg[red]%}[%n@%m]%{$reset_color%}'
PROMPT=$PROMPT'${vcs_info_msg_0_} %{${fg[red]}%}%}$%{${reset_color}%} '
RPROMPT='%{${fg[red]}%}[%~]%{${reset_color}%}'

# Settings GoLang
export GOPATH=/Users/masahiro331/work/

# Settings history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history

# Settings fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# Settings Path
PATH=$PATH:/$GOPATH/bin/
PATH=/usr/local/tflint/bin:$PATH
PATH=/usr/local/go/bin/:$PATH
PATH="/opt/homebrew/opt/unzip/bin:$PATH"
PATH="/opt/homebrew/opt/inetutils/libexec/gnubin:$PATH"
export PATH=/opt/homebrew/bin:$PATH

# frepo - cd into the ghq management dir
cr() {
  local dir
  dir=$(ghq list > /dev/null | fzf --reverse +m) &&
    cd $(ghq list -p | grep $dir$)
}
bindkey -e