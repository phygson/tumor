{ pkgs, self, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    git
    spoofdpi
    obsidian
    qbittorrent
    wget
  ];

  programs.fish.enable = true;
  programs.direnv.enable = true;
  users.users.phygson = {
    home = "/Users/phygson";
  };
  # services.yabai.enable = true;
  system.primaryUser = "phygson";
}
