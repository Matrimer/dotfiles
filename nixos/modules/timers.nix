{ config, pkgs, ... }:
{
  systemd.timers."batterystatus" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnUnitActiveSec = "5m"
      Unit = "batteryStatus.service" ];
      };
  };

  systemd.services."batteryStatus.service" = {
    script = "
      set -eu
      ${pkgs.coreutils}/bin/sh "/home/mats/dotfiles/border-color-hyprland.sh"
    ";
    serviceConfig = {
      Type = "oneshot";
      User = "mats";

}
