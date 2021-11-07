TriggerEvent('es:addGroupCommand', 'tp', 'mod', function(source, args, user)
	local x = tonumber(args[1])
	local y = tonumber(args[2])
	local z = tonumber(args[3])
	
	if x and y and z then
		TriggerClientEvent('esx:teleport', source, {
			x = x,
			y = y,
			z = z
		})
	else
		TriggerClientEvent('chatMessage', source, "LeyendasRP: ", {255, 0, 0}, "Invalid coordinates!")
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = "Teleport to coordinates", params = {{name = "x", help = "X coords"}, {name = "y", help = "Y coords"}, {name = "z", help = "Z coords"}}})

TriggerEvent('es:addGroupCommand', 'setjob', 'admin', function(source, args, user)
	if tonumber(args[1]) and args[2] and tonumber(args[3]) then
		local xPlayer = ESX.GetPlayerFromId(args[1])

		if xPlayer then
			if ESX.DoesJobExist(args[2], args[3]) then
				xPlayer.setJob(args[2], args[3])
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'That job does not exist.' } })
			end

		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Player not online.' } })
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Invalid usage.' } })
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('setjob'), params = {{name = "id", help = _U('id_param')}, {name = "job", help = _U('setjob_param2')}, {name = "grade_id", help = _U('setjob_param3')}}})

TriggerEvent('es:addGroupCommand', 'loadipl', 'admin', function(source, args, user)
	TriggerClientEvent('esx:loadIPL', -1, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('load_ipl')})

TriggerEvent('es:addGroupCommand', 'unloadipl', 'admin', function(source, args, user)
	TriggerClientEvent('esx:unloadIPL', -1, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('unload_ipl')})

TriggerEvent('es:addGroupCommand', 'playanim', 'admin', function(source, args, user)
	TriggerClientEvent('esx:playAnim', -1, args[1], args[3])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('play_anim')})

TriggerEvent('es:addGroupCommand', 'playemote', 'admin', function(source, args, user)
	TriggerClientEvent('esx:playEmote', -1, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('play_emote')})

TriggerEvent('es:addGroupCommand', 'car', 'mod', function(source, args, user)
	TriggerClientEvent('esx:spawnVehicle', source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('spawn_car'), params = {{name = "car", help = _U('spawn_car_param')}}})


TriggerEvent('es:addGroupCommand', 'defcon', 'mod', function(source, args, user)
	local nivel = args[1]
--	print(nivel)
	TriggerEvent('defcon', nivel)
	TriggerEvent('serDefconAllPlayers', nivel)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Permisos insuficientes.' } })
end, {help = 'Nivel de DEFCON'})

RegisterNetEvent('defcon')
AddEventHandler('defcon', function(lvl)
	local nivel = lvl
	TriggerClientEvent('esx_mole_status:setdefcon', -1, nivel)
end)

TriggerEvent('es:addGroupCommand', 'dv', 'support', function(source, args, user)
	TriggerClientEvent('esx:deleteVehicle', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('delete_vehicle')})

TriggerEvent('es:addGroupCommand', 'spawnped', 'admin', function(source, args, user)
	TriggerClientEvent('esx:spawnPed', source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('spawn_ped'), params = {{name = "name", help = _U('spawn_ped_param')}}})

TriggerEvent('es:addGroupCommand', 'spawnobject', 'admin', function(source, args, user)
	TriggerClientEvent('esx:spawnObject', source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('spawn_object'), params = {{name = "name"}}})

TriggerEvent('es:addGroupCommand', 'setmoney', 'admin', function(source, args, user)
	local _source = source
	local target = tonumber(args[1])
	local money_type = args[2]
	local money_amount = tonumber(args[3])
	
	local xPlayer = ESX.GetPlayerFromId(target)

	if target and money_type and money_amount and xPlayer ~= nil then
		if money_type == 'cash' then
			xPlayer.setMoney(money_amount)
		elseif money_type == 'bank' then
			xPlayer.setAccountMoney('bank', money_amount)
		elseif money_type == 'black' then
			xPlayer.setAccountMoney('black_money', money_amount)
		else
			TriggerClientEvent('chatMessage', _source, "LeyendasRP: ", {255, 0, 0}, "^2" .. money_type .. " ^0 is not a valid money type!")
			return
		end
	else
		TriggerClientEvent('chatMessage', _source, "LeyendasRP: ", {255, 0, 0}, "Invalid arguments.")
		return
	end
	
	print('es_extended: ' .. GetPlayerName(source) .. ' just set $' .. money_amount .. ' (' .. money_type .. ') to ' .. xPlayer.name)
	
	if xPlayer.source ~= _source then
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('money_set', money_amount, money_type))
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('setmoney'), params = {{name = "id", help = _U('id_param')}, {name = "money type", help = _U('money_type')}, {name = "amount", help = _U('money_amount')}}})

