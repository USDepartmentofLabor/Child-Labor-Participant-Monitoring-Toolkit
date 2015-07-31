set :password, ask('Server password', nil)

server(
  "10.1.1.27",
  user: 'deployer',
  roles: %w{web db app worker},
  ssh_options: {
    forward_agent: true,
    auth_methods: %w{password},
    password: fetch(:password),
    port: 22
  }
)