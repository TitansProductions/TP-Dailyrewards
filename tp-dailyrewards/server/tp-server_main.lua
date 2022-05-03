
playerData = {}

-- OnNewMonth, reset all dailyrewards table data.
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

    local date = os.date("*t")
    local currentDay = tonumber(date.day)

    MySQL.Sync.execute('DELETE FROM dailyrewards WHERE day > ' .. currentDay) 

    if currentDay > 28 then
        return
    end

    MySQL.Sync.execute('DELETE FROM dailyrewards WHERE day = 28') 


end)

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(60000 * Config.ThreadRepeat)
  
        local date = os.date("*t")

        local currentHour, currentDay = tonumber(date.hour), tonumber(date.day)

        for k,v in pairs(ESX.GetPlayers()) do

            if v and playerData[v] then

                local xPlayer = ESX.GetPlayerFromId(v)
                local data = playerData[xPlayer.source]

                if data.received == 1 and data.current_day ~= currentDay then

                    if currentDay < 28 and playerData[xPlayer.source].day + 1 <= 28 then

                        MySQL.Sync.execute('UPDATE dailyrewards SET current_day = @current_day, day = day + 1, received = @received, received_hour = @received_hour WHERE identifier = @identifier', {
                            ["identifier"] = xPlayer.identifier,
                            ["current_day"] = currentDay,
                            ["received"] = 0,
                            ["received_hour"] = nil,
                        }) 
    
                        playerData[xPlayer.source] = {current_day = currentDay, day = playerData[xPlayer.source].day + 1, received = 0, received_hour = nil}
    
                        TriggerClientEvent("tp-dailyrewards:refreshData", xPlayer.source)
                    end 
                end
                
                if data.received == 0 and data.current_day ~= currentDay then

                    MySQL.Sync.execute('UPDATE dailyrewards SET current_day = @current_day WHERE identifier = @identifier', {
                        ["identifier"] = xPlayer.identifier,
                        ["current_day"] = currentDay,
                    }) 

                    playerData[xPlayer.source].current_day = currentDay
                end

            end

        end

    end
end)

-- Load player information data when joining the server.
RegisterServerEvent("tp-dailyrewards:loadPlayerInformation")
AddEventHandler("tp-dailyrewards:loadPlayerInformation", function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        MySQL.Async.fetchAll('SELECT * from dailyrewards WHERE identifier = @identifier',{
            ["@identifier"] = xPlayer.identifier
        },function (info)
            if info[1] == nil then
                local date = os.date("*t")

                MySQL.Async.execute('INSERT INTO dailyrewards (identifier, name, current_day) VALUES (@identifier, @name, @current_day)',
                {
                    ['@identifier'] = xPlayer.identifier,
                    ['@name'] = GetPlayerName(source),
                    ['@current_day'] = tonumber(date.day)
                })
                
                playerData[source] = {current_day = tonumber(date.day), day = 1, received = 0, received_hour = nil}
            else
                playerData[source] = {current_day = info[1].current_day, day = info[1].day, received = info[1].received, received_hour = info[1].received_hour}
            end
        end)
    end
end)

RegisterServerEvent("tp-dailyrewards:claimReward")
AddEventHandler("tp-dailyrewards:claimReward", function (week, day)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then

        for k,v in pairs(Config.DailyRewards[week]) do

            if v.day == tonumber(day) then

                local type, givenReward, givenAmount = v.dayReward.type, v.dayReward.reward, v.dayReward.amount
            
                time = os.date("*t") 
        
                MySQL.Sync.execute('UPDATE dailyrewards SET received = @received, received_hour = @received_hour WHERE identifier = @identifier', {
                    ["identifier"] = xPlayer.identifier,
                    ["received"] = 1,
                    ["received_hour"] = tonumber(time.hour),
                }) 
        
                playerData[xPlayer.source].received = 1
                playerData[xPlayer.source].received_hour = tonumber(time.hour)
            
                if type  == 'item' then
                    xPlayer.addInventoryItem(givenReward, givenAmount)
            
                elseif type  == 'weapon' then
                    xPlayer.addWeapon(givenReward, givenAmount)
            
                elseif type == 'money' then
                    xPlayer.addMoney(givenAmount)
            
                elseif type == 'black_money' then
                    xPlayer.addAccountMoney('black_money', givenAmount)
            
                elseif type == 'bank' then
                    xPlayer.addAccountMoney('bank', givenAmount)
        
                else
        
                    if Config.RewardPacks[type] then
                        local rewards = Config.RewardPacks[type].rewards
        
                        for k, v in pairs(rewards) do
        
                            if v.type  == 'item' then
                                xPlayer.addInventoryItem(v.name, v.amount)
                        
                            elseif v.type  == 'weapon' then
                                xPlayer.addWeapon(v.name, 0)
                        
                            elseif v.type == 'money' then
                                xPlayer.addMoney(v.amount)
                        
                            elseif v.type == 'black_money' then
                                xPlayer.addAccountMoney('black_money', v.amount)
                        
                            elseif v.type == 'bank' then
                                xPlayer.addAccountMoney('bank', v.amount)
                            end
                        end
                    else
                        print("Tried to buy a non existing reward Type. Make sure {"..type.."} exists in Config.RewardPacks.")
                    end
                end
        
                TriggerClientEvent('tp-dailyrewards:openDailyRewards', xPlayer.source)
            
                if Config.MythicNotifyMessage then
                    TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = _U("rewards_claimed_for_day") .. day})
                else
                    TriggerClientEvent('esx:showNotification', xPlayer.source, _U("rewards_claimed_for_day") .. day)
                end
            end    
        end
        
    end

end)


ESX.RegisterServerCallback("tp-dailyrewards:fetchUserInformation", function(source, cb)
    local _source = source

   local xPlayer = ESX.GetPlayerFromId(source)
	 
    if playerData[xPlayer.source] then
        cb(playerData[xPlayer.source])
    else
        cb(nil)
    end

end)
