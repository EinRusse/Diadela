local module = {

    kill = {
        function (player)
            for _,p in pairs(player) do
                local play = game.Players:FindFirstChild(p)
                if play ~= nil then
                    play.Character.Humanoid.Health = 0
                end
            end
        end
    }
    
}

return module