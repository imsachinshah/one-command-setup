# System Setup Scripts
## Scripts

- **`system_setup.sh`**: Automates the installation of system-level tools and applications.

## Features

- Updates and upgrades your system packages.
- Installs essential utilities like `curl`, `git`, `build-essential`, and more.
- Sets up Node.js, Yarn, Docker, and other development essentials.
- Offers optional installations for tools like Google Chrome, Sublime Text, Postman, and Visual Studio Code.
- Configures Zsh and Oh-My-Zsh for a powerful terminal experience.
- Includes GNOME Tweaks for customizing the GNOME desktop environment.

## Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/imsachinshah/OneCommandSetup.git
   cd OneCommandSetup
   ```

2. **Make the script executable**
   ```bash
   chmod +x system_setup.sh
   ```

3. **Run the script**
   ```bash
   ./system_setup.sh
   ```

4. **Follow the prompts**
   The script will ask for confirmation before installing optional tools.

## Requirements

- A Linux-based operating system (tested on Ubuntu).
- `sudo` privileges for installing system-level packages.

## Customization

You can modify the following variables in the script:

- **Applications**: Enable or disable specific applications for installation.
- **Optional Features**: The script includes prompts for optional tools; you can bypass these by customizing the script.