ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

Citizen.CreateThread(function()
    while true do
    local sleep = 2000
	local ped = PlayerPedId()
--[[         if GetDistanceBetweenCoords(GetEntityCoords(ped), 2222.998, 5577.150, 53.836, true) < 10 then
             sleep = 7
--            DrawMarker(2, 2222.998, 5577.150, 53.836, 0, 0, 0, 0, 0, 0, 0.2, 0.2, 0.2, 0, 255, 0, 200, 0, 0, 0, 1)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), 2222.998, 5577.150, 53.836, true) < 1 then
                DrawText3D(2222.998, 5577.150, 53.836 + 0.3, '~g~E~w~ - Ot Topla')
                if IsControlJustReleased(1, 51) then ]]
            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ToplaX, Config.ToplaY, Config.ToplaZ, true) < 10 then
 				sleep = 3
--                 DrawMarker(20, Config.ToplaX, Config.ToplaY, Config.ToplaZ, 0, 0, 0, 0, 0, 100.0, 0.6, 0.6, 0.3, 0, 255, 100, 255, 0, 0, 0, 1, 0, 0, 0)
                     if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ToplaX, Config.ToplaY, Config.ToplaZ, true) < 1 then
                         DrawText3D(Config.ToplaX, Config.ToplaY, Config.ToplaZ + 0.4, '~g~ E ~s~ - Ot Topla')
                         if IsControlJustReleased(1, 51) then
                    local ped = PlayerPedId()
                    exports['mythic_progbar']:Progress({
                        name = "ottopla",
                        duration = Config.WeedCollectTime,
                        label = 'Ot Topluyorsun... [DEL]',
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "mp_car_bomb",
                            anim = "car_bomb_mechanic",
                            flags = 49,
                        },
                        -- prop = {
                        --     model = "prop_tool_pickaxe",
                        -- },
                    }, function(cancelled)
                        if not cancelled then
                            TriggerServerEvent("night-weed:ottopla")
                        else
                            TriggerEvent('notification', 'İşlemi iptal ettin!', 1)
                        end
                    end)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('night:usejoint')
AddEventHandler('night:usejoint', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'joint'

    exports['mythic_progbar']:Progress({
        name = "joint",
        duration = Config.JointUseTime,
        label = 'Jointi tüketiyorsun... [DEL]',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "",
            anim = "",
            flags = 49,
        },
--[[     prop = {
        model = "p_cs_joint_02",
    } ]]
    }, function(status)
        if not status then
            -- SetPedComponentVariation(ped, 9, 2, 0, 0)
            SetPedArmour(ped, Config.JointArmor)
            TriggerEvent('notification', 'Jointi tükettin.', 3)
            TriggerServerEvent("night:removejoint")
        end
    end)
end)

RegisterNetEvent('night:userollpaper')
AddEventHandler('night:userollpaper', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local item = 'rollpaper'

    exports['mythic_progbar']:Progress({
        name = "rollpaper",
        duration = Config.RollingTime,
        label = 'Joint Sarıyorsun... [DEL]',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "",
            anim = "",
            flags = 49,
        },
--[[     prop = {
        model = "p_cs_joint_02",
    } ]]
    }, function(status)
        if not status then
--            TriggerEvent('notification', 'Jointi sardın!.', 3)
            TriggerServerEvent("night:sar")
        end
    end)
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 0, 0, 0, 100)
end