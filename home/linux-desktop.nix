
{ config, lib, pkgs, ... }:

let
	mod = "Mod4";
in {
	home.packages = [
		pkgs.rofi
		pkgs.i3lock
		pkgs.i3status-rust
		pkgs.dmenu
	];
    xsession.enable = true;
	xsession.windowManager.i3 = {
		enable = true;
		package = pkgs.i3-gaps;
		config = {
			modifier = mod;
            defaultWorkspace = "1";
			
			keybindings = lib.mkOptionDefault {
				# Window Actions
				"Ctrl+q" = "kill";

				# Launch applications
				"${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
				"${mod}+Shift+f" = "exec ${pkgs.firefox}/bin/firefox";
			};

			bars = [{
				position = "bottom";
				statusCommand = "${pkgs.i3status}/bin/i3status";
				colors = {
				  background = "#1B0E13";
				  statusline = "#c0caf5";
				  separator = "#3b4261";
				  focusedWorkspace = {
				    background = "#772D08";
				    border = "#3b4261";
				    text = "#f9f9f9";
				  };
				  activeWorkspace = {
				    background = "#353836";
				    border = "#595B5B";
				    text = "#FDF6E3";
				  };
				  inactiveWorkspace = {
				    background = "#222D31";
				    border = "#595B5B";
				    text = "#EEE8D5";
				  };
				  bindingMode = {
				    background = "#2C2C2C";
				    border = "#16a085";
				    text = "#F9FAF9";
				  };
				  urgentWorkspace = {
				    background = "#FDF6E3";
				    border = "#16a085";
				    text = "#E5201D";
				  };
				};
		      }];
		};
		
	};
	
	programs.i3status = {
	    enable = true;

	    general = {
	      colors = true;
	      color_good = "#c0caf5";
	      color_bad = "#f7768e";
	      color_degraded = "#ff9e64";
	    };

	    modules = {
	      ipv6.enable = false;
	      "wireless _first_".enable = false;
	      "battery all".enable = false;
	    };
	};
}
