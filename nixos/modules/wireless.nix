##### WIRELESS #####
{ config, pkgs, ... }:
{
# iwd/wpa_supplicant
  networking = {
    #wireless.enable = true; # wpa_supplicant
    hostFiles = [ ./adlist ]; # Adblock
    wireless.iwd = {
      enable = false ; # wireless support via iwd
      settings = {
        General = {
          EnableNetworkConfiguration=true;
        };
      };
    };
    networkmanager = {
      enable = true; #default=false
      wifi.backend = "wpa_supplicant"; # iwd/wpa_supplicant
    };
  };
}
