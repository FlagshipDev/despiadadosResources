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

		if (ESX.PlayerData.job and ESX.PlayerData.job.name == Config.LSPDGar.PoliceDatabaseName) then
			for k,v in pairs(Config.LSPDGar.CarZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						sleep = false
						DrawMarker(Config.LSPDGar.PoliceCarMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.97, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.LSPDGar.PoliceCarMarkerScale.x, Config.LSPDGar.PoliceCarMarkerScale.y, Config.LSPDGar.PoliceCarMarkerScale.y, Config.LSPDGar.PoliceCarMarkerColor.r,Config.LSPDGar.PoliceCarMarkerColor.g,Config.LSPDGar.PoliceCarMarkerColor.b,Config.LSPDGar.PoliceCarMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 1.5 ) and insideMarker == false then
						sleep = false
						ESX.ShowFloatingHelpNotification(Config.LSPDGar.CarDraw3DText, vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z+0.8))
						if IsControlJustPressed(0, Config.LSPDGar.KeyToOpenCarGarage) then
							VehicleMenu('car')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end

			for k,v in pairs(Config.LSPDGar.HeliZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						sleep = false
						DrawMarker(Config.LSPDGar.PoliceHeliMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.95, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.LSPDGar.PoliceHeliMarkerScale.x, Config.LSPDGar.PoliceHeliMarkerScale.y, Config.LSPDGar.PoliceHeliMarkerScale.z, Config.LSPDGar.PoliceHeliMarkerColor.r,Config.LSPDGar.PoliceHeliMarkerColor.g,Config.LSPDGar.PoliceHeliMarkerColor.b,Config.LSPDGar.PoliceHeliMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 3.0 ) and insideMarker == false then
						sleep = false
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.LSPDGar.HeliDraw3DText)
						if IsControlJustPressed(0, Config.LSPDGar.KeyToOpenHeliGarage) then
							VehicleMenu('helicopter')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end
			
			for k,v in pairs(Config.LSPDGar.DeleteZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false and pedInVeh then
						sleep = false
						DrawMarker(Config.LSPDGar.PoliceDeleteMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.LSPDGar.PoliceDeleteMarkerScale.x, Config.LSPDGar.PoliceDeleteMarkerScale.y, Config.LSPDGar.PoliceDeleteMarkerScale.z, Config.LSPDGar.PoliceDeleteMarkerColor.r,Config.LSPDGar.PoliceDeleteMarkerColor.g,Config.LSPDGar.PoliceDeleteMarkerColor.b,Config.LSPDGar.PoliceDeleteMarkerColor.a, false, true, 2, true, false, false, false)						
					end
				end
			end

			for k,v in pairs(Config.LSPDGar.ExtraZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					
					if (distance < 10.0) and insideMarker == false and pedInVeh then
						sleep = false
						DrawMarker(Config.LSPDGar.PoliceExtraMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.97, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.LSPDGar.PoliceExtraMarkerScale.x, Config.LSPDGar.PoliceExtraMarkerScale.y, Config.LSPDGar.PoliceExtraMarkerScale.z, Config.LSPDGar.PoliceExtraMarkerColor.r,Config.LSPDGar.PoliceExtraMarkerColor.g,Config.LSPDGar.PoliceExtraMarkerColor.b,Config.LSPDGar.PoliceExtraMarkerColor.a, false, true, 2, true, false, false, false)
					end
					if (distance < 2.5 ) and insideMarker == false and pedInVeh then
						sleep = false
					--	DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.LSPDGar.ExtraDraw3DText)
						ESX.ShowFloatingHelpNotification(Config.LSPDGar.ExtraDraw3DText, vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z+0.8))
						if IsControlJustPressed(0, Config.LSPDGar.KeyToOpenExtraGarage) and GetVehicleClass(veh) == 18 then
							OpenMainMenu()
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end
			if sleep then
				Wait(2000)
			end
		else
			Wait(5000)
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

		for k,v in pairs(Config.LSPDGar.DeleteZones) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				if distance < 3.0 and pedInVeh then
					sleep = false
					ESX.ShowFloatingHelpNotification(Config.LSPDGar.DeleteDraw3DText, vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z+0.8))
					if IsControlJustPressed(0, 38) then
						DeleteVehicle()
						Citizen.Wait(500)
					end
				end
			end
		end

		if sleep then
			Wait(2000)
		end
	end
end)

-- Police Garage Menu:
PoliceGarage = function(type)
	local elements = {
		{ label = Config.LSPDGar.LabelStoreVeh, action = "store_vehicle" },
		{ label = Config.LSPDGar.LabelGetVeh, action = "get_vehicle" },
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeGarage_menu",
		{
			title    = Config.LSPDGar.TitlePoliceGarage,
			align    = "bottom-right",
			elements = elements
		},
	function(data, menu)
		menu.close()
		local action = data.current.action
		if action == "get_vehicle" then
			if type == 'car' then
				VehicleMenu('car')
			elseif type == 'helicopter' then
				VehicleMenu('helicopter')
			end
		elseif data.current.action == 'store_vehicle' then
			local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
			if dist < 3 then
				DeleteEntity(veh)
				ESX.ShowNotification(Config.LSPDGar.VehicleParked)
			else
				ESX.ShowNotification(Config.LSPDGar.NoVehicleNearby)
			end
			insideMarker = false
		end
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

DeleteVehicle = function()
	local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
	if dist < 3 then
		DeleteEntity(veh)
		ESX.ShowNotification(Config.LSPDGar.VehicleParked)
	else
		ESX.ShowNotification(Config.LSPDGar.NoVehicleNearby)
	end
end

-- Vehicle Spawn Menu:
VehicleMenu = function(type)
	local storage = nil
	local elements = {}
	local ped = PlayerPedId()
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(ped)
	
	if type == 'car' then
		for k,v in pairs(Config.LSPDGar.PoliceVehicles) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'car'})
		end
	elseif type == 'helicopter' then
		for k,v in pairs(Config.LSPDGar.PoliceHelicopters) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'helicopter'})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeGarage_vehicle_garage",
		{
			title    = Config.LSPDGar.TitlePoliceGarage,
			align    = "bottom-right",
			elements = elements
		},
	function(data, menu)
		menu.close()
		insideMarker = false
		local plate = exports['esx_advancedvehicleshop']:GeneratePlate()
		VehicleLoadTimer(data.current.model)
		local veh = CreateVehicle(data.current.model,446.95,-1019.11,28.57,92.58,true,false)
		SetPedIntoVehicle(PlayerPedId(),veh,-1)
		SetVehicleNumberPlateText(veh,plate)
		
		if type == 'car' then
			ESX.ShowNotification(Config.LSPDGar.CarOutFromPolGar)
		elseif type == 'helicopter' then
			ESX.ShowNotification(Config.LSPDGar.HeliOutFromPolGar)
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

			drawLoadingText(Config.LSPDGar.VehicleLoadText, 255, 255, 255, 255)
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
		title    = Config.LSPDGar.TitlePoliceExtra,
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
		title    = Config.LSPDGar.TitlePoliceLivery,
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
		{label = Config.LSPDGar.LabelExtra,value = 'extra'},
		{label = Config.LSPDGar.LabelLivery,value = 'livery'}
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'color_menu', {
		title    = Config.LSPDGar.TitlePoliceExtra,
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


