# All of the hardware configuration for nixos on my laptop: OMEN 16-WF1006na 
{ config, pkgs, lib, ... }:

{ 
  # Fix for dual boot time desyncs 
  time.hardwareClockInLocalTime = true; 

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

  # Enable Kanata for more advanced keyboard remapping on built in keyboard
  systemd.services.kanata = {
    description = "Kanata keyboard remapper";
    after = [ "graphical.target" ];
    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/kanata --cfg /home/rohaan/.config/kanata/kanata.kbd";
      Type = "simple";
      Restart = "no";
    };
    wantedBy = [ "graphical.target" ];
  };
  

  # GPU Driver 
  services.xserver.videoDrivers = [ "nvidia" ];
  
  # Enable Nvidia GPU
  hardware.nvidia = {
    modesetting.enable = true; 
    powerManagement.enable = false;
    powerManagement.finegrained = false; 
    open = false; 
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  
    # Default: Intel drives desktop, NVIDIA offload available
    prime = {
      offload.enable = true;           # iGPU default
      offload.enableOffloadCmd = true; # installs prime-run wrapper
      sync.enable = false;             # do not sync desktop to NVIDIA
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  
  # Prevent nouveau driver for Nvidia from loading 
  boot.blacklistedKernelModules = [ "nouveau" ]; 
  
  # Specialisation: full NVIDIA mode (internal display only, max performance)
  specialisation = { 
    nvidia-sync.configuration = {
      system.nixos.tags = [ "nvidia-sync" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce false;
        prime.offload.enableOffloadCmd = lib.mkForce false;
        prime.sync.enable = lib.mkForce true;  # all rendering on NVIDIA
      };
    };
  };

  #Mount the secondary drive automatically on startup 
  fileSystems."/mnt/massStorage" = { 
  	device = "/dev/disk/by-uuid/58A27D03A27CE6C2"; 
	fsType = "ntfs-3g"; 
	options = [ "rw" "uid=1000" "gid=100" "nofail"]; 
  }; 

} 
