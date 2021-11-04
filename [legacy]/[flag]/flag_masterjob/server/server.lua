ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local Vehicles = nil
local playersHealing, deadPlayers = {}, {}


RegisterNetEvent('flag_masterjob:buyweedshop')
AddEventHandler('flag_masterjob:buyweedshop', function(item, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local dinero = xPlayer.getMoney() 
--	local dinero = xPlayer.getAccount('black_money')
	local dineroBlanco = xPlayer.getMoney()

--	if dinero.money > price then
--		xPlayer.removeAccountMoney('black_money', price)
--		xPlayer.addInventoryItem(item, 1)
	if dineroBlanco > 0 then
		xPlayer.removeMoney(price)
		xPlayer.addInventoryItem(item, 1)
		TriggerClientEvent('esx:showNotification', source, 'Has comprado algo de forma ~r~ilegal~s~ a esta persona')
	else
		TriggerClientEvent('esx:showNotification', source, 'Bro, ¿Porque vienes con las manos vacías? Trae dinero al menos, no me vaciles o te subiré los precios.')
	end

end)
RegisterNetEvent('flag_masterjob:gunrack')
AddEventHandler('flag_masterjob:gunrack', function(gun)
	local xPlayer = ESX.GetPlayerFromId(source)
	local ammo = 0
	local _gun = gun:upper()
	local hasWeapon =  xPlayer.getWeapon(_gun)
	
	if hasWeapon then
		xPlayer.removeWeapon(_gun)
		TriggerClientEvent('flag_masterjob:gunrackNot', source, gun)
	elseif not hasWeapon then
		if gun == 'weapon_carbinerifle' or gun == 'weapon_smg' then
			ammo = 30
		else
			ammo = 8
		end
		xPlayer.addWeapon(gun, ammo)
		TriggerClientEvent('flag_masterjob:gunrackNYes', source, gun)
	end
end)

RegisterNetEvent('flag_masterjob:VenderPesca')
AddEventHandler('flag_masterjob:VenderPesca', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local inventory = xPlayer.getInventory()
	local countFish = 0
	local countShark = 0
	local countTurtle = 0
	local pezVenta = 15

	for i=1, #inventory, 1 do
		if inventory[i].name == 'fish' then
			countFish = inventory[i].count
		elseif inventory[i].name == 'shark' then
			countShark = inventory[i].count
		elseif inventory[i].name == 'turtle'  then
			countTurtle = inventory[i].count
		end
	end

	if countFish > 0 then
		TriggerClientEvent('esx:showNotification', source, 'Has vendido ~b~'..countFish..'~s~ de pescado')	
		xPlayer.removeInventoryItem('fish', countFish)
		xPlayer.addMoney(pezVenta*countFish)
	elseif countShark == 0 and countTurtle == 0 then
		TriggerClientEvent('esx:showNotification', source, 'No tienes ~b~nada~s~ que me interese')	
	elseif countShark > 0 or countTurtle > 0 then
		TriggerClientEvent('esx:showNotification', source, 'La caza de tortugas y tiburones está prohíbida! Es ~r~ilegalísimo~s~!')
	end
end)

RegisterNetEvent('flag_masterjob:buyPesca')
AddEventHandler('flag_masterjob:buyPesca', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if item == 'caña' then
		xPlayer.removeMoney(10)
		xPlayer.addInventoryItem('fishingrod', 1)
		TriggerClientEvent('esx:showNotification', source, 'Has comprado una ~b~caña~s~ de pescar')	
	elseif item == 'cebo' then
		xPlayer.removeMoney(5)
		xPlayer.addInventoryItem('fishbait', 5)
		TriggerClientEvent('esx:showNotification', source, 'Has comprado un ~b~pack~s~ de cebo para pescar')	
	end
end)

RegisterNetEvent('flag_masterjob:darparachute')
AddEventHandler('flag_masterjob:darparachute', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.addWeapon('GADGET_PARACHUTE', 1)
end)

RegisterNetEvent('flag_masterjob:dartrabajo')
AddEventHandler('flag_masterjob:dartrabajo', function(job)

	local xPlayer = ESX.GetPlayerFromId(source)

	if job ~= nil then
		xPlayer.setJob(job, 0)
	end
end)

ESX.RegisterServerCallback('checkVip', function(source, cb)
 
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.fechVip ~= nil then
		cb(true)
	else
		cb(false)
	end

end)


RegisterNetEvent('flag_menupersonal:esvip')
AddEventHandler('flag_menupersonal:esvip', function()
	local steamid
	local fechaExp
	local vip
	local _source = source
--	local timeStart = os.clock()
  	for k,v in pairs(GetPlayerIdentifiers(_source))do   
     	if string.sub(v, 1, string.len("steam:")) == "steam:" then
        	steamid = v
      	end
  	end

	MySQL.Async.fetchAll('SELECT identifier, DATE_FORMAT(expire, "%d-%m-%Y") AS fecha FROM vip WHERE identifier = @identifier', {
		['@identifier'] = steamid,
	}, function(result)
		if result ~= nil and result[1] ~= nil then
			vip = true
	--		print(json.encode(result))
			fechaExp = result[1].fecha
			TriggerClientEvent('flag_menupersonal:esvipClient', _source, vip, fechaExp)
		else
			vip = false
			TriggerClientEvent('flag_menupersonal:esvipClient', _source, vip, fechaExp)
		end
	end)
--	local elapsedTime = os.clock() - timeStart
--	print(('[FlagMenuPersonal] [^2INFO^7] La query tardó %s segundos'):format(elapsedTime))
end)


--[[RegisterNetEvent('flag_menupersonal:esvip')
AddEventHandler('flag_menupersonal:esvip', function()
	local steamid
	local vip
	local fecha
	local _source = source
  	for k,v in pairs(GetPlayerIdentifiers(_source))do   
     	if string.sub(v, 1, string.len("steam:")) == "steam:" then
        	steamid = v
      	end
  	end

	local fecha = ESX.IsVip(steamid)

	if fecha == 0 then
		vip = false
	else
		vip = true
	end

	TriggerClientEvent('flag_menupersonal:esvip', _source, vip, fecha)
end)]]--



RegisterServerEvent('ref:reference')
AddEventHandler('ref:reference', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent("ref:addBlip", -1, tonumber(_source))
	else
		TriggerClientEvent('esx:showNotification', _source, 'No eres del SAPD.')
	end
end)

RegisterServerEvent('ref:reference2')
AddEventHandler('ref:reference2', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.job.name == 'sheriff' then
		TriggerClientEvent("ref:addBlip", -1, tonumber(_source))
	else
		TriggerClientEvent('esx:showNotification', _source, 'No eres del SAPD.')
	end
end)


RegisterCommand("carcel", function(src, args, raw)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == "police" then

		local jailPlayer = args[1]
		local jailTime = tonumber(args[2])
		local jailReason = args[3]

		if GetPlayerName(jailPlayer) ~= nil then

			if jailTime ~= nil then
				JailPlayer(jailPlayer, jailTime)

				TriggerClientEvent("esx:showNotification", src, GetPlayerName(jailPlayer) .. " En prisión " .. jailTime .. " minutos!")
				
				if args[3] ~= nil then
					GetRPName(jailPlayer, function(Firstname, Lastname)
						TriggerClientEvent('chat:addMessage', -1, { args = { "Juez: ",  Firstname .. " " .. Lastname .. "ha ingresado en la cárcel: " .. args[3] }, color = { 249, 166, 0 } })
					end)
				end
			else
				TriggerClientEvent("esx:showNotification", src, "Tiempo inválido.")
			end
		else
			TriggerClientEvent("esx:showNotification", src, "Esta ID no está online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "No eres un oficial!")
	end
end)

RegisterCommand("unjail", function(src, args)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == "police" then

		local jailPlayer = args[1]

		if GetPlayerName(jailPlayer) ~= nil then
			UnJail(jailPlayer)
		else
			TriggerClientEvent("esx:showNotification", src, "Esta ID no está online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "No eres un oficial!")
	end
end)

RegisterServerEvent("esx-qalle-jail:jailPlayer")
AddEventHandler("esx-qalle-jail:jailPlayer", function(targetSrc, jailTime, jailReason)
	local src = source
	local targetSrc = tonumber(targetSrc)

	JailPlayer(targetSrc, jailTime)

	GetRPName(targetSrc, function(Firstname, Lastname)
		TriggerClientEvent('chat:addMessage', -1, { args = { "Juez: ",  Firstname .. " " .. Lastname .. " he ingresado en prisión por: " .. jailReason }, color = { 249, 166, 0 } })
	end)

	TriggerClientEvent("esx:showNotification", src, GetPlayerName(targetSrc) .. " En prisión " .. jailTime .. " minutos!")
end)

RegisterServerEvent("esx-qalle-jail:unJailPlayer")
AddEventHandler("esx-qalle-jail:unJailPlayer", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if xPlayer ~= nil then
		UnJail(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0
			}
		)
	end

	TriggerClientEvent("esx:showNotification", src, xPlayer.name .. " Unjailed!")
end)

RegisterServerEvent("esx-qalle-jail:updateJailTime")
AddEventHandler("esx-qalle-jail:updateJailTime", function(newJailTime)
	local src = source

	EditJailTime(src, newJailTime)
end)

RegisterServerEvent("esx-qalle-jail:prisonWorkReward")
AddEventHandler("esx-qalle-jail:prisonWorkReward", function()
	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)

	xPlayer.addMoney(math.random(13, 21))
	xPlayer.addInventoryItem('bread', 1)
	xPlayer.addInventoryItem('water', 1)

	TriggerClientEvent("esx:showNotification", src, "Gracias, aquí tienes algo de dinero en efectivo para comida!")
end)

function JailPlayer(jailPlayer, jailTime)
	TriggerClientEvent("esx-qalle-jail:jailPlayer", jailPlayer, jailTime)

	EditJailTime(jailPlayer, jailTime)
end

function UnJail(jailPlayer)
	TriggerClientEvent("esx-qalle-jail:unJailPlayer", jailPlayer)

	EditJailTime(jailPlayer, 0)
end

function EditJailTime(source, jailTime)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime)
		}
	)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].firstname, result[1].lastname)

	end)
