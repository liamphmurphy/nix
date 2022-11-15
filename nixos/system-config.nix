# This file is for specifying options for installing / configuring desktop apps, separate from the main config file.
{ config, pkgs, ... }:

{
	# Install NVIDIA drivers.
	services.xserver.videoDrivers = [ "nvidia" ];
	hardware.opengl.enable = true;
	hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
	hardware.opengl.driSupport32Bit = true; # 32-bit libraries to let steam work

	boot.kernelPackages = pkgs.linuxPackages_latest;
	system.autoUpgrade.enable = true;
	system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";

	# Docker setup.
	virtualisation.docker.enable = true;
	virtualisation.docker.enableOnBoot = true;
}

