--------------------------------
------- Created by Hamza -------
-------------------------------- 

ESX = nil

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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)





local insideMarker = false

-- Core Thread Function:
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
		local pedInVeh = IsPedInAnyVehicle(PlayerPedId(), true)
		local sleep = true

		if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'mechanic' or ESX.PlayerData.job.name == 'mechanic2' or ESX.PlayerData.job.name == 'mechanic3' or ESX.PlayerData.job.name == 'mechanic4' or ESX.PlayerData.job.name == 'mechanic5' or ESX.PlayerData.job.name == 'mechanic6') then
			for k,v in pairs(Config.MECAGar.CarZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						sleep = false
						DrawMarker(Config.MECAGar.PoliceCarMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.97, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MECAGar.PoliceCarMarkerScale.x, Config.MECAGar.PoliceCarMarkerScale.y, Config.MECAGar.PoliceCarMarkerScale.y, Config.MECAGar.PoliceCarMarkerColor.r,Config.MECAGar.PoliceCarMarkerColor.g,Config.MECAGar.PoliceCarMarkerColor.b,Config.MECAGar.PoliceCarMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 1.5 ) and insideMarker == false then
						sleep = false
						ESX.ShowFloatingHelpNotification(Config.MECAGar.CarDraw3DText, vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z+0.8))
						if IsControlJustPressed(0, Config.MECAGar.KeyToOpenCarGarage) then
							VehicleMenuMeca('car')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end

			for k,v in pairs(Config.MECAGar.HeliZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						sleep = false
						DrawMarker(Config.MECAGar.PoliceHeliMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.95, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MECAGar.PoliceHeliMarkerScale.x, Config.MECAGar.PoliceHeliMarkerScale.y, Config.MECAGar.PoliceHeliMarkerScale.z, Config.MECAGar.PoliceHeliMarkerColor.r,Config.MECAGar.PoliceHeliMarkerColor.g,Config.MECAGar.PoliceHeliMarkerColor.b,Config.MECAGar.PoliceHeliMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 3.0 ) and insideMarker == false then
						sleep = false
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.MECAGar.HeliDraw3DText)
						if IsControlJustPressed(0, Config.MECAGar.KeyToOpenHeliGarage) then
							VehicleMenuMeca('helicopter')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end
			
			for k,v in pairs(Config.MECAGar.DeleteZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false and pedInVeh then
						sleep = false
						DrawMarker(Config.MECAGar.PoliceDeleteMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MECAGar.PoliceDeleteMarkerScale.x, Config.MECAGar.PoliceDeleteMarkerScale.y, Config.MECAGar.PoliceDeleteMarkerScale.z, Config.MECAGar.PoliceDeleteMarkerColor.r,Config.MECAGar.PoliceDeleteMarkerColor.g,Config.MECAGar.PoliceDeleteMarkerColor.b,Config.MECAGar.PoliceDeleteMarkerColor.a, false, true, 2, true, false, false, false)						
					end
				end
			end

			for k,v in pairs(Config.MECAGar.ExtraZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					
					if (distance < 10.0) and insideMarker == false and pedInVeh then
						sleep = false
						DrawMarker(Config.MECAGar.PoliceExtraMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.97, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MECAGar.PoliceExtraMarkerScale.x, Config.MECAGar.PoliceExtraMarkerScale.y, Config.MECAGar.PoliceExtraMarkerScale.z, Config.MECAGar.PoliceExtraMarkerColor.r,Config.MECAGar.PoliceExtraMarkerColor.g,Config.MECAGar.PoliceExtraMarkerColor.b,Config.MECAGar.PoliceExtraMarkerColor.a, false, true, 2, true, false, false, false)
					end
					if (distance < 2.5 ) and insideMarker == false and pedInVeh then
						sleep = false
					--	DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.MECAGar.ExtraDraw3DText)
						ESX.ShowFloatingHelpNotification(Config.MECAGar.ExtraDraw3DText, vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z+0.8))
						if IsControlJustPressed(0, Config.MECAGar.KeyToOpenExtraGarage) and GetVehicleClass(veh) == 18 then
							OpenMainMenu()
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end
		end
		if sleep then
			Citizen.Wait(2000)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(4)
		local coords = GetEntityCoords(PlayerPedId())
		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
		local pedInVeh = IsPedInAnyVehicle(PlayerPedId(), true)
		local sleep = true
		for k,v in pairs(Config.MECAGar.DeleteZones) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				if distance < 3.0 and pedInVeh then
					sleep = false
					ESX.ShowFloatingHelpNotification(Config.MECAGar.DeleteDraw3DText, vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z+0.8))
					if IsControlJustPressed(0, 38) then
						DeleteVehicleMeca()
						Citizen.Wait(500)
					end
				end
			end
		end

		if sleep then
			Citizen.Wait(2000)
		end
	end
end)

