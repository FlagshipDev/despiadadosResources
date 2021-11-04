local tiempo = 4000 -- 1000 ms = 1s
local isTaz = false



RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'LSPD',
		number     = 'police',
		base64Icon = 'data:image/png;base64,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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local sleep = true
        SetPedSuffersCriticalHits(PlayerPedId(), true)
		if IsPedBeingStunned(PlayerPedId()) then
			sleep = false
			SetPedToRagdoll(PlayerPedId(), 5000, 5000, 0, 0, 0, 0)
		end
		
		if IsPedBeingStunned(PlayerPedId()) and not isTaz then
			isTaz = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
		elseif not IsPedBeingStunned(PlayerPedId()) and isTaz then
			isTaz = false
			Wait(5000)
			SetTimecycleModifier("hud_def_desat_Trevor")
			Wait(10000)
      		SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
		end
		if sleep then
			Wait(2000)
		end
	end
end)


local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData, CurrentActionData = {}, {}
local HasAlreadyEnteredMarker, isDead = false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
ESX = nil
blip = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0) 
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function SetVehicleMaxMods(vehicle)
	local props = {
		modEngine       = 2,
		modBrakes       = 2,
		modTransmission = 2,
		modSuspension   = 3,
		modTurbo        = true
	}

	ESX.Game.SetVehicleProperties(vehicle, props)
