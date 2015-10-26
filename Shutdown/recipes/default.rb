Chef::Log.info("******downloading safeweb shutdown tooling.******")
remote_file 'C:/Windows/Temp/RemoveSessionHost.exe' do
  source 'http://172.31.31.252/apps/RemoveSessionHost.exe'
  action :create
end
remote_file 'C:/Windows/Temp/RemoveSessionHost.exe.config' do
  source 'http://172.31.31.252/apps/RemoveSessionHost.exe.config'
  action :create
end
Chef::Log.info("******executing safeweb shutdown code ******")
execute 'shutdown' do
  command 'C:/Windows/Temp/RemoveSessionHost.exe'
end
