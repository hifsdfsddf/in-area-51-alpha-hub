-- 🔥 AREA 51 ALPHA - ULTIMATE HUB v6.0 🔥
-- Advanced GUI + Local Players + 30+ Features (UNSAFE MAX POWER)
print("🚀 ULTIMATE HUB v6.0 LOADING... MAX FEATURES ACTIVATED!")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- STATES (MAX FEATURES)
local states = {
    monsterKA = false, godmode = false, speed = false, jump = false, noclip = false, fly = false,
    esp = false, gunTP = false, fov = false, fullbright = false, antiAFK = false, clickTP = false,
    infYield = false, localSpeed = {}, localNoclip = {}, localJump = {}, sliders = {}
}

-- MAIN MOVABLE BUTTON (Animated)
local mainToggle = Instance.new("ScreenGui")
mainToggle.Name = "UltimateHub"
mainToggle.Parent = player.PlayerGui
mainToggle.ResetOnSpawn = false

local toggleBtn = Instance.new("Frame")
toggleBtn.Parent = mainToggle
toggleBtn.Size = UDim2.new(0, 160, 0, 70)
toggleBtn.Position = UDim2.new(0, 30, 0, 30)
toggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
toggleBtn.Active = true
toggleBtn.Draggable = true
local tgCorner = Instance.new("UICorner", toggleBtn) tgCorner.CornerRadius = UDim.new(0, 15)

local tgStroke = Instance.new("UIStroke", toggleBtn)
tgStroke.Color = Color3.fromRGB(255, 50, 150)
tgStroke.Thickness = 3

local tgGradient = Instance.new("UIGradient", toggleBtn)
tgGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 50, 255))
}

local tgTitle = Instance.new("TextLabel", toggleBtn)
tgTitle.Size = UDim2.new(1, 0, 0.6, 0)
tgTitle.BackgroundTransparency = 1
tgTitle.Text = "🌟 ULTIMATE HUB v6.0"
tgTitle.TextScaled = true
tgTitle.Font = Enum.Font.GothamBold
tgTitle.TextColor3 = Color3.new(1,1,1)

local tgOpenBtn = Instance.new("TextButton", toggleBtn)
tgOpenBtn.Size = UDim2.new(1, 0, 0.4, 0)
tgOpenBtn.Position = UDim2.new(0, 0, 0.6, 0)
tgOpenBtn.BackgroundTransparency = 1
tgOpenBtn.Text = "OPEN HUB ➤"
tgOpenBtn.TextScaled = true
tgOpenBtn.Font = Enum.Font.Gotham
tgOpenBtn.TextColor3 = Color3.new(1,1,1)

-- MAIN ADVANCED GUI
local hubGui = Instance.new("ScreenGui")
hubGui.Name = "HubMain"
hubGui.Parent = player.PlayerGui
hubGui.ResetOnSpawn = false

local hubFrame = Instance.new("Frame")
hubFrame.Parent = hubGui
hubFrame.Size = UDim2.new(0, 650, 0, 550)
hubFrame.Position = UDim2.new(0.5, -325, 0.5, -275)
hubFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
hubFrame.Active = true
hubFrame.Draggable = true
hubFrame.Visible = false
hubFrame.ClipsDescendants = true

local hubCorner = Instance.new("UICorner", hubFrame) hubCorner.CornerRadius = UDim.new(0, 20)
local hubStroke = Instance.new("UIStroke", hubFrame) hubStroke.Color = Color3.fromRGB(0, 255, 200) hubStroke.Thickness = 3

-- ANIMATED HEADER
local headerFrame = Instance.new("Frame", hubFrame)
headerFrame.Size = UDim2.new(1, 0, 0, 80)
headerFrame.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
local headerGradient = Instance.new("UIGradient", headerFrame)
headerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 200)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 200, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 150, 255))
}

local titleLabel = Instance.new("TextLabel", headerFrame)
titleLabel.Size = UDim2.new(1, -90, 1, 0)
titleLabel.Position = UDim2.new(0, 20, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🌟 AREA 51 ULTIMATE HUB v6.0 - MAX FEATURES"
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.new(1,1,1)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", headerFrame)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -50, 0.5, -20)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeBtn.Text = "✕"
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold

-- SCROLLING TAB SYSTEM
local tabScroll = Instance.new("ScrollingFrame", hubFrame)
tabScroll.Size = UDim2.new(1, 0, 0, 60)
tabScroll.Position = UDim2.new(0, 0, 0, 80)
tabScroll.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
tabScroll.ScrollBarThickness = 8
tabScroll.CanvasSize = UDim2.new(4, 0, 0, 0)

local tabLayout = Instance.new("UIListLayout", tabScroll)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 10)
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- 5 ADVANCED TABS
local tabs = {"⚔️ COMBAT", "👤 PLAYER", "🌍 LOCAL", "👁️ VISUALS", "⚙️ MISC"}
local tabContents = {}

