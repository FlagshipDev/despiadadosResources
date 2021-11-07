ESX = nil

local badu = { x = -712.83, y = -906.52, z = 24.54 }
local hypnonema = { x = -1663.37, y = -889.76, z = 8.65}
local gym = { x = -1201.37, y = -1568.98, z = 4.91}
local baduGroove = { x = -54.76, y = -1759.84, z = 28.97}
local estres = 0
local PlayerData = {}
local isStressed = false
local stMult = 1
local stRemove = 0

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)


TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(10000)
        GetChillValue()
        TriggerEvent('esx_status:getStatus','stress',function(status)
            estres = status.val
            if status.val > 800000 then
                isStressed = true
            elseif status.val < 800000 then
                isStressed = false
            end
            Citizen.Wait(1000)
            if isStressed then
                wasStressed = true
                if IsPedMale(PlayerPedId()) then
                    playMovement("move_m@depressed@a")
                else
                    playMovement("move_f@depressed@a")
                end
            else
                if(wasStressed)then
                    wasStressed = false
                    ResetPedMovementClipset(PlayerPedId(), 0)
                end
            end
        end)
	end
end)

Citizen.CreateThread(function()
	while true do
	  	Citizen.Wait(1)
	  	if isStressed == true then
			DisableControlAction(0,21,true) -- disable sprint
			DisableControlAction(0,22,true) -- disable jump
			DisableControlAction(0,170,true) -- disable f3
        else
            Citizen.Wait(4000)
		end
	end
end)

function playMovement(clipset)
	RequestAnimSet(clipset)
	local i = 0
	while not HasAnimSetLoaded(clipset) and i < 25 do
	  Citizen.Wait(10)
	  i = i+1
	end
	SetPedMovementClipset(PlayerPedId(), clipset, true)
end

Citizen.CreateThread(function()
    while true do
        Wait(5000)
        TriggerServerEvent("stress:add", 500)
    end
end)

Citizen.CreateThread(function() -- Nişan almak // Aiming with a weapon
    while true do
        local ped = PlayerPedId()
        local status = GetPedConfigFlag(ped, 78, 1)
        local status1 = IsPedArmed(ped, 4)
        local status2 = IsPedShooting(ped)
        local status3 = GetPedAlertness(ped)        
        local status4 = IsPedInMeleeCombat(ped)

        if status then
            TriggerServerEvent("stress:add", 4000)
            Citizen.Wait(5000)
        elseif status1 then
            TriggerServerEvent("stress:add", 3000)
            Citizen.Wait(15000)
        elseif status2 then
            TriggerServerEvent("stress:add", 6*stMult)
            Citizen.Wait(10000)
        elseif status3 == 1 then
            TriggerServerEvent("stress:add", 3*stMult)
            Citizen.Wait(10000)
        elseif status4 then
            TriggerServerEvent("stress:add", 2*stMult)
            Citizen.Wait(5000)
        elseif GetDistanceBetweenCoords(badu.x, badu.y, badu.z, GetEntityCoords(ped)) < 20.0  then
            TriggerServerEvent("stress:remove", 1000*stRemove)
            Citizen.Wait(1000)
        elseif GetDistanceBetweenCoords(hypnonema.x, hypnonema.y, hypnonema.z, GetEntityCoords(ped)) < 50.0 then
            TriggerServerEvent("stress:remove", 1000*stRemove)
            Citizen.Wait(1000)
        elseif GetDistanceBetweenCoords(baduGroove.x, baduGroove.y, baduGroove.z, GetEntityCoords(ped)) < 40.0 then
            TriggerServerEvent("stress:remove", 1000*stRemove)
            Citizen.Wait(1000)
        elseif GetDistanceBetweenCoords(gym.x, gym.y, gym.z, GetEntityCoords(ped)) < 50.0 then
            TriggerServerEvent("stress:remove", 1000*stRemove)
            Citizen.Wait(1000)
        else
            Citizen.Wait(500)
        end
    end
end)

--[[Citizen.CreateThread(function() -- Elinde silah tutarken (melee ve patlayıcılar kategorisi hariç) // Holding a weapon (except melee and explosives category)
    while true do
        local ped = PlayerPedId()
        local status = IsPedArmed(ped, 4)

        if status then
            TriggerServerEvent("stress:add", 3000)
            Citizen.Wait(15000)
        else
            Citizen.Wait(1)
        end
    end
end)]]--

