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
  system.primaryUser = "phygson";
  system.stateVersion = 6;
}
