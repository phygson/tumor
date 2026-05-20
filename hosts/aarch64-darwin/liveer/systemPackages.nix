{
  pkgs,
  pkgsStable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      neovim
      git
      obsidian
      wget
      alejandra
      keka
      nh
      gh
      drawio
      nixd
    ])
    ++ (with pkgsStable; [
      zeal
      qbittorrent
    ]);
}