Citizen.CreateThread(function() -- Elinde silah tutarken (melee ve patlayıcılar kategorisi hariç) // Holding a weapon (except melee and explosives category)

    local entrarBadu = true
    local salirBadu = false 
    local entrarHypno = true
    local salirHypno = false 
    local entrarHospi = true
    local salirHospi = false
    local estresado = true
    local noEstresado = false
    local entrarBaduGroove = true
    local salirBaduGroove = false

    while true do
        Citizen.Wait(500)

        if estres > 800000 and estresado then
            ESX.ShowNotification('Estás empezando a ~b~estresarte~s~, ve a descansar.')
            estresado = false
            noEstresado = true
        elseif estres < 500000 and noEstresado then
            ESX.ShowNotification('Ya estás más ~b~tranquilo~s~')
            estresado = true
            noEstresado = false
        end


        -- Notificaciones Badu
        if GetDistanceBetweenCoords(badu.x, badu.y, badu.z, GetEntityCoords(PlayerPedId())) < 20.0 and entrarBadu then
            ESX.ShowNotification('Has entrado en una zona de ~y~relax~s~, tu ~b~estrés~s~ baja lentamente...')
            salirBadu = true
            entrarBadu = false
            TriggerEvent('añadirChill')
        elseif GetDistanceBetweenCoords(badu.x, badu.y, badu.z, GetEntityCoords(PlayerPedId())) > 20.0  and salirBadu  then
            ESX.ShowNotification('Has salido de la zona de ~y~relax')
            salirBadu = false
            entrarBadu = true
        end

        -- Notificaciones Badu Groove
        if GetDistanceBetweenCoords(baduGroove.x, baduGroove.y, baduGroove.z, GetEntityCoords(PlayerPedId())) < 20.0 and entrarBaduGroove then
            ESX.ShowNotification('Has entrado en una zona de ~y~relax~s~, tu ~b~estrés~s~ baja lentamente...')
            salirBaduGroove = true
            entrarBaduGroove = false
            TriggerEvent('añadirChill')
        elseif GetDistanceBetweenCoords(baduGroove.x, baduGroove.y, baduGroove.z, GetEntityCoords(PlayerPedId())) > 20.0  and salirBaduGroove  then
            ESX.ShowNotification('Has salido de la zona de ~y~relax')
            salirBaduGroove = false
            entrarBaduGroove = true
        end

         -- Notificaciones gym
         if GetDistanceBetweenCoords(gym.x, gym.y, gym.z, GetEntityCoords(PlayerPedId())) < 50.0 and entrarHospi then
            ESX.ShowNotification('Has entrado en una zona de ~y~relax~s~, tu ~b~estrés~s~ baja lentamente...')
            salirHospi = true
            entrarHospi = false
            TriggerEvent('añadirChill')
        elseif GetDistanceBetweenCoords(gym.x, gym.y, gym.z, GetEntityCoords(PlayerPedId())) > 50.0  and salirHospi  then
            ESX.ShowNotification('Has salido de la zona de ~y~relax')
            salirHospi = false
            entrarHospi = true
        end

        -- Notificiones Hyponema
        if GetDistanceBetweenCoords(hypnonema.x, hypnonema.y, hypnonema.z, GetEntityCoords(PlayerPedId())) < 50.0 and entrarHypno then
            ESX.ShowNotification('Has entrado en una zona de ~y~relax~s~, tu ~b~estrés~s~ baja lentamente...')
            salirHypno = true
            entrarHypno = false
            TriggerEvent('añadirChill')
        elseif GetDistanceBetweenCoords(hypnonema.x, hypnonema.y, hypnonema.z, GetEntityCoords(PlayerPedId())) > 50.0 and salirHypno then
            ESX.ShowNotification('Has salido de la zona de ~y~relax')
            salirHypno = false
            entrarHypno = true
        end

    end

end)

RegisterNetEvent('añadirChill')
AddEventHandler('añadirChill', function()
    local random = math.random(0, 40)
    if random < 5 then
        exports["esx_skillsystem"]:UpdateSkill("Chill", 0.25)
    end
    GetChillValue()
end)

function GetChillValue()
    chill = exports["esx_skillsystem"]:GetCurrentSkill("Chill")

    if chill["Current"] ~= 0 then
        stMult = 1000 - (chill["Current"]*10)
        stRemove = 1 + (chill["Current"]/100)
    else 
        stMult = 1
        stRemove = 1
    end
end