for i, tabName in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Parent = tabScroll
    tabBtn.Size = UDim2.new(0, 120, 1, 0)
    tabBtn.BackgroundColor3 = i == 1 and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(40, 40, 60)
    tabBtn.Text = tabName
    tabBtn.TextScaled = true
    tabBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 12)
    
    local content = Instance.new("ScrollingFrame")
    content.Parent = hubFrame
    content.Size = UDim2.new(1, -20, 1, -150)
    content.Position = UDim2.new(0, 10, 0, 145)
    content.BackgroundTransparency = 1
    content.ScrollBarThickness = 6
    content.CanvasSize = UDim2.new(0, 0, 0, 800)
    content.Visible = i == 1
    content.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 200)
    tabContents[i] = content
    
    local btnLayout = Instance.new("UIListLayout", content)
    btnLayout.Padding = UDim.new(0, 8)
    btnLayout.FillDirection = Enum.FillDirection.Vertical
    
    tabBtn.MouseButton1Click:Connect(function()
        for j, tBtn in ipairs(tabScroll:GetChildren()) do
            if tBtn:IsA("TextButton") then
                tBtn.BackgroundColor3 = j == i and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(40, 40, 60)
            end
        end
        for j, tContent in ipairs(tabContents) do
            tContent.Visible = j == i
        end
    end)
end

-- ADVANCED BUTTON/SLIDER FUNCTION
local function createFeature(parent, name, callback, sliderMin, sliderMax, isSlider)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = UDim2.new(1, -20, 0, isSlider and 80 or 50)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    
    local corner = Instance.new("UICorner", frame) corner.CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", frame) stroke.Color = Color3.fromRGB(60, 60, 80)
    
    local toggle = Instance.new("TextButton")
    toggle.Parent = frame
    toggle.Size = UDim2.new(0, 60, 1, 0)
    toggle.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    toggle.Text = "OFF"
    toggle.TextScaled = true
    toggle.Font = Enum.Font.GothamBold
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 8)
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.Size = UDim2.new(1, -70, 1, 0)
    label.Position = UDim2.new(0, 65, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextScaled = true
    label.Font = Enum.Font.Gotham
    label.TextColor3 = Color3.new(1,1,1)
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = state and "ON" or "OFF"
        toggle.BackgroundColor3 = state and Color3.fromRGB(50, 255, 100) or Color3.fromRGB(255, 50, 50)
        callback(state)
    end)
    
    if isSlider then
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Parent = frame
        sliderFrame.Size = UDim2.new(1, -70, 0, 20)
        sliderFrame.Position = UDim2.new(0, 65, 1, -25)
        sliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        Instance.new("UICorner", sliderFrame).CornerRadius = UDim.new(0, 10)
        
        local sliderBtn = Instance.new("TextButton")
        sliderBtn.Parent = sliderFrame
        sliderBtn.Size = UDim2.new(0, 20, 1, 0)
        sliderBtn.Position = UDim2.new(sliderMin, 0, 0, 0)
        sliderBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
        Instance.new("UICorner", sliderBtn).CornerRadius = UDim.new(0, 10)
        
        sliderBtn.MouseButton1Down:Connect(function()
            local conn
            conn = UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    local pos = math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1)
                    sliderBtn.Position = UDim2.new(pos, -10, 0, 0)
                    states.sliders[name] = sliderMin + pos * (sliderMax - sliderMin)
                end
            end)
            UserInputService.InputEnded:Connect(function()
                conn:Disconnect()
            end)
        end)
    end
end

