#!/bin/bash

sudo apt-get install git vim gcc make g++
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.7
sudo python3.7 -m pip install --upgrade pip
  sudo apt-get update

echo >> ~/.bashrc 'alias python=python3.7'
echo >> ~/.bashrc 'alias pip=pip3.7'
source ~/.bashrc
echo "now you can use python3.7 and pip3 by directly typing python and pip repectively"

pip install --user -r requirements.txt


