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

ESX = nil
local PlayerData              = {}
local training = false
local resting = false
local membership = false
local enClase = false
local anfitrion = false
local hayAnfitrion = false
local empezoClase = false
local inClass = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
		
		PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

function hintToDisplay(text)
	ESX.ShowHelpNotification(text)
end

local blips = {
	{title="Gimnasio", colour=7, id=311, x = -1201.2257, y = -1568.8670, z = 4.6101},
}

local blips2 = {
	{title="Alquiler de bicis", colour=26, id=348, x = -507.58, y = -256.43, z = 33.77},
	{title="Alquiler de bicis", colour=26, id=348, x = 215.21, y = -817.55, z = 30.65},
	{title="Alquiler de bicis", colour=26, id=348, x = -41.3, y = -1117.65, z = 26.43},
	{title="Alquiler de bicis", colour=26, id=348, x = 310.09, y = -231.8, z = 54.07},
	{title="Alquiler de bicis", colour=26, id=348, x = -1199.1164,y = -1584.5972,z = 3.371159},
	{title="Alquiler de bicis", colour=26, id=348, x = -1199.1164,y = -1584.5972,z = 3.371159}
}
	
--[[Citizen.CreateThread(function()
	for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.6)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)

Citizen.CreateThread(function()
	for _, info in pairs(blips2) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.6)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)]]--

RegisterNetEvent('esx_gym:trueMembership')
AddEventHandler('esx_gym:trueMembership', function()
	membership = true
end)

RegisterNetEvent('esx_gym:falseMembership')
AddEventHandler('esx_gym:falseMembership', function()
	membership = false
end)

-- LOCATION (START)

local arms = { --Hacer brazos (pesas)
 --   {x = -1202.9837,y = -1565.1718,z = 3.63115}
	{x = -1209.68, y = -1561.43, z = 4.431155},
	{x = -1202.31, y = -1567.2, z = 4.431155},
	{x = -378.22, y = 6048.0, z = 31.28}

}

local pushup = { -- Flexiones
    {x = -1203.3242,y = -1570.6184, z = 4.431155},
	{x = -370.53, y = 6041.39, z = 31.25}
}

local yoga = { -- Hacer yoga
	{x = -1217.31, y = -1542.52, z = 4.431155},
	{x = -1221.59 ,y = -1545.34 , z = 4.431155},
	{x = -1227.92 , y = -1549.78 , z = 4.431155},
	{x = -1224.85 , y = -1547.36 , z = 4.431155},
	{x = -373.56, y = 6043.31, z = 31.28}
}

local situps = { -- Abdominales
    {x = -1206.1055,y = -1565.1589, z = 4.431155},
	{x = -1200.5, y = -1577.18, z = 4.431155},
	{x = -1202.01, y = -1572.75, z = 4.431155},
	{x = -1205.35, y = -1567.61, z = 4.431155},
	{x = -1208.09, y = -1563.36, z = 4.431155},
	{x = -369.66, y = 6037.7, z = 31.25},
}

local chins = { -- Dominadas
--    {x = -1200.1284,y = -1570.9903,z = 3.63115}
	{x = -1204.7, y = -1564.32, z = 4.431155},
	{x = -1199.98, y = -1571.22, z = 4.431155},
	{x = -374.61, y = 6040.46, z = 31.28}
}

local trotar = { -- Trotar
	{x = -1194.4, y = -1570.62, z = 4.431155},
	{x = -1195.88, y = -1568.86, z = 4.431155},
	{x = -383.46, y = 6046.41, z = 31.25}
}

local gym = {
    {x = -1195.6551,y = -1577.7689, z = 4.431155}
}

local baileAnfitrion = {
    {x = -1211.42, y = -1576.08, z = 2.41}
}

local claseBaile = {
	{x = -1217.18, y = -1580.17, z = -6.01}
}

local rentbike = {
    {x = -1199.1164,y = -1584.5972,z = 3.371159},
    {x = -507.58, y = -256.43, z = 34.63},
	{x = 215.21, y = -817.55, z = 29.70},
	{x = -41.3, y = -1117.65, z = 25.43},
	{x = 308.82, y = -231.63, z = 53.091},
	{x = -7.42, y = -1716.93, z = 29.29}
}

