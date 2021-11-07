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

ESX =					nil
local Vehicles =		{}
local PlayerData		= {}
local lsMenuIsShowed	= false
local isInLSMarker		= false
local myCar				= {}

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

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'LS Customs',
		number     = 'mechanic',
		base64Icon = 'data:image/png;base64,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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	ESX.TriggerServerCallback('esx_lscustom:getVehiclesPrices', function(vehicles)
		Vehicles = vehicles
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	PlayerData.job2 = job2
end)

RegisterNetEvent('esx_lscustom:installMod')
AddEventHandler('esx_lscustom:installMod', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	myCar = ESX.Game.GetVehicleProperties(vehicle)
	TriggerServerEvent('esx_lscustom:refreshOwnedVehicle', myCar)
end)

RegisterNetEvent('esx_lscustom:cancelInstallMod')
AddEventHandler('esx_lscustom:cancelInstallMod', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	ESX.Game.SetVehicleProperties(vehicle, myCar)
end)

function OpenLSMenu(elems, menuName, menuTitle, parent)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), menuName,
	{
		title    = menuTitle,
		align    = 'bottom-right',
		elements = elems
	}, function(data, menu)
		local isRimMod, found = false, false
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

		if data.current.modType == "modFrontWheels" then
			isRimMod = true
		end

		for k,v in pairs(Config.LSCustoms.Menus) do

			if k == data.current.modType or isRimMod then

				if data.current.label == _U('by_default') or string.match(data.current.label, _U('installed')) then
					ESX.ShowNotification(_U('already_own', data.current.label))
					TriggerEvent('esx_lscustom:installMod')
				else
					local vehiclePrice = 50000

					for i=1, #Vehicles, 1 do
						if GetEntityModel(vehicle) == GetHashKey(Vehicles[i].model) then
							vehiclePrice = Vehicles[i].price
							break
						end
					end
					if isRimMod then
						price = math.floor(vehiclePrice * data.current.price / 100)
						TriggerServerEvent("esx_lscustom:buyMod", price)
					elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
						price = math.floor(vehiclePrice * v.price[data.current.modNum + 1] / 100)
						TriggerServerEvent("esx_lscustom:buyMod", price)
					elseif v.modType == 17 then
						price = math.floor(vehiclePrice * v.price[1] / 100)
						TriggerServerEvent("esx_lscustom:buyMod", price)
					elseif v.modType == 'extras' then
						if(IsVehicleExtraTurnedOn(vehicle, data.current.modNum))then
							SetVehicleExtra(vehicle, data.current.modNum, 1)
						else
							SetVehicleExtra(vehicle, data.current.modNum, 0)
						end
						TriggerEvent('esx_lscustom:installMod')
					elseif v.modType == 'modCustomWheels' then
						local currentWheel = GetVehicleMod(vehicle, 23)
						if(GetVehicleModVariation(vehicle, 23))then
							SetVehicleMod(vehicle, 23, currentWheel, false)
							if IsThisModelABike(GetEntityModel(vehicle)) then
								SetVehicleMod(vehicle, 24, currentWheel, false)
							end
						else
							SetVehicleMod(vehicle, 23, currentWheel, true)
							if IsThisModelABike(GetEntityModel(vehicle)) then
								SetVehicleMod(vehicle, 24, currentWheel, true)
							end
						end
						TriggerEvent('esx_lscustom:installMod')
					elseif v.modType == 'modDriftkit' then
						if DecorExistOn(vehicle, 'DRIFTKIT') and DecorGetInt(vehicle, 'DRIFTKIT') == 1 then
							DecorSetInt(vehicle, 'DRIFTKIT', 2)
						else
							DecorSetInt(vehicle, 'DRIFTKIT', 1)
						end
						TriggerEvent('esx_lscustom:installMod')
					else
						price = math.floor(vehiclePrice * v.price / 100)
						TriggerServerEvent("esx_lscustom:buyMod", price)
					end
				end

				menu.close()
				found = true
				break
			end

		end

		if not found then
			GetAction(data.current)
		end
	end, function(data, menu) -- on cancel
		menu.close()
		TriggerEvent('esx_lscustom:cancelInstallMod')

		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDoorsShut(vehicle, false)

		if parent == nil then
			lsMenuIsShowed = false
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			FreezeEntityPosition(vehicle, false)
			TriggerEvent('carhud:forceHide', false)
			TriggerEvent('esx_mole_vehicleinfo:hide')
			TriggerEvent('esx_status:forceRadarHide','esx_lscustom')
			myCar = {}
		end
				
	end, function(data, menu) -- on change
		UpdateMods(data.current)
	end)
