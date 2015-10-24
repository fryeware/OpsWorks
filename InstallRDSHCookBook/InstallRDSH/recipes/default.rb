Chef::Log.info("******downloading session host feature installer executable.******")
remote_file 'C:/Windows/Temp/InstallRDSH.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-bootstrap/InstallRDSH.exe'
  action :create
end
Chef::Log.info("******executing installrdsh ******")
execute 'InstallRDSH' do
  command 'c:/Windows/Temp/InstallRDSHn.exe'
end
Chef::Log.info("******session host feature install complete ******")