local UgCore = exports['ug-core']:GetCore()

UgCore.Callbacks.CreateCallback('ug-licenses:GiveLicense', function (source, license, cb)
    local player = UgCore.Functions.GetPlayer(source)
    if UgDev.Functions.IsLicenseValid(license) then
        if not UgDev.Functions.CheckPlayerLicense(player, license) then
            cb(UgDev.Functions.GiveLicenseToPlayer(player, license))
        end
    else
        return error('Missing license "' .. license .. '" in the licenses database!')
    end
end)

UgCore.Callbacks.CreateCallback('ug-licenses:RemoveLicense', function (source, license, cb)
    local player = UgCore.Functions.GetPlayer(source)    
    if UgDev.Functions.IsLicenseValid(license) then
        if UgDev.Functions.CheckPlayerLicense(player, license) then
            cb(UgDev.Functions.RemoveLicenseFromPlayer(player, license))
        end
    else
        return error('Missing license "' .. license .. '" in the licenses database!')
    end
end)

UgCore.Callbacks.CreateCallback('ug-licenses:CheckPlayerLicense', function (source, license, cb)
    local player = UgCore.Functions.GetPlayer(source)
    if UgDev.Functions.IsLicenseValid(license) then
        if UgDev.Functions.CheckPlayerLicense(player, license) then
            cb(true)
        else
            cb(false)
        end
    else
        return error('Missing license "' .. license .. '" in the licenses database!')
    end
end)