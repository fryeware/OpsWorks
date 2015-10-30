Chef::Log.info("******downloading Acrobat Reader******")
remote_file 'C:/Windows/Temp/acrobat.exe' do
  source 'https://s3-us-west-2.amazonaws.com/safeweb-application-repo-test/acrobat.exe'
  action :create
end
Chef::Log.info("******executing Acrobat installer ******")
execute 'acrobat' do
  command 'C:/Windows/Temp/acrobat.exe'
end
Chef::Log.info("******Acrobat install complete ******")
