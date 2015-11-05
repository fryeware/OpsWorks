Chef::Log.info("******Downloading Office2013  Installer.******")
remote_file 'C:/Windows/Temp/officeme.bat' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/officeme.bat'
  action :create
end
Chef::Log.info("******Executing Office2013 installer ******")
execute 'office2013' do
  command 'C:/Windows/Temp/officeme.bat'
end
Chef::Log.info("******Office2013 install complete ******")
