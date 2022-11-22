# Setup all of the VMWare goodness

{ config, pkgs, lib, user, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../i3.nix
      ../system-config.nix
      ./vm-apps.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  virtualisation.vmware.guest.enable = true;

  services.openssh = {
    enable = true;
    passwordAuthentication=false; 
    kbdInteractiveAuthentication = false;
  };

  users.users.${user}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBvwcH7xwUzK/+H276zCoG8knqy71FdjX+S5mYnavdVp liam@phmurphy.com"
  ];

  # Set default resolution.
  services.xserver.resolutions = lib.mkOverride 9 [ { x = 2560; y = 1440; } ]; 

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    videoDrivers = [ "vmware" ];
    layout = "us";
    xkbVariant = "";
  };
  hardware.opengl.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "liam";
}
