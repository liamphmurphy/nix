{ config, pkgs, user, overlays, ... }:

{
	imports =
	[ 
		./linux-desktop.nix
		./linux-pkgs.nix
	];


  	programs.home-manager.enable = true;

        home.packages = [
		# misc
		pkgs.gitAndTools.gitFull
		pkgs.wget
		pkgs.htop
		pkgs.gcc
		pkgs.cmake
		pkgs.yt-dlp
		# general dev stuff
		pkgs.neovim-nightly
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
		# Desktop apps
		pkgs.insomnia
		pkgs.alacritty
		pkgs.firefox
	];
	
	# Note: this is not the neovim from nixpkgs, this is from the neovim-nightly overlay.
	programs.neovim = {
		enable = true;
		package = pkgs.neovim-nightly;
		viAlias = true;
		vimAlias = true;

                extraConfig = builtins.readFile ./nvim/init.vim;

		plugins = with pkgs; [
			# languages
			vimPlugins.vim-nix
			vimPlugins.vim-terraform

            # language servers
            vimPlugins.nvim-lspconfig

			# treesitter
			vimPlugins.nvim-treesitter

			# autocomplete
			vimPlugins.telescope-nvim
            vimPlugins.telescope-coc-nvim
            vimPlugins.telescope-fzf-native-nvim

            # misc
            vimPlugins.vim-floaterm
            vimPlugins.ranger-vim
            vimPlugins.cmp-nvim-lsp
            vimPlugins.cmp-buffer
            vimPlugins.cmp-path
            vimPlugins.cmp-cmdline
            vimPlugins.nvim-cmp
		];
	};

        programs.zsh = {
                enable = true;
                oh-my-zsh = {
                        enable = true;
                        plugins = [ "git" ];
                        theme = "robbyrussell";
                };
                shellAliases = {
                        update = "sudo nixos-rebuild switch";
                        gt = "go test ./...";
                        mkdir = "mkdir -p";
                        kc = "kubectl";
			fuliam = "home-manager switch --flake .#liam";
			fuvm = "fuliam && sudo nixos-rebuild switch --flake .#vm";
                };
        };

        # Git setup
        #programs.git = {
        #        enable = true;
        #        userName = "Liam Murphy";
        #        userEmail = "liam@phmurphy.com";
        #};

}
