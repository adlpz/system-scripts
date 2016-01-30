##!/bin/bash

for device_d in /sys/class/thermal/thermal_zone*; do
    element=$(cat $device_d/type)
    temp=$(( $(cat $device_d/temp) / 1000))
    echo "$element: $temp C"
done

    
