sudo dnf install fastfetch
sudo dnf install btop
sudo dnf install dua-cli
#install mise
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate bash)"' >>~/.bashrc

#install docker

#install eza
sudo dnf install eza

#install zoxide
sudo dnf install zoxide

#copy .bashrc

source ~/.bashrc

sudo dnf install -y neovim python3-neovim
