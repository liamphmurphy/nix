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
          pkgs.ripgrep
          pkgs.nordic
          # general dev stuff
          pkgs.neovim-nightly
          pkgs.nerdfonts
          pkgs.ranger
          # go stuff
          pkgs.go
          pkgs.golangci-lint
          pkgs.gosec
          pkgs.gopls
          pkgs.revive
          # Docker stuff
          #pkgs.docker
          #pkgs.docker-compose
          pkgs.kubectl
          # Python stuff
          pkgs.python3Full
          pkgs.gnupg1
	  ];
	
    programs.alacritty = {
      enable = true;
      settings = {
        window.opacity = 0.85;
        font.size = 9;
      };
    };

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
	            vimPlugins.vim-go
	            vimPlugins.vim-json
	
	            # language servers
	            vimPlugins.nvim-lspconfig
	
				# treesitter
                #vimPlugins.nvim-treesitter
	
	            # ui things
	            vimPlugins.vim-devicons
	            vimPlugins.nerdtree
	            vimPlugins.nerdtree-git-plugin
	            vimPlugins.onedark-nvim
	
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
	            vimPlugins.cmp-vsnip
	            vimPlugins.vim-vsnip
	            vimPlugins.cmp-cmdline
	            vimPlugins.nvim-cmp
	            vimPlugins.vim-plug
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
			            fuliam = "home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#liam";
                        fuvm = "fuliam && sudo nixos-rebuild switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#vm";
                        fud = "fuliam && sudo nixos-rebuild switch --flake .#desktop";
                        gpu = "git push origin \"$(git branch --show-current)\"";
                        gfgp = "git fetch && git pull origin \"$(git branch --show-current)\"";
                };
        };

        # Git setup
        #programs.git = {
        #        enable = true;
        #        userName = "Liam Murphy";
        #        userEmail = "liam@phmurphy.com";
        #};

}
