ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', _U('unknown_command', command_args[1]) } })
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()
 
	--	if Config.EnableESXIdentity then name = GetCharacterName(source) end
	--	local name = GetPlayerName(source)
	--	if Config.EnableESXIdentity then name = GetCharacterName(source) end
	--	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('oop_prefix', '['..source..'] : '), message, { 128, 128, 128 })
	--	end
		local id = source
	--	args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end
	
		local players = ESX.GetPlayers()
	
		for i=1, #players, 1 do
			local xPlayer = ESX.GetPlayerFromId(players[i])
			local _source = tonumber(xPlayer.source)
			local targetCoords = GetEntityCoords(GetPlayerPed(source))
			TriggerClientEvent('esx_rpchat:sendProximityMessage', xPlayer.source, _U('oop_prefix', 'OOC ['..id.."]: "), "^0"..message.." ", { 180, 180, 180 }, targetCoords)
		end
	end
end)

RegisterCommand('decir', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	local id = source
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		local _source = tonumber(xPlayer.source)
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		TriggerClientEvent('esx_rpchat:sendProximityMessage', xPlayer.source, _U('oop_prefix', getIdentity(id).firstname.." "..getIdentity(id).lastname.." dice: "), args.." ", { 255, 255, 255 }, targetCoords)
	--	TriggerClientEvent('esx_rpchat:sendProximityMessage', xPlayer.source, _U('oop_prefix', '* (( [OOC ID: '..id..'] '..getIdentity(id).firstname.." "..getIdentity(id).lastname..": "), args.." )) *", { 180, 180, 180 }, targetCoords)
	end

end, false)

RegisterCommand('gr', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local id = source
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end
	local players = ESX.GetPlayers()
	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		local _source = tonumber(xPlayer.source)
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		
		TriggerClientEvent('esx_rpchat:sendProximityMessageGritar', xPlayer.source, _U('oop_prefix', getIdentity(id).firstname.." "..getIdentity(id).lastname.." grita: ¡"), args.."! ", { 255, 255, 255 }, targetCoords)
	end
end, false)

RegisterCommand('sus', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local id = source
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end
	local players = ESX.GetPlayers()
	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		local _source = tonumber(xPlayer.source)
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		
		TriggerClientEvent('esx_rpchat:sendProximityMessageSusurrar', xPlayer.source, _U('oop_prefix', getIdentity(id).firstname.." "..getIdentity(id).lastname.." susurra: "), args.." ", { 255, 255, 255 }, targetCoords)
	end
end, false)


RegisterCommand('ayuda', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('civil_prefix', '['..source..']'), "^0"..args }, color = { 228, 255, 0} })
end, false)


--[[RegisterCommand('taxi', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "taxi" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('taxi_prefix', '['..source..']: '), args }, color = { 255, 227, 51 } })
	end
end, false)

RegisterCommand('meca', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "mechanic" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('meca_prefix', '['..source..']: '), args }, color = { 255, 150, 0 } })
	end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "ambulance" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ems2_prefix', '['..source..']: '), args }, color = { 255, 150, 0 } })
	end
end, false)

RegisterCommand('ammu', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "ammunation" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ammu_prefix', '['..source..']: '), args }, color = { 165, 165, 165 } })
	end
end, false)

RegisterCommand('badu', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "badu1" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('badu1_prefix', '['..source..']: '), args }, color = { 226, 180, 37 } })
	elseif target.job ~= nil and target.job.name == "badu2" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('badu2_prefix', '['..source..']: '), args }, color = { 226, 180, 37 } })
	elseif target.job ~= nil and target.job.name == "badu3" then 
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('badu3_prefix', '['..source..']: '), args }, color = { 226, 180, 37 } })
	elseif target.job ~= nil and target.job.name == "badu4" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('badu4_prefix', '['..source..']: '), args }, color = { 226, 180, 37 } })
	end
end, false)]]--

