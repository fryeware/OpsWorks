Chef::Log.info("******Downloading OpenDNS Scheduler Batch File.******")  
remote_file 'C:/Windows/Temp/opendns.bat' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/opendns.bat' 
  action :create
end
Chef::Log.info("****** OpenDNS Scheduler Batch File Download Complete ******")
Chef::Log.info("******Downloading OpenDNS Scheduler XML File.******")
remote_file 'C:/Windows/Temp/OpenDNS_Install.xml' do
source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/OpenDNS_Install.xml'
 action :create
 end
 Chef::Log.info("******downloading OpenDNS installer.******")  
remote_file 'C:/Windows/Temp/opendns.msi' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/opendns.msi' 
  action :create
end
Chef::Log.info("****** OpenDNS Installer download complete ******")
Chef::Log.info("******Executing OpenDNS Scheduler Batch File ******")
execute 'schedopendns' do
  command 'C:/Windows/Temp/opendns.bat'
end
Chef::Log.info("****** OpenDNS Scheduler Batch File Executed .******")

