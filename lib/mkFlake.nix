{nixosConfigurations ? {}, darwinConfigurations ? {}}: {
  nixosConfigurations = builtins.mapAttrs (hostname: value:
    value.nixpkgs.lib.nixosSystem {
      system = value.system;
      modules = [
        ../hosts/${value.system}/${hostname}
        value.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users = builtins.listToAttrs (builtins.map (username: {
              name = username;
              value = ../homes + "/${username}@${hostname}";
            })
            value.users);
        }
      ];
    })
  nixosConfigurations;
  darwinConfigurations = builtins.mapAttrs (hostname: value:
    value.nix-darwin.lib.darwinSystem {
      system = value.system;
      modules = [
        ../hosts/${value.system}/${hostname}
        value.home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.sharedModules = value.extraHomeManagerModules;
          home-manager.users = builtins.listToAttrs (builtins.map (username: {
              name = username;
              value = ../homes + "/${username}@${hostname}";
            })
            value.users);
        }
      ] ++ value.extraDarwinModules;
    })
  darwinConfigurations;
}
