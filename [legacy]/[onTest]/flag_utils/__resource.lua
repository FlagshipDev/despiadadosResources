resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


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

