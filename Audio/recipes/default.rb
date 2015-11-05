Chef::Log.info("******starting windows audio ******")
windows_service 'Audiosrv' do
  action :configure_startup
  startup_type :automatic
end
Chef::Log.info("******audio started ******")