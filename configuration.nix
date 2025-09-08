{ pkgs, self, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    git
    spoofdpi
  ];

  programs.fish.enable = true;
  programs.direnv.enable = true;
  users.users.phygson = {
    home = "/Users/phygson";
  };
}
