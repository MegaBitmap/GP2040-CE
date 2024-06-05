#! /bin/bash

sudo apt update
sudo apt -y upgrade
sudo apt -y install git curl cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential python3-venv

# Install pico sdk
cd $HOME
git clone https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk
git submodule update --init
cd ..

# Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
. $HOME/.nvm/nvm.sh
nvm install v20

# Download GP2040 source code
git clone https://github.com/MegaBitmap/GP2040-CE
