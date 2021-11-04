-- /ref for police
-- Made by Crishe

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('ref:addBlip')
AddEventHandler('ref:addBlip', function(id)
	if isPolice() then
		local id = GetPlayerFromServerId(id)
		local pedUser = GetPlayerPed(id)
		local blip = GetBlipFromEntity(pedUser)

		if not DoesBlipExist(blip) then
			local blipPoli = AddBlipForEntity(pedUser)

			SetBlipSprite(blipPoli, 1)
			Citizen.InvokeNative( 0x5FBCA48327B914DF, blipPoli, true)
			SetBlipAsShortRange(blipPoli, false)
			SetBlipColour(blipPoli, 3)
			SetBlipScale(blipPoli, 1.1)

			SetBlipNameToPlayerName(blipPoli, id)

			if pedUser == PlayerPedId() then
				ESX.ShowNotification('[LSPD] Se ha activado la referencia.')
			else
				ESX.ShowNotification('[LSPD] Un oficial ha activado su referencia.')
			end
		else
			RemoveBlip(blip)
			if pedUser == PlayerPedId() then
				ESX.ShowNotification('[LSPD] Has desactivado la referencia.')
			else
				ESX.ShowNotification('[LSPD] Un oficial ha desactivado su referencia.')
			end
		end
	elseif isSheriff() then
		local id = GetPlayerFromServerId(id)
		local pedUser = GetPlayerPed(id)
		local blip = GetBlipFromEntity(pedUser)

		if not DoesBlipExist(blip) then
			local blipPoli = AddBlipForEntity(pedUser)

			SetBlipSprite(blipPoli, 1)
			Citizen.InvokeNative( 0x5FBCA48327B914DF, blipPoli, true)
			SetBlipAsShortRange(blipPoli, false)
			SetBlipColour(blipPoli, 56)
			SetBlipScale(blipPoli, 1.1)

			SetBlipNameToPlayerName(blipPoli, id)

			if pedUser == PlayerPedId() then
				ESX.ShowNotification('[BCSD] Se ha activado la referencia.')
			else
				ESX.ShowNotification('[BCSD] Un oficial ha activado su referencia.')
			end
		else
			RemoveBlip(blip)
			if pedUser == PlayerPedId() then
				ESX.ShowNotification('[BCSD] Has desactivado la referencia.')
			else
				ESX.ShowNotification('[BCSD] Un oficial ha desactivado su referencia.')
			end
		end
	end
end)

function isPolice()
    if PlayerData ~= nil then
        local isPolice = false
        if PlayerData.job.name == 'police' then
            isPolice = true
		end
        return isPolice
    end
end

function isSheriff()
    if PlayerData ~= nil then
        local isSheriff = false
        if PlayerData.job.name == 'sheriff' then
            isSheriff = true
		end
        return isSheriff
    end
end


function showNotification(string)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(string)
	DrawNotification(false, false)
end

RegisterCommand("ref", function (src, args, raw)

	if isPolice() then
		TriggerServerEvent("ref:reference")
	end
	if isSheriff() then
		TriggerServerEvent("ref:reference2")
	end
end, false)