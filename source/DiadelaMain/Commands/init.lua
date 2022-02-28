local module = {

    kill = {
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
        function (params)
            local players = game.Players:GetPlayers()
            for _,p in pairs(params[1]) do
                local finded = table.find(players, p)
                if finded then
                    finded:LoadCharacter()
                end
            end
        end
    },
    team = {
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
        function (params)
            for _,p in pairs(params[1])do
                local teams = params[2]
                local player = game.Players:FindFirstChild(p)
                if player ~= nil then
                    local i = math.random(1, #teams)
                    player.Team = game.teams:FindFirstChild(teams[i])
                end
            end
        end
    }
}

return module