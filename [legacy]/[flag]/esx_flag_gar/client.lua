-- Local
local Keys = {
	["ESC"] = 322,
	["F1"] = 288,
	["F2"] = 289,
	["F3"] = 170,
	["F5"] = 166,
	["F6"] = 167,
	["F7"] = 168,
	["F8"] = 169,
	["F9"] = 56,
	["F10"] = 57,
	["~"] = 243,
	["1"] = 157,
	["2"] = 158,
	["3"] = 160,
	["4"] = 164,
	["5"] = 165,
	["6"] = 159,
	["7"] = 161,
	["8"] = 162,
	["9"] = 163,
	["-"] = 84,
	["="] = 83,
	["BACKSPACE"] = 177,
	["TAB"] = 37,
	["Q"] = 44,
	["W"] = 32,
	["E"] = 38,
	["R"] = 45,
	["T"] = 245,
	["Y"] = 246,
	["U"] = 303,
	["P"] = 199,
	["["] = 39,
	["]"] = 40,
	["ENTER"] = 18,
	["CAPS"] = 137,
	["A"] = 34,
	["S"] = 8,
	["D"] = 9,
	["F"] = 23,
	["G"] = 47,
	["H"] = 74,
	["K"] = 311,
	["L"] = 182,
	["LEFTSHIFT"] = 21,
	["Z"] = 20,
	["X"] = 73,
	["C"] = 26,
	["V"] = 0,
	["B"] = 29,
	["N"] = 249,
	["M"] = 244,
	[","] = 82,
	["."] = 81,
	["LEFTCTRL"] = 36,
	["LEFTALT"] = 19,
	["SPACE"] = 22,
	["RIGHTCTRL"] = 70,
	["HOME"] = 213,
	["PAGEUP"] = 10,
	["PAGEDOWN"] = 11,
	["DELETE"] = 178,
	["LEFT"] = 174,
	["RIGHT"] = 175,
	["TOP"] = 27,
	["DOWN"] = 173,
	["NENTER"] = 201,
	["N4"] = 108,
	["N5"] = 60,
	["N6"] = 107,
	["N+"] = 96,
	["N-"] = 97,
	["N7"] = 117,
	["N8"] = 61,
	["N9"] = 118
}

local CurrentAction = nil
local GUI = {}
GUI.Time = 0
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentActionMsg = ""
local CurrentActionMsgCoords = nil
local CurrentActionData = {}
local times = 0

local this_Garage = {}
cachedData = {}

trowtrukspawnpoint = nil
-- Fin Local

-- Init ESX
ESX = nil

Citizen.CreateThread(
	function()
		while ESX == nil do
			TriggerEvent(
				"esx:getSharedObject",
				function(obj)
					ESX = obj
				end
			)
			Citizen.Wait(0)
		end
	--	LoadCarNames()
		refreshBlips()
	end
)
-- Fin init ESX
function LoadCarNames()
	ESX.TriggerServerCallback(
		"esx_flag_garage:loadCarNames",
		function(carNames)
			print("[^4FlagGarage] Loading car names")
			Citizen.CreateThread(
				function()
					for k, v in pairs(carNames) do
						--print(k .." " .. v)
						AddTextEntry(string.sub(k, 1, 11), v)
						Citizen.Wait(1)
					end
					print("[^4FlagGarage] Car names loaded")
				end
			)
		end
	)
end

