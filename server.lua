local getLicense = function(src)
	for _, identifier in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(identifier, 1, string.len("license:")) == "license:" then
            return identifier
        end
	end
end


RegisterCommand("weaponban", function(source)
    local license = getLicense(source)

    if not Config.ADMIN[license] then
        return
    end

    TriggerClientEvent("weapon:setWeaponBan")
end, false)

RegisterNetEvent("weapon:onWeaponAction", function(id)
    local license = getLicense(source)

    if not Config.ADMIN[license] then
        return
    end

    -- YOUR BAN SYSTEM

end)