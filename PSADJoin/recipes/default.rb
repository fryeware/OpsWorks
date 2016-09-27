Chef::Log.info("******PS AD enrollement into Safeweb Domain******")

powershell_script "Set NIC to Safeweb DC for DNS Resolution" do
  code <<-EOH
Set-DNSClientServerAddress -interfaceIndex 12 -ServerAddresses ("172.31.43.98","172.31.37.33");
  EOH
  guard_interpreter :powershell_script
  end
Chef::Log.info("****Join Computer to Safeweb Domain****")
  # Join Safeweb domain with OU
windows_ad_computer "safeweb.aws.net" do
  action :join
  domain_pass 'Pass4saf'
  domain_user 'safetydance'
  domain_name 'safeweb.aws.net'
  ou "SessionHosts"
end