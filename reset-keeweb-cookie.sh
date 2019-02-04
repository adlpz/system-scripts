#!/bin/bash
sed -i.bak s/\("cookies":\)\[.*\]/\1[]/g /home/user/.config/KeeWeb/runtime-data.json
