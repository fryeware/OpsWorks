Chef::Log.info("******Installing Desktop Exp.******")

powershell_script "Install Desktop Exp" do
  code <<-EOH
    Install-WindowsFeature  Desktop-Experience
  EOH
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Desktop-Experience).installed"
end