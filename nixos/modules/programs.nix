# List of all programs for desktop use 
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    
    # Terminal Tools 
    neovim              # Text Editor 
    tmux                # Terminal Multiplexer 
    stow                # Dotfiles Management 
    git                 # Git 
    zoxide              # Better CD 
    fzf                 # Fuzzy find 
    tree                # Tree Listing 
    btop                # System Resource Monitor
    nvtopPackages.v3d   # GPU CLI Monitor 
    fastfetch           # System Specs 
    starship            # Custom Prompt 
    ripgrep             # Better grep
    bat                 # Better file preview 

    # Silly terminal Tools 
    fortune             # Fortune cookies
    cowsay              # Funny Cow
    tt                  # Terminal Typing Test
    cmatrix             # Matrix Effect 
    cava                # Waveform  
    
    # System Utilities 
    ntfs3g              # NTFS Drive Utility 
    brightnessctl       # Brightness Controls 
    playerctl           # Multimedia Controls 
    pavucontrol         # Volume Control 
    efibootmgr          # EFI Boot Manager 
    kanata              # Keyboard Remapping 
    lshw                # Shows Bus ID Values 

    # Compilers
    gcc                 # C/C++ Compiler
    llvmPackages.clang  # C/C++ Compiler (Clang/LLVM alternative)
    python3             # Python Interpreter
    texliveFull         # LaTeX (pdflatex, bibtex, etc.)
    openjdk17           # Java Compiler (JDK)
    zig                 # Zig compiler 

    # Build Systems
    cmake               # Cross-platform build system
    meson               # Build system
    ninja               # Build system backend

    # Python Extras
    python3Packages.pip                 # Python package manager
    python3Packages.virtualenv          # Virtual environments

    # Optional MATLAB Alternative
    octave              # GNU Octave (MATLAB-like)

    # GUI/Desktop Apps 
    firefox                             # Main Web Browser 
    brave                               # Chrome Web Browser 
    vesktop                             # Discord 
    youtube-music                       # Youtube Music Client 
    libreoffice                         # Office Suite
    speedcrunch                         # Calculator
    strawberry 
    kdePackages.elisa                   # Music Player 
    kdePackages.kate                    # Text Editor
    kdePackages.dolphin                 # File Manager 
    kdePackages.kdeconnect-kde          # Phone sync Utility 

    # Gaming 

    # Hyprland Ecosystem 
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
    cliphist                            # Clipboard Utility 
    wl-clipboard                        # Clipboard Utility

  ];

  # Fonts 
  fonts.packages = with pkgs; [ 
    pkgs.nerd-fonts._0xproto 
    pkgs.nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono 
    font-awesome
  ];

  # Steam Configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

}

