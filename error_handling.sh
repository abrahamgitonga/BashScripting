#!/usr/bin/env bash

readonly input="$1"

#This block checks whether the number of command-line arguments ($#) is not equal to 1.

if [ $# -ne 1 ]
then
    echo "Usage: $(basename -a "$0") <person>"
	exit 1
fi

echo "Greetings, ${input}"

exit 0


