Chef::Log.info("******Downloading Powershell AlarmMe2 script to creat AWS CloudWatch Alarm ******")
remote_file 'C:/Windows/Temp/AlarmMe2.ps1' do
source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe.ps1'
action :create
end
Chef::Log.info("******Download Complete for Powershell script to create AWS CloudWatch Alarm ******")

Chef::Log.info("******Executing PowerShell Script to create AWS CloudWatch Alarm******")
execute 'AlarmMe2' do
command 'powershell -f C:/Windows/Temp/AlarmMe2.ps1'
end
Chef::Log.info("******AWS CloudWatch Alarm Created******")