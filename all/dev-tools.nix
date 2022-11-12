environment.systemPackages = with pkgs; [
	# misc
	gitAndTools.gitfull
	wget
	# go stuff
	go
	golangci-lint
	gosec
	gopls
]
