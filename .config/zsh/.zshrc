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
  export MANPAGER='nvim +Man!'
elif command -v vim &. /dev/null; then
  export EDITOR="vim"
else
  export EDITOR="nano"
fi
export SUDO_EDITOR="$EDITOR"
export BAT_THEME=ansi

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
# Navigation
bindkey '^A' beginning-of-line           # Ctrl+A
bindkey '^E' end-of-line                 # Ctrl+E
bindkey '^[[1;5C' forward-word          # Ctrl+Right
bindkey '^[[1;5D' backward-word         # Ctrl+Left
bindkey '^[[H' beginning-of-line        # Home
bindkey '^[[F' end-of-line              # End
bindkey '^[[3~' delete-char             # Delete
bindkey '^K' kill-line                  # Kill to end of line
bindkey '^U' kill-whole-line            # Kill entire line

# History navigation
bindkey '^P' up-line-or-history         # Ctrl+P (like Vim)
bindkey '^N' down-line-or-history       # Ctrl+N (like Vim)
bindkey '^S' history-incremental-search-forward  # Ctrl+S

# Custom: FZF history search on Ctrl+R
bindkey '^R' fzf_history_search


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

######################
#       Prompt       #
######################
if [[ -x $(command -v starship) ]]; then
  eval "$(starship init zsh)"
elif [[ -x $(command -v oh-my-posh) ]]; then
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

# fzf
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

function fzf_history_search() {
  local selected
  selected=$(fc -rl 1 | awk '{$1=""; print substr($0,2)}' | 
    fzf --height 40% --layout=reverse --border --color=border:blue \
        --preview='echo {}' --preview-window=down:3:wrap)
  LBUFFER=$selected
  zle reset-prompt
}
zle -N fzf_history_search
bindkey '^R' fzf_history_search

# fzf end --------------------------------------------------

# zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi
# zoxide end -----------------------------------------------

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
#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux attach -t mySession || tmux new -s mySession
#fi

# yazi 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
# yazi end
# ---------------------------------------------------------

# nvm
export NVM_DIR="$HOME/.config//nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm end ---------------------------------------------------

# pnpm
export PNPM_HOME="/home/capn/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end ----------------------------------------------------
