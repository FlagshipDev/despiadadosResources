fx_version 'adamant'
game 'gta5'

description 'ESX Gamemode by Flag'

version '0.0.2'


server_scripts {
	'@es_extended/locale.lua',
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/en.lua',
	'server/server_*.lua',
	'configs/config.lua'
}

client_script {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'client/client_*.lua',
	'configs/config.lua'
}


dependencies {
	'es_extended',
	'esx_licenseshop'
}

export 'GeneratePlate'