RegisterCommand('rpol', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local target = ESX.GetPlayerFromId(source)
	local frecuencia
	local job = target.job.name
	if target.job ~= nil and target.job.name == "police" then
		msg = "👮🏻 SAPD (privado): "
	elseif target.job ~= nil and target.job.name == "sheriff" then
		msg = "^5LSSD (privado): " --👮🏻
	elseif target.job ~= nil and target.job.name == "ambulance" then
		msg = "^8LSFD (privado): " --👨‍⚕
	end

	if target.job ~= nil and target.job.name == "police" or target.job.name == "sheriff" or target.job.name == "ambulance" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end
		TriggerClientEvent('esx_rpchat:rpol', -1, msg, '^0 '..args , { 0, 160, 227 }, job)
		--TriggerClientEvent('esx_rpchat:rpol', -1, _U('pol_prefix', target.job.grade_label, name), ' '..args , { 60, 183, 237 }, job)
	end
end, false)

--[[RegisterCommand('f', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local target = ESX.GetPlayerFromId(source)
	local frecuencia
	local label
	local job = target.job.name

	if target.job ~= nil and target.job.name == "police" then
		frecuencia = 0
		label = "LSPD"
	elseif target.job ~= nil and target.job.name == "sheriff" then
		frecuencia = 1
		label = "BCSD"
	elseif target.job ~= nil and target.job.name == "ambulance" then
		frecuencia = 2
		label = "LSFD"
	end

	if target.job ~= nil and target.job.name == "police" or target.job.name == "sheriff" or target.job.name == "ambulance" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end
		TriggerClientEvent('esx_rpchat:rpol1', -1, _U('pol_prefix2', label,target.job.grade_label, getIdentity(source).firstname.." "..getIdentity(source).lastname), ' '..args..' ))', { 152, 174, 250 }, job)
	end
end, false)]]--

RegisterCommand('d', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job.name == "police" or target.job.name == "sheriff" then
		label = "👮🏻"
	elseif target.job ~= nil and target.job.name == "ambulance" then
		label = "👨‍⚕"
	end

	if target.job ~= nil and target.job.name == "ambulance" or target.job.name == 'police' or target.job.name == 'sheriff' then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end
		TriggerClientEvent('esx_rpchat:rms', -1, 'EMERGENCIAS | '..label..' ('..source..'): ', "^0 "..args, { 242, 129, 59  })
	end
end, false)

--[[
RegisterCommand('news', function(source, args, rawCommand)
	rawCommand = string.sub(rawCommand, 5)
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('news_prefix', '('..source..')'..name), rawCommand }, color = { 249, 166, 0 } })
end, false)
]]--

--[[RegisterCommand('twt', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', '('..source..') '..name), args }, color = { 0, 255, 255 } })
end, false)]]--

--[[RegisterCommand ('polidispo', function (source, args, message)
	local playerName = GetPlayerName (source)
	local player = source
	local message = message: sub (3)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId (_source)

	TriggerClientEvent ('localsenddw', -1, player, message, {255, 0, 134})
	TriggerClientEvent('chat:addMessage', _source, { args = {'^0[ ^1Info ^0]: Se te notificará en breves con las unidades disponibles.'}, color = { 0, 255, 255 } })
end, false)]]--



--[[RegisterCommand('anon', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	args = table.concat(args, ' ') 
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('anonimo_prefix', '['..source..'] '), args }, color = { 0, 153, 204 } })
end, false)]]--

--Normal
--[[RegisterCommand('me', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	local id = source
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		local _source = tonumber(xPlayer.source)
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		TriggerClientEvent('esx_rpchat:sendProximityMessage', xPlayer.source, _U('me_prefix', '['..source..'] - me:'), '   ^0'..args, { 255, 0, 0 }, targetCoords)
	end

--	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', '['..source..'] - me:'), '   ^0'..args, { 255, 0, 0 })
end, false)
]]--
RegisterCommand('me', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	local id = source
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		local _source = tonumber(xPlayer.source)
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		TriggerClientEvent('esx_rpchat:sendProximityMessage', xPlayer.source, '^6'..name..' ', ''..args, { 170, 102, 204 }, targetCoords)
	end

--	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', '['..source..'] - me:'), '   ^0'..args, { 255, 0, 0 })
end, false)

