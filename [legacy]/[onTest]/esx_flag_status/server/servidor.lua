ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local nivelDefcon = 0

--[[AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	Wait(10000)
	MySQL.Async.execute('DELETE FROM veh_km WHERE NOT EXISTS (SELECT plate FROM owned_vehicles WHERE veh_km.carplate = owned_vehicles.plate)')
	print('[^4FlagOptimizacion^0] Se han borrado los datos sobrantes de los km.')
	MySQL.Async.execute('DELETE FROM users WHERE firstname = "" and lastname = ""')
	print('[^4FlagOptimizacion^0] Se han borrado los usuarios mal creados.')
	MySQL.Async.execute('DELETE FROM user_inventory WHERE count = 0')
	print('[^4FlagOptimizacion^0] Se han borrado items del inventario con cantidad = 0.')
end)]]--
  

RegisterNetEvent('setDefconAllPlayers')
AddEventHandler('setDefconAllPlayers', function(nivel)
    nivelDefcon = nivel
end)

RegisterNetEvent('updateDefcon')
AddEventHandler('updateDefcon', function()
    TriggerClientEvent('esx_mole_status:setdefcon', -1, nivelDefcon)
end)

RegisterServerEvent('esx_carmileage:addMileage')
AddEventHandler('esx_carmileage:addMileage', function(vehPlate, km)
    local src = source
    local identifier = ESX.GetPlayerFromId(src).identifier
	local plate = vehPlate
	local newKM = km

	newKM = math.floor(newKM*100)/100
	-- print("guardando los km en bbdd")
	-- print(newkm)
	-- print(plate)
	if plate ~= nil then
    	MySQL.Async.execute('UPDATE veh_km SET km = @kms WHERE carplate = @plate', {['@plate'] = plate, ['@kms'] = newKM})
	end
end)

ESX.RegisterServerCallback('esx_carmileage:getMileage', function(source, cb, plate)

	local xPlayer = ESX.GetPlayerFromId(source)
	local vehPlate = plate

	if vehPlate ~= nil then
		MySQL.Async.fetchAll(
			'SELECT * FROM veh_km WHERE carplate = @plate',
			{
				['@plate'] = vehPlate
			},
			function(result)

				local found = false

				for i=1, #result, 1 do

					local vehicleProps = result[i].carplate

					if vehicleProps == vehPlate then
						KMSend = result[i].km
						KMSend = math.floor(KMSend*100)/100
						found = true
						break
					end

				end

				if found then
					cb(KMSend)
				else
					cb(0)
					MySQL.Async.execute('INSERT INTO veh_km (carplate) VALUES (@carplate)',{['@carplate'] = plate})
					Wait(2000)
				end

			end
		)
	end
end)



