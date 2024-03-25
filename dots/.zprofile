eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f "$HOME/.work-profile" ]; then
    source "$HOME/.work-profile"
fi

if [ -f "$HOME/.profile-env" ]; then
    source "$HOME/.profile-env"
fi

alias vim="nvim"

