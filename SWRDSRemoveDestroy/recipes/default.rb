Chef::Log.info("******Downloading CollectionRemovalDestroyInstance Powershell script.******")  
remote_file 'C:/Windows/temp/ScedTerminate.ps1' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/SafewebPS/SchedTerminate.ps1' 
  action :create
end
Chef::Log.info("******Executing SchedTerminate Powershell script. ******")
execute 'RDSRemoveDestroy' do
command 'powershell -f C:/Windows/temp/ScedTerminate.ps1'
end
Chef::Log.info("****** Scheduled Task  Created to Remove and Terminate******")