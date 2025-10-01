#!/usr/bin/env bash
# Docked: Laptop + 2 external monitors
hyprctl keyword monitor "eDP-1,2560x1440@240,0x0,1.6"       #Laptop Screen
hyprctl keyword monitor "DP-3,1920x1080@144,1600x0,1.0"     #Main Monitor 
hyprctl keyword monitor "DP-4,1920x1080@144,1600x1080,1.0"  #Portable Monitor
hyprctl keyword monitor "HDMI-A-1,disable"
