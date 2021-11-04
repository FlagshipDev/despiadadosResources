ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bread'))
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_water'))
end)

TriggerEvent('es:addGroupCommand', 'heal', 'mod', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local playerId = tonumber(args[1])

		-- is the argument a number?
		if playerId then
			-- is the number a valid player?
			if GetPlayerName(playerId) then
				--print(('esx_basicneeds: %s healed %s'):format(GetPlayerIdentifier(source, 0), GetPlayerIdentifier(playerId, 0)))
				TriggerClientEvent('esx_basicneeds:healPlayer', playerId)
				--TriggerClientEvent('chat:addMessage', source, { args = { '^5HEAL', 'You have been healed.' } })
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^6LeyendasRP: ', 'El jugador no está online.' } })
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^6LeyendasRP: ', 'ID inválida.' } })
		end
	else
		--print(('esx_basicneeds: %s healed self'):format(GetPlayerIdentifier(source, 0)))
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^6LeyendasRP: ', 'Permisos insuficientes.' } })
end, {help = 'Heal a player, or yourself - restores thirst, hunger and health.', params = {{name = 'playerId', help = '(optional) player id'}}})


------- Municion ------

RegisterServerEvent('esx_clip:remove')
AddEventHandler('esx_clip:remove', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('esx_clip:clipcli', source)
end)

ESX.RegisterUsableItem('bulletproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:bulletproof', source, 50)
	xPlayer.removeInventoryItem('bulletproof', 1)
end)
ESX.RegisterUsableItem('bulletlight', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:bulletproof', source, 25)
	xPlayer.removeInventoryItem('bulletlight', 1)
end)
ESX.RegisterUsableItem('bulletheavy', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:bulletproof', source, 100)
	xPlayer.removeInventoryItem('bulletheavy', 1)
end)


ESX.RegisterUsableItem('nestea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('nestea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido <span style="color:yellow">1x</span> nestea')
end)

ESX.RegisterUsableItem('fantaN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fantaN', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido <span style="color:yellow">1x</span> Fanta de Naranja')
end)

ESX.RegisterUsableItem('fantaL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fantaL', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido <span style="color:yellow">1x</span> Fanta de Limón')
end)

ESX.RegisterUsableItem('cocacola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocacola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido <span style="color:yellow">1x</span> Coca Cola')
end)

ESX.RegisterUsableItem('cocacolaSA', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocacolaSA', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido <span style="color:yellow">1x</span> Coca Cola sin azúcar')
end)

ESX.RegisterUsableItem('redbull', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('redbull', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido <span style="color:yellow">1x</span> Red Bull, no da alas')
end)

ESX.RegisterUsableItem('sandwhichJ', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sandwhichJ', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> sandwhich de jamón')
end)

ESX.RegisterUsableItem('sandwhichQ', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sandwhichQ', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> sandwhich de queso')
end)

ESX.RegisterUsableItem('chips', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chips', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> patatas fritas')
end)

ESX.RegisterUsableItem('doritos', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('doritos', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 75000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> doritos.')
end)

ESX.RegisterUsableItem('regaliz', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('regaliz', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
	TriggerClientEvent('esx_basicneeds:chicles', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> chicle, te desestresa...')
end)

ESX.RegisterUsableItem('diazepan', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('diazepan', 1)

	TriggerClientEvent('esx_basicneeds:diazepan', source)
	--TriggerClientEvent('esx:showNotification', source, 'Te has tomado <span style="color:yellow">1x</span> Diazepán, poco a poco te está bajando el estrés...')
end)

ESX.RegisterUsableItem('analgesico', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('analgesico', 1)

	TriggerClientEvent('esx_basicneeds:analgesico', source)
	--TriggerClientEvent('esx:showNotification', source, 'Te has tomado <span style="color:yellow">1x</span> analgésico, poco a poco te vas sientiendo mejor...')
end)


ESX.RegisterUsableItem('sojatexturizada', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sojatexturizada', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> poco de soja, family-friendly con los animales!')
end)

ESX.RegisterUsableItem('pizzaQ', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizzaQ', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> pizza cuatro quesos')
end)

ESX.RegisterUsableItem('pizzaP', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizzaP', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> pizza carbonara')
end)

ESX.RegisterUsableItem('condon', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('condon', 1)

	TriggerClientEvent('esx:showNotification', source, 'Deberías considerar comprar los XL...')
end)

ESX.RegisterUsableItem('condonXL', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('condonXL', 1)

	TriggerClientEvent('esx:showNotification', source, 'Porque no hay condones más grandes que sino...')
end)

ESX.RegisterUsableItem('periodico', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('periodico', 1)

	TriggerClientEvent('esx:showNotification', source, 'Parece que no hay nadie al cargo de Weazel News...')
end)


ESX.RegisterUsableItem('cigarette', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local inventory = xPlayer.getInventory()
	local count = 0

	for i=1, #inventory, 1 do
		if inventory[i].name == 'mechero' then
			count = inventory[i].count
		end
	end

	if count > 0 then
		xPlayer.removeInventoryItem('cigarette', 1)
		TriggerClientEvent('esx_basicneeds:OnSmokeCigarett', source)
	--	TriggerClientEvent('esx:showNotification', source, ('Te has encendido <span style="color:yellow">1x</span> cigarro.'))
	else
		TriggerClientEvent('esx:showNotification', source, '¿Como piensas encender el ~b~cigarro~s~?')
	end
end)

