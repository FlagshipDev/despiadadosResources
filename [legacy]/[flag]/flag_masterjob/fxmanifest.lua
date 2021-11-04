fx_version 'adamant'

game 'gta5'

description 'ESX Personal Menu'

Author 'Flagship - Dev For LeyendasRP'

version '1.0.0'

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'@flag_utils/servermemorydebug.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'server/server.lua',
	'server/server_*.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'client/client_*.lua',
	'client/utils_prision.lua'
--	'client/client_menu.lua',
--	'client/client_police.lua',
--	'client/client_escudo.lua',
--	'client/client_heli.lua',
--	'client/client_radar.lua',
--	'client/client_ref.lua',
--	'client/client_polgar.lua',
--	'client/client_prision.lua',
--	'client/client_lscustoms.lua',
--	'client/client_mechanic.lua',
--	'client/client_actividades.lua',
--	'client/client_legal.lua'
--	'client/client_main.lua'
}

	