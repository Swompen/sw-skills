fx_version 'cerulean'
game 'gta5'

description 'sw-skills - a customised fork of mz-skillz'
version '1.0.0'

ui_page "html/index.html"

files {
	"html/index.html",
	"html/style.css",
	"html/scripts.js",
	"html/img/*"
}

shared_script 'config.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
    'client/main.lua',
    'client/functions.lua',
    'client/gui.lua'
}

exports {
    "UpdateSkill",
    "GetCurrentSkill"
}
