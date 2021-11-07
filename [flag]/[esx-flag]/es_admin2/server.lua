ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


TriggerEvent("es:addGroup", "mod", "support", function(group) end)
TriggerEvent("es:addGroup", "support", "user", function(group) end)

-- Modify if you want, btw the _admin_ needs to be able to target the group and it will work
local groupsRequired = {
	slay = "mod",
	noclip = "admin",
	crash = "superadmin",
	freeze = "mod",
	bring = "mod",
	["goto"] = "mod",
	slap = "mod",
	slay = "mod",
	kick = "mod",
	ban = "admin"
}

local banned = ""
local bannedTable = {}

function loadBans()
	banned = LoadResourceFile(GetCurrentResourceName(), "bans.json") or ""
	if banned ~= "" then
		bannedTable = json.decode(banned)
	else
		bannedTable = {}
	end
end

RegisterCommand("refresh_bans", function()
	loadBans()
end, true)

function loadExistingPlayers()
	TriggerEvent("es:getPlayers", function(curPlayers)
		for k,v in pairs(curPlayers)do
			TriggerClientEvent("es_admin:setGroup", v.get('source'), v.get('group'))
		end
	end)
end

loadExistingPlayers()

function removeBan(id)
	bannedTable[id] = nil
	SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(bannedTable), -1)
end

function isBanned(id)
	if bannedTable[id] ~= nil then
		if bannedTable[id].expire < os.time() then
			removeBan(id)
			return false
		else
			return bannedTable[id]
		end
	else
		return false
	end
end

function permBanUser(bannedBy, id)
	bannedTable[id] = {
		banner = bannedBy,
		reason = "Estas baneado permanentemente de LeyendasRP, contacta con la administración en nuestro discord si crees que ha sido un error.",
		expire = 0
	}

	SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(bannedTable), -1)
end

function banUser(expireSeconds, bannedBy, id, re)
	bannedTable[id] = {
		banner = bannedBy,
		reason = re,
		expire = (os.time() + expireSeconds)
	}

	SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(bannedTable), -1)
end

AddEventHandler('playerConnecting', function(user, set)
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		local banData = isBanned(v)
		if banData ~= false then
			set("Baneado por: " .. banData.reason .. "\nExpira: " .. (os.date("%c", banData.expire)))
			CancelEvent()
			break
		end
	end
end)

AddEventHandler('es:incorrectAmountOfArguments', function(source, wantedArguments, passedArguments, user, command)
	if(source == 0)then
		print("Argument count mismatch (passed " .. passedArguments .. ", wanted " .. wantedArguments .. ")")
	else
		TriggerClientEvent('chat:addMessage', source, {
			args = {"^6LeyendasRP: ", "Incorrect amount of arguments! (" .. passedArguments .. " passed, " .. requiredArguments .. " wanted)"}
		})
	end
end)

RegisterServerEvent('es_admin:all')
AddEventHandler('es_admin:all', function(type)
	local Source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:canGroupTarget', user.getGroup(), "admin", function(available)
			if available or user.getGroup() == "admin" then
				if type == "slay_all" then TriggerClientEvent('es_admin:quick', -1, 'slay') end
				if type == "bring_all" then TriggerClientEvent('es_admin:quick', -1, 'bring', Source) end
				if type == "slap_all" then TriggerClientEvent('es_admin:quick', -1, 'slap') end
			else
				TriggerClientEvent('chat:addMessage', Source, {
					args = {"^6LeyendasRP: ", "No tienes permiso para hacer esto."}
				})
			end
		end)
	end)
end)

