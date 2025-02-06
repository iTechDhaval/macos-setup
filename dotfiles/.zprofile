[ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -x "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"

if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi