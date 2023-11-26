#!/usr/bin/bash
echo Hellow $1,Today is $(date +"%A, %B %d, %Y %H:%M:%S" )

#Display kernel info
#uname -a command retrieves your kernel info
kernel_details=$(uname -a)
echo "You are using the following kernel: $kernel_details"
