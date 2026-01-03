{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      neovim
      git
      obsidian
      qbittorrent
      wget
    ]
    ++ [inputs.spoofdpi.packages.aarch64-darwin.default];
}
