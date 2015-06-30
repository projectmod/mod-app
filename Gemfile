source 'https://rubygems.org'

ruby "2.2.2"

gem 'rails', '4.2.1'

# Front-end and javascript stacks
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass', '~> 3.3.4'
gem 'sprockets-rails', '>= 2.1.4'
gem 'slim-rails'

# Server and database stacks
gem 'pg'
gem 'puma'
gem 'rails_12factor', group: :production

# Environment
gem 'figaro'

# Authentication
gem 'pundit'
gem 'sorcery'

# Responders
gem 'responders'

# Development and Test gems
group :development, :test do
  gem 'spring'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'net-ssh', '~> 2.9.0'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'rb-fsevent'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'letter_opener'
  gem 'launchy'
end

group :development, :production do
  gem 'rails_admin'
end

# Documentation
gem 'sdoc', '~> 0.4.0', group: :doc