end

function UpdateMods(data)
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if data.modType ~= nil then
		local props = {}
		
		if data.wheelType ~= nil then
			props['wheels'] = data.wheelType
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		elseif data.modType == 'neonColor' then
			if data.modNum[1] == 0 and data.modNum[2] == 0 and data.modNum[3] == 0 then
				props['neonEnabled'] = { false, false, false, false }
			else
				props['neonEnabled'] = { true, true, true, true }
			end
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		elseif data.modType == 'tyreSmokeColor' then
			props['modSmokeEnabled'] = true
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		elseif data.modType == 'extras' then
	--		if(IsVehicleExtraTurnedOn(vehicle, data.modNum))then
	--			SetVehicleExtra(vehicle, data.modNum, true)
	--		else
	--			SetVehicleExtra(vehicle, data.modNum, false)
	--		end
		elseif(data.modType == 'modDriftkit')then
			if DecorExistOn(vehicle, 'DRIFTKIT') and DecorGetInt(vehicle, 'DRIFTKIT') == 1 then
				props['modDriftkit'] = true
			else
				props['modDriftkit'] = nil
			end
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		end
		if(data.modType ~= 'extras')then
			props[data.modType] = data.modNum
			local entitymodel = GetEntityModel(vehicle)
			local isBike = IsThisModelABike(entitymodel)
			if(isBike and data.modType == 'modFrontWheels')then
				props['modBackWheels'] = data.modNum
			end
			if(data.modType == 'modFrontWheels')then
				props['modCustomWheels'] = GetVehicleModVariation(vehicle, 23)
			end
		end
		ESX.Game.SetVehicleProperties(vehicle, props)
	end
end

