# This script is used to setup my working environment on a new machine.


# First, check if the directory ~/.dotfiles exists. If not, clone the repo.
if [ ! -d ~/.dotfiles ]; then
    git clone https://github.com/jdeinum/dotfiles.git ~/.dotfiles
fi

# Next, check if yay is installed. If not, install it.
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install all packages from the package list.
yay -S --needed - < ~/.dotfiles/pacman/packages.txt

# Create symlinks for all files in the dotfiles directory.

# nvim
ln -sf ~/.dotfiles/nvim/ ~/.config/nvim/

# zsh
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

# tmux
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# alacritty
ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# xinit
ln -sf ~/.dotfiles/x11/xinitrc ~/.xinitrc

# xmonad
ln -sf ~/.dotfiles/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

# xmobar
ln -sf ~/.dotfiles/xmobar/xmobarrc ~/.xmobarrc

# install plugins for nvim
nvim +PackerSync +qall

# set zsh as default shell
chsh -s $(which zsh)

# set alacritty as default terminal
sudo export TERMINAL=alacritty

# set nvim as default editor
sudo export EDITOR=nvim
git config --global core.editor nvim

# create a hard link for nvim to /usr/bin/n
sudo ln /usr/bin/nvim /usr/bin/n



