require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Budget2
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths << Rails.root.join('lib')
  end
end
