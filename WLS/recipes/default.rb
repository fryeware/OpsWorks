Chef::Log.info("******downloading WLS ******")
remote_file 'C:/Windows/Temp/WLS.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/WLS/WLS.exe'
  action :create
end
Chef::Log.info("******executing WLS installer ******")
execute 'WLS' do
  command 'C:/Windows/Temp/WLS.exe'
end
Chef::Log.info("******WLS install complete ******")
Chef::Log.info("******downloading WLS Configure ******")
remote_file 'C:/Windows/Temp/WLS-SafewebConfig.reg' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/WLS/WLS-SafewebConfig.reg'
  action :create
end
Chef::Log.info("******Configure WLS ******")
execute 'WLSconfig' do
  command 'C:/Windows/system32/reg.exe  /import C:/Windows/Temp/WLS-SafewebConfig.reg' 
end
Chef::Log.info("******WLS Configure Complete ******")