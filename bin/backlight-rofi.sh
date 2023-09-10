#!/bin/sh

cat /sys/class/backlight/intel_backlight/max_brightness \
	| rofi -dmenu -p "Screen Brightness" \
	> /sys/class/backlight/intel_backlight/brightness

