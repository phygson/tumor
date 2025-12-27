{
  pkgs,
  self,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    obsidian
    qbittorrent
    wget
  ] ++ [inputs.spoofdpi.packages.aarch64-darwin.default];

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
  system.stateVersion = 6;
}
