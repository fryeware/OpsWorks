Chef::Log.info("******downloading flash installer.******")
remote_file 'C:/Windows/Temp/flash_player.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/flash_player.exe'
  action :create
end
Chef::Log.info("******executing flash installer ******")
execute 'flash' do
  command 'C:/Windows/Temp/flash_player -install'
end
Chef::Log.info("******flash install complete *******")
