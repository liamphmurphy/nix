{ config, pkgs, ... }:

{
	imports =
	[ 
		./linux-desktop.nix
		./linux-pkgs.nix
	];


  	home.username = "liam";
  	home.homeDirectory = "/home/liam";

  	home.stateVersion = "22.05";

  	programs.home-manager.enable = true;

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

        programs.zsh = {
                enable = true;
                oh-my-zsh = {
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

        # Git setup
        #programs.git = {
        #        enable = true;
        #        userName = "Liam Murphy";
        #        userEmail = "liam@phmurphy.com";
        #};

}
