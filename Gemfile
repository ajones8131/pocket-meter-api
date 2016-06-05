# Gemfile

source 'https://rubygems.org'


gem 'rails', '4.2.6'
# create api-only application
gem 'rails-api'
# change from sqlite3 database to postgres(pg) database
# gem 'sqlite3'
gem 'pg'
# serializer for data
gem 'active_model_serializers', '~> 0.8.1'
# cross origin policy rack middleware
gem 'rack-cors', :require => 'rack/cors'

group :development do
  # preloader for faster development
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  # shortens db testing in r-spec
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  # rspec testing
  gem 'rspec-rails', '~> 3.0'
end

group :production do
  # heroku compatibility gem
  gem 'rails_12factor'
end

# Using ruby version 2.3.0
ruby "2.3.0"
