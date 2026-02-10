-- 🔥 Area 51 Alpha MEGA HUB v5.2 - MONSTER KILL AURA ONLY! 🔥
print("🌟 MEGA HUB v5.2 LOADING... MONSTER KILL AURA ACTIVATED!")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- STATES
local hubOpen = false
local states = {
    monsterKillAura = false, godMode = false, speed = false, jump = false, noclip = false, 
    fly = false, esp = false, autoGun = false, antiKick = true, fullbright = false
}

-- MOVABLE TOGGLE BUTTON (Draggable)
local toggleGui = Instance.new("ScreenGui")
toggleGui.Parent = player:WaitForChild("PlayerGui")
toggleGui.ResetOnSpawn = false

local toggleFrame = Instance.new("Frame")
toggleFrame.Parent = toggleGui
toggleFrame.Size = UDim2.new(0, 140, 0, 60)
toggleFrame.Position = UDim2.new(0, 50, 0, 50)
toggleFrame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
toggleFrame.Active = true
toggleFrame.Draggable = true

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleFrame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Parent = toggleFrame
toggleBtn.Size = UDim2.new(1, 0, 1, 0)
toggleBtn.BackgroundTransparency = 1
toggleBtn.Text = "🌟 MEGA HUB\n(OFF)"
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextColor3 = Color3.new(1,1,1)

-- MAIN GUI
local mainGui = Instance.new("ScreenGui")
mainGui.Parent = player:WaitForChild("PlayerGui")
mainGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Parent = mainGui
mainFrame.Size = UDim2.new(0, 350, 0, 480)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -240)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

-- 🔥 MONSTER-ONLY ELITE KILL AURA (Perfect for Area 51)
local function monsterKillAura()
    spawn(function()
        while states.monsterKillAura do
            wait(0.15) -- Smooth 6.6Hz (no lag)
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local myPos = player.Character.HumanoidRootPart.Position
                
                -- MONSTER DETECTION (Skips ALL players)
                for _, obj in pairs(workspace:GetChildren()) do
                    -- ONLY NON-PLAYER OBJECTS WITH HUMANOID
                    if obj ~= player.Character and 
                       obj:FindFirstChild("Humanoid") and 
                       obj:FindFirstChild("HumanoidRootPart") and
                       not Players:GetPlayerFromCharacter(obj) then -- CRITICAL: Skip players!
                        
                        local monsterHum = obj.Humanoid
                        local monsterRoot = obj.HumanoidRootPart
                        
                        if monsterHum.Health > 0 then
                            local dist = (monsterRoot.Position - myPos).Magnitude
                            
                            -- PERFECT 20-STUD RANGE FOR AREA 51 MONSTERS
                            if dist < 20 then
                                -- INSTANT MONSTER KILL
                                monsterHum.Health = 0
                                monsterHum:TakeDamage(999)
                                
                                -- VISUAL FEEDBACK (Red highlight on dead monsters)
                                local highlight = Instance.new("Highlight")
                                highlight.FillColor = Color3.new(1, 0, 0)
                                highlight.OutlineColor = Color3.new(1, 1, 0)
                                highlight.FillTransparency = 0.5
                                highlight.Parent = obj
                                game:GetService("Debris"):AddItem(highlight, 1)
                                
                                print("💥 KILLED MONSTER:", obj.Name, "Distance:", math.floor(dist))
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- BUTTON CREATOR
local function createButton(parent, text, callback, posY)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(0.48, -5, 0, 50)
    btn.Position = UDim2.new(0, posY % 2 * 170, 0, math.floor(posY / 2) * 60)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.Text = text .. ": OFF"
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.TextColor3 = Color3.new(1,1,1)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. ": " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(50, 50, 70)
        callback(state)
    end)
end

-- HEADER
local header = Instance.new("Frame")
header.Parent = mainFrame
header.Size = UDim2.new(1, 0, 0, 60)
header.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
mainCorner:Clone().Parent = header

local title = Instance.new("TextLabel")
title.Parent = header
title.Size = UDim2.new(1, -40, 1, 0)
title.BackgroundTransparency = 1
title.Text = "🌟 AREA 51 MEGA v5.2 - MONSTER KA"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)

local closeBtn = Instance.new("TextButton")
closeBtn.Parent = header
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -45, 0.5, -17.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.Text = "✕"
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
mainCorner:Clone().Parent = closeBtn

