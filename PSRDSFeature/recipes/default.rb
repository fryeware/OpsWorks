Chef::Log.info("******Installing RDS Features.******")

powershell_script "Install RDS Features" do
  code <<-EOH
    Add-WindowsFeature -Name RDS-RD-Server -IncludeAllSubFeature
  EOH
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name RDS-RD-Server).installed"
end