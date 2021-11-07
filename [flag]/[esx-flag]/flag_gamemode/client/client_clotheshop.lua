ESX = nil
local GUI, CurrentActionData = {}, {}
GUI.Time = 0
local LastZone, CurrentAction, CurrentActionMsg
local HasPayed, HasLoadCloth, HasAlreadyEnteredMarker = false, false, false

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenShopMenuClotheShop()
  local elements = {}

  table.insert(elements, {label = _U('shop_clothes'),  value = 'shop_clothes'})
  --table.insert(elements, {label = _U('player_clothes'), value = 'player_dressing'})
  --table.insert(elements, {label = _U('suppr_cloth'), value = 'suppr_cloth'})

  ESX.UI.Menu.CloseAll()

 -- ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_main', {
  --    title    = _U('shop_main_menu'),
  --    align    = 'bottom-right',
  --    elements = elements,
 --   }, function(data, menu)
--	menu.close()

  --    if data.current.value == 'shop_clothes' then
--			HasPayed = false

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)

		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
				title = _U('valid_this_purchase'),
				align = 'bottom-right',
				elements = {
					{label = _U('yes'), value = 'yes'},
					{label = _U('no'), value = 'no'},
				}
			}, function(data, menu)

				menu.close()

				if data.current.value == 'yes' then

					ESX.TriggerServerCallback('esx_eden_clotheshop:checkMoney', function(hasEnoughMoney)

						if hasEnoughMoney then

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)

							TriggerServerEvent('esx_eden_clotheshop:pay')

							HasPayed = true

							ESX.TriggerServerCallback('esx_eden_clotheshop:checkPropertyDataStore', function(foundStore)

								if foundStore then

									ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'save_dressing', {
											title = _U('save_in_dressing'),
											align = 'bottom-right',
											elements = {
												{label = _U('yes'), value = 'yes'},
												{label = _U('no'),  value = 'no'},
											}
										}, function(data2, menu2)

											menu2.close()

											if data2.current.value == 'yes' then

												ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
														title = _U('name_outfit'),
													}, function(data3, menu3)

														menu3.close()

														TriggerEvent('skinchanger:getSkin', function(skin)
															TriggerServerEvent('esx_eden_clotheshop:saveOutfit', data3.value, skin)
														end)

														ESX.ShowNotification(_U('saved_outfit'))

													end, function(data3, menu3)
														menu3.close()
													end)
											end
										end)
								end
							end)

						else

							TriggerEvent('esx_skin:getLastSkin', function(skin)
								TriggerEvent('skinchanger:loadSkin', skin)
							end)

							ESX.ShowNotification(_U('not_enough_money'))
						end
					end)
				end

				if data.current.value == 'no' then

					TriggerEvent('esx_skin:getLastSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
					end)
				end

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = _U('press_menu')
				CurrentActionData = {}

			end, function(data, menu)

				menu.close()

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = _U('press_menu')
				CurrentActionData = {}

			end)
	end, function(data, menu)
			menu.close()

			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('press_menu')
			CurrentActionData = {}

	end, {
		'tshirt_1',
		'tshirt_2',
		'torso_1',
		'torso_2',
		'decals_1',
		'decals_2',
		'arms',
		'arms_2',
		'pants_1',
		'pants_2',
		'shoes_1',
		'shoes_2',
		'chain_1',
		'chain_2',
		'mask_1',
		'mask_2',
		'bproof_1',
		'bproof_2,',
		'helmet_1',
		'helmet_2',
		'watches_1',
		'watches_2',
		'glasses_1',
		'glasses_2',
		'bags_1',
		'bags_2',
		'ears_1',
		'ears_2'
	})
    --  end

     --[[ if data.current.value == 'player_dressing' then
		
        ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
          local elements = {}

          for i=1, #dressing, 1 do
            table.insert(elements, {label = dressing[i], value = i})
          end

          ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
              title    = _U('player_clothes'),
              align    = 'bottom-right',
              elements = elements,
            }, function(data, menu)

              TriggerEvent('skinchanger:getSkin', function(skin)

                ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)

                  TriggerEvent('skinchanger:loadClothes', skin, clothes)
                  TriggerEvent('esx_skin:setLastSkin', skin)

                  TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                  end)
				  
				  ESX.ShowNotification(_U('loaded_outfit'))
				  HasLoadCloth = true
                end, data.current.value)
              end)
            end, function(data, menu)
              menu.close()
			  
			  CurrentAction     = 'shop_menu'
			  CurrentActionMsg  = _U('press_menu')
			  CurrentActionData = {}
            end
          )
        end)
      end
	  
	  if data.current.value == 'suppr_cloth' then
		ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
			local elements = {}

			for i=1, #dressing, 1 do
				table.insert(elements, {label = dressing[i], value = i})
			end
			
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'supprime_cloth', {
              title    = _U('suppr_cloth'),
              align    = 'bottom-right',
              elements = elements,
            }, function(data, menu)
			menu.close()
				TriggerServerEvent('esx_eden_clotheshop:deleteOutfit', data.current.value)
				  
				ESX.ShowNotification(_U('supprimed_cloth'))

            end, function(data, menu)
              menu.close()
			  
			  CurrentAction     = 'shop_menu'
			  CurrentActionMsg  = _U('press_menu')
			  CurrentActionData = {}
            end)
		end)
	  end
  --  end, function(data, menu)

  --    menu.close()

  --    CurrentAction     = 'room_menu'
  --    CurrentActionMsg  = _U('press_menu')
  --    CurrentActionData = {}
  --  end)]]--