end

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailedPlayers", function(source, cb)
	
	local jailedPersons = {}

	MySQL.Async.fetchAll("SELECT firstname, lastname, jail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)

		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name = result[i].firstname .. " " .. result[i].lastname, jailTime = result[i].jail, identifier = result[i].identifier })
		end

		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailTime", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].jail)

		if JailTime > 0 then

			cb(true, JailTime)
		else
			cb(false, 0)
		end

	end)
end)

TriggerEvent('esx_addons_gcphone:registerNumber', 'police', _U('alert_police'), true, true)
TriggerEvent('esx_society:registerSociety', 'police', 'Police', 'society_police', 'society_police', 'society_police', {type = 'public'})


RegisterServerEvent('esx_policejob:getStockItem')
AddEventHandler('esx_policejob:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end
	end)
end)

RegisterServerEvent('esx_policejob:putStockItems')
AddEventHandler('esx_policejob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)


RegisterNetEvent('flag_masterjob:checkBulletsServer')
AddEventHandler('flag_masterjob:checkBulletsServer', function(bullets, weaponname)
	GiveAmmo(source, bullets, weaponname)
end)

function GiveAmmo(src, bullets, weapon)
	local xPlayer = ESX.GetPlayerFromId(src)
	local clip = 0
	if weapon == 'WEAPON_COMBATPISTOL' or weapon == 'WEAPON_PISTOL' or weapon == 'WEAPON_FLAREGUN' then
		clip = (bullets)/12
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_PISTOL50' then
		clip = (bullets)/9
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_HEAVYPISTOL' then
		clip = (bullets)/18
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_SNSPISTOL' then
		clip = (bullets)/6
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_MICROSMG' then
		clip = (bullets)/16
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_MINISMG' then
		clip = (bullets)/20
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_SMG' or weapon == 'WEAPON_ASSAULTSMG' or weapon == 'WEAPON_COMBATPDW' or weapon == 'WEAPON_GUSENBERG' then
		clip = (bullets)/30
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_PUMPSHOTGUN' or weapon == 'WEAPON_SAWNOFFSHOTGUN' or weapon == 'WEAPON_ASSAULTSHOTGUN' then
		clip = (bullets)/8
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_BULLPUPSHOTGUN' then
		clip = (bullets)/14
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_HEAVYSHOTGUN' or weapon == 'WEAPON_COMBATSHOTGUN' then
		clip = (bullets)/6
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_ASSAULTRIFLE' or weapon == 'WEAPON_CARBINERIFLE' or weapon == 'WEAPON_ADVANCEDRIFLE' or weapon == 'WEAPON_SPECIALCARBINE' or weapon == 'WEAPON_BULLUPRIFLE' or weapon == 'WEAPON_COMPACTRIFLE' then
		clip = (bullets)/30
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	elseif weapon == 'WEAPON_SNIPERRIFLE' then
		clip = (bullets)/10
		clipRound = roundToNthDecimal(clip, 0)
		if clipRound >= 1 then
			xPlayer.addInventoryItem('clip', clipRound)
		end
	end


end

function roundToNthDecimal(num, n)
    local mult = 10^(n or 0)
    return math.floor(num * mult + 0.5) / mult
end

ESX.RegisterServerCallback('esx_policejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)

	local xPlayer = ESX.GetPlayerFromId(source)
	if removeWeapon then
		TriggerClientEvent('flag_masterjob:checkBullets', source, weaponName)
		xPlayer.removeWeapon(weaponName)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('esx_policejob:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addWeapon(weaponName, 0)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('esx_policejob:buyWeapon', function(source, cb, weaponName, type, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon = Config.LSPD.AuthorizedWeapons[xPlayer.job.grade_name]

	for k,v in ipairs(authorizedWeapons) do
		if v.weapon == weaponName then
			selectedWeapon = v
			break
		end
	end

	if not selectedWeapon then
		print(('esx_policejob: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
		cb(false)
	else
		-- Weapon
		if type == 1 then
			if xPlayer.getMoney() >= selectedWeapon.price then
				xPlayer.removeMoney(selectedWeapon.price)
				xPlayer.addWeapon(weaponName, 12)

				cb(true)
			else
				cb(false)
			end

		-- Weapon Component
		elseif type == 2 then
			local price = selectedWeapon.components[componentNum]
			local weaponNum, weapon = ESX.GetWeapon(weaponName)

			local component = weapon.components[componentNum]

			if component then
				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price)
					xPlayer.addWeaponComponent(weaponName, component.name)

					cb(true)
				else
					cb(false)
				end
			else
				print(('esx_policejob: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
				cb(false)
			end
		end
	end
end)


ESX.RegisterServerCallback('esx_policejob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)

AddEventHandler('playerDropped', function()
	-- Save the source in case we lose it (which happens a lot)
	local _source = source

	-- Did the player ever join?
	if _source ~= nil then
		local xPlayer = ESX.GetPlayerFromId(_source)

		-- Is it worth telling all clients to refresh?
		if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'police' then
			Citizen.Wait(5000)
			TriggerClientEvent('esx_policejob:updateBlip', -1)
		end
	end
end)

RegisterServerEvent('esx_policejob:spawned')
AddEventHandler('esx_policejob:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
end)


RegisterServerEvent('esx_policejob:message')
AddEventHandler('esx_policejob:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)

RegisterNetEvent('flag_menupersonal:getJob')
AddEventHandler('flag_menupersonal:getJob', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    return job
end)

RegisterNetEvent('flag_menupersonal:getJobLabel')
AddEventHandler('flag_menupersonal:getJobLabel', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jobgrade = xPlayer.job.grade_label
    return jobgrade
end)


RegisterNetEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	deadPlayers[source] = 'dead'
	TriggerClientEvent('flag_menupersonal:setDeadPlayers', -1, deadPlayers)
end)

RegisterNetEvent('flag_menupersonal:onPlayerDistress')
AddEventHandler('flag_menupersonal:onPlayerDistress', function()
	if deadPlayers[source] then
		deadPlayers[source] = 'distress'
		TriggerClientEvent('flag_menupersonal:setDeadPlayers', -1, deadPlayers)
	end
end)

RegisterNetEvent('esx:onPlayerSpawn')
AddEventHandler('esx:onPlayerSpawn', function()
	if deadPlayers[source] then
		deadPlayers[source] = nil
		TriggerClientEvent('flag_menupersonal:setDeadPlayers', -1, deadPlayers)
	end
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	if deadPlayers[playerId] then
		deadPlayers[playerId] = nil
		TriggerClientEvent('flag_menupersonal:setDeadPlayers', -1, deadPlayers)
	end
end)

RegisterNetEvent('flag_menupersonal:heal')
AddEventHandler('flag_menupersonal:heal', function(target, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('flag_menupersonal:heal', target, type)
	end
end)

RegisterNetEvent('flag_menupersonal:removeItem')
AddEventHandler('flag_menupersonal:removeItem', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, 1)

	if item == 'bandage' then
		xPlayer.showNotification(_U('used_bandage'))
	elseif item == 'medikit' then
		xPlayer.showNotification(_U('used_medikit'))
	end
end)

ESX.RegisterServerCallback('flag_menupersonal:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

ESX.RegisterServerCallback('flag_menupersonal:getOtherPlayerData', function(source, cb, target)
	if Config.EnableESXIdentity then
		local xPlayer = ESX.GetPlayerFromId(target)
		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			money	  = xPlayer.getMoney(),
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height
		}

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
			cb(data)
		end)
	else
		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			money	  = xPlayer.getMoney(),
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
		end)

		cb(data)
	end
end)

RegisterServerEvent('flag_menupersonal:drag')
AddEventHandler('flag_menupersonal:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent('flag_menupersonal:drag', target, source)
	end
end)



ESX.RegisterServerCallback('flag_menupersonal:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then
			MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
				else
					retrivedInfo.owner = result2[1].name
				end

				cb(retrivedInfo)
			end)
		else
			cb(retrivedInfo)
		end
	end)
end)


ESX.RegisterServerCallback('flag_menupersonal:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

RegisterNetEvent('flag_menupersonal:setDeathStatus')
AddEventHandler('flag_menupersonal:setDeathStatus', function(isDead)
	local xPlayer = ESX.GetPlayerFromId(source)

	if type(isDead) == 'boolean' then
		MySQL.Sync.execute('UPDATE users SET is_dead = @isDead WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier,
			['@isDead'] = isDead
		})
	end
end)

RegisterNetEvent('flag_menupersonal:getnombre')
AddEventHandler('flag_menupersonal:getnombre', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local nombre = xPlayer.name
	TriggerClientEvent('flag_menupersonal:getnombreClient', source, nombre)
end)

RegisterNetEvent('flag_menupersonal:revive')
AddEventHandler('flag_menupersonal:revive', function(playerId, coords)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer and xPlayer.job.name == 'ambulance' then
		local xTarget = ESX.GetPlayerFromId(playerId)

		if xTarget then
			if deadPlayers[playerId] then
				if Config.ReviveReward > 0 then
					xPlayer.showNotification(_U('revive_complete_award', xTarget.name, Config.ReviveReward))
					xPlayer.addMoney(Config.ReviveReward)
					TriggerClientEvent('flag_menupersonal:revive', xTarget.source, coords)
					--xTarget.triggerEvent('flag_menupersonal:revive')
					deadPlayers[playerId] = nil
				else
					xPlayer.showNotification(_U('revive_complete', xTarget.name))
					TriggerClientEvent('flag_menupersonal:revive', xTarget.source, coords)
					--xTarget.triggerEvent('flag_menupersonal:revive')
					deadPlayers[playerId] = nil
				end
			else
				xPlayer.showNotification(_U('player_not_unconscious'))
			end
		else
			xPlayer.showNotification('Algo ha <span style="color:yellow">fallado</span>')
		end
	end
end)

RegisterServerEvent('flag_menupersonal:putInVehicle')
AddEventHandler('flag_menupersonal:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent('flag_menupersonal:putInVehicle', target)
	end
end)

RegisterServerEvent('flag_menupersonal:OutVehicle')
AddEventHandler('flag_menupersonal:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent('flag_menupersonal:OutVehicle', target)
	end
end)

RegisterServerEvent('flag_menupersonal:requestarrest')
AddEventHandler('flag_menupersonal:requestarrest', function(targetid, playerheading, playerCoords,  playerlocation)
	_source = source
	TriggerClientEvent('flag_menupersonal:getarrested', targetid, playerheading, playerCoords, playerlocation)
	TriggerClientEvent('flag_menupersonal:doarrested', _source)
end)

RegisterServerEvent('flag_menupersonal:requestrelease')
AddEventHandler('flag_menupersonal:requestrelease', function(targetid, playerheading, playerCoords,  playerlocation)
	_source = source
	TriggerClientEvent('flag_menupersonal:getuncuffed', targetid, playerheading, playerCoords, playerlocation)
	TriggerClientEvent('flag_menupersonal:douncuffing', _source)
end)

RegisterServerEvent('flag_menupersonal:handcuff')
AddEventHandler('flag_menupersonal:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent('flag_menupersonal:handcuff', target)
	else
		TriggerClientEvent('flag_menupersonal:handcuff', target)
	end
end)

RegisterServerEvent('flag_menupersonal:message')
AddEventHandler('flag_menupersonal:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)


RegisterServerEvent('flag_menupersonal:confiscatePlayerItem')
AddEventHandler('flag_menupersonal:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)



	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then

			-- can the player carry the said amount of x item?
		--	if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
		--		TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		--	else
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem   (itemName, amount)
				TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
		--	end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney   (itemName, amount)

		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_account', amount, itemName, targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_account', amount, itemName, sourceXPlayer.name))

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon   (itemName, amount)

		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
	elseif itemType == 'money' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeMoney(amount)
		sourceXPlayer.addMoney(amount)

		TriggerClientEvent('esx:showNotification', _source, 'Has confiscado ~b~'..amount..'$~s~ a ~y~'..targetXPlayer.name)
		TriggerClientEvent('esx:showNotification', target,  'Te han confiscado ~b~'..amount..'$ ')
	end
end)


RegisterServerEvent('esx_lscustom:buyMod')
AddEventHandler('esx_lscustom:buyMod', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	price = tonumber(price)

	if Config.LSCustoms.IsMechanicJobOnly then

		--local societyAccount = nil
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
		--	societyAccount = account
		--end)
		--if price < societyAccount.money then
			TriggerClientEvent('esx_lscustom:installMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
		--	societyAccount.removeMoney(price)
	--[[	else
			TriggerClientEvent('esx_lscustom:cancelInstallMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
]]--
	else

		if price < xPlayer.getMoney() then
			TriggerClientEvent('esx_lscustom:installMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
			xPlayer.removeMoney(price)
		else
			TriggerClientEvent('esx_lscustom:cancelInstallMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end

	end
end)

RegisterServerEvent('esx_lscustom:refreshOwnedVehicle')
AddEventHandler('esx_lscustom:refreshOwnedVehicle', function(myCar)
	MySQL.Async.execute('UPDATE `owned_vehicles` SET `vehicle` = @vehicle WHERE `plate` = @plate',
	{
		['@plate']   = myCar.plate,
		['@vehicle'] = json.encode(myCar)
	})
end)

ESX.RegisterServerCallback('esx_lscustom:getVehiclesPrices', function(source, cb)
	if Vehicles == nil then
		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
			local vehicles = {}

			for i=1, #result, 1 do
				table.insert(vehicles, {
					model = result[i].model,
					price = result[i].price
				})
			end

			Vehicles = vehicles
			cb(Vehicles)
		end)
	else
		cb(Vehicles)
	end
end)

PlayersHarvesting  = {}
PlayersHarvesting2 = {}
PlayersHarvesting3 = {}
PlayersCrafting    = {}
PlayersCrafting2   = {}
PlayersCrafting3   = {}

if Config.Mechanic.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'mechanic', Config.Mechanic.MaxInService)
end

ESX.RegisterServerCallback('esx_badulaque:getVaultWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_mechanic', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  cb(weapons)
  
	end)
  
  end)
  
  ESX.RegisterServerCallback('esx_badulaque:addVaultWeapon', function(source, cb, weaponName)
  
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  
	xPlayer.removeWeapon(weaponName)
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_mechanic', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  local foundWeapon = false
  
	  for i=1, #weapons, 1 do
		if weapons[i].name == weaponName then
		  weapons[i].count = weapons[i].count + 1
		  foundWeapon = true
		end
	  end
  
	  if not foundWeapon then
		table.insert(weapons, {
		  name  = weaponName,
		  count = 1
		})
	  end
  
	   store.set('weapons', weapons)
  
	   cb()
  
	end)
  
  end)
  
  ESX.RegisterServerCallback('esx_badulaque:removeVaultWeapon', function(source, cb, weaponName)
  
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  
	xPlayer.addWeapon(weaponName, 1000)
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_mechanic', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  local foundWeapon = false
  
	  for i=1, #weapons, 1 do
		if weapons[i].name == weaponName then
		  weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
		  foundWeapon = true
		end
	  end
  
	  if not foundWeapon then
		table.insert(weapons, {
		  name  = weaponName,
		  count = 0
		})
	  end
  
	   store.set('weapons', weapons)
  
	   cb()
  
	end)
  
  end)

