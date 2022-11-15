{ config, ... }:

{

#environment.systemPackages = with pkgs; [
users.users.liam.isNormalUser = true;
home-manager.users.liam = { pkgs, ... }: {
	home.stateVersion = "22.05";
	home.packages = [
		# misc
		pkgs.gitAndTools.gitFull
		pkgs.wget
		pkgs.htop
		pkgs.gcc
		pkgs.cmake
		pkgs.yt-dlp
		# go stuff
		pkgs.go
		pkgs.golangci-lint
		pkgs.gosec
		pkgs.gopls
		# Docker stuff
		pkgs.docker
		pkgs.docker-compose
		pkgs.kubectl
		# ci / cd
		pkgs.act
		# Python stuff
		pkgs.python3Full
		pkgs.gnupg1
	];
};

programs.zsh = {
	enable = true;
	ohMyZsh = {
		enable = true;
		plugins = [ "git" ];
		theme = "robbyrussell";	
	};
	shellAliases = {
		update = "nixos-rebuild switch";
		gt = "go test ./...";
		mkdir = "mkdir -p";
		kc = "kubectl";	
	};
};

# Setup gnupg key services.
services.pcscd.enable = true;
programs.gnupg.agent = {
  enable = true;
  enableSSHSupport = true;
  pinentryFlavor = "curses";
};

}
