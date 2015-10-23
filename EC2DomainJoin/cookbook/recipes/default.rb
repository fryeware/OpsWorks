Chef::Log.info("******downloading domainjoin executable.******")
remote_file 'C:/Windows/Temp/EC2DomainJoin.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-bootstrap/EC2DomainJoin.exe'
  action :create
end