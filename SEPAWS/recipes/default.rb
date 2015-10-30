
Chef::Log.info("******Downloading Quiet SEP Reg Key ******")
remote_file 'C:/Windows/Temp/Quiet_SEP.reg' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Quiet_SEP.reg'
  action :create
end
Chef::Log.info("******Importing Quiet SEP Reg Key ******")
execute 'sepconfig' do
  command 'C:/Windows/system32/reg.exe import C:/Windows/Temp/Quiet_SEP.reg'
end
Chef::Log.info("******Configuration of SEPAWS Complete.******")
Chef::Log.info("******Downloading SEPAWS installer.******")
remote_file 'C:/Windows/Temp/sepaws.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/sepaws.exe'
  action :create
end
Chef::Log.info("******Executing SEPAWS installer ******")
execute 'sepaws' do
  command 'C:/Windows/Temp/sepaws.exe /s'
end
Chef::Log.info("****** SEPAWS install complete ******")