function GetAction(data)
	local elements  = {}
	local menuName  = ''
	local menuTitle = ''
	local parent    = nil

	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local currentMods = ESX.Game.GetVehicleProperties(vehicle)

	if data.value == 'modSpeakers' or
		data.value == 'modTrunk' or
		data.value == 'modHydrolic' or
		data.value == 'modEngineBlock' or
		data.value == 'modAirFilter' or
		data.value == 'modStruts' or
		data.value == 'modTank' then
		SetVehicleDoorOpen(vehicle, 4, false)
		SetVehicleDoorOpen(vehicle, 5, false)
	elseif data.value == 'modDoorSpeaker' then
		SetVehicleDoorOpen(vehicle, 0, false)
		SetVehicleDoorOpen(vehicle, 1, false)
		SetVehicleDoorOpen(vehicle, 2, false)
		SetVehicleDoorOpen(vehicle, 3, false)
	else
		SetVehicleDoorsShut(vehicle, false)
	end

	local vehiclePrice = 50000

	for i=1, #Vehicles, 1 do
		if GetEntityModel(vehicle) == GetHashKey(Vehicles[i].model) then
			vehiclePrice = Vehicles[i].price
			break
		end
	end

	for k,v in pairs(Config.LSCustoms.Menus) do

		if data.value == k then

			menuName  = k
			menuTitle = v.label
			parent    = v.parent

			if v.modType ~= nil then
				if v.modType == 22 then
					table.insert(elements, {label = " " .. _U('by_default'), modType = k, modNum = false})
				elseif v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- disable neon
					table.insert(elements, {label = " " ..  _U('by_default'), modType = k, modNum = {0, 0, 0}})
				elseif v.modType == 'color1' or v.modType == 'color2' or v.modType == 'pearlescentColor' or v.modType == 'dashboardColor' or v.modType == 'interiorColor' or v.modType == 'wheelColor' or v.modType == 'xenonColor' then
					local num = myCar[v.modType]
					table.insert(elements, {label = " " .. _U('by_default'), modType = k, modNum = num})
				elseif v.modType == 17 then
					table.insert(elements, {label = " " .. _U('no_turbo'), modType = k, modNum = false})
				elseif v.modType == 'extras' then
					for e=1, 12, 1 do
						if(IsVehicleExtraTurnedOn(vehicle, e))then
							table.insert(elements, {label = ' Extra ' .. e .. " ON", modType = k, modNum = e})
						else
							table.insert(elements, {label = ' Extra ' .. e .. " OFF", modType = k, modNum = e})
						end
					end
				elseif v.modType == 'modCustomWheels' then
					if(GetVehicleModVariation(vehicle, 23))then
						table.insert(elements, {label = ' Gomas custom ON', modType = k, modNum = 23})
					else
						table.insert(elements, {label = ' Gomas custom OFF', modType = k, modNum = 23})
					end
				elseif v.modType == 'modDriftkit' then
					if DecorExistOn(vehicle, 'DRIFTKIT') and DecorGetInt(vehicle, 'DRIFTKIT') == 1  then
						table.insert(elements, {label = ' Mod Drift ON', modType = k, modNum = false})
					else
						table.insert(elements, {label = ' Mod Drift OFF', modType = k, modNum = false})
					end
 				else
					table.insert(elements, {label = " " .. _U('by_default'), modType = k, modNum = -1})
				end

				if v.modType == 14 then -- HORNS
					for j = 0, 51, 1 do
						local _label = ''
						if j == currentMods.modHorns then
							_label = GetHornName(j) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							if Config.LSCustoms.EnableFreeTunning == true then
								_label = GetHornName(j)
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = GetHornName(j) .. ' - <span style="color:green;">$' .. price .. ' </span>'
							end
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
					end
				elseif v.modType == 'plateIndex' then -- PLATES
					for j = 0, 5, 1 do
						local _label = ''
						if j == currentMods.plateIndex then
							_label = GetPlatesName(j) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							if Config.LSCustoms.EnableFreeTunning == true then
								_label = GetPlatesName(j)
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = GetPlatesName(j) .. ' - <span style="color:green;">$' .. price .. ' </span>'
							end
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
					end
				elseif v.modType == 22 then -- NEON
					local _label = ''
					if currentMods.modXenon then
						_label =  'Xenon - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
					else
						if Config.LSCustoms.EnableFreeTunning == true then
							_label = 'Xenon'
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = 'Xenon - <span style="color:green;">$' .. price .. ' </span>'
						end
					end
					table.insert(elements, {label = _label, modType = k, modNum = true})
				elseif v.modType == 'xenonColor' then -- NEON & SMOKE COLOR
					for _, xcolor in pairs(Config.LSCustoms.XenonColors) do
						table.insert(elements, {
							label = xcolor.label,
							modType = k,
							modNum = xcolor.value
						})
					end
					
				elseif  v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- NEON & SMOKE COLOR
					local neons = GetNeons()
					
					if Config.LSCustoms.EnableFreeTunning == true then
						for i=1, #neons, 1 do
							table.insert(elements, {
								label = '<span style="color:rgb(' .. neons[i].r .. ',' .. neons[i].g .. ',' .. neons[i].b .. ');">' .. neons[i].label,
								modType = k,
								modNum = { neons[i].r, neons[i].g, neons[i].b }
							})
						end
					else
						price = math.floor(vehiclePrice * v.price / 100)
						for i=1, #neons, 1 do
							table.insert(elements, {
								label = '<span style="color:rgb(' .. neons[i].r .. ',' .. neons[i].g .. ',' .. neons[i].b .. ');">' .. neons[i].label .. ' - <span style="color:green;">$' .. price .. '</span>',
								modType = k,
								modNum = { neons[i].r, neons[i].g, neons[i].b }
							})
						end
					end
				elseif v.modType == 'color1' or v.modType == 'color2' or v.modType == 'pearlescentColor' or v.modType == 'dashboardColor' or v.modType == 'interiorColor' or v.modType == 'wheelColor' or v.modType == 'xenonColor' then -- RESPRAYS
					local colors = GetColors(data.color)
					for j = 1, #colors, 1 do
						local _label = ''
						if Config.LSCustoms.EnableFreeTunning == true then
							_label = colors[j].label
							table.insert(elements, {label = _label, modType = k, modNum = colors[j].index})
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = colors[j].label .. ' - <span style="color:green;">$' .. price .. ' </span>'
							table.insert(elements, {label = _label, modType = k, modNum = colors[j].index})
						end
						
					end
				elseif v.modType == 'windowTint' then -- WINDOWS TINT
					for j = 1, 5, 1 do
						local _label = ''
						if j == currentMods.modHorns then
							_label = GetWindowName(j) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							if Config.LSCustoms.EnableFreeTunning == true then
								_label = GetWindowName(j)
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = GetWindowName(j) .. ' - <span style="color:green;">$' .. price .. ' </span>'
							end
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
					end
				elseif v.modType == 23 then -- WHEELS RIM & TYPE
					local props = {}

					props['wheels'] = v.wheelType
					ESX.Game.SetVehicleProperties(vehicle, props)

					local modCount = GetNumVehicleMods(vehicle, v.modType)
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(vehicle, v.modType, j)
						if modName ~= nil then
							local _label = ''
							if j == currentMods.modFrontWheels then
								_label = GetLabelText(modName) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
							else
								if Config.LSCustoms.EnableFreeTunning == true then
									_label = GetLabelText(modName)
								else
									price = math.floor(vehiclePrice * v.price / 100)
									_label = GetLabelText(modName) .. ' - <span style="color:green;">$' .. price .. ' </span>'
								end
							end
							table.insert(elements, {label = _label, modType = 'modFrontWheels', modNum = j, wheelType = v.wheelType, price = v.price})
						end
					end
				elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
					local modCount = GetNumVehicleMods(vehicle, v.modType) -- UPGRADES
					for j = 0, modCount, 1 do
						local _label = ''
						if j == currentMods[k] then
							_label = _U('level', j+1) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							if Config.LSCustoms.EnableFreeTunning == true then
								_label = _U('level', j+1)
							else
								price = math.floor(vehiclePrice * v.price[j+1] / 100)
								_label = _U('level', j+1) .. ' - <span style="color:green;">$' .. price .. ' </span>'
							end
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
						if j == modCount-1 then
							break
						end
					end
				elseif v.modType == 17 then -- TURBO
					local _label = ''
					if currentMods[k] then
						_label = 'Turbo - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
					else
						if Config.LSCustoms.EnableFreeTunning == true then
							_label = 'Turbo'
						else
							_label = 'Turbo - <span style="color:green;">$' .. math.floor(vehiclePrice * v.price[1] / 100) .. ' </span>'
						end
					end
					table.insert(elements, {label = _label, modType = k, modNum = true})
				else
					local modCount = GetNumVehicleMods(vehicle, v.modType) -- BODYPARTS
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(vehicle, v.modType, j)
						if modName ~= nil then
							local _label = ''
							if j == currentMods[k] then
								_label = GetLabelText(modName) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
							else
								if Config.LSCustoms.EnableFreeTunning == true then
									_label = GetLabelText(modName)
								else
									price = math.floor(vehiclePrice * v.price / 100)
									_label = GetLabelText(modName) .. ' - <span style="color:green;">$' .. price .. ' </span>'
								end
							end
							table.insert(elements, {label = _label, modType = k, modNum = j})
						end
					end
				end
			else
				if data.value == 'primaryRespray' or data.value == 'secondaryRespray' or data.value == 'pearlescentRespray' or data.value == 'modFrontWheelsColor' or data.value == 'interiorRespray' or data.value == 'dashboardRespray'  or data.value == 'xenonColor' then
					for i=1, #Config.LSCustoms.Colors, 1 do
						if data.value == 'primaryRespray' then
							table.insert(elements, {label = Config.LSCustoms.Colors[i].label, value = 'color1', color = Config.LSCustoms.Colors[i].value})
						elseif data.value == 'secondaryRespray' then
							table.insert(elements, {label = Config.LSCustoms.Colors[i].label, value = 'color2', color = Config.LSCustoms.Colors[i].value})
						elseif data.value == 'pearlescentRespray' then
							table.insert(elements, {label = Config.LSCustoms.Colors[i].label, value = 'pearlescentColor', color = Config.LSCustoms.Colors[i].value})
						elseif data.value == 'dashboardRespray' then
							table.insert(elements, {label = Config.LSCustoms.Colors[i].label, value = 'dashboardColor', color = Config.LSCustoms.Colors[i].value})
						elseif data.value == 'interiorRespray' then
							table.insert(elements, {label = Config.LSCustoms.Colors[i].label, value = 'interiorColor', color = Config.LSCustoms.Colors[i].value})
						elseif data.value == 'modFrontWheelsColor' then
							table.insert(elements, {label = Config.LSCustoms.Colors[i].label, value = 'wheelColor', color = Config.LSCustoms.Colors[i].value})
						elseif data.value == 'xenonColor' then
							table.insert(elements, {label = Config.LSCustoms.Colors[i].label, value = 'xenonColor', color = Config.LSCustoms.Colors[i].value})
						end
					end
				else
					for l,w in pairs(v) do
						if l ~= 'label' and l ~= 'parent' then
							local childs = HaveModChilds(vehicle, l)
							if(childs)then	
								table.insert(elements, {label = w , value = l})
							else
								table.insert(elements, {label = w .. ' <font color="red">No</font>', value = l})
							end	
						end
					end
				end
			end
			break
		end
	end

	table.sort(elements, function(a, b)
		return a.label < b.label
	end)
	OpenLSMenu(elements, menuName, menuTitle, parent)
