set :user, "vagrant"
set :ssh_options, {keys: ['~/.vagrant.d/insecure_private_key']}
server "192.168.33.101", user: "vagrant", roles: %w[web app db], primary: true
set :deploy_to, "/var/www/practise_rails4chat"
