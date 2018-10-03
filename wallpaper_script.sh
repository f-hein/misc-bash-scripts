#!/bin/bash

rand_xkcd_number="$(shuf -i 1-2026 -n 1)"
base_filepath="/home/ute/Pictures/Wallpapers/"
pic_filepath="${base_filepath}xkcd_$rand_xkcd_number"
wget -q -O /home/ute/xkcd.txt https://xkcd.com/$rand_xkcd_number/
xkcd_direct_link=$(cat /home/ute/xkcd.txt | grep -A 1 '<div id="comic">' | grep -oP '(?<=src="//).*?(?=")')
echo "Downloading from: $xkcd_direct_link"  # skad sciaga
echo "Picture filepath: $pic_filepath"
rm $base_filepath*  # czysci folder Wallpapers
wget -O $pic_filepath $xkcd_direct_link 
rm /home/ute/xkcd.txt
filepath2="file://$pic_filepath"
gsettings set org.gnome.desktop.background picture-options 'centered'
gsettings set org.gnome.desktop.background picture-uri $filepath2


