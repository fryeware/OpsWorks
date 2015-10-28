Chef::Log.info("******downloading Ninite installer which contains Firefox, Chrome, Shockwave, QuickTime, SilverLight, Adobe Reader******")
remote_file 'C:/Windows/Temp/Ninite.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Ninite/Ninite.EXE'
  action :create
end
Chef::Log.info("******executing Ninite installer ******")
execute 'Ninite' do
  command 'C:/Windows/Temp/Ninite.exe'
end
Chef::Log.info("******Ninte install complete ******")
Chef::Log.info("******downloading firefox override.ini .******")
remote_file 'C:/PROGRA~2/MOZILL~1/override.ini' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Ninite/override.ini'
  action :create
end
remote_file 'C:/PROGRA~2/MOZILL~1/browser/override.ini' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Ninite/override.ini'
  action :create
end
directory 'C:/PROGRA~2/MOZILL~1/browser/defaults/preferences' do
  action :create
end
Chef::Log.info("******downloading firefox preferences .******")
remote_file 'C:/PROGRA~2/MOZILL~1/browser/defaults/preferences/AllUsers.js' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Ninite/AllUsers.js'
  action :create
end
Chef::Log.info("******downloading firefox autoupdate file .******")
remote_file 'C:/PROGRA~2/MOZILL~1/browser/defaults/pref/autoupdate.js' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Ninite/autoupdate.js'
  action :create
Chef::Log.info("******Firefox configuration complete .******")
