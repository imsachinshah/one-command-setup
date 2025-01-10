Here’s a **README** for the React.js setup script:

---

# React.js Setup Script

A Bash script to automate the setup of a React.js development environment, supporting both **Create React App (CRA)** and **Vite**.

---

## Features

- Automatically installs Node.js (LTS) and Yarn.
- Allows you to choose between **Create React App (CRA)** and **Vite** for project setup.
- Supports installation of additional optional dependencies:
  - **React Router**
  - **Axios**
  - **Redux Toolkit**
- Starts the development server after setup.

---

## Requirements

- A Unix-based system (Linux/macOS) or WSL (Windows Subsystem for Linux).
- `sudo` privileges for installing system dependencies.
- Internet connection to download and install packages.

---

## Usage

### 1. Clone or Download the Script

Clone this repository or download the script directly.

```bash
git clone https://github.com/imsachinshah/OneCommandSetup.git
cd OneCommandSetup
```

### 2. Run the Script

Make the script executable:

```bash
chmod +x react_setup.sh
```

Run the script:

```bash
./react_setup.sh
```

### 3. Follow the Prompts

- **Choose Project Type**: Select between **Create React App (CRA)** or **Vite**.
- **Project Name**: Provide a name for your React project.
- **Optional Dependencies**: Choose whether to install React Router, Axios, or Redux Toolkit.

---

## Example

```plaintext
Updating and upgrading system packages...
Installing Node.js (LTS)...
Node.js installed successfully.
Installing Yarn...
Yarn installed successfully.

Choose the type of React project to create:
1. Create React App (CRA)
2. Vite
Enter your choice (1 or 2): 2
Enter the name of your React project: my-react-app

Using Vite...
Installing dependencies for Vite project...

Do you want to install React Router? (y/n): y
Do you want to install Axios? (y/n): n
Do you want to install Redux Toolkit? (y/n): y

Starting the React app...
```

---