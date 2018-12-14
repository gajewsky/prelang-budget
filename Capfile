require 'capistrano/setup'

require 'capistrano/deploy'

require 'capistrano/rails'
require 'capistrano/passenger'
require 'capistrano/rbenv'
set :rbenv_type, :user
set :rbenv_ruby, '2.5.3'

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
