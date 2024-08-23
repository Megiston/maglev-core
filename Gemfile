# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem's dependencies in maglev.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem 'rails', '~> 7.1.3.4'

# Use Active Storage variant
gem 'image_processing', '~> 1.12.2'

# Use Sprockets to deal with assets in the dummy app
gem 'sprockets-rails'

# Rack vulnerable to ReDoS in content type parsing
gem 'rack', '~> 3.0.10'

# REXML contains a denial of service vulnerability
gem 'rexml', '>= 3.2.7'

# Temporary use this branch because it solves a bug
# gem 'maglev-injectable', path: '../injectable'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

group :development, :test do
  # Use SCSS for stylesheets
  gem 'bcrypt'

  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'rspec-rails'

  gem 'rubocop', require: false
  gem 'rubocop-rails_config'
  gem 'rubocop-rspec'

  gem 'generator_spec'

  gem 'nokogiri', '>= 1.15.6'

  gem 'annotate'

  gem 'rdoc', '>= 6.6.3.1'

  gem 'error_highlight', '>= 0.4.0'
end

group :test do
  gem 'simplecov', require: false
end