TriggerEvent('es:addGroupCommand', 'giveaccountmoney', 'mod', function(source, args, user)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(args[1])
	local account = args[2]
	local amount  = tonumber(args[3])

	if amount ~= nil then
		if xPlayer.getAccount(account) ~= nil then
			xPlayer.addAccountMoney(account, amount)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_account'))
		end
	else
		TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('giveaccountmoney'), params = {{name = "id", help = _U('id_param')}, {name = "account", help = _U('account')}, {name = "amount", help = _U('money_amount')}}})

TriggerEvent('es:addGroupCommand', 'giveitem', 'mod', function(source, args, user)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(args[1])
	local item    = args[2]
	local count   = (args[3] == nil and 1 or tonumber(args[3]))

	if count ~= nil then
		if xPlayer.getInventoryItem(item) ~= nil then
			xPlayer.addInventoryItem(item, count)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_item'))
		end
	else
		TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('giveitem'), params = {{name = "id", help = _U('id_param')}, {name = "item", help = _U('item')}, {name = "amount", help = _U('amount')}}})

TriggerEvent('es:addGroupCommand', 'giveweapon', 'mod', function(source, args, user)
	local xPlayer    = ESX.GetPlayerFromId(args[1])
	local weaponName = string.upper(args[2])

	xPlayer.addWeapon(weaponName, tonumber(args[3]))
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('giveweapon'), params = {{name = "id", help = _U('id_param')}, {name = "weapon", help = _U('weapon')}, {name = "ammo", help = _U('amountammo')}}})

TriggerEvent('es:addGroupCommand', 'disc', 'admin', function(source, args, user)
	DropPlayer(source, 'Te han desconectado de LeyendasRP.')
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end)

TriggerEvent('es:addGroupCommand', 'disconnect', 'admin', function(source, args, user)
	DropPlayer(source, 'You have been disconnected')
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('disconnect')})

TriggerEvent('es:addGroupCommand', 'clear', 'user', function(source, args, user)
	TriggerClientEvent('chat:clear', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('chat_clear')})

TriggerEvent('es:addGroupCommand', 'cls', 'user', function(source, args, user)
	TriggerClientEvent('chat:clear', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end)

TriggerEvent('es:addGroupCommand', 'clsall', 'mod', function(source, args, user)
	TriggerClientEvent('chat:clear', -1)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end)

TriggerEvent('es:addGroupCommand', 'clearall', 'mod', function(source, args, user)
	TriggerClientEvent('chat:clear', -1)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('chat_clear_all')})

TriggerEvent('es:addGroupCommand', 'clearinventory', 'mod', function(source, args, user)
	local xPlayer

	if args[1] then
		xPlayer = ESX.GetPlayerFromId(args[1])
	else
		xPlayer = ESX.GetPlayerFromId(source)
	end

	if not xPlayer then
		TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Player not online.' } })
		return
	end

	for i=1, #xPlayer.inventory, 1 do
		if xPlayer.inventory[i].count > 0 then
			xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('command_clearinventory'), params = {{name = "playerId", help = _U('command_playerid_param')}}})

TriggerEvent('es:addGroupCommand', 'clearloadout', 'mod', function(source, args, user)
	local xPlayer

	if args[1] then
		xPlayer = ESX.GetPlayerFromId(args[1])
	else
		xPlayer = ESX.GetPlayerFromId(source)
	end

	if not xPlayer then
		TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Player not online.' } })
		return
	end

	for i=#xPlayer.loadout, 1, -1 do
		xPlayer.removeWeapon(xPlayer.loadout[i].name)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = _U('command_clearloadout'), params = {{name = "playerId", help = _U('command_playerid_param')}}})

TriggerEvent('es:addGroupCommand', 'darpuntopositivo', 'mod', function(source, args, user)
	local xPlayer
	if args[1] and args[2] then
		local target = tonumber(args[1])
		local mot = args[2]
		xPlayer = ESX.GetPlayerFromId(target)
		if not xPlayer then
			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'ID inválida.' } })
			return
		end

