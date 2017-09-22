require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DesignPrinciples
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.assets.precompile += %w(
      application.css
      application-ie6.css
      application-ie7.css
      application-ie8.css
      search.css
      main.js
    )

    # Path within public/ where assets are compiled to
    config.assets.prefix = 'designprinciples'
    config.assets.manifest = Rails.root.join 'public/designprinciples'

    # Paths used by helpers when generating links to assets
    config.action_controller.assets_dir = Rails.root.join 'public/designprinciples'
    config.action_controller.javascripts_dir = Rails.root.join 'public/designprinciples/javascripts'
    config.action_controller.stylesheets_dir = Rails.root.join 'public/designprinciples/stylesheets'

    # Disable Rack::Cache
    config.action_dispatch.rack_cache = nil
  end
end
