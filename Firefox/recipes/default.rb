Chef::Log.info("******downloading firefox installer.******")
remote_file 'C:/Windows/Temp/FirefoxSetup.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LLNL_FF_38_3_0_ESR_wCCK.EXE'
  action :create
end
Chef::Log.info("******executing firefox installer ******")
execute 'firefox' do
  command 'C:/Windows/Temp/FirefoxSetup.exe'
end
Chef::Log.info("******firefox install complete ******")
Chef::Log.info("******downloading firefox override.ini .******")
remote_file 'c:/program files(x86)/Mozilla Firefox/override.ini' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/override.ini'
  action :create
end
remote_file 'c:/program files(x86)/Mozilla Firefox/browser/override.ini' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/override.ini'
  action :create
end
Chef::Log.info("******downloading firefox preferences .******")
remote_file 'C:/Program Files (x86)/Mozilla Firefox/browser/defaults/preferences/AllUsers.js' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/AllUsers.js'
  action :create
end
Chef::Log.info("******Firefox configuration complete .******")