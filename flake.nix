{
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  }:
    import ./lib/mkFlake.nix {
      nixosConfigurations = {
        walter = {
          inherit nixpkgs home-manager;
          system = "x86_64-linux";
          users = ["phygson"];
        };
      };
      darwinConfigurations = {
        liveer = {
          inherit nixpkgs home-manager nix-darwin;
          system = "aarch64-darwin";
          users = ["phygson" "gram"];
          extraDarwinArgs = {inherit self inputs;};
          extraDarwinModules = with inputs; [
            mac-app-util.darwinModules.default
            ./modules/darwin/base
            ./modules/darwin/touchID
            ./modules/mixed/nix
          ];
          extraHomeManagerModules = with inputs; [
            mac-app-util.homeManagerModules.default
          ];
        };
      };
    };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    spoofdpi.url = "github:xvzc/SpoofDPI";
    spoofdpi.inputs.nixpkgs.follows = "nixpkgs";
  };
}