--[[Citizen.CreateThread(function()
    while true do
        Wait(1)
        local ped = PlayerPedId()

        if GetDistanceBetweenCoords(badu.x, badu.y, badu.z, GetEntityCoords(ped)) < 20.0  then
            TriggerServerEvent("stress:remove", 1000*stRemove)
            Citizen.Wait(1000)
        elseif GetDistanceBetweenCoords(hypnonema.x, hypnonema.y, hypnonema.z, GetEntityCoords(ped)) < 50.0 then
            TriggerServerEvent("stress:remove", 1000*stRemove)
            Citizen.Wait(1000)
        elseif GetDistanceBetweenCoords(baduGroove.x, baduGroove.y, baduGroove.z, GetEntityCoords(ped)) < 40.0 then
            TriggerServerEvent("stress:remove", 1000*stRemove)
            Citizen.Wait(1000)
        elseif GetDistanceBetweenCoords(gym.x, gym.y, gym.z, GetEntityCoords(ped)) < 50.0 then
            TriggerServerEvent("stress:remove", 1000*stRemove)
            Citizen.Wait(1000)
        else
            Citizen.Wait(1)
        end
    end

end)   ]]--

Citizen.CreateThread(function(source)
    local _source = source
    local xPlayer = PlayerData
    local identifier = xPlayer.identifier

    while true do
        Citizen.Wait(10000)
        TriggerServerEvent("stress:guardarEstres", estres)
    end
end)





--[[Citizen.CreateThread(function() -- Ateş ederken // While shooting
    while true do
        local ped = PlayerPedId()
        local status2 = IsPedShooting(ped)

        --TriggerServerEvent("stress:add", 10)
        if status then
            TriggerServerEvent("stress:add", 6*stMult)
            Citizen.Wait(10000)
        else
            Citizen.Wait(1)
        end
    end
end)

Citizen.CreateThread(function() -- Silah, yumruk vs sesi duyarsa / çalışmıyor gibi, büyük ihtimal npc lerde çalışan bir şey çünkü sadece npc ler bu tür olaylara tepki veriyor // Heard gunshot, melee hit etc., seems not to work, since player peds don't act like NPC's ?
    while true do
        local ped = PlayerPedId()
        local status = GetPedAlertness(ped)

        if status == 1 then
            TriggerServerEvent("stress:add", 3*stMult)
            Citizen.Wait(10000)
        else
            Citizen.Wait(1)
        end
    end
end)

Citizen.CreateThread(function() -- Yumruk atmak, yumruk yemek veya yakın mesafe silahı ile birine kitlenmek // Aiming with a melee, hitting with a melee or getting hit by a melee
    while true do
        local ped = PlayerPedId()
        local status = IsPedInMeleeCombat(ped)

        if status then
            TriggerServerEvent("stress:add", 2*stMult)
            Citizen.Wait(5000)
        else
            Citizen.Wait(1)
        end
    end
end)

Citizen.CreateThread(function() -- Paraşütle skydive // Skydiving with parachute
    while true do
        local ped = PlayerPedId()
        local status = GetPedParachuteState(ped)

        if status == 0 then -- paraşütle dalış // freefall with chute (not falling without it)
            TriggerServerEvent("stress:add", 5*stMult)
            Citizen.Wait(5000)
        elseif status == 1 or status == 2 then -- paraşüt açık // opened chute
            TriggerServerEvent("stress:add", 3*stMult)
            Citizen.Wait(5000)
        else
            Citizen.Wait(5000) -- kontrol hızı düşük çünkü paraşüt atlaması çok olan bir şey değil // refresh rate is low on this one since it's not so common to skydive in RP servers
        end
    end
end)]]--

--[[
Citizen.CreateThread(function() -- uyuma animasyonu // Sleeping animation || Bunu stres ekleyici veya azaltıcı animasyonlar eklerken template olarak kullanabilirsiniz. // You can use this as a template if you want to make an animation stressful or stress reliever
    while true do
        local ped = PlayerPedId()
        local status = IsEntityPlayingAnim(ped, "timetable@tracy@sleep@", "idle_c", 3)

        if status then
            Citizen.Wait(20000)
            TriggerServerEvent("stress:remove", 200000)
        else
            Citizen.Wait(1) -- refresh rate
        end
    end
end)
]]--

function AddStress(method, value, seconds)
    if method:lower() == "instant" then
        TriggerServerEvent("stress:add", value)
    elseif method:lower() == "slow" then
        local count = 0
        repeat
            TriggerServerEvent("stress:add", value/seconds)
            count = count + 1
            Citizen.Wait(1000)
        until count == seconds
    end
end

function RemoveStress(method, value, seconds)
    if method:lower() == "instant" then
        TriggerServerEvent("stress:remove", value)
    elseif method:lower() == "slow" then
        local count = 0
        repeat
            TriggerServerEvent("stress:remove", value/seconds)
            count = count + 1
            Citizen.Wait(1000)
        until count == seconds
    end
end

RegisterNetEvent("stress:heal")
AddEventHandler("stress:heal", function()
    TriggerServerEvent("stress:remove", 1000000)
end)

