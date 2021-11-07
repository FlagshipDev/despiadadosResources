local ESX = nil
 
TriggerEvent('esx:getSharedObject', function( obj ) ESX = obj end)
 
ESX.RegisterUsableItem('supressor', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_flag_accesories:use', source, 'supressor')
	--xPlayer.removeInventoryItem('supressor', 1)
end)
 
ESX.RegisterUsableItem('flashlight', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_flag_accesories:use', source, 'flashlight')
	--xPlayer.removeInventoryItem('flashlight', 1)
end)
 
ESX.RegisterUsableItem('grip', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_flag_accesories:use', source, 'grip')
	--xPlayer.removeInventoryItem('grip', 1)
end)
 
ESX.RegisterUsableItem('weaponskin', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_flag_accesories:use', source, 'weaponskin')
	--xPlayer.removeInventoryItem('weaponskin', 1)
end)

ESX.RegisterUsableItem('extendedclip', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_flag_accesories:use', source, 'extendedclip')
	--xPlayer.removeInventoryItem('extendedclip', 1)
end)

ESX.RegisterUsableItem('scope', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_flag_accesories:use', source, 'scope')
	--xPlayer.removeInventoryItem('scope', 1)
end)

ESX.RegisterUsableItem('lspdtint', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_flag_accesories:lspdtint', source, 'lspdtint')
	--xPlayer.removeInventoryItem('lspdtint', 1)
end)

RegisterServerEvent('esx_flag_accesories:giveBack')
AddEventHandler('esx_flag_accesories:giveBack', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(item, 1)
end)

RegisterNetEvent('esx_flag_accesories:remove')
AddEventHandler('esx_flag_accesories:remove', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem(item, 1)
end)

ESX.RegisterServerCallback('esx_flag_accesories:removeItem', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(true)
end)
