sudo dnf install fastfetch
sudo dnf install btop
sudo dnf install dua-cli
#install mise
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate bash)"' >>~/.bashrc

#dev tool install using mise
mise install claude
mise install herdr
mise install python
mise install node
mise install gh
mise install agy

#activate mise tools globally
mise use -g claude
mise use -g herdr
mise use -g python
mise use -g node
mise use -g gh
mise use -g agy

#install docker

#install lazyvim

#install lazyvim

#install eza
sudo dnf install eza

#install zoxide
sudo dnf install zoxide

#copy .bashrc

source ~/.bashrc

sudo dnf install -y neovim python3-neovim
