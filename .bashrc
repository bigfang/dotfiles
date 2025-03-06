export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
PATH=$HOME/.bin:$PATH

# PATH=$HOME/.cargo/bin:$PATH
export RUST_WITHOUT=rust-docs


# tools: fzf skim ripgrep fd eza bat
alias dot='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

alias emnew='emacs --daemon=emacs'
alias emup="emacs --eval '(paradox-upgrade-packages)' -u `whoami` --batch"
alias vim='emacsclient -t --socket-name=emacs'
alias emkill="emacsclient -e '(kill-emacs)' --socket-name=emacs"

alias ls='eza'
alias ll='eza --time-style long-iso --git -aglh'
alias lt='eza -T -s type'

alias dc='docker compose'


export ERL_AFLAGS="-kernel shell_history enabled"


# return if in non-interactive shell
[[ $- != *i* ]] && return


[[ -x $(command -v nvim) ]] && alias vi=nvim
[[ -x $(command -v dotnet) ]] && alias dnt=dotnet
[[ -f ~/.bin/etc/skimrc ]] && . ~/.bin/etc/skimrc
[[ -n "$WORKING_ENV"  ]] && [[ -f ~/.bin/etc/gitrc ]] && . ~/.bin/etc/gitrc

