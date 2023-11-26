#!/usr/bin/bash
echo Hellow $1,Today is $(date +"%A, %B %d, %Y %H:%M:%S" )

#Display kernel info
#uname -a command retrieves your kernel info
kernel_details=$(uname -a)
echo "You are using the following kernel: $kernel_details"

# Check WiFi state using nmcli
wifi_state=$(nmcli -t -f WIFI general)
if [ "$wifi_state" == "enabled" ]; then
    echo "WiFi is enabled."
else
    echo "WiFi is disabled."
fi

# Check screen brightness level using xrandr
brightness_level=$(xrandr --verbose | grep -i brightness | awk '{print $2}')
echo "Screen brightness level: $brightness_level"
