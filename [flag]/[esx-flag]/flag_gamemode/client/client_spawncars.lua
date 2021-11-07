ESX = nil

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end

        for __, i in pairs(Config.Spawn.Vehicles) do
            local model = GetHashKey(i.Model)
            RequestModel(model)
            while not HasModelLoaded(model) do
                RequestModel(model)
                Citizen.Wait(0)
            end
        end

        for __, i in pairs(Config.Spawn.VehiclesSandy) do
            local model = GetHashKey(i.Model)
            RequestModel(model)
            while not HasModelLoaded(model) do
                RequestModel(model)
                Citizen.Wait(0)
            end
        end
    end
)


Citizen.CreateThread(
    function()
        while true do
            local zone = inZone()

            Citizen.Wait(Config.Spawn.vehicleSpawnRate * 1000)
            if zone ~= false then
                local spawnpoint = zone.SpawnPoints[math.random(1, #zone.SpawnPoints)]
                if ESX.Game.IsSpawnPointClear(vector3(spawnpoint.x, spawnpoint.y, spawnpoint.z), 3.5) then
                    spawnCarSport(spawnpoint.x, spawnpoint.y, spawnpoint.z, spawnpoint.h)
                end
            end
         
        end
    end
)

Citizen.CreateThread(function()
    while true do
        local zoneSandy = inZoneSandy()

        Citizen.Wait(Config.Spawn.vehicleSpawnRate * 1000)
        if zoneSandy ~= false then
            local spawnpoint = zoneSandy.SpawnPoints[math.random(1, #zoneSandy.SpawnPoints)]
            if ESX.Game.IsSpawnPointClear(vector3(spawnpoint.x, spawnpoint.y, spawnpoint.z), 3.5) then
                spawnCarSandy(spawnpoint.x, spawnpoint.y, spawnpoint.z, spawnpoint.h)
            end
        end
    end
end)


function inZone()
    local ped = PlayerPedId()
    local pedcoords = GetEntityCoords(ped)

    for __, z in ipairs(Config.Spawn.Zones) do
        if GetDistanceBetweenCoords(z.Center, pedcoords) <= z.Size then
            return z
        end
    end

    return false
end


function inZoneSandy()
    local ped = PlayerPedId()
    local pedcoords = GetEntityCoords(ped)

    for __, z in ipairs(Config.Spawn.ZoneSandy) do
        if GetDistanceBetweenCoords(z.Center, pedcoords) <= z.Size then
            return z
        end
    end
    return false
end

function spawnCarSport(x, y, z, h)
    local model = Config.Spawn.Vehicles[math.random(1, #Config.Spawn.Vehicles)]
    local plate = exports['esx_advancedvehicleshop']:GeneratePlate()
    --local color = CalculateColor()
    local car = CreateVehicle(GetHashKey(model.Model), x, y, z, h, true, true)
    SetVehicleDoorsLocked(car, 1)
    SetVehicleNumberPlateText(car, plate)
    --SetVehicleCustomPrimaryColour(car, color.r, color.g, color.b)
    --SetVehicleCustomSecondaryColour(car, color.r, color.g, color.b)
    SetEntityAsMissionEntity(car, true, true)
end

function spawnCarSandy(x, y, z, h)
    local model = Config.Spawn.VehiclesSandy[math.random(1, #Config.Spawn.VehiclesSandy)]
    local plate = exports['esx_advancedvehicleshop']:GeneratePlate()
    --local color = CalculateColor()
    local car = CreateVehicle(GetHashKey(model.Model), x, y, z, h, true, true)
    SetVehicleDoorsLocked(car, 1)
    SetVehicleNumberPlateText(car, plate)
    --SetVehicleCustomPrimaryColour(car, color.r, color.g, color.b)
    --SetVehicleCustomSecondaryColour(car, color.r, color.g, color.b)
    SetEntityAsMissionEntity(car, true, true)
end