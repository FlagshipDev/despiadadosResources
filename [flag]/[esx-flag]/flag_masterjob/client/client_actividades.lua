ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


local actTeledirigidos = false
local actF1 = false
local actParacaidismo = false
local actMotocross = false
local actMotoagua = false
local inAct = false
local _vip = false

RegisterNetEvent('flag_actividad:open')
AddEventHandler('flag_actividad:open', function(act)
    local actividad = act

    if actividad == 'motocross' then
        OpenMotocrossMenu()
    elseif actividad == 'motoagua1' then
        OpenMotoaguaMenu1()
    elseif actividad == 'motoagua2' then
        OpenMotoaguaMenu2()
    elseif actividad == 'motoagua3' then
        OpenMotoaguaMenu3()
    elseif actividad == 'motoagua4' then
        OpenMotoaguaMenu4()
    elseif actividad == 'motoagua5' then
        OpenMotoaguaMenu5()
    elseif actividad == 'motoagua6' then
        OpenMotoaguaMenu6()
    elseif actividad == 'paracaidismo' then
        OpenParacaidismo()
    elseif actividad == 'teledirigidos' then
        OpenTeledirigidosMenu()
    elseif actividad == 'f1' then
        OpenF1Menu()
    elseif actividad == 'sellfish' then
        OpenPescaMenu()
    elseif actividad == 'weedshop' then
        OpenWeedShop()
    elseif actividad == 'karting' then
        OpenKarting()
    elseif actividad == 'blackshop' then
        OpenBlackShop()
    elseif actividad == 'surf' then
        OpenSurfMenu()
    elseif actividad == 'basketball' then
        ESX.ShowNotification('Ahí te dejo un ~y~balón~s~, disfruta...')
        ExecuteCommand('baloncesto')
    end
end)

function OpenSurfMenu()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
    { 
    title = 'Actividad - Surf', 
    align = 'bottom-right', 
    elements = {
        {label = 'Empezar actividad', value = 'start_surf'}
      },
    }, function(data, menu)

        if data.current.value == 'start_surf' then
            local playerPed = PlayerPedId()
            local platenum = math.random(00001, 99998)
            local coords    = Config.Surf.Zones.LocationVehicleEntering.Pos, Config.Surf.Zones.LocationVehicleEntering2.Pos, Config.Surf.Zones.LocationVehicleEntering3.Pos
            ESX.Game.SpawnVehicle('surfboard', coords, 200.0, function(vehicle)
                TaskWarpPedIntoVehicle(playerPed, vehicle, -1) -- Téléportation du joueur dans le véhicule
                SetVehicleNumberPlateText(vehicle, 'SURF' .. platenum) -- Modification de la plaque d'immatriculation en LOCATION
            end)
        end

    end, function(data, menu) 
    menu.close() 
    end)


end


function OpenKarting()
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
    { 
    title = 'Actividad - Karting', 
    align = 'bottom-right', 
    elements = {
        {label = 'Empezar actividad', value = 'start_karting'}
      },
    }, function(data, menu)

        if data.current.value == 'start_karting' then
            KartingMenu()
        end

    end, function(data, menu) 
    menu.close() 
    end)
end

