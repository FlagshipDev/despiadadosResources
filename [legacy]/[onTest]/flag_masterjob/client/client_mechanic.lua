local HasAlreadyEnteredMarker, LastZone = false, nil
local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local isDead = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


function OpenVaultMenu()
  
	  local elements = {
		{label = _U('get_weapon'), value = 'get_weapon'},
		{label = _U('put_weapon'), value = 'put_weapon'},
	--	{label = _U('get_object'), value = 'get_stock'},
	--	{label = _U('put_object'), value = 'put_stock'}
	  }
	  
  
	  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vault',
		{
		  title    = _U('vault'),
		  align    = 'bottom-right',
		  elements = elements,
		},
		function(data, menu)
  
		  if data.current.value == 'get_weapon' then
			OpenGetWeaponMenu()
		  end
  
		  if data.current.value == 'put_weapon' then
			OpenPutWeaponMenu()
		  end
		end,
		
		function(data, menu)
  
		  menu.close()
  
		  CurrentAction     = 'mechanic_vault_menu'
		  CurrentActionMsg  = _U('open_vault')
		  CurrentActionData = {}
		end
	  )
  
	
  
end

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('esx_badulaque:getVaultWeapons', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].count > 0 then
		  table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
		end
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vault_get_weapon',
		{
		  title    = _U('get_weapon_menu'),
		  align    = 'bottom-right',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('esx_badulaque:removeVaultWeapon', function()
			OpenGetWeaponMenu()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
end
  
function OpenPutWeaponMenu()
  
	local elements   = {}
	local playerPed  = GetPlayerPed(-1)
	local weaponList = ESX.GetWeaponList()
  
	for i=1, #weaponList, 1 do
  
	  local weaponHash = GetHashKey(weaponList[i].name)
  
	  if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
		local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
		table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
	  end
  
	end
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'vault_put_weapon',
	  {
		title    = _U('put_weapon_menu'),
		align    = 'bottom-right',
		elements = elements,
	  },
	  function(data, menu)
  
		menu.close()
  
		ESX.TriggerServerCallback('esx_badulaque:addVaultWeapon', function()
		  OpenPutWeaponMenu()
		end, data.current.value)
  
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  
end


function setUniform(job, playerPed, grade)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Mechanic.Uniforms[grade].male then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Mechanic.Uniforms[grade].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		else
			if Config.Mechanic.Uniforms[grade].female then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Mechanic.Uniforms[grade].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
end

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function OpenCloakRoomMenu()
	local playerPed = PlayerPedId()

	local elements = {
		--{label = _U('vehicle_list'),   value = 'vehicle_list'},
		{label = _U('work_wear'),      value = 'cloakroom'},
		{label = _U('civ_wear'),       value = 'cloakroom2'},
		--{label = _U('deposit_stock'),  value = 'put_stock'},
		--{label = _U('withdraw_stock'), value = 'get_stock'}
	}
	local DataJob = ESX.GetPlayerData()
	local grade = PlayerData.job.grade_name

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mechanic_cloakroom', {  
		title    = _U('mechanic'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'cloakroom2' then
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

		if data.current.value == 'cloakroom' then
			setUniform(data.current.value, playerPed, grade)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'mechanic_cloakroom_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	end)
end

function OpenCloakRoomMenu2()
	local elements = {
		--{label = _U('vehicle_list'),   value = 'vehicle_list'},
		{label = _U('work_wear'),      value = 'cloakroom'},
		{label = _U('civ_wear'),       value = 'cloakroom2'},
		--{label = _U('deposit_stock'),  value = 'put_stock'},
		--{label = _U('withdraw_stock'), value = 'get_stock'}
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mechanic_cloakroom', {  
		title    = _U('mechanic'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
		elseif data.current.value == 'cloakroom2' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'mechanic_cloakroom_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	end)
end

function OpenMechanicActionsMenu()
	local elements = {
		--{label = _U('vehicle_list'),   value = 'vehicle_list'},
	--	{label = _U('work_wear'),      value = 'cloakroom'},
	--	{label = _U('civ_wear'),       value = 'cloakroom2'},
		--{label = _U('deposit_stock'),  value = 'put_stock'},
		--{label = _U('withdraw_stock'), value = 'get_stock'}
	}

	if Config.Mechanic.EnablePlayerManagement and ESX.PlayerData.job and ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mechanic_actions', {
		title    = _U('mechanic'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
--[[		if data.current.value == 'vehicle_list' then
			if Config.Mechanic.EnableSocietyOwnedVehicles then

				local elements = {}

				ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)
					for i=1, #vehicles, 1 do
						table.insert(elements, {
							label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']',
							value = vehicles[i]
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
						title    = _U('service_vehicle'),
						align    = 'bottom-right',
						elements = elements
					}, function(data, menu)
						menu.close()
						local vehicleProps = data.current.value

						ESX.Game.SpawnVehicle(vehicleProps.model, Config.Mechanic.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
							ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
							local playerPed = PlayerPedId()
							TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						end)

						TriggerServerEvent('esx_society:removeVehicleFromGarage', 'mechanic', vehicleProps)
					end, function(data, menu)
						menu.close()
					end)
				end, 'mechanic')

			else

				local elements = {
					{label = _U('flat_bed'),  value = 'flatbed'},
					{label = _U('tow_truck'), value = 'towtruck2'}
				}

				if Config.Mechanic.EnablePlayerManagement and ESX.PlayerData.job and (ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'chief' or ESX.PlayerData.job.grade_name == 'experimente') then
					table.insert(elements, {label = 'SlamVan', value = 'slamvan3'})
				end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_vehicle', {
					title    = _U('service_vehicle'),
					align    = 'bottom-right',
					elements = elements
				}, function(data, menu)
					if Config.Mechanic.MaxInService == -1 then
						ESX.Game.SpawnVehicle(data.current.value, Config.Mechanic.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
							local playerPed = PlayerPedId()
							TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
						end)
					else
						ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
							if canTakeService then
								ESX.Game.SpawnVehicle(data.current.value, Config.Mechanic.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
									local playerPed = PlayerPedId()
									TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
								end)
							else
								ESX.ShowNotification(_U('service_full') .. inServiceCount .. '/' .. maxInService)
							end
						end, 'mechanic')
					end

					menu.close()
				end, function(data, menu)
					menu.close()
					OpenMechanicActionsMenu()
				end)

			end
		elseif data.current.value == 'cloakroom' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
		elseif data.current.value == 'cloakroom2' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()]]--
		if data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'mechanic', function(data, menu)
				menu.close()
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'mechanic_actions_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	end)
end

function OpenTaquillaItems()
	local elements = {
		--{label = _U('vehicle_list'),   value = 'vehicle_list'},
	--	{label = _U('work_wear'),      value = 'cloakroom'},
	--	{label = _U('civ_wear'),       value = 'cloakroom2'},
		{label = _U('deposit_stock'),  value = 'put_stock'},
		{label = _U('withdraw_stock'), value = 'get_stock'}
	}



	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mechanic_taquilla', {
		title    = _U('mechanic'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		--[[
		if data.current.value == 'vehicle_list' then
			if Config.Mechanic.EnableSocietyOwnedVehicles then

				local elements = {}

				ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)
					for i=1, #vehicles, 1 do
						table.insert(elements, {
							label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']',
							value = vehicles[i]
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
						title    = _U('service_vehicle'),
						align    = 'bottom-right',
						elements = elements
					}, function(data, menu)
						menu.close()
						local vehicleProps = data.current.value

						ESX.Game.SpawnVehicle(vehicleProps.model, Config.Mechanic.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
							ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
							local playerPed = PlayerPedId()
							TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
						end)

						TriggerServerEvent('esx_society:removeVehicleFromGarage', 'mechanic', vehicleProps)
					end, function(data, menu)
						menu.close()
					end)
				end, 'mechanic')

			else

				local elements = {
					{label = _U('flat_bed'),  value = 'flatbed3'},
					{label = _U('tow_truck'), value = 'towtruck2'}
				}

				if Config.Mechanic.EnablePlayerManagement and ESX.PlayerData.job and (ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'chief' or ESX.PlayerData.job.grade_name == 'experimente') then
					table.insert(elements, {label = 'SlamVan', value = 'slamvan3'})
				end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_vehicle', {
					title    = _U('service_vehicle'),
					align    = 'bottom-right',
					elements = elements
				}, function(data, menu)
					if Config.Mechanic.MaxInService == -1 then
						ESX.Game.SpawnVehicle(data.current.value, Config.Mechanic.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
							local playerPed = PlayerPedId()
							TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
						end)
					else
						ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
							if canTakeService then
								ESX.Game.SpawnVehicle(data.current.value, Config.Mechanic.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
									local playerPed = PlayerPedId()
									TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
								end)
							else
								ESX.ShowNotification(_U('service_full') .. inServiceCount .. '/' .. maxInService)
							end
						end, 'mechanic')
					end

					menu.close()
				end, function(data, menu)
					menu.close()
					OpenTaquillaItems()
				end)

			end
		elseif data.current.value == 'cloakroom' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
		elseif data.current.value == 'cloakroom2' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)]]--
		if data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		--elseif data.current.value == 'boss_actions' then
		--	TriggerEvent('esx_society:openBossMenu', 'mechanic', function(data, menu)
		--		menu.close()
		--	end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'mechanic_taquilla_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	end)
end

function OpenMechanicHarvestMenu()
	if Config.Mechanic.EnablePlayerManagement and ESX.PlayerData.job and ESX.PlayerData.job.grade_name ~= 'recrue' then
		local elements = {
			{label = _U('gas_can'), value = 'gaz_bottle'},
			{label = _U('repair_tools'), value = 'fix_tool'},
			{label = _U('body_work_tools'), value = 'caro_tool'}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mechanic_harvest', {
			title    = _U('harvest'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			--if data.current.value == 'gaz_bottle' then
				--TriggerServerEvent('esx_mechanicjob:startHarvest')
			if data.current.value == 'fix_tool' then
				TriggerServerEvent('esx_mechanicjob:startHarvest2')
			--elseif data.current.value == 'caro_tool' then
			--	TriggerServerEvent('esx_mechanicjob:startHarvest3')
			end
		end, function(data, menu)
			menu.close()
			CurrentAction     = 'mechanic_harvest_menu'
			CurrentActionMsg  = _U('harvest_menu')
			CurrentActionData = {}
		end)
	else
		ESX.ShowNotification(_U('not_experienced_enough'))
	end
end

function OpenMechanicCraftMenu()
	if Config.Mechanic.EnablePlayerManagement and ESX.PlayerData.job and ESX.PlayerData.job.grade_name ~= 'recrue' then
		local elements = {
			--{label = _U('blowtorch'),  value = 'blow_pipe'},
			{label = _U('repair_kit'), value = 'fix_kit'},
			--{label = _U('body_kit'),   value = 'caro_kit'}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mechanic_craft', {
			title    = _U('craft'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			--if data.current.value == 'blow_pipe' then
				--TriggerServerEvent('esx_mechanicjob:startCraft')
			if data.current.value == 'fix_kit' then
				TriggerServerEvent('esx_mechanicjob:startCraft2')
			--elseif data.current.value == 'caro_kit' then
				--TriggerServerEvent('esx_mechanicjob:startCraft3')
			end
		end, function(data, menu)
			menu.close()

			CurrentAction     = 'mechanic_craft_menu'
			CurrentActionMsg  = _U('craft_menu')
			CurrentActionData = {}
		end)
	else
		ESX.ShowNotification(_U('not_experienced_enough'))
	end
end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_mechanicjob:getStockItems', function(items)
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
			title    = _U('mechanic_stock'),
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_mechanicjob:getStockItem', itemName, count)

					Citizen.Wait(1000)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, GetSociety())
end

function GetSociety()

	local DataJob = ESX.GetPlayerData()
	local sct = ''

	if DataJob.job.name == 'mechanic' then
		sct = 'society_mechanic'
	elseif DataJob.job.name == 'mechanic2' then
		sct = 'society_mechanic2'
	elseif DataJob.job.name == 'mechanic3' then
		sct = 'society_mechanic3'
	elseif DataJob.job.name == 'mechanic4' then
		sct = 'society_mechanic4'
	elseif DataJob.job.name == 'mechanic5' then
		sct = 'society_mechanic5'
	elseif DataJob.job.name == 'mechanic6' then
		sct = 'society_mechanic6'
	end
	
	return sct 
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_mechanicjob:getPlayerInventory', function(inventory)
		local elements = {}

		
		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.count .. ' - ' .. item.label,
					type  = 'item_standard',
					value = item.name,
					haveImage = true
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = 'bottom-right',
			elements = elements,
			enableImages = true
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_mechanicjob:putStockItems', itemName, count, GetSociety())

					Citizen.Wait(1000)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end


RegisterNetEvent('esx_mechanicjob:onCarokit')
AddEventHandler('esx_mechanicjob:onCarokit', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_HAMMERING', 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(10000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification(_U('body_repaired'))
			end)
		end
	end
end)

RegisterNetEvent('esx_mechanicjob:onFixkit')
AddEventHandler('esx_mechanicjob:onFixkit', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(20000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				SetVehicleUndriveable(vehicle, false)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification(_U('veh_repaired'))
			end)
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('esx_mechanicjob:hasEnteredMarker', function(zone)
--	if zone == 'NPCJobTargetTowable' then

	if zone == 'MechanicCloakroom' then
		CurrentAction     = 'mechanic_cloakroom_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicCloakroom2' then
		CurrentAction     = 'mechanic_cloakroom_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicCloakroom3' then
		CurrentAction     = 'mechanic_cloakroom_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicCloakroom4' then
		CurrentAction     = 'mechanic_cloakroom_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicCloakroom5' then
		CurrentAction     = 'mechanic_cloakroom_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicCloakroom6' then
		CurrentAction     = 'mechanic_cloakroom_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicVault' then
		CurrentAction     = 'mechanic_vault_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
--	elseif zone =='VehicleDelivery' then
--		NPCTargetDeleterZone = true
	elseif zone == 'MechanicTaquilla' then
		CurrentAction     = 'mechanic_taquilla_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicTaquilla2' then
		CurrentAction     = 'mechanic_taquilla_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicTaquilla3' then
		CurrentAction     = 'mechanic_taquilla_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicTaquilla4' then
		CurrentAction     = 'mechanic_taquilla_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicTaquilla5' then
		CurrentAction     = 'mechanic_taquilla_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicTaquilla6' then
		CurrentAction     = 'mechanic_taquilla_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'MechanicActions' then
		CurrentAction     = 'mechanic_actions_menu'
		CurrentActionMsg  = _U('open_actions')
		CurrentActionData = {}
	elseif zone == 'Garage' then
		CurrentAction     = 'mechanic_harvest_menu'
		CurrentActionMsg  = _U('harvest_menu')
		CurrentActionData = {}
	elseif zone == 'Craft' then
		CurrentAction     = 'mechanic_craft_menu'
		CurrentActionMsg  = _U('craft_menu')
		CurrentActionData = {}
	elseif zone == 'VehicleDeleter' then
		local playerPed = PlayerPedId()

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed,  false)

			CurrentAction     = 'delete_vehicle'
			CurrentActionMsg  = _U('veh_stored')
			CurrentActionData = {vehicle = vehicle}
		end
	end
end)

AddEventHandler('esx_mechanicjob:hasExitedMarker', function(zone)
--	if zone =='VehicleDelivery' then
--		NPCTargetDeleterZone = false
--	elseif zone == 'Craft' then
--		TriggerServerEvent('esx_mechanicjob:stopCraft')
--		TriggerServerEvent('esx_mechanicjob:stopCraft2')
--		TriggerServerEvent('esx_mechanicjob:stopCraft3')
--	elseif zone == 'Garage' then
--		TriggerServerEvent('esx_mechanicjob:stopHarvest')
--		TriggerServerEvent('esx_mechanicjob:stopHarvest2')
--		TriggerServerEvent('esx_mechanicjob:stopHarvest3')
--	end

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)


--RegisterNetEvent('esx_phone:loaded')
--AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
--	local specialContact = {
--		name       = _U('mechanic'),
--		number     = 'mechanic',
--		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEwAACxMBAJqcGAAAA4BJREFUWIXtll9oU3cUx7/nJA02aSSlFouWMnXVB0ejU3wcRteHjv1puoc9rA978cUi2IqgRYWIZkMwrahUGfgkFMEZUdg6C+u21z1o3fbgqigVi7NzUtNcmsac40Npltz7S3rvUHzxQODec87vfD+/e0/O/QFv7Q0beV3QeXqmgV74/7H7fZJvuLwv8q/Xeux1gUrNBpN/nmtavdaqDqBK8VT2RDyV2VHmF1lvLERSBtCVynzYmcp+A9WqT9kcVKX4gHUehF0CEVY+1jYTTIwvt7YSIQnCTvsSUYz6gX5uDt7MP7KOKuQAgxmqQ+neUA+I1B1AiXi5X6ZAvKrabirmVYFwAMRT2RMg7F9SyKspvk73hfrtbkMPyIhA5FVqi0iBiEZMMQdAui/8E4GPv0oAJkpc6Q3+6goAAGpWBxNQmTLFmgL3jSJNgQdGv4pMts2EKm7ICJB/aG0xNdz74VEk13UYCx1/twPR8JjDT8wttyLZtkoAxSb8ZDCz0gdfKxWkFURf2v9qTYH7SK7rQIDn0P3nA0ehixvfwZwE0X9vBE/mW8piohhl1WH18UQBhYnre8N/L8b8xQvlx4ACbB4NnzaeRYDnKm0EALCMLXy84hwuTCXL/ExoB1E7qcK/8NCLIq5HcTT0i6u8TYbXUM1cAyyveVq8Xls7XhYrvY/4n3gC8C+dsmAzL1YUiyfWxvHzsy/w/dNd+KjhW2yvv/RfXr7x9QDcmo1he2RBiCCI1Q8jVj9szPNixVfgz+UiIGyDSrcoRu2J16d3I6e1VYvNSQjXpnucAcEPUOkGYZs/l4uUhowt/3kqu1UIv9n90fAY9jT3YBlbRvFTD4fw++wHjhiTRL/bG75t0jI2ITcHb5om4Xgmhv57xpGOg3d/NIqryOR7z+r+MC6qBJB/ZB2t9Om1D5lFm843G/3E3HI7Yh1xDRAfzLQr5EClBf/HBHK462TG2J0OABXeyWDPZ8VqxmBWYscpyghwtTd4EKpDTjCZdCNmzFM9k+4LHXIFACJN94Z6FiFEpKDQw9HndWsEuhnADVMhAUaYJBp9XrcGQKJ4qFE9k+6r2+MG3k5N8VQ22TVglbX2ZwOzX2VvNKr91zmY6S7N6zqZicVT2WNLyVSehESaBhxnOALfMeYX+K/S2yv7wmMAlvwyuR7FxQUyf0fgc/jztfkJr7XeGgC8BJJgWNV8ImT+AAAAAElFTkSuQmCC'
--	}

--	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
--end)


