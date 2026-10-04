#install neovim
sudo dnf install neovim

#lazyvim config
rm -rf ~/.config/nvim
stow ./../nvim ~ nvim
