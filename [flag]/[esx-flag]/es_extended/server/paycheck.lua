


ESX.StartPayCheck = function()

	function payCheck()
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local job     = xPlayer.job.grade_name
			local salary  = xPlayer.job.grade_salary
			local salaryVip = 0
		--	local vip

			
			if salary > 0 then
				if xPlayer.fechVip ~= nil then
					salaryVip = salary * 2
					paycheckRec = _U('received_paycheck2')
				else
					paycheckRec = _U('received_paycheck')
				end
					if job == 'unemployed' then -- unemployed
						xPlayer.addAccountMoney('bank', salary)
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), paycheckRec, _U('received_help', salary), 'CHAR_BANK_MAZE', 9)
					elseif Config.EnableSocietyPayouts then -- possibly a society
						TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
							if society ~= nil then -- verified society
								TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function (account)
									if account.money >= salary then -- does the society money to pay its employees?
										if xPlayer.fechVip ~= nil then
											xPlayer.addAccountMoney('bank', salaryVip)
											TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), paycheckRec, _U('received_salary', salaryVip), 'CHAR_BANK_MAZE', 9)
										else
											xPlayer.addAccountMoney('bank', salary)
											TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), paycheckRec, _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
										end
										account.removeMoney(salary)
									else
										TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), '', _U('company_nomoney'), 'CHAR_BANK_MAZE', 1)
									end
								end)
							else -- not a society
								if xPlayer.fechVip ~= nil then
									xPlayer.addAccountMoney('bank', salaryVip)
									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), paycheckRec, _U('received_salary', salaryVip), 'CHAR_BANK_MAZE', 9)
								else
									xPlayer.addAccountMoney('bank', salary)
									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), paycheckRec, _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
								end
							end
						end)
					else -- generic job
						if xPlayer.fechVip ~= nil then
							xPlayer.addAccountMoney('bank', salaryVip)
							TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), paycheckRec, _U('received_salary', salaryVip), 'CHAR_BANK_MAZE', 9)
						else
							xPlayer.addAccountMoney('bank', salary)
							TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), paycheckRec, _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
						end
					end
			end

		end

		SetTimeout(Config.PaycheckInterval, payCheck)

	end

	SetTimeout(Config.PaycheckInterval, payCheck)

end
