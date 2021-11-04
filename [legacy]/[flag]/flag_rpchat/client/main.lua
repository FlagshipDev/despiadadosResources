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


RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(title, message, color, coords)
	local source = PlayerId()

	local sourceCoords, targetCoords = GetEntityCoords(GetPlayerPed(source)), coords

	--print(sourceCoords)
	--print(coords)
	if GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
		--print('es menor, manda mensaje')
	else
		--print('es mayor, no manda mensaje')
		return
	end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessageGritar')
AddEventHandler('esx_rpchat:sendProximityMessageGritar', function(title, message, color, coords)
	local source = PlayerId()

	local sourceCoords, targetCoords = GetEntityCoords(GetPlayerPed(source)), coords

	--print(sourceCoords)
	--print(coords)
	if GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 50 then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
		--print('es menor, manda mensaje')
	else
		--print('es mayor, no manda mensaje')
		return
	end
end)


RegisterNetEvent('esx_rpchat:sendProximityMessageSusurrar')
AddEventHandler('esx_rpchat:sendProximityMessageSusurrar', function(title, message, color, coords)
	local source = PlayerId()

	local sourceCoords, targetCoords = GetEntityCoords(GetPlayerPed(source)), coords

	--print(sourceCoords)
	--print(coords)
	if GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 5 then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
		--print('es menor, manda mensaje')
	else
		--print('es mayor, no manda mensaje')
		return
	end
end)

RegisterNetEvent('esx_rpchat:rpol')
AddEventHandler('esx_rpchat:rpol', function(title, message, color, job)
	local DataJob = ESX.GetPlayerData()
	if job == "police" and DataJob.job.name == 'police' then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	elseif job == "sheriff" and DataJob.job.name == 'sheriff' then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	elseif job == "ambulance" and DataJob.job.name == 'ambulance' then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	end
end)

RegisterNetEvent('esx_rpchat:rpol1')
AddEventHandler('esx_rpchat:rpol1', function(title, message, color, job)
	local DataJob = ESX.GetPlayerData()
	if job == "police" and DataJob.job.name == 'police' then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	elseif job == "sheriff" and DataJob.job.name == 'sheriff' then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	elseif job == "ambulance" and DataJob.job.name == 'ambulance' then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	end
end)

RegisterNetEvent('esx_rpchat:rms')
AddEventHandler('esx_rpchat:rms', function(title, message, color, coords)
	local DataJob = ESX.GetPlayerData()
	if DataJob.job.name == 'police' or DataJob.job.name == 'sheriff' or DataJob.job.name == 'ambulance' then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	end
end)


