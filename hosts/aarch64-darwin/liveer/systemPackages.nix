{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    obsidian
    qbittorrent
    wget
    alejandra
  ];
}
