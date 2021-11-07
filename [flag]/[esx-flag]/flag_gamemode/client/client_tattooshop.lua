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

ESX								= nil
local currentTattoos			= {}
local cam						= -1
local HasAlreadyEnteredMarker	= false
local CurrentAction				= nil
local CurrentActionMsg			= ''
local CurrentActionData			= {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('skinchanger:modelLoaded', function()
	ESX.TriggerServerCallback('esx_tattooshop:requestPlayerTattoos', function(tattooList)
		if tattooList then
			for _,k in pairs(tattooList) do
				ApplyPedOverlay(PlayerPedId(), GetHashKey(k.collection), GetHashKey(Config.Tattoo.TattooList[k.collection][k.texture].nameHash))
			end

			currentTattoos = tattooList
		end
	end)
end)

function OpenShopMenuTattoo()
	local elements = {}

	for _,k in pairs(Config.Tattoo.TattooCategories) do
		table.insert(elements, {label= k.name, value = k.value})
	end

	if DoesCamExist(cam) then
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tattoo_shop', {
		title    = _U('tattoos'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		local currentLabel, currentValue = data.current.label, data.current.value

		if data.current.value ~= nil then
			elements = { {label = _U('go_back_to_menu'), value = nil} }

			for i,k in pairs(Config.Tattoo.TattooList[data.current.value]) do
				table.insert(elements, {
					label = _U('tattoo_item', i, _U('money_amount', ESX.Math.GroupDigits(k.price))),
					value = i,
					price = k.price
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tattoo_shop_categories', {
				title    = _U('tattoos') .. ' | '..currentLabel,
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local price = data2.current.price
				if data2.current.value ~= nil then

					ESX.TriggerServerCallback('esx_tattooshop:purchaseTattoo', function(success)
						if success then
							table.insert(currentTattoos, {collection = currentValue, texture = data2.current.value})
						end
					end, currentTattoos, price, {collection = currentValue, texture = data2.current.value})

				else
					OpenShopMenuTattoo()
					RenderScriptCams(false, false, 0, 1, 0)
					DestroyCam(cam, false)
					cleanPlayer()
				end

			end, function(data2, menu2)
				menu2.close()
				RenderScriptCams(false, false, 0, 1, 0)
				DestroyCam(cam, false)
				setPedSkin()
			end, function(data2, menu2) -- when highlighted
				if data2.current.value ~= nil then
					drawTattoo(data2.current.value, currentValue)
				end
			end)
		end
	end, function(data, menu)
		menu.close()
		setPedSkin()
	end)
end

Citizen.CreateThread(function()
	for k,v in pairs(Config.Tattoo.Zones) do
		local blip = AddBlipForCoord(v)
		SetBlipSprite(blip, 75)
		SetBlipScale  (blip, 0.7)
		SetBlipColour(blip, 1)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(_U('tattoo_shop'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords, canSleep = GetEntityCoords(PlayerPedId()), true

		if CurrentAction ~= nil then
			a = 255
		else
			a = 125
		end

		for k,v in pairs(Config.Tattoo.Zones) do
			if (Vdist2(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 50) then
				canSleep = false
				Draw3DText2({
					xyz={x = v.x, y = v.y, z = v.z+1.2}, --at your coords 
					text={
						content="Presiona ~y~E~s~ para acceder al estudio de tatuajes" --[[This is the string that you want to be displayed]],
						rgba={255 , 255, 255, a} --[[The color value of the text]],
						textOutline=true --[[ Text outline ]],
						scaleMultiplier=0.8, --[[ Text Size Multiplier]]
						font=0, --[[ Font type (0-5) ]]
					},
					perspectiveScale=0.5,
				})
			end
			--if (Config.Tattoo.Type ~= -1 and GetDistanceBetweenCoords(coords, v, true) < Config.Tattoo.DrawDistance) then
			--	DrawMarker(Config.Tattoo.Type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Tattoo.Size.x, Config.Tattoo.Size.y, Config.Tattoo.Size.z, Config.Tattoo.Color.r, Config.Tattoo.Color.g, Config.Tattoo.Color.b, 100, false, true, 2, false, false, false, false)
			--	canSleep = false
			--end
		end


		if canSleep then
			Citizen.Wait(2000)
		end
	end
  end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)

		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker = false
		local currentZone, LastZone

		for k,v in pairs(Config.Tattoo.Zones) do
			if GetDistanceBetweenCoords(coords, v, true) < 1.5 then
				isInMarker  = true
				currentZone = 'TattooShop'
				LastZone    = 'TattooShop'
			end
		end

		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_tattooshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_tattooshop:hasExitedMarker', LastZone)
		end
	end
end)

local sonido = false


AddEventHandler('esx_tattooshop:hasEnteredMarker', function(zone)
	if zone == 'TattooShop' then
		CurrentAction     = 'tattoo_shop'
		CurrentActionMsg  = _U('tattoo_shop_prompt')
		CurrentActionData = {zone = zone}
	end
	if not sonido then
		PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
		sonido = true
	end
end)

AddEventHandler('esx_tattooshop:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
	sonido = false
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
		
		if CurrentAction ~= nil then
			--ESX.ShowHelpNotification(CurrentActionMsg)
			--ESX.ShowFloatingHelpNotification(CurrentActionMsg, vector3(playerX, playerY, playerZ+0.8))
			if IsControlJustReleased(0, Keys['E']) then
				if CurrentAction == 'tattoo_shop' then
					OpenShopMenuTattoo()
				end
				CurrentAction = nil
			end
		else
			Citizen.Wait(1500)
		end
	end
end)

function setPedSkin()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)

	Citizen.Wait(1000)

	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(PlayerPedId(), GetHashKey(k.collection), GetHashKey(Config.Tattoo.TattooList[k.collection][k.texture].nameHash))
	end
end

function drawTattoo(current, collection)
	SetEntityHeading(PlayerPedId(), 297.7296)
	ClearPedDecorations(PlayerPedId())

	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(PlayerPedId(), GetHashKey(k.collection), GetHashKey(Config.Tattoo.TattooList[k.collection][k.texture].nameHash))
	end

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 0,
				tshirt_1 = 15,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 15,
				torso_2  = 0,
				pants_1  = 55,
				pants_2  = 0
			})
		else
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 1,
				tshirt_1 = 14,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 101,
				torso_2  = 0,
				pants_1  = 15,
				pants_2  = 0
			})
		end
	end)

	ApplyPedOverlay(PlayerPedId(), GetHashKey(collection), GetHashKey(Config.Tattoo.TattooList[collection][current].nameHash))

	if not DoesCamExist(cam) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

		SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
		SetCamRot(cam, 0.0, 0.0, 0.0)
		SetCamActive(cam, true)
		RenderScriptCams(true, false, 0, true, true)
		SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
	end

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))

	SetCamCoord(cam, x + Config.Tattoo.TattooList[collection][current].addedX, y + Config.Tattoo.TattooList[collection][current].addedY, z + Config.Tattoo.TattooList[collection][current].addedZ)
	SetCamRot(cam, 0.0, 0.0, Config.Tattoo.TattooList[collection][current].rotZ)
end

function cleanPlayer()
	ClearPedDecorations(PlayerPedId())

	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(PlayerPedId(), GetHashKey(k.collection), GetHashKey(Config.Tattoo.TattooList[k.collection][k.texture].nameHash))
	end
end
