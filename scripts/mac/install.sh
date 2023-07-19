#!/bin/bash

# LED Control Project Installation Script

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Python 3.9 using Homebrew
echo "Installing Python 3.9..."
brew install python@3.9

# Install Node.js and NPM using Homebrew
echo "Installing Node.js and NPM..."
brew install node

# Install RPi.GPIO Python library
echo "Installing RPi.GPIO Python library..."
pip3 install RPi.GPIO

echo "Installation completed!"
