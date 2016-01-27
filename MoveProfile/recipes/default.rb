

Chef::Log.info("******Downloading MoveProfile Reg Key ******")
remote_file 'C:/Windows/Temp/moveprofile.reg' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/moveprofile.reg'
  action :create
end
Chef::Log.info("******Importing MoveProfile Reg Key ******")
execute 'moveprofile' do
  command 'C:/Windows/system32/reg.exe import C:/Windows/Temp/moveprofile.reg'
end
Chef::Log.info("******Relocation of User Profile Complete.******")
