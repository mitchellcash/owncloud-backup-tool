#!/bin/bash

# Check if user is running as root
if [[ $EUID -ne 0 ]]; then
	echo "Error: This script must be run as root"
	exit 1
fi

# Check that we are running on Ubuntu
if [ "`lsb_release -d | sed 's/.*:\s*//' | sed 's/[0-9][0-9]\.[0-9][0-9]\.[0-9]\ \LTS//' | sed 's/Ubuntu /Ubuntu/' `" != "Ubuntu" ]; then
	echo "Error: ownUp only supports Ubuntu"
	exit 1
fi
