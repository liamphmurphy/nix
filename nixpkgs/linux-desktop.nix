
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
			
			keybindings = lib.mkOptionDefault {
				# Window Actions
				"Ctrl+q" = "close window";
			};

		};
		
	};
}
