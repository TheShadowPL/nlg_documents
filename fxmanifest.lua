fx_version 'bodacious'
game 'gta5'
lua54 'yes'

name "nlg_documents"
description 'NextLevel Gaming document system'
author "TheShadow#4691 & qbisz#5187"



version '1.0'

ui_page "html/index.html"

files {
    "html/index.html",
    "html/style.css",
    "html/script.js"
}

client_scripts {
    'Config.lua',
    'client/client.lua'
}

server_scripts {
	'Config.lua',
	'@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

shared_script '@ox_lib/init.lua'
