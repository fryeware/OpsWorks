Chef::Log.info("******Starting OpenDNS ******") 
 windows_service 'Umbrella_RC' do 
   action :start 
 end 
 Chef::Log.info("******OpenDNS Started ******") 
 