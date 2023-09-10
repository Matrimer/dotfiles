#!/bin/sh
#
# battery status script
#


BAT=/sys/class/power_supply/BAT0

# "Unknown", "Charging", "Discharging", "Not charging", "Full"
STAT=$(cat $BAT/status)

# 0-100 (percent)
PERC=$(cat $BAT/capacity)

# "Unknown", "Critical", "Low", "Normal", "High", "Full"
#CAP=$(cat $BAT/capacity_level)

case "${STAT}" in
   'Full')
   BATSTT="$BLD=$NON"
   ;;
   'Charging')
   BATSTT="$BLD+$NON"
   ;;
   'Discharging')
   BATSTT="$BLD-$NON"
   ;;
esac

while getopts pw: name
do
	case $name in
	p)	prompt=1
			NON='\033[00m'
			BLD='\033[01m'
			RED='\033[01;31m'
			GRN='\033[01;32m'
			YEL='\033[01;33m'
			BLU='\033[01;34m'
			PUR='\033[01;35m'
			CYA='\033[01;36m'

			if [ ${PERC} -le 15 ]
			then
				COLOR="$RED"

			elif [ ${PERC} -le 30 ]
			then
				COLOR="$PUR"

			elif [ ${PERC} -le 50 ]
			then
				COLOR="$BLU"

			elif [ ${PERC} -le 80 ]
			then
				COLOR="$CYA"

			elif [ ${PERC} -le 100 ]
			then
				COLOR="$GRN"

			else
				COLOR="$YEL"
			fi

			echo -e "${COLOR}${PERC}%${NON} ${BATSTT}"
		;;

	w)	wm=1
			hyprctl keyword general:col.active_border
		;;

	?)	printf "Usage: %s: [-(p)rompt] [-(w)m] \n" $0
			exit 2;;
	esac
done
