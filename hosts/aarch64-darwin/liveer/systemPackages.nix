{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    obsidian
    qbittorrent
    wget
    alejandra
    keka
  ];
}