TriggerEvent('esx_phone:registerNumber', 'mechanic', _U('mechanic_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'mechanic', 'mechanic', 'society_mechanic', 'society_mechanic', 'society_mechanic', {type = 'private'})

local function Harvest(source)
	SetTimeout(4000, function()

		if PlayersHarvesting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('gazbottle', 1)
				Harvest(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startHarvest')
AddEventHandler('esx_mechanicjob:startHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_gas_can'))
	Harvest(source)
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest')
AddEventHandler('esx_mechanicjob:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)

local function Harvest2(source)
	SetTimeout(4000, function()

		if PlayersHarvesting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('fixtool', 1)
				Harvest2(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startHarvest2')
AddEventHandler('esx_mechanicjob:startHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_repair_tools'))
	Harvest2(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest2')
AddEventHandler('esx_mechanicjob:stopHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = false
end)

local function Harvest3(source)
	SetTimeout(4000, function()

		if PlayersHarvesting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count
			if CaroToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('carotool', 1)
				Harvest3(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startHarvest3')
AddEventHandler('esx_mechanicjob:startHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_body_tools'))
	Harvest3(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest3')
AddEventHandler('esx_mechanicjob:stopHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = false
end)

local function Craft(source)
	SetTimeout(4000, function()

		if PlayersCrafting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_gas_can'))
			else
				xPlayer.removeInventoryItem('gazbottle', 1)
				xPlayer.addInventoryItem('blowpipe', 1)
				Craft(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startCraft')
AddEventHandler('esx_mechanicjob:startCraft', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_blowtorch'))
	Craft(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopCraft')
AddEventHandler('esx_mechanicjob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)

local function Craft2(source)
	SetTimeout(4000, function()

		if PlayersCrafting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_repair_tools'))
			else
				xPlayer.removeInventoryItem('fixtool', 1)
				xPlayer.addInventoryItem('fixkit', 1)
				Craft2(source)
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startCraft2')
AddEventHandler('esx_mechanicjob:startCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_repair_kit'))
	Craft2(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopCraft2')
AddEventHandler('esx_mechanicjob:stopCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = false
end)

local function Craft3(source)
	SetTimeout(4000, function()

		if PlayersCrafting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count

			if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_body_tools'))
			else
				xPlayer.removeInventoryItem('carotool', 1)
				xPlayer.addInventoryItem('carokit', 1)
				Craft3(source)
			end
		end

	end)
end


RegisterServerEvent('esx_mechanicjob:startCraft3')
AddEventHandler('esx_mechanicjob:startCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_body_kit'))
	Craft3(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopCraft3')
AddEventHandler('esx_mechanicjob:stopCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = false
end)


ESX.RegisterUsableItem('blowpipe', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('blowpipe', 1)

	TriggerClientEvent('esx_mechanicjob:onHijack', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_blowtorch'))
end)

ESX.RegisterUsableItem('fixkit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fixkit', 1)

	TriggerClientEvent('esx_mechanicjob:onFixkit', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_repair_kit'))
end)

ESX.RegisterUsableItem('carokit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('carokit', 1)

	TriggerClientEvent('esx_mechanicjob:onCarokit', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_body_kit'))
end)

RegisterServerEvent('esx_mechanicjob:getStockItem')
AddEventHandler('esx_mechanicjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		local item = inventory.getItem(itemName)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_mechanicjob:getStockItems', function(source, cb, society)
	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_mechanicjob:putStockItems')
AddEventHandler('esx_mechanicjob:putStockItems', function(itemName, count, society)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, item.label))
	end)
end)

ESX.RegisterServerCallback('esx_mechanicjob:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({items = items})
end)


-- Heli
RegisterServerEvent('heli:spotlight')
AddEventHandler('heli:spotlight', function(state)
	local serverID = source
	TriggerClientEvent('heli:spotlight', -1, serverID, state)
end)