RegisterServerEvent('es_admin:quick')
AddEventHandler('es_admin:quick', function(id, type)
	local Source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:getPlayerFromId', id, function(target)
			TriggerEvent('es:canGroupTarget', user.getGroup(), groupsRequired[type], function(available)
				TriggerEvent('es:canGroupTarget', user.getGroup(), target.getGroup(), function(canTarget)
					if canTarget and available then
						if type == "slay" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "noclip" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "freeze" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "crash" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "bring" then TriggerClientEvent('es_admin:quick', id, type, Source) end
						if type == "goto" then TriggerClientEvent('es_admin:quick', Source, type, id) end
						if type == "slap" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "slay" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "kick" then DropPlayer(id, 'Has sido kickeado de LeyendasRP') end

						if type == "ban" then
							local id
							local ip
							for k,v in ipairs(GetPlayerIdentifiers(source))do
								if string.sub(v, 1, string.len("steam:")) == "steam:" then
									permBanUser(user.identifier, v)
								elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
									permBanUser(user.identifier, v)
								end
							end

							DropPlayer(id, GetConvar("es_admin_banreason", "Has sido baneado de LeyendasRP"))
						end
					else
						if not available then
							TriggerClientEvent('chat:addMessage', Source, {
								args = {"^6LeyendasRP: ", "No tienes permiso para hacer esto."}
							})
						else
							TriggerClientEvent('chat:addMessage', Source, {
								args = {"^6LeyendasRP: ", "No tienes permiso para hacer esto."}
							})
						end
					end
				end)
			end)
		end)
	end)
end)

AddEventHandler('es:playerLoaded', function(Source, user)
	TriggerClientEvent('es_admin:setGroup', Source, user.getGroup())
end)

RegisterServerEvent('es_admin:set')
AddEventHandler('es_admin:set', function(t, USER, GROUP)
	local Source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:canGroupTarget', user.getGroup(), "admin", function(available)
			if available then
			if t == "group" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', source, {
						args = {"^6LeyendasRP: ", "Jugador no encontrado."}
					})
				else
					TriggerEvent("es:getAllGroups", function(groups)
						if(groups[GROUP])then
							TriggerEvent("es:setPlayerData", USER, "group", GROUP, function(response, success)
								TriggerClientEvent('es_admin:setGroup', USER, GROUP)
								TriggerClientEvent('chat:addMessage', -1, {
									args = {"^6LeyendasRP: ", "Grupo de ^2^*" .. GetPlayerName(tonumber(USER)) .. "^r^0 actualizado a ^2^*" .. GROUP}
								})
							end)
						else
							TriggerClientEvent('chat:addMessage', Source, {
								args = {"^6LeyendasRP: ", "Grupo no encontrado."}
							})
						end
					end)
				end
			elseif t == "level" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', Source, {
						args = {"^6LeyendasRP: ", "Jugador no encontrado."}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						TriggerEvent("es:setPlayerData", USER, "permission_level", GROUP, function(response, success)
							if(true)then
								TriggerClientEvent('chat:addMessage', -1, {
									args = {"^6LeyendasRP: ", "Nivel de permisos de ^2" .. GetPlayerName(tonumber(USER)) .. "^0 actualizado a ^2 " .. tostring(GROUP)}
								})
							end
						end)

						TriggerClientEvent('chat:addMessage', Source, {
							args = {"^6LeyendasRP: ", "Nivel de permisos de ^2" .. GetPlayerName(tonumber(USER)) .. "^0 actualizado a ^2 " .. tostring(GROUP)}
						})
					else
						TriggerClientEvent('chat:addMessage', Source, {
							args = {"^6LeyendasRP: ", "Invalid integer entered"}
						})
					end
				end
			elseif t == "money" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', Source, {
						args = {"^6LeyendasRP: ", "Jugador no encontrado."}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						TriggerEvent('es:getPlayerFromId', USER, function(target)
							target.setMoney(GROUP)
						end)
					else
						TriggerClientEvent('chat:addMessage', Source, {
							args = {"^6LeyendasRP: ", "Invalid integer entered"}
						})
					end
				end
			elseif t == "bank" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', Source, {
						args = {"^6LeyendasRP: ", "Jugador no encontrado."}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						TriggerEvent('es:getPlayerFromId', USER, function(target)
							target.setBankBalance(GROUP)
						end)
					else
						TriggerClientEvent('chat:addMessage', Source, {
							args = {"^6LeyendasRP: ", "Invalid integer entered"}
						})
					end
				end
			end
			else
				TriggerClientEvent('chat:addMessage', Source, {
					args = {"^6LeyendasRP: ", "Superadmin requerido para esto."}
				})
			end
		end)
	end)
end)

