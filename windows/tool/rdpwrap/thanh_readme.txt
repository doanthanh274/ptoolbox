1. install [rdpwrap] with [install.bat]

2. if [rdpconf] saying not supported then you will need to modify the [C:\Program Files\RDP Wrapper\rdpwrap.ini] file
	+ give folder access to users / administrator to be able to modify
	+ have to turn off [termservice] 

>>> net stop termservice

3. look for [rdp_version] on [rdpconf] on google and modify the ini file as such

4. restart the termservice

>>> net start termservice

DONE!