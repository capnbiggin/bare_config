#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

mkdir -p ~/.config/zsh/plugins

log_info "\nCloning plugin zsh-syntax-highlighting.\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting/
sleep 0.2
log_info "\nCloning plugin zsh-autosuggestions.\n"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions/
sleep 0.2
log_info "\nCloning plugin zsh-you-should-use.\n"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.config/zsh/plugins/zsh-you-should-use/
sleep 0.2
log_info "\nCloning plugin zsh-history-substring-search.\n"
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.config/zsh/plugins/zsh-history-substring-search/
sleep 0.2
log_info "\nCloning plugin pure prompt.\n"
git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/plugins/pure/
