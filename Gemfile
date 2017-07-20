source 'https://rubygems.org'

gem 'airbrake', '3.1.17'
gem 'rails', '3.2.22.3'
gem 'unicorn', '4.3.1'
gem 'logstasher', '0.4.8'
gem 'govuk_frontend_toolkit', '1.4.0'
gem 'plek', '1.11.0'
gem 'gds-api-adapters', '47.2'

if ENV['SLIMMER_DEV']
  gem 'slimmer', :path => '../slimmer'
else
  gem 'slimmer', '9.0.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '3.2.5'
  gem 'therubyracer', '0.12.2', :platforms => :ruby
  gem 'uglifier', '1.2.6'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'mocha', '0.13.3', require: false
  gem 'test-unit', '3.2.3'
  gem 'thin'
end
