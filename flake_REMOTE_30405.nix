{
  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nix-darwin,
    nix-vscode-extensions,
    ...
  }:
    import ./lib/mkFlake.nix {
      nixosConfigurations = {
        walter = {
          inherit nixpkgs home-manager nix-vscode-extensions;
          system = "x86_64-linux";
          users = ["phygson"];
        };
      };
      darwinConfigurations = {
        liveer = {
          inherit nixpkgs home-manager nix-darwin;
          system = "aarch64-darwin";
          users = ["phygson"];
          overlays = [nix-vscode-extensions.overlays.default];
          extraDarwinArgs = {
            inherit self inputs;
            pkgsStable = import nixpkgs-stable {system = "aarch64-darwin";};
          };
          extraDarwinModules = with inputs; [
            mac-app-util.darwinModules.default
            ./modules/darwin/base
            ./modules/darwin/touchID
            ./modules/mixed/nix
          ];
          extraHomeManagerModules = with inputs; [
            mac-app-util.homeManagerModules.default
          ];
          stateVersion = 6;
        };
      };
    };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };
}
