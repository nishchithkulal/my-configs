{ config, ... }:
let
  # Same tint as the terminal: black at 75% (match background-opacity below)
  tint = "rgba(0, 0, 0, 0.75)";
in
{
  # Stylesheet for Ghostty's GTK parts (header + tab bar)
    xdg.configFile."ghostty/tabs.css".text = ''
    /* libadwaita color variables (old and new style) */
    @define-color headerbar_bg_color ${tint};
    @define-color headerbar_backdrop_color ${tint};
    :root {
      --headerbar-bg-color: ${tint};
      --headerbar-backdrop-color: ${tint};
      --headerbar-shade-color: transparent;
    }

    /* window and top bar: no solid layers underneath */
    window, window.background, toolbarview {
      background-color: transparent;
    }
    toolbarview > .top-bar,
    headerbar,
    tabbar,
    tabbar > revealer > box {
      background-color: ${tint};
      background-image: none;
      box-shadow: none;
      border: none;
    }

    /* tabs */
    tabbar tab { color: #dddddd; background-color: transparent; }
    tabbar tab:selected { background-color: rgba(255, 255, 255, 0.08); }
    tabbar tab:hover { background-color: rgba(255, 255, 255, 0.05); }
  '';

  programs.ghostty = {
    enable = true;
    settings = {
      # ── Look: same as kitty (blur comes from the niri window rule) ──
      background = "#000000";
      foreground = "#dddddd";
      background-opacity = 0.75;                # keep equal to the tint above and kitty.conf
      window-padding-x = 6;
      window-padding-y = 0;
      window-padding-balance = true;
      window-padding-color = "extend-always";
      window-decoration = false;
      gtk-titlebar = false;

      # ── Tabs / header ──
      window-theme = "ghostty";
      adw-toolbar-style = "flat";
      gtk-custom-css = "${config.xdg.configHome}/ghostty/tabs.css";

      # ── Font ──
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;

      # ── Cursor & mouse ──
      cursor-style = "bar";
      cursor-style-blink = false;
      mouse-hide-while-typing = true;

      # ── Copy & paste (plain text only, no colors/HTML) ──
      copy-on-select = true;
      clipboard-trim-trailing-spaces = true;
      clipboard-paste-protection = false;

      keybind = [
        "performable:ctrl+c=copy_to_clipboard:plain"
        "ctrl+shift+c=copy_to_clipboard:plain"
        "ctrl+shift+v=paste_from_clipboard"
      ];

      # ── Behaviour ──
      confirm-close-surface = false;
      window-inherit-working-directory = true;
      shell-integration-features = "cursor,sudo,title";
    };
  };
}
