-- 🔥 Area 51 Alpha ULTIMATE v4.1 - PERFECT FLY FIXED! 🔥
print("🛡️ LOADING PERFECT FLY HUB...")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- HUB STATE
local hubOpen = true
local states = {
    killAura = false, godMode = false, speed = false, jump = false, 
    noclip = false, fly = false, antiKick = true, flyBodyVel = nil, jumpConn = nil
}

-- TOGGLE BUTTON (Always visible)
local toggleGui = Instance.new("ScreenGui")
toggleGui.Name = "HubToggle"
toggleGui.Parent = player:WaitForChild("PlayerGui")
toggleGui.ResetOnSpawn = false

local toggleBtn = Instance.new("TextButton")
toggleBtn.Parent = toggleGui
toggleBtn.Size = UDim2.new(0, 120, 0, 50)
toggleBtn.Position = UDim2.new(0, 20, 0, 20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleBtn.Text = "🛡️ HUB (ON)"
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBold

-- MAIN GUI
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "Area51Hub"
mainGui.Parent = player:WaitForChild("PlayerGui")
mainGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Parent = mainGui
mainFrame.Size = UDim2.new(0, 280, 0, 420)
mainFrame.Position = UDim2.new(0.5, -140, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = true

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- TITLE
local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
title.Text = "🚀 AREA 51 ULTIMATE v4.1"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
corner:Clone().Parent = title

-- CLOSE BUTTON
local closeBtn = Instance.new("TextButton")
closeBtn.Parent = mainFrame
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.new(1,1,1)
corner:Clone().Parent = closeBtn

-- PERFECT TOGGLE FUNCTION
local function createToggle(name, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = mainFrame
    btn.Size = UDim2.new(0.92, 0, 0, 45)
    btn.Position = UDim2.new(0.04, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.Text = name .. ": OFF"
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.TextColor3 = Color3.new(1,1,1)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = name .. ": " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(50, 50, 70)
        callback(state)
    end)
end

-- 💥 KILL AURA (Safe 0.5s delay)
createToggle("💥 KILL AURA", 65, function(state)
    states.killAura = state
    spawn(function()
        while states.killAura do
            wait(0.5)
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj ~= player.Character and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                        local dist = (obj.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 20 then obj.Humanoid.Health = 0 end
                    end
                end
            end
        end
    end)
end)

-- 🛡️ IMMORTALITY
createToggle("🛡️ IMMORTALITY", 120, function(state)
    states.godMode = state
    spawn(function()
        while states.godMode do
            wait(0.1)
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = 100
            end
        end
    end)
end)

-- 🚀 SPEED
createToggle("🚀 SPEED BOOST", 175, function(state)
    states.speed = state
    spawn(function()
        while states.speed do
            wait()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = state and 80 or 16
            end
        end
    end)
end)

-- 🦘 JUMP
createToggle("🦘 INF JUMP", 230, function(state)
    states.jump = state
    if state then
        states.jumpConn = UserInputService.JumpRequest:Connect(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    else
        if states.jumpConn then
            states.jumpConn:Disconnect()
            states.jumpConn = nil
        end
    end
end)

-- 👻 NOCLIP
createToggle("👻 NOCLIP", 285, function(state)
    states.noclip = state
    spawn(function()
        while states.noclip do
            wait(0.2)
            if player.Character then
                for _, part in pairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end
    end)
end)

-- ✈️ PERFECT FLY (FIXED - Camera-based movement)
createToggle("✈️ FLY (WASD+Space)", 340, function(state)
    states.fly = state
    
    if state and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        -- CLEANUP OLD FLY
        if states.flyBodyVel then states.flyBodyVel:Destroy() end
        
        -- NEW PERFECT FLY SYSTEM
        states.flyBodyVel = Instance.new("BodyVelocity")
        states.flyBodyVel.MaxForce = Vector3.new(4000, 4000, 4000)
        states.flyBodyVel.Velocity = Vector3.new(0, 0, 0)
        states.flyBodyVel.Parent = player.Character.HumanoidRootPart
        
        -- FLY CONTROL LOOP (Camera relative)
        spawn(function()
            while states.fly and states.flyBodyVel and states.flyBodyVel.Parent do
                wait()
                local cam = workspace.CurrentCamera
                local moveVector = Vector3.new(0, 0, 0)
                
                -- FORWARD/BACKWARD
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveVector = moveVector + cam.CFrame.LookVector * 50
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveVector = moveVector - cam.CFrame.LookVector * 50
                end
                
                -- LEFT/RIGHT  
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveVector = moveVector - cam.CFrame.RightVector * 50
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveVector = moveVector + cam.CFrame.RightVector * 50
                end
                
                -- UP/DOWN
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveVector = moveVector + Vector3.new(0, 50, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveVector = moveVector - Vector3.new(0, 50, 0)
                end
                
                states.flyBodyVel.Velocity = moveVector
            end
        end)
        
    else
        -- CLEANUP FLY
        if states.flyBodyVel then
            states.flyBodyVel:Destroy()
            states.flyBodyVel = nil
        end
    end
end)

-- 🛡️ ANTI-KICK (Background)
spawn(function()
    while states.antiKick do
        wait(1)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            local hum = player.Character.Humanoid
            hum.WalkSpeed = math.clamp(hum.WalkSpeed, 0, 100)
            hum.JumpPower = math.clamp(hum.JumpPower, 0, 100)
        end
    end
end)

-- TOGGLE HUB
toggleBtn.MouseButton1Click:Connect(function()
    hubOpen = not hubOpen
    mainFrame.Visible = hubOpen
    toggleBtn.Text = hubOpen and "🛡️ HUB (ON)" or "🛡️ HUB (OFF)"
    toggleBtn.BackgroundColor3 = hubOpen and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end)

closeBtn.MouseButton1Click:Connect(function()
    hubOpen = false
    mainFrame.Visible = false
    toggleBtn.Text = "🛡️ HUB (OFF)"
    toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)

-- DEATH HANDLER
player.CharacterAdded:Connect(function()
    wait(2)
    if states.godMode then
        spawn(function()
            while states.godMode do
                wait(0.1)
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.Health = 100
                end
            end
        end)
    end
end)

print("🎉 PERFECT FLY HUB v4.1 LOADED!")
print("✈️ FLY CONTROLS: W/A/S/D + Space(UP) + LeftShift(DOWN)")
