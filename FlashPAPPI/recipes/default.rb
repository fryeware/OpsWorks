Chef::Log.info("******Installing FlashPAPPI ******")

powershell_script "Install FlashPAPPI" do
  code <<-EOH
    Invoke-WebRequest https://fpdownload.macromedia.com/pub/flashplayer/latest/help/install_flash_player_ppapi.exe -OutFile c:\cert\install_flash_player_ppapi.exe;
C:\cert\install_flash_player_ppapi.exe -install;
	
  EOH
  guard_interpreter :powershell_script
  end