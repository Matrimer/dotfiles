#{ config, pkgs, ... }:
#{
#  home.packages = [
#    (pkgs.writeShellScriptBin "dmenu" ''
#      exec ${pkgs.rofi}/bin/rofi -dmenu "$@"
#    '')
    #(pkgs.writeShellScriptBin "hypr" ''
    #  cd ~
    #  export _JAVA_AWT_WM_NONREPARENTING=1
    #  export XCURSOR_SIZE=24
    #  exec Hyprland -c ~/dotfiles/hyprland.conf
    #  '')
#  ];
let
  my-script = pkgs.writeShellScriptBin "dmenu" ''
    exec ${pkgs.rofi}/bin/rofi -dmenu "$@"
  '';

  #my-script = pkgs.writeShellScriptBin "my-script.sh" (builtins.readFile \~/path/to/my-script);
in with pkgs {
  environment.systemPackages = [
    dmenu
  ];
}
