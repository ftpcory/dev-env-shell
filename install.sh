#!/bin/bash

# install base packages
apt update -y
apt install -y \
  vim \
  git \
  curl \
  zip \
  unzip \
  lastpass-cli \
  pipenv

# install python packages 
pip install oathtool

# install the aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# install the twilio cli 
wget -qO- https://twilio-cli-prod.s3.amazonaws.com/twilio_pub.asc | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/twilio.list
echo 'deb https://twilio-cli-prod.s3.amazonaws.com/apt/ /' sudo tee /etc/apt/sources.list.d/twilio.list
sudo apt update
sudo apt install -y twilio

rsync src/* "${HOME}"
