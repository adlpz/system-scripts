#!/bin/bash
killall -TERM firefox-developer
killall -TERM 'Web Content'
killall -TERM firefox

sleep 2

killall -KILL firefox-developer
killall -KILL 'Web Content'
killall -KILL firefox
