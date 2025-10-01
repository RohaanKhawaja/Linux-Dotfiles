#!/usr/bin/env bash
# Laptop + Portable monitor (vertical, to the right)
hyprctl keyword monitor "eDP-1,2560x1440@240,0x0,1.6"
hyprctl keyword monitor "DP-4,1080x1920@60,2560x0,1.0,transform,1"
hyprctl keyword monitor "DP-3,disable"
hyprctl keyword monitor "HDMI-A-1,disable"
