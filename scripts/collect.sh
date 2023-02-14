# This script puts all of our managed config files in our git directory
# located at ~/.dotfiles and then pushes them to github.

# nvim
cp -r ~/.config/nvim ~/.dotfiles/nvim

# zsh
cp ~/.zshrc ~/.dotfiles/zsh/zshrc

# tmux
cp ~/.tmux.conf ~/.dotfiles/tmux/tmux.conf

# alacritty
cp ~/.config/alacritty/alacritty.yml ~/.dotfiles/alacritty/alacritty.yml

# xinit
cp ~/.xinitrc ~/.dotfiles/xinit/xinitrc

# xmonad
cp ~/.xmonad/xmonad.hs ~/.dotfiles/xmonad/xmonad.hs

# xmobarrc
cp ~/.xmobarrc ~/.dotfiles/xmobar/xmobarrc

# get installed packages
pacman -Qqe > ~/.dotfiles/pacman/pacman.txt

# commit and push
git -C ~/.dotfiles && git add . && git commit -m "$(date) -- Backup" && git push


