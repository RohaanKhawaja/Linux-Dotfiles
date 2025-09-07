# List of all programs 
{ config, pkgs, ... }:

let
  neovim = import /etc/nixos/modules/nixCats.nix { inherit pkgs; };
in

{
  environment.systemPackages = with pkgs; [
                                  
    # Terminal Tools 
    neovim
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
    lshw                # Shows Bus ID Values 
    usbutils            # Shows USB Devices 
    tdf                 # Terminal PDF Viewer

    # Silly terminal Tools 
    fortune             # Fortune cookies
    cowsay              # Funny Cow
    tt                  # Terminal Typing Test
    cmatrix             # Matrix Effect 
    cava                # Waveform  
    asciiquarium        # Aquarium
    cbonsai             # Bonsai Tree
    
    # System Utilities 
    ntfs3g              # NTFS Drive Utility 
    brightnessctl       # Brightness Controls 
    playerctl           # Multimedia Controls 
    pavucontrol         # Volume Control 
    efibootmgr          # EFI Boot Manager 
    kanata              # Keyboard Remapping 
    libsForQt5.qt5ct    # QT5 Framework
    kdePackages.qt6ct   # QT6 Configuration
    openrazer-daemon    # Razer Hardware Daemon

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
    octave              # GNU Octave (MATLAB-like - Scripts Only No simulink)

    # GUI/Desktop Apps 
    firefox                             # Main Web Browser 
    brave                               # Chrome Web Browser 
    vesktop                             # Discord 
    youtube-music                       # Youtube Music Client 
    libreoffice                         # Office Suite
    speedcrunch                         # Calculator
    wootility                           # Keyboard Utility 
    polychromatic                       # Frontend for peripheral control
    wasistlos                           # Whatsapp Client
    bambu-studio                        # 3D Slicer
    # KDE Applications 
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
    wl-clipboard                        # Clipboard Backend
    cliphist                            # Clipboard History 

  ];

  ## Neovim Configuration 
  #programs.neovim = {
    #enable = true;
    #defaultEditor = true;
  #};

  # Steam Configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # Fonts 
  fonts.packages = with pkgs; [ 
    pkgs.nerd-fonts._0xproto 
    pkgs.nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono 
    font-awesome
  ];

}

