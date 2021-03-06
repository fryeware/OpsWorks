Chef::Log.info("******Downloading Powershell RDSAddServer script to join AD and prep for RDS ******")

remote_file 'C:/Windows/Temp/RDSAddServer.ps1' do
source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/RDSAddServer.ps1'
action :create
end
Chef::Log.info("******Executing PowerShell Script ******")
execute 'SWRDSAddServer' do
command 'powershell -f C:/Windows/Temp/RDSAddServer.ps1'
end
Chef::Log.info("******RDSAddServer PS Script complete ******")