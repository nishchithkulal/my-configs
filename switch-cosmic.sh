sudo snapper -c root create -d "before removing caelestia and kde"
sudo pacman -Sw cosmic

chsh -s /bin/bash
sudo chsh -s /bin/bash root
echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.bashrc
echo 'command -v mise >/dev/null && eval "$(mise activate bash)"' >>~/.bashrc

sudo pacman -D --asexplicit $(pacman -Qq zed zen-browser zen-browser-bin firefox networkmanager bluez bluez-utils pipewire pipewire-pulse pipewire-audio pipewire-alsa pipewire-jack wireplumber pavucontrol wl-clipboard gnome-keyring xdg-desktop-portal-gtk noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd curl git jq lazygit bat ripgrep eza zoxide direnv xdg-user-dirs 2>/dev/null)

sudo pacman -Rnsu $(pacman -Qq | grep -E '^(caelestia|quickshell|hypr|fish|foot|xdg-desktop-portal-hyprland|cachyos-(fish-config|hyprland|micro))') $(pacman -Qq fastfetch btop micro thunar starship adw-gtk-theme papirus-icon-theme papirus-folders qtengine darkly-bin polkit-gnome cliphist trash-cli ydotool uwsm 2>/dev/null)

pacman -Qq | grep -E '^(caelestia|quickshell|hypr|fish|foot)'

rm -rf ~/.config/{caelestia,quickshell,hypr,fish,foot,fastfetch,btop,micro,Thunar,uwsm,starship.toml} ~/.local/share/{caelestia,fish,hyprland} ~/.local/state/{caelestia,quickshell} ~/.cache/{caelestia,quickshell,hyprland}
