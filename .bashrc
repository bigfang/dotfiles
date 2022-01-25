export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
PATH=$HOME/.bin:$PATH

# [[ -x "$(command -v yarn)" ]] && PATH=$(yarn global bin):$PATH
# PATH=$HOME/.cargo/bin:$PATH


export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac --with-ssl=$(brew --prefix openssl@1.1)"
export KERL_BUILD_DOCS="yes"

. $(brew --prefix asdf)/libexec/asdf.sh
. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

# tools: fzf sk ripgrep fd exa bat
alias dot='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

alias emnew='emacs --daemon=emacs'
alias vim='emacsclient -t --socket-name=emacs'
alias emkill="emacsclient -e '(kill-emacs)' --socket-name=emacs"

alias dc='docker compose'

alias ll='exa --time-style long-iso --git -aglh'
alias lt='exa -T -s type'


export ERL_AFLAGS="-kernel shell_history enabled"


# return if in non-interactive shell
[[ $- != *i* ]] && return


[[ -f ~/.bin/skimrc ]] && . ~/.bin/skimrc
[[ -n "$WORKING_ENV"  ]] && [[ -f ~/.bin/gitrc ]] && . ~/.bin/gitrc

[[ -x "$(command -v zoxide)" ]] && eval "$(zoxide init bash)"

