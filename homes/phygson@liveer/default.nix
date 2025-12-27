{
  config,
  pkgs,
  ...
}: {
  home.username = "phygson";
  home.homeDirectory = "/Users/phygson";
  home.stateVersion = "26.05";
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
      sdpi = "spoofdpi --system-proxy --https-disorder --dns-mode https doh";
    };
    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "pure-fish";
          repo = "pure";
          rev = "b8ae744d8489b66a387ce13ae17005d510333546";
          sha256 = "sha256-2UEIvlm8D11cMkz1GvaSBpaauZALwYZR1Q4Xd7/I4FQ=";
        };
      }
    ];
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
