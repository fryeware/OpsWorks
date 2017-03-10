#!/usr/bin/env ruby
# encoding: Windows-1252
Chef::Log.info("******Creating User Logout Scheduled Task ******")

powershell_script 'PSLogOutRunt' do
  code <<-EOH
  $name=hostname;
  if($name.Contains("runt")){
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/PSLogOutSW.ps1 -OutFile c:/Windows/Temp/PSLogOutSW.ps1;
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/PSLogOutRunt.xml -OutFile c:/Windows/Temp/PSLogOutRunt.xml;
Register-ScheduledTask -Xml (get-content c:/Windows/Temp/PSLogOutRunt.xml | out-string) -TaskName \"Log Out Runt User Connections for Safeweb\" -User safeweb\\safetydance -Password Pass4saf -Force;}

  if($name.Contains("rds")){
  Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/PSLogOutSW.ps1 -OutFile c:/Windows/Temp/PSLogOutSW.ps1;
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/PSLogOutSW.xml -OutFile c:/Windows/Temp/PSLogOutSW.xml;
Register-ScheduledTask -Xml (get-content c:/Windows/Temp/PSLogOutSW.xml | out-string) -TaskName \"Log Out RDS User Connections for Safeweb\" -User safeweb\\safetydance -Password Pass4saf –Force;}

if($name.Contains("linux")){
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LinuxDev/PSLogOutSWL.ps1 -OutFile c:/Windows/Temp/PSLogOutSWL.ps1;
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LinuxDev/PSLogOutSWL.xml -OutFile c:/Windows/Temp/PSLogOutSWL.xml;
Register-ScheduledTask -Xml (get-content c:/Windows/Temp/PSLogOutSWL.xml | out-string) -TaskName \"Log Out RDS Linux User Connections for Safeweb Linux\" -User safeweb\\safetydance -Password Pass4saf –Force;}
    EOH
  guard_interpreter :powershell_script
  end
  Chef::Log.info("******User Logout Scheduled Task Created******")