end

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniformPol(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.LSPD.Uniforms[job].male then
				TriggerEvent('skinchanger:loadClothes', skin, Config.LSPD.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end

			if job == 'tenu_doag' then
				SetPedArmour(playerPed, 100)
			end

			if job == 'tenu_sahpg' then
				SetPedArmour(playerPed, 100)
			end

			if job == 'tenu_swatgr' then
				SetPedArmour(playerPed, 100)
			end
		else
			if Config.LSPD.Uniforms[job].female then
				TriggerEvent('skinchanger:loadClothes', skin, Config.LSPD.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end


function OpenCloakroomMenuPol()
	local playerPed = PlayerPedId()
	local grade = PlayerData.job.grade_name

	local elements = {
		--{ label = 'En prácticas', value = 'tenu_lspd' },
		{ label = _U('citizen_wear'), value = 'citizen_wear' },
		--{ label = 'Tenue De Police', value = 'tenu_lspd' },
	--	{ label = 'Tenue Hiver', value = 'tenu_hiv'},
		--{ label = 'Tenue SWAT 1', value = 'tenu_swat'},
		--{ label = _U('bullet_wear'), value = 'bullet_wear' },
	}

	
	if grade == 'recruit' then
		table.insert(elements, {label = _U('police_wear'), value = 'recruit_wear'})
		table.insert(elements, {label = _U('police_wear1'), value = 'recruit_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'recruit_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
	elseif grade == 'officer' then
		table.insert(elements, {label = _U('police_wear'), value = 'officer_wear'})
		table.insert(elements, {label = _U('police_wear1'), value = 'officer_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'officer_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
	elseif grade == 'officer3' then
		table.insert(elements, {label = _U('police_wear'), value = 'officer3_wear'})
		table.insert(elements, {label = _U('police_wear1'), value = 'officer3_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'officer3_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
		table.insert(elements, {label = 'Operaciones Esp. LSPD', value = 'tenu_doag' })
		table.insert(elements, {label = 'SWAT', value = 'tenu_swatgr'})
		table.insert(elements, {label = 'Entrenamiento LSPD', value = 'tenu_hiv'})
		table.insert(elements, {label = 'Entrenamiento SWAT', value = 'tenu_swat'})
	elseif grade == 'sergeant' then
		table.insert(elements, {label = _U('police_wear1'), value = 'sergeant_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'sergeant_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
		table.insert(elements, {label = 'Operaciones Esp. LSPD', value = 'tenu_doag' })
		table.insert(elements, {label = 'SWAT', value = 'tenu_swatgr'})
		table.insert(elements, {label = 'Entrenamiento LSPD', value = 'tenu_hiv'})
		table.insert(elements, {label = 'Entrenamiento SWAT', value = 'tenu_swat'})
	elseif grade == 'detective' then
		table.insert(elements, {label = _U('police_wear1'), value = 'detective_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'detective_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
		table.insert(elements, {label = 'Operaciones Esp. LSPD', value = 'tenu_doag' })
		table.insert(elements, {label = 'SWAT', value = 'tenu_swatgr'})
		table.insert(elements, {label = 'Entrenamiento LSPD', value = 'tenu_hiv'})
		table.insert(elements, {label = 'Entrenamiento SWAT', value = 'tenu_swat'})
	elseif grade == 'lieutenant' then
		table.insert(elements, {label = _U('police_wear1'), value = 'lieutenant_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'lieutenant_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
		table.insert(elements, {label = 'Operaciones Esp. LSPD', value = 'tenu_doag' })
		table.insert(elements, {label = 'SWAT', value = 'tenu_swatgr'})
		table.insert(elements, {label = 'Entrenamiento LSPD', value = 'tenu_hiv'})
		table.insert(elements, {label = 'Entrenamiento SWAT', value = 'tenu_swat'})
	elseif grade == 'captain' then
		table.insert(elements, {label = _U('police_wear1'), value = 'captain_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'captain_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
		table.insert(elements, {label = 'Operaciones Esp. LSPD', value = 'tenu_doag' })
		table.insert(elements, {label = 'SWAT', value = 'tenu_swatgr'})
		table.insert(elements, {label = 'Entrenamiento LSPD', value = 'tenu_hiv'})
		table.insert(elements, {label = 'Entrenamiento SWAT', value = 'tenu_swat'})
	elseif grade == 'commander' then
		table.insert(elements, {label = _U('police_wear1'), value = 'commander_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'commander_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
		table.insert(elements, {label = 'Operaciones Esp. LSPD', value = 'tenu_doag' })
		table.insert(elements, {label = 'SWAT', value = 'tenu_swatgr'})
		table.insert(elements, {label = 'Entrenamiento LSPD', value = 'tenu_hiv'})
		table.insert(elements, {label = 'Entrenamiento SWAT', value = 'tenu_swat'})
	elseif grade == 'supervisor' then
		table.insert(elements, {label = _U('police_wear1'), value = 'supervisor_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'supervisor_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
		table.insert(elements, {label = 'Operaciones Esp. LSPD', value = 'tenu_doag' })
		table.insert(elements, {label = 'SWAT', value = 'tenu_swatgr'})
		table.insert(elements, {label = 'Entrenamiento LSPD', value = 'tenu_hiv'})
		table.insert(elements, {label = 'Entrenamiento SWAT', value = 'tenu_swat'})
	elseif grade == 'adjunto' then
		table.insert(elements, {label = _U('police_wear1'), value = 'adjunto_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'adjunto_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
		table.insert(elements, {label = 'Operaciones Esp. LSPD', value = 'tenu_doag' })
		table.insert(elements, {label = 'SWAT', value = 'tenu_swatgr'})
		table.insert(elements, {label = 'Entrenamiento LSPD', value = 'tenu_hiv'})
		table.insert(elements, {label = 'Entrenamiento SWAT', value = 'tenu_swat'})
	elseif grade == 'boss' then
		table.insert(elements, {label = _U('police_wear1'), value = 'boss_wear1'})
		table.insert(elements, {label = _U('police_wear2'), value = 'boss_wear2'})
		table.insert(elements, {label = 'Uniforme Mary', value = 'mary_lspd' })
		table.insert(elements, {label = 'Tráfico', value = 'tenu_ma' })
		table.insert(elements, {label = 'Operaciones Esp. LSPD', value = 'tenu_doag' })
		table.insert(elements, {label = 'SWAT', value = 'tenu_swatgr'})
		table.insert(elements, {label = 'Entrenamiento LSPD', value = 'tenu_hiv'})
		table.insert(elements, {label = 'Entrenamiento SWAT', value = 'tenu_swat'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		css      = 'police',
		title    = _U('cloakroom'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			if Config.LSPD.EnableNonFreemodePeds then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0


					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0


					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
			end
		end

		if
			data.current.value == 'recruit_wear' or
			data.current.value == 'officer_wear' or
			data.current.value == 'officer3_wear' or
			data.current.value == 'sergeant_wear' or
			data.current.value == 'detective_wear' or
			data.current.value == 'lieutenant_wear' or
			data.current.value == 'captain_wear' or
			data.current.value == 'commander_wear' or
			data.current.value == 'supervisor_wear' or
			data.current.value == 'adjunto_wear' or
			data.current.value == 'boss_wear' or
			data.current.value == 'recruit_wear1' or
			data.current.value == 'officer_wear1' or
			data.current.value == 'officer3_wear1' or
			data.current.value == 'sergeant_wear1' or
			data.current.value == 'detective_wear1' or
			data.current.value == 'lieutenant_wear1' or
			data.current.value == 'captain_wear1' or
			data.current.value == 'commander_wear1' or
			data.current.value == 'supervisor_wear1' or
			data.current.value == 'adjunto_wear1' or
			data.current.value == 'boss_wear1' or
			data.current.value == 'recruit_wear2' or
			data.current.value == 'officer_wear2' or
			data.current.value == 'officer3_wear2' or
			data.current.value == 'sergeant_wear2' or
			data.current.value == 'detective_wear2' or
			data.current.value == 'lieutenant_wear2' or
			data.current.value == 'captain_wear2' or
			data.current.value == 'commander_wear2' or
			data.current.value == 'supervisor_wear2' or
			data.current.value == 'adjunto_wear2' or
			data.current.value == 'boss_wear2' or
			data.current.value == 'mary_lspd' or
			data.current.value == 'bullet_wear' or
			data.current.value == 'tenu_ma' or
			data.current.value == 'tenu_hiv' or
			data.current.value == 'tenu_swat' or
			data.current.value == 'tenu_swatgr' or
			data.current.value == 'tenu_doag' or
			data.current.value == 'tenu_lspd' or
			data.current.value == 'tenu_sahp' or
			data.current.value == 'tenu_sahpg'
		then
			setUniformPol(data.current.value, playerPed)
		end

		if data.current.value == 'freemode_ped' then
			local modelHash = ''

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					modelHash = GetHashKey(data.current.maleModel)
				else
					modelHash = GetHashKey(data.current.femaleModel)
				end

				ESX.Streaming.RequestModel(modelHash, function()
					SetPlayerModel(PlayerId(), modelHash)
					SetModelAsNoLongerNeeded(modelHash)

					TriggerEvent('esx:restoreLoadout')
				end)
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end

function OpenArmoryMenu(station)

	local elements = {}
	if Config.LSPD.EnableArmoryManagement then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = ('Guardar armas'),     value = 'put_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
		css      = 'police',
		title    = _U('armory'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'get_weapon' then
			OpenGetWeaponMenuPol()
		elseif data.current.value == 'put_weapon' then
			OpenPutWeaponMenuPol()
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenuPol()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenuPol()
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	end)
end

function OpenGetWeaponMenuPol()
	ESX.TriggerServerCallback('esx_policejob:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = ESX.GetWeaponLabel(weapons[i].name)..' - '..weapons[i].count,
					value = weapons[i].name,
					type = 'item_weapon',
					haveImage = true
				})
				print(weapons[i].name)
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon', {
			css      = 'police',
			title    = _U('get_weapon_menu'),
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('esx_policejob:removeArmoryWeapon', function()
				OpenGetWeaponMenuPol()
			end, data.current.value)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

RegisterNetEvent('flag_masterjob:checkBullets')
AddEventHandler('flag_masterjob:checkBullets', function(gun)
	local hash = GetHashKey(gun)
	local AmmoInClip = GetAmmoInPedWeapon(PlayerPedId(), hash)
	TriggerServerEvent('flag_masterjob:checkBulletsServer', AmmoInClip, gun)
end)


function OpenPutWeaponMenuPol()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name,
				type = 'item_weapon',
				haveImage = true
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon', {
		css      = 'police',
		title    = _U('put_weapon_menu'),
		align    = 'bottom-right',
		elements = elements,
		enableImages = true
	}, function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
			OpenPutWeaponMenuPol()
		end, data.current.value, true)
	end, function(data, menu)
		menu.close()
	end)
end


function OpenGetStocksMenuPol()
	ESX.TriggerServerCallback('esx_policejob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = items[i].label .. ' - ' .. items[i].count,
				value = items[i].name,
				type = 'item_standard',
				haveImage = true
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css      = 'police',
			title    = _U('police_stock'),
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				css      = 'police',
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:getStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetStocksMenuPol()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenuPol()
	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.count .. ' - ' .. item.label,
					type = 'item_standard',
					value = item.name,
					haveImage = true
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			css      = 'police',
			title    = _U('inventory'),
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				css      = 'police',
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:putStockItems', itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenuPol()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_addons_gcphone:loaded')
AddEventHandler('esx_addons_gcphone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_police'),
		number     = 'police',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_addons_gcphone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)


AddEventHandler('esx_policejob:hasEnteredMarker', function(station, part, partNum)
	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	elseif part == 'Armory' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	elseif part == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_policejob:hasExitedMarker', function(station, part, partNum)
--	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
--	end

	CurrentAction = nil
end)




-- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.LSPD.PoliceStations) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('map_blip'))
		EndTextCommandSetBlipName(blip)
	end
--[[	for k,v in pairs(Config.LSPD.PoliceStations) do
		local blip2 = AddBlipForCoord(v.Blip2.Coords)

		SetBlipSprite (blip2, v.Blip2.Sprite)
		SetBlipDisplay(blip2, v.Blip2.Display)
		SetBlipScale  (blip2, v.Blip2.Scale)
		SetBlipColour (blip2, v.Blip2.Colour)
		SetBlipAsShortRange(blip2, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('map_blip'))
		EndTextCommandSetBlipName(blip2)
	end]]--

end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.job and PlayerData.job.name == 'police' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			local isInMarker, hasExited, letSleep = false, false, true
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.LSPD.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Cloakrooms[i], true)

					if distance < Config.LSPD.DrawDistance then
						DrawMarker(27, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.LSPD.MarkerColor.r, Config.LSPD.MarkerColor.g, Config.LSPD.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end

					if distance < Config.LSPD.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cloakroom', i
					end
				end

				for i=1, #v.Armories, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Armories[i], true)

					if distance < Config.LSPD.DrawDistance then
						DrawMarker(27, v.Armories[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 138, 236, 255, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end

					if distance < Config.LSPD.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Armory', i
					end
				end

				for i=1, #v.Vehicles, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner, true)

					if distance < Config.LSPD.DrawDistance then
						DrawMarker(36, v.Vehicles[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.LSPD.MarkerColor.r, Config.LSPD.MarkerColor.g, Config.LSPD.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end

					if distance < Config.LSPD.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Vehicles', i
					end
				end

				for i=1, #v.Helicopters, 1 do
					local distance =  GetDistanceBetweenCoords(coords, v.Helicopters[i].Spawner, true)

					if distance < Config.LSPD.DrawDistance then
						DrawMarker(34, v.Helicopters[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.LSPD.MarkerColor.r, Config.LSPD.MarkerColor.g, Config.LSPD.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end

					if distance < Config.LSPD.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Helicopters', i
					end
				end

				if Config.LSPD.EnablePlayerManagement and PlayerData.job.grade_name == 'boss' then
					for i=1, #v.BossActions, 1 do
						local distance = GetDistanceBetweenCoords(coords, v.BossActions[i], true)

						if distance < Config.LSPD.DrawDistance then
							DrawMarker(27, v.BossActions[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.LSPD.MarkerColor.r, Config.LSPD.MarkerColor.g, Config.LSPD.MarkerColor.b, 100, false, true, 2, true, false, false, false)
							letSleep = false
						end

						if distance < Config.LSPD.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'BossActions', i
						end
					end
				end
			end

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastStation and LastPart and LastPartNum) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_policejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(2000)
			end

		else
			Citizen.Wait(6000)
		end
	end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_roadcone02a',
		'prop_barrier_work05',
		'prop_mp_barrier_02b',
		'prop_barrier_work01b',
		'p_ld_stinger_s',
		'prop_boxpile_07d',
		'hei_prop_cash_crate_half_full',
		'prop_air_conelight',
		'prop_mp_arrow_barrier_01',
		'prop_trafficdiv_01',
		'prop_trafficdiv_02',
		'prop_toolchest_01'
	}

	while true do
		Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
		local sleep = true
		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(coords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords, objCoords, true)

				if closestDistance == -1 or closestDistance > distance then
					sleep = false
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_policejob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('esx_policejob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end

		if sleep then
			Wait(2000)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
		
		if CurrentAction then
			--ESX.ShowHelpNotification(CurrentActionMsg)
			ESX.ShowFloatingHelpNotification(CurrentActionMsg, vector3(playerX, playerY, playerZ+0.8))
			if IsControlJustReleased(0, 38) and PlayerData.job and PlayerData.job.name == 'police' then

				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenuPol()
				elseif CurrentAction == 'menu_armory' then
					OpenArmoryMenu(CurrentActionData.station)
				elseif CurrentAction == 'menu_boss_actions' then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
						menu.close()

						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, { wash = false }) -- disable washing money
				elseif CurrentAction == 'remove_entity' then
					ESX.Streaming.RequestAnimDict('random@domestic', function()
						TaskPlayAnim(playerPed, 'random@domestic', 'pickup_low', 8.0, -8, 1900, 49, 0.0, false, false, false)
					end)
					DeleteEntity(CurrentActionData.entity)
				end
				CurrentAction = nil
			elseif IsControlJustReleased(0, 38) and PlayerData.job and PlayerData.job.name == 'mechanic' then
				if CurrentAction == 'remove_entity' then
					ESX.Streaming.RequestAnimDict('random@domestic', function()
						TaskPlayAnim(playerPed, 'random@domestic', 'pickup_low', 8.0, -8, 1900, 49, 0.0, false, false, false)
					end)
					DeleteEntity(CurrentActionData.entity)
				end
				CurrentAction = nil
			end
		else
			Wait(2000)
		end -- CurrentAction end
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)


AddEventHandler('esx_policejob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if PlayerData.job and PlayerData.job.name == 'police' and IsPedOnFoot(playerPed) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_prop')
		CurrentActionData = {entity = entity}
    elseif PlayerData.job and PlayerData.job.name == 'mechanic' and IsPedOnFoot(playerPed) then
        CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_prop')
		CurrentActionData = {entity = entity}
    end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)


AddEventHandler('esx_policejob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)