--- Gestion Des blips
RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
	"esx:playerLoaded",
	function(xPlayer)
		--PlayerData = xPlayer
		--TriggerServerEvent('esx_jobs:giveBackCautionInCaseOfDrop')
		refreshBlips()
	end
)
local blipsLoaded = false
function refreshBlips()
	if(blipsLoaded == false)then
		blipsLoaded = true
		for garage, garageData in pairs(Config.Garages) do
			local garageBlip = AddBlipForCoord(garageData["positions"]["menu"]["position"])

			SetBlipSprite(garageBlip, 50)
			SetBlipDisplay(garageBlip, 4)
			SetBlipScale(garageBlip, 0.7)
			SetBlipColour(garageBlip, 38)
			SetBlipAsShortRange(garageBlip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Garaje: " .. garage)
			EndTextCommandSetBlipName(garageBlip)
		end
	end
end
-- Fin Gestion des Blips

--Fonction Menu
AddEventHandler(
	"esx_flag_garage:OpenGarageMenu",
	function(PointType)
		OpenMenuGarage(PointType)
	end
)
function OpenMenuGarage(PointType)
	ESX.UI.Menu.CloseAll()

	local elements = {}
	if PointType == "menu" then
		table.insert(elements, {label = "Lista de vehiculo", value = "list_vehicles"})
		table.insert(elements, {label = "Recuperar por $100", value = "return_vehicle"})
	end
	if PointType == "spawn" then
		table.insert(elements, {label = "Lista de vehiculo", value = "list_vehicles"})
	end

	if PointType == "delete" then
		table.insert(elements, {label = "Aparcar vehiculo", value = "stock_vehicle"})
	end

	if PointType == "pound" then
		table.insert(elements, {label = "Recuperar por $100", value = "return_vehicle"})
	end

	ESX.UI.Menu.Open(
		"default",
		GetCurrentResourceName(),
		"garage_menu",
		{
			title = "Garaje",
			align = "bottom-right",
			elements = elements
		},
		function(data, menu)
			if (data.current.value == "list_vehicles") then
				ListVehiclesMenu()
			elseif (data.current.value == "stock_vehicle") then
				StockVehicleMenu()
			elseif (data.current.value == "return_vehicle") then
				ReturnVehicleMenu()
			else
				menu.close()
			end

			local playerPed = PlayerPedId()
			--SpawnVehicle(data.current.value)
		end,
		function(data, menu)
			menu.close()
		end
	)
end

-- Afficher les listes des vehicules
function ListVehiclesMenu()
	local elements = {}
	HandleCamera(this_Garage, true)
	ESX.TriggerServerCallback(
		"esx_flag_garage:getVehicles",
		function(vehicles)
			local firstVehicle = nil
			for _, v in pairs(vehicles) do
				if (v.type == "boat" or v.type == "helicopter") then
				else
					local hashVehicule = v.vehicle.model
					local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
					local vehicleNameText = GetLabelText(vehicleName)
					local labelvehicle = nil
					local plate = v.plate
					if (vehicleNameText == "NULL") then
						vehicleNameText = vehicleName
					end
					if (v.state) then
						if (v.garage ~= nil) then
							if (this_Garage ~= nil and this_Garage == v.garage) then
								labelvehicle = vehicleNameText .. " (" .. plate .. "): " .. v.garage
							end
						else
							labelvehicle = vehicleNameText .. " (" .. plate .. "): Garaje"
						end
					else
						labelvehicle = nil
						labelvehicle = vehicleNameText .. " (" .. plate .. "): En la calle"
					end
					if (labelvehicle ~= nil) then
						if(firstVehicle == nil)then
							firstVehicle = v
						end
						table.insert(elements, {label = labelvehicle, value = v.plate})
					end
				end
			end
			local c = 0
			for _, a in pairs(vehicles) do
				if (a.state) then
					c = c + 1
				else
					c = c - 1
				end
			end
			if(firstVehicle ~= nil)then
				SpawnLocalVehicle(firstVehicle.vehicle)
			end
			ESX.UI.Menu.Open(
				"default",
				GetCurrentResourceName(),
				"spawn_vehicle",
				{
					title = "Garaje",
					align = "bottom-right",
					elements = elements
				},
				function(data, menu)
					local selectedVehicle = nil
					for _, v in pairs(vehicles) do
						if (v.plate == data.current.value) then
							selectedVehicle = v
							break
						end
					end
					if (selectedVehicle and selectedVehicle.state) then
						menu.close()
						HandleCamera(this_Garage, false)
						SpawnVehicle(selectedVehicle.vehicle, selectedVehicle.plate)
						ESX.UI.Menu.CloseAll()
					else
						TriggerEvent("esx:showNotification", "Tu vehiculo está en la calle")
					end
				end,
				function(data, menu)
					menu.close()
					HandleCamera(this_Garage, false)
					--CurrentAction = 'open_garage_action'
				end,
				function(data, menu)
					local selectedVehicle = nil
					for _, v in pairs(vehicles) do
						if (v.plate == data.current.value) then
							selectedVehicle = v
							break
						end
					end
					if (selectedVehicle and selectedVehicle.state) then
						SpawnLocalVehicle(selectedVehicle.vehicle)
					else
						TriggerEvent("esx:showNotification", "Tu vehiculo esta en la calle")
					end
				end
			)
		end,
		this_Garage["key"]
	)
end
-- Fin Afficher les listes des vehicules
function reparation(prix, vehicle, vehicleProps)
	ESX.UI.Menu.CloseAll()

	local elements = {
		{label = "Dejar el vehiculo ($" .. prix .. ")", value = "yes"},
		{label = "Espera al mecanico", value = "no"}
	}
	ESX.UI.Menu.Open(
		"default",
		GetCurrentResourceName(),
		"delete_menu",
		{
			title = "Vehiculo estropeado",
			align = "bottom-right",
			elements = elements
		},
		function(data, menu)
			menu.close()
			if (data.current.value == "yes") then
				TriggerServerEvent("esx_flag_garage:payhealth", prix)
				ranger(vehicle, vehicleProps)
			end
			if (data.current.value == "no") then
				ESX.ShowNotification("Espera al mecanico")
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function ranger(vehicle, vehicleProps)
	ESX.Game.DeleteVehicle(vehicle)
	--print(json.encode(this_Garage))
	TriggerServerEvent("esx_flag_garage:modifystate", vehicleProps.plate, true, this_Garage)
	TriggerEvent("esx:showNotification", "Tu vehiculo esta en el garaje")
end

-- Fonction qui permet de rentrer un vehicule
function StockVehicleMenu()
	local playerPed = PlayerPedId()
	if IsPedInAnyVehicle(playerPed, false) then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
		local current = GetPlayersLastVehicle(PlayerPedId(), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate

		ESX.TriggerServerCallback(
			"esx_flag_garage:stockv",
			function(valid)
				if (valid) then
					--[[	if engineHealth < 500 then
				--local fraisRep= math.floor((1000 - engineHealth)*3)
					reparation(750,vehicle,vehicleProps)
				else
					ranger(vehicle,vehicleProps)
				end
			]]
					TriggerServerEvent("esx_flag_garage:debug", vehicle)
					TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
					Citizen.Wait(2000)
					ranger(vehicle, vehicleProps)
				 --
				else
					TriggerEvent("esx:showNotification", "No es posible aparcar el vehiculo")
				end
			end,
			vehicleProps,
			this_Garage["key"]
		)
	else
		TriggerEvent("esx:showNotification", "No hay ningun vehiculo aparcado")
	end
end
-- Fin fonction qui permet de rentrer un vehicule
--Fin fonction Menu

--Fonction pour spawn vehicule
function SpawnVehicle(vehicle, plate)
	ESX.Game.SpawnVehicle(
		vehicle.model,
		{
			x = Config.Garages[this_Garage]['positions']['vehicle']['position'].x,
			y = Config.Garages[this_Garage]['positions']['vehicle']['position'].y,
			z = Config.Garages[this_Garage]['positions']['vehicle']['position'].z
		},
		Config.Garages[this_Garage]['positions']['vehicle']['heading'],
		function(callback_vehicle)
			ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
			SetVehRadioStation(callback_vehicle, "OFF")
			--TaskWarpPedIntoVehicle(PlayerPedId(), callback_vehicle, -1)
		end
	)

	TriggerServerEvent("esx_flag_garage:modifystate", plate, false, nil)
end

function SpawnLocalVehicle(vehicle)
	local spawnpoint = Config.Garages[this_Garage]["positions"]["vehicle"]

	WaitForModel(vehicle.model)

	if DoesEntityExist(cachedData["vehicle"]) then
		DeleteEntity(cachedData["vehicle"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint["position"], 3.0) then 
		ESX.ShowNotification("Ya hay un vehículo en ese punto.")

		return
	end
	
	if not IsModelValid(vehicle.model) then
		return
	end

	ESX.Game.SpawnLocalVehicle(vehicle.model, spawnpoint["position"], spawnpoint["heading"], function(yourVehicle)
		cachedData["vehicle"] = yourVehicle
		ESX.Game.SetVehicleProperties(yourVehicle, vehicle)
		SetModelAsNoLongerNeeded(vehicle.model)
	end)
end

--Fin fonction pour spawn vehicule

--xx
function SpawnPoundedVehicle(vehicle, plate)
	local playerCoords = GetEntityCoords(PlayerPedId())
	local vehicles = ESX.Game.GetVehicles()
	if #vehicles > 0 then
		for k, v in ipairs(vehicles) do
			local ingameplate = ESX.Math.Trim(GetVehicleNumberPlateText(v))
			if ingameplate == ESX.Math.Trim(plate) then
				-- Make sure the vehicle we're deleting is empty, or else it wont be deleted
				if GetVehicleNumberOfPassengers(v) == 0 and IsVehicleSeatFree(v, -1) then
					ESX.Game.DeleteVehicle(v)
				else
					TriggerEvent("esx:showNotification", "Tu vehículo no puede ser recuperado por la grua ahora mismo")
					return false
				end
			end
		end
	end

	ESX.Game.SpawnVehicle(vehicle.model, {
		x = Config.Garages[this_Garage]['positions']['vehicle']['position'].x,
		y = Config.Garages[this_Garage]['positions']['vehicle']['position'].y,
		z = Config.Garages[this_Garage]['positions']['vehicle']['position'].z
		},Config.Garages[this_Garage]['positions']['vehicle']['heading'], function(callback_vehicle)
			ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
			ESX.UI.Menu.CloseAll()
		end)
		TriggerServerEvent("esx_flag_garage:modifystate", plate, true, nil)

	ESX.SetTimeout(10000, function()
		TriggerServerEvent("esx_flag_garage:modifystate", plate, false, nil)
	end)
	return true
end
--Fin fonction pour spawn vehicule fourriere
--Action das les markers
AddEventHandler(
	"esx_flag_garage:hasEnteredMarker",
	function(zone)
		if zone == "menu" then
			CurrentAction = "menu"
			CurrentActionMsg = "Presiona ~y~E~s~ para abrir el garaje"
			CurrentActionData = {}
		end
		if zone == "vehicle" then
			CurrentAction = "delete"
			CurrentActionMsg = "Presiona ~y~E~s~ para aparcar el vehículo"
			CurrentActionData = {}
		end
	end
)

AddEventHandler(
	"esx_flag_garage:hasExitedMarker",
	function(zone)
		ESX.UI.Menu.CloseAll()
		HandleCamera(this_Garage, false)
		CurrentAction = nil
	end
)
--Fin Action das les markers

function ReturnVehicleMenu()
	ESX.TriggerServerCallback(
		"esx_flag_garage:getOutVehicles",
		function(vehicles)
			local elements = {}

			for _, v in pairs(vehicles) do
				local hashVehicule = v.model
				local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleNameText = GetLabelText(vehicleName)

				local labelvehicle
				labelvehicle = vehicleNameText .. ": traer con la grua"
				table.insert(elements, {label = labelvehicle, value = v})
			end

			ESX.UI.Menu.Open(
				"default",
				GetCurrentResourceName(),
				"return_vehicle",
				{
					title = "Garaje",
					align = "bottom-right",
					elements = elements
				},
				function(data, menu)
					ESX.TriggerServerCallback(
						"esx_flag_garage:checkMoney",
						function(hasEnoughMoney)
							if hasEnoughMoney then
								--		times=times+1
								--	elseif times > 0 then
								--		ESX.SetTimeout(60000, function()
								--		times=0
								--		end)
								--	end
								--	if times == 0 then
								TriggerServerEvent('esx_flag_garage:pay')
								SpawnPoundedVehicle(data.current.value, data.current.value.plate)
								menu.close()
							else
								ESX.ShowNotification("No tienes suficiente dinero")
							end
						end
					)
				end,
				function(data, menu)
					menu.close()
					--CurrentAction = 'open_garage_action'
				end
			)
		end
	)
end

DrawMarkersList = {}
local DrawMarkersLoopRunning = false
function DrawMarkersLoop()
	if(DrawMarkersLoopRunning)then
		return
	end
	DrawMarkersLoopRunning = true
	Citizen.CreateThread(function()
		while #DrawMarkersList > 0 do
			for i=1, #DrawMarkersList, 1 do
				DrawMarker(table.unpack(DrawMarkersList[i]))
			end
			Citizen.Wait(5)
		end
		DrawMarkersLoopRunning = false
	end)
end

-- Affichage markers
--[[Citizen.CreateThread(
	function()
		while true do
			local coords = GetEntityCoords(PlayerPedId())
			DrawMarkersList = {}
			for garage, garageData in pairs(Config.Garages) do
				local m = garageData["positions"]["menu"]["position"]
				if (GetDistanceBetweenCoords(coords, m.x, m.y, m.z -1, true) < Config.DrawDistance) then
					table.insert(DrawMarkersList, { Config.MenuPoint.Marker, m.x, m.y, m.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MenuPoint.Size.x, Config.MenuPoint.Size.y, Config.MenuPoint.Size.z, 51, 51, 255, 255, false, true, 2, false, false, false, false })
				end
				local v = garageData["positions"]["vehicle"]["position"]
				if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z -1, true) < Config.DrawDistance) then
					if IsPedInAnyVehicle(PlayerPedId(), false) then
						table.insert(DrawMarkersList, { Config.VehiclePoint.Marker, v.x, v.y, v.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.VehiclePoint.Size.x, Config.VehiclePoint.Size.y, Config.VehiclePoint.Size.z, 255, 51, 51, 255, false, true, 2, false, false, false, false})
					end
				end
			end
			if(trowtrukspawnpoint ~= nil)then
				table.insert(DrawMarkersList,{36, trowtrukspawnpoint.x, trowtrukspawnpoint.y, trowtrukspawnpoint.z, 2, 2, 2, 2, 2, 2, 2.001, 2.0001, 2.5001, 2, 155, 255, 200, 2, 2, 2, 2})
			end
			DrawMarkersLoop()
			Wait(1000)
		end
	end
)]]--


function Draw3DText2(params)
    Citizen.CreateThread(function()
        local onScreen, _x, _y = World3dToScreen2d(params.xyz.x,params.xyz.y,params.xyz.z)
        local p = GetGameplayCamCoords()
        local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, params.xyz.x,params.xyz.y,params.xyz.z, 1)
        local scale = (1 / distance) * (params.perspectiveScale or default.perspectiveScale)
        local fov = (1 / GetGameplayCamFov()) * 75
        local scale = scale * fov
        if onScreen then
            SetTextScale(tonumber(params.text.scaleMultiplier*0.0), tonumber(0.35 *params.text.scaleMultiplier))
            SetTextFont(params.text.font or default.text.font)
            SetTextProportional(true)
            SetTextColour(params.text.rgba[1], params.text.rgba[2], params.text.rgba[3], params.text.rgba[4])
          	SetTextDropshadow(0, 0, 0, 0, 100)
          	SetTextEdge(2, 0, 0, 0, 150)
            if (params.text.textOutline) == true then SetTextOutline() end;
            SetTextEntry("STRING")
            SetTextCentre(true)
            AddTextComponentString(params.text.content or default.text.content)
            DrawText(_x,_y)
        end
    end)
end

local sonido = false

AddEventHandler('esx_flag_gar:enteredMarker', function()
	if not sonido then
		PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
		sonido = true
	end
end)

AddEventHandler('esx_flag_gar:exitedMarker', function()
	sonido = false
end)



Citizen.CreateThread(
	function()
		while true do
			Wait(0)
			local coords = GetEntityCoords(PlayerPedId())
			local sleep = true
			local a = 125
			for garage, garageData in pairs(Config.Garages) do
				local m = garageData["positions"]["menu"]["position"]
				if (GetDistanceBetweenCoords(coords, m.x, m.y, m.z -1, true) < 13) and not IsPedInAnyVehicle(PlayerPedId(), false) then
					sleep = false
					if (GetDistanceBetweenCoords(coords, m.x, m.y, m.z -1, true) < 2) then
						TriggerEvent('esx_flag_gar:enteredMarker')
						a = 255
					else
						TriggerEvent('esx_flag_gar:exitedMarker')
					end
					Draw3DText2({
						xyz={x = m.x, y = m.y, z = m.z+0.4}, --at your coords 
						text={
							content="Presiona ~y~E~s~ para acceder al garaje" --[[This is the string that you want to be displayed]],
							rgba={255 , 255, 255, a} --[[The color value of the text]],
							textOutline=true --[[ Text outline ]],
							scaleMultiplier=0.8, --[[ Text Size Multiplier]]
							font=0, --[[ Font type (0-5) ]]
						},
						perspectiveScale=0.5,
					})
				end
				local v = garageData["positions"]["vehicle"]["position"]
				if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z -1, true) <  20) then
					if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z -1, true) < 2) then
						TriggerEvent('esx_flag_gar:enteredMarker')
						a = 255
					else
						TriggerEvent('esx_flag_gar:exitedMarker')
					end
					sleep = false
					if IsPedInAnyVehicle(PlayerPedId(), false) then
						Draw3DText2({
							xyz={x = v.x, y = v.y, z = v.z+0.4}, --at your coords 
							text={
								content="Presiona ~y~E~s~ para guardar el vehículo" --[[This is the string that you want to be displayed]],
								rgba={255 , 255, 255, a} --[[The color value of the text]],
								textOutline=true --[[ Text outline ]],
								scaleMultiplier=0.8, --[[ Text Size Multiplier]]
								font=0, --[[ Font type (0-5) ]]
							},
							perspectiveScale=0.5,
							radius=30 --[[ The radius of units until the text disappears/reappears ]],
						})
					end
				end
			end
			if sleep then
				Wait(1500)
			end	
		end
	end
)

