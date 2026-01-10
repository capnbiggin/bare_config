###################################
#            Aliases              #
###################################

# File Aliases
if [[ -x $(command -v eza) ]]; then
  alias ls='eza -al --color=always --group-directories-first --icons=always'  # my preferred listing
  alias la='eza -a --color=always --group-directories-first --icons=always'   # all files and dirs
  alias ll='eza -lah --color=always --group-directories-first --icons=always' # long format
  alias lt='eza -aT --color=always --group-directories-first --icons=always'  # tree listing
fi

# Change Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cdot='cd ~/projects/capndot && printf " \U000F17A9 " && pwd'
alias brain='cd ~/projects/My-Brain && printf " \U000F17A9 " && pwd'
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}

# File system
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# Alias to mod commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -rf'
alias mkdir='mkdir -p'
alias ping='ping -c 5'

# pacman
alias i='sudo pacman -S --noconfirm --needed'       # Install packages
alias yayi='yay -S --noconfirm --needed'            # Install packages
alias s='yay -Ss'                                   # Search packages
alias Syy='sudo pacman -Syy --noconfirm --needed'   # update pacman & packages
alias Syyu='sudo pacman -Syyu --noconfirm --needed' # update pacman & packages
alias ySyu='yay -Syyu --noconfirm --needed'         # update pacman & packages
alias ySyy='yay -Syy --noconfirm --needed'          # update pacman & packages

# Editor
alias n='nvim'
alias sn='sudoedit'
alias t='tmux'
alias n.='nvim .'

# Mis. Aliases
alias c='clear'
alias cf='clear && fastfetch'
alias x='exit'
alias szsh='source ~/.config/zsh/.zshrc'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status' # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

alias linutil='curl -fsSL https://christitus.com/linux | sh'

# bare gti repo alias for managing dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# --------------------------------------------
# .dotfiles repo edit and apply
# --------------------------------------------
ce() {
  $EDITOR $1
  config add $1
  config commit -m "Modified $1"
  config push origin
}

# -------------------------------------------
#  Suffix Aliases - Open Files by Extension
# -------------------------------------------
# Just type the filename to open it with the associated program
alias -s py='$EDITOR'
alias -s md='$EDITOR'
