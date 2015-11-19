Chef::Log.info("******downloading safeweb shutdown tooling.******")
remote_file 'C:/Windows/Temp/TerminateEc2.exe' do
  source 'http://172.31.31.252/apps/TerminateEc2.exe'
  action :create
end
remote_file 'C:/Windows/Temp/TerminateEc2.exe.config' do
  source 'http://172.31.31.252/apps/RemoveSessionHostConfig.exe'
  action :create
end
Chef::Log.info("******executing safeweb shutdown code ******")
execute 'shutdown' do
  command 'C:/Windows/Temp/TerminateEc2.exe'
end
