# Dotfiles

[Ref](https://www.atlassian.com/git/tutorials/dotfiles)

1. Clove Repository
```bash
git clone --bare https://github.com/capnbiggin/bare_config.git $HOME/.dotfiles
```

2. Define the alias in the current shell scope:
```bash
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

3. Checkout the actual content from the bare repository to your `$HOME`
```bash
config checkout
```

  - If error:
```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." \ 
| awk {'print $1'} \ 
| xargs -I{} mv {} .config-backup/{}
```

  - Then re-run `git checkout`

4. Set the flag showUntrackedFiles to no on this specific (local) repository
```bash
config config --local status.showUntrackedFiles no
```


| Key bind | Command |
| ------ | ------|
| SUPER+RETURN            |  Terminal (ghostty) |
| SUPER+ALT+RETURN        |  Rofi Launcher |
| SUPER+W                 |  Browser1 (vivialdi) |
| SUPER+CTRL+W            |  Browser2 (google-chrome) |
| SUPER+SHIFT+W           |  Wallpaper Picker (waypaper plus a backend i.e. feh or swww) |
| SUPER+CTRL+RETURN       |  Rofi My Menu Launcher |
| SUPER+SHIFT+RETURN      |  Rofi Menu: Open Project from projects directory |
| SUPER+SHIFT+CTRL+RETURN |  Rofi Menu: Open tmux Session |
| SUPER+SHIFT+ATL+RETURN  |  Rofi Menu: Kill tmux session |
| SUPER+V                 |  Clipboard History |
