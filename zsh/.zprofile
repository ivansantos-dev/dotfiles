eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f "$HOME/.work-profile" ]; then
    source "$HOME/.work-profile"
fi

alias vim="nvim"