RegisterNetEvent ('localsenddw')
AddEventHandler ('localsenddw', function (id, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(id)
	local _id = id

	if PlayerData.job ~= nil and PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff' then
		TriggerEvent ('chat:addMessage', {args = { _U('poli_prefix'),' - ^4('.._id..')'}})
	else
		
	end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessageMegafono')
AddEventHandler('esx_rpchat:sendProximityMessageMegafono', function(title, message, color, coords)
	local source = PlayerId()

	local sourceCoords, targetCoords = GetEntityCoords(GetPlayerPed(source)), coords

	--print(sourceCoords)
	--print(coords)
	if GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 50 then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
		--print('es menor, manda mensaje')
	else
		--print('es mayor, no manda mensaje')
		return
	end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessageDo')
AddEventHandler('esx_rpchat:sendProximityMessageDo', function(title, message, color, coords)
	local source = PlayerId()

	local sourceCoords, targetCoords = GetEntityCoords(GetPlayerPed(source)), coords

	if GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	else
		return
	end
end)

Citizen.CreateThread(function()

	TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/polidispo',  _U('poli_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/anon',  _U('anonimo_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/badu',   _U('badu_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/ammu',   _U('ammu_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/ooc',   _U('ooc_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/msg',  'Mensaje privado',   { { name = 'ID + Mensaje', help = 'Mensaje privado a alguien' } } )
	--TriggerEvent('chat:addSuggestion', '/news', _U('news_help'), { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/oop', _U('oop_help'), { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/a', _U('civil_help'), { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')  
		TriggerEvent('chat:removeSuggestion', '/ooc')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
		TriggerEvent('chat:removeSuggestion', '/badu')
		TriggerEvent('chat:removeSuggestion', '/ammu')
		TriggerEvent('chat:removeSuggestion', '/msg')
		--TriggerEvent('chat:removeSuggestion', '/oop')
		TriggerEvent('chat:removeSuggestion', '/anon')
		TriggerEvent('chat:removeSuggestion', '/ooc')
		--TriggerEvent('chat:removeSuggestion', '/news')
		TriggerEvent('chat:removeSuggestion', '/a')
	end
end)



RegisterNetEvent('esx_rpchat:poliDispo')
AddEventHandler('esx_rpchat:poliDispo', function(id)
	local _id = id
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)
	
	if target == source then
		TriggerEvent('chat:addMessage', { color = {0, 153, 204}, args = { '^0[ ^1Info ^0]: Ahora te contestarán con las unidades disponibles.' }})
	elseif PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff' then
		TriggerEvent('chat:addMessage', { color = {0, 153, 204}, args = { _U('poli_prefix'),' - ^4('.._id..')' }})
	end
end)

local toggleApuntar

RegisterCommand('apuntar', function(source, args)
	if args[1] then
		if tonumber(args[1]) == 0 or tonumber(args[1]) == 1 or tonumber(args[1]) == 2 then
			if tonumber(args[1]) == 0 then
				SetWeaponAnimationOverride(PlayerPedId(), GetHashKey("default"))
			elseif tonumber(args[1]) == 1 then
				SetWeaponAnimationOverride(PlayerPedId(), GetHashKey("Gang1H"))
			elseif tonumber(args[1]) == 2 then
				SetWeaponAnimationOverride(PlayerPedId(), GetHashKey("Hillbilly"))
			end
		else
			TriggerEvent('chat:addMessage', { color = {0, 153, 204}, args = { '^1LeyendasRP : Uso incorrecto. /apuntar {0, 1, 2}. 0 = Normal, 1 = Gang, 2 = Cowboy' }})
		end
	else
		TriggerEvent('chat:addMessage', { color = {0, 153, 204}, args = { '^1LeyendasRP : Uso incorrecto. /apuntar {0, 1, 2}. 0 = Normal, 1 = Gang, 2 = Cowboy' }})
	end
end)


local font = 0 -- Font of the text
local time = 350 -- Duration of the display of the text : 500 ~= 13sec
local msgQueue = {}

RegisterNetEvent('esx_rpchat:drawOnHead')
AddEventHandler('esx_rpchat:drawOnHead', function(text, color, source)
    Display(GetPlayerFromServerId(source), text, color)
end)

function Display(mePlayer, text, color)
	local timer = 0
	if msgQueue[mePlayer] == nil then
		msgQueue[mePlayer] = {}
    end
	table.insert(msgQueue[mePlayer], { txt = text , c= color, tim = 0 })
    while tablelength(msgQueue[mePlayer]) > 0 do
        Wait(0)
        timer = timer + 1
		local coords = GetEntityCoords(GetPlayerPed(mePlayer), false)
		local lineNumber = 1
		for k, v in pairs(msgQueue[mePlayer]) do
			DrawText3D(coords['x'], coords['y'], coords['z']+lineNumber, v.txt, v.c)
			lineNumber = lineNumber + 0.12
			if(v.tim > time)then
				msgQueue[mePlayer][k] = nil
			else
				v.tim= v.tim + 1
			end
		end
    end
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function DrawText3D(x,y,z, text, color)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

----------------------

local c = Config -- Pre-load the config
local lang = Languages[Config.language] -- Pre-load the language
local peds = {}

-- Localization
local GetGameTimer = GetGameTimer

-- @desc Draw text in 3d
-- @param coords world coordinates to where you want to draw the text
-- @param text the text to display
local function draw3dText(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    -- Format the text
    SetTextColour(c.color.r, c.color.g, c.color.b, c.color.a)
    SetTextScale(0.0, c.scale * scale)
    SetTextFont(c.font)
    SetTextDropshadow(0, 0, 0, 255, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()

end

-- @desc Display the text above the head of a ped
-- @param ped the target ped
-- @param text the text to display
local function displayText(ped, text)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local targetPos = GetEntityCoords(ped)
    local dist = #(playerPos - targetPos)
    local los = HasEntityClearLosToEntity(playerPed, ped, 17)

    if dist <= c.dist and los then
        local exists = peds[ped] ~= nil

        peds[ped] = {
            time = GetGameTimer() + c.time,
            text = text
        }

        if not exists then
            local display = true

            while display do
                Wait(0)
                local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 1.0)
                draw3dText(pos, peds[ped].text)
                display = GetGameTimer() <= peds[ped].time
            end

            peds[ped] = nil
        end

    end
end

-- @desc Trigger the display of teh text for a player
-- @param text text to display
-- @param target the target server id
local function onShareDisplay(text, target)
    local player = GetPlayerFromServerId(target)
    if player ~= -1 or target == GetPlayerServerId(PlayerId()) then
        local ped = GetPlayerPed(player)
        displayText(ped, text)
    end
end

-- Register the event
RegisterNetEvent('3dme:shareDisplay', onShareDisplay)
