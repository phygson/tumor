{
  pkgs,
  self,
  inputs,
  ...
}: {
  imports = [
    ./systemPackages.nix
  ];

  programs.fish.enable = true;
  programs.direnv.enable = true;
  users.users.phygson = {
    home = "/Users/phygson";
  };
  users.users.gram = {
    home = "/Users/gram";
  };

  system.primaryUser = "phygson";
  system.stateVersion = 6;
}
