sudo pacman -Syu
sudo pacman -S fastfetch btop dua-cli

#install mise
sudo pacman -S mise
echo 'eval "$(mise activate bash)"' >>~/.bashrc

#dev tool install using mise (use -g installs and activates globally)
mise use -g claude
mise use -g herdr
mise use -g python
mise use -g node
mise use -g gh
mise use -g agy

#install docker
sudo pacman -S docker docker-compose
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

#install lazyvim
sudo pacman -S neovim ripgrep fd fzf lazygit
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

#install eza
sudo pacman -S eza

#install zoxide
sudo pacman -S zoxide

#copy .bashrc

source ~/.bashrc
