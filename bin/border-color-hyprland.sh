#!/bin/sh

BAT=/sys/class/power_supply/BAT0
CAP=$BAT/capacity
STAT=$BAT/status

cat /sys/class/power_supply/BAT*/capacity

hyprctl keyword general:col.active_border
#'rgba(33ccffee) rgba(00ff99ee) 45deg'
