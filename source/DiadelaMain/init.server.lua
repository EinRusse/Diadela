--Main Diadela Loader

local players = game.Players
local commands = require(script.Commands)
local admins = require(script.Admin)

local function CommandChecker(player, message)
    if message ~= nil then
        if table.find(admins.Admins, player.Name) ~= nil then
            message = string.split(message, " ")
            local commando = message[1]
            table.remove(message, 1)
            local parameters = {}
            for _,n in pairs(message) do 
                local parameter = string.split(n, ",")
                table.insert(parameters, parameter)
            end
            local m,c = string.gsub(commando, ";", "")
            local command = string.split(m, " ")
            if c == 1  then
                local execute = commands[command[1]]
                if execute ~= nil then
                    execute[1](parameters)
                end 
            end
        end
    end
end

players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        CommandChecker(player, message)
    end)
end)
