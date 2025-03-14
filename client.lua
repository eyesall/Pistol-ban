local bool = false

local function setActive()
    bool = true

    CreateThread(function()
        while (bool) do
            local player = PlayerId()

            if (IsPlayerFreeAiming(player)) then
                local _, entity = GetEntityPlayerIsFreeAimingAt(player)
                local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                if (IsPedShooting(PlayerPedId()) and id ~= 0) then
                    TriggerServerEvent("weapon:onWeaponAction", id)
                end
            end

            Wait(0)
        end
    end)
end

RegisterNetEvent("weapon:setWeaponBan", function()
    if (not (bool)) then
        setActive()

        print("Weapon ban activate")
    else
        bool = false

        print("Weapon ban deactivate")
    end
end)