-- Fin affichage markers

-- Activer le menu quand player dedans
Citizen.CreateThread(
	function()
		local currentZone = "garaje"
						
		while true do
			Citizen.Wait(250)
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			local isInMarker = false
			for garage, garageData in pairs(Config.Garages) do
				for action, actionData in pairs(garageData["positions"]) do
					local show = true
					if(action =='vehicle')then
						if not IsPedInAnyVehicle(playerPed, false) then
							show = false
						end
					end
					if (show and GetDistanceBetweenCoords(coords, actionData["position"], true) < Config.MenuPoint.Size.x) then
						isInMarker = true
						this_Garage = garage
						currentZone = action
						CurrentActionMsgCoords = actionData["position"]
					end
				end
			end

			if isInMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
				LastZone = currentZone
				TriggerEvent("esx_flag_garage:hasEnteredMarker", currentZone)
			end

			if not isInMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
				TriggerEvent("esx_flag_garage:hasExitedMarker", LastZone)
			end
		end
	end
)

-- Fin activer le menu fourriere quand player dedans

-- Controle touche
Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(0)

			if CurrentAction ~= nil then
				--ESX.ShowFloatingHelpNotification(CurrentActionMsg, vector3(CurrentActionMsgCoords.x, CurrentActionMsgCoords.y, CurrentActionMsgCoords.z + 1.0))
				if IsControlPressed(0, Keys["E"]) and (GetGameTimer() - GUI.Time) > 150 then
					
					if(CurrentAction == "menu")then
						OpenMenuGarage("menu")
					end
					if CurrentAction == "pound_action_menu" then
						OpenMenuGarage("pound")
					end
					if CurrentAction == "spawn" then
						OpenMenuGarage("spawn")
					end
					if CurrentAction == "delete" then
						OpenMenuGarage("delete")
					end

					CurrentAction = nil
					GUI.Time = GetGameTimer()
				end
			end
		end
	end
)
-- Fin controle touche

 function HandleCamera(garage, toggle)
    local Camerapos = Config.Garages[garage]["camera"]

    if not Camerapos then return end

	if not toggle then
		if cachedData["cam"] then
			DestroyCam(cachedData["cam"])
		end
		
		if DoesEntityExist(cachedData["vehicle"]) then
			DeleteEntity(cachedData["vehicle"])
		end

		RenderScriptCams(0, 1, 750, 1, 0)

		return
	end

	if cachedData["cam"] then
		DestroyCam(cachedData["cam"])
	end

	cachedData["cam"] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

	SetCamCoord(cachedData["cam"], Camerapos["x"], Camerapos["y"], Camerapos["z"])
	SetCamRot(cachedData["cam"], Camerapos["rotationX"], Camerapos["rotationY"], Camerapos["rotationZ"])
	SetCamActive(cachedData["cam"], true)

	RenderScriptCams(1, 1, 750, 1, 1)

	Citizen.Wait(500)
