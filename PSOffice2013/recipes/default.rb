Chef::Log.info("******Installing PSOffice2013******")

powershell_script "Install PSOffice2013" do
  code <<-EOH
    $cred = New-Object System.Management.Automation.PsCredential("Safeweb-upd1\scribe", (ConvertTo-SecureString "Pass4scr" -AsPlainText -Force));

New-PSDrive -PSProvider Filesystem -Name office2013 -Root "\\172.31.43.194\office" -Credential $cred;

office2013:\x64\setup.exe;
  EOH
  guard_interpreter :powershell_script
  end