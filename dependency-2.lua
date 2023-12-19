-- Created by xvverr
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local function sendMessageToPlayer(message)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = message,
        Color = Color3.new(1, 1, 1)
    })
end

local function handlePlayerChange(player, isJoining)
    local username = player.Name

    if isJoining then
        if player == game.Players.LocalPlayer then
            sendMessageToPlayer("Game Utilities loaded!")
        else
            if player:IsFriendsWith(game.Players.LocalPlayer.UserId) then
                sendMessageToPlayer("Your friend " .. username .. " has joined the server.")
            else
                sendMessageToPlayer(username .. " has joined the server.")
            end
        end
    else
        if player:IsFriendsWith(game.Players.LocalPlayer.UserId) then
            sendMessageToPlayer("Your friend " .. username .. " has left the server.")
        else
            sendMessageToPlayer(username .. " has left the server.")
        end
    end
end

local function handlePlayerDeath(player)
    local username = player.Name

    if player == game.Players.LocalPlayer then
        sendMessageToPlayer("You have died.")
    else
        sendMessageToPlayer(username .. " has died.")
    end
end

Players.PlayerAdded:Connect(function(player)
    handlePlayerChange(player, true)

    player.CharacterAdded:Connect(function()
        player.Character:WaitForChild("Humanoid").Died:Connect(function()
            handlePlayerDeath(player)
        end)
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    handlePlayerChange(player, false)
end)
