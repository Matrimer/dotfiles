{ config, pkgs, ... }:
{
  programs.java.enable = true; 
  environment.systemPackages = with pkgs; [
    (steam.override { withJava = true; })
  ];
  
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
}
