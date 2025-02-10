FROM ruby:3.2.2-slim

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    git \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Install Yarn
RUN npm install -g yarn

# Set working directory
WORKDIR /app

# Add Gemfile first
COPY Gemfile ./

# Create empty Gemfile.lock if it doesn't exist
RUN touch Gemfile.lock

# Install dependencies
RUN bundle install

# Copy the application code
COPY . .

# Create entrypoint script with proper line endings
RUN echo '#!/bin/bash\n\
set -e\n\
\n\
# Remove a potentially pre-existing server.pid for Rails\n\
rm -f /app/tmp/pids/server.pid\n\
\n\
# Install dependencies if they do not exist\n\
bundle check || bundle install\n\
yarn install\n\
\n\
# Wait for database to be ready\n\
until pg_isready -h db -p 5432 -U postgres\n\
do\n\
  echo "Waiting for postgres..."\n\
  sleep 2\n\
done\n\
\n\
# Then exec the container main process\n\
exec "$@"' > /usr/bin/entrypoint.sh

# Set correct permissions for entrypoint script
RUN chmod +x /usr/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
