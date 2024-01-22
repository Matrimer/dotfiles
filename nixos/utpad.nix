# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.initrd.luks.devices."luks-d5368fff-cc7e-4adf-8c46-77f1ce30c817".keyFile = "/crypto_keyfile.bin";
  networking.hostName = "nixos-utpad"; # Define your hostname.

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  
  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
