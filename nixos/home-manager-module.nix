{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.mats = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";
    
    imports = [
      ./home.nix
      ./modules/email.home.nix
    ];
  };
}