end

function WaitForModel(model)
    local DrawScreenText = function(text, red, green, blue, alpha)
        SetTextFont(4)
        SetTextScale(0.0, 0.5)
        SetTextColour(red, green, blue, alpha)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextCentre(true)
    
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(0.5, 0.5)
    end

    if not IsModelValid(model) then
        return ESX.ShowNotification("Este modelo no existe en el juego. " .. model)
    end

	if not HasModelLoaded(model) then
		RequestModel(model)
	end
	
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
		ESX.ShowHelpNotification("Cargando modelo " .. GetLabelText(GetDisplayNameFromVehicleModel(model)) .. "...")
	end
end

--tow truck IA
function CallTowWithCar(targetVeh, toPosition)
	player = PlayerPedId()
	playerPos = GetEntityCoords(player)

	GetTowTruck(targetVeh)
	GetTowDriver()
	
	local driverhash = GetHashKey(towTruckDriverPick.ped)
	RequestModel(driverhash)
	local truckhash = GetHashKey(towTruckModelsPick.model)
	RequestModel(truckhash)

	while not HasModelLoaded(driverhash) and RequestModel(driverhash) or not HasModelLoaded(truckhash) and RequestModel(truckhash) do
		RequestModel(driverhash)
		RequestModel(truckhash)
		Citizen.Wait(0)
	end
	
	if DoesEntityExist(targetVeh) then
		if DoesEntityExist(towTruck) then
			DeleteTowTruck(towTruck, towTruckDriver)
			SpawnTowTruck(playerPos.x, playerPos.y, playerPos.x, truckhash, driverhash)
		else
			SpawnTowTruck(playerPos.x, playerPos.y, playerPos.x, truckhash, driverhash)
		end
		PickupTarget(towTruck,towTruckDriver,targetVeh)
		trowtrukspawnpoint = toPosition
		GoToTarget(toPosition.x, toPosition.y, toPosition.z, towTruck, towTruckDriver, truckhash, targetVeh)
	end
