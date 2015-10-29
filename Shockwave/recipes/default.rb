Chef::Log.info("******downloading Shockwave player ******")
remote_file 'C:/Windows/Temp/Shockwave.msi' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Shockwave.msi'
  action :create
end
Chef::Log.info("******executing Shockwave installer ******")
execute 'Shockwave' do
  command 'C:/Windows/Temp/Shockwave.msi /q /norestart'
end
Chef::Log.info("****** Shockwave install complete ******")
