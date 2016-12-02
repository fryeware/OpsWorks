#!/usr/bin/env ruby
# encoding: Windows-1252
Chef::Log.info("******Download AWS CloudWatch Alarm Script ******")

powershell_script "AlarmMe2" do
  code <<-EOH
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/AlarmMe.ps1 -OutFile c:/Windows/Temp/AlarmMe.ps1;
powershell.exe -file \"c:/Windows/Temp/AlarmMe.ps1\"
EOH
  guard_interpreter :powershell_script
  end
  Chef::Log.info("******PS Created AWS Alarm in CloudWatch******")