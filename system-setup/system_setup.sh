# System Setup Script

# Exit on errors
set -e

# Log output to a file
exec > >(tee -i system_setup.log)
exec 2>&1

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update -y && sudo apt upgrade -y

# Install essential system packages
echo "Installing essential system packages..."
sudo apt install -y curl git build-essential libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nodejs postgresql postgresql-contrib redis-server wget apt-transport-https software-properties-common

# Install Node.js (ensure it's the latest LTS)
echo "Installing Node.js (LTS)..."
if ! which node > /dev/null; then
  curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt install -y nodejs
  echo "Node.js installed successfully"
else
  echo "Node.js is already installed"
fi
node -v
npm -v

# Install Yarn
echo "Installing Yarn..."
if ! which yarn > /dev/null; then
  sudo npm install --global yarn
  echo "Yarn installed successfully"
else
  echo "Yarn is already installed"
fi

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
if ! which code > /dev/null; then
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt update
  sudo apt install -y code
  echo "VS Code installed successfully"
else
  echo "VS Code is already installed."
fi

# Prompt for Google Chrome installation
read -p "Do you want to install Google Chrome? (y/n): " install_chrome
if [ "$install_chrome" == "y" ]; then
  if ! which google-chrome > /dev/null; then
    echo "Installing Google Chrome..."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
    echo "Google Chrome installed successfully"
  else
    echo "Google Chrome is already installed."
  fi
fi

# Prompt for Sublime Text installation
read -p "Do you want to install Sublime Text? (y/n): " install_sublime
if [ "$install_sublime" == "y" ]; then
  if ! which subl > /dev/null; then
    echo "Installing Sublime Text..."
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt update
    sudo apt install -y sublime-text
    echo "Sublime Text installed successfully"
  else
    echo "Sublime Text is already installed."
  fi
fi

# Install Postman
echo "Installing Postman..."
if ! (snap list postman &> /dev/null || ((command -v flatpak &> /dev/null) && flatpak list | grep com.getpostman.Postman &> /dev/null)); then
  sudo snap install postman
  echo "Postman installed successfully"
else
  echo "Postman is already installed."
fi

# Install Docker
echo "Installing Docker..."
if ! which docker > /dev/null; then
  sudo apt install -y docker.io
  echo "Docker installed successfully"
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo usermod -aG docker $USER
  newgrp docker
else
  echo "Docker is already installed."
fi

# Install Zsh and Oh-My-Zsh
echo "Installing Zsh and Oh-My-Zsh..."
if ! which zsh > /dev/null; then
  sudo apt install -y zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "Zsh installed successfully"
else
  echo "Zsh is already installed."
fi

# Install GNOME Tweaks
echo "Installing GNOME Tweaks..."
if ! which gnome-tweaks > /dev/null; then
  sudo apt install -y gnome-tweaks
  echo "GNOME Tweaks installed successfully"
else
  echo "GNOME Tweaks is already installed."
fi

echo -e "\nSystem setup complete!"

echo -e "\nMade with ❤️  by imsachinshah: https://github.com/imsachinshah"
