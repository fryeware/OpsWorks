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