-- LOCATION (END)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		local plyCoords = GetEntityCoords(PlayerPedId(), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -1203.18, -1567.65, 5.01)

		if dist < 40 then
			for k in pairs(arms) do
				DrawMarker(21, arms[k].x, arms[k].y, arms[k].z, 0, 0, 0, 0, 0, 0, 0.21, 0.21, 0.201,0, 255, 0, 100, 0, 0, 0, 0)
			end

			for k in pairs(pushup) do
				DrawMarker(21, pushup[k].x, pushup[k].y, pushup[k].z, 0, 0, 0, 0, 0, 0, 0.21, 0.21, 0.201,0, 255, 0, 100, 0, 0, 0, 0)
			end

			for k in pairs(yoga) do
				DrawMarker(21, yoga[k].x, yoga[k].y, yoga[k].z, 0, 0, 0, 0, 0, 0, 0.21, 0.21, 0.201,0, 255, 0, 100, 0, 0, 0, 0)
			end

			for k in pairs(situps) do
				DrawMarker(21, situps[k].x, situps[k].y, situps[k].z, 0, 0, 0, 0, 0, 0, 0.21, 0.21, 0.201,0, 255, 0, 100, 0, 0, 0, 0)
			end

			for k in pairs(trotar) do
				DrawMarker(21, trotar[k].x, trotar[k].y, trotar[k].z, 0, 0, 0, 0, 0, 0, 0.21, 0.21, 0.201,0, 255, 0, 100, 0, 0, 0, 0)
			end

			for k in pairs(chins) do
				DrawMarker(21, chins[k].x, chins[k].y, chins[k].z, 0, 0, 0, 0, 0, 0, 0.21, 0.21, 0.201,0, 255, 0, 100, 0, 0, 0, 0)
			end

		else
			Wait(2500)
		end
    end
end)

