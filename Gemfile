source 'https://rubygems.org'
source 'https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/'

gem 'airbrake', '3.1.17'
gem 'rails', '3.2.20'
gem 'unicorn', '4.3.1'
gem 'logstasher', '0.4.8'
gem 'rack-rewrite', '1.3.3'
gem 'govuk_frontend_toolkit', '1.4.0'
gem 'plek', '1.5.0'
gem 'rummageable'
gem 'gds-api-adapters', '7.18.0'

if ENV['SLIMMER_DEV']
  gem 'slimmer', :path => '../slimmer'
else
  gem 'slimmer', '3.25.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '3.2.5'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '1.2.6'
end

group :development, :test do
  gem 'rspec-rails', '2.11.0'
  gem 'capybara', '1.1.2'
  gem 'mocha', '0.13.3', require: false
  gem 'thin'
end
