source 'https://rubygems.org'

gem 'airbrake', '3.1.17'
gem 'rails', '~> 4.2.0'
gem 'unicorn', '4.3.1'
gem 'logstasher', '0.4.8'
gem 'govuk_frontend_toolkit', '1.4.0'
gem 'plek', '1.11.0'
gem 'gds-api-adapters', '~> 48.0.0'

if ENV['SLIMMER_DEV']
  gem 'slimmer', :path => '../slimmer'
else
  gem 'slimmer', '~> 11.1'
end

gem 'sass-rails', '~> 5.0'
gem 'therubyracer', platforms: :ruby
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'mocha', '0.13.3', require: false
  gem 'test-unit', '3.2.3'
  gem 'thin'
end