-- COMBAT TAB (Monster Kill Aura HEADLINER)
local combatContent = Instance.new("Frame")
combatContent.Parent = mainFrame
combatContent.Size = UDim2.new(1, -20, 1, -130)
combatContent.Position = UDim2.new(0, 10, 0, 115)
combatContent.BackgroundTransparency = 1
combatContent.Visible = true

local btnIndex = 0

-- ⭐ MONSTER-ONLY ELITE KILL AURA ⭐
createButton(combatContent, "⚡ MONSTER KILL AURA", function(state)
    states.monsterKillAura = state
    monsterKillAura()
end, btnIndex); btnIndex = btnIndex + 1

createButton(combatContent, "🔫 Auto Gun Grab", function(state)
    states.autoGun = state
    spawn(function()
        while states.autoGun do wait(1)
            for _, gun in pairs(workspace:GetChildren()) do
                if gun.Name:lower():find("gun") and player.Character then
                    player.Character.HumanoidRootPart.CFrame = gun.CFrame + Vector3.new(0,3,0)
                end
            end
        end
    end)
end, btnIndex); btnIndex = btnIndex + 1

-- PLAYER TAB
local playerContent = Instance.new("Frame")
playerContent.Parent = mainFrame
playerContent.Size = UDim2.new(1, -20, 1, -130)
playerContent.Position = UDim2.new(0, 10, 0, 115)
playerContent.BackgroundTransparency = 1
playerContent.Visible = false

btnIndex = 0
createButton(playerContent, "🛡️ God Mode", function(state)
    states.godMode = state
    spawn(function() while states.godMode do wait(0.1)
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.Health = 100
        end end end)
end, btnIndex); btnIndex = btnIndex + 1

createButton(playerContent, "🚀 Speed 100", function(state)
    states.speed = state
    spawn(function() while states.speed do wait()
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.WalkSpeed = state and 100 or 16
        end end end)
end, btnIndex)

-- TABS
local tabFrame = Instance.new("Frame")
tabFrame.Parent = mainFrame
tabFrame.Size = UDim2.new(1, 0, 0, 50)
tabFrame.Position = UDim2.new(0, 0, 0, 60)
tabFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)

local combatTabBtn = Instance.new("TextButton")
combatTabBtn.Parent = tabFrame
combatTabBtn.Size = UDim2.new(0, 110, 1, 0)
combatTabBtn.Position = UDim2.new(0, 10, 0, 0)
combatTabBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
combatTabBtn.Text = "⚔️ COMBAT"
combatTabBtn.TextScaled = true
combatTabBtn.Font = Enum.Font.GothamBold

local playerTabBtn = Instance.new("TextButton")
playerTabBtn.Parent = tabFrame
playerTabBtn.Size = UDim2.new(0, 110, 1, 0)
playerTabBtn.Position = UDim2.new(0, 125, 0, 0)
playerTabBtn.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
playerTabBtn.Text = "👤 PLAYER"
playerTabBtn.TextScaled = true
playerTabBtn.Font = Enum.Font.GothamBold

-- TAB SWITCHING
combatTabBtn.MouseButton1Click:Connect(function()
    combatContent.Visible = true
    playerContent.Visible = false
    combatTabBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    playerTabBtn.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
end)

playerTabBtn.MouseButton1Click:Connect(function()
    combatContent.Visible = false
    playerContent.Visible = true
    playerTabBtn.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
    combatTabBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
end)

-- TOGGLE + CLOSE
toggleBtn.MouseButton1Click:Connect(function()
    hubOpen = not hubOpen
    mainFrame.Visible = hubOpen
    toggleBtn.Text = hubOpen and "🌟 MEGA HUB\n(ON)" or "🌟 MEGA HUB\n(OFF)"
    toggleFrame.BackgroundColor3 = hubOpen and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 50, 50)
end)

closeBtn.MouseButton1Click:Connect(function()
    hubOpen = false
    mainFrame.Visible = false
    toggleFrame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    toggleBtn.Text = "🌟 MEGA HUB\n(OFF)"
end)

-- ANTI-KICK
spawn(function()
    while wait(2) do
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            local hum = player.Character.Humanoid
            hum.WalkSpeed = math.clamp(hum.WalkSpeed, 0, 200)
        end
    end
end)

print("🎉 MONSTER-ONLY KILL AURA v5.2 LOADED!")
print("⚡ KILLS MONSTERS ONLY (20 studs) - Red highlights + Console feedback!")
print("✨ DRAG RED/GREEN BUTTON anywhere!")
