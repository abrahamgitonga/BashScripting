#!/usr/bin/bash
echo Hellow $1,Today is $(date +"%A, %B %d, %Y %H:%M:%S" )

#Display kernel info
#uname -a command retrieves your kernel info
kernel_details=$(uname -a)
echo "You are using the following kernel: $kernel_details"
# Check network connection profiles
network_profiles=$(nmcli connection show)
if [ -n "$network_profiles" ]; then
    echo "Network connection profiles:"
    echo "$network_profiles" | grep -v "docker0" | awk '{print $1}'
    wifi_connected=$(echo "$network_profiles" | grep "WiFi" | awk '{print $1}')
else
    echo "No network connection profiles found."
fi

# Check WiFi password
if [ -n "$wifi_connected" ]; then
    read -p "WiFi password: " wifi_password
    echo "You entered: $wifi_password"
fi

# Check if WiFi is connected using nmcli
wifi_connection=$(nmcli -t -f NAME,STATE connection show --active)
if [ -n "$wifi_connection" ]; then
    echo "WiFi is connected to: $wifi_connection"
    
    # Prompt for the WiFi password
    read -p "Do you want to display the WiFi password? (y/n): " display_password
    if [ "$display_password" == "y" ]; then
        #command to retrieve WiFi password
        #still working on this part not working correctly
        wifi_password=$(nmcli -g 802-11-wireless-security.psk connection show "$wifi_connection" | awk 'NR==2')
        echo "WiFi password: $wifi_password"
    fi
else
    echo "WiFi is not connected."
fi

# Check screen brightness level using xrandr
brightness_level=$(xrandr --verbose | grep -i brightness | awk '{print $2}')
echo "Screen brightness level: $brightness_level"
