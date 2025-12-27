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
	  extraDarwinModules = with inputs; [ 
	    mac-app-util.darwinModules.default
	    import ./modules/darwin/base
	    import ./modules/darwin/touchID
	    import ./modules/mixed/nix
	  ];
	  extraHomeManagerModules = with inputs; [ 
	    mac-app-util.homeManagerModules.default 
	    import ./modules/mixed/nix
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
  };
}
