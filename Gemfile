# Gemfile

source 'https://rubygems.org'


gem 'rails', '4.2.6'
# create api-only application
gem 'rails-api'
# gem 'sqlite3'
gem 'pg'
# serializer for data
gem 'active_model_serializers', '~> 0.8.1'
# cross origin policy rack middleware
gem 'rack-cors', :require => 'rack/cors'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end

group :production do
  gem 'rails_12factor'
end

ruby "2.3.0"
