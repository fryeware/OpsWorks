Chef::Log.info("******downloading safeweb shutdown tooling.******")
remote_file 'C:/Windows/Temp/TerminateEc2.exe' do
  source 'http://172.31.31.252/apps/TerminateEc2Dev.exe'
  action :create
end
remote_file 'C:/Windows/Temp/Newtonsoft.Json.dll' do
  source 'http://172.31.31.252/apps/Newtonsoft.Json.dll'
  action :create
end
Chef::Log.info("******executing safeweb shutdown code ******")
execute 'shutdown' do
  command 'C:/Windows/Temp/TerminateEc2.exe'
end