RegisterCommand('setadmin', function(source, args, raw)
	local player = tonumber(args[1])
	local level = tonumber(args[2])
	if args[1] then
		if (player and GetPlayerName(player)) then
			if level then
				TriggerEvent("es:setPlayerData", tonumber(args[1]), "permission_level", tonumber(args[2]), function(response, success)
					RconPrint(response)
		
					TriggerClientEvent('es:setPlayerDecorator', tonumber(args[1]), 'rank', tonumber(args[2]), true)
					TriggerClientEvent('chat:addMessage', -1, {
						args = {"^6LeyendasRP: ", "Nivel de permisos de ^2" .. GetPlayerName(tonumber(args[1])) .. "^0 actualizado a ^2 " .. args[2]}
					})
				end)
			else
				RconPrint("Invalid integer\n")
			end
		else
			RconPrint("Player not ingame\n")
		end
	else
		RconPrint("Usage: setadmin [user-id] [permission-level]\n")
	end
end, true)

RegisterCommand('setgroup', function(source, args, raw)
	local player = tonumber(args[1])
	local group = args[2]
	if args[1] then
		if (player and GetPlayerName(player)) then
			TriggerEvent("es:getAllGroups", function(groups)

				if(groups[args[2]])then
					TriggerEvent("es:getPlayerFromId", player, function(user)
						ExecuteCommand('remove_principal identifier.' .. user.getIdentifier() .. " group." .. user.getGroup())

						TriggerEvent("es:setPlayerData", player, "group", args[2], function(response, success)
							TriggerClientEvent('es:setPlayerDecorator', player, 'group', tonumber(group), true)
							TriggerClientEvent('chat:addMessage', -1, {
								args = {"^6LeyendasRP: ", "Grupo de ^2^*" .. GetPlayerName(player) .. "^r^0 actualizado a ^2^*" .. group}
							})

							ExecuteCommand('add_principal identifier.' .. user.getIdentifier() .. " group." .. user.getGroup())
						end)
					end)
				else
					RconPrint("This group does not exist.\n")
				end
			end)
		else
			RconPrint("Player not ingame\n")
		end
	else
		RconPrint("Usage: setgroup [user-id] [group]\n")
	end
end, true)

--RegisterCommand('giverole', function(source, args, raw)
--	local player = tonumber(args[1])
--	local role = table.concat(args, " ", 2)
--	if args[1] then
--		if (player and GetPlayerName(player)) then
--			if args[2] then
--				TriggerEvent("es:getPlayerFromId", player, function(user)
--					user.giveRole(role)
--					TriggerClientEvent('chat:addMessage', user.get('source'), {
--						args = {"^6LeyendasRP: ", "You've been given a role: ^2" .. role}
--					})
--				end)
--			else
--				RconPrint("Usage: giverole [user-id] [role]\n")
--			end
--		else
--			RconPrint("Player not ingame\n")
--		end
--	else
--		RconPrint("Usage: giverole [user-id] [role]\n")
--	end
--end, true)

--RegisterCommand('removerole', function(source, args, raw)
--	local player = tonumber(args[1])
--	local role = table.concat(args, " ", 2)
--	if args[1] then
--		if (player and GetPlayerName(player)) then
--			if args[2] then
--				TriggerEvent("es:getPlayerFromId", tonumber(args[1]), function(user)
--					user.removeRole(role)
--					TriggerClientEvent('chat:addMessage', user.get('source'), {
--						args = {"^6LeyendasRP: ", "You've been removed a role: ^2" .. role}
--					})
--				end)
--			else
--				RconPrint("Usage: removerole [user-id] [role]\n")
--			end
--		else
--			RconPrint("Player not ingame\n")
--		end
--	else
--		RconPrint("Usage: removerole [user-id] [role]\n")
--	end
--end, true)

