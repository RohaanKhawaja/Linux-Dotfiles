# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configurationix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/programs.nix
      ./modules/hardwareSetup.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
 
  # Enable Hyprland 
  programs.hyprland = { 
  	enable = true; 
  	xwayland.enable = true; 
  }; 

  # Environment sessionVariables
  environment.sessionVariables = {
    # Set cursor theme
    HYPRCURSOR_THEME = "BreezeX-RosePine-Linux";
    HYPRCURSOR_SIZE = "24";
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = "24";
    # Configure Path for ripgrep config
    RIPGREP_CONFIG_PATH = "/home/rohaan/.ripgreprc"; 
  };
  
  # Enable Audio 
  services.pipewire = { 
  	enable = true; 
	  alsa.enable = true; 
	  pulse.enable = true; 
  }; 

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";
  
  # Fix for dual boot time desyncs 
  time.hardwareClockInLocalTime = true; 

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  # Enable Kanata for more advanced keyboard remapping 
  systemd.services.kanata = {
    description = "Kanata keyboard remapper";
    after = [ "graphical.target" ];
    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/kanata --cfg /home/rohaan/.config/kanata/kanata.kbd";
      Type = "simple";
      Restart = "no";
    };
    wantedBy = [ "graphical.target" ];
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rohaan = {
    isNormalUser = true;
    description = "Rohaan Khawaja";
    extraGroups = [ "networkmanager" "wheel" "input" "openrazer" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "rohaan";
   
  # Mount the secondary drive automatically on startup 
  fileSystems."/mnt/massStorage" = { 
  	device = "/dev/disk/by-uuid/58A27D03A27CE6C2"; 
	fsType = "ntfs-3g"; 
	options = [ "rw" "uid=1000" "gid=100" "nofail"]; 
  }; 

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable experimental features 
  nix.settings.experimental-features =["nix-command" "flakes" ]; 

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
