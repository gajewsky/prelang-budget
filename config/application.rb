require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Calincome
  class Application < Rails::Application
    config.i18n.load_path += Dir[config.root.join('frontend/components/**/*.yml')]
    config.autoload_paths << config.root.join('frontend/components')

    config.generators do |g|
      g.komponent stimulus: true
      g.template_engine = :slim
    end
  end
end
