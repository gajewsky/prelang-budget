set :stage, :production

server '139.59.211.42', user: 'deploy', roles: %w{web app}
