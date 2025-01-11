# Node.js Setup Script

A Bash script to automate the setup of a Node.js development environment. The script ensures you have the latest tools installed and sets up a basic project structure to kickstart your Node.js application.

---

## Features

- Automatically installs Node.js (LTS) and Yarn.
- Creates a new Node.js project with `npm init`.
- Optionally installs common Node.js libraries:
  - **Express.js** for web application development.
  - **Mongoose** for MongoDB integration.
  - **Dotenv** for environment variable management.
- Sets up a basic folder structure:
  - `src/routes`: For application routes.
  - `src/controllers`: For controller logic.
  - `src/models`: For database models.
- Generates a sample `index.js` with a simple Express.js server.

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
chmod +x nodejs_setup.sh
```

Run the script:

```bash
./nodejs_setup.sh
```

### 3. Follow the Prompts

- Enter the name of your Node.js project.
- Choose whether to install additional libraries like Express.js, Mongoose, or Dotenv.
- The script sets up the project and creates a sample server in `src/index.js`.

---

## Example

```plaintext
Updating and upgrading system packages...
Installing Node.js (LTS)...
Node.js is already installed.
Installing Yarn...
Yarn is already installed.

Enter the name of your Node.js project: my-node-app
Creating a new Node.js project named my-node-app...

Installing common Node.js packages...
Do you want to install Express.js? (y/n): y
Do you want to install Mongoose (for MongoDB)? (y/n): n
Do you want to install Dotenv (for environment variables)? (y/n): y

Setting up basic project structure...
Node.js project setup complete! Navigate to the my-node-app directory to start developing.
```

---

## Folder Structure

After running the script, the project will have the following structure:

```plaintext
my-node-app/
├── src/
│   ├── routes/        # Application routes
│   ├── controllers/   # Controller logic
│   ├── models/        # Database models
│   └── index.js       # Sample Express.js server
├── node_modules/      # Installed dependencies
├── package.json       # Project metadata and scripts
└── yarn.lock          # Yarn lock file (if Yarn was used)
```

---

## How to Start the Server

1. Navigate to the project directory:

   ```bash
   cd my-node-app
   ```

2. Run the server:

   ```bash
   node src/index.js
   ```

3. Access the server at: [http://localhost:3000](http://localhost:3000)

---
