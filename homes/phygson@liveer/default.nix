{ config, pkgs, ... }:

{
  home.username = "phygson";
  home.homeDirectory = "/Users/phygson";
  home.stateVersion = "25.05";
  programs.kitty = {
    enable = true;
    themeFile = "GruvboxMaterialDarkSoft";
    settings = {
      font_size = 14.0;
      macos_quit_when_last_window_closed = true;
      shell = "/etc/profiles/per-user/phygson/bin/fish -i";
    };
  };
  programs.fish = {
    enable = true;
    functions = {
      cdnix = "cd /etc/nix-darwin";
      dswitch = "sudo darwin-rebuild switch";
      sdpi = "spoofdpi -dns-addr 9.9.9.9 -enable-doh -window-size=1";
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
