ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local Config = {
    MarkerType = 25,
    MarkerColor = {r = 0, g = 162, b = 255, a = 150},
    MarkerSize = vector3(0.5, 0.5, 0.3),

    price = 1000,

    position = {
        x = 1162.47,
        y = 2100.931,
        z = 56.10676,
    }
}

Citizen.CreateThread(function()
    while true do
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.position.x, Config.position.y, Config.position.z, true)
        if distance <= 30 then
            DrawMarker(Config.MarkerType, Config.position.x, Config.position.y, Config.position.z, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), Config.MarkerSize, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, false, false, 2, false, nil, nil, false)
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour revive.")
            if IsControlJustPressed(0, 38) then
                TriggerEvent('esx_ambulancejob:revive')
            end
            Wait(1)
        else
            Wait(750)
        end
    end
end)
--[[Citizen.CreateThread(function()
	while true do
        local interval = 1
        local pos = GetEntityCoords(PlayerPedId())
        local dest = vector3(730.68, 1272.80, 360.29)
        local distance = GetDistanceBetweenCoords(pos, dest, true)

        if distance > 30 then
            local interval = 200
        else
            local interval = 1
            local posDrawMarker = vector3(1135.005, 2089.615, 55.79502)
            DrawMarker(0, 1135.005, 2089.615, 55.79502, 1135.005, 2089.615, 55.79502, 0, 0, 0, 1, 1, 1, 55, 255, 55, 255, 0, 0, 0, 0)
            if distance < 30 then
                AddTextEntry(("HELP"), "Appuyez sur ~INPUT_CONTEXT~ ~s~pour revive dans la ZoneGF.")
                DisplayHelpTextThisFrame("HELP", false)
                if IsControlJustPressed(1, 51) then
                    local ped = PlayerPedId()
                    TriggerServerEvent('esx_ambulancejob:revive')
                end
            end
        end

        Citizen.Wait(interval)
	end
end)]]--