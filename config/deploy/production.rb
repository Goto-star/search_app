server '54.238.206.240', user: 'ec2-user', roles: %w[app db web]

set :ssh_options, {
  port: 22,
  keys: [File.expand_path('~/.ssh/id_rsa')],
  forward_agent: true,
  auth_methods: %w[publickey]
}
