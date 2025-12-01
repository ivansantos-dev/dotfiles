eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f "$HOME/.zprofile-work" ]; then
    source "$HOME/.zprofile-work"
fi

if [ -f "$HOME/.profile-env" ]; then
    source "$HOME/.profile-env"
fi

alias vim="nvim"

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
