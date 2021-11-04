RegisterServerEvent('esx_flag_garage:debug')
RegisterServerEvent('esx_flag_garage:deletevehicle_sv')
RegisterServerEvent('esx_flag_garage:modifystate')
RegisterServerEvent('esx_flag_garage:pay')
RegisterServerEvent('esx_flag_garage:payhealth')
RegisterServerEvent('esx_flag_garage:logging')

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Vehicle fetch
ESX.RegisterServerCallback('esx_flag_garage:getVehicles', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local vehicules = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data)
        for _, v in pairs(data) do
            local vehicle = json.decode(v.vehicle)

            table.insert(vehicules, {
                vehicle = vehicle,
                state = v.state,
                plate = v.plate
            })
        end
        cb(vehicules)
    end)
end)

-- End vehicle fetch
-- Store & update vehicle properties
ESX.RegisterServerCallback('esx_flag_garage:stockv', function(source, cb, vehicleProps)
    local isFound = false
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local vehicules = getPlayerVehicles(xPlayer.getIdentifier())
    local plate = vehicleProps.plate
    print(plate)

    for _, v in pairs(vehicules) do
        if (plate == plate) then
            local vehprop = json.encode(vehicleProps)

            MySQL.Sync.execute('UPDATE owned_vehicles SET vehicle=@vehprop WHERE plate=@plate', {
                ['@vehprop'] = vehprop,
                ['@plate'] = plate
            })

            isFound = true
            break
        end
    end

    cb(isFound)
end)

AddEventHandler('eden_garage:deletevehicle_sv', function(vehicle)
    TriggerClientEvent('eden_garage:deletevehicle_cl', -1, vehicle)
end)

-- End vehicle store
-- Change state of vehicle
RegisterServerEvent('esx_flag_garage:modifystate')
AddEventHandler('esx_flag_garage:modifystate', function(vehicleProps, state, garage)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local plate = vehicleProps.plate

	if garage == nil then
		MySQL.Sync.execute("UPDATE owned_vehicles SET garage=@garage WHERE plate=@plate",{['@garage'] = "OUT" , ['@plate'] = plate})
		MySQL.Sync.execute("UPDATE owned_vehicles SET vehicle=@vehicle WHERE plate=@plate",{['@vehicle'] = json.encode(vehicleProps) , ['@plate'] = plate})
		MySQL.Sync.execute("UPDATE owned_vehicles SET state=@state WHERE plate=@plate",{['@state'] = state , ['@plate'] = plate})
	else 

		MySQL.Sync.execute("UPDATE owned_vehicles SET garage=@garage WHERE plate=@plate",{['@garage'] = garage , ['@plate'] = plate})
		MySQL.Sync.execute("UPDATE owned_vehicles SET vehicle=@vehicle WHERE plate=@plate",{['@vehicle'] = json.encode(vehicleProps) , ['@plate'] = plate})
		MySQL.Sync.execute("UPDATE owned_vehicles SET state=@state WHERE plate=@plate",{['@state'] = state , ['@plate'] = plate})

	end
end)

-- End state update
-- Function to recover plates deprecated and removed.
-- Get list of vehicles already out
ESX.RegisterServerCallback('esx_flag_garage:getOutVehicles', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local vehicules = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier AND state=false', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data)
        for _, v in pairs(data) do
            local vehicle = json.decode(v.vehicle)
            table.insert(vehicules, vehicle)
        end

        cb(vehicules)
    end)
end)

-- End out list
-- Check player has funds
ESX.RegisterServerCallback('esx_flag_garage:checkMoney', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.get('money') >= 100 then
        cb(true)
    else
        cb(false)
    end
end)

-- End funds check
-- Withdraw money
AddEventHandler('esx_flag_garage:payhealth', function(price)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(price)
    TriggerClientEvent('esx:showNotification', source, 'Has pagado '..price..' por la reparación.')
end)

-- Withdraw money
AddEventHandler('esx_flag_garage:pay', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(Config.Price)
    TriggerClientEvent('esx:showNotification', source, 'Has pagado '..Config.Price..' por la reparación.')
end)

-- End money withdraw

-- Find player vehicles
function getPlayerVehicles(identifier)
    local vehicles = {}

    local data = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier', {
        ['@identifier'] = identifier
    })

    for _, v in pairs(data) do
        local vehicle = json.decode(v.vehicle)

        table.insert(vehicles, {
            id = v.id,
            plate = v.plate
        })
    end

    return vehicles
end

-- End fetch vehicles
-- Debug
AddEventHandler('esx_flag_garage:debug', function(var)
    print(to_string(var))
end)

function table_print(tt, indent, done)
    done = done or {}
    indent = indent or 0

    if type(tt) == 'table' then
        local sb = {}

        for key, value in pairs(tt) do
            table.insert(sb, string.rep(' ', indent)) -- indent it

            if type(value) == 'table' and not done[value] then
                done[value] = true
                table.insert(sb, '{\n')
                table.insert(sb, table_print(value, indent + 2, done))
                table.insert(sb, string.rep(' ', indent)) -- indent it
                table.insert(sb, '}\n')
            elseif 'number' == type(key) then
                table.insert(sb, string.format('\'%s\'\n', tostring(value)))
            else
                table.insert(sb, string.format('%s = \'%s\'\n', tostring(key), tostring(value)))
            end
        end

        return table.concat(sb)
    else
        return tt .. '\n'
    end
end

function to_string(tbl)
    if 'nil' == type(tbl) then
        return tostring(nil)
    elseif 'table' == type(tbl) then
        return table_print(tbl)
    elseif 'string' == type(tbl) then
        return tbl
    else
        return tostring(tbl)
    end
end

-- End debug
-- Return all vehicles to garage (state update) on server restart
AddEventHandler('onMySQLReady', function()
    MySQL.Sync.execute('UPDATE owned_vehicles SET state=true', {})
end)

-- End vehicle return
-- Pay vehicle repair cost
AddEventHandler('eden_garage:payhealth', function(price)
    local xPlayer = ESX.GetPlayerFromId(source)

    if price < 0 then
        print('CHEATER?')
    else
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, _U('you_paid', price))
    end
end)

-- End repair cost
-- Log to the console
AddEventHandler('eden_garage:logging', function(logging)
    RconPrint(logging)
end)
-- End console log