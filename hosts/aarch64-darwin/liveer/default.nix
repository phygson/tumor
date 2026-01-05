{...}: {
  imports = [
    ./systemPackages.nix
  ];

  programs.fish.enable = true;
  programs.direnv.enable = true;
}
