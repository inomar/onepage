# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "onepage"
set :repo_url, "git@github.com:inomar/onepage.git"
set :deploy_to, '/home/centos/onepage'
set :scm, :git
set :branch, 'feature/capistrano'

set :format, :pretty
set :log_level, :debug # :info or :debugs

set :pty, true
set :keep_releases, 3

# nodebrew
set :nodebrew_type, :user
set :nodebrew_node, 'v7.7.0'
set :nodebrew_map_bins, %w{npm node}
set :npm_flags, ''

# renv
set :rbenv_ruby, '2.4.0'
set :rbenv_type, :user
set :rbenv_path, '~/.rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
#set :rbenv_custom_path, '/home/centos/.rbenv'

set :default_env, {
		SECRET_KEY_BASE: ENV['SECRET_KEY_BASE'],
		DEVISE_SECRET_KEY: ENV['DEVISE_SECRET_KEY'],
		RAILS_SERVE_STATIC_FILES: true
}

# after 'npm:install', 'assets:build'
# namespace :assets do
# 	task :build do
# 		on roles(:web) do
# 			within fetch(:npm_target_path, release_path) do
# 				execute :npm, "run build:js"
# 			end
# 		end
# 	end
# end

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
	desc 'Restart application'
	task :restart do
		invoke 'unicorn:restart'
	end
end

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5