Citizen.CreateThread(function()
	while true do
		Wait(1)
		local sleep = true
		for k in pairs(rentbike) do
		
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, rentbike[k].x, rentbike[k].y, rentbike[k].z)

            if dist <= 1.5 then
				sleep = false
				local playerPed = PlayerPedId()
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
				ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~ para alquilar una ~b~bicicleta', vector3(playerX, playerY, playerZ+0.8))
				--hintToDisplay('Presiona ~y~E~s~ para alquilar una ~b~bicicleta')
				
				if IsControlJustPressed(0, Keys['E']) then -- "E"
					if IsPedInAnyVehicle(PlayerPedId()) then
						ESX.ShowNotification("No puedes alquilar desde dentro de un vehículo")
					else
						OpenBikeMenu()
					end
				end			
            end
		end
		
		for k in pairs(gym) do
		
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, gym[k].x, gym[k].y, gym[k].z)

			if dist <= 1.5 then
				sleep = false			
				local playerPed = PlayerPedId()
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
				ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~ para abrir el menu del ~b~gimnasio', vector3(playerX, playerY, playerZ+0.8))
				--hintToDisplay('Presiona ~y~E~s~ para abrir el menu del ~b~gimnasio')
				
				if IsControlJustPressed(0, Keys['E']) then
					OpenGymMenu()
				end			
            end
		end
		
		for k in pairs(arms) do

            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, arms[k].x, arms[k].y, arms[k].z)

            if dist <= 1.5 then
				sleep = false
				local playerPed = PlayerPedId()
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
				ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~ para ejercitar tus ~g~brazos', vector3(playerX, playerY, playerZ+0.8))
				
				--hintToDisplay('Presiona ~y~E~s~ para ejercitar tus ~g~brazos')
				
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then
					
						TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification('Preparando <span style="color:yellow">ejercicio</span>...')
						Citizen.Wait(1000)					
					
						if membership == true then
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
							Citizen.Wait(30000)
							ClearPedTasksImmediately(playerPed)
							exports["esx_skillsystem"]:UpdateSkill("Fuerza", 0.5)
							exports["esx_skillsystem"]:UpdateSkill("Chill", 0.3)
							ESX.ShowNotification('Necesitas descansar <span style="color:yellow">60</span> segundos antes de realizar otro.')
							training = true
						elseif membership == false then
							ESX.ShowNotification('Necesitas ser <span style="color:yellow">socio</span> para hacer este ejercicio')
						end
					elseif training == true then
						ESX.ShowNotification("Necesitas un descanso...")
						resting = true
						CheckTraining()
					end
				end			
            end
		end

		for k in pairs(trotar) do

            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, trotar[k].x, trotar[k].y, trotar[k].z)

            if dist <= 1.5 then
				sleep = false
				local playerPed = PlayerPedId()
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
				ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~ para ~g~calentar', vector3(playerX, playerY, playerZ+0.8))
			
				
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then
					
						TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification('Preparando <span style="color:yellow">ejercicio</span>...')
						Citizen.Wait(1000)					
					
						if membership == true then
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "world_human_jog", 0, true)
							Citizen.Wait(30000)
							ClearPedTasksImmediately(playerPed)
							exports["esx_skillsystem"]:UpdateSkill("Resistencia", 0.5)
							exports["esx_skillsystem"]:UpdateSkill("Chill", 0.3)
							ESX.ShowNotification('Necesitas descansar <span style="color:yellow">60</span> segundos antes de realizar otro.')
							training = true
						elseif membership == false then
							ESX.ShowNotification('Necesitas ser <span style="color:yellow">socio</span> para hacer este ejercicio')
						end
					elseif training == true then
						ESX.ShowNotification("Necesitas un descanso...")
						resting = true
						CheckTraining()
					end
				end			
            end
		end
		
		for k in pairs(chins) do

            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chins[k].x, chins[k].y, chins[k].z)

            if dist <= 1.5 then
				sleep = false
				local playerPed = PlayerPedId()
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
				ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~ para hacer ~g~dominadas', vector3(playerX, playerY, playerZ+0.8))
				
				--hintToDisplay('Presiona ~y~E~s~ para hacer ~g~dominadas')
				
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then
					
						TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification('Preparando <span style="color:yellow">ejercicio</span>...')
						Citizen.Wait(1000)					
					
						if membership == true then
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "prop_human_muscle_chin_ups", 0, true)
							Citizen.Wait(30000)
							ClearPedTasksImmediately(playerPed)
							exports["esx_skillsystem"]:UpdateSkill("Resistencia", 0.6)
							exports["esx_skillsystem"]:UpdateSkill("Chill", 0.3)
							ESX.ShowNotification('Necesitas descansar <span style="color:yellow">60</span> segundos antes de realizar otro.')
							training = true
						elseif membership == false then
							ESX.ShowNotification("Necesitas ser socio para poder hacer ejercicio")
						end
					elseif training == true then
						ESX.ShowNotification("Necesitas un descanso...")
						resting = true
						CheckTraining()
					end
				end			
            end
		end
		
		for k in pairs(pushup) do
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pushup[k].x, pushup[k].y, pushup[k].z)

            if dist <= 1.5 then
				sleep = false
				local playerPed = PlayerPedId()
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
				ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~ para hacer ~g~flexiones', vector3(playerX, playerY, playerZ+0.8))
				
				--hintToDisplay('Presiona ~y~E~s~ para hacer ~g~flexiones')
				
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then
					
						TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification('Preparando <span style="color:yellow">ejercicio</span>...')
						Citizen.Wait(1000)					
					
						if membership == true then				
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "world_human_push_ups", 0, true)
							Citizen.Wait(30000)
							ClearPedTasksImmediately(playerPed)
							exports["esx_skillsystem"]:UpdateSkill("Fuerza", 0.7)
							exports["esx_skillsystem"]:UpdateSkill("Chill", 0.3)
							ESX.ShowNotification('Necesitas descansar <span style="color:yellow">60</span> segundos antes de realizar otro.')
							training = true
						elseif membership == false then
							ESX.ShowNotification('Necesitas ser <span style="color:yellow">socio</span> para hacer este ejercicio')
						end							
					elseif training == true then
						ESX.ShowNotification("Necesitas un descanso...")
						resting = true
						CheckTraining()
					end
				end			
            end
		end
		
		for k in pairs(yoga) do

            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, yoga[k].x, yoga[k].y, yoga[k].z)

            if dist <= 1.5 then
				sleep = false
				local playerPed = PlayerPedId()
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
				ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~  para hacer ~g~yoga', vector3(playerX, playerY, playerZ+0.8))
				
				--hintToDisplay('Presiona ~y~E~s~ para hacer ~g~yoga')
				
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then
					
						TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification('Preparando <span style="color:yellow">ejercicio</span>...')
						Citizen.Wait(1000)					
					
						if membership == true then	
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "world_human_yoga", 0, true)
							Citizen.Wait(30000)
							ClearPedTasksImmediately(playerPed)
							exports["esx_skillsystem"]:UpdateSkill("Resistencia", 0.6)
							exports["esx_skillsystem"]:UpdateSkill("Chill", 0.3)
							ESX.ShowNotification('Necesitas descansar <span style="color:yellow">60</span> segundos antes de realizar otro.')
							training = true
						elseif membership == false then
							ESX.ShowNotification('Necesitas ser <span style="color:yellow">socio</span> para hacer este ejercicio')
						end
					elseif training == true then
						ESX.ShowNotification("Necesitas un descanso...")
						resting = true
						CheckTraining()
					end
				end			
            end
		end
		
		for k in pairs(situps) do

            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, situps[k].x, situps[k].y, situps[k].z)

            if dist <= 1.5 then
				sleep = false
				local playerPed = PlayerPedId()
				local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
				ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~  para hacer ~g~abdominales', vector3(playerX, playerY, playerZ+0.8))
				
				--hintToDisplay('Presiona ~y~E~s~ para hacer ~g~abdominales')
				
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then

						TriggerServerEvent('esx_gym:checkChip')
						ESX.ShowNotification('Preparando <span style="color:yellow">ejercicio</span>...')
						Citizen.Wait(1000)					
					
						if membership == true then	
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "world_human_sit_ups", 0, true)
							Citizen.Wait(30000)
							ClearPedTasksImmediately(playerPed)
							exports["esx_skillsystem"]:UpdateSkill("Resistencia", 0.4)
							exports["esx_skillsystem"]:UpdateSkill("Chill", 0.3)
							ESX.ShowNotification('Necesitas descansar <span style="color:yellow">60</span> segundos antes de realizar otro.')
							training = true
						elseif membership == false then
							ESX.ShowNotification('Necesitas ser <span style="color:yellow">socio</span> para hacer este ejercicio')
						end
					elseif training == true then
						ESX.ShowNotification("Necesitas un descanso...")
						resting = true
						CheckTraining()
					end
				end			
            end
		end

		if sleep then
			Wait(2000)
		end
	end
