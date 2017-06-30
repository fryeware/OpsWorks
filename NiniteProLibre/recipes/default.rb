Chef::Log.info("******downloading NinitePro Includes Libre Office installer.******")
remote_file 'C:/Windows/Temp/NinitePro.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/NinitePro.exe'
  action :create
end
Chef::Log.info("******executing NiniePro Includes Libre Office installer ******")
execute 'niniteprotrial' do
  command 'C:/Windows/Temp/NinitePro.exe /select LibreOffice Spotify Chrome "Firefox ESR" Flash QuickTime Reader Shockwave Silverlight /silent c:/Windows/Temp/report.txt'
end
Chef::Log.info("****** NinitePro Includes Libre Office install complete ******")
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