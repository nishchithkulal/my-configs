{ pkgs, ... }:
{
  # Compositor
  programs.niri = {
    enable = true;

    # niri-session with the non-deprecated import-environment
    # (explicit variable list; skips gawk's own AWKPATH/AWKLIBPATH)
    package = pkgs.symlinkJoin {
      name = "niri-fixed-session";
      paths = [ pkgs.niri ];
      inherit (pkgs.niri) passthru meta;
      postBuild = ''
        rm $out/bin/niri-session
        sed "s#systemctl --user import-environment\$#systemctl --user import-environment \$(awk 'BEGIN{for(v in ENVIRON) if (v != \"AWKPATH\" \&\& v != \"AWKLIBPATH\") print v}' | grep -E '^[A-Za-z_][A-Za-z0-9_]*\$')#" \
          ${pkgs.niri}/bin/niri-session > $out/bin/niri-session
        chmod +x $out/bin/niri-session
      '';
    };
  };
}