--		if puntos > 5 then
--			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', '5 puntos a la vez máximo.' } })
--			return
--		elseif puntos < 0 or puntos == 0 then
--			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', '¿Puntos negativos?' } })
--			return
--		else			
			TriggerClientEvent('addPuntos', xPlayer.source, mot)
			TriggerClientEvent('chat:addMessage', source, { args = { '^3Admin: ', 'Se ha otorgado 1 punto de rol positivo a la ID '..xPlayer.source } })
--		end
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Permisos insuficientes.' } })
end, {help = 'Dar puntos de rol.', params = {{name = "playerId", help = _U('command_playerid_param'), help = 'Motivo'}}})

TriggerEvent('es:addGroupCommand', 'darpuntonegativo', 'mod', function(source, args, user)
	local xPlayer
	if args[1] and args[2] then
		local target = tonumber(args[1])
		local mot = args[2]
		xPlayer = ESX.GetPlayerFromId(target)
		if not xPlayer then
			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'ID inválida.' } })
			return
		end

--		if puntos > 5 then
--			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', '5 puntos a la vez máximo.' } })
--			return
--		elseif puntos < 0 or puntos == 0 then
--			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', '¿Puntos negativos?' } })
--			return
--		else
			TriggerClientEvent('removePuntos', xPlayer.source, mot)
			TriggerClientEvent('chat:addMessage', source, { args = { '^3Admin: ', 'Se ha otorgado 1 punto de rol negativo a la ID '..xPlayer.source } })
--		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^2Utilización: ', '/... + ID + motivo' } })
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Permisos insuficientes.' } })
end, {help = 'Dar puntos de rol.', params = {{name = "playerId", help = _U('command_playerid_param'), help = 'Motivo'}}})


TriggerEvent('es:addGroupCommand', 'quitarpuntonegativo', 'mod', function(source, args, user)
	local xPlayer
	if args[1] then
		local target = tonumber(args[1])
		xPlayer = ESX.GetPlayerFromId(target)
		if not xPlayer then
			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'ID inválida.' } })
			return
		end
		TriggerClientEvent('quitarPuntosNeg', xPlayer.source)
		TriggerClientEvent('chat:addMessage', source, { args = { '^3Admin: ', 'Se ha quitado 1 punto de rol negativo a la ID '..xPlayer.source } })
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^2Utilización: ', '/... + ID + motivo' } })
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Permisos insuficientes.' } })
end, {help = 'Dar puntos de rol.', params = {{name = "playerId", help = _U('command_playerid_param')}}})

TriggerEvent('es:addGroupCommand', 'quitarpuntopositivo', 'mod', function(source, args, user)
	local xPlayer
	if args[1] then
		local target = tonumber(args[1])
		xPlayer = ESX.GetPlayerFromId(target)
		if not xPlayer then
			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'ID inválida.' } })
			return
		end
		TriggerClientEvent('quitarPuntosPos', xPlayer.source)
		TriggerClientEvent('chat:addMessage', source, { args = { '^3Admin: ', 'Se ha quitado 1 punto de rol positivo a la ID '..xPlayer.source } })
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^2Utilización: ', '/... + ID + motivo' } })
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Permisos insuficientes.' } })
end, {help = 'Dar puntos de rol.', params = {{name = "playerId", help = _U('command_playerid_param')}}})

local puntosAdmin
local sourcePuntos

TriggerEvent('es:addGroupCommand', 'verpuntos', 'mod', function(source, args, user)
	local xPlayer
	if args[1] then
		local target = tonumber(args[1])
		puntosAdmin = source
		xPlayer = ESX.GetPlayerFromId(target)
		if not xPlayer then
			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'ID inválida.' } })
			return
		end
		sourcePuntos = xPlayer.source
		TriggerClientEvent('verPuntos', xPlayer.source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Insufficient Permissions.' } })
end, {help = 'Dar puntos de rol.', params = {{name = "playerId", help = _U('command_playerid_param'), help = 'Cantidad'}}})

RegisterNetEvent('verPuntosServer')
AddEventHandler('verPuntosServer', function(neg, pos, src)
	TriggerClientEvent('chat:addMessage', puntosAdmin, { args = { '^1Puntos de rol de la ID '..GetPlayerName(sourcePuntos)..' ('..GetCharacterName(sourcePuntos)..')', ''} })
	Wait(700)
	TriggerClientEvent('chat:addMessage', puntosAdmin, { args = { '^2Positivos - ', pos}})
	Wait(700)
	TriggerClientEvent('chat:addMessage', puntosAdmin, { args = { '^1Negativos - ', neg}})

end)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end