RegisterCommand('ame', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	local id = source
	text = table.concat(args, ' ')
	args =  "* "..table.concat(args, " ") .. " *"
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end
	TriggerClientEvent('chatMessage', source, "^6> ", {255, 0, 0}, "^6"..text)
	onMeCommand(source, args)
	local players = ESX.GetPlayers()
	--[[for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		DrawOnHead(source, args, color)
	end
	--TriggerClientEvent('3dme:shareDisplay', -1, text, source)
]]--

end, false)


RegisterCommand('m', function(source, args, rawCommand)

	if source == 0 then
		return
	end
	local target = ESX.GetPlayerFromId(source)
	if target.job ~= nil and target.job.name == "police" or target.job.name == "sheriff" then
		local id = source
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		local players = ESX.GetPlayers()

		for i=1, #players, 1 do
			local xPlayer = ESX.GetPlayerFromId(players[i])
			local _source = tonumber(xPlayer.source)
			local targetCoords = GetEntityCoords(GetPlayerPed(source))
			TriggerClientEvent('esx_rpchat:sendProximityMessageMegafono', xPlayer.source, _U('m_prefix', '('..source..')'), '^3: ^0'..args, { 255, 50, 0 }, targetCoords)
		end
	--	TriggerClientEvent('esx_rpchat:sendProximityMessageMegafono', -1, source, _U('m_prefix', '['..source..'] '.. name), '^*^3: '..args, { 255, 50, 0 })
	end
end, false)

RegisterCommand('msg', function(source, args, user)

	--source = nosotros
	--player = source del otro
	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)
		local identity1 = getIdentity(source)
		local identity2 = getIdentity(player)
		TriggerClientEvent('chat:addMessage', player, {args = {" ^3Privado de "..identity1.firstname.." "..identity1.lastname.." ("..source..")"..": "..table.concat(args, " ")}, color = {19, 156, 0}})
		TriggerClientEvent('chat:addMessage', source, {args = {" ^3Privado a "..identity2.firstname.." "..identity2.lastname.." ("..player..")"..": "..table.concat(args, " ")}, color = {19, 156, 0}})
	else
		TriggerClientEvent('chatMessage', source, "LeyendasRP: ", {255, 0, 0}, "ID de jugador incorrecta!")
	end

end,false)
--[[
RegisterCommand('do', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local id = source
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		local _source = tonumber(xPlayer.source)
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		TriggerClientEvent('esx_rpchat:sendProximityMessageDo', xPlayer.source, _U('do_prefix', '['..source..'] - do:'), '   ^0'..args, { 0, 160, 255 }, targetCoords)
	end
--	TriggerClientEvent('esx_rpchat:sendProximityMessageDo', -1, source, _U('do_prefix', '['..source..'] - do:'), '   ^0'..args, { 0, 160, 255 })
end, false)]]--


RegisterCommand('do', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	local id = source
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		local _source = tonumber(xPlayer.source)
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		--TriggerClientEvent('esx_rpchat:sendProximityMessageDo', xPlayer.source, '* '..args, ' ^2(('..getIdentity(id).firstname.." "..getIdentity(id).lastname..")) *", { 153, 204, 0 }, targetCoords)
		--TriggerClientEvent('esx_rpchat:sendProximityMessageDo', xPlayer.source, '['..name..' - '..id..'] ', ' '..args, { 214, 255, 63 }, targetCoords)
		TriggerClientEvent('esx_rpchat:sendProximityMessageDo', xPlayer.source, '['..name..' - '..id..'] ', ' '..args, { 0, 200, 200 }, targetCoords)
	end

end, false)

RegisterCommand('dados', function(source, args)
	if source == 0 then
		return
	end
	local id = source
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end
	local msg 
	local dado1 = math.random(1,6)
	msg = "ha lanzado un dado y ha sacado un "..dado1
	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		local _source = tonumber(xPlayer.source)
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		TriggerClientEvent('esx_rpchat:sendProximityMessageDo', xPlayer.source, '^6'..name, ' ^6'..msg, { 153, 204, 0 }, targetCoords)
	end
end)


