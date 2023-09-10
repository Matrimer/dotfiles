# flake.nix
{
  inputs = {
# use release 23.05 branch of the GitHub repository as input, this is the most common input format
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
#    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.05";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {self, nixpkgs, hyprland, ...}: {
    nixosConfigurations.nixos-utpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.home-manager # make home manager available to configuration.nix
	{
	# use system-level nixpkgs rather than the HM private ones
          home-manager.useGlobalPkgs = true;
  	  home-manager.useUserPackages = true;
        }
        hyprland.nixosModules.default
        {programs.hyprland.enable = true;}
        # ...
      ];
    };
  };
}