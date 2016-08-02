Chef::Log.info("******Downloading Desktop Configuration Powershell Script******")
remote_file 'C:/Windows/Temp/desktopconfig.ps1' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Desktops/desktopconfig.ps1'
  action :create
end
Chef::Log.info("******Executing DesktopConfig PowerShell Script ******")
execute 'desktopconfig' do
  command 'C:/Windows/Temp/desktopconfig.ps1'
end
Chef::Log.info("******Desktop Configuration PS Script complete ******")
