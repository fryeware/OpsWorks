Chef::Log.info("******Downloading Powershell AlarmMe script to creat AWS CloudWatch Alarm ******")
remote_file 'C:/Windows/Temp/AlarmMe.ps1' do
source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe.ps1'
action :create
end
Chef::Log.info("******Download Complete for Powershell script to create AWS CloudWatch Alarm ******")

Chef::Log.info("******Downloading Powershell script to create scheduled task that launches AWS CloudWatch Alarm ******")
remote_file 'C:/Windows/Temp/SchedAlarm.ps1' do
source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/SchedAlarm.ps1'
action :create
end
Chef::Log.info("******Download Complete for Powershell script to create scheduled task that launches AWS CloudWatch Alarm ******")

Chef::Log.info("******Downloading scheduled task template ******")
remote_file 'C:/Windows/Temp/AlarmMe.xml' do
source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe.xml'
action :create
end
Chef::Log.info("******Download Complete for scheduled task template******")

Chef::Log.info("******Executing PowerShell Script to create scheduled task ******")
execute 'AlarmMe' do
command 'powershell -f C:/Windows/Temp/SchedAlarm.ps1'
end
Chef::Log.info("******Scheduled task created******")