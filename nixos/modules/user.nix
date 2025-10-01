# Personal user account configuration for NixOS 

{ config, pkgs, ... }: 

{ 

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rohaan = {
    isNormalUser = true;
    description = "Rohaan Khawaja";
    extraGroups = [ "networkmanager" "wheel" "input" "openrazer" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "rohaan";

}
