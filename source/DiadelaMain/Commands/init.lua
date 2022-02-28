local module = {

    kill = {
        Aliases = {
            "kill",
        },
        function (params)
            for _,p in pairs(params[1]) do
                local play = game.Players:FindFirstChild(p)
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
            for _,p in pairs(params[1]) do
                local finded = game.Players:FindFirstChild(p)
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
            for _,p in pairs(params[1]) do
                local player = game.Players:FindFirstChild(p)
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
            local teams = game.Teams:GetTeams()

            local team = params[2]
            local i = 1
            for _,p in pairs(params[1]) do
                local player = game.Players:FindFirstChild(p)
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