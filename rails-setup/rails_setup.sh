# Application setup script
# Configures Ruby on Rails and application dependencies

# Exit on errors
set -e

# Variables
RUBY_VERSION="3.4.1"
APP_NAME="myapp"
POSTGRES_USER="myapp_user"
POSTGRES_PASSWORD="password"

# Install Ruby using rbenv
echo "Installing Ruby..."
if ! which rbenv > /dev/null; then
  curl -sL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bashrc
  source ~/.bashrc
fi

if ! rbenv versions | grep -q $RUBY_VERSION; then
  rbenv install -s $RUBY_VERSION
  echo "Rbenv installed successfully"
fi
rbenv global $RUBY_VERSION
ruby -v

# Install Rails
echo "Installing Rails..."
if ! gem list -i rails > /dev/null; then
  gem install rails
  echo "Rails installed successfully"
else
  echo "Rails is already installed"
fi

# Create a new Rails app
echo "Creating Rails app: $APP_NAME..."
rails new $APP_NAME

# Navigate to app directory
cd $APP_NAME

# Set up PostgreSQL database
echo "Setting up PostgreSQL database..."
if ! sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='$POSTGRES_USER'" | grep -q 1; then
  sudo -u postgres psql -c "CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';"
  sudo -u postgres psql -c "ALTER USER $POSTGRES_USER CREATEDB;"
fi
if ! sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw ${APP_NAME}_development; then
  sudo -u postgres createdb ${APP_NAME}_development -O $POSTGRES_USER
fi

# Install gems and packages
echo "Installing Ruby gems and JavaScript packages..."
bundle install
yarn install

# Start services
echo "Starting PostgreSQL and Redis..."
sudo service postgresql start
sudo service redis-server start

# Final configuration
echo "Rails Setup complete! Please configure your database and environment variables as needed."
echo "Database creation (replace `$APP_NAME` with your app name):"
echo "  rails db:create"
echo "Run the server: rails s"

echo -e "\nMade with ❤️  by [imsachinshah](https://github.com/imsachinshah)"
