source 'https://rubygems.org'
source 'https://gems.gemfury.com/vo6ZrmjBQu5szyywDszE/'

gem 'rails', '3.2.6'
gem 'unicorn', '4.3.1'
gem 'lograge', '0.0.6'

gem 'govuk_frontend_toolkit', '0.12.1'
gem 'plek', '1.1.0'
gem 'router-client', '3.1.0', :require => false

if ENV['SLIMMER_DEV']
  gem 'slimmer', :path => '../slimmer'
else
  gem 'slimmer', '3.9.5'
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
end
