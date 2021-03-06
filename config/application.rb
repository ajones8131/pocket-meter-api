require File.expand_path('../boot', __FILE__)

require "rails"
require "rack/cors"
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

module PocketMeterApi
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    #added
    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins '*'
        resource '/cors',
          :headers => :any,
          :methods => [:post],
          :credentials => false,
          :max_age => 0

        resource '*',
        :headers => :any,
        :methods => [:get, :post, :delete, :put, :patch, :options, :head],
        :max_age => 0
      end
    end
    #/added
  end



end
