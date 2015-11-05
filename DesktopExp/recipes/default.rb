Chef::Log.info("******Downloading Desktop Experiecne installer.******")
remote_file 'C:/Windows/Temp/DesktopExp.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/DesktopExp.exe'
  action :create
end
Chef::Log.info("******Executing Desktop Experience installer ******")
execute 'desktopexp' do
  command 'C:/Windows/Temp/DesktopExp.exe'
end
Chef::Log.info("******Desktop Experience installation complete ******")