end
function HaveModChilds(vehicle, value)
				
	for k,v in pairs(Config.LSCustoms.Menus) do

		if value == k then

			menuName  = k
			menuTitle = v.label
			parent    = v.parent

			if v.modType ~= nil then
				if v.modType == 22 then
					return true
				elseif v.modType == 'extras' then
					return true
				elseif v.modType == 'modCustomWheels' then
					return true
				elseif v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- disable neon
					return true
				elseif v.modType == 'color1' or v.modType == 'color2' or v.modType == 'pearlescentColor' or v.modType == 'dashboardColor' or v.modType == 'interiorColor' or v.modType == 'wheelColor' or v.modType == 'xenonColor' then
					return true
				elseif v.modType == 17 then
					return true
				elseif v.modType == 14 then -- HORNS
					return true
				elseif v.modType == 'plateIndex' then -- PLATES
					return true
				elseif v.modType == 22 then -- NEON
					return true
				elseif v.modType == 13 then -- modTransmission
					return  true
				elseif v.modType == 16 then -- modArmor
					return  true
				elseif v.modType == 17 then -- modTurbo
					return  true
				elseif v.modType == 11 then -- modEngine
					return  true
				elseif v.modType == 15 then -- modSuspension
					return  true
				elseif v.modType == 12 then -- modBrakes
					return  true
				elseif v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- NEON & SMOKE COLOR
					local neons = GetNeons()
					if(#neons > 1)then
						return true
					end
				elseif v.modType == 'color1' or v.modType == 'color2' or v.modType == 'pearlescentColor' or v.modType == 'dashboardColor' or v.modType == 'interiorColor' or v.modType == 'wheelColor' or v.modType == 'xenonColor' then -- RESPRAYS
					local colors = GetColors(data.color)
					if(#colors > 1)then
						return true
					end
				elseif v.modType == 'windowTint' then -- WINDOWS TINT
					return true
				elseif v.modType == 'modDriftkit' then
					return true
				elseif v.modType == 23 then -- WHEELS RIM & TYPE
					local entitymodel = GetEntityModel(vehicle)
					local isBike = IsThisModelABike(entitymodel)
					if ((isBike and value == 'modFrontWheelsType6') or (not isBike and value ~= 'modFrontWheelsType6')) then
						local props = {}
						props['wheels'] = v.wheelType
						ESX.Game.SetVehicleProperties(vehicle, props)
						local modCount = GetNumVehicleMods(vehicle, v.modType)
						if(modCount>1)then
							return true
						end
					end
				elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
					local modCount = GetNumVehicleMods(vehicle, v.modType) -- UPGRADES
					if(modCount>1)then
						return true
					end
				elseif v.modType == 17 then -- TURBO
					return true
				else
					local modCount = GetNumVehicleMods(vehicle, v.modType) -- BODYPARTS
					if(modCount>1)then
						return true
					end
				end
			else
				if value == 'primaryRespray' or value == 'secondaryRespray' or value == 'pearlescentRespray' or value == 'modFrontWheelsColor' or value == 'interiorRespray' or value == 'dashboardRespray' then
					if(#Config.LSCustoms.Colors > 1)then
						return true
					end
				else
					return true
				end
			end
			break
		end
	end
	return false
end
-- Blips
--[[
Citizen.CreateThread(function()
	for k,v in pairs(Config.LSCustoms.Zones) do
		local blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)
		SetBlipSprite(blip, 72)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.Name)
		EndTextCommandSetBlipName(blip)
	end
end)
]]--
-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPed = PlayerPedId()
		local sleep = true
		if IsPedInAnyVehicle(playerPed, false) then
			local coords      = GetEntityCoords(PlayerPedId())
			local currentZone = nil
			local zone 		  = nil
			local lastZone    = nil
			if PlayerIsMechanic() or Config.LSCustoms.IsMechanicJobOnly == false then
				sleep = false
				for k,v in pairs(Config.LSCustoms.Zones) do
					if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x then
						isInLSMarker  = true
						if(lsMenuIsShowed == false)then
							ESX.ShowFloatingHelpNotification(v.Hint, vector3(v.Pos.x, v.Pos.y, v.Pos.z +0.8))
						end
						break
					else
						isInLSMarker  = false
					end
				end
			end

			if IsControlJustReleased(0, Keys['E']) and not lsMenuIsShowed and isInLSMarker then
				if PlayerIsMechanic() then
					lsMenuIsShowed = true
					local vehicle = GetVehiclePedIsIn(playerPed, false)
					FreezeEntityPosition(vehicle, true)
			--		TriggerEvent('carhud:forceHide', true)
			--		TriggerEvent('esx_mole_vehicleinfo:show',vehicle)
			--		TriggerEvent('esx_status:forceRadarHide','esx_lscustom',true)
					myCar = ESX.Game.GetVehicleProperties(vehicle)
				--	ESX.TriggerServerCallback('esx_lscustom:isOwnerOfVehicleVip', function(isVip)
				--		if isVip then
				--			Config.LSCustoms.Menus['main']['modDriftkit'] = 'Drift Mod'
				--		end
				--		GetAction({value = 'main'})
				--	end, myCar.plate)
					ESX.UI.Menu.CloseAll()
					GetAction({value = 'main'})
				end
			end

			if isInLSMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
			end

			if not isInLSMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
			end

		end

		if sleep then
			Citizen.Wait(2000)
		end
	end
end)

-- Prevent Free Tunning Bug
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if lsMenuIsShowed then
			DisableControlAction(2, Keys['F1'], true)
			DisableControlAction(2, Keys['F2'], true)
			DisableControlAction(2, Keys['F3'], true)
			DisableControlAction(2, Keys['F6'], true)
			DisableControlAction(2, Keys['F7'], true)
			DisableControlAction(2, Keys['F'], true)
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(2000)
		end
	end
end)

function PlayerIsMechanic()
	for _,v in pairs(Config.LSCustoms.MechanicJobs) do
		if(PlayerData ~= nil) then
			if PlayerData.job ~= nil and PlayerData.job.name == v then
				return true
			end
		end
	end
	return false
end