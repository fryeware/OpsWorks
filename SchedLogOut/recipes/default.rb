Chef::Log.info("******Downloading LogOut Scheduler Batch File.******")  
remote_file 'C:/Windows/Temp/logoutsched.bat' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/logoutsched.bat' 
  action :create
end
Chef::Log.info("****** Logout Scheduler Batch File Download Complete ******")
Chef::Log.info("******Downloading LogOut Scheduler XML File.******")
remote_file 'C:/Windows/Temp/LogOutUsers.xml' do
source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LogOutUsers.xml'
 action :create
 end
 Chef::Log.info("******Downloading LogAllOut PowerShell Script.******")  
remote_file 'C:/Windows/Temp/LogAllOut.ps1' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LogAllOut.ps1' 
  action :create
end
Chef::Log.info("****** LogAllOut PowerShell download complete ******")
Chef::Log.info("******Executing LogOut Scheduler Batch File ******")
execute 'logoutsched' do
  command 'C:/Windows/Temp/logoutsched.bat'
end
Chef::Log.info("****** LogOut Scheduler Batch File Executed .******")

