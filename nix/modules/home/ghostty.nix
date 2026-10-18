{ ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      # ── Look: glass (blur comes from the niri window rule) ──
      background-opacity = 0.85;
      window-padding-x = 6;
      window-padding-y = 6;
      window-padding-balance = true;            # spread leftover pixels evenly
      window-padding-color = "extend-always";   # edges take the nearest cell's color, no strip
      window-decoration = false;                # no title bar / borders from Ghostty
      gtk-titlebar = false;

      # ── Tabs: same colors as the terminal ──
      window-theme = "ghostty";                 # tab bar uses the terminal's background & foreground
      adw-toolbar-style = "flat";               # flat tab bar, no raised gray strip

      # ── Font ──
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;

      # ── Cursor & mouse ──
      cursor-style = "bar";
      cursor-style-blink = false;
      mouse-hide-while-typing = true;

      # ── Copy & paste (plain text only, no colors/HTML) ──
      copy-on-select = true;                    # select → middle-click paste
      clipboard-trim-trailing-spaces = true;    # no junk spaces at line ends
      clipboard-paste-protection = false;       # no popup for multi-line paste

      keybind = [
        # Ctrl+C copies when text is selected, otherwise normal Ctrl+C (stop program)
        "performable:ctrl+c=copy_to_clipboard:plain"
        "ctrl+shift+c=copy_to_clipboard:plain"
        "ctrl+shift+v=paste_from_clipboard"
      ];

      # ── Behaviour ──
      confirm-close-surface = false;            # close without "are you sure?"
      window-inherit-working-directory = true;  # new windows open in the current folder
      shell-integration-features = "cursor,sudo,title";
    };
  };
}
