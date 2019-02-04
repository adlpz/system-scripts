#!/bin/bash

HOST=$(hostname)

if [ "$HOST" == "barbacode.prealfa.com" ]; then
    xinput --set-prop "Razer Razer DeathAdder" "libinput Accel Speed" 0
fi
