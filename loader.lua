-- Created by xvverr
local UIS = game:GetService("UserInputService")

local function makeDraggable(frame)
    local dragging
    local dragInput
    local dragStart
    local startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local function createLoadingGui()
    local LoadingGui = Instance.new("ScreenGui")
    LoadingGui.Name = "LoadingGui"
    LoadingGui.Parent = game.Players.LocalPlayer.PlayerGui

    local loadingText = Instance.new("TextLabel")
    loadingText.Text = "Loading..."
    loadingText.Size = UDim2.new(0, 200, 0, 50)
    loadingText.Position = UDim2.new(0.5, -100, 0.5, -25)
    loadingText.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    loadingText.TextColor3 = Color3.new(1, 1, 1)
    loadingText.Parent = LoadingGui

    return LoadingGui
end

local function createButton(text, position)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
    return button
end

local function createHomeGui()
    local HomeGui = Instance.new("ScreenGui")
    HomeGui.Name = "HomeGui"
    HomeGui.Parent = game.Players.LocalPlayer.PlayerGui

    local homeFrame = Instance.new("Frame")
    homeFrame.Name = "homeFrame"
    homeFrame.Size = UDim2.new(0, 600, 0, 400)
    homeFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    homeFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    homeFrame.Parent = HomeGui

    local welcomeLabel = Instance.new("TextLabel")
    welcomeLabel.Text = "Welcome to BSH, " .. game.Players.LocalPlayer.Name .. "!"
    welcomeLabel.Size = UDim2.new(1, 0, 0, 30)
    welcomeLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    welcomeLabel.TextColor3 = Color3.new(1, 1, 1)
    welcomeLabel.Parent = homeFrame

    local buttonPositions = {}
    for row = 1, 4 do
        for col = 1, 5 do
            table.insert(buttonPositions, UDim2.new(0, (col - 1) * 110 + 10, 0, (row - 1) * 60 + 70))
        end
    end

    local buttons = {}
    for i = 1, 20 do
        if i == 1 then
            buttons[i] = createButton("Infinite Yield FE", buttonPositions[i])
            buttons[i].MouseButton1Click:Connect(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
            end)
        elseif i == 2 then
            buttons[i] = createButton("Grab Knife V3", buttonPositions[i])
            buttons[i].MouseButton1Click:Connect(function()
                print("Works only in Prison Life. You have to be R6.")
                loadstring(game:HttpGet("https://pastebin.com/raw/frHvA27v"))()
            end)
        elseif i == 3 then
            buttons[i] = createButton("Mobile Keyboard V1", buttonPositions[i])
            buttons[i].MouseButton1Click:Connect(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
            end)
        elseif i == 4 then
            buttons[i] = createButton("Chat Encryption", buttonPositions[i])
            buttons[i].MouseButton1Click:Connect(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/xvverr/Roblox-BSH/main/dependency-1"))()
            end)
        elseif i == 5 then
            buttons[i] = createButton("Game Utilities", buttonPositions[i])
            buttons[i].MouseButton1Click:Connect(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/xvverr/Roblox-BSH/main/dependency-2"))()
            end)
        else
            buttons[i] = createButton("Cooming soon!", buttonPositions[i])
            buttons[i].MouseButton1Click:Connect(function()
                print("Coming soon!")
            end)
        end
        buttons[i].Parent = homeFrame
    end

    local closeButton = createButton("Close GUI", UDim2.new(0, 10, 1, -40))
    closeButton.MouseButton1Click:Connect(function()
        HomeGui:Destroy()
    end)
    closeButton.Parent = homeFrame

    makeDraggable(homeFrame)
end

local function createLoginGui()
    local LoginGui = Instance.new("ScreenGui")
    LoginGui.Name = "LoginGui"
    LoginGui.Parent = game.Players.LocalPlayer.PlayerGui

    local loginFrame = Instance.new("Frame")
    loginFrame.Name = "Frame"
    loginFrame.Size = UDim2.new(0, 400, 0, 300)
    loginFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    loginFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    loginFrame.Parent = LoginGui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = "Basic Script Hub"
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.Parent = loginFrame

    local keyLabel = Instance.new("TextLabel")
    keyLabel.Text = "Insert access key below"
    keyLabel.Size = UDim2.new(1, 0, 0, 20)
    keyLabel.Position = UDim2.new(0, 0, 0, 40)
    keyLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    keyLabel.TextColor3 = Color3.new(1, 1, 1)
    keyLabel.Parent = loginFrame

    local keyInput = Instance.new("TextBox")
    keyInput.Size = UDim2.new(1, -20, 0, 30)
    keyInput.Position = UDim2.new(0, 10, 0, 70)
    keyInput.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
    keyInput.Parent = loginFrame

    local checkButton = Instance.new("TextButton")
    checkButton.Text = "Check key"
    checkButton.Size = UDim2.new(1, -20, 0, 30)
    checkButton.Position = UDim2.new(0, 10, 0, 110)
    checkButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
    checkButton.Parent = loginFrame

    checkButton.MouseButton1Click:Connect(function()
        if keyInput.Text == "archer" then
            LoginGui:Destroy()
            createHomeGui()
        else
            game.Players.LocalPlayer:Kick("wrong key skid")
        end
    end)

    makeDraggable(loginFrame)
end

local loadingGui = createLoadingGui()

wait(5)

loadingGui:Destroy()
createLoginGui()
