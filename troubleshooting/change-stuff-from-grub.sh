#!/bin/bash

# Edit the GRUB defaults file
sudo vim /etc/default/grub

# Rebuild GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

