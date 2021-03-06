local module = {

    kill = {
        Aliases = {
            "kill",
        },
        function (params, player, level)
            if level >= 10 then
                local playertable = params[1]
                if playertable[1] == "all" then
                    local players = game.Players:GetPlayers()
                    for _,p in pairs(players) do
                        p.Character.Humanoid.Health = 0
                    end
                elseif playertable[1] == "others" then
                    local players = game.Players:GetPlayers()
                    local play = table.find(players, player)
                    table.remove(players, play)
                    for _,p in pairs(players) do
                        p.Character.Humanoid.Health = 0
                    end
                else
                    for _,p in pairs(playertable) do
                        local play = game.Players:FindFirstDescendant(p)
                        if play then
                            play.Character.Humanoid.Health = 0
                        end
                    end
                end
            end
        end
    },
    re = {
        Aliases = {
            "re",
            "respawn"
        },
        function (params, player, level)
            if level >= 10 then
                local playertable = params[1]
                if playertable[1] == "all" then
                    local players = game.Players:GetPlayers()
                    for _,p in pairs(players) do
                        p:LoadCharacter()
                    end
                elseif playertable[1] == "others" then
                    local players = game.Players:GetPlayers()
                    local play = table.find(players, player)
                    table.remove(players, play)
                    for _,p in pairs(players) do
                        p:LoadCharacter()
                    end
                else
                    for _,p in pairs(playertable) do
                        local play = game.Players:FindFirstDescendant(p)
                        if play then
                            p:LoadCharacter()
                        end
                    end
                end
            end
        end
        
    },
    team = {
        Aliases = {
            "team",
            "t"
        },
        function (params, _, level)
            if level >= 10  then
                for _,p in pairs(params[1]) do
                    local player = game.Players:FindFirstDescendant(p)
                    if player ~= nil then
                        player.Team = params[2]
                    end
                end
            end
        end
    },
    rteam = {
        Aliases = {
            "rteam",
            "randomteam",
            "randomizeteams"
        },
        function (params, _, level)
            if level >= 10  then
                local teams = game.Teams:GetTeams()

                local team = params[2]
                local i = 1
                for _,p in pairs(params[1]) do
                    local player = game.Players:FindFirstDescendant(p)
                    if player ~= nil then
                        if i <= #params[2] then
                            player.Team = table.find(teams, teams[i])
                            i += 1
                        else
                            player.Team = table.find(teams, team[1])
                            i = 1
                        end
                    end
                end
            end
        end
    },
    kick= {
        Aliases= {
            "kick"
        },
        function (params, _, level)
            if level >= 10  then
                local players = params[1]
                table.remove(params, 1)
                if params[1] == nil then
                    for _,p in pairs(players) do
                        local play = game.Players:FindFirstDescendant(p)
                        if play then
                            play:Kick("Voc?? foi kickado por um administrador/moderador.")
                        end
                    end
                else
                    for _,p in pairs(players) do
                        local play = game.Players:FindFirstDescendant(p)
                        if play then
                            play:Kick()
                        end
                    end
                end
            end
        end
    },
    ban ={
        Aliases = {
            "ban"
        },
        function (params, _, level)
            local admin = require(script.Parent.Admin)
            local banlist = admin.BanList
            if level >= 100 then
                for _,p in pairs(params[1]) do
                    local play = game.Players:FindFirstChild(p)
                    if play then
                        play:Kick("Voc?? foi banido.")
                        
                    end
                    table.insert(banlist, p)
                end
            end
        end
    },
    unban = {
        Aliases = {
            "unban"
        },
        function(params, _, level)
            if level >= 100 then
                local admin = require(script.Parent.Admin)
                local banlist = admin.BanList
                for _,p in pairs(params[1]) do
                    local banned = table.find(banlist, p)
                    if banned then
                        table.remove(banlist, banned)
                    end
                end
            end
        end
    }
}

return module