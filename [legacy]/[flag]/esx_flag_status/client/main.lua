ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)                  

local xPlayerData                = {}

armourSet = false
isStressed = false
wasStressed = false
myStats = {}
myStatsPending = {}
CurrentStatusData = {}
local isPaused = false
local radarShowing = true;
local loopIsRuning = false;
local tickLoopIsRuning = false;
local cineon = false

local nivelAlerta =  0

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	xPlayerData = ESX.GetPlayerData()
	SetEntityMaxHealth(PlayerPedId(), 200) -- igualar mujeres
	TriggerServerEvent('updateDefcon')
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  xPlayerData.job = job
  forceRadarShow = false
  forceRadarShowScript = {}
end)


currentTimeUnderWater  = 0
maxTimeUnderwaterToRaiseStatsUp = 10
previousCarDamage = nil

function round(num) 
	if num >= 0 then return math.floor(num+.5) 
	else return math.ceil(num-.5) end
end

function IsPlayerInVehicle()
	local playerPed = PlayerPedId()
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	if(GetPedInVehicleSeat(playerVeh, -1) == playerPed) then
		return playerVeh
	end
	return false
end

local previousStatusData = nil
local lastDataChanged = false
local forceRadarShowScript = {}
local forceRadarShow = false
local forceRadarHideScript = {}
local forceRadarHide = false

Citizen.CreateThread(function()
	local isBigMapEnabled = false
	local showFullMap = false
	while true do
		Citizen.Wait(5)
		if IsControlJustReleased(0, 82) then -- `
			if isBigMapEnabled then
				showFullMap = not showFullMap
				if not showFullMap then
					isBigMapEnabled = false
				end
			else
				isBigMapEnabled = true
			end

			SetBigmapActive(isBigMapEnabled, showFullMap)
		end
	end
end)


function ForceShowRadar()
	if(#forceRadarShow > 0)then
		return true
	end
	return false
end

RegisterNetEvent('esx_status:forceRadarShow')
AddEventHandler('esx_status:forceRadarShow', function(sourceScript, mode)
	if(mode) then
		forceRadarShowScript[sourceScript] = true
	else
		forceRadarShowScript[sourceScript] = nil
	end
	forceRadarShow = false
	for k,v in pairs(forceRadarShowScript)do
		if(v)then
			forceRadarShow = true
		end
	end
end)

RegisterNetEvent('esx_status:forceRadarHide')
AddEventHandler('esx_status:forceRadarHide', function(sourceScript, mode)
	if(mode) then
		forceRadarHideScript[sourceScript] = true
	else
		forceRadarHideScript[sourceScript] = nil
	end
	forceRadarHide = false
	for k,v in pairs(forceRadarHideScript)do
		if(v)then
			forceRadarHide = true
		end
	end
end)


local hurt = false

Citizen.CreateThread(function()
    while true do
        Wait(2500)
        if GetEntityHealth(PlayerPedId()) <= 159 then
            setHurt()
        elseif hurt and GetEntityHealth(PlayerPedId()) > 160 then
            setNotHurt()
        end
    end
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(PlayerPedId(), "move_m@injured", true)
end

function setNotHurt()
    hurt = false
    ResetPedMovementClipset(PlayerPedId())
    ResetPedWeaponMovementClipset(PlayerPedId())
    ResetPedStrafeClipset(PlayerPedId())
end

local knockedOut = false
local wait = math.random(10,60)
local count = 60


Citizen.CreateThread(function()
	while true do
		local myPed = PlayerPedId()
		local isPedInMelee = IsPedInMeleeCombat(myPed)
		local sleep = true
		if(isPedInMelee or knockedOut)then
			sleep = false
			if isPedInMelee then
				if GetEntityHealth(myPed) < 135 then
					--SetPlayerInvincible(PlayerId(), true)
					SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
					ESX.ShowNotification("~r~¡Estás inconsciente!")
					wait = 15
					knockedOut = true
					SetEntityHealth(myPed, 136)
				end
			end
			if knockedOut == true then
				--SetPlayerInvincible(PlayerId(), true)
				DisablePlayerFiring(PlayerId(), true)
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
				ResetPedRagdollTimer(myPed)
				
				if wait >= 0 then
					count = count - 1
					if count == 0 then
						count = 60
						wait = wait - 1
						--SetEntityHealth(myPed, GetEntityHealth(myPed)+4)
					end
				else
					ESX.ShowNotification("~r~¡Vuelves a estar consciente!")
					--SetPlayerInvincible(PlayerId(), false)
					knockedOut = false
				end
			end
			Wait(1)
		end
		if sleep then
			Wait(2500)
		end
	end
end)

Citizen.CreateThread(function()
	local enabled = false
	SetTimecycleModifier("hud_def_desat_Trevor")
			Wait(3000)
			SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
	while true do
		Wait(1500)
		if knockedOut == true and enabled == false then
			enabled = true
			SetTimecycleModifier('BarryFadeOut')
			SetTimecycleModifierStrength(math.min(0.1 / 10, 0.6))
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
			
		elseif(knockedOut == false and enabled == true)then
			enabled = false
			SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
		end

	end
end)
