ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterServerCallback('pazzodoktor:doktorsOnline', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	local medicsOnline = 0
	local enoughMoney = false

	enoughMoney = true

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'ambulance' then
			medicsOnline = medicsOnline + 1
		end
	end

	cb(medicsOnline, enoughMoney)
end)

RegisterServerEvent('pazzodoktor:odeme')
AddEventHandler('pazzodoktor:odeme', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
		account.addMoney(Config.AIDoctor.Price)
		if xPlayer.getMoney() >= Config.AIDoctor.Price then
			xPlayer.removeMoney(Config.AIDoctor.Price)
		else
			xPlayer.removeAccountMoney('bank', Config.AIDoctor.Price)
		end
	end)
end)