end

local sonido = false 

AddEventHandler('esx_eden_clotheshop:hasEnteredMarker', function(zone)

	if not sonido then
		PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
		sonido = true
	end

	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = _U('press_menu')
	CurrentActionData = {}

end)

AddEventHandler('esx_eden_clotheshop:hasExitedMarker', function(zone)
	
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
	sonido = false
	if not HasPayed then
		if not HasLoadCloth then 

			TriggerEvent('esx_skin:getLastSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end
	end
end)

-- Create Blips
Citizen.CreateThread(function()

	for i=1, #Config.Clothes.Shops, 1 do

		if Config.Clothes.Shops[i].x == 462.94 and Config.Clothes.Shops[i].y == -996.49 and Config.Clothes.Shops[i].z == 29.75 then
			print(".")
		elseif Config.Clothes.Shops[i].x == 472.39 and Config.Clothes.Shops[i].y == -992.7 and Config.Clothes.Shops[i].z == 24.54 then
			print(".")
		elseif Config.Clothes.Shops[i].x == -1108.441 and Config.Clothes.Shops[i].y == -992.7 and Config.Clothes.Shops[i].z == 24.54 then
			
		else
			local blip = AddBlipForCoord(Config.Clothes.Shops[i].x, Config.Clothes.Shops[i].y, Config.Clothes.Shops[i].z)
			SetBlipSprite (blip, 73)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.6)
			SetBlipColour (blip, 47)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('clothes'))
			EndTextCommandSetBlipName(blip)
		end
	end
end)

local isInMarker  = false
-- Display markers
--[[Citizen.CreateThread(function()
	while true do

		Wait(0)
		local sleep = true
		local coords = GetEntityCoords(PlayerPedId())
		local playerPed = PlayerPedId()
		local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))

		for k,v in pairs(Config.Clothes.Zones) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.Clothes.DrawDistance) then
				sleep = false
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				--ESX.ShowFloatingHelpNotification('Hola', vector3(playerX, playerY, playerZ))
			end
		end
		if sleep then
			Wait(1500)
		end
	end
end)]]--


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

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
        local sleep = true
		if isInMarker == true then
			a = 255
		elseif isInMarker == false then
			a = 125
		end
        for k, v in pairs(Config.Clothes.Shops) do 
            if (Vdist2(coords.x, coords.y, coords.z, v.x, v.y, v.z) < 125) then
                sleep = false
                Draw3DText2({
                    xyz={x = v.x, y = v.y, z = v.z+1.2}, --at your coords 
                    text={
                        content="Presiona ~y~E~s~ para acceder a la tienda de ropa" --[[This is the string that you want to be displayed]],
                        rgba={255 , 255, 255, a} --[[The color value of the text]],
                        textOutline=true --[[ Text outline ]],
                        scaleMultiplier=0.8, --[[ Text Size Multiplier]]
                        font=0, --[[ Font type (0-5) ]]
                    },
                    perspectiveScale=0.5,
                })
            end
        end
        
        if sleep then
            Wait(2000)
    	end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		Wait(0)
		local sleep = true
		local coords      = GetEntityCoords(PlayerPedId())
		local currentZone = nil
		isInMarker  = false

		for k,v in pairs(Config.Clothes.Zones) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2.0) then
				sleep = false
				isInMarker  = true
				currentZone = k
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('esx_eden_clotheshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_eden_clotheshop:hasExitedMarker', LastZone)
		end
		if sleep then
			Wait(2000)
		end
	end
end)