end)

RegisterNetEvent('alguienEmpezadoClase')
AddEventHandler('alguienEmpezadoClase', function()
	enClase = true
end)

RegisterNetEvent('hayAnfitrion')
AddEventHandler('hayAnfitrion', function(n)
	if n == 1 then
		hayAnfitrion = true
	elseif n == 0 then
		hayAnfitrion = false
	end
end)

local isInMarker = false

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		if not hayAnfitrion and not Noti then
			if isInMarker == true then
				a = 255
			else
				a = 125
			end
			if Vdist2(coords.x, coords.y, coords.z, -1211.33, -1576.05, 4.61) < 40 then
					Draw3DText2({
						xyz={x = -1211.33, y = -1576.05, z = 4.61}, --at your coords 
						text={
							content="Presiona ~y~E~s~ para empezar una clase de zumba" --[[This is the string that you want to be displayed]],
							rgba={255 , 255, 255, a} --[[The color value of the text]],
							textOutline=true --[[ Text outline ]],
							scaleMultiplier=0.7, --[[ Text Size Multiplier]]
							font=0, --[[ Font type (0-5) ]]
						},
						perspectiveScale=0.5,
					})
			end
		else
			Wait(1500)
		end
	end
end)
local Noti = false
local sonido = false

AddEventHandler('flag_gamemode:enteredMarker', function()
	if not sonido then
		PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
		sonido = true
	end
end)

