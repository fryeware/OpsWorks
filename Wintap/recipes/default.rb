Chef::Log.info("******downloading wintap installer.******")
remote_file 'C:/Windows/Temp/Wintap4Safeweb.EXE' do
  source 'http://172.31.31.252/apps/Wintap4Safeweb.EXE'
  action :create
end
Chef::Log.info("******executing wintap installer ******")
execute 'wintap' do
  command 'C:/Windows/Temp/Wintap4Safeweb.EXE /S'
end
Chef::Log.info("******wintap install complete ******")