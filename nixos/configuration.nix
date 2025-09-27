# Rohaan's NixOS configuration for use on a dual boot laptop but modular for any machine 

# Main configuration file is responsible for importing modules and core system configuration

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix     # Results of the hardware scan 
      ./modules/hardwareSetup.nix      # Specific Settings for my laptop's hardware
      ./modules/programs.nix           # List of Programs and some configuration
      ./modules/desktop.nix            # Desktop Environment settings
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel --> not actually because nvidia drivers don't work on that one 
  boot.kernelPackages = pkgs.linuxPackages_6_14;

  # Define your hostname.
  networking.hostName = "nixos"; 

  # Automate Garbage collection 
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth 
  hardware.bluetooth = { 
    enable = true;
    powerOnBoot = true; 
    settings = { 
      General = { 
        Experimental = true; 
      }; 
    }; 
  }; 

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
