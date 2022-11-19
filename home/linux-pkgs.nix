
{ config, lib, pkgs, ... }:

{
	home.packages = [
		pkgs.redshift	
		pkgs.pavucontrol
	];
}
