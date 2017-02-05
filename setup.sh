#!/bin/bash

# Check if user is running as root
if [[ $EUID -ne 0 ]]; then
  echo "Error: This script must be run as root"
  exit 1
fi

# Install Git if it doesn't exist
hash git &> /dev/null
if [ $? -eq 1 ]; then
  echo "Installing Git . . ."
  apt-get -q -q update
  apt-get -q -q install -y git > /dev/null
  echo "Git successfully installed!"
  echo
fi

# Clone the ownUp repository if it doesn't exist
if [ ! -d $HOME/ownup ]; then
  echo "Downloading ownUp . . ."
  git clone https://github.com/mitchellcash/ownup.git $HOME/ownup 2> /dev/null
  echo "ownUp successfully downloaded!"
  echo
fi

# Change directory to ownUp repository
cd $HOME/ownup

# Start setup script
source ownUp/ownup.sh
