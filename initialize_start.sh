#!/bin/bash

# Exit immediately if a command fails
set -e

echo "Updating package lists..."
sudo apt update -y

echo "Installing Python3 and pip..."
sudo apt install -y python3 python3-pip

echo "Installing BeautifulSoup4 (python3-bs4)..."
sudo apt install -y python3-bs4

echo "Installing Node.js and npm..."
sudo apt install -y nodejs npm

echo "Checking versions..."
python3 --version
pip3 --version
node -v
npm -v

echo "Creating project directory..."
mkdir -p ~/myapp
cd ~/myapp

echo "Initializing npm project..."
npm init -y

echo "Installing Express..."
npm install express

echo "Starting Node apps with nohup..."
# Run each app in background with nohup, redirecting output to log files
nohup node app.js > app.log 2>&1 &
nohup node api.js > api.log 2>&1 &
nohup node mya.js > mya.log 2>&1 &

echo "All installations complete and apps are running in background!"
