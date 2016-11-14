Chef::Log.info("******Send Eventid to trigger terminate scheduled task******")

powershell_script "PSTerminate" do
  code <<-EOH
    Write-EventLog -LogName Application -Source "AWS Shutdown and Destroy Instance" -EntryType Information -EventId 5150 -Message "Shutting down instance and teminating it.";
  EOH
  guard_interpreter :powershell_script
  end