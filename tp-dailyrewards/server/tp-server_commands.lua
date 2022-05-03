-- Default Command to open the daily rewards.
RegisterCommand('dailyrewards',function(source)
    TriggerClientEvent('tp-dailyrewards:openDailyRewards',source)
end)
