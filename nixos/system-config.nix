# This file is for specifying options for installing / configuring desktop apps, separate from the main config file.
{ config, pkgs, ... }:

{
	# Install NVIDIA drivers.
	#services.xserver.videoDrivers = [ "nvidia" ];
	#hardware.opengl.enable = true;
	#hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

	boot.kernelPackages = pkgs.linuxPackages_latest;
	system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";

	# Docker setup.
	virtualisation.docker.enable = true;
	virtualisation.docker.enableOnBoot = true;
}

