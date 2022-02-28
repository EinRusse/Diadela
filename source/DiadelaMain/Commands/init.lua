local module = {

    kill = {
        Aliases = {
            "kill",
        },
        function (params)
            local players = game.Players:GetPlayers()
            for _,p in pairs(params[1]) do
                local play = table.find(players, p)
                if play then
                    play.Character.Humanoid.Health = 0
                end
            end
        end
    },
    re = {
        Aliases = {
            "re",
            "respawn"
        },
        function (params)
            local players = game.Players:GetPlayers()
            for _,p in pairs(params) do
                local finded = table.find(players, p)
                if finded then
                    finded:LoadCharacter()
                end
            end
        end
        
    },
    team = {
        Aliases = {
            "team",
            "t"
        },
        function (params)
            local players = game.Players:GetPlayers()
            for _,p in pairs(params[1]) do
                local player = table.find(players, p)
                if player ~= nil then
                    player.Team = params[2]
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
        function (params)
            local players = game.Players:GetPlayers()
            local teams = game.Teams:GetTeams()

            local team = params[2]
            local i = 1
            for _,p in pairs(params[1]) do
                local player = table.find(players, p)
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
    }
}

return module