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
<<<<<<< HEAD
          inherit nixpkgs home-manager;
	  inherit inputs;
=======
          inherit nixpkgs home-manager nix-vscode-extensions;
>>>>>>> 3f00124ab1fc2417e6b3444e69f15d32184d2be6
          system = "x86_64-linux";
          users = ["phygson"];
	  extraModules = [ 
	    inputs.nix-index-database.nixosModules.default 
	  ];
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
<<<<<<< HEAD
    comfyui-nix.url = "github:utensils/comfyui-nix";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
=======
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
>>>>>>> 3f00124ab1fc2417e6b3444e69f15d32184d2be6
  };
}
