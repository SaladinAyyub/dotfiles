#!/usr/bin/env bash

swww-daemon &

swww img ~/Wallpapers/wallpaper.png &

nm-applet --indicator &

waybar &

dunst

lxqt-policykit-agent