-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'mechanic2' or ESX.PlayerData.job.name == 'mechanic3' or ESX.PlayerData.job.name == 'mechanic4' or ESX.PlayerData.job.name == 'mechanic5' or ESX.PlayerData.job.name == 'mechanic6') then
			local coords, letSleep = GetEntityCoords(PlayerPedId()), true

			for k,v in pairs(Config.Mechanic.Zones) do
				if v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.Mechanic.DrawDistance then
				--	DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, nil, nil, false)
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, 0, 0, 0, 100, false, true, 2, false, nil, nil, false)
					letSleep = false
				end
			end

			if letSleep then
				Citizen.Wait(2000)
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'mechanic2' or ESX.PlayerData.job.name == 'mechanic3' or ESX.PlayerData.job.name == 'mechanic4' or ESX.PlayerData.job.name == 'mechanic5' or ESX.PlayerData.job.name == 'mechanic6') then

			local coords      = GetEntityCoords(PlayerPedId())
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Mechanic.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.5) then
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_mechanicjob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_mechanicjob:hasExitedMarker', LastZone)
			end
		else
			Wait(2000)
		end
	end
end)

--[[Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_roadcone02a',
		'prop_toolchest_01'
	}

	while true do
		Citizen.Wait(500)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(coords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords, objCoords, true)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_mechanicjob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('esx_mechanicjob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
	end
end)]]--

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			ESX.ShowFloatingHelpNotification(CurrentActionMsg, vector3(playerX, playerY, playerZ + 1))

			if IsControlJustReleased(0, 38) and (ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'mechanic2' or ESX.PlayerData.job.name == 'mechanic3' or ESX.PlayerData.job.name == 'mechanic4' or ESX.PlayerData.job.name == 'mechanic5' or ESX.PlayerData.job.name == 'mechanic6') then

				if CurrentAction == 'mechanic_actions_menu' then
					OpenMechanicActionsMenu()
				--elseif CurrentAction == 'mechanic_harvest_menu' then
				--	OpenMechanicHarvestMenu()
				--elseif CurrentAction == 'mechanic_craft_menu' then
				--	OpenMechanicCraftMenu()
				elseif CurrentAction == 'mechanic_cloakroom_menu' then
					OpenCloakRoomMenu()
				elseif CurrentAction == 'mechanic_vault_menu' then
					OpenVaultMenu()
				elseif CurrentAction == 'mechanic_taquilla_menu' then
					OpenTaquillaItems()
				elseif CurrentAction == 'delete_vehicle' then

					--if Config.Mechanic.EnableSocietyOwnedVehicles then

					--	local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
					--	TriggerServerEvent('esx_society:putVehicleInGarage', 'mechanic', vehicleProps)

				--	else

				--		if
				--			GetEntityModel(vehicle) == GetHashKey('flatbed3')   or
				--			GetEntityModel(vehicle) == GetHashKey('towtruck2') or
				--			GetEntityModel(vehicle) == GetHashKey('slamvan3')
				--		then
				--			TriggerServerEvent('esx_service:disableService', 'mechanic')
				--		end

				--	end
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end

				CurrentAction = nil
			end
		else
			Wait(2000)
		end
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)
