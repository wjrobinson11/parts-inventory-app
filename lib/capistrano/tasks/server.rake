namespace :server do 
 
 task :publicize__pid do

    on roles(:all) do
      pid_file = release_path + 'tmp/pids/puma.pid'
      execute 'sudo', 'chown ubuntu:ubuntu', pid_file
    end

    on roles(:all) do
      sox_file = release_path + 'tmp/sockets/puma.sock'
      execute 'sudo', 'chown ubuntu:ubuntu', sox_file
    end

  end

  before 'deploy:cleanup', 'server:publicize__pid'
end