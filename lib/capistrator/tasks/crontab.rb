namespace :crontab do

  desc "Replace crontab"
  task :replace, :roles => :crontab do
    crontab_users = fetch(:crontab_users, nil) || fetch(:crontab_user, nil) || user
    crontab_dir = fetch(:crontab_dir, File.join('config', 'crontab')) 
    crontab_tmp_dir = fetch(:crontab_tmp_dir, '/tmp')

    crontab_users.to_a.each do |crontab_user|

      filename = "#{crontab_user}@$CAPISTRANO:HOST$"
      local_file  = File.join(crontab_dir, filename)
      remote_file = File.join(crontab_tmp_dir, "capistrano-crontab-#{Time.now.to_i}-#{filename}")
      
      upload(local_file, remote_file)
    
      crontab_user == user ? run "crontab #{remote_file}" : 
	sudo "crontab -u #{crontab_user} #{remote_file}", :pty => fetch(:crontab_pty, false)
      
      run "rm -f #{remote_file}"

    end

  end

  desc "Clear crontab"
  task :clear, :roles => :crontab do
    crontab_users = fetch(:crontab_users, nil) || fetch(:crontab_user, nil) || user
    
    crontab_users.to_a.each do |crontab_user|
      crontab_user == user ? "crontab /dev/null" : 
        sudo "crontab -u #{crontab_user} /dev/null", :pty => fetch(:crontab_pty, false)
    end
  end

end
