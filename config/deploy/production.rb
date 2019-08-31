set :stage, :production
server_ip = Rails.application.credentials.capistrano.dig(:production, :server)
user = Rails.application.credentials.capistrano.dig(:production, :user)

server server_ip, user: user, roles: %w{web db app}
