# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'dbms'
set :repo_url, 'git@gitdev.impaq.impaqinternational.com:syue/DBMS.git'
set :deploy_via, :remote_cache
set :branch, "master"
# set :branch, "dark_theme"

set :deploy_to, '/home/deployer/apps/dbms'

set :linked_files, %w{config/database.yml config/secrets.yml}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

set :sidekiq_config, '/home/deployer/apps/dbms/current/config/sidekiq.yml'

set :pty, false

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