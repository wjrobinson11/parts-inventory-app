# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "rfq_parts"
set :repo_url, "git@github.com:Keystack/rfq-parts.git"

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/application.yml', 'config/secrets.yml', 'config/puma.rb')
 
# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle','public/system', 'public/uploads')
 
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
 
# Default value for keep_releases is 5
# set :keep_releases, 5
# set :nginx_use_ssl, true
# set :nginx_ssl_certificate_key, "#{shared_path}/ssl/rfq.key"
# set :nginx_ssl_certificate, "#{shared_path}/ssl/rfq.crt"
set :nginx_server_name, "rfqparts.net"
set :nginx_config_name, "rfqparts"

# Puma:
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"

namespace :deploy do
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  after 'puma:smart_restart', 'nginx:restart'
end