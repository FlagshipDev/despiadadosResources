fx_version 'adamant'
games { 'gta5' }
client_scripts {
	'minimapanchor.lua',
	'common_functions.lua',
	'discord_presence.lua',
	'config.lua'
}
server_scripts { 
	'common_functions.lua',
	'servermemorydebug.lua',
	'config.lua',
	'server_presence.lua'
}

exports {
	'GetMinimapAnchor'
}

