Chef::Log.info("******Stopping OpenDNS ******") 
 windows_service 'Umbrella_RC' do 
   action :stop 
 end 
 Chef::Log.info("******Running ipconfig /flushdns ******") 
 execute 'stopopendns' do
	command 'c:/Windows/System32/ipconfig.exe /flushdns'
end
Chef::Log.info("****Running ipcofig /registerdns *******")
execute 'stopopendns' do
	command 'c:/Windows/System32/ipconfig.exe /registerdns'
end
Chef::Log.info("*****Download DNS Registry Entry")
remote_file 'C:/Windows/Temp/m3networkdns.reg' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/m3networkdns.reg'
  action :create
end
Chef::Log.info("****Import DNS Registry Entry*******")
execute 'stopopendns' do
	command 'C:/Windows/system32/reg.exe import C:/Windows/Temp/m3networkdns.reg' 
end
Chef::Log.info("******2nd Running ipconfig /flushdns ******") 
 execute 'stopopendns' do
	command 'c:/Windows/System32/ipconfig.exe /flushdns'
end
Chef::Log.info("****2nd Running ipcofig /registerdns *******")
execute 'stopopendns' do
	command 'c:/Windows/System32/ipconfig.exe /registerdns'
end
Chef::Log.info("****OpenDNS Stopped and DC set to DNS completed******")


 
