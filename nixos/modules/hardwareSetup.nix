# All of the hardware configuration for nixos on my laptop: OMEN 16-WF1006na 


{ config, pkgs, ... }:

{ 

# Enable Bluetooth 
  hardware.bluetooth = { 
    enable = true;
    powerOnBoot = true; 
    settings = { 
      General = { 
        Experimental = true; 
      }; 
    }; 
  }; 

  # Enable hardware acceleration
  hardware.graphics = { 
    enable = true; 
  }; 

  # Enable wooting keyboard support 
  hardware.wooting.enable = true; 

  # GPU Driver 
  #services.xserver.videoDrivers = ["nvidia"];
#
  ## Enable Nvidia GPU
  #hardware.nvidia = {
    #modesetting.enable = true; 
    #powerManagement.enable = false;
    #powerManagement.finegrained = false; 
    #open = false; 
    #nvidiaSettings = true;
    #package = config.boot.kernelPackages.nvidiaPackages.latest;
  #};
#
  ## Enable dual GPU's 
  #hardware.nvidia.prime = { 
    #intelBusId = "PCI:0:2:0";
    #nvidiaBusId = "PCI:1:0:0";
  #};
} 
