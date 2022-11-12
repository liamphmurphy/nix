{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
	# misc
	gitAndTools.gitFull
	wget
	# go stuff
	go
	golangci-lint
	gosec
	gopls
	# Docker stuff
	docker
	docker-compose
	# Python stuiff
	python3Full
];

programs.zsh = {
	enable = true;
	ohMyZsh = {
		enable = true;
		plugins = [ "git" "thefuck" ];
		theme = "robbyrussell";	
	};
};

users.defaultUserShell=pkgs.zsh;

}
