Chef::Log.info("******downloading chrome installer.******")
remote_file 'C:/Windows/Temp/ChromeStandaloneSetup.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/ChromeStandaloneSetup.exe'
  action :create
end
Chef::Log.info("******executing chrome installer ******")
execute 'chrome' do
  command 'C:/Windows/Temp/ChromeStandaloneSetup.exe /silent /install'
end
Chef::Log.info("******chrome install complete ******")