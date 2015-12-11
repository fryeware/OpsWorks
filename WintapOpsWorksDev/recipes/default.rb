Chef::Log.info("******downloading wintap installer.******")
remote_file 'C:/Windows/Temp/Wintap4Safeweb.EXE' do
  source 'http://172.31.31.252/apps/Wintap4SafewebOpsWorks/Wintap4Safeweb.EXE'
  action :create
end
Chef::Log.info("******executing wintap installer ******")
execute 'wintap' do
  command 'C:/Windows/Temp/Wintap4Safeweb.EXE /S'
end
Chef::Log.info("******wintap install complete, installing DEV provisioning tool ******")
remote_file 'C:/Program Files/LLNL/Wintap/Safeweb/ProvisionRDS.exe' do
  source 'http://172.31.31.252/apps/Wintap4SafewebOpsWorksDev/OpsWorksClient.exe'
  action :create
end
Chef::Log.info("******starting wintap ******") 
 windows_service 'Wintap' do 
   action :start 
 end 
 Chef::Log.info("******wintap started ******") 