function KartingMenu()
    inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'motocross',
    { 
    title = 'Actividad - Motocross', 
    align = 'bottom-right', 
    elements = {
        {label = 'Kart Normal', value = 'kart_interaction'},
        {label = 'Kart Custom <span style="color:yellow">VIP</span>', value = 'kartcustom_interaction'}
      },
    }, function(data, menu)

        if data.current.value == 'kart_interaction' then
            VehicleLoadTimer('veto')
            posEntrega = Config.Actividades.SpawnZonesKarts[math.random(1, #Config.Actividades.SpawnZonesKarts)]
            local veh = CreateVehicle('veto', posEntrega.x, posEntrega.y, posEntrega.z, posEntrega.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        elseif data.current.value == 'kartcustom_interaction' then
            ESX.TriggerServerCallback('checkVip', function(esvip) 
                _vip = esvip
            end)
            if not _vip then
                exports.fl_notifications:FlagShowAdvancedNotification('~p~LeyendasRP', 'No eres ~y~VIP~s~', 'Para poder utilizar esto tienes que ser VIP.', 'CHAR_BLOCKED', 1)
            else 
                VehicleLoadTimer('veto2')
                posEntrega = Config.Actividades.SpawnZonesKarts[math.random(1, #Config.Actividades.SpawnZonesKarts)]
                local veh = CreateVehicle('veto2', posEntrega.x, posEntrega.y, posEntrega.z, posEntrega.h, true, false)
                SetPedIntoVehicle(PlayerPedId(), veh, -1)
            end
        end
        ESX.UI.Menu.CloseAll()
    end, function(data, menu) 
    menu.close() 
    end)
end
function OpenWeedShop()
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
    { 
    title = '????', 
    align = 'bottom-right', 
    elements = {
        {label = 'Maceta - 5<span style="color:green">$</span>', value = 'plantpot', price = 5},
        {label = 'Báscula de precisión - 5<span style="color:green">$</span>', value = 'drugscales', price = 5},
        {label = 'Agua sucia - 4<span style="color:green">$</span>', value = 'wateringcan', price = 4},
        {label = 'Agua purificada - 7<span style="color:green">$</span>', value = 'purifiedwater', price = 7},
        {label = 'Fertilizante de baja calidad - 4<span style="color:green">$</span>', value = 'lowgradefert', price = 4},
        {label = 'Fertilizante de alta calidad - 7<span style="color:green">$</span>', value = 'highgradefert', price = 7},
        {label = 'Chivata vacía - 2<span style="color:green">$</span>', value = 'dopebag', price = 2},
        {label = 'Semilla macho (Producción de marihuana) - 50<span style="color:green">$</span>', value = 'lowgrademaleseed', price = 50},
        {label = 'Semilla hembra (Producción de marihuana) - 50<span style="color:green">$</span>', value = 'lowgradefemaleseed', price = 50},
        {label = 'Semilla macho (Producción de semillas)- 75<span style="color:green">$</span>', value = 'highgrademaleseed', price = 75},
        {label = 'Semilla Hembra (Producción de semillas) - 75<span style="color:green">$</span>', value = 'highgradefemaleseed', price = 75},
      },
    }, function(data, menu)
        if data.current.value then
            TriggerServerEvent('flag_masterjob:buyweedshop', data.current.value, data.current.price)
        end

    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenBlackShop()
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
    { 
    title = '????', 
    align = 'bottom-right', 
    elements = {
        {label = 'Cargador - 450<span style="color:green">$</span>', value = 'clip', price = 450},
        {label = 'Taladro - 200<span style="color:green">$</span>', value = 'drill', price = 200},
        {label = 'Empuñadura - 250<span style="color:green">$</span>', value = 'grip', price = 250},
        {label = 'USB para piratear - 50<span style="color:green">$</span>', value = 'hackerDevice', price = 50},
        {label = 'Portátil - 400<span style="color:green">$</span>', value = 'net_cracker', price = 400},
        {label = 'Silenciador - 280<span style="color:green">$</span>', value = 'suppressor', price = 280},
        {label = 'Termita - 80<span style="color:green">$</span>', value = 'thermite', price = 80},
      },
    }, function(data, menu)
        if data.current.value then
            TriggerServerEvent('flag_masterjob:buyweedshop', data.current.value, data.current.price)
        end

    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenPescaMenu()
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
    { 
    title = 'Actividad - Pesca', 
    align = 'bottom-right', 
    elements = {
        {label = 'Comprar objetos', value = 'buy_objects'},
        {label = 'Vender pescado', value = 'sell_objects'},
      },
    }, function(data, menu)

        if data.current.value == 'buy_objects' then
            OpenBuyPesca()
        elseif data.current.value == 'sell_objects' then
            ESX.UI.Menu.CloseAll()
            TriggerServerEvent('flag_masterjob:VenderPesca')
        end

    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenBuyPesca()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
    { 
    title = '¿Que quieres comprar?', 
    align = 'bottom-right', 
    elements = {
        {label = 'Caña - 10<span style="color:green">$</span>', value = 'caña_int'},
        {label = 'Cebo (x5) - 5<span style="color:green">$</span>', value = 'cebo_int'},
      },
    }, function(data, menu)

        if data.current.value == 'caña_int' then
            TriggerServerEvent('flag_masterjob:buyPesca', 'caña')
        elseif data.current.value == 'cebo_int' then
            TriggerServerEvent('flag_masterjob:buyPesca', 'cebo')
        end

    end, function(data, menu) 
    menu.close() 
    end)

end


function OpenF1Menu()
    ESX.ShowNotification('Estamos ~b~construyendo~s~ el circuito, ven unos días.')
end

function OpenMotocrossMenu()
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
    { 
    title = 'Actividad - Motocross', 
    align = 'bottom-right', 
    elements = {
        {label = 'Empezar actividad', value = 'start_motocross'}
      },
    }, function(data, menu)

        if data.current.value == 'start_motocross' then
            MotocrossVehicles()
        end

    end, function(data, menu) 
    menu.close() 
    end)
end

function MotocrossVehicles()
    inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'motocross',
    { 
    title = 'Actividad - Motocross', 
    align = 'bottom-right', 
    elements = {
        {label = 'Sanchez', value = 'sanchez_interaction'},
        {label = 'BF400', value = 'bf400_interaction'},
        {label = 'Blazer', value = 'blazer2_interaction'}
      },
    }, function(data, menu)

        if data.current.value == 'sanchez_interaction' then
            VehicleLoadTimer('sanchez2')
            posEntrega = Config.Actividades.SpawnZonesMotocross[math.random(1, #Config.Actividades.SpawnZonesMotocross)]
            local veh = CreateVehicle('sanchez2', posEntrega.x, posEntrega.y, posEntrega.z, posEntrega.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        elseif data.current.value == 'bf400_interaction' then
            VehicleLoadTimer('bf400')
            posEntrega = Config.Actividades.SpawnZonesMotocross[math.random(1, #Config.Actividades.SpawnZonesMotocross)]
            local veh = CreateVehicle('bf400', posEntrega.x, posEntrega.y, posEntrega.z, posEntrega.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        elseif data.current.value == 'blazer2_interaction' then
            VehicleLoadTimer('blazer')
            posEntrega = Config.Actividades.SpawnZonesMotocross[math.random(1, #Config.Actividades.SpawnZonesMotocross)]
            local veh = CreateVehicle('blazer', posEntrega.x, posEntrega.y, posEntrega.z, posEntrega.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        end
        ESX.UI.Menu.CloseAll()
    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenMotoaguaMenu1()
    inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'motoagua',
    { 
    title = 'Actividad - Motos de agua', 
    align = 'bottom-right', 
    elements = {
        {label = 'SeaShark', value = 'seashark_interaction'},
        {label = 'SeaShark Custom <span style="color:#fffb00">VIP</span>', value = 'seashark3_interaction'}
      },
    }, function(data, menu)

        if data.current.value == 'seashark_interaction' then
            VehicleLoadTimer('seashark')
           -- posEntrega = Config.Actividades.SpawnZonesMotoagua1
            local veh = CreateVehicle('seashark', Config.Actividades.SpawnZonesMotoagua.uno.x, Config.Actividades.SpawnZonesMotoagua.uno.y, Config.Actividades.SpawnZonesMotoagua.uno.z, Config.Actividades.SpawnZonesMotoagua.uno.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        elseif data.current.value == 'seashark3_interaction' then
            ESX.TriggerServerCallback('checkVip', function(esvip) 
                _vip = esvip
            end)
            if not _vip then
                exports.fl_notifications:FlagShowAdvancedNotification('~p~LeyendasRP', 'No eres ~y~VIP~s~', 'Para poder utilizar esto tienes que ser VIP.', 'CHAR_BLOCKED', 1)
            else 
                VehicleLoadTimer('seashark3')
            --    posEntrega = Config.Actividades.SpawnZonesMotoagua1
                local veh = CreateVehicle('seashark3', Config.Actividades.SpawnZonesMotoagua.uno.x, Config.Actividades.SpawnZonesMotoagua.uno.y, Config.Actividades.SpawnZonesMotoagua.uno.z, Config.Actividades.SpawnZonesMotoagua.uno.h, true, false)
                SetPedIntoVehicle(PlayerPedId(), veh, -1)
            end
        end
        ESX.UI.Menu.CloseAll()
    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenMotoaguaMenu2()
    inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'motoagua',
    { 
    title = 'Actividad - Motos de agua', 
    align = 'bottom-right', 
    elements = {
        {label = 'SeaShark', value = 'seashark_interaction'},
        {label = 'SeaShark 2', value = 'seashark3_interaction'}
      },
    }, function(data, menu)

        if data.current.value == 'seashark_interaction' then
            VehicleLoadTimer('seashark')
         --   posEntrega = Config.Actividades.SpawnZonesMotoagua2
            local veh = CreateVehicle('seashark', Config.Actividades.SpawnZonesMotoagua.dos.x, Config.Actividades.SpawnZonesMotoagua.dos.y, Config.Actividades.SpawnZonesMotoagua.dos.z, Config.Actividades.SpawnZonesMotoagua.dos.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        elseif data.current.value == 'seashark3_interaction' then
            VehicleLoadTimer('seashark3')
         --   posEntrega = Config.Actividades.SpawnZonesMotoagua2
            local veh = CreateVehicle('seashark3', Config.Actividades.SpawnZonesMotoagua.dos.x, Config.Actividades.SpawnZonesMotoagua.dos.y, Config.Actividades.SpawnZonesMotoagua.dos.z, Config.Actividades.SpawnZonesMotoagua.dos.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        end
        ESX.UI.Menu.CloseAll()
    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenMotoaguaMenu3()
    inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'motoagua',
    { 
    title = 'Actividad - Motos de agua', 
    align = 'bottom-right', 
    elements = {
        {label = 'SeaShark', value = 'seashark_interaction'},
        {label = 'SeaShark 2', value = 'seashark3_interaction'}
      },
    }, function(data, menu)

        if data.current.value == 'seashark_interaction' then
            VehicleLoadTimer('seashark')
        --    posEntrega = Config.Actividades.SpawnZonesMotoagua3
            local veh = CreateVehicle('seashark', Config.Actividades.SpawnZonesMotoagua.tres.x, Config.Actividades.SpawnZonesMotoagua.tres.y, Config.Actividades.SpawnZonesMotoagua.tres.z, Config.Actividades.SpawnZonesMotoagua.tres.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        elseif data.current.value == 'seashark3_interaction' then
            VehicleLoadTimer('seashark3')
          --  posEntrega = Config.Actividades.SpawnZonesMotoagua3
            local veh = CreateVehicle('seashark3', Config.Actividades.SpawnZonesMotoagua.tres.x, Config.Actividades.SpawnZonesMotoagua.tres.y, Config.Actividades.SpawnZonesMotoagua.tres.z, Config.Actividades.SpawnZonesMotoagua.tres.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        end
        ESX.UI.Menu.CloseAll()
    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenMotoaguaMenu4()
    inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'motoagua',
    { 
    title = 'Actividad - Motos de agua', 
    align = 'bottom-right', 
    elements = {
        {label = 'SeaShark', value = 'seashark_interaction'},
        {label = 'SeaShark 2', value = 'seashark3_interaction'}
      },
    }, function(data, menu)

        if data.current.value == 'seashark_interaction' then
            VehicleLoadTimer('seashark')
         --   posEntrega = Config.Actividades.SpawnZonesMotoagua4
            local veh = CreateVehicle('seashark', Config.Actividades.SpawnZonesMotoagua.cuatro.x, Config.Actividades.SpawnZonesMotoagua.cuatro.y, Config.Actividades.SpawnZonesMotoagua.cuatro.z, Config.Actividades.SpawnZonesMotoagua.cuatro.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        elseif data.current.value == 'seashark3_interaction' then
            VehicleLoadTimer('seashark3')
         --   posEntrega = Config.Actividades.SpawnZonesMotoagua4
            local veh = CreateVehicle('seashark3', Config.Actividades.SpawnZonesMotoagua.cuatro.x, Config.Actividades.SpawnZonesMotoagua.cuatro.y, Config.Actividades.SpawnZonesMotoagua.cuatro.z, Config.Actividades.SpawnZonesMotoagua.cuatro.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        end
        ESX.UI.Menu.CloseAll()
    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenMotoaguaMenu5()
    inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'motoagua',
    { 
    title = 'Actividad - Motos de agua', 
    align = 'bottom-right', 
    elements = {
        {label = 'SeaShark', value = 'seashark_interaction'},
        {label = 'SeaShark 2', value = 'seashark3_interaction'}
      },
    }, function(data, menu)

        if data.current.value == 'seashark_interaction' then
            VehicleLoadTimer('seashark')
       --     posEntrega = Config.Actividades.SpawnZonesMotoagua5
            local veh = CreateVehicle('seashark', Config.Actividades.SpawnZonesMotoagua.cinco.x, Config.Actividades.SpawnZonesMotoagua.cinco.y, Config.Actividades.SpawnZonesMotoagua.cinco.z, Config.Actividades.SpawnZonesMotoagua.cinco.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        elseif data.current.value == 'seashark3_interaction' then
            VehicleLoadTimer('seashark3')
        --    posEntrega = Config.Actividades.SpawnZonesMotoagua5
            local veh = CreateVehicle('seashark3', Config.Actividades.SpawnZonesMotoagua.cinco.x, Config.Actividades.SpawnZonesMotoagua.cinco.y, Config.Actividades.SpawnZonesMotoagua.cinco.z, Config.Actividades.SpawnZonesMotoagua.cinco.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        end
        ESX.UI.Menu.CloseAll()
    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenMotoaguaMenu6()
    inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'motoagua',
    { 
    title = 'Actividad - Motos de agua', 
    align = 'bottom-right', 
    elements = {
        {label = 'SeaShark', value = 'seashark_interaction'},
        {label = 'SeaShark 2', value = 'seashark3_interaction'}
      },
    }, function(data, menu)

        if data.current.value == 'seashark_interaction' then
            VehicleLoadTimer('seashark')
          --  posEntrega = Config.Actividades.SpawnZonesMotoagua6
            local veh = CreateVehicle('seashark', Config.Actividades.SpawnZonesMotoagua.seis.x, Config.Actividades.SpawnZonesMotoagua.seis.y, Config.Actividades.SpawnZonesMotoagua.seis.z, Config.Actividades.SpawnZonesMotoagua.seis.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        elseif data.current.value == 'seashark3_interaction' then
            VehicleLoadTimer('seashark3')
       --     posEntrega = Config.Actividades.SpawnZonesMotoagua6
            local veh = CreateVehicle('seashark3', Config.Actividades.SpawnZonesMotoagua.seis.x, Config.Actividades.SpawnZonesMotoagua.seis.y, Config.Actividades.SpawnZonesMotoagua.seis.z, Config.Actividades.SpawnZonesMotoagua.seis.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
        end
        ESX.UI.Menu.CloseAll()
    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenParacaidismo()
 --   inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
    { 
    title = 'Actividad - Paracaidismo', 
    align = 'bottom-right', 
    elements = {
        {label = 'Empezar actividad', value = 'start_paracaidismo'}
      },
    }, function(data, menu)

        if data.current.value == 'start_paracaidismo' then
            ESX.ShowAdvancedNotification('~g~Actividades', 'Paracaidismo', 'Toma un <span style="color:yellow">paracaídas</span>, ten cuidado.', textureDict, iconType, flash, saveToBrief, hudColorIndex)
            TriggerServerEvent('flag_masterjob:darparachute')
        end

    end, function(data, menu) 
    menu.close() 
    end)
end

function OpenTeledirigidosMenu()
    inAct = true
    ESX.UI.Menu.Close()

    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'more_info',
    { 
    title = 'Actividad - Coches Teledirigidos', 
    align = 'bottom-right', 
    elements = {
        {label = 'Empezar actividad', value = 'start_teledirigidos'}
      },
    }, function(data, menu)

        if data.current.value == 'start_teledirigidos' then
            VehicleLoadTimer('rcbandito')
            posEntrega = Config.Actividades.SpawnZonesTele[math.random(1, #Config.Actividades.SpawnZonesTele)]
            local veh = CreateVehicle('rcbandito', posEntrega.x, posEntrega.y, posEntrega.z, posEntrega.h, true, false)
            SetPedIntoVehicle(PlayerPedId(), veh, -1)
            ESX.UI.Menu.CloseAll()
        end

    end, function(data, menu) 
    menu.close() 
    end)
end

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(0)
        if inAct == true then
            DisableControlAction(0,69,true) -- disable aim
            DisableControlAction(0,70,true) -- disable weapon
            DisableControlAction(0,58,true) -- disable weapon
            DisableControlAction(0,75,true) -- disable exit vehicle
            DisableControlAction(27,75,true) -- disable exit vehicle
        else
            Wait(2000)
        end
    end


end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local coords = GetEntityCoords(PlayerPedId())
        local pedInVeh = IsPedInAnyVehicle(PlayerPedId(), true)
        local letSleep = true
        if inAct == true then
            for k,v in pairs(Config.Actividades.DeleteZones) do
                for i = 1, #v.Pos, 1 do
                    local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
                    if (distance < 10.0) and pedInVeh then
                        sleep = false
                        DrawMarker(Config.Actividades.Marker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.Actividades.MarkerScale.x, Config.Actividades.MarkerScale.y, Config.Actividades.MarkerScale.z, Config.Actividades.MarkerColor.r,Config.Actividades.MarkerColor.g,Config.Actividades.MarkerColor.b,Config.Actividades.MarkerColor.a, false, true, 2, true, false, false, false)						
                    end
                end
            end
            for k,v in pairs(Config.Actividades.DeleteZones) do
                for i = 1, #v.Pos, 1 do
                    local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
                    if distance < 3.0 and pedInVeh then
                        sleep = false
                        ESX.ShowFloatingHelpNotification(Config.Actividades.DeleteDraw3DText, vector3(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z+0.4))
                        if IsControlJustPressed(0, 38) then
                            inAct = false
                            DeleteVehicleAct()
                            Citizen.Wait(500)
                        end
                    end
                end
            end
        end

        if letSleep then
            Citizen.Wait(2000)
        end
    end
end)

-- Load Timer Function for Vehicle Spawn:
function VehicleLoadTimer(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)

			drawLoadingText('Cargando...', 255, 255, 255, 255)
		end
	end
end

-- Loading Text for Vehicles Function:
function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end

DeleteVehicleAct = function()
	local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
	if dist < 3 then
		DeleteEntity(veh)
		ESX.ShowNotification("Has acabado la ~b~actividad")
	else
		ESX.ShowNotification("No se detectan ~b~vehículos")
	end
end