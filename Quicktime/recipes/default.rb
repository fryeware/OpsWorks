Chef::Log.info("******downloading Quicktime player ******")
remote_file 'C:/Windows/Temp/Quicktime.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Quicktime.exe'
  action :create
end
Chef::Log.info("******executing Quicktime installer ******")
execute 'Quicktime' do
  command 'C:/Windows/Temp/Quicktime.exe'
end
Chef::Log.info("****** Quicktime install complete ******")
