Chef::Log.info("******starting windows audio ******")
windows_service 'Audiosrv' do
  action :start
end
Chef::Log.info("******audio started ******")