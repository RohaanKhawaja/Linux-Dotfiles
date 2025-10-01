# Nix configuration for a hyprland desktop setup
{ config, pkgs, ... }:

{

  # Enable hardware acceleration
  hardware.graphics = { 
    enable = true; 
  }; 

  # Enable Hyprland 
  programs.hyprland = { 
  	enable = true; 
  	xwayland.enable = true; 
  }; 

  # Enable Audio 
  services.pipewire = { 
  	enable = true; 
	  alsa.enable = true; 
	  pulse.enable = true; 
     jack.enable = true; 
  }; 

  # Environment sessionVariables
  environment.sessionVariables = {
    # Set cursor theme
    HYPRCURSOR_THEME = "BreezeX-RosePine-Linux";
    HYPRCURSOR_SIZE = "24";
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = "24";

    RIPGREP_CONFIG_PATH = "/home/rohaan/.ripgreprc"; # Configure Path for ripgrep config
    STEAM_RUNTIME = "1"; 

  };

  # Hyprland Ecosystem apps and utilities
  environment.systemPackages = with pkgs; [ 
    kitty                               # Terminal Emulator 
    hyprshot                            # Screenshot Utility
    hyprlock                            # Lockscreen Utility
    hyprpaper                           # Wallpaper Utility 
    hypridle                            # Idling Utility
    hyprshade                           # Screen colour adjustment
    hyprcursor                          # Cursor Utility
    rose-pine-cursor                    # Cursor theme
    wofi                                # App Launcher 
    waybar                              # Status Bar 
    networkmanagerapplet                # Network Applet 
    swaynotificationcenter              # Notification Utility
    wl-clipboard                        # Clipboard Backend
    cliphist                            # Clipboard History 
  ];

}   
