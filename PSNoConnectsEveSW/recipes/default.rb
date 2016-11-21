Chef::Log.info("******Creating No Connect Eve Scheduled Task******")

powershell_script "PSNoConnectsEveSW" do
  code <<-EOH
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/NoConnectsSW.ps1 -OutFile c:/Windows/Temp/NoConnectsSW.ps1;
Invoke-WebRequest https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/NoConnectsSW.xml -OutFile c:/Windows/Temp/NoConnectsSW.xml;
Register-ScheduledTask -Xml (get-content c:/Windows/Temp/NoConnectsSW.xml | out-string) -TaskName \"No Evening Connections for Safeweb\" -User safeweb\\safetydance -Password Pass4saf –Force;
    EOH
  guard_interpreter :powershell_script
  end
  Chef::Log.info("****** No Connect Eve Scheduled Task Created******")