RegisterCommand('setmoney', function(source, args, raw)
	local player = tonumber(args[1])
	local money = tonumber(args[2])
	if args[1] then
		if (player and GetPlayerName(player)) then
			if money then
				TriggerEvent("es:getPlayerFromId", player, function(user)
					if(user)then
						user.setMoney(money)

						RconPrint("Money set")
						TriggerClientEvent('chat:addMessage', player, {
							args = {"^6LeyendasRP: ", "Tu dinero  ha sido actualizado a: ^2^*$" .. money}
						})
					end
				end)
			else
				RconPrint("Invalid integer\n")
			end
		else
			RconPrint("Player not ingame\n")
		end
	else
		RconPrint("Usage: setmoney [user-id] [money]\n")
	end
end, true)

-- Default commands
TriggerEvent('es:addCommand', 'permisos', function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, {
		args = {"^6LeyendasRP: ", "Nivel: ^*^2 " .. tostring(user.get('permission_level'))}
	})
	TriggerClientEvent('chat:addMessage', source, {
		args = {"^6LeyendasRP: ", "Grupo: ^*^2 " .. user.getGroup()}
	})
end, {help = "Muestra tu nivel de permisos."})

-- Ban a person
--[[TriggerEvent("es:addGroupCommand", 'ban', "mod", function(source, args, user)
	local Source = source
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerEvent('es:canGroupTarget', user.getGroup(), target.getGroup(), function(canTarget)
					if canTarget then
						local reason = args
						table.remove(reason, 1)
						local time = args[1]
						table.remove(reason, 1)
						if(#reason == 0)then
							reason = "Has sido baneado del servidor"
						else
							reason = "" .. table.concat(reason, " ")
						end

						-- Awful shit logic but eh, it works?
						-- Days
						if string.find(time, "m")then
							time = math.floor(time:gsub("%m", "") * 60)
						elseif string.find(time, "h") then
							time = math.floor(time:gsub("%h", "") * 60 * 60)
						elseif string.find(time, "d") then
							time = math.floor(time:gsub("%d", "") * 60 * 60 * 24)
						elseif string.find(time, "y") then
							time = math.floor(time:gsub("%y", "") * 60 * 60 * 24 * 365)
						end

						TriggerClientEvent('chat:addMessage', -1, {
							args = {"^6LeyendasRP: ", "El jugador ^2" .. GetPlayerName(player) .. "^0 ha sido kickeado (^2" .. reason .. "^0)"}
						})
						banUser(time, user.getIdentifier(), target.getIdentifier(), reason)
						DropPlayer(player, "Baneado por: " .. reason .. "\nExpira: " .. (os.date("%c", os.time() + time)))
					else
						TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "You can not target this person"}})
					end
				end)
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
	end
end)
]]--

RegisterNetEvent('getPlayers')
AddEventHandler('getPlayers', function()
	local players = ESX.GetPlayers()
	local playersArray = {}
	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		table.insert(players, {id = xPlayer.source, name = GetPlayerName(xPlayer)})
	end
	TriggerClientEvent('getPlayersClient', source, playersArray)
end)

-- Report to admins
TriggerEvent('es:addCommand', 'st', function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, {
		args = {"^6Staff Chat - ", " ^2" .. GetPlayerName(source) .." | "..source.."^0: " .. table.concat(args, " ")}
	})

	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^6Staff Chat - ", " ^2" .. GetPlayerName(source) .." | "..source.."^0: " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, {help = "Report a player or an issue", params = {{name = "Staff Chat", help = "Contenido del mensaje"}}})

