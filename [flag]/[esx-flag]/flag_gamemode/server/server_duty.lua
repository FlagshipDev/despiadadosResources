ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:onoff')
AddEventHandler('duty:onoff', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    
    if job == 'police' or job == 'ambulance' or job == 'mechanic' or job == 'taxi' or job == 'mechanic2' or job == 'mechanic3' or job == 'mechanic4' or job == 'mechanic5' or job == 'mechanic6' then
        xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('esx:showNotification', _source, _U('offduty'))
    elseif job == 'offpolice' then
        xPlayer.setJob('police', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offambulance' then
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offtaxi' then
        xPlayer.setJob('taxi', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offmechanic' then
        xPlayer.setJob('mechanic', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offmechanic2' then
        xPlayer.setJob('mechanic2', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offmechanic3' then
        xPlayer.setJob('mechanic3', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offmechanic4' then
        xPlayer.setJob('mechanic4', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offmechanic5' then
        xPlayer.setJob('mechanic5', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offmechanic6' then
        xPlayer.setJob('mechanic6', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    end
end)