# This file is for specifying options for installing / configuring desktop apps, separate from the main config file.
{ config, pkgs, ... }:

{
	boot.kernelPackages = pkgs.linuxPackages_latest;
	system.autoUpgrade.enable = true;
	system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";

	# Docker setup.
	virtualisation.docker.enable = true;
	virtualisation.docker.enableOnBoot = true;

	users.users.liam.extraGroups = [ "docker" ];
	users.users.liam.shell = pkgs.zsh;

	# Enable flakes.
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

