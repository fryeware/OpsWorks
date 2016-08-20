Chef::Log.info("******Remove system from Safeweb AD domain.******")

powershell_script "ADUnjoin" do
  code <<-EOH
    $cred = New-Object System.Management.Automation.PsCredential("Safeweb\safetydance", (ConvertTo-SecureString "Pass4saf" -AsPlainText -Force))
	Remove-Computer -UnjoinDomainCredential $cred -Force
  EOH
  guard_interpreter :powershell_script
  end