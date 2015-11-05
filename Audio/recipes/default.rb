Chef::Log.info("******starting windows audio ******")
windows_service 'Audiosrv' do
  action :start
  startup_type :automatic
end
Chef::Log.info("******audio started ******")