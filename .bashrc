export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
export ERL_AFLAGS="-kernel shell_history enabled"

export PATH="$HOME/.cargo/bin:$HOME/.bin:$PATH"
export PATH="$PATH:$(yarn global bin)"


source /usr/local/opt/asdf/asdf.sh
source /usr/local/etc/bash_completion.d/asdf.bash


alias dots="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

alias emnew="emacs --daemon=emacs"
alias vim='emacsclient -t --socket-name=emacs'
alias emkill="emacsclient -e '(kill-emacs)' --socket-name=emacs"

alias ll='exa --time-style long-iso --git -aglh'
alias lt='exa -T -s type'
alias dc="docker-compose"


export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
export FZF_TMUX=1

# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}
