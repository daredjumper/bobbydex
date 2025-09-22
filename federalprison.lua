var federalprisonList = {}

game.Players.PlayerAdded:Connect(function(plr)
    print("New Player")
    print(plr)
    if table.find(federalprisonList, plr.Name) then
        task.wait(math.random(3,4))
        RunAdonisCommand(":jail "..plr.Name)
    end
end)

RegisterAdonisCommand("fprison", 1, function(raw)
    local players = GetPlayersFromAdonis(raw)
    for _, v in players do
        table.insert(federalprisonList, v.Name)
        RunAdonisCommand(":jail "..v)
    end
    RunAdonisCommand("!print Federal Prisoned "..v.Name.."!")
end)

RegisterAdonisCommand("unfprison", 1, function(raw)
    local players = GetPlayersFromAdonis(raw)
    for _, v in players do
        table.remove(federalprisonList, table.find(federalprisonList, v.Name))
        RunAdonisCommand(":unjail "..v)
    end
    RunAdonisCommand("!print Un-Federal Prisoned "..v.Name.."!")
end)
