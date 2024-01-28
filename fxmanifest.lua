fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'ug-licenses'
description 'Player Licenses for UgCore by UgDev'
author 'UgDev'
version '3.5'
url 'https://github.com/UgDevOfc/ug-licenses'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/functions.lua',
    'server/callbacks.lua'
}

dependencies {
    'ug-core',
    'oxmysql'
}