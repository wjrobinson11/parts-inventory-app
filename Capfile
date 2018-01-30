
# require 'capistrano/rvm'
# require 'capistrano/rails'

# Load DSL and set up stages
require 'fileutils'
require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/nginx'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'
require 'capistrano/upload-config'
require 'sshkit/sudo'

require 'capistrano/puma'
install_plugin Capistrano::Puma

require 'capistrano/puma/nginx'
install_plugin Capistrano::Puma::Nginx

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git



ROOT = File.expand_path('../', __FILE__)
TMP = ROOT + '/tmp'
# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
