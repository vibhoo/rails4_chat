# config valid only for Capistrano 3.1

lock '3.2.1'

set :application, 'practise_rails4chat'
#set :repo_url, 'git@example.com:me/my_repo.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
set :scm, :git
set :repository, "git@github.com:vibhoo/rails4_chat.git"
set :scm_passphrase,""

set :ssh_options, {:forward_agent => true}
set :default_run_options,{:pty =>true}
set :stages, ["vagrant"]
set :default_stage,"vagrant"


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
