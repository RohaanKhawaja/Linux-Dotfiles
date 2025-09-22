#!/bin/bash

#Script to automatically load all of the dotfiles

# Ensure in the correct directory 
cd "$(dirname "$0")/../.." || exit 1

# Items to exclude
excludeItems=("nixos" ".git" ".gitignore")

# Build the list of items to stow
stowList=()
for item in *; do
    # Skip excluded items
    if [[ " ${excludeItems[*]} " =~ " $item " ]]; then
        continue
    fi
    stowList+=("$item")
done

# Stow everything else at once
stow "${stowList[@]}"

# Stow nixos specifically in its proper directory 
sudo stow -t /etc/nixos nixos 