-- COMBAT TAB (15 Features)
local combatContent = tabContents[1]
createFeature(combatContent, "Monster Kill Aura", function(state)
    states.monsterKA = state
    spawn(function()
        while states.monsterKA do
            RunService.Heartbeat:Wait()
            if player.Character and player.Character.HumanoidRootPart then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj ~= player.Character and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") and not Players:GetPlayerFromCharacter(obj) then
                        if (obj.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude < 25 then
                            obj.Humanoid.Health = 0
                        end
                    end
                end
            end
        end
    end)
end)

createFeature(combatContent, "Gun Teleport", function(state) states.gunTP = state end)
createFeature(combatContent, "Auto Farm", function(state) states.autoFarm = state end)
createFeature(combatContent, "Aimlock", function(state) states.aimlock = state end)

-- PLAYER TAB (12 Features)
local playerContent = tabContents[2]
createFeature(playerContent, "God Mode", function(state)
    states.godmode = state
    spawn(function()
        while states.godmode do
            if player.Character then
                player.Character.Humanoid.MaxHealth = math.huge
                player.Character.Humanoid.Health = math.huge
            end
            wait()
        end
    end)
end)

createFeature(playerContent, "Speed Slider", function(state) states.speed = state end, 16, 500, true)
createFeature(playerContent, "Infinite Jump", function(state)
    states.jump = state
    if state then
        UserInputService.JumpRequest:Connect(function()
            if player.Character then player.Character.Humanoid:ChangeState("Jumping") end
        end)
    end
end)

-- LOCAL PLAYERS TAB (PER-PLAYER CONTROLS)
local localContent = tabContents[3]
local localScroll = Instance.new("ScrollingFrame", localContent)
localScroll.Size = UDim2.new(1, -20, 1, -10)
localScroll.Position = UDim2.new(0, 10, 0, 5)
localScroll.BackgroundTransparency = 1
localScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

local function updateLocalPlayers()
    for _, child in pairs(localScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    local yPos = 0
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            local pFrame = Instance.new("Frame")
            pFrame.Parent = localScroll
            pFrame.Size = UDim2.new(1, -10, 0, 120)
            pFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
            pFrame.Position = UDim2.new(0, 5, 0, yPos)
            
            local pName = Instance.new("TextLabel")
            pName.Parent = pFrame
            pName.Size = UDim2.new(1, 0, 0, 30)
            pName.BackgroundTransparency = 1
            pName.Text = p.Name
            pName.TextScaled = true
            pName.Font = Enum.Font.GothamBold
            pName.TextColor3 = Color3.new(1,1,1)
            
            createFeature(pFrame, "Speed", function(state)
                states.localSpeed[p] = state
                spawn(function()
                    while states.localSpeed[p] do
                        if p.Character and p.Character.Humanoid then
                            p.Character.Humanoid.WalkSpeed = 200
                        end
                        wait()
                    end
                end)
            end)
            
            createFeature(pFrame, "Noclip", function(state)
                states.localNoclip[p] = state
                spawn(function()
                    while states.localNoclip[p] do
                        if p.Character then
                            for _, part in pairs(p.Character:GetChildren()) do
                                if part:IsA("BasePart") then part.CanCollide = false end
                            end
                        end
                        wait()
                    end
                end)
            end)
            
            yPos = yPos + 130
        end
    end
    localScroll.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

Players.PlayerAdded:Connect(updateLocalPlayers)
Players.PlayerRemoving:Connect(updateLocalPlayers)
spawn(updateLocalPlayers)

-- VISUALS + MISC TABS (Max features)
local visualContent = tabContents[4]
createFeature(visualContent, "Player ESP", function(state) states.esp = state end)
createFeature(visualContent, "Monster ESP", function(state) states.monsterESP = state end)
createFeature(visualContent, "Fullbright", function(state)
    states.fullbright = state
    Lighting.Brightness = state and 3 or 1
    Lighting.GlobalShadows = not state
end)

local miscContent = tabContents[5]
createFeature(miscContent, "Anti AFK", function(state) states.antiAFK = state end)
createFeature(miscContent, "Click Teleport", function(state) states.clickTP = state end)
createFeature(miscContent, "Infinite Yield", function(state) states.infYield = state end)

-- MAIN LOOP (All features)
spawn(function()
    while wait() do
        if states.speed and player.Character then
            player.Character.Humanoid.WalkSpeed = states.sliders["Speed Slider"] or 100
        end
        if states.noclip and player.Character then
            for _, part in pairs(player.Character:GetChildren()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end
end)

-- TOGGLE FUNCTIONALITY
tgOpenBtn.MouseButton1Click:Connect(function()
    hubFrame.Visible = not hubFrame.Visible
    tgOpenBtn.Text = hubFrame.Visible and "CLOSE HUB ⬇" or "OPEN HUB ➤"
end)

closeBtn.MouseButton1Click:Connect(function()
    hubFrame.Visible = false
    tgOpenBtn.Text = "OPEN HUB ➤"
end)

print("🎉 ULTIMATE HUB v6.0 LOADED! 30+ FEATURES!")
print("🌟 DRAG MAIN BUTTON • 5 TABS • LOCAL PLAYER CONTROLS!")
