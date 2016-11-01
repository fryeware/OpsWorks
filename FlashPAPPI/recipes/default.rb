Chef::Log.info("******Downloading FlashPPAP installer.******")  
remote_file 'C:/cert/FlashPPAP.ps1' do  
 source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/FlashPAPPI.ps1' 
  action :create
end
Chef::Log.info("******Executing FlashPAPPI installer ******")
execute 'FlashPAPPI' do
command 'powershell -f C:/cert/FlashPAPPI.ps1'
end
Chef::Log.info("****** FlashPAPPI install complete ******")