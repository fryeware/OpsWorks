Chef::Log.info("******Downloading SEPClient installer.******")
remote_file 'C:/Windows/Temp/sepclient.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/sepclient.exe'
  action :create
end
Chef::Log.info("******Executing SEPClient installer ******")
execute 'sepclient' do
  command 'C:/Windows/Temp/sepclient.exe'
end
Chef::Log.info("****** SEPClient install complete ******")
Chef::Log.info("******Downloading Quiet SEP Reg Key ******")
remote_file 'C:/Windows/Temp/Quiet_SEP.reg' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Quiet_SEP.reg'
  action :create
end
Chef::Log.info("******Importing Quiet SEP Reg Key ******")
execute 'sepconfig' do
  command 'C:/Windows/system32/reg.exe import C:/Windows/Temp/Quiet_SEP.reg'
end
Chef::Log.info("******Configuration of SEPClient Complete.******")
