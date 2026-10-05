sudo systemctl stop display-manager
sudo pacman -S --needed cosmic
sudo systemctl enable --force cosmic-greeter.service
sudo pacman -Rnsu $(pacman -Qgq plasma kde-applications 2>/dev/null | sort -u) $(pacman -Qq | grep -E '^cachyos-.*(kde|plasma|sddm)') $(pacman -Qq sddm 2>/dev/null)
pacman -Qdtq | sudo pacman -Rns -

K_CONFIG='kde* kwin* plasma* kglobalshortcutsrc khotkeysrc kscreenlockerrc ksmserverrc kcm* kwalletrc baloo* powerdevil* powermanagementprofilesrc systemsettingsrc kiorc kioslaverc ktimezonedrc kactivitymanagerd* kxkbrc konsole* dolphinrc kate* spectaclerc arkrc gwenview* okular* breezerc klipperrc krunnerrc klaunchrc ksplashrc ktrashrc kservicemenurc kconf_updaterc kmixrc discoverrc drkonqirc bluedevilglobalrc Trolltech.conf xsettingsd KDE gtkrc gtkrc-2.0 qt5ct qt6ct qtengine Kvantum darklyrc'
cd ~/.config && ls -d $K_CONFIG 2>/dev/null

cd ~/.config && rm -rf $K_CONFIG

K_SHARE='kded5 kded6 kwalletd kactivitymanagerd baloo plasma plasmashell plasma-systemmonitor plasma_icons kscreen konsole dolphin kate kxmlgui5 knewstuff3 klipper kcookiejar kpeoplevcard ktexteditor kwin RecentDocuments user-places.xbel user-places.xbel.bak user-places.xbel.tbcache sddm color-schemes aurorae kdenlive okular gwenview ark'
cd ~/.local/share && ls -d $K_SHARE 2>/dev/null

cd ~/.local/share && rm -rf $K_SHARE

rm -rf ~/.cache/{ksycoca6*,plasma*,kwin,krunner*,konsole,dolphin,kate*,icon-cache.kcache,systemsettings,ksplash*,kscreen*,discover,kio_http,drkonqi,baloo,fish,foot,hyprland,quickshell,caelestia}
rm -f ~/.gtkrc-2.0

find ~/.config ~/.local/share ~/.local/bin -maxdepth 2 -xtype l -delete 2>/dev/null
sudo rm -rf /var/lib/sddm /var/lib/plasmalogin /etc/sddm.conf /etc/sddm.conf.d

ls ~/.config/autostart ~/.config/systemd/user 2>/dev/null

cd ~/.config && rm -rf kmenueditrc session menus libaccounts-glib cava fuzzel gpu-screen-recorder xfce4
pacman -Qi $(pacman -Qqe) | awk '/^Name/{n=$3} /^Depends On/ && /kcoreaddons|kio|kxmlgui|kconfigwidgets|ki18n|kirigami|libplasma/{print n}'
sudo pacman -Rnsu ark dolphin ffmpegthumbs filelight frameworkintegration gwenview haruna isoimagewriter kate kcalc kdeconnect kdegraphics-thumbnailers kdialog kio-admin konsole kwalletmanager partitionmanager mainstream-quickshell-git
sudo pacman -Rns $(pacman -Qdtq)
rm -rf ~/.config/haruna

reboot
