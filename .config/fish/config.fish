if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind ';;'  accept-autosuggestion

if command -q mise
    mise activate fish | source
end

if command -q zoxide
    zoxide init fish | source
end

