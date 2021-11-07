ESX          = nil
local IsDead = false
local IsAnimated = false
local weapons = {
	'WEAPON_KNIFE',
	'WEAPON_HAMMER',
	'WEAPON_BAT',
	'WEAPON_GOLFCLUB',
	'WEAPON_CROWBAR',
	'WEAPON_COMBATPISTOL',
	'WEAPON_STUNGUN',
	'WEAPON_BOTTLE',
	'WEAPON_DAGGER',
	'WEAPON_HATCHET',
	'WEAPON_MACHETE',
	'WEAPON_BATTLEAXE',
	'WEAPON_POOLCUE',
	'WEAPON_WRENCH',
	'WEAPON_PISTOL',
	'WEAPON_APPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_REVOLVER',
	'WEAPON_SNSPISTOL',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_VINTAGEPISTOL',
	'WEAPON_MICROSMG',
	'WEAPON_SMG',
	'WEAPON_ASSAULTSMG',
	'WEAPON_MINISMG',
	'WEAPON_MACHINEPISTOL',
	'WEAPON_COMBATPDW',
	'WEAPON_PUMPSHOTGUN',
	'WEAPON_SAWNOFFSHOTGUN',
	'WEAPON_ASSAULTSHOTGUN',
	'WEAPON_BULLPUPSHOTGUN',
	'WEAPON_HEAVYSHOTGUN',
	'WEAPON_ASSAULTRIFLE',
	'WEAPON_CARBINERIFLE',
	'WEAPON_ADVANCEDRIFLE',
	'WEAPON_SPECIALCARBINE',
	'WEAPON_BULLPUPRIFLE',
	'WEAPON_COMPACTRIFLE',
	'WEAPON_MG',
	'WEAPON_COMBATMG',
	'WEAPON_GUSENBERG',
	'WEAPON_SNIPERRIFLE',
	'WEAPON_HEAVYSNIPER',
	'WEAPON_MARKSMANRIFLE',
	'WEAPON_GRENADELAUNCHER',
	'WEAPON_RPG',
	'WEAPON_STINGER',
	'WEAPON_MINIGUN',
	'WEAPON_DIGISCANNER',
	'WEAPON_FIREWORK',
	'WEAPON_MUSKET',
	'WEAPON_HOMINGLAUNCHER',
	'WEAPON_PROXMINE',
	'WEAPON_FLAREGUN',
	'WEAPON_MARKSMANPISTOL',
	'WEAPON_RAILGUN',
	'WEAPON_DBSHOTGUN',
	'WEAPON_AUTOSHOTGUN',
	'WEAPON_COMPACTLAUNCHER',
	'WEAPON_PIPEBOMB',
	'WEAPON_DOUBLEACTION',
	"WEAPON_PISTOL_MK2",
	"WEAPON_SNSPISTOL_MK2",	
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_SMG_MK2",
}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
	TriggerEvent('esx_status:set', 'stress', 100000)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)
	TriggerEvent('esx_status:set', 'stress', 100000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#CFAD0F', function(status)
		return true
	end, function(status)
		status.remove(50)
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0C98F1', function(status)
		return true
	end, function(status)
		status.remove(34)
	end)
		
	TriggerEvent('esx_status:registerStatus', 'stress', 100000, '#cadfff', function(status)
		return false
	end, function(status)
		status.add(20)
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(3000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth
			local stressVal  = 0

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			TriggerEvent('esx_status:getStatus', 'stress', function(status)
				stressVal = status.val
			end)

			if health ~= prevHealth then
				SetEntityHealth(playerPed, health)
			end
		end
	end)
end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_burger_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:chicles')
AddEventHandler('esx_basicneeds:chicles', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_burger_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
			TriggerEvent("esx_status:remove","stress", 50000)
		end)

	end
end)


RegisterNetEvent('esx_basicneeds:analgesico')
AddEventHandler('esx_basicneeds:analgesico', function()
	if not IsAnimated then
		IsAnimated = true

		ESX.ShowNotification('Te has tomado <span style="color:yellow">1x</span> analgésico, poco a poco te vas sientiendo mejor...')
		canAnalgesicoAgain = false
		SetTimeout(60000, function()
			canAnalgesicoAgain = true
		end)
		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			ESX.Streaming.RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_eating_donut@male@idle_a', 'idle_c', 8.0, -8, -1, 49, 0, 0, 0, 0)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
			end)
			local health = GetEntityHealth(PlayerPedId())
			while health ~= 175 do
				Wait(2000)
				SetEntityHealth(PlayerPedId(), health+15)	
			end	
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:diazepan')
AddEventHandler('esx_basicneeds:diazepan', function()
	if not IsAnimated then
		IsAnimated = true
		ESX.ShowNotification('Te has tomado <span style="color:yellow">1x</span> Diazepán, poco a poco te está bajando el estrés...')
		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			ESX.Streaming.RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_eating_donut@male@idle_a', 'idle_c', 8.0, -8, -1, 49, 0, 0, 0, 0)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
			end)
			TriggerEvent("esx_status:remove","stress", 450000)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	onDrink(prop_name)
end)

function onDrink(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)
	end
end


RegisterNetEvent('esx_basicneeds:onDrinkBottle')
AddEventHandler('esx_basicneeds:onDrinkBottle', function(prop_name)
	print(prop_name)
	onDrinkBottle(prop_name)
end)
function onDrinkBottle(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_amb_beer_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 57005)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.145, -0.15, -0.055,270.0, 0.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 5000, 0, 1, true, true, true)

				Citizen.Wait(6000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)
	end
