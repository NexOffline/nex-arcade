local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('nex-arcade:client:minigamemenu', function(args)
    lib.registerContext({
        id = 'minigameMenu',
        title = 'Minigame Practice Menu',
        options = {
          {
            title = 'Minigame Practice Menu',
          },
          {
            title = 'Practice Vehicle Hack',
            description = '$100',
            icon = 'computer',
            event = 'nex-arcade:vehiclehack'
          },
          {
            title = 'Practice VAR Hack',
            description = '$100',
            icon = 'computer',
            event = 'nex-arcade:varhack'
          },
          {
            title = 'Practice Thermite Hack',
            description = '$100',
            icon = 'computer',
            event = 'nex-arcade:thermitehack'
          },
          {
            title = 'Practice Bank Hack',
            description = '$100',
            icon = 'computer',
            event = 'nex-arcade:bankhack'
          },
        }
      })
    end) 

RegisterNetEvent('nex-arcade:bankhack', function()
end) 
    
















-- SETTINGS
-- Still working on implementing this 
RegisterNetEvent('nex-arcade:client:minigamemenuinput', function()
local dialog = exports['qb-input']:ShowInput({
    header = "Practce Hack Settings",
    submitText = "Input",
    inputs = {
        {
            text = "Time (Seconds)", -- text you want to be displayed as a place holder
            name = "timeseconds", -- name of the input should be unique otherwise it might override
            type = "number", -- type of the input
            isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
        },
        {
            text = "Number of Hacks (This may not work for certain Hacks)", -- text you want to be displayed as a place holder
            name = "hackamount", -- name of the input should be unique otherwise it might override
            type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
            isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
        }
},
})

if dialog ~= nil then
    for k,v in pairs(dialog) do
        print(k .. " : " .. v)
    end
end
end, false)