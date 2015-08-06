#!/bin/bash

DEVICE_BATTERY_DIR="/sys/class/power_supply/BAT0"
VOLTAGE="$DEVICE_BATTERY_DIR/voltage_now"
CURRENT="$DEVICE_BATTERY_DIR/current_now"
CHARGE="$DEVICE_BATTERY_DIR/charge_now"
CHARGE_FULL="$DEVICE_BATTERY_DIR/charge_full"
CHARGE_DESIGN="$DEVICE_BATTERY_DIR/charge_full_design"
STATUS="$DEVICE_BATTERY_DIR/status"

r () {
    cat $1
}

c () {
    echo "scale=3; $1" | bc -l
}

case $1 in
    power)
        echo $(c "$(r $VOLTAGE) * $(r $CURRENT) / 1000000000000")
        ;;
    charge)
        echo $(c "100 * $(r $CHARGE) / $(r $CHARGE_FULL)")
        ;;
    current)
        echo $(c "$(r $CURRENT) / 1000000")
        ;;
    voltage)
        echo $(c "$(r $VOLTAGE) / 1000000")
        ;;
    status)
        echo $(r $STATUS)
      ;;
esac
