Chef::Log.info("******downloading Silverlight installer ******")
remote_file 'C:/Windows/Temp/Silverlight_x64.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Silverlight_x64.exe'
  action :create
end
Chef::Log.info("******executing Silverlight installer ******")
execute 'Silverlight' do
  command 'C:/Windows/Temp/Silverlight_x64.exe /q'
end
Chef::Log.info("****** Silverlight install complete ******")
