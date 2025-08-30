This is the backup of all my dotfiles in one directory using GNU stow to create symlinks to their relevent directories (usually within ~/.config)

To create a symlimk simply type stow followed by the name of the directory - except for nixos. For nixos run the command: sudo stow -t /etc/nixos nixos 
