{ config, pkgs, ... }:
{
  xdg = {
    portal = {

    enable = true ;
    xdgOpenUsePortal = true ;
    extraPortals = ( with pkgs;  [
      libsForQt5.xdg-desktop-portal-kde
      xdg-desktop-portal
      xdg-desktop-portal-gtk
     ] ) ; 
    };
  };
}
