Chef::Log.info("******downloading wintap installer.******")
remote_file 'C:/Windows/Temp/Wintap4Safeweb.EXE' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Wintap4Safeweb.EXE'
  action :create
end
Chef::Log.info("******executing wintap installer ******")
execute 'wintap' do
  command 'C:/Windows/Temp/Wintap4Safeweb.EXE /S'
end
Chef::Log.info("******wintap install complete ******")
Chef::Log.info("******starting wintap ******") 
 windows_service 'Wintap' do 
   action :start 
 end 
 Chef::Log.info("******wintap started ******") 