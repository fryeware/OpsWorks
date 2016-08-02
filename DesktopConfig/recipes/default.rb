Chef::Log.info("******Running Powershell commands to configure network and join AD domain ******")

powershell_script "Run Desktopconfig" do
    code <<-EOH
    
# Configure PowerShell to accept remote commands.
set-executionpolicy remotesigned -Force;

# Configure DNS network settings
Set-DNSClientServerAddress -interfaceIndex 12 -ServerAddresses ("172.31.43.98","172.31.37.33");

# Set Timezone
tzutil /s "Pacific Standard Time";

# Install the Desktop Experience feature
Install-WindowsFeature  Desktop-Experience;

# Credentials for joining system to AD domain
$cred = New-Object System.Management.Automation.PsCredential("Safeweb\safetydance", (ConvertTo-SecureString "Pass4saf" -AsPlainText -Force));
$cred.GetNetworkCredential().Password;

# Add system to AD domain and reboot
Add-Computer -DomainName "Safeweb.AWS.Net" -OUPath "OU=SessionHosts,DC=safeweb,DC=aws,DC=net" -Credential $cred;
Restart-Computer;

EOH
guard_interpreter :desktopconfig
end