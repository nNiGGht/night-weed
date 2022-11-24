ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--ESX.RegisterUsableItem('ifak', function(source)
--  local pl = ESX.GetPlayerFromId(source)
--  local src = source
--  TriggerClientEvent('night:useitemifak', source)
--end)

--RegisterServerEvent('remove:ifak')
--AddEventHandler('remove:ifak', function()
-- local source = tonumber(source)
-- local xPlayer = ESX.GetPlayerFromId(source)
-- local src = source
--	xPlayer.removeInventoryItem("ifak", 1)
--	TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()['ifak'],'remove',1)
--end)

RegisterNetEvent("night-weed:ottopla")
AddEventHandler("night-weed:ottopla", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        if xPlayer.getQuantity('weed') < 35 then
            xPlayer.addInventoryItem('weed', 1)
            TriggerClientEvent('inventory:client:ItemBox',_source,ESX.GetItems()['weed'],'add',1)
        else
            TriggerClientEvent('notification', source, 'Üzerinde çok fazla ot var!', 2)
        end
    end
end)

ESX.RegisterUsableItem('joint', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('night:usejoint', source)
end)

RegisterServerEvent('night:removejoint')
AddEventHandler('night:removejoint', function(item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local src = source
    xPlayer.removeInventoryItem("joint", 1)
    TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()['joint'],'remove',1)
end)

RegisterNetEvent("night:sar")
AddEventHandler("night:sar", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        if xPlayer.getQuantity('weed') > 1 then
            xPlayer.removeInventoryItem('weed', 2)
            TriggerClientEvent('inventory:client:ItemBox',_source,ESX.GetItems()['weed'],'remove',2)
--[[             if xPlayer.getQuantity('rollpaper') > 0 then ]]
                xPlayer.removeInventoryItem('rollpaper', 1)
            TriggerClientEvent('inventory:client:ItemBox',_source,ESX.GetItems()['rollpaper'],'remove',1)
            xPlayer.addInventoryItem('joint', 1)
            TriggerClientEvent('inventory:client:ItemBox',_source,ESX.GetItems()['joint'],'add',1)
            TriggerClientEvent('notification', source, 'Ot sardın.', 1)
        else
            TriggerClientEvent('notification', source, '2 gram ota ihtiyacın var!', 2)
         end     
      end
--   end
end)

ESX.RegisterUsableItem('rollpaper', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('night:userollpaper', source)
end)