RegisterCommand('dados100', function(source, args)
	if source == 0 then
		return
	end
	local id = source
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end
	local msg 
	local dado1 = math.random(0,100)
	msg = "ha lanzado un dado y ha sacado un "..dado1
	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		local _source = tonumber(xPlayer.source)
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		TriggerClientEvent('esx_rpchat:sendProximityMessageDo', xPlayer.source, '^6'..name, ' ^6'..msg, { 153, 204, 0 }, targetCoords)
	end
end)


RegisterCommand('suerte', function(source, args)
	if source == 0 then
		return
	end
	if args[1] and args[2] then
		local n1 = tonumber(args[1])
		local n2 = tonumber(args[2])
		if n1 > n2 or n1 == n2 or n1 < 0 or n2 < 0 then
			TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Uso incorrecto. Ejemplo: /suerte 2 4' } })
			return
		end
		local random = math.random(n1, n2)
		local id = source
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end
		local players = ESX.GetPlayers()
	
		for i=1, #players, 1 do
			local xPlayer = ESX.GetPlayerFromId(players[i])
			local _source = tonumber(xPlayer.source)
			local targetCoords = GetEntityCoords(GetPlayerPed(source))
			TriggerClientEvent('esx_rpchat:sendProximityMessageDo', xPlayer.source, '^6'..name, ' ^6ha elegido un número entre '..n1.." y "..n2.." y ha salido "..random, { 153, 204, 0 }, targetCoords)
		end
	else
		local n1 = math.random(0, 1)
		local id = source
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end
		local players = ESX.GetPlayers()
	
		for i=1, #players, 1 do
			local xPlayer = ESX.GetPlayerFromId(players[i])
			local _source = tonumber(xPlayer.source)
			local targetCoords = GetEntityCoords(GetPlayerPed(source))
			if n1 == 1 then
				TriggerClientEvent('esx_rpchat:sendProximityMessageDo', xPlayer.source, '^6'..name, ' ^6ha tentado a la suerte y ha ganado ', { 153, 204, 0 }, targetCoords)
			else
				TriggerClientEvent('esx_rpchat:sendProximityMessageDo', xPlayer.source, '^6'..name, ' ^6ha tentado a la suerte y ha perdido ', { 153, 204, 0 }, targetCoords)
			end
		end

		--TriggerClientEvent('chat:addMessage', source, { args = { '^1LeyendasRP: ', 'Uso incorrecto. Ejemplo: /suerte 2 4' } })
		--return
	end
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
local logEnabled = true

function DrawOnHead(playerid, text, color)
	TriggerClientEvent('esx_rpchat:drawOnHead', -1, text, color, playerid)
end


function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
		}
	else
		return nil
	end
end

function trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
  end

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('onMySQLReady',function()
	local consulta = MySQL.Sync.fetchAll('SELECT * FROM vehicles WHERE category = "donator"')
	 for i=1,#consulta,1 do
		banned[i] = string.upper(consulta[i].model)
	 end
end)

ESX.RegisterServerCallback('vender:cochesbanned', function(source, cb)
	MySQL.Async.fetchAll(
	  'SELECT * FROM fine_types WHERE category = @category',
	  {
		['@category'] = category
	  },
	  function(banned)
		cb(banned)
	  end
	)
end)
  
function coche(vendedor,comprador,matr,price,name)
	local xPlayervend = ESX.GetPlayerFromId(vendedor)
	local xPlayercomp = ESX.GetPlayerFromId(comprador)
	MySQL.Async.execute(
		'UPDATE `owned_vehicles` SET `owner` = @owner WHERE `owner` = @ownerantiguo AND`vehicle` LIKE "%' .. trim(matr) .. '%"',
		{
			['@owner'] =  GetPlayerIdentifiers(comprador)[1],
			['@ownerantiguo'] = GetPlayerIdentifiers(vendedor)[1]
		}
	)

--	registerDB(GetPlayerIdentifiers(vendedor)[1], GetPlayerIdentifiers(comprador)[1], matr, price, name)
	TriggerClientEvent('chatMessage', comprador, "Vendedor: ", {255, 0, 0}, "Ahora el coche te pertenece!")
	TriggerClientEvent('chatMessage', vendedor, "Vendedor: ", {255, 0, 0}, "Bien, has vendido el coche!")

	xPlayercomp.removeMoney(price)
	xPlayervend.addMoney(price)
