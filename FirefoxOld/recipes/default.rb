Chef::Log.info("******Downloading Firefox Old Version installer.******")  
remote_file 'C:/Windows/Temp/FirefoxSetup.exe' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LLNL_FF_38_3_0_ESR_wCCK.exe' 
  action :create
end
Chef::Log.info("******Executing Firefox Old Version installer ******")
execute 'firefox' do
  command 'C:/Windows/Temp/FirefoxSetup.exe /silent'
end
Chef::Log.info("****** Firefox Old Version install complete ******")
Chef::Log.info("******downloading firefox override.ini .******")
remote_file 'C:/PROGRA~2/MOZILL~1/override.ini' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/override.ini'
  action :create
end
remote_file 'C:/PROGRA~2/MOZILL~1/browser/override.ini' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/override.ini'
  action :create
end
Chef::Log.info("******Create Parent Directory for configuration files*********")
directory 'C:/PROGRA~2/MOZILL~1/browser/defaults/' do
  action :create
end
Chef::Log.info("*****Create Child Directory for configuration files**********")
directory 'C:/PROGRA~2/MOZILL~1/browser/defaults/preferences' do
  action :create
end
Chef::Log.info("******Downloading Firefox preferences .******")
remote_file 'C:/PROGRA~2/MOZILL~1/browser/defaults/preferences/AllUsers.js' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/AllUsers.js'
  action :create
end
Chef::Log.info("******Downloading Firefox autoupdate file .******")
remote_file 'C:/PROGRA~2/MOZILL~1/defaults/pref/autoupdate.js' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/autoupdate.js'
  action :create
  end
Chef::Log.info("******Firefox configuration complete .******")

