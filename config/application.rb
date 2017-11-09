require_relative 'boot'

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module DesignPrinciples
  class Application < Rails::Application
    config.load_defaults 5.1

    config.action_dispatch.rack_cache = nil
  end
end