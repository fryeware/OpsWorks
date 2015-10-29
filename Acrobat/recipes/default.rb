Chef::Log.info("******downloading Acrobat Reader******")
remote_file 'C:/Windows/Temp/Acrobat' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/Acrobat.exe'
  action :create
end
Chef::Log.info("******executing Acrobat installer ******")
execute 'Acrobat' do
  command 'C:/Windows/Temp/Acrobat.exe'
end
Chef::Log.info("******Acrobat install complete ******")
