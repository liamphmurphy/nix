# This file is for specifying options for installing / configuring desktop apps, separate from the main config file.
{ config, pkgs, user, ... }:

{
	boot.kernelPackages = pkgs.linuxPackages_latest;
	system.autoUpgrade.enable = true;
	system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";

	# Docker setup.
	virtualisation.docker.enable = true;
	virtualisation.docker.enableOnBoot = true;

	# Enable flakes.
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
	# Setup user.
	users.users.${user} = {
		isNormalUser = true;
		extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" "docker" ];
		shell = pkgs.zsh;
	};
	
	# Setup timezone.
	time.timeZone = "America/Los_Angeles";
}

