Config              = {}

Config.Locale       = "en"

Config.UseKeyToOpen = false
Config.KeyToOpen    = 0

-- Checks if player received reward / not and day changed to update its data.
-- Default is every 10 minutes.
Config.ThreadRepeat = 10

-- If Config.MythicNotifyMessage is set to false, ESX Messages will be sent than mythic_notify.
Config.MythicNotifyMessage = false

Config.RewardPacks    = {
    ['clips'] = {
        rewards = {
            ['1'] = {name = "disc_ammo_pistol",  type = "item", amount = 5},
            ['2'] = {name = "disc_ammo_rifle",   type = "item", amount = 5},
            ['3'] = {name = "disc_ammo_smg",     type = "item", amount = 5},
        },
    },
    ['example1'] = {
        rewards = {
            ['1'] = {name = "",  type = "money", amount = 50},
            ['2'] = {name = "",  type = "black_money", amount = 500},
            ['3'] = {name = "",  type = "bank", amount = 5000},
        },
    },

    ['example2'] = {
        rewards = {
            ['1'] = {name = "WEAPON_PISTOL",  type = "weapon", amount = 0},
        },
    },
}

-- DO NOT touch WEEKS & DAYS if you don't have enough knowledge, if you do, it will break the rewards system.
-- Max days for getting daily rewards are 28 (4 Weeks).

-- For testing, you can do it manually from dailyrewards sql table, set day and received to 0

