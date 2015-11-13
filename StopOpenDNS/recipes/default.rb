Chef::Log.info("******Stopping OpenDNS ******") 
 windows_service 'Umbrella_RC' do 
   action :stop 
 end 
 Chef::Log.info("******Running ipconfig /flushdns ******") 
 execute 'ipconfigflush'
	command 'c:/Windows/System32/ipconfig.exe /flushdns'
end
Chef::Log.info("****Running ipcofig /registerdns *******")
execute 'ipconfigreg'
	command 'c:/Windows/System32/ipconfig.exe /registerdns'
end
Chef::Log.info("*****Download DNS Registry Entry")
remote_file 'C:/Windows/Temp/m3networkdns.reg' do
  source 'http://172.31.31.252/apps/m3networkdns.reg'
  action :create
end
Chef::Log.info("****Import DNS Registry Entry*******")
execute 'regimport'
	command 'C:/Windows/system32/reg.exe import C:/Windows/Temp/m3networkdns.reg' 
end
Chef::Log.info("******2nd Running ipconfig /flushdns ******") 
 execute 'ipconfigflush'
	command 'c:/Windows/System32/ipconfig.exe /flushdns'
end
Chef::Log.info("****2nd Running ipcofig /registerdns *******")
execute 'ipconfigreg'
	command 'c:/Windows/System32/ipconfig.exe /registerdns'
end
Chef::Log.info("****OpenDNS Stopped and DC set to DNS completed******")


 
