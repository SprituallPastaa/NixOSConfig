{
	description = "MangoWC on NixOS";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
    };
		matugen = {
			url = "github:InioX/matugen";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs:
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
	in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				system = system;
        specialArgs = { inherit inputs; };
				modules = [
					./configuration.nix
					home-manager.nixosModules.home-manager
					{
            home-manager.extraSpecialArgs = { inherit inputs; };
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.emil = import ./home.nix;
						home-manager.backupFileExtension = "backup";
					}
				];
			};
		};
	};
}