-- Noclip
TriggerEvent('es:addGroupCommand', 'noclip', "support", function(source, args, user)
	TriggerClientEvent("es_admin:noclip", source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Permisos insuficientes."} })
end, {help = "Enable or disable noclip"})

-- Kicking
TriggerEvent('es:addGroupCommand', 'kick', "mod", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				local reason = args
				table.remove(reason, 1)
				if(#reason == 0)then
					reason = "Kickeado: Has sido kickeado de LeyendasRP"
				else
					reason = "Kickeado: " .. table.concat(reason, " ")
				end

				TriggerClientEvent('chat:addMessage', -1, {
					args = {"^6LeyendasRP: ", "El jugador ^2" .. GetPlayerName(player) .. "^0 ha sido kickeado (^2" .. reason .. "^0)"}
				})
				DropPlayer(player, reason)
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Permisos insuficientes."} })
end, {help = "Kick a user with the specified reason or no reason", params = {{name = "id", help = "ID del jugador"}, {name = "reason", help = "The reason as to why you kick this player"}}})

-- Announcing
TriggerEvent('es:addGroupCommand', 'anuncio', "mod", function(source, args, user)
	TriggerClientEvent('chat:addMessage', -1, {
		args = {"^6LeyendasRP - Anuncio: ", table.concat(args, " ")}
	})
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Permisos insuficientes."} })
end, {help = "Anunciar un mensaje a todo el servidor", params = {{name = "Anuncio", help = "El mensaje"}}})

-- Freezing
local frozen = {}
TriggerEvent('es:addGroupCommand', 'freeze', "mod", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				if(frozen[player])then
					frozen[player] = false
				else
					frozen[player] = true
				end

				TriggerClientEvent('es_admin:freezePlayer', player, frozen[player])

				local state = "unfrozen"
				if(frozen[player])then
					state = "frozen"
				end

				TriggerClientEvent('chat:addMessage', player, { args = {"^6LeyendasRP: ", "Has sido " .. state .. " por ^2" .. GetPlayerName(source)} })
				TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", " ^2" .. GetPlayerName(player) .. "^0 has been " .. state} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Permisos insuficientes."} })
end, {help = "Freeze o unfreeze a un jugador", params = {{name = "id", help = "ID del jugador"}}})

-- Bring
TriggerEvent('es:addGroupCommand', 'bring', "support", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:teleportUser', target.get('source'), user.getCoords().x, user.getCoords().y, user.getCoords().z)

				TriggerClientEvent('chat:addMessage', player, { args = {"^6LeyendasRP: ", "^2 " .. GetPlayerName(source) .. " te ha traído"} })
				TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "^2Se ha traído a " .. GetPlayerName(player)} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Permisos insuficientes."} })
end, {help = "Teleport a user to you", params = {{name = "id", help = "ID del jugador"}}})

-- Slap
TriggerEvent('es:addGroupCommand', 'slap', "admin", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:slap', player)

				TriggerClientEvent('chat:addMessage', player, { args = {"^6LeyendasRP: ", "You have slapped by ^2" .. GetPlayerName(source)} })
				TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Player ^2" .. GetPlayerName(player) .. "^0 has been slapped"} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Permisos insuficientes."} })
end, {help = "Slap a user", params = {{name = "id", help = "ID del jugador"}}})

-- Goto
TriggerEvent('es:addGroupCommand', 'goto', "support", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)
				if(target)then

					TriggerClientEvent('es_admin:teleportUser', source, target.getCoords().x, target.getCoords().y, target.getCoords().z)

					TriggerClientEvent('chat:addMessage', player, { args = {"^6LeyendasRP: ", "^2Has sido tepeado por ^2" .. GetPlayerName(source)} })
					TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "^2Teletransportado hacia ^2" .. GetPlayerName(player) .. ""} })
				end
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Permisos insuficientes."} })
end, {help = "Teleport to a user", params = {{name = "id", help = "ID del jugador"}}})

-- Kill yourself
TriggerEvent('es:addCommand', 'die', function(source, args, user)
	TriggerClientEvent('es_admin:kill', source)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Te has suicidado"} })
end, {help = "Suicide"})

-- Slay a player
TriggerEvent('es:addGroupCommand', 'slay', "mod", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:kill', player)

				TriggerClientEvent('chat:addMessage', player, { args = {"^6LeyendasRP: ", "Te ha matado un poder extraño ^2" .. GetPlayerName(source)} })
				TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "El jugador ^2" .. GetPlayerName(player) .. "^0 ha muerto."} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Permisos insuficientes."} })
end, {help = "Slay a user", params = {{name = "id", help = "ID del jugador"}}})

-- Crashing
TriggerEvent('es:addGroupCommand', 'crash', "superadmin", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:crash', player)

				TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "El jugador ^2" .. GetPlayerName(player) .. "^0 se le ha crasheado."} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "ID incorrecta"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^6LeyendasRP: ", "Permisos insuficientes."} })
end, {help = "Crash a user, no idea why this still exists", params = {{name = "id", help = "ID del jugador"}}})

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

loadBans()
