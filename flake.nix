{
	description = "MangoWC on NixOS";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
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
