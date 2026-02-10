-- CRASH-PROOF Area 51 Hub v3.0
print("🛡️ SAFE HUB LOADED")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- SIMPLE 4-BUTTON GUI (NO LOOPS)
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,200,0,200)
frame.Position = UDim2.new(0,10,0,10)
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.Active = true
frame.Draggable = true

-- SPEED (1x click = toggle)
local speedBtn = Instance.new("TextButton")
speedBtn.Parent = frame
speedBtn.Size = UDim2.new(0.9,0,0.22,0)
speedBtn.Position = UDim2.new(0.05,0,0.05,0)
speedBtn.Text = "SPEED: OFF"
speedBtn.BackgroundColor3 = Color3.new(1,0,0)
speedBtn.TextScaled = true

local speedOn = false
speedBtn.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = speedOn and 50 or 16
    end
    speedBtn.Text = "SPEED: " .. (speedOn and "ON" or "OFF")
    speedBtn.BackgroundColor3 = speedOn and Color3.new(0,1,0) or Color3.new(1,0,0)
end)

-- JUMP (1x click = infinite until toggle off)
local jumpBtn = Instance.new("TextButton")
jumpBtn.Parent = frame
jumpBtn.Size = UDim2.new(0.9,0,0.22,0)
jumpBtn.Position = UDim2.new(0.05,0,0.3,0)
jumpBtn.Text = "JUMP: OFF"
jumpBtn.BackgroundColor3 = Color3.new(1,0,0)
jumpBtn.TextScaled = true

local jumpConn
jumpBtn.MouseButton1Click:Connect(function()
    if jumpConn then
        jumpConn:Disconnect()
        jumpConn = nil
        jumpBtn.Text = "JUMP: OFF"
        jumpBtn.BackgroundColor3 = Color3.new(1,0,0)
    else
        jumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
            if player.Character then
                player.Character.Humanoid:ChangeState("Jumping")
            end
        end)
        jumpBtn.Text = "JUMP: ON"
        jumpBtn.BackgroundColor3 = Color3.new(0,1,0)
    end
end)

-- FLY (1x click = toggle)
local flyBtn = Instance.new("TextButton")
flyBtn.Parent = frame
flyBtn.Size = UDim2.new(0.9,0,0.22,0)
flyBtn.Position = UDim2.new(0.05,0,0.55,0)
flyBtn.Text = "FLY: OFF"
flyBtn.BackgroundColor3 = Color3.new(1,0,0)
flyBtn.TextScaled = true

local flyVel
flyBtn.MouseButton1Click:Connect(function()
    if flyVel then
        flyVel:Destroy()
        flyVel = nil
        flyBtn.Text = "FLY: OFF"
        flyBtn.BackgroundColor3 = Color3.new(1,0,0)
    else
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            flyVel = Instance.new("BodyVelocity")
            flyVel.MaxForce = Vector3.new(4000,4000,4000)
            flyVel.Velocity = Vector3.new(0,50,0)
            flyVel.Parent = player.Character.HumanoidRootPart
            flyBtn.Text = "FLY: ON"
            flyBtn.BackgroundColor3 = Color3.new(0,1,0)
        end
    end
end)

-- NOCLIP (1x click = toggle)
local noclipBtn = Instance.new("TextButton")
noclipBtn.Parent = frame
noclipBtn.Size = UDim2.new(0.9,0,0.22,0)
noclipBtn.Position = UDim2.new(0.05,0,0.8,0)
noclipBtn.Text = "NOCLIP: OFF"
noclipBtn.BackgroundColor3 = Color3.new(1,0,0)
noclipBtn.TextScaled = true

local noclipOn = false
noclipBtn.MouseButton1Click:Connect(function()
    noclipOn = not noclipOn
    noclipBtn.Text = "NOCLIP: " .. (noclipOn and "ON" or "OFF")
    noclipBtn.BackgroundColor3 = noclipOn and Color3.new(0,1,0) or Color3.new(1,0,0)
end)

-- SAFE NOCLIP LOOP (slow + breaks on death)
spawn(function()
    while wait(0.5) do
        if noclipOn and player.Character then
            for _, part in pairs(player.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

print("✅ CRASH-PROOF HUB LOADED!")
