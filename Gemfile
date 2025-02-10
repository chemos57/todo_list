source 'https://rubygems.org'

ruby '3.2.2'

# Rails itself
gem 'rails', '7.0.8'

# Server
gem 'puma', '~> 6.0'

gem 'logger'

# Database
gem 'pg', '~> 1.1'

# Asset pipeline
gem 'sprockets-rails'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'

# JavaScript
gem 'jbuilder'

# Reduces boot times through caching
gem 'bootsnap', require: false

# Use Redis for Action Cable
gem 'redis', '~> 5.0'

gem 'dry-monads'
gem 'graphql'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'ffaker'
end

group :development do
  gem 'graphiql-rails'
  gem 'web-console'
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
