# flake.nix
{
  inputs = {
# use release 23.05 branch of the GitHub repository as input, this is the most common input format
#    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {self, nixpkgs, hyprland, home-manager, ...}: {
    nixosConfigurations.nixos-utpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      #overlay-unstable = final: prev: {
        #unstable = import unstable {
          #inherit system;
          #config.allowUnfree = true;
        #};
      #};
      modules = [
    #    ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
        #inputs.home-manager.nixosModules.home-manager # make home manager available to configuration.nix
	home-manager.nixosModules.home-manager
	{
	# use system-level nixpkgs rather than the HM private ones
          home-manager.useGlobalPkgs = true;
  	  home-manager.useUserPackages = true;
          home-manager.users.mats = import ./home.nix;
        }
        hyprland.nixosModules.default
        {programs.hyprland.enable = true;}
        ./configuration.nix
      ];
    };
  };
}