Config.DailyRewards = {
    ['WEEK_1'] = {
        {
            day = 1,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 50,
                title = 'CASH',
                description = '- $50 CASH',
                image = 'img/items/coins_rewardbox.png'
            },
        },
        {
            day = 2,
            dayReward = {
                type = 'clips',
                reward = 'clips',
                amount = 1,
                title = 'CLIPS',
                description = '- 5x PISTOL, AR & SMG CLIPS',
                image = 'img/items/vests_and_ammo_rewardbox.png'
            },
        },
    
        {
            day = 3,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_COMBATPDW',
                amount = 1,
                title = 'UMP-45',
                description = '',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
    
        {
            day = 4,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_MICROSMG',
                amount = 1,
                title = 'UZI',
                description = '',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
        {
            day = 5,
            dayReward = {
                type = 'item',
                reward = 'medikit',
                amount = 5,
                title = 'MEDICAL',
                description = '- 5x MEDICAL SUPPLEMENTS',
                image = 'img/items/items_rewardbox.png'
            },
        },
    
        {
            day = 6,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_PUMPSHOTGUN',
                amount = 1,
                title = 'PUMP SHOTGUN',
                description = '',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
        {
            day = 7,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_COMPACTRIFLE',
                amount = 50,
                title = 'COMPACT RIFLE',
                description = '',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    },

    ['WEEK_2'] = {
        {
            day = 8,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 50,
                title = 'CASH',
                description = '- $50 CASH',
                image = 'img/items/coins_rewardbox.png'
            },
        },
        {
            day = 9,
            dayReward = {
                type = 'clips',
                reward = 'clips',
                amount = 1,
                title = 'CLIPS',
                description = '- 5x PISTOL, AR & SMG CLIPS',
                image = 'img/items/vests_and_ammo_rewardbox.png'
            },
        },
    
        {
            day = 10,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_COMBATPDW',
                amount = 1,
                title = 'UMP-45',
                description = '- “Who said personal weaponry couldnt be worthy of military personnel? Thanks to our lobbyists, not Congress. Integral suppressor.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
    
        {
            day = 11,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_MICROSMG',
                amount = 1,
                title = 'UZI',
                description = '- “Combines compact design with a high rate of fire at approximately 700-900 rounds per minute.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
        {
            day = 12,
            dayReward = {
                type = 'item',
                reward = 'medikit',
                amount = 5,
                title = 'MEDICAL',
                description = '- 5x MEDICAL SUPPLEMENTS',
                image = 'img/items/items_rewardbox.png'
            },
        },
    
        {
            day = 13,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_PUMPSHOTGUN',
                amount = 1,
                title = 'PUMP SHOTGUN',
                description = '- “Standard shotgun ideal for short-range combat. A high-projectile spread makes up for its lower accuracy at long range.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
        {
            day = 14,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_COMPACTRIFLE',
                amount = 50,
                title = 'COMPACT RIFLE',
                description = '- “Half the size, all the power, double the recoil: theres no riskier way to say Im compensating for something.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    },

    ['WEEK_3'] = {
        {
            day = 15,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 50,
                title = 'CASH',
                description = '- $50 CASH',
                image = 'img/items/coins_rewardbox.png'
            },
        },
        {
            day = 16,
            dayReward = {
                type = 'clips',
                reward = 'clips',
                amount = 1,
                title = 'CLIPS',
                description = '- 5x PISTOL, AR & SMG CLIPS',
                image = 'img/items/box.png'
            },
        },
    
        {
            day = 17,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_COMBATPDW',
                amount = 1,
                title = 'UMP-45',
                description = '- “Who said personal weaponry couldnt be worthy of military personnel? Thanks to our lobbyists, not Congress. Integral suppressor.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
    
        {
            day = 18,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_MICROSMG',
                amount = 1,
                title = 'UZI',
                description = '- “Combines compact design with a high rate of fire at approximately 700-900 rounds per minute.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
        {
            day = 19,
            dayReward = {
                type = 'item',
                reward = 'medikit',
                amount = 5,
                title = 'MEDICAL',
                description = '- 5x MEDICAL SUPPLEMENTS',
                image = 'img/items/items_rewardbox.png'
            },
        },
    
        {
            day = 20,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_PUMPSHOTGUN',
                amount = 1,
                title = 'PUMP SHOTGUN',
                description = '- “Standard shotgun ideal for short-range combat. A high-projectile spread makes up for its lower accuracy at long range.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
        {
            day = 21,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_COMPACTRIFLE',
                amount = 50,
                title = 'COMPACT RIFLE',
                description = '- “Half the size, all the power, double the recoil: theres no riskier way to say Im compensating for something.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    },

    ['WEEK_4'] = {
        {
            day = 22,
            dayReward = {
                type = 'money',
                reward = 'CASH',
                amount = 50,
                title = 'CASH',
                description = '- $50 CASH',
                image = 'img/items/coins_rewardbox.png'
            },
        },
        {
            day = 23,
            dayReward = {
                type = 'clips',
                reward = 'clips',
                amount = 1,
                title = 'CLIPS',
                description = '- 5x PISTOL, AR & SMG CLIPS',
                image = 'img/items/vests_and_ammo_rewardbox.png'
            },
        },
    
        {
            day = 24,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_COMBATPDW',
                amount = 1,
                title = 'UMP-45',
                description = '- “Who said personal weaponry couldnt be worthy of military personnel? Thanks to our lobbyists, not Congress. Integral suppressor.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
    
        {
            day = 25,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_MICROSMG',
                amount = 1,
                title = 'UZI',
                description = '- “Combines compact design with a high rate of fire at approximately 700-900 rounds per minute.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
        {
            day = 26,
            dayReward = {
                type = 'item',
                reward = 'medikit',
                amount = 5,
                title = 'MEDICAL',
                description = '- 5x MEDICAL SUPPLEMENTS',
                image = 'img/items/items_rewardbox.png'
            },
        },
    
        {
            day = 27,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_PUMPSHOTGUN',
                amount = 1,
                title = 'PUMP SHOTGUN',
                description = '- “Standard shotgun ideal for short-range combat. A high-projectile spread makes up for its lower accuracy at long range.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    
        {
            day = 28,
            dayReward = {
                type = 'weapon',
                reward = 'WEAPON_COMPACTRIFLE',
                amount = 50,
                title = 'COMPACT RIFLE',
                description = '- “Half the size, all the power, double the recoil: theres no riskier way to say Im compensating for something.”',
                image = 'img/items/weapons_rewardbox.png'
            },
        },
    },
}
