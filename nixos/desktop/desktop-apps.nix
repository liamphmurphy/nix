# This file is for specifying options for installing / configuring desktop apps, separate from the main config file.
{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# Misc.
		protonvpn-gui
		nextcloud-client
		onlyoffice-bin
		libsForQt5.ark
		zoom-us
		papirus-icon-theme
		gnome.gnome-disk-utility
		gnome.gnome-boxes
		audacity
        gnome.nautilus
		# System settings
		libsForQt5.yakuake
		libsForQt5.kwallet
		pinentry-qt
        lxappearance
		# Funsies stuff
		steam
		obs-studio
		gamemode
		discord
		spotify	
		dolphin-emu
		vlc
	];
}
