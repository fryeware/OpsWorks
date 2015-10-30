Chef::Log.info("******downloading firefox installer.******")  
remote_file 'C:/Windows/Temp/FirefoxSetup.exe' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LLNL_FF_38_3_0_ESR_wCCK.EXE' 
  action :create
end
Chef::Log.info("******executing firefox installer ******")
execute 'firefox' do
  command 'C:/Windows/Temp/FirefoxSetup.exe'
end
Chef::Log.info("****** firefox install complete ******")
Chef::Log.info("******downloading firefox override.ini .******")
remote_file 'C:/PROGRA~2/MOZILL~1/override.ini' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/override.ini'
  action :create
end
remote_file 'C:/PROGRA~2/MOZILL~1/browser/override.ini' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/override.ini'
  action :create
end
directory 'C:/PROGRA~2/MOZILL~1/browser/defaults/preferences' do
  action :create
end
Chef::Log.info("******downloading firefox preferences .******")
remote_file 'C:/PROGRA~2/MOZILL~1/browser/defaults/preferences/AllUsers.js' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/AllUsers.js'
  action :create
end
Chef::Log.info("******downloading firefox autoupdate file .******")
remote_file 'C:/PROGRA~2/MOZILL~1/browser/defaults/pref/autoupdate.js' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/autoupdate.js'
  action :create
  end
Chef::Log.info("******Firefox configuration complete .******")

