#!/bin/bash

# Node.js Setup Script

# Exit on errors
set -e

# Log output to a file
exec > >(tee -i nodejs_setup.log)
exec 2>&1

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update -y && sudo apt upgrade -y

# Install Node.js (ensure it's the latest LTS)
echo "Installing Node.js (LTS)..."
if ! which node > /dev/null; then
  curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt install -y nodejs
else
  echo "Node.js is already installed."
fi
node -v
npm -v

# Install Yarn
echo "Installing Yarn..."
if ! which yarn > /dev/null; then
  sudo npm install --global yarn
else
  echo "Yarn is already installed."
fi
yarn -v

# Create a new Node.js project
read -p "Enter the name of your Node.js project: " project_name
if [ -d "$project_name" ]; then
  echo "Directory $project_name already exists. Please choose a different name."
  exit 1
fi
echo "Creating a new Node.js project named $project_name..."
mkdir $project_name
cd $project_name
npm init -y

# Install optional packages
echo "Installing common Node.js packages..."
read -p "Do you want to install Express.js? (y/n): " install_express
if [ "$install_express" == "y" ]; then
  npm install express
fi

read -p "Do you want to install Mongoose (for MongoDB)? (y/n): " install_mongoose
if [ "$install_mongoose" == "y" ]; then
  npm install mongoose
fi

read -p "Do you want to install Dotenv (for environment variables)? (y/n): " install_dotenv
if [ "$install_dotenv" == "y" ]; then
  npm install dotenv
fi

# Add basic project structure
echo "Setting up basic project structure..."
mkdir -p src/routes src/controllers src/models
cat <<EOL > src/index.js
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// Routes
app.get('/', (req, res) => {
  res.send('Hello, Node.js!');
});

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
EOL

# Completion message
echo "Node.js project setup complete! Navigate to the $project_name directory to start developing."

# Credits
echo -e "\n---\nMade with ❤️  by [imsachinshah](https://github.com/imsachinshah)"
