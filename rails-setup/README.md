# Rails Setup Scripts

This directory contains scripts and documentation for setting up a Ruby on Rails development environment. These scripts simplify the process of installing dependencies, configuring the environment, and starting a new Rails project.

## Scripts

- **`rails_setup.sh`**: Automates the installation of Ruby, Rails, and other essential tools.

## Features

- Installs Ruby via `rbenv`.
- Installs the latest version of Rails.
- Sets up PostgreSQL as the database.
- Configures Webpack with React for front-end development.
- Includes options to start necessary services like PostgreSQL and Redis.

## Usage

1. Make the script executable:
   ```bash
   chmod +x rails_setup.sh
   ```

2. Run the script:
   ```bash
   ./rails_setup.sh
   ```

3. Follow the prompts to set up your Rails environment.

## Customization

You can modify the following variables in the script:

- **Ruby Version**: Change the desired Ruby version in the `RUBY_VERSION` variable.
- **App Name**: Specify your Rails application name in the `APP_NAME` variable.
- **Postgres Usermane**: Specify your Postgres Username in the `POSTGRES_USER` variable.
- **Postgres Password**: Specify your Postgres password in the `POSTGRES_PASSWORD` variable.

## Requirements

Before running the script, ensure:

- `curl` is installed on your system.


