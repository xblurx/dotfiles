ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff8fcd"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^I' autosuggest-accept

alias vi="nvim"
alias rmr="rm -rf"
alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"
alias wgup="wg-quick up ~/.config/wireguard/wg.conf" 
alias wgdown="wg-quick down ~/.config/wireguard/wg.conf" 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

eval $(thefuck --alias)