-- Key controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then
			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			--ESX.ShowFloatingHelpNotification(CurrentActionMsg, vector3(playerX, playerY, playerZ+0.8))
			--SetTextComponentFormat('STRING')
			--AddTextComponentString(CurrentActionMsg)
			--DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  38) and (GetGameTimer() - GUI.Time) > 300 then
				if CurrentAction == 'shop_menu' then
					OpenShopMenuClotheShop()
				end

				CurrentAction = nil
				GUI.Time      = GetGameTimer()
			end
		else
			Wait(1500)
		end
	end
end)


local soymrx = false


RegisterNetEvent('resetskin:resetSkin')
AddEventHandler('resetskin:resetSkin', function()
    
    local uniforms = {
  
          male = {
              ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
              ['torso_1'] = 260,   ['torso_2'] = 23,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 11,
              ['pants_1'] = 26,   ['pants_2'] = 6,
              ['shoes_1'] = 1,   ['shoes_2'] = 0,
              ['chain_1'] = 0,  ['chain_2'] = 0
          },
          female = {
              ['tshirt_1'] = 14,   ['tshirt_2'] = 0,
              ['torso_1'] = 269,    ['torso_2'] = 23,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 9,
              ['pants_1'] = 0,   ['pants_2'] = 8,
              ['shoes_1'] = 1,    ['shoes_2'] = 1,
              ['chain_1'] = 0,    ['chain_2'] = 0
          }

    }
    local playerPed = PlayerPedId()
    local lastHealth = GetEntityHealth(playerPed) 
    local defaultModel = GetHashKey('a_m_y_stbla_02')
    SetEntityVisible(PlayerPedId(), false)
    RequestModel(defaultModel)
    while not HasModelLoaded(defaultModel) do
        Citizen.Wait(100)
    end
    SetPlayerModel(PlayerId(), defaultModel)
    
    
    SetPedDefaultComponentVariation(PlayerPedId())
    SetPedRandomComponentVariation(PlayerPedId(), true)
    SetModelAsNoLongerNeeded(defaultModel)
    FreezeEntityPosition(PlayerPedId(), false)
 
    Citizen.Wait(300)

    TriggerEvent('skinchanger:getSkin', function(skin)
  
        skin['sex'] = changeSex(skin['sex']) --cambiamos sexo
        TriggerEvent('skinchanger:loadSkin', skin)
        Citizen.Wait(300)
        skin['sex'] = changeSex(skin['sex'])
        TriggerEvent('skinchanger:loadSkin', skin)
        ESX.ShowNotification('Skin <span style="color:yellow">recargada</span>')
    end)
    Citizen.Wait(1000)
    TriggerEvent('skinchanger:getSkin', function(skin)
  
        if skin.sex == 0 then
            if uniforms.male ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, uniforms.male)
            else
                ESX.ShowNotification('<span style="color:yellow">Error</span>')
            end
        else
            if uniforms.female ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, uniforms.female)
            else
                ESX.ShowNotification('<span style="color:yellow">Error</span>')
            end
        end
    end)
    Citizen.Wait(300)

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    SetEntityHealth(PlayerPedId(), lastHealth)
    SetEntityVisible(PlayerPedId(), true)
    ClearPedTasksImmediately(PlayerPedId())

    TriggerEvent('esx_tattooshop:cleanPlayer')


    
end)

function changeSex(sex)

    if sex == 0 then sex = 1 else sex = 0 end

    return sex

end

--RegisterCommand("fixpj", function(source, args, raw)
--    TriggerEvent("resetskin:resetSkin")
--end, false) 

RegisterNetEvent('lester:skin')
AddEventHandler('lester:skin', function()
    

    if soymrx == false then
        
        local modelHash = GetHashKey('player_one')
        local isMalePed = false

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

            if skin.sex == 1 then
                modelHash = GetHashKey('player_one')
                isMalePed = true
            end

            ESX.Streaming.RequestModel(0x9B22DBAF, function()
                SetPlayerModel(PlayerId(), 0x9B22DBAF)
                SetModelAsNoLongerNeeded(0x9B22DBAF)
                SetPedDefaultComponentVariation(PlayerPedId())

                if isMalePed == true then
                    local playerPed = PlayerPedId()
                    SetPedComponentVariation	(playerPed, 8, 0, 0, 2)
                    SetPedComponentVariation	(playerPed, 11,	0, 0, 2)
                    SetPedComponentVariation	(playerPed, 3, 1, 0, 2)
                    SetPedComponentVariation	(playerPed, 4, 0, 0, 2)
                    SetPedPropIndex	(playerPed, 0, 0, 0, 2)
                end

                TriggerEvent('esx:restoreLoadout')
            end)
        end)
            soymrx = true
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
            soymrx = false
    end

end)