AddEventHandler('flag_gamemode:exitedMarker', function()
	sonido = false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not hayAnfitrion and not Noti then
			--for k in pairs(baileAnfitrion) do
				--DrawMarker(1, baileAnfitrion[k].x, baileAnfitrion[k].y, baileAnfitrion[k].z, 0, 0, 0, 0, 0, 0, 1.40, 1.40, 1.40,0, 0, 255, 2000, 0, 0, 0, 0)
			--end	
		
			for k in pairs(baileAnfitrion) do

				local plyCoords = GetEntityCoords(PlayerPedId(), false)
				local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, baileAnfitrion[k].x, baileAnfitrion[k].y, baileAnfitrion[k].z+2)

				if dist <= 2.5 then
					isInMarker = true
					local playerPed = PlayerPedId()
					local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
					--ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~ para empezar una clase de ~g~baile', vector3(playerX, playerY, playerZ+0.8))
				
					TriggerEvent('flag_gamemode:enteredMarker')
					if IsControlJustPressed(0, Keys['E']) then
						ESX.ShowNotification('Preparando la ~b~clase~s~...')
						anfitrion = true
						TriggerServerEvent('mostrarPuntoClase', 1)
						TriggerEvent('mostrarPuntoClaseEmote', 1)
					end		
				else
					TriggerEvent('flag_gamemode:exitedMarker')
					isInMarker = false	
				end
			end
		else
			for k in pairs(baileAnfitrion) do

				local plyCoords = GetEntityCoords(PlayerPedId(), false)
				local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, baileAnfitrion[k].x, baileAnfitrion[k].y, baileAnfitrion[k].z+2)

				if dist <= 1.5 then		
					if IsControlJustPressed(0, Keys['X']) then
						ESX.ShowNotification('Has dejado la ~b~clase')
						Noti = false
						anfitrion = false
						TriggerServerEvent('mostrarPuntoClase', 0)
						TriggerEvent('mostrarPuntoClaseEmote', 0)
						TriggerServerEvent('cancelarClase')
					end			
				end		
			end
		end
		if not isInMarker then
			Wait(1500)
		end
	end

end)

RegisterNetEvent('cancelarClaseCl')
AddEventHandler('cancelarClaseCl', function()
	if inClass then
		ExecuteCommand('cancelaranim')
		inClass = false
	end
end)

RegisterNetEvent('mostrarPuntoClase')
AddEventHandler('mostrarPuntoClase', function(n)
	if n == 1 then
		empezoClase = true
	elseif n == 0 then
		empezoClase = false
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if empezoClase then
			if not Noti and not anfitrion then
				for k in pairs(claseBaile) do
					DrawMarker(1, claseBaile[k].x, claseBaile[k].y, claseBaile[k].z, 0, 0, 0, 0, 0, 0, 10.40, 10.40, 10.40,0, 0, 255, 2000, 0, 0, 0, 0)
				end

				for k in pairs(claseBaile) do

					local plyCoords = GetEntityCoords(PlayerPedId(), false)
					local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, claseBaile[k].x, claseBaile[k].y, claseBaile[k].z+10)

					if dist <= 5 then
						local playerPed = PlayerPedId()
						local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
						ESX.ShowFloatingHelpNotification('Presiona ~y~E~s~ para unirte a la clase', vector3(playerX, playerY, playerZ+0.8))
						if IsControlJustPressed(0, Keys['E']) then
							ESX.ShowNotification('Presiona ~b~X~s~ para salir...')
							Noti = true
							inClass = true
						end				
					end
				end
			else
				if IsControlJustPressed(0, Keys['X']) then
					ESX.ShowNotification('Has salido de la ~b~clase de baile')
					Noti = false
					inClass = false
					ExecuteCommand('cancelaranim')
				end	
			end
		else
			Noti = false
			Citizen.Wait(1500)
		end
	end
end)

RegisterNetEvent('esx_gym:claseBaileCl')
AddEventHandler('esx_gym:claseBaileCl', function(e)
	if anfitrion and e ~= nil then
		return
	elseif inClass and e ~= nil then
		ExecuteCommand('e '..e)
	else
		return
	end
end)


function CheckTraining()
	if resting == true then
		ESX.ShowNotification("Estás descansando...")
		
		resting = false
		Citizen.Wait(60000)
		training = false
	end
	
	if resting == false then
		ESX.ShowNotification("Ya puedes volver a hacer ejercicio")
	end
end

RegisterNetEvent('entornoAutomatico')
AddEventHandler('entornoAutomatico', function()
	ExecuteCommand("entorno Alguien me ha robado una bici de alquiler!!!!")
end)


function OpenGymMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_menu',
        {
            title    = 'Gym',
			align	 = 'bottom-right',
            elements = {
				{label = 'Tienda', value = 'shop'},
				{label = 'Membresía', value = 'ship'}
            }
        },
        function(data, menu)
            if data.current.value == 'shop' then
				OpenGymShopMenu()
            elseif data.current.value == 'ship' then
				OpenGymShipMenu()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenGymShopMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_shop_menu',
        {
            title    = 'Gym - Tienda',
			align	 = 'bottom-right',
            elements = {
				{label = 'Batido de proteínas <span style="color:green;">$10</span>', value = 'protein_shake'},
				{label = 'Agua <span style="color:green;">$6</span>', value = 'water'},
				{label = 'Barrita energética <span style="color:green;">$4</span><span style="color:#fffb00"> VIP</span>', value = 'sportlunch'},
				{label = 'Powerade <span style="color:green;">$6</span><span style="color:#fffb00"> VIP</span>', value = 'powerade'},
            }
        },
        function(data, menu)
            if data.current.value == 'protein_shake' then
				TriggerServerEvent('esx_gym:buyProteinshake')
            elseif data.current.value == 'water' then
				TriggerServerEvent('esx_gym:buyWater')
            elseif data.current.value == 'sportlunch' then
				TriggerServerEvent('esx_gym:buySportlunch')
            elseif data.current.value == 'powerade' then
				TriggerServerEvent('esx_gym:buyPowerade')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

RegisterNetEvent('notify_gym')
AddEventHandler('notify_gym', function()
	exports.fl_notifications:MoleShowAdvancedNotification('~p~LeyendasRP', 'No eres ~y~VIP~s~', 'Para poder comprar esto tienes que ser VIP.', 'CHAR_BLOCKED', 1)
end)

function OpenGymShipMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_ship_menu',
        {
            title    = 'Gimnasio - Hazte socio',
			align	 = 'bottom-right',
            elements = {
				{label = 'Hacerse socio <span style="color:green;">$100</span>', value = 'membership'},
            }
        },
        function(data, menu)
            if data.current.value == 'membership' then
				TriggerServerEvent('esx_gym:buyMembership')
				
				ESX.UI.Menu.CloseAll()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenBikeMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'bike_menu',
        {
			title    = 'Alquilar una bicicleta',
			align	 = 'bottom-right',
            elements = {
				{label = 'BMX <span style="color:green;">$20</span>', value = 'bmx'},
				{label = 'Cruiser <span style="color:green;">$30</span>', value = 'cruiser'},
				{label = 'Fixter <span style="color:green;">$40</span><span style="color:#fffb00"> VIP</span>', value = 'fixter'},
				{label = 'Scorcher <span style="color:green;">$40</span><span style="color:#fffb00"> VIP</span>', value = 'scorcher'},
            }
        },
        function(data, menu)
            if data.current.value == 'bmx' then
				TriggerServerEvent('esx_gym:hireBmx')
				TriggerEvent('esx:spawnVehicle', "bmx")
				
				ESX.UI.Menu.CloseAll()
            elseif data.current.value == 'cruiser' then
				TriggerServerEvent('esx_gym:hireCruiser')
				TriggerEvent('esx:spawnVehicle', "cruiser")
				
				ESX.UI.Menu.CloseAll()
            elseif data.current.value == 'fixter' then
				ESX.TriggerServerCallback('checkVip', function(esvip) 
					_vip = esvip
				end)
				if not _vip then
					exports.fl_notifications:MoleShowAdvancedNotification('~p~LeyendasRP', 'No eres ~y~VIP~s~', 'Para poder utilizar esto tienes que ser VIP.', 'CHAR_BLOCKED', 1)
				else 
					TriggerServerEvent('esx_gym:hireFixter')
					TriggerEvent('esx:spawnVehicle', "fixter")
					ESX.UI.Menu.CloseAll()
				end
            elseif data.current.value == 'scorcher' then
				ESX.TriggerServerCallback('checkVip', function(esvip) 
					_vip = esvip
				end)
				if not _vip then
					exports.fl_notifications:MoleShowAdvancedNotification('~p~LeyendasRP', 'No eres ~y~VIP~s~', 'Para poder utilizar esto tienes que ser VIP.', 'CHAR_BLOCKED', 1)
				else 
					TriggerServerEvent('esx_gym:hireScorcher')
					TriggerEvent('esx:spawnVehicle', "scorcher")
				
					ESX.UI.Menu.CloseAll()
				end
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end