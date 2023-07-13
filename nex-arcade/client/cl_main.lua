local QBCore = exports['qb-core']:GetCoreObject()
local playertables = { -- Add tables here as needed
    {table = 'hacktype'}
}

RegisterNetEvent('nex-arcade:client:minigamemenu', function(args)
    lib.registerContext({
        id = 'minigameMenu',
        title = 'Minigame Practice Menu',
        options = {
          {
            title = 'Practice Vehicle Hack',
            description = '$100',
            icon = 'car',
            event = 'nex-arcade:vehiclehack'
          },
          {
            title = 'Practice VAR Hack',
            description = '$100',
            icon = 'vr-cardboard',
            event = 'nex-arcade:varhack'
          },
          {
            title = 'Practice Thermite Hack',
            description = '$100',
            icon = 'bomb',
            event = 'nex-arcade:thermitehack'
          },
          {
            title = 'Practice Laptop Hack',
            description = '$100',
            icon = 'laptop',
            event = 'nex-arcade:bankhack'
          },
          {
            title = 'Practice Circle Hack',
            description = '$100',
            icon = 'lock',
            event = 'nex-arcade:circlehack'
          },
          {
            title = 'Practice Maze Hack',
            description = '$100',
            icon = 'database',
            event = 'nex-arcade:mazehack'
          },
        }
      })
        
        lib.showContext('minigameMenu')
    end) 

RegisterNetEvent('nex-arcade:vehiclehack', function()
  TriggerServerEvent('nex-arcade:removemoney')
    local input = lib.inputDialog('Settings', {
        {type = 'number', label = 'Seconds', description = 'The amount of time you want to have hacking', required = true},
        {type = 'number', label = 'Mirrored', description = '(0: Normal, 1: Normal + Mirrored 2: Mirrored only )', required = true},
        {type = 'select', label = 'Type', description = 'What type of hack do you want to do?', required = true, options = {
          { value = 'alphabet', label = 'Alphabet'},
          { value = 'numeric', label = 'Numeric'},
          { value = 'alphanumeric', label = 'Alphanumeric'},
          { value = 'greek', label = 'Greek'},
          { value = 'braille', label = 'Braille'},
          { value = 'runes', label = 'Runes'},
        }}
      }) 
        print(json.encode(input), input[1], input[2], input[3])
    exports['ps-ui']:Scrambler(function(success)
      if success then
          QBCore.Functions.Notify("You Finished the Hack!", "success") 
	    else
		    QBCore.Functions.Notify("You Failed the Hack...", "error") 
	    end
    end, input[3], input[1], input[2])    
  end)

RegisterNetEvent('nex-arcade:circlehack', function()
        
        TriggerServerEvent('nex-arcade:removemoney')
       local input = lib.inputDialog('Settings', {
        {type = 'number', label = 'Seconds', description = 'The amount of time you want to have solve (MS)', required = true},
        {type = 'number', label = 'Circles', description = 'Amount of circles you have to complete before finishing the hack', required = true}
      }) 
        
        exports['ps-ui']:Circle(function(success)
    if success then
        QBCore.Functions.Notify("You Finished the Hack!", "success") 
	else
		QBCore.Functions.Notify("You Failed the Hack...", "error") 
	end
end, input[2], input[1]) -- NumberOfCircles, MS
     end)    

RegisterNetEvent('nex-arcade:mazehack', function()
        
        TriggerServerEvent('nex-arcade:removemoney')
       local input = lib.inputDialog('Settings', {
        {type = 'number', label = 'Seconds', description = 'The amount of time you want to have solve', required = true}
      }) 
        
exports['ps-ui']:Maze(function(success)
    if success then
        QBCore.Functions.Notify("You Finished the Hack!", "success") 
	else
		QBCore.Functions.Notify("You Failed the Hack...", "error") 
	end
end, input[1]) -- Hack Time Limit
     end)    
        
RegisterNetEvent('nex-arcade:bankhack', function()
        
          TriggerServerEvent('nex-arcade:removemoney')
       local input = lib.inputDialog('Settings', {
        {type = 'number', label = 'Seconds', description = 'The amount of time you want to have hacking', required = true},
        {type = 'number', label = 'Blocks', description = 'Amount of blocks you have to solve to complete a page', required = true},
        {type = 'number', label = 'Pages', description = 'Number of pages you want to go through before ending', required = true}
      }) 
        exports['hacking']:OpenHackingGame(input[1], input[2], input[3], function(Success)
        print(Success)
        if Success then
            QBCore.Functions.Notify("You Finished the Hack!", "success") 
        else
            QBCore.Functions.Notify("You Failed the Hack...", "error") 
        end
end)
  
        end) 
RegisterNetEvent('nex-arcade:thermitehack', function()
        
       TriggerServerEvent('nex-arcade:removemoney')
       local input = lib.inputDialog('Settings', {
        {type = 'number', label = 'Seconds', description = 'The amount of time you want to have hacking', required = true},
        {type = 'number', label = 'Gridsize', description = 'How many blocks you have on each side', required = true},
        {type = 'number', label = 'Incorrect Blocks', description = 'Number of wrong blocks you have to hit before failing', required = true}
      })         
                exports['ps-ui']:Thermite(function(success)
   if success then
      QBCore.Functions.Notify("You Finished the Hack!", "success") 
   else
   	QBCore.Functions.Notify("You Failed the Hack...", "error") 
   end
end, input[1], input[2], input[3]) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
end) 

RegisterNetEvent('nex-arcade:varhack', function()
        TriggerServerEvent('nex-arcade:removemoney')
      local input = lib.inputDialog('Settings', {
        {type = 'number', label = 'Seconds', description = 'The amount of time you want to wait before hacking', required = true},
        {type = 'number', label = 'Blocks', description = 'Number of Blocks', required = true}
      })
        
        exports['ps-ui']:VarHack(function(success)
              if success then
                  QBCore.Functions.Notify("You Finished the Hack!", "success") 
            else
              QBCore.Functions.Notify("You Failed the Hack...", "error") 
            end
          end, input[2], input[1]) -- Number of Blocks, Time (seconds)
        end) 
