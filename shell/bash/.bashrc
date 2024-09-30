eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init bash)"

alias root='cd /'
alias home='cd ~'
alias editor='nvim'
alias ide='code'

alias update='bash ~/.config/dotfiles/bin/update.sh'

unalias brew 2>/dev/null
brewser=$(stat -f "%Su" $(which brew))
alias brew='sudo -Hu '$brewser' brew'
