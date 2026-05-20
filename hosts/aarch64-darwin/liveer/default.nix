{...}: {
  imports = [
    ./systemPackages.nix
  ];

  programs.fish.enable = true;
  programs.direnv.enable = true;

  homebrew = {
    enable = true;
    enableFishIntegration = true;
    casks = [
      "ghostty"
    ];
  };
}
