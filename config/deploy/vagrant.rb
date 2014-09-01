set :user, "vagrant"
set :stage, :vagrant
set :ssh_options, {
 keys: %w(~/.vagrant.d/insecure_private_key),
 forward_agent: true
}
role :all, "192.168.33.101", primary: true

set :domain_name, "domain.local"
