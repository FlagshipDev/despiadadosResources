local ESX = nil

local weapons = {
    [GetHashKey('WEAPON_PISTOL')] = { supressor = GetHashKey('component_at_pi_supp_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE'), extendedclip = GetHashKey('COMPONENT_PISTOL_CLIP_02'), scope=nil, lspdtint = 3},
    [GetHashKey('WEAPON_KNUCKLE')] = { supressor = nil, flashlight = nil, grip = nil, weaponskin = GetHashKey('COMPONENT_KNUCKLE_VARMOD_BALLAS'), extendedclip = nil, scope=nil, lspdtint = GetHashKey("COMPONENT_KNUCKLE_VARMOD_DIAMOND")},
    [GetHashKey('WEAPON_SWITCHBLADE')] = { supressor = nil, flashlight = nil, grip = nil, weaponskin = GetHashKey('COMPONENT_SWITCHBLADE_VARMOD_VAR1'), extendedclip = nil, scope=nil, lspdtint = 5},
    [GetHashKey('WEAPON_PISTOL50')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE'), extendedclip= GetHashKey('COMPONENT_PISTOL50_CLIP_02'), scope=nil, lspdtint = 5 },
    [GetHashKey('WEAPON_COMBATPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = nil, extendedclip= GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02'), scope=nil, lspdtint = 5 },
    [GetHashKey('WEAPON_APPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE'), extendedclip= nil, scope=nil, lspdtint = 5 },
    [GetHashKey('WEAPON_HEAVYPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE'), extendedclip= nil, scope=nil, lspdtint = 5 },
    [GetHashKey('WEAPON_SMG')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_SMG_VARMOD_LUXE'), extendedclip= nil, scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO_02'), lspdtint = 5 },
    [GetHashKey('WEAPON_MICROSMG')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE'), extendedclip= GetHashKey('COMPONENT_MICROSMG_CLIP_02'), scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO'), lspdtint = 5 },
    [GetHashKey('WEAPON_ASSAULTSMG')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER'), extendedclip= nil, scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO'), lspdtint = 5 },
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'), extendedclip= nil, scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO'), lspdtint = 5 },
    [GetHashKey('WEAPON_CARBINERIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE'), extendedclip= nil, scope= GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'), lspdtint = 5 },
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE'), extendedclip= nil, scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL'), lspdtint = 5 },
    [GetHashKey('WEAPON_SPECIALCARBINE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil, extendedclip= nil, scope= GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'), lspdtint = 5 },
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil, extendedclip= nil, scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL'), lspdtint = 5 },
    [GetHashKey('WEAPON_PUMPSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_SR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = nil, extendedclip= nil, scope=nil, lspdtint = 5 },
    [GetHashKey('WEAPON_SNIPERRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = nil, grip = nil, weaponskin = GetHashKey('COMPONENT_SNIPERRIFLE_VARMOD_LUXE') , extendedclip= nil, scope=nil, lspdtint = 5 },
    [GetHashKey('WEAPON_COMBATPDW')] = { supressor = nil, flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil, extendedclip= nil, scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL'), lspdtint = 5 },

     --MK2
     [GetHashKey('WEAPON_PISTOL_MK2')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH_02'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_PI_RAIL'), lspdtint = 2},     [GetHashKey('WEAPON_SNSPISTOL_MK2')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH_03'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_SNSPISTOL_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_PI_RAIL_02'), lspdtint = 2},
     [GetHashKey('WEAPON_REVOLVER_MK2')] = { supressor = nil, flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_TRACER'), scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2'), lspdtint = 2},
     [GetHashKey('WEAPON_SMG_MK2')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_SMG_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL_SMG_MK2'), lspdtint = 2},
     [GetHashKey('WEAPON_PUMPSHOTGUN_MK2')] = { supressor = GetHashKey('COMPONENT_AT_SR_SUPP_03'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_CARBINERIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_COMBATMG_MK2')] = { supressor = nil, flashlight = nil, grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_HEAVYSNIPER_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_SCOPE_NV'), lspdtint = 2},
     [GetHashKey('WEAPON_MARKSMANRIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'), lspdtint = 2},
     [GetHashKey('WEAPON_PISTOL_MK2')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH_03'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_PI_RAIL_02'), lspdtint = 2},
     [GetHashKey('WEAPON_SNSPISTOL_MK2')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH_03'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_SNSPISTOL_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_PI_RAIL_02'), lspdtint = 5},
     [GetHashKey('WEAPON_REVOLVER_MK2')] = { supressor = nil, flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_TRACER'), scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2'), lspdtint = 2},
     [GetHashKey('WEAPON_SMG_MK2')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_SMG_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL_SMG_MK2'), lspdtint = 2},
     [GetHashKey('WEAPON_PUMPSHOTGUN_MK2')] = { supressor = GetHashKey('COMPONENT_AT_SR_SUPP_03'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_CARBINERIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_COMBATMG_MK2')] = { supressor = nil, flashlight = nil, grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
     [GetHashKey('WEAPON_HEAVYSNIPER_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_SCOPE_NV'), lspdtint = 2},
     [GetHashKey('WEAPON_MARKSMANRIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'), lspdtint = 2}


}
 --[[
-- ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
 
-- ESX, playerloaded
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)
 
-- Use item
RegisterNetEvent('eden_accesories:use')
AddEventHandler('eden_accesories:use', function( type )
    if weapons[GetSelectedPedWeapon(PlayerPedId())] and weapons[GetSelectedPedWeapon(PlayerPedId())][type] then
        if not HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type]) then
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
            ESX.ShowNotification(string.format('%s %s', "Has equipado un ", type))
        else
            RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
            ESX.ShowNotification(string.format('%s %s', "Has quitado de tu arma el ", type))
        end
    else
        ESX.ShowNotification(string.format('%s %s %s', 'El ', type, " no es compatible con tu arma"))
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 172) then
			if weapons[GetSelectedPedWeapon(PlayerPedId())] then
				for k,v in pairs(weapons) do
					if GetSelectedPedWeapon(PlayerPedId()) == k then
						if HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.suppressor) then
							TriggerServerEvent('eden_accesories:giveBack', 'suppressor')
							ESX.ShowNotification('Has quitado el silenciador de tu <span style="color:yellow">arma</span>')
							RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.suppressor)
						elseif HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.flashlight) then
							TriggerServerEvent('eden_accesories:giveBack', 'flashlight')
							ESX.ShowNotification('Has quitado la linterna de tu <span style="color:yellow">arma</span>')
							RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.flashlight)
						elseif HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.skin) then
							TriggerServerEvent('eden_accesories:giveBack', 'yusuf')
							ESX.ShowNotification('Has quitado el camuflaje de tu <span style="color:yellow">arma</span>')
							RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.skin)
						elseif HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.grip) then
							TriggerServerEvent('eden_accesories:giveBack', 'grip')
							ESX.ShowNotification('Has quitado la empuñadura de tu <span style="color:yellow">arma</span>')
							RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.grip)
						end
					end
				end
			end
		end
	end
