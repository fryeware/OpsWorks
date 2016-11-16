Chef::Log.info("******AWS CLI******")

powershell_script "PSAwsCli" do
  code <<-EOH
  Invoke-WebRequest https://s3.amazonaws.com/aws-cli/AWSCLI64.msi -OutFile C:\Windows\Temp\AWSCLI64.msi;
  Start-Process "c:\Windows\temp\AWSCLI64.msi" /qn -Wait;
   EOH
  guard_interpreter :powershell_script
end