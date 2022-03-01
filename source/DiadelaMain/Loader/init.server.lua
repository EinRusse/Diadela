--Main Diadela Loader

local players = game.Players
local commands = require(script.Parent.Commands)
local admins = require(script.Parent.Admin)

local function CommandExecuter(player, message, level)
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
            for _,p in pairs(commands) do
                local aliases = table.find(p.Aliases, m)
                if aliases ~= nil then
                    command = p
                    break
                end
            end
            local execute = command[1]
            execute(parameters, player, level)
        end
    end
end

local function CommandChecker(player, message)
    if message ~= nil then
        if table.find(admins.Admins, player.Name) ~= nil then
            CommandExecuter(player, message, 100)
        elseif table.find(admins.Mods, player.Name) ~= nil then
            CommandExecuter(player, message, 10)
        else
            CommandExecuter(player, message, 1)
        end
    end
end

players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        CommandChecker(player, message)
    end)
end)