ESX.RegisterUsableItem('beer', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_status:remove', source, 'thirst', 25000)
	TriggerClientEvent('esx_basicneeds:onDrinkBottle', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido <span style="color:yellow">1x</span> cerveza...')

end)

ESX.RegisterUsableItem('wine', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wine', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_status:remove', source, 'thirst', 25000)
	TriggerClientEvent('esx_basicneeds:onDrinkBottle', source)
	TriggerClientEvent('esx:showNotification', source, 'Has bebido un poco de <span style="color:yellow">vino</span>...')

end)

ESX.RegisterUsableItem('vodka', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_status:remove', source, 'thirst', 25000)
	TriggerClientEvent('esx_basicneeds:onDrinkBottle', source)
	TriggerClientEvent('esx:showNotification', source, 'Has bebido un poco de <span style="color:yellow">vodka</span>...')

end)

ESX.RegisterUsableItem('tequila', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_status:remove', source, 'thirst', 25000)
	TriggerClientEvent('esx_basicneeds:onDrinkBottle', source)
	TriggerClientEvent('esx:showNotification', source, 'Has bebido un poco de <span style="color:yellow">tequila</span>...')

end)

ESX.RegisterUsableItem('whisky', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_status:remove', source, 'thirst', 25000)
	TriggerClientEvent('esx_basicneeds:onDrinkBottle', source)
	TriggerClientEvent('esx:showNotification', source, 'Has bebido un poco de <span style="color:yellow">whiskey</span>...')

end)


ESX.RegisterUsableItem('Kindersorpresa', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('Kindersorpresa', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> Kinder Sorpresa')
end)

ESX.RegisterUsableItem('Kinder', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('Kinder', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido <span style="color:yellow">1x</span> Kinder')
end)

ESX.RegisterUsableItem('Oreo', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('Oreo', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido unas ~b~galletas oreo')
end)

ESX.RegisterUsableItem('ChipsAhoy', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ChipsAhoy', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido unas ~b~Chips Ahoy')
end)

ESX.RegisterUsableItem('burrito', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('burrito', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 1500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido un ~b~burrito')
end)

ESX.RegisterUsableItem('KitKat', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('KitKat', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 1500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido un ~b~KitKat')
end)

ESX.RegisterUsableItem('cookies', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cookies', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 1500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido unas ~b~Cookies')
end)

ESX.RegisterUsableItem('MacarronesQueso', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('MacarronesQueso', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 1500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido unos ~b~Macarrones con Queso')
end)


ESX.RegisterUsableItem('EnsaladaPollo', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('EnsaladaPollo', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 1500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido una ~b~Ensalada de Pollo')
end)

ESX.RegisterUsableItem('ensalada', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ensalada', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 1500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido una ~b~Ensalada')
end)

ESX.RegisterUsableItem('tortitas', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tortitas', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 1500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido unas ~b~tortitas')
end)

ESX.RegisterUsableItem('PerritoCaliente', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('PerritoCaliente', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 1500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido un ~b~perrito caliente')
end)

ESX.RegisterUsableItem('tacos', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tacos', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido un ~b~taco')
end)

ESX.RegisterUsableItem('hamburguesaXL', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburguesaXL', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido una ~b~hamburguesa XL')
end)

ESX.RegisterUsableItem('hamburguesa', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburguesa', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido una ~b~hamburguesa')
end)

ESX.RegisterUsableItem('PalitosQueso', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('PalitosQueso', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido unos ~b~palitos de queso')
end)

ESX.RegisterUsableItem('PatatasFritas', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('PatatasFritas', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido unas ~b~patatas fritas')
end)

ESX.RegisterUsableItem('doritos', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('doritos', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido unos ~b~doritos')
end)

ESX.RegisterUsableItem('kebap', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kebap', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido uno ~b~kebap')
end)

ESX.RegisterUsableItem('BocadilloJamon', function(source) 
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('BocadilloJamon', 1)


	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has comido uno ~b~bocadillo de jamón')
end)

ESX.RegisterUsableItem('ZumoTropical', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ZumoTropical', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~b~zumo tropical')
end)

ESX.RegisterUsableItem('pepsi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pepsi', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido una ~b~pepsi')
end)

ESX.RegisterUsableItem('GranizadoChocolate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('GranizadoChocolate', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~b~granizado de chocolate')
end)

ESX.RegisterUsableItem('GranizadoFresa', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('GranizadoFresa', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~b~granizado de fresa')
end)

ESX.RegisterUsableItem('GranizadoCola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('GranizadoCola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~b~granizado de cola')
end)

ESX.RegisterUsableItem('GranizadoLimon', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('GranizadoLimon', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~b~granizado de limón')
end)

ESX.RegisterUsableItem('te', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('te', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~b~té')
end)

ESX.RegisterUsableItem('cafe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cafe', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 125000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~b~café')
end)


ESX.RegisterUsableItem('sprite', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sprite', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Te has bebido un ~b~sprite')
end)

ESX.RegisterUsableItem('vaper', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('executevape', source)
end)