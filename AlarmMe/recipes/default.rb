Chef::Log.info("******Downloading Powershell AlarmMe script to creat AWS CloudWatch Alarm ******")

remote_file 'C:/Windows/Temp/AlarmMe.ps1' do
source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe.ps1'
action :create
end
Chef::Log.info("******Executing PowerShell Script ******")
execute 'AlarmMe' do
command 'powershell -f C:/Windows/Temp/AlarmMe.ps1'
end
Chef::Log.info("******AlarmMe PS Script complete ******")