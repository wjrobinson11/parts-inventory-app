namespace :upload do 
  task :configs do 
    file_path_db = ROOT + '/config/database.yml'

    on roles(:app) do 
      puts file_path_db
      puts shared_path

      upload! file_path_db, shared_path + 'database.yml'
    end
  end

  task sym_configs: :configs do 
    on roles(:all) do 
      db_to, db_from  = release_path + 'config/database.yml', shared_path + 'database.yml'    
      execute 'ln', "-s #{db_from} #{db_to}"
    end
  end

  after 'deploy:set_current_revision', 'upload:sym_configs'
end