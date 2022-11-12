# This file is for specifying options for installing / configuring desktop apps, separate from the main config file.
{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# Dev tools (starting with big VS code block)
  		(vscode-with-extensions.override {
    		vscodeExtensions = with vscode-extensions; [
      			bbenoist.nix
      			ms-python.python
      			ms-azuretools.vscode-docker
      			ms-vscode-remote.remote-ssh
			vscodevim.vim
			golang.go
			dracula-theme.theme-dracula
			eamodio.gitlens
    		] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    			];
  		})
		insomnia
		# Misc.
		protonvpn-gui
		nextcloud-client
		onlyoffice-bin
		libsForQt5.ark
		# Funsies stuff
		steam
		obs-studio
		gamemode
		discord
		spotify	
	];
}
