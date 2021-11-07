ESX = nil
local hasAlreadyEnteredMarker, lastZone, currentAction, currentActionMsg, hasPaid

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenShopMenuBarber()
	hasPaid = false

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = _U('valid_purchase'),
			align = 'bottom-right',
			elements = {
				{label = _U('no'),  value = 'no'},
				{label = _U('yes'), value = 'yes'}
		}}, function(data, menu)
			menu.close()

			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('esx_barbershop:checkMoney', function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
						end)

						TriggerServerEvent('esx_barbershop:pay')
						hasPaid = true
					else
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin) 
						end)

						ESX.ShowNotification(_U('not_enough_money'))
					end
				end)
			elseif data.current.value == 'no' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin) 
				end)
			end

			currentAction = 'shop_menu'
			currentActionMsg = _U('press_access')
		end, function(data, menu)
			menu.close()
			currentAction = 'shop_menu'
			currentActionMsg = _U('press_access')
		end)
	end, function(data, menu)
		menu.close()

		currentAction    = 'shop_menu'
		currentActionMsg  = _U('press_access')
	end, {
		'beard_1',
		'beard_2',
		'beard_3',
		'beard_4',
		'hair_1',
		'hair_2',
		'hair_color_1',
		'hair_color_2',
		'eyebrows_1',
		'eyebrows_2',
		'eyebrows_3',
		'eyebrows_4',
		'makeup_1',
		'makeup_2',
		'makeup_3',
		'makeup_4',
		'lipstick_1',
		'lipstick_2',
		'lipstick_3',
		'lipstick_4',
		'ears_1',
		'ears_2',
	})
end

local sonido = false

AddEventHandler('esx_barbershop:hasEnteredMarker', function(zone)
	if not sonido then
		PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
		sonido = true
	end

	currentAction = 'shop_menu'
	currentActionMsg = _U('press_access')
end)

AddEventHandler('esx_barbershop:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	currentAction = nil
	sonido = false
	if not hasPaid then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
	end
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in ipairs(Config.Barber.Shops) do
		local blip = AddBlipForCoord(v)

		SetBlipSprite (blip, 71)
		SetBlipColour (blip, 51)
		SetBlipScale(blip, 0.6)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('barber_blip'))
		EndTextCommandSetBlipName(blip)
	end
end)


-- Enter / Exit marker events and draw marker
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), nil, nil, true

		if currentAction ~= nil then
			a = 255
		else
			a = 125
		end

		for k,v in ipairs(Config.Barber.Shops) do
			local distance =  #(playerCoords - v)

			--if distance < Config.Barber.DrawDistance then
			--	letSleep = false
			--	DrawMarker(Config.Barber.MarkerType, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Barber.MarkerSize, Config.Barber.MarkerColor.r, Config.Barber.MarkerColor.g, Config.Barber.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
				if (Vdist2(playerCoords.x, playerCoords.y, playerCoords.z, v.x, v.y, v.z) < 50) then
					letSleep = false
					Draw3DText2({
						xyz={x = v.x, y = v.y, z = v.z+1.2}, --at your coords 
						text={
							content="Presiona ~y~E~s~ para acceder a la peluquería" --[[This is the string that you want to be displayed]],
							rgba={255 , 255, 255, a} --[[The color value of the text]],
							textOutline=true --[[ Text outline ]],
							scaleMultiplier=0.8, --[[ Text Size Multiplier]]
							font=0, --[[ Font type (0-5) ]]
						},
						perspectiveScale=0.5,
					})
				end
				if distance < 2.0 then
					isInMarker, currentZone = true, k
				end
			--end
		end

		if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
			hasAlreadyEnteredMarker, lastZone = true, currentZone
			TriggerEvent('esx_barbershop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_barbershop:hasExitedMarker', lastZone)
		end

		if letSleep then
			Citizen.Wait(2000)
		end
	end
end)

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		
		if currentAction then
			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			--ESX.ShowHelpNotification(currentActionMsg)
			--ESX.ShowFloatingHelpNotification(currentActionMsg, vector3(playerX, playerY, playerZ+0.8))
			if IsControlJustReleased(0, 38) then
				if currentAction == 'shop_menu' then
					OpenShopMenuBarber()
				end

				currentAction = nil
			end
		else
			Citizen.Wait(1000)
		end
	end
end)