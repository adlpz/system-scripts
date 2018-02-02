#!/bin/bash
cd ~/.screenlayout
script=$(find . -type f -name "*.sh" -printf '%p\t' -exec awk 'NR==2' {} \; | column -ts $'\t' | rofi -dmenu | awk '{print $1}')
$script