end)]]--

RegisterCommand('qaccesorio', function(source, args, rawCommand)
    TriggerEvent('esx_flag_accesories:removeaccesories')
end, false)


ESX = nil
local IsDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

RegisterNetEvent('esx_flag_accesories:use')
AddEventHandler('esx_flag_accesories:use', function( type )
    if weapons[GetSelectedPedWeapon(PlayerPedId())] and weapons[GetSelectedPedWeapon(PlayerPedId())][type] then
        if not HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type]) then
            --ESX.TriggerServerCallback('esx_flag_accesories:removeItem', function(allowed)
            --    if(allowed)then
                    GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
                    ESX.ShowNotification(string.format('%s', "Has equipado el accesorio"))
                    TriggerServerEvent('esx_flag_accesories:remove', type)
              --  end
            --end,type)
        else
            RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
            ESX.ShowNotification(string.format('%s', "Has retirado el accesorio"))
            TriggerServerEvent('esx_flag_accesories:giveBack', item)
        end
    else
        ESX.ShowNotification(string.format('%s', 'Ese accesorio no se puede adherir a tu arma...'))
    end
end)

-- *******************************************************************************************************************************************************
--                                                                 PINTURA LSPD
-- *******************************************************************************************************************************************************


RegisterNetEvent('esx_flag_accesories:lspdtint')
AddEventHandler('esx_flag_accesories:lspdtint', function(type)
	if weapons[GetSelectedPedWeapon(PlayerPedId())] and weapons[GetSelectedPedWeapon(PlayerPedId())][type] then
        if not (GetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId())) == 5) then
            --ESX.TriggerServerCallback('esx_flag_accesories:removeItem', function(allowed)
            --    if(allowed)then
		    	    SetPedWeaponTintIndex(PlayerPedId(),  GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])
                    ESX.ShowNotification(string.format('%s', "Has equipado el accesorio"))
                    TriggerServerEvent('esx_flag_accesories:remove', type)
            --    end
            --end,type)
        else
            SetPedWeaponTintIndex(PlayerPedId(),  GetSelectedPedWeapon(PlayerPedId()), 0)
            ESX.ShowNotification(string.format('%s', "Has retirado el accesorio"))
            TriggerServerEvent('esx_flag_accesories:giveBack', item)
        end
    else
        ESX.ShowNotification(string.format('%s', 'Ese accesorio no se puede adherir a tu arma...'))
	end
