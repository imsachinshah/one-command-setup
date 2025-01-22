#!/bin/bash

# Django Setup Script

# Exit on errors
set -e

# Log output to a file (configurable)
LOG_FILE="django_setup.log"
echo "Logging output to $LOG_FILE"
exec > >(tee -i "$LOG_FILE")
exec 2>&1

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update -y

# Install Python and pip
echo "Installing Python and pip..."
if ! which python3 > /dev/null || ! which pip3 > /dev/null; then
  sudo apt install -y python3 python3-pip
else
  echo "Python is already installed."
fi
python3 --version
pip3 --version

# Install virtualenv
echo "Installing virtualenv..."
sudo apt install python3-venv

# Create a new Django project
read -p "Enter the name of your Django project: " project_name
if [ -d "$project_name" ]; then
  echo "Directory $project_name already exists."
  read -p "Do you want to overwrite it? (y/n): " overwrite_choice
  if [[ "$overwrite_choice" =~ ^[Yy]$ ]]; then
    rm -rf "$project_name"
    echo "Existing directory removed."
  else
    read -p "Enter a different project name: " project_name
  fi
fi

# Setup virtual environment
echo "Creating virtual environment for the project..."
python3 -m venv "$project_name-env"
if [ $? -ne 0 ]; then
  echo "Failed to create a virtual environment. Please ensure Python and virtualenv are properly installed." >&2
  exit 1
fi
source "$project_name-env/bin/activate"

# Install Django
echo "Installing Django..."
pip install django
if [ $? -ne 0 ]; then
  echo "Failed to install Django. Please check your Python and pip configuration." >&2
  exit 1
fi

# Create Django project
echo "Creating Django project named $project_name..."
django-admin startproject "$project_name"
if [ $? -ne 0 ]; then
  echo "Failed to create Django project. Ensure Django is properly installed." >&2
  exit 1
fi

# Navigate to the project directory
cd "$project_name"

# Migrate the database
echo "Running initial database migrations..."
python manage.py migrate
if [ $? -ne 0 ]; then
  echo "Database migration failed. Please check your database configuration." >&2
  exit 1
fi

# Run the development server
echo "Starting Django development server..."
python manage.py runserver
if [ $? -ne 0 ]; then
  echo "Failed to start the development server. Please investigate the issue." >&2
  exit 1
fi

# Completion message
echo "Django project setup complete! Navigate to the $project_name directory to start developing."

# Credits
echo -e "\n---\nMade with  ❤️  by imsachinshah"