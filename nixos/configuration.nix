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
      ./modules/user.nix               # User account configurations 
    ];

  # System Version  
  system.stateVersion = "25.05"; 

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # User kernel 6.14 for compatibility with nvidia drivers 
  boot.kernelPackages = pkgs.linuxPackages_6_14;

  # Define your hostname.
  networking.hostName = "nixos"; 

  # Enable networking
  networking.networkmanager.enable = true;

  # Automate Garbage collection 
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable experimental features 
  nix.settings.experimental-features =["nix-command" "flakes" ]; 

}
