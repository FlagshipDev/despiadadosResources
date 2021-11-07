local hunger = 0
local thirst = 0
local stress = 0
local voiceRadius = 50
local istalking = false

local voiceToggled = false
local UIHidden = false
local UIRadar = false
local divingT = false

local rangeMode = 2
local lastRange = 0
local range
local icon


--Cricle Radar
Citizen.CreateThread(
    function()
        DisplayAmmoThisFrame(false)
        Citizen.Wait(1000)

        SendNUIMessage(
            {
                type = "Init",
                healthIcon = Config.HealthIcon,
                armorIcon = Config.ArmorIcon,
                foodIcon = Config.FoodIcon,
                thirstIcon = Config.ThirstIcon,
                fourthIcon = Config.FourthIcon,
                showid = Config.DisplayId,
                showstress = Config.DisplayStress,
                showvoice = Config.DisplayVoice
            }
        )

        while true do
            Wait(0)

            if Config.DisplayVoice then
              local netTalk = NetworkIsPlayerTalking(PlayerId()) --or talking
                
                if netTalk ~= voiceToggled then
              
                SendNUIMessage(
                    {
                        type = "toggleTalking",
                        talking = netTalk
                    }
                )
                voiceToggled = netTalk
                end
            end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(3500)
            GetStatus(
                function(result)
                    hunger = result[1]
                    thirst = result[2]
                    stress = result[3]
                end
            )
        end
    end
)            

Citizen.CreateThread(
    function()
        while true do

            Citizen.Wait(500)
            
        

            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped)
            local health = GetEntityHealth(ped) - 100
            local armor = GetPedArmour(ped)
            local serverid = GetPlayerServerId(PlayerId())
            local pauseMenu = IsPauseMenuActive()

            if rangeMode == 1 then
                range = "Susurrar"
                icon = "fa-volume-off"
                lastRange = rangeMode
            elseif rangeMode == 2 then
                range = "Normal"
                icon = "fa-volume-down"
                lastRange = rangeMode
            elseif rangeMode == 3 then
                range = "Gritar"
                icon = "fa-volume-up"
                lastRange = rangeMode
            elseif rangeMode then
                range = "Radio"
                icon = "fa-broadcast-tower"
            elseif rangeMode == false then
                rangeMode = lastRange
            end

            SendNUIMessage(
                {
                    type = "changeStatus",
                    health = health,
                    armor = armor,
                    food = hunger,
                    thirst = thirst,
                    id = serverid,
                    stress = stress,
                    voice = voiceRadius,
                    range = rangeMode,
                    iconG = icon
                }
            )

           if pauseMenu and not UIHidden then
                 SendNUIMessage(
                        {
                            type = "hideUI"
                        }
                    )
                 UIHidden = true
            elseif UIHidden and not pauseMenu then
                 SendNUIMessage(
                        {
                            type = "showUI"
                        }
                    )
                UIHidden = false
            end

            if vehicle ~= 0 and UIRadar then
                SendNUIMessage(
                    {
                        type = "openMapUI"
                    }
                )
                DisplayRadar(true)
                UIRadar = false
            elseif not UIRadar and vehicle == 0 then
                SendNUIMessage(
                    {
                        type = "closeMapUI"
                    }
                )
                UIRadar = true
                DisplayRadar(false)
            elseif IsPedSwimming(ped) and divingT then
                SendNUIMessage(
                    {
                        type = "openMapUI"
                    }
                )
                DisplayRadar(true)
                divingT = false
            elseif not divingT and not IsPedSwimming(ped) then
                SendNUIMessage(
                    {
                        type = "closeMapUI"
                    }
                )
                divingT = true
                DisplayRadar(false)
            end

        end
    end
)

--EXPORTS

exports(
    "setRange",
    function(range)
        rangeMode = range
    end
)

exports(
    "setTalking",
    function(talking)
        istalking = talking
    end
)

exports(
    "setVoiceRange",
    function(percent)
        voiceRadius = percent
    end
)
