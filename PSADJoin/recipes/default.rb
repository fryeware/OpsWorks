Chef::Log.info("******PS AD enrollement into Safeweb Domain******")

powershell_script "Run AD enrollment PS script" do
  code <<-EOH
Set-DNSClientServerAddress -interfaceIndex 12 -ServerAddresses ("172.31.43.98","172.31.37.33");
$cred = New-Object System.Management.Automation.PsCredential("safeweb\safetydance", (ConvertTo-SecureString "Pass4saf" -AsPlainText -Force));
Add-Computer -DomainName "Safeweb.AWS.Net" -OUPath "OU=SessionHosts,DC=safeweb,DC=aws,DC=net" -Credential $cred;
Restart-Computer;
  EOH
  guard_interpreter :powershell_script
  end