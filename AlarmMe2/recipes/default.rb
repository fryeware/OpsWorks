#!/usr/bin/env ruby
# encoding: Windows-1252
Chef::Log.info("******Creating AlarmMe2 Scheduled Task******")

powershell_script "AlarmMe2" do
  code <<-EOH
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe.ps1 -OutFile c:/Windows/Temp/AlarmMe2.ps1;
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe2.xml -OutFile c:/Windows/Temp/AlarmMe2.xml;
Register-ScheduledTask -Xml (get-content c:/Windows/Temp/AlarmMe2.xml | out-string) -TaskName \"Create AWS CloudWatch CPU Alarm\";
    EOH
  guard_interpreter :powershell_script
  end
  Chef::Log.info("******AlarmMe2 Scheduled Task Created******")