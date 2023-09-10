{ config, pkgs, ... }:
{
  system.stateVersion = "23.05"; # Careful, Read manual
  
# Storage optimization
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 14d";
  };
# EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
# Firmware updates
  hardware.enableRedistributableFirmware = true;
  services.fwupd.enable = true;

# Disable PC speaker
boot.blacklistedKernelModules = [ "snd_pcsp" ];

# SMART monitoring
  services.smartd = {
    enable = true;
    notifications.mail.enable = true;
  }; 

#### VIDEO ####
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };


# Locale
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
    #useXkbConfig = true; # use xkbOptions in tty.
  };

# Users
  users.users.mats = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" "input" "docker" "dialout" "wireshark"]; 
  }; 
  nix.settings.trusted-users = [ "root" "mats" ];

# fix java windows
environment.variables._JAVA_AWT_WM_NONREPARENTING = "1";

security.sudo = {
  enable = true;
  extraConfig = ''
    Defaults    insults
    Cmnd_Alias BOOTCMDS = /sbin/shutdown,/usr/sbin/pm-suspend,/sbin/reboot
    mats ALL=(root)NOPASSWD:BOOTCMDS
  '';
};


}
