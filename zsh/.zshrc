[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
 HISTFILE=~/.zsh_history

# 
 bindkey "^[[3~" delete-char

 plug "$HOME/.config/zsh/exports.zsh"
 #plug "$HOME/.config/zsh/keybindings.zsh"

# plugins
 plug "esc/conda-zsh-completion"
 plug "zsh-users/zsh-autosuggestions"
 plug "hlissner/zsh-autopair"
 plug "zap-zsh/supercharge"
# plug "zap-zsh/vim"
 plug "zap-zsh/zap-prompt"
 plug "zap-zsh/fzf"
 plug "zap-zsh/exa"
 plug "zsh-users/zsh-syntax-highlighting"


 export PATH="$HOME/.local/bin":$PATH
