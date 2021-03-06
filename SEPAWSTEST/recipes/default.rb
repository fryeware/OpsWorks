

Chef::Log.info("******Downloading SEPClientTest installer.******")
remote_file 'C:/Windows/Temp/sepclienttest.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SepClientTest/sepclienttest.exe'
  action :create
end
Chef::Log.info("******Downloading SEPClientTest Batch File.******")
remote_file 'C:/Windows/Temp/runsep.bat' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SepClientTest/runsep.bat'
  action :create
end
Chef::Log.info("******Executing SEPClientTest Batch File ******")
execute 'runsep' do
  command 'C:/Windows/Temp/runsep.bat'
end
Chef::Log.info("****** SEPClientTest install complete ******")
Chef::Log.info("******Downloading Quiet SEP Reg Key ******")
remote_file 'C:/Windows/Temp/Quiet_SEP.reg' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Quiet_SEP.reg'
  action :create
end
Chef::Log.info("******Importing Quiet SEP Reg Key ******")
execute 'sepconfig' do
  command 'C:/Windows/system32/reg.exe import C:/Windows/Temp/Quiet_SEP.reg'
end
Chef::Log.info("******Configuration of SEPClientTest Complete.******")
