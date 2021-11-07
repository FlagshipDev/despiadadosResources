resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Async'

server_scripts {
    'async.lua',
    '@flag_utils/servermemorydebug.lua'
}

client_script 'async.lua'