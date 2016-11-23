#!/usr/bin/env ruby
# encoding: Windows-1252
Chef::Log.info("******Creating Evening Logout Scheduled Task ******")

powershell_script "PSLogOutSW" do
  code <<-EOH
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/PSLogOutSW.ps1 -OutFile c:/Windows/Temp/PSLogOutSW.ps1;
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/PSLogOutSW.xml -OutFile c:/Windows/Temp/PSLogOutSW.xml;
Register-ScheduledTask -Xml (get-content c:/Windows/Temp/PSLogOutSW.xml | out-string) -TaskName \"Log Out RDS User Connections for Safeweb\" -User safeweb\\safetydance -Password Pass4saf –Force;
    EOH
  guard_interpreter :powershell_script
  end
  Chef::Log.info("******Evening Logout Scheduled Task Created******")