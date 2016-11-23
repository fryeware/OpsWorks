#!/usr/bin/env ruby
# encoding: Windows-1252
Chef::Log.info("******Creating No Connect PM Scheduled Task******")

powershell_script "PSNoConnectsSWL" do
  code <<-EOH
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LinuxDev/NoConnectsSWL.ps1 -OutFile c:/Windows/Temp/NoConnectsSWL.ps1;
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LinuxDev/NoConnectsSWL.xml -OutFile c:/Windows/Temp/NoConnectsSWL.xml;
Register-ScheduledTask -Xml (get-content c:/Windows/Temp/NoConnectsSWL.xml | out-string) -TaskName \"No Evening Connections for Safeweb Linux\" -User safeweb\\safetydance -Password Pass4saf –Force;
    EOH
  guard_interpreter :powershell_script
  end
  Chef::Log.info("****** No Connect PM Scheduled Task Created******")