# List of all programs for personal desktop use
{ config, pkgs, ... }:

# Import nixCats.nix for declarative plugin management 
let
  neovim = import /etc/nixos/modules/nixCats.nix { inherit pkgs; };
in

{
  environment.systemPackages = with pkgs; [
                                  
    # Terminal Tools 
    neovim              # Default Text Editor 
    tmux                # Terminal Multiplexer 
    stow                # Dotfiles Management 
    git                 # Git 
    gh                  # GitHub CLI
    zoxide              # Better CD 
    fzf                 # Fuzzy find 
    tree                # Tree Listing 
    btop                # System Resource Monitor
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
    asciiquarium        # Aquarium
    cbonsai             # Bonsai Tree

    # PDF Viewer 
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
    
    # Hardware
    arduino-cli

  ];
}

