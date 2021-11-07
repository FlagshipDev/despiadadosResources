fx_version 'adamant'
game 'gta5'

description 'Async'

shared_script 'async.lua'

server_scripts {
    'async.lua',
    '@flag_utils/servermemorydebug.lua'
}

client_script 'async.lua'
