ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local names = {
    "",
    "",
    "",
};

local names2 = {
    "",
    "",
    "",
};
local helpTextToDrawCoord = nil
lastMsg = ''
lastMsgCount = 0
function HelpText(msg)
    if(lastMsg ~= msg and lastMsgCount < 10)then
        lastMsgCount = lastMsgCount +1
    elseif(lastMsg ~= msg)then
        lastMsg = msg
        lastMsgCount = 0
    else

   -- SetFloatingHelpTextStyle(1, 2, 23, -1, 3, 0) SetFloatingHelpTextStyle(1, 1, 5, -1, 3, 0)
   SetFloatingHelpTextStyle(1, 2, 5, -1, 3, 0)
   SetFloatingHelpTextWorldPosition(1, vector3(helpTextToDrawCoord.x-0.6, helpTextToDrawCoord.y, helpTextToDrawCoord.z + 0.65))
    AddTextEntry('esxFloatingHelpNotificationCarDors', msg)
    BeginTextCommandDisplayHelp('esxFloatingHelpNotificationCarDors')
    EndTextCommandDisplayHelp(2, false, false, -1)
    end
end


local helpTextToDraw = nil
local closestVehicel = nil
local closestDoor = nil
Citizen.CreateThread(function()
    while true do
        local sleep = true
        if(helpTextToDraw ~= nil) then
            sleep = false
            HelpText(helpTextToDraw)
           -- Draw3DText2({
           --     xyz={x = helpTextToDrawCoord.x, y = helpTextToDrawCoord.y, z = helpTextToDrawCoord.z+0.4}, --at your coords 
           --     text={
           --         content=helpTextToDraw --[[This is the string that you want to be displayed]],
           --         rgb={255 , 255, 255} --[[The color value of the text]],
           --         textOutline=true --[[ Text outline ]],
           --         scaleMultiplier=1, --[[ Text Size Multiplier]]
           --         font=0, --[[ Font type (0-5) ]]
           --     },
           --     perspectiveScale=0.5,
           --     radius=30 --[[ The radius of units until the text disappears/reappears ]],
           -- })
            if (IsControlJustPressed(1, 38)) then
                TaskEnterVehicle(PlayerPedId(), closestVehicel, 10000, closestDoor, 1.0, 1, 0)
            end
        end
        if sleep then
            Wait(2000)
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while ESX == nil do
		Citizen.Wait(0)
	end
    while true do
        helpTextToDraw = nil
        closestVehicel = nil
        closestDoor = nil
        local ped = PlayerPedId();
        local pco = GetEntityCoords(ped)
        local veh, Distance = ESX.Game.GetClosestVehicle()
        if (DoesEntityExist(veh) and Distance < 5.4 and IsPedInAnyVehicle(ped) == false and GetSelectedPedWeapon(ped) ~= 883325847) then
            local currentVehPlate = ESX.Math.Trim(GetVehicleNumberPlateText(veh))
            if(starts_with(currentVehPlate, "Job") == false)then
                for i = 1, GetNumberOfVehicleDoors(veh), 1 do
                    local coord = GetEntryPositionOfDoor(veh, i)
                    if (Vdist2(pco, coord) < 1.2 and not DoesEntityExist(GetPedInVehicleSeat(veh, i - 1)) and GetVehicleDoorLockStatus(veh) ~= 2) then
                        closestVehicel = veh
                        closestDoor = i - 1
                        local entitymodel = GetEntityModel(veh)
                        local isBike = IsThisModelABike(entitymodel)
                        if (names[closestDoor] and not isBike and not IsThisModelABoat(GetEntityModel(veh))) then
                            helpTextToDraw = "Presiona ~y~E~s~ para entrar por esta puerta" .. names[closestDoor]
                            helpTextToDrawCoord = coord
                        elseif (names2[closestDoor] and isBike and IsThisModelABoat(GetEntityModel(veh))) then
                            helpTextToDraw = "Presiona ~y~E~s~ para entrar por esta puerta" .. names2[closestDoor]
                            helpTextToDrawCoord = coord
                        else
                            helpTextToDraw = "Presiona ~y~E~s~ para entrar por esta puerta"
                            helpTextToDrawCoord = coord
                        end
                        break
                    end
                end
            end
        end
        Citizen.Wait(1500)
    end
end)


local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
  	while true do
		Citizen.Wait(0)
        local sleep = true
	       if IsPedInAnyVehicle(PlayerPedId(), false) and disableShuffle then
            sleep = false
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), 0) == PlayerPedId() then
				if GetIsTaskActive(PlayerPedId(), 165) then
                    SetPedIntoVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), 0)
				end
			end
		end
        if sleep then
            Wait(2000)
        end
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

RegisterCommand("conducir", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false) --False, allow everyone to run it

function starts_with(str, start)
    return str:sub(1, #start) == start
end