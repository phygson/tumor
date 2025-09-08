{
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      mac-app-util,
      ...
    }:
    {
      darwinModules = {
        touchID = import ./modules/darwin/touchID;
        base = import ./modules/darwin/base;
        nix = import ./modules/mixed/nix;
      };
      darwinConfigurations."liveer" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit self; };
        modules = [
          self.outputs.darwinModules.touchID
          self.outputs.darwinModules.base
          self.outputs.darwinModules.nix
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.phygson = ./home.nix;
            home-manager.sharedModules = [ mac-app-util.homeManagerModules.default ];
          }
          ./configuration.nix
        ];
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
