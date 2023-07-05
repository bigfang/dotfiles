if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind ';;'  accept-autosuggestion

if command -q zoxide
    zoxide init fish | source
end

