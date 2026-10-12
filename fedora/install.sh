sudo dnf install fastfetch
sudo dnf install btop
sudo dnf install niri
sudo dnf install noctalia
sudo dnf install neovim
sudo dnf install steam
sudo dnf install blender
curl -fsSL https://mise.run | sh
curl -f https://zed.dev/install.sh | sh
sudo dnf copr enable imput/helium
sudo dnf install helium-bin
sudo dnf install kitty
sudo dnf install zoxide
sudo dnf install eza
sudo dnf install fzf
sudo dnf install bat
sudo dnf install ripgrep 
sudo dnf install fd-find

flatpak remote-modify --no-filter flathub
flatpak install flathub net.davidotek.pupgui2 -y
flatpak install flathub com.obsproject.Studio