end
function GetTowTruck(vehicle)
	targetVehClass = GetVehicleClass(vehicle)
	if targetVehClass == 13 or targetVehClass == 8 then
		towTruckModelsPick = Config.TowIA.towTruckModels.boxtrucks
	else
		towTruckModelsPick = Config.TowIA.towTruckModels.flatbeds
	end
end

function GetTowDriver()
	towTruckDriverPick = Config.TowIA.towTruckDrivers[math.random(#Config.TowIA.towTruckDrivers)]
end

function GetVehicleInDirection(coordFrom, coordTo)
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicle = GetRaycastResult(rayHandle)
    return vehicle
end

function SpawnTowTruck(x, y, z, truckhash, driverhash)												--Spawning Function
	local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(x + math.random(-Config.TowIA.spawnRadius, Config.TowIA.spawnRadius), y + math.random(-Config.TowIA.spawnRadius, Config.TowIA.spawnRadius), z, 0, 3, 0)
	
	if found and HasModelLoaded(truckhash) and HasModelLoaded(truckhash) then
		towTruck = CreateVehicle(truckhash, spawnPos, spawnHeading, true, false)					--Truck Spawning.
		--ClearAreaOfVehicles(GetEntityCoords(towTruck), 5000, false, false, false, false, false);  
		SetVehicleOnGroundProperly(towTruck)
		SetVehicleColours(towTruck, towTruckDriverPick.colour, towTruckDriverPick.colour)
		towTruckDriver = CreatePedInsideVehicle(towTruck, 26, driverhash, -1, true, false)			--Driver Spawning.
		-- Useful functions to make the ped perform better while driving.
		SetDriverAbility(towTruckDriver, 1.0)        -- values between 0.0 and 1.0 are allowed.
		SetDriverAggressiveness(towTruckDriver, 0.0)
		SetEntityMaxSpeed(towTruck, 60/3.6)
					
		towTruckBlip = AddBlipForEntity(towTruck)													--Blip Spawning.
		SetBlipFlashes(towTruckBlip, true)
		SetBlipColour(towTruckBlip, 29)
	end
end

function GoToTarget(x, y, z, truck, driver, truckhash, car)
	
	TaskVehicleDriveToCoord(driver, truck, x, y, z, 17.0, 0, truckhash, Config.TowIA.drivingStyle, 5, true)
	ESX.ShowAdvancedNotification("Incautaciones MoleCorp","Vehículo en camino", "Una grúa esta en camino con su coche desde el deposito. Gracias por usar los servicios de ~y~Incautaciones MoleCorp", 'CHAR_PROPERTY_TOWING_IMPOUND')
	enroute = true
	while enroute == true do
		Citizen.Wait(500)
		distanceToTarget = GetDistanceBetweenCoords(x, y, z, GetEntityCoords(truck).x, GetEntityCoords(truck).y, GetEntityCoords(truck).z, false)
		if distanceToTarget < 15 then
			TaskVehicleTempAction(driver, truck, 27, -1)
			SetVehicleDoorOpen(truck, 2, false, false)
			SetVehicleDoorOpen(truck, 3, false, false)
			Citizen.Wait(5000)
			ReleaseTarget(truck, driver, car, x, y, z)
		end
	end
end
function DeleteTowTruck(towTruck, towTruckDriver)
	SetEntityAsMissionEntity(towTruck, false, false)												--Truck Removal
	DeleteEntity(towTruck)
	SetEntityAsMissionEntity(towTruckDriver, false, false)											--Driver Removal
	DeleteEntity(towTruckDriver)
	RemoveBlip(towTruckBlip)																		--Blip Removal
end


function PickupTarget(truck, driver, car)
	AttachEntityToEntity(car, truck, 20, towTruckModelsPick.offset.x, towTruckModelsPick.offset.y, towTruckModelsPick.offset.z, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
end

function ReleaseTarget(truck, driver, car, x, y, z)
	local notified = false
	while not ESX.Game.IsSpawnPointClear(vector3(x, y, z), 3.0) do 
		if(notified == false)then
			ESX.ShowNotification("La grua no puede entregar el coche. Por favor, libera la zona para que el operario pueda entregarte el coche.")
			notified = true
		end
		Citizen.Wait(1000)
	end

	enroute = false
	trowtrukspawnpoint = nil
	ESX.ShowAdvancedNotification("Incautaciones MoleCorp","Vehículo entregado", "Gracias por usar los servicios de ~y~Incautaciones MoleCorp", 'CHAR_PROPERTY_TOWING_IMPOUND')
	TriggerServerEvent("esx_flag_garage:pay")
	DetachEntity(car, true, true)
	SetEntityCoords(car, x, y, z, true ,true, true, true)
	Citizen.Wait(5000)
	SetVehicleDoorsShut(truck, false)
	StartVehicleHorn(truck, 100, 0, false)
	TaskVehicleDriveWander(driver, truck, 17.0, Config.TowIA.drivingStyle)
	SetEntityAsNoLongerNeeded(truck)
	SetPedAsNoLongerNeeded(driver)
	RemoveBlip(towTruckBlip)
	towTruck = nil
	towTruckDriver = nil
	targetVeh = nil
end