end)


-- *******************************************************************************************************************************************************
--                                                         REMOVE ALL WEAPONS COMMAND
-- *******************************************************************************************************************************************************

RegisterNetEvent('esx_flag_accesories:removeaccesories')
AddEventHandler('esx_flag_accesories:removeaccesories', function(duration)
	local inventory = ESX.GetPlayerData().inventory

	local ped = PlayerPedId()
	local currentWeaponHash = GetSelectedPedWeapon(ped)

    if weapons[currentWeaponHash] then
        for k,v in pairs(weapons) do
            if HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.supressor) then
                TriggerServerEvent('esx_flag_accesories:giveBack', 'supressor')
				ESX.ShowNotification("Has retirado el silenciador de tu arma.")
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.supressor)
			elseif HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.flashlight) then
				TriggerServerEvent('esx_flag_accesories:giveBack', 'flashlight')
				ESX.ShowNotification("Has retirado la linterna de tu arma.")
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.flashlight)
			elseif HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.grip) then
				TriggerServerEvent('esx_flag_accesories:giveBack', 'grip')
				ESX.ShowNotification("Has retirado la empuñadura de tu arma.")
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.grip)
			elseif HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.weaponskin) then
				TriggerServerEvent('esx_flag_accesories:giveBack', 'weaponskin')
				ESX.ShowNotification("Has retirado la apariencia de arma de tu arma.")
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.weaponskin)
			elseif HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.extendedclip) then
				TriggerServerEvent('esx_flag_accesories:giveBack', 'extendedclip')
				ESX.ShowNotification("Has retirado el cargador extendido de tu arma.")
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.extendedclip)
			elseif HasPedGotWeaponComponent(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.scope) then
				TriggerServerEvent('esx_flag_accesories:giveBack', 'scope')
				ESX.ShowNotification("Has retirado la mirilla de tu arma.")
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v.scope)
			elseif (GetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId())) ~= 0 )then
				TriggerServerEvent('esx_flag_accesories:giveBack', 'lspdtint')
				ESX.ShowNotification("Has retirado el tinte de la LSPD de tu arma.")
				SetPedWeaponTintIndex(PlayerPedId(),  GetSelectedPedWeapon(PlayerPedId()), 0)
			end
		end
	end
end)