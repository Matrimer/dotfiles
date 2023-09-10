# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).
{ config, pkgs, ... }:
{
imports =
  [ 
    # Auto-generated
    ./hardware-configuration.nix
    # Local
    ./system.nix
    ./home-manager-module.nix
    ./utpad.nix

    ./modules/audio.nix
    ./modules/xdg.nix
    ./modules/wireless.nix

    ./pkgs.nix

#   ./modules/timers.nix
    ./modules/xorg.nix
#   ./shellscripts.nix
    ./cachix.nix
  ];
  
#### GRAPHICAL ENVIRONMENT ####
# Wayland compositors
programs.hyprland = {
  enable = true;
  xwayland.enable = true;
};
xdg.portal = { # Needed for hyprland
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};
# X11 window manager
services.xserver.windowManager.bspwm = {
  enable = true;
  #config-file = "$HOME/dotfiles/bspwm/bspwmrc";
  #sxhkd.config = "$HOME/dotfiles/sxhkd/sxhkdrc";
};

nixpkgs.config.permittedInsecurePackages = [
  "electron-11.5.0" # For pkgs.itch
];

environment.variables = { EDITOR = "nvim"; };

## SERVICES
# Polkit
  security.polkit.enable = true;

# Allow users to change screen brightness
  services.udev.extraRules =
    ''ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"'';
  
}
