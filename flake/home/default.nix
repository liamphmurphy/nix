{ lib, inputs, nixpkgs, home-manager, user, ... };

{
	liam = home-manager.lib.homeManagerConfiguration {
		system = "x86_64-linux";
		username = "${user}";
		homeDirectory = "/home/${user}";
		configuration = import ./home.nix;
		extraSpecialArgs = { inherit inputs user; };
	};
}
