fx_version 'adamant'
game 'gta5'

description 'ESX Garajes'

version '0.0.2'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@flag_utils/servermemorydebug.lua',
	'config.lua',
	'server.lua'
}
client_script {
	'config.lua',
	'client.lua'
}
