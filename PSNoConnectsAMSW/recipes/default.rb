#!/usr/bin/env ruby
# encoding: Windows-1252
Chef::Log.info("******Creating No Connect AM Scheduled Task******")

powershell_script "PSNoConnectsAMSW" do
  code <<-EOH
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/NoConnectsSW.ps1 -OutFile c:/Windows/Temp/NoConnectsSW.ps1;
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/NoConnectsAMSW.xml -OutFile c:/Windows/Temp/NoConnectsAMSW.xml;
Register-ScheduledTask -Xml (get-content c:/Windows/Temp/NoConnectsAMSW.xml | out-string) -TaskName \"No Morning Connections for Safeweb\" -User safeweb\\safetydance -Password Pass4saf –Force;
    EOH
  guard_interpreter :powershell_script
  end
  Chef::Log.info("****** No Connect AM Scheduled Task Created******")