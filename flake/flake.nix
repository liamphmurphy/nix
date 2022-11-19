{
 	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};	

	outputs = { self, nixpkgs, home-manager }: {
		let 
			system = "x86_64-linux";
			pkgs = import nixkpkgs {
				inherit system;
				config.allowUnfree = true;
			};	
			lib = nixpkgs.lib;
		in {
			nixosConfigurations = {
				liam = lib.nixosSystem {
					inherit system;
					nodules = [ ./configuration.nix ];
				};
			};
		};	
		
		hmConfig = {
			liam = home-manager.lib.homeManagerConfiguration {
				inherit system pkgs;
				username = "liam";
				homeDirectory = "/home/liam"
				configuration = {
					imports = [
						../nixpkgs/home.nix
					];
				};
			};
		}; 
  	};
}
