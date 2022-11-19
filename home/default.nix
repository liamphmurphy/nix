{ lib, inputs, pkgs, nixpkgs, home-manager, user, ... }:

{
	liam = home-manager.lib.homeManagerConfiguration {
		pkgs = pkgs;
		modules = [
			./home.nix
			{
				home = {
					username = "${user}";
					homeDirectory = "/home/${user}";
					stateVersion = "22.11";
				};
			}
		];
	};
}
