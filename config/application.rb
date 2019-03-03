require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Budget2
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths << Rails.root.join('lib')
    config.i18n.load_path += Dir[config.root.join('frontend/components/**/*.yml')]
    config.autoload_paths << config.root.join('frontend/components')

    config.generators do |g|
      g.komponent stimulus: true
      g.template_engine = :slim
    end
  end
end
