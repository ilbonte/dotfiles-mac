# Load environment, aliases, functions, extras
for file in ~/.zsh_{env,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done

# Initialize fzf if installed
if command -v fzf &>/dev/null; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# Load Starship (redundant safe-guard)
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# Prompt
# export PROMPT='%n@%m %1~ %# '
