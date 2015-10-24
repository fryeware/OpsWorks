Chef::Log.info("******downloading domainjoin executable.******")
remote_file 'C:/Windows/Temp/EC2DomainJoin.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-bootstrap/EC2DomainJoin.exe'
  action :create
end
Chef::Log.info("******executing domainjoin ******")
execute 'EC2DomainJoin' do
  command 'c:/Windows/Temp/EC2DomainJoin.exe'
end
Chef::Log.info("******domain join complete ******")