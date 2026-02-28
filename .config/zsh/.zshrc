# ~/.config/zsh/.zshrc

# ------------------------------- #
# If not interactive. Do nothing. #
# ------------------------------- #
[[ $- != *i* ]] && return

# ------------------------------------------ #
# source global shell alias & variable files #
# ------------------------------------------ #
[ -f "$HOME/.config/shell/aliases.sh" ] && source "$HOME/.config/shell/aliases.sh"

# ---------------------- #
# Checking for fastfetch #
# ---------------------- #
[ -f /usr/bin/fastfetch ] && fastfetch

# -------------------- #
# Enviroment Variables #
# -------------------- #
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin"

if command -v nvim &> /dev/null; then
  export EDITOR="nvim"
elif command -v vim &. /dev/null; then
  export EDITOR="vim"
else
  export EDITOR="nano"
fi
export SUDO_EDITOR="$EDITOR"
export BAT_THEME=ansi
export MANPAGER='nvim +Man!'

# --------------- #
# Command history #
# --------------- #
HISTFILE="$XDG_CACHE_HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt hist_ignore_space     # Don't save when prefixed with a space
setopt hist_ignore_all_dups  # Don't save duplicate lines
setopt hist_save_no_dups     # Don't save duplicate lines
setopt hist_ignore_dups      # Don't save duplicate lines
setopt hist_find_no_dups     # Don't show duplicates
setopt sharehistory          # Share history between sessins
setopt appendhistory         # Appends history insted of overwriting
unsetopt prompt_sp           # Don't autoclean blank line

# -------- #
# Keybinds #
# -------- #
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ------------------ #
# Completion styling #
# ------------------ #
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

# ------------ #
# Load Modules #
# ------------ #
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# ------ #
# Prompt #
# ------ #
if [[ -x $(command -v starship) ]]; then
  eval "$(starship init zsh)"
else [[ -x $(command -v oh-my-posh) ]]
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/myprompt.toml)"
else [[ -d $HOME/.config/zsh/plugins/pure ]]
  PURE_GIT_PULL=0

  fpath+=($HOME/.config/zsh/plugins/pure)

  autoload -U promptinit; promptinit
  prompt pure
fi

#################################
#          Sources              #
#################################

# -------------------------------------------- #
# Set up fzf key bindings and fuzzy completion #
# -------------------------------------------- #
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
  export FZF_DEFAULT_OPTS=" \
    --tmux 100%,80% --layout reverse --preview='bat --color=always {}' --border \
    --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
    --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
    --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
    --color=selected-bg:#45475A \
    --color=border:#313244,label:#CDD6F4"
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

# ------------- #
# set up zoxide #
# ------------- #
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# ----------- #
# zsh plugins #
# ----------- #
[ -d $HOME/.config/zsh/plugins/zsh-syntax-highlighting ] && source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -d $HOME/.config/zsh/plugins/zsh-autosuggestions ] && source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -d $HOME/.config/zsh/plugins/plugins/zsh-history-substring-search ] && source $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -d $HOME/.config/zsh/plugins/zsh-you-should-use ] && source $HOME/.config/zsh/plugins/zsh-you-should-use/zsh-you-should-use.plugin.zsh

# ------------------------ #
# Start terminal with Tmux #
# ------------------------ #
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t mySession || tmux new -s mySession
fi

# ---- #
# yazi #
# ---- #
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# --- #
# NVM #
# --- #
export NVM_DIR="$HOME/.config//nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
