--Main Diadela Loader

local players = game.Players
local commands = require(script.Commands)
local admins = require(script.Admin)

local function CommandChecker(player, message)
    if message ~= nil then
        local parameter = string.split(message, " ")
        local parameters = string.split(parameter[2], ",")
        local m,c = string.gsub(message, ";", "")
        local command = string.split(m, " ")
        if c == 1 then
            if table.find(admins.Admins, player.Name) ~= nil then
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