end

RegisterServerEvent('vender:esmicoche')
AddEventHandler('vender:esmicoche',function(matr,id,price,car,name)
	local source = source
	local var = false
	local ident = GetPlayerIdentifiers(source)[1]
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = ident})	
	if data[1] then
		for i=1,#data,1 do
			local vehicle = json.decode(data[i].vehicle)
			if trim(tostring(vehicle.plate)) == trim(tostring(matr)) then
				var = true
				break
			end
		end
	end
	TriggerClientEvent('vender:esmicochecallback',source,var,id,price,matr,car,name)
end)

RegisterServerEvent('vender:vendococheser')
AddEventHandler('vender:vendococheser',function(id,precio,matr,car,name)
	TriggerClientEvent('vender:vendocoche',id,precio,source,matr,car,name)


end)

function registerDB(vendedor, comprador, matr, price, name)
local hour = os.time()
local tiempo = os.date('%c',hour)
MySQL.Async.execute("INSERT INTO tm1_regcars (`seller`,`buyer`,`car`,`hour`,`price`,`name`) VALUES (@vendedor,@comprador,@matr,@hour,@price,@name)", {vendedor = vendedor,comprador = comprador,matr = matr,hour = tiempo,price = price,name = name})
end

RegisterServerEvent('vender:handleroferta')
AddEventHandler('vender:handleroferta',function(var,vendedor,matr,price,name)
	if var == true then
		local xPlayer = ESX.GetPlayerFromId(source)
		if price <= xPlayer.getMoney() then
			TriggerClientEvent('chatMessage', vendedor, "Vendedor: ", {255, 0, 0}, "Han aceptado tu oferta!")
			TriggerClientEvent('chatMessage', source, "Vendedor: ", {255, 0, 0}, "Has aceptado la oferta!")
			coche(vendedor,source,matr,price,name)
		else
			TriggerClientEvent('chatMessage', vendedor, "Vendedor: ", {255, 0, 0}, "No tiene suficiente dinero!")
			TriggerClientEvent('chatMessage', source, "Vendedor: ", {255, 0, 0}, "No tienes suficiente dinero!")
		end
	else
		TriggerClientEvent('chatMessage', vendedor, "Vendedor: ", {255, 0, 0}, "Han rechazado tu oferta!")
		TriggerClientEvent('chatMessage', source, "Vendedor: ", {255, 0, 0}, "Has rechazado la oferta!")

	end
end)
TriggerEvent('es:addCommand', 'vendercoche', function(source, args, user)
TriggerEvent('chat:addSuggestion', '/vendercoche', 'Vender tu coche a un jugador')

	local source = source
	if #args == 1 then
		TriggerClientEvent('chatMessage', source, "Vendedor: ", {255, 0, 0}, "Debes poner un precio!")
	else
		if GetPlayerName(tostring(args[1])) then
			local id1 = tonumber(args[1])
			local precio = tonumber(args[2])
			if precio <= 0 then TriggerClientEvent('chatMessage', source, "Vendedor: ", {255, 0, 0}, "El precio no es válido. Debe ser mayor a 0!") return 0 end

			TriggerClientEvent("vender:compruebocoche",source,id1,precio)

		else
			TriggerClientEvent('chatMessage', source, "Vendedor: ", {255, 0, 0}, "La ID es incorrecta!")
		end
	end
end, {help = "Vender un coche a otro usuario", params = {{name = "ID", help = "ID del jugador"},{name = "Precio", help = "Precio"}}})

TriggerEvent('chat:addSuggestion', '/suerte', '/suerte o /suerte Nº1 Nº2')
------------------------------

local lang = Languages[Config.language]

-- @desc Handle /me command
function onMeCommand(source, args)
   -- local text = "* " .. lang.prefix .. table.concat(args, " ") .. " *"
    TriggerClientEvent('3dme:shareDisplay', -1, args, source)
end