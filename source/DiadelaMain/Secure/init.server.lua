local players = game.Players
local admin = require(script.Parent.Admin)

players.PlayerAdded:Connect(function(player)
    if table.find(admin.BanList, player) ~= nil then
        player:Kick("Você esta banido.")
    end
end)