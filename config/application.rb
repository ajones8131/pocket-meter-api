require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

#added
CORS_ALLOW_ORIGIN = "*"
CORS_ALLOW_METHODS = %w{GET POST PUT OPTIONS DELETE}.join(',')
#/added
module PocketMeterApi
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    #added
    config.action_dispatch.default_headers = {
      "Access-Controll-Allow-Origin" => CORS_ALLOW_ORIGIN,
      "Access-Controll-Allow-Methods" => CORS_ALLOW_METHODS,
    }
    #/added
  end



end
