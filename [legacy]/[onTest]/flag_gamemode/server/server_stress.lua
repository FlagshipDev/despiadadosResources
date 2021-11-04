ESX = nil
local log = false -- set this to false if you don't want logging

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("stress:add")
AddEventHandler("stress:add", function (value)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playername = xPlayer.name

	if xPlayer.job.name == "police" then -- Polis ise daha yarı yarıya stress ekleniyor, bu şekilde farklı meslekler ekleyebilirsiniz // if player is a police officer, he/she gaing half the stress, you can add different jobs using same method
		TriggerClientEvent("esx_status:add", _source, "stress", value / 2)
		if log then
			SaveLog("Stress added : "..value/2, playername)
		end
	elseif xPlayer.job.name == "sheriff" then
		TriggerClientEvent("esx_status:add", _source, "stress", value / 1.3)
		if log then
			SaveLog("Stress added : "..value/1.3, playername)
		end
	else
		TriggerClientEvent("esx_status:add", _source, "stress", value)
		if log then
			SaveLog("Stress added : "..value, playername)
		end
	end
end)
--[[
RegisterServerEvent("stress:guardarEstres")
AddEventHandler("stress:guardarEstres", function(estres)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.identifier
	local stres = estres
	MySQL.Async.execute("UPDATE users SET stress = @stress WHERE identifier = @identifier", {
		["@stress"] = stres,
		["@identifier"] =  identifier
	})

end)]]--
--[[
RegisterServerEvent("stress:getStress")
AddEventHandler("stress:getStress", function(value)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.identifier

    MySQL.Sync.fetchAll("SELECT stress FROM users WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    }, function(result)
    
        TriggerClientEvent("estresUsuario", result)

    end)
end)]]--

RegisterServerEvent("stress:remove") -- stres azalttır // remove stress
AddEventHandler("stress:remove", function (value)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playername = xPlayer.name

	TriggerClientEvent("esx_status:remove", _source, "stress", value)
	if log then
		SaveLog("Stress removed : "..value, playername)
	end
end)

function SaveLog(text, playername)
	local time = os.date("%d/%m/%Y %X")
	local name = playername
	local data = time .. ' : ' .. name .. ' - ' .. text

	local content = LoadResourceFile(GetCurrentResourceName(), "logs.txt")
	local newContent = content .. '\r\n' .. data

	SaveResourceFile(GetCurrentResourceName(), "logs.txt", newContent, -1)
end

TriggerEvent("es:addGroupCommand",'curarEstres', "admin", function(source,args) end)

RegisterCommand("curarEstres", function(source, args, rawCommand)
	TriggerClientEvent("stress:heal", source)
end, true)
