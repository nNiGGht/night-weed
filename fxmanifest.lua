fx_version 'adamant'
games { 'gta5' }

client_scripts {
	'client.lua',
  'config.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server.lua',
  'config.lua'
}

dependencies {
    'mysql-async',
    'es_extended'
}