Chef::Log.info("******downloading OpenDNS installer.******")  
remote_file 'C:/Windows/Temp/opendns.msi' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/opendns.msi' 
  action :create
end
Chef::Log.info("****** OpenDNS Installer download complete ******")
Chef::Log.info("******Executing OpenDNS installer ******")
execute 'opendns' do
  command 'C:/Windows/System32/msiexec /i C:/Windows/Temp/opendns.msi /qn ORG_ID=22002 ORG_FINGERPRINT=664c2b8eda3c9020882016782c8e8803 USER_ID=6764655'
end
Chef::Log.info("****** OpenDNS installation complete .******")