-- Police Garage Menu:
PoliceGarageMeca = function(type)
	local elements = {
		{ label = Config.MECAGar.LabelStoreVeh, action = "store_vehicle" },
		{ label = Config.MECAGar.LabelGetVeh, action = "get_vehicle" },
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_PoliceGarageMeca_menu",
		{
			title    = Config.MECAGar.TitlePoliceGarage,
			align    = "bottom-right",
			elements = elements
		},
	function(data, menu)
		menu.close()
		local action = data.current.action
		if action == "get_vehicle" then
			if type == 'car' then
				VehicleMenuMeca('car')
			elseif type == 'helicopter' then
				VehicleMenuMeca('helicopter')
			end
		elseif data.current.action == 'store_vehicle' then
			local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
			if dist < 3 then
				DeleteEntity(veh)
				ESX.ShowNotification(Config.MECAGar.VehicleParked)
			else
				ESX.ShowNotification(Config.MECAGar.NoVehicleNearby)
			end
			insideMarker = false
		end
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

DeleteVehicleMeca = function()
	local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
	if dist < 3 then
		DeleteEntity(veh)
		ESX.ShowNotification(Config.MECAGar.VehicleParked)
	else
		ESX.ShowNotification(Config.MECAGar.NoVehicleNearby)
	end
end

-- Vehicle Spawn Menu:
VehicleMenuMeca = function(type)
	local storage = nil
	local elements = {}
	local ped = PlayerPedId()
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(ped)
	local DataJob = ESX.GetPlayerData()
	if type == 'car' then
		for k,v in pairs(Config.MECAGar.PoliceVehicles) do
            if v.job == '' then
			    table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'car'})
            elseif v.job == DataJob.job.name then
                table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'car'})
            end
		end
	elseif type == 'helicopter' then
		for k,v in pairs(Config.MECAGar.PoliceHelicopters) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'helicopter'})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeGarage_vehicle_garage",
		{
			title    = Config.MECAGar.TitlePoliceGarage,
			align    = "bottom-right",
			elements = elements
		},
	function(data, menu)
		menu.close()
		insideMarker = false
		local plate = exports['esx_advancedvehicleshop']:GeneratePlate()
		VehicleLoadTimer(data.current.model)
        local coords = GetEntityCoords(PlayerPedId())
		local veh = CreateVehicle(data.current.model,coords.x,coords.y,coords.z,coords.z,true,false)
		SetPedIntoVehicle(PlayerPedId(),veh,-1)
		SetVehicleNumberPlateText(veh,plate)
		
		if type == 'car' then
			ESX.ShowNotification(Config.MECAGar.CarOutFromPolGar)
		elseif type == 'helicopter' then
			ESX.ShowNotification(Config.MECAGar.HeliOutFromPolGar)
		end
		
		TriggerEvent("fuel:setFuel",veh,100.0)
		SetVehicleDirtLevel(veh, 0.0)		
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

-- Load Timer Function for Vehicle Spawn:
function VehicleLoadTimer(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)

			drawLoadingText(Config.MECAGar.VehicleLoadText, 255, 255, 255, 255)
		end
	end
end

-- Loading Text for Vehicles Function:
function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end



-- Police Extra Menu:
function OpenExtraMenu()
	local elements = {}
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	for id=0, 12 do
		if DoesExtraExist(vehicle, id) then
			local state = IsVehicleExtraTurnedOn(vehicle, id) 

			if state then
				table.insert(elements, {
					label = "Extra: "..id.." | "..('<span style="color:green;">%s</span>'):format("On"),
					value = id,
					state = not state
				})
			else
				table.insert(elements, {
					label = "Extra: "..id.." | "..('<span style="color:red;">%s</span>'):format("Off"),
					value = id,
					state = not state
				})
			end
		end
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'extra_actions', {
		title    = Config.MECAGar.TitlePoliceExtra,
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		SetVehicleExtra(vehicle, data.current.value, not data.current.state)
		local newData = data.current
		if data.current.state then
			newData.label = "Extra: "..data.current.value.." | "..('<span style="color:green;">%s</span>'):format("On")
		else
			newData.label = "Extra: "..data.current.value.." | "..('<span style="color:red;">%s</span>'):format("Off")
		end
		newData.state = not data.current.state

		menu.update({value = data.current.value}, newData)
		menu.refresh()
	end, function(data, menu)
		menu.close()
	end)
end

-- Police Livery Menu:
function OpenLiveryMenu()
	local elements = {}
	
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	local liveryCount = GetVehicleLiveryCount(vehicle)
			
	for i = 1, liveryCount do
		local state = GetVehicleLivery(vehicle) 
		local text
		
		if state == i then
			text = "Livery: "..i.." | "..('<span style="color:green;">%s</span>'):format("On")
		else
			text = "Livery: "..i.." | "..('<span style="color:red;">%s</span>'):format("Off")
		end
		
		table.insert(elements, {
			label = text,
			value = i,
			state = not state
		}) 
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'livery_menu', {
		title    = Config.MECAGar.TitlePoliceLivery,
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		SetVehicleLivery(vehicle, data.current.value, not data.current.state)
		local newData = data.current
		if data.current.state then
			newData.label = "Livery: "..data.current.value.." | "..('<span style="color:green;">%s</span>'):format("On")
		else
			newData.label = "Livery: "..data.current.value.." | "..('<span style="color:red;">%s</span>'):format("Off")
		end
		newData.state = not data.current.state
		menu.update({value = data.current.value}, newData)
		menu.refresh()
		menu.close()	
	end, function(data, menu)
		menu.close()		
	end)
end

-- Police Extra Main Menu:
function OpenMainMenu()
	local elements = {
		{label = Config.MECAGar.LabelExtra,value = 'extra'},
		{label = Config.MECAGar.LabelLivery,value = 'livery'}
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'color_menu', {
		title    = Config.MECAGar.TitlePoliceExtra,
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'extra' then
			OpenExtraMenu()
		elseif data.current.value == 'livery' then
			OpenLiveryMenu()
		end
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end)
end


