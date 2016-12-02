Chef::Log.info("******Downloading Powershell AlarmMe script to creat AWS CloudWatch Alarm ******")
remote_file 'C:/Windows/Temp/AlarmMe.ps1' do
source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe.ps1'
#!/usr/bin/env ruby
# encoding: Windows-1252
Chef::Log.info("******Creating AlarmMe2 Scheduled Task ******")

powershell_script "AlarmMe2" do
  code <<-EOH
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe.ps1 -OutFile c:/Windows/Temp/AlarmMe.ps1;
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe.xml -OutFile c:/Windows/Temp/AlarmMe.xml;
Register-ScheduledTask -Xml (get-content c:/Windows/Temp/AlarmMe.xml | out-string) -TaskName \"Create AWS Alarm in CloudWatch\"
    EOH
  guard_interpreter :powershell_script
  end
  Chef::Log.info("******Completed AlarmMe2 Scheduled Task Created******")