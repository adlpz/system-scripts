#!/bin/bash

# This script requires /usr/bin/tee on the backlight device to be sudoable without password

BL_DEVICE="/sys/class/backlight/intel_backlight/brightness"
BL_MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)
BL_DEFAULT_STEP=10

function change_bl {
    CURRENT=$(cat $BL_DEVICE)
    NEXT=$(($CURRENT$1))
    if [ "0" -gt "$NEXT" ]; then
        NEXT="0"
    elif [ "$NEXT" -gt "$BL_MAX" ]; then
        NEXT="$BL_MAX"
    fi
    echo $NEXT | sudo tee $BL_DEVICE
}

STEP=$1
if [[ "$STEP" == "-" ]] || [[ "$STEP" == "+" ]]; then
    change_bl "$STEP$BL_DEFAULT_STEP"
elif [[ "$STEP" =~ (\+|\-)[0-9]+ ]]; then
    change_bl "$STEP"
else
    echo "scale=0; 100 * $(cat $BL_DEVICE) / $BL_MAX" | bc -l
fi
