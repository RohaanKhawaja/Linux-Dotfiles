# Enable Starship 
eval "$(starship init bash)"

# Enable fzf 
eval "$(fzf --bash)"

# General Terminal aliases
alias cls='clear' 
alias aliasEdit='sudo nvim ~/.bashrc' 
alias bashProfileEdit='sudo nvim ~/.bash_profile'
alias aliasReload='source ~/.bashrc && echo Bashrc sourced!'
alias ff='fastfetch'
alias neofetch='fastfetch'
alias f='z'
alias fp='z ..' 
alias fb=' z -' 
alias fa='zi'

# Aliases for mounting/unmounting drives 
alias usbMount='sudo mount /dev/sda1 /mnt/usb && echo USB MOUNTED!' 
alias usbUnmount='sudo umount /dev/sda1 && echo USB UNMOUNTED!' 
alias windowsMount='sudo mount -t ntfs-3g /dev/nvme1n1p3 /mnt/windows && echo Windows Drive Mounted!'
alias windowsUnmount='sudo umount /mnt/windows && echo Windows Drive Unmounted!'

# Git Related Aliases

# Nix Related Aliases 
alias nixConfigEdit='sudo nvim /etc/nixos/configuration.nix' 
alias nixPrograms='sudo nvim /etc/nixos/modules/programs.nix' 
alias nixHardware='sudo nvim /etc/nixos/modules/hardwareSetup.nix'
alias nixRebuild='sudo nixos-rebuild switch'
alias nixSearch='nix search nixpkgs' 
alias nixGenerationLs='sudo nix-env --list-generations --profile /nix/var/nix/profiles/system' 
alias nixDelete='sudo nix-collect-garbage -d' 
alias nixDeleteOlderThan='nix profile wipe-history --older-than' 
alias nixTempInstall='nix-shell -p'
alias nixTempRemove='nix-env -e'

# Hypr Related Aliases
alias hyprConfigEdit='sudo nvim ~/.config/hypr/hyprland.conf'
alias hyprKeybinds='sudo nvim ~/.config/hypr/modules/keybinds.conf'
alias hyprWindowRules='sudo nvim ~/.config/hypr/modules/windowRules.conf' 
alias hyprReload='hyprctl reload' 

# Hypr Ecosystem Related Aliases
# hyprshade
alias blueLightFilter='hyprshade on blue-light-filter'
alias filterOff='hyprshade off' 

# Tmux Related Aliases 
alias tmuxConfigEdit='sudo nvim ~/.tmux.conf'
alias tmuxReload='tmux source-file ~/.tmux.conf && echo Tmux Config Sourced!' 

# Neovim Related Aliases
alias vim='nvim' 
alias nvimConfigEdit='sudo nvim ~/.config/nvim/init.lua' 
alias nvimReload='sudo cp ~/.config/nvim/init.lua /root/.config/nvim/ && echo NeoVim Config Reloaded!' 

# FZF Colour Scheme 
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Enable Zoxide (keep at end of file)
eval "$(zoxide init bash)" 
