# This file is for specifying options for installing / configuring desktop apps, separate from the main config file.
{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		arandr
        lxappearance
	];
}
