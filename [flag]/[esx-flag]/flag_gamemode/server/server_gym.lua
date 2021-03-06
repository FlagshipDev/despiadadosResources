ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_gym:hireBmx')
AddEventHandler('esx_gym:hireBmx', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 20) then
		xPlayer.removeMoney(20)
			
		notification("Has alquilado una BMX")
	else
		notification("Has robado una bicicleta porque no tenías dinero suficiente")
		TriggerClientEvent('entornoAutomatico', source)
	end	
end)

RegisterNetEvent('esx_gym:claseBaile')
AddEventHandler('esx_gym:claseBaile', function(emote)	
	TriggerClientEvent('esx_gym:claseBaileCl', -1, emote)
end)

RegisterNetEvent('cancelarClase')
AddEventHandler('cancelarClase', function()
	TriggerClientEvent('cancelarClaseCl', -1)
end)

RegisterServerEvent('mostrarPuntoClase')
AddEventHandler('mostrarPuntoClase', function(number)
	TriggerClientEvent('mostrarPuntoClase', -1, number)
	TriggerClientEvent('hayAnfitrion', -1, number)
end)

RegisterServerEvent('esx_gym:hireCruiser')
AddEventHandler('esx_gym:hireCruiser', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 30) then
		xPlayer.removeMoney(30)
			
		notification("Has alquilado una bicicleta")
	else
		notification("Has robado una bicicleta porque no tenías dinero suficiente")
		TriggerClientEvent('entornoAutomatico', source)
	end	
end)

RegisterServerEvent('esx_gym:hireFixter')
AddEventHandler('esx_gym:hireFixter', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 40) then
		xPlayer.removeMoney(40)
			
		notification("Has alquilado una fixter")
	else
		notification("Has robado una bicicleta porque no tenías dinero suficiente")
		TriggerClientEvent('entornoAutomatico', source)
	end	
end)


RegisterServerEvent('esx_gym:hireScorcher')
AddEventHandler('esx_gym:hireScorcher', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 40) then
		xPlayer.removeMoney(40)
			
		notification("Has alquilado una scorsher")
	else
		notification("Has robado una bicicleta porque no tenías dinero suficiente")
		TriggerClientEvent('entornoAutomatico', source)
	end	
end)

RegisterServerEvent('esx_gym:checkChip')
AddEventHandler('esx_gym:checkChip', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local oneQuantity = xPlayer.getInventoryItem('gym_membership').count
	
	if oneQuantity > 0 then
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		TriggerClientEvent('esx_gym:falseMembership', source) -- false
	end
end)

RegisterServerEvent('esx_gym:buyMembership')
AddEventHandler('esx_gym:buyMembership', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 10) then
		xPlayer.removeMoney(10)
		
		xPlayer.addInventoryItem('gym_membership', 1)		
		notification("Has contratado la membresía")
		
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		notification("No tienes suficiente dinero")
	end	
end)


RegisterServerEvent('esx_gym:buyProteinshake')
AddEventHandler('esx_gym:buyProteinshake', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 10) then
		xPlayer.removeMoney(10)
		
		xPlayer.addInventoryItem('protein_shake', 1)
		
		notification("Has comprado un batido de proteína")
	else
		notification("No tienes suficiente dinero")
	end	
end)

ESX.RegisterUsableItem('protein_shake', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('protein_shake', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un batido de proteinas')

end)

RegisterServerEvent('esx_gym:buyWater')
AddEventHandler('esx_gym:buyWater', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 15) then
		xPlayer.removeMoney(15)
		
		xPlayer.addInventoryItem('water', 1)
		
		notification("Has comprado un agua")
	else
		notification("No tienes suficiente dinero")
	end		
end)

RegisterServerEvent('esx_gym:buySportlunch')
AddEventHandler('esx_gym:buySportlunch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.fechVip ~= nil then
		if(xPlayer.getMoney() >= 10) then
			xPlayer.removeMoney(10)
			
			xPlayer.addInventoryItem('sportlunch', 1)
			
			notification("Has comprado un barrita energética")
		else
			notification("No tienes suficiente dinero")
		end		
	else
		TriggerClientEvent('notify_gym', source)
	end
end)

ESX.RegisterUsableItem('sportlunch', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sportlunch', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido una barrita energética')

end)

RegisterServerEvent('esx_gym:buyPowerade')
AddEventHandler('esx_gym:buyPowerade', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.fechVip ~= nil then
		if(xPlayer.getMoney() >= 6) then
			xPlayer.removeMoney(6)
			
			xPlayer.addInventoryItem('powerade', 1)
			
			notification("Has comprado un powerade")
		else
			notification("No tienes suficiente dinero")
		end		
	else
		TriggerClientEvent('notify_gym', source)
	end
end)

ESX.RegisterUsableItem('powerade', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('powerade', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~b~powerade')

end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end
