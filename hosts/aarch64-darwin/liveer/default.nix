{
  pkgs,
  self,
  ...
}: {
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
  users.users.gram = {
    home = "/Users/gram";
  };
  # services.yabai.enable = true;
  system.primaryUser = "phygson";
}