end


RegisterNetEvent('esx_extraitems:bulletproof')
AddEventHandler('esx_extraitems:bulletproof', function(valor)
--	SetEntityMaxHealth(playerPed, 50)
	local playerPed = PlayerPedId()

	SetPedArmour(playerPed, valor)

end)

------ Municion --------

RegisterNetEvent('esx_clip:clipcli')
AddEventHandler('esx_clip:clipcli', function()
  	ped = PlayerPedId()
	if IsPedArmed(ped, 4) then
    	hash=GetSelectedPedWeapon(ped)
		for i = 1, #weapons do
			if hash~= nil then
				if hash == GetHashKey(weapons[i]) then
					if GetAmmoInPedWeapon(ped, hash) >= 250 then
						if weapons[i] == 'WEAPON_COMBATPISTOL' or weapons[i] == 'WEAPON_PISTOL' or weapons[i] == 'WEAPON_FLAREGUN' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,12)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_PISTOL50' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,9)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_HEAVYPISTOL' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,18)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_SNSPISTOL' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,6)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_MICROSMG' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,12)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_MINISMG' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,20)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_SMG' or weapons[i] == 'WEAPON_ASSAULTSMG' or weapons[i] == 'WEAPON_COMBATPDW' or weapons[i] == 'WEAPON_GUSENBERG' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,30)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_PUMPSHOTGUN' or weapons[i] == 'WEAPON_SAWNOFFSHOTGUN' or weapons[i] == 'WEAPON_ASSAULTSHOTGUN' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,8)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_BULLPUPSHOTGUN' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,16)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_HEAVYSHOTGUN' or weapons[i] == 'WEAPON_COMBATSHOTGUN' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,6)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_ASSAULTRIFLE' or weapons[i] == 'WEAPON_CARBINERIFLE' or weapons[i] == 'WEAPON_ADVANCEDRIFLE' or weapons[i] == 'WEAPON_SPECIALCARBINE' or weapons[i] == 'WEAPON_BULLUPRIFLE' or weapons[i] == 'WEAPON_COMPACTRIFLE' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,30)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_SNIPERRIFLE' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,10)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_SNSPISTOL_MK2' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,6)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_PISTOL_MK2' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,12)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						elseif weapons[i] == 'WEAPON_CARBINERIFLE_MK2' or weapons[i] == 'WEAPON_SMG_MK2' then
							TriggerServerEvent('esx_clip:remove')
							AddAmmoToPed(PlayerPedId(), hash,30)
							ESX.ShowNotification("Has utilizado un ~b~cargador")
						end
					else
						ESX.ShowNotification('Has alcanzado el máximo de balas')
					end
				end
			else
				ESX.ShowNotification("No tiene cargador en la mano")
			end
		end

	else
    	ESX.ShowNotification("No tienes un arma en la mano.")
  	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx_basicneeds:OnSmokeCigarett')
AddEventHandler('esx_basicneeds:OnSmokeCigarett', function(source)
	SmokeAnimation()
end)

inSmokeAnim = false
canSmokeAgain = true

function SmokeAnimation()
	if canSmokeAgain == false then
		ESX.ShowNotification('Acabas de fumar... ¿quieres reventarte los pulmones?')
		return
	end
	if inSmokeAnim == false then
		local ped = PlayerPedId()
		local anim = "amb@world_human_aa_smoke@male@idle_a"
		local dict = "idle_a"
		if IsPedSittingInAnyVehicle(ped) then
			if IsPedMale(ped) then
				anim = "amb@world_human_aa_smoke@male@idle_a"
				dict = "idle_a"
			else
				anim = "amb@world_human_leaning@female@smoke@idle_a"
				dict = "idle_a"
			end
			RequestAnimDict(anim)
			local j = 0
        	while not HasAnimDictLoaded(anim) and j < 20 do
				 Citizen.Wait(10)
				 j = j+1
			   end
			TaskPlayAnim( ped, anim, dict, 8.0, -8.0, -1, 49, 0, false, false, false )
			inSmokeAnim = true
		else
			local escenario = "WORLD_HUMAN_SMOKING"
			TaskStartScenarioInPlace(ped, escenario, 0, true)
			inSmokeAnim = true
		end

		SetTimeout(30000, function()
			if IsPedUsingScenario(ped, "WORLD_HUMAN_SMOKING") or IsEntityPlayingAnim(ped, anim, dict, 3) then
				ESX.ShowNotification('Fumar te ha relajado, en breve sentiras el efecto de la nicotina')
				canSmokeAgain = false
				SetTimeout(60000, function()
					canSmokeAgain = true
				end)
				if IsEntityPlayingAnim(ped, anim, dict, 3) then
					ClearPedTasks(ped)
				elseif IsPedUsingScenario(ped, "WORLD_HUMAN_SMOKING") then
					ClearPedTasks(ped)
				end
				SetTimeout(1000, function()
					TriggerEvent("esx_status:remove","stress", 200000)
				end)
			else
				ESX.ShowNotification('Has tirado el cigarro antes de acabarlo, y no hay cosa que mas te estrese que desperdiciar un cigarro...')
				TriggerEvent("esx_status:add","stress", 20000)
			end
			if prop ~= nil then
				DeleteObject (prop)
				prop = nil
			end
			inSmokeAnim = false
		end)
	else
		ESX.ShowNotification('Ya estas fumando, ¿quieres reventarte los pulmones?')
	end

	local playerPed = PlayerPedId()
end
