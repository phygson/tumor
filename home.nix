{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "phygson";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
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
    };
  };
}

