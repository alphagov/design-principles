source 'https://rubygems.org'

gem 'airbrake', '3.1.17'
gem 'rails', '3.2.20'
gem 'unicorn', '4.3.1'
gem 'logstasher', '0.4.8'
gem 'rack-rewrite', '1.3.3'
gem 'govuk_frontend_toolkit', '1.4.0'
gem 'plek', '1.5.0'
gem 'rummageable', '1.2.0'
gem 'gds-api-adapters', '18.3.0'

if ENV['SLIMMER_DEV']
  gem 'slimmer', :path => '../slimmer'
else
  gem 'slimmer', '8.2.1'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '3.2.5'
  gem 'therubyracer', '0.12.1', :platforms => :ruby
  gem 'uglifier', '1.2.6'
end

group :development, :test do
  gem 'rspec-rails', '2.11.0'
  gem 'capybara', '1.1.2'
  gem 'mocha', '0.13.3', require: false
  gem 'thin'
end
