Chef::Log.info("******Downloading CollectionRemovalDestroyInstance Powershell script.******")  
remote_file 'C:/Windows/temp/CollectionRemovalDestroyInstance.ps1' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/LinuxDev/CollectionRemovalDestroyInstance.ps1' 
  action :create
end
Chef::Log.info("******Executing CollectionRemovalDestroyInstance Powershell script. ******")
execute 'RDSRemoveDestroy' do
command 'powershell -f C:/Windows/temp/CollectionRemovalDestroyInstance.ps1'
end
Chef::Log.info("****** CollectionRemovalDestroyInstance Powershell script complete ******")