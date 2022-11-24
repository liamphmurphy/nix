# This file is for specifying options for installing / configuring desktop apps, separate from the main config file.
{ config, pkgs, lib, ... }:

{
	# Install NVIDIA drivers.
	services.xserver.videoDrivers = [ "nvidia" ];
	hardware.opengl.enable = true;
	hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
	hardware.opengl.driSupport32Bit = true; # 32-bit libraries to let steam work

}

