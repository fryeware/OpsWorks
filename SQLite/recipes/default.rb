Chef::Log.info("******downloading SQLite file 1 ******")
remote_file 'C:/Windows/Temp/sqlite-netFx45-setup-bundle-x64-2012-1.0.97.0.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/sqlite-netFx45-setup-bundle-x64-2012-1.0.97.0.exe'
  action :create
end
Chef::Log.info("******downloading SQL file 2 ******")
remote_file 'C:/Windows/Temp/sqlite-netFx45-setup-x64-2012-1.0.97.0.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/sqlite-netFx45-setup-x64-2012-1.0.97.0.exe'
  action :create
end
Chef::Log.info("******executing SQLite file 1 installer ******")
execute 'WLS' do
  command 'C:/Windows/Temp/sqlite-netFx45-setup-bundle-x64-2012-1.0.97.0.exe /silent'
end
Chef::Log.info("******SQLite file 1 install complete ******")

Chef::Log.info("******executing SQLite file 2 installer ******")
execute 'WLS' do
  command 'C:/Windows/Temp/sqlite-netFx45-setup-x64-2012-1.0.97.0.exe /silent'
end
Chef::Log.info("******SQLite file 2 install complete ******")

Chef::Log.info("******SQLite Installation Complete ******")