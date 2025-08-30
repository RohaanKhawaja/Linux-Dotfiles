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

  # Enable the service for the wooting driver 
  services.udev.extraRules = ''
    # Wooting One Legacy
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess"

    # Wooting One update mode
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2402", TAG+="uaccess"

    # Wooting Two Legacy
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess"

    # Wooting Two update mode
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2403", TAG+="uaccess"

    # Generic Wooting devices
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", TAG+="uaccess"
  '';

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
