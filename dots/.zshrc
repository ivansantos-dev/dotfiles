plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

. "/opt/homebrew/opt/asdf/libexec/asdf.sh"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

eval "$(starship init zsh)"
