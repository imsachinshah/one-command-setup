#!/bin/bash

# React.js Setup Script

# Exit on errors
set -e

# Log output to a file
exec > >(tee -i react_setup.log)
exec 2>&1

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update -y && sudo apt upgrade -y

# Install Node.js (ensure it's the latest LTS)
echo "Installing Node.js (LTS)..."
if ! which node > /dev/null; then
  curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt install -y nodejs
  echo "Node.js installed successfully."
else
  echo "Node.js is already installed."
fi
node -v
npm -v

# Install Yarn
echo "Installing Yarn..."
if ! which yarn > /dev/null; then
  sudo npm install --global yarn
  echo "Yarn installed successfully."
else
  echo "Yarn is already installed."
fi
yarn -v

# Select project type
echo "Choose the type of React project to create:"
echo "1. Create React App (CRA)"
echo "2. Vite"
read -p "Enter your choice (1 or 2): " project_type

while true; do
  read -p "Enter the name of your React project: " project_name
  if [ -d "$project_name" ]; then
    echo "Directory $project_name already exists. Please choose a different name."
  else
    break
  fi
done

# Create React App
echo "Setting up React project..."
if [ "$project_type" == "1" ]; then
  echo "Using Create React App..."
  yarn create react-app $project_name 
  cd $project_name
elif [ "$project_type" == "2" ]; then
  echo "Using Vite..."
  npm create vite@latest $project_name --template react
  cd $project_name
  echo "Installing dependencies for Vite project..."
  npm install
else
  echo "Invalid choice. Exiting."
  exit 1
fi

# Install additional dependencies (optional)
echo "Installing additional dependencies..."
read -p "Do you want to install React Router? (y/n): " install_router
if [ "$install_router" == "y" ]; then
  yarn add react-router-dom
fi

read -p "Do you want to install Axios? (y/n): " install_axios
if [ "$install_axios" == "y" ]; then
  yarn add axios
fi

read -p "Do you want to install Redux Toolkit? (y/n): " install_redux
if [ "$install_redux" == "y" ]; then
  yarn add @reduxjs/toolkit react-redux
fi

# Start the React app
echo "Starting the React app..."
if [ "$project_type" == "1" ]; then
  yarn start
elif [ "$project_type" == "2" ]; then
  yarn dev
fi

# Completion message
echo "React app setup complete! Navigate to the $app_name directory to start developing."

# Credits
echo -e "\n---\nMade with ❤️  by [imsachinshah](https://github.com/imsachinshah)"
