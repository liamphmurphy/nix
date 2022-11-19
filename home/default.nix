{ lib, inputs, pkgs, nixpkgs, home-manager, user, overlays, ... }:

{
	liam = home-manager.lib.homeManagerConfiguration {
		pkgs = pkgs;
		modules = [
			./home.nix
			{ nixpkgs.overlays = overlays; }
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
