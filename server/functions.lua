UgDev.Functions = { }

function UgDev.Functions.GiveLicenseToPlayer(player, license, cb)
    local playerLicenses = json.decode(MySQL.prepare.await('SELECT `licenses` FROM `users` WHERE `identifier` = ?', { player.identifier }))
    for _, v in pairs(playerLicenses) do
        if v == license then return end
    end
    playerLicenses[#playerLicenses + 1] = license
    MySQL.prepare('UPDATE `users` SET `licenses` = ? WHERE `identifier` = ?', {
        json.encode(playerLicenses),
        player.identifier
    }, function (result)
        if not result then return end
        if type(cb) == 'function' then return cb(result) end
    end)
end

function UgDev.Functions.RemoveLicenseFromPlayer(player, license, cb)
    local playerLicenses = json.decode(MySQL.prepare.await('SELECT `licenses` FROM `users` WHERE `identifier` = ?', { player.identifier }))
    for k, v in pairs(playerLicenses) do
        if v == license then
            playerLicenses[k] = nil
        end
    end
    MySQL.prepare('UPDATE `users` SET `licenses` = ? WHERE `identifier` = ?', {
        json.encode(playerLicenses),
        player.identifier
    }, function (result)
        if not result then return end
        if type(cb) == 'function' then return cb(result) end
    end)
end

function UgDev.Functions.CheckPlayerLicense(player, license)
    local playerLicenses = json.decode(MySQL.prepare.await('SELECT `licenses` FROM `users` WHERE `identifier` = ?', { player.identifier }))
    for _, v in pairs(playerLicenses) do
        if v == license then
            return true
        end
    end
    return false
end

function UgDev.Functions.GetLicensesFromPlayer(player)
    local licenses = { }
    local playerLicenses = json.decode(MySQL.prepare.await('SELECT `licenses` FROM `users` WHERE `identifier` = ?', { player.identifier }))
    for _, v in pairs(playerLicenses) do
        local licenseName = MySQL.prepare.await('SELECT `label` FROM `licenses` WHERE `name` = ?', { v })
        licenses[#licenses + 1] = {
            name = v,
            label = licenseName
        }
    end
    return licenses
end

function UgDev.Functions.IsLicenseValid(license)
    local licenses = MySQL.prepare.await('SELECT * FROM `licenses`')
    for k, v in pairs(licenses) do
        if v.license == license then
            return true
        end
    end
    return false
end