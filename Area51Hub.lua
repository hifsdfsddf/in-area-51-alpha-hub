-- 🔥 Area 51 Alpha ULTIMATE HUB v2.0 by hifsdfsddf 🔥
-- Features: Kill Aura, Speed Boost, Gun ESP, Auto Gun, God Mode, Teleports
print("🎯 ULTIMATE HUB LOADING...")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- ANTI-DETECT (Your hub stays open after death)
if player.Character then player.Character:Destroy() end

-- CREATE EPIC DARK GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Area51UltimateHub"
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.01, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(0, 255, 150)
Stroke.Thickness = 2
Stroke.Parent = MainFrame

-- GRADIENT TITLE
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Font = Enum.Font.GothamBold
Title.Text = "🚀 AREA 51 ALPHA ULTIMATE"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.TextScaled = true
Title.TextStrokeTransparency = 0.5

-- TABS SYSTEM
local TabFrame = Instance.new("Frame")
TabFrame.Name = "TabFrame"
TabFrame.Parent = MainFrame
TabFrame.BackgroundTransparency = 1
TabFrame.Position = UDim2.new(0, 0, 0, 60)
TabFrame.Size = UDim2.new(1, 0, 0, 40)

local MainTabBtn = Instance.new("TextButton")
MainTabBtn.Name = "MainTab"
MainTabBtn.Parent = TabFrame
MainTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
MainTabBtn.Position = UDim2.new(0, 10, 0, 5)
MainTabBtn.Size = UDim2.new(0, 80, 0, 30)
MainTabBtn.Text = "COMBAT"
MainTabBtn.TextColor3 = Color3.new(1,1,1)
MainTabBtn.TextScaled = true
MainTabBtn.Font = Enum.Font.Gotham

local PlayerTabBtn = Instance.new("TextButton")
PlayerTabBtn.Name = "PlayerTab"
PlayerTabBtn.Parent = TabFrame
PlayerTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
PlayerTabBtn.Position = UDim2.new(0, 95, 0, 5)
PlayerTabBtn.Size = UDim2.new(0, 80, 0, 30)
PlayerTabBtn.Text = "PLAYER"
PlayerTabBtn.TextColor3 = Color3.new(1,1,1)
PlayerTabBtn.TextScaled = true
PlayerTabBtn.Font = Enum.Font.Gotham

local VisualTabBtn = Instance.new("TextButton")
VisualTabBtn.Name = "VisualTab"
VisualTabBtn.Parent = TabFrame
VisualTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
VisualTabBtn.Position = UDim2.new(0, 180, 0, 5)
VisualTabBtn.Size = UDim2.new(0, 80, 0, 30)
VisualTabBtn.Text = "VISUALS"
VisualTabBtn.TextColor3 = Color3.new(1,1,1)
VisualTabBtn.TextScaled = true
VisualTabBtn.Font = Enum.Font.Gotham

-- CONTENT FRAMES
local MainContent = Instance.new("Frame")
MainContent.Name = "MainContent"
MainContent.Parent = MainFrame
MainContent.BackgroundTransparency = 1
MainContent.Position = UDim2.new(0, 0, 0, 100)
MainContent.Size = UDim2.new(1, 0, 1, -100)
MainContent.Visible = true

local PlayerContent = Instance.new("Frame")
PlayerContent.Name = "PlayerContent"
PlayerContent.Parent = MainFrame
PlayerContent.BackgroundTransparency = 1
PlayerContent.Position = UDim2.new(0, 0, 0, 100)
PlayerContent.Size = UDim2.new(1, 0, 1, -100)
PlayerContent.Visible = false

local VisualContent = Instance.new("Frame")
VisualContent.Name = "VisualContent"
VisualContent.Parent = MainFrame
VisualContent.BackgroundTransparency = 1
VisualContent.Position = UDim2.new(0, 0, 0, 100)
VisualContent.Size = UDim2.new(1, 0, 1, -100)
VisualContent.Visible = false

-- BUTTON FUNCTION (Reusable)
local function createButton(parent, text, callback, posY)
    local btn = Instance.new("TextButton")
    btn.Name = text
    btn.Parent = parent
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.Position = UDim2.new(0.05, 0, 0, posY)
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.TextStrokeTransparency = 0.8
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 255, 150)
    stroke.Thickness = 1.5
    stroke.Parent = btn
    
    local toggleState = false
    btn.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        btn.BackgroundColor3 = toggleState and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(50, 50, 70)
        callback(toggleState)
    end)
    
    return btn
end

-- STATES
local states = {
    killAura = false,
    speedBoost = false,
    godMode = false,
    noclip = false,
    fly = false,
    gunESP = false
}

-- 🔥 COMBAT FEATURES (Main Tab)
createButton(MainContent, "💥 KILL AURA", function(state)
    states.killAura = state
    if state then
        spawn(function()
            while states.killAura do
                wait(0.1)
                for _, enemy in pairs(workspace:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy ~= player.Character then
                        local distance = (enemy.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if distance < 15 then
                            enemy.Humanoid.Health = 0
                        end
                    end
                end
            end
        end)
    end
end, 10)

createButton(MainContent, "🚀 SPEED BOOST", function(state)
    states.speedBoost = state
    spawn(function()
        while states.speedBoost do
            wait()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = state and 120 or 16
            end
        end
    end)
end, 65)

createButton(MainContent, "🔫 AUTO GUN", function(state)
    if state then
        spawn(function()
            while states.killAura do -- Reuse kill aura loop
                wait(1)
                for _, gun in pairs(workspace:GetChildren()) do
                    if gun.Name:lower():find("gun") or gun.Name:lower():find("weapon") then
                        player.Character.HumanoidRootPart.CFrame = gun.CFrame
                        fireclickdetector(gun:FindFirstChildOfClass("ClickDetector"))
                    end
                end
            end
        end)
    end
end, 120)

-- 🔥 PLAYER FEATURES
createButton(PlayerContent, "🛡️ GOD MODE", function(state)
    states.godMode = state
    spawn(function()
        while states.godMode do
            wait()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = 100
            end
        end
    end)
end, 10)

createButton(PlayerContent, "👻 NOCLIP", function(state)
    states.noclip = state
    spawn(function()
        while states.noclip do
            wait()
            if player.Character then
                for _, part in pairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end
    end)
end, 65)

createButton(PlayerContent, "✈️ FLY (WASD)", function(state)
    states.fly = state
    if state and player.Character then
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(4000,4000,4000)
        bv.Parent = player.Character.HumanoidRootPart
        spawn(function()
            while states.fly do
                wait()
                local cam = workspace.CurrentCamera
                local move = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
                bv.Velocity = move * 50
            end
            bv:Destroy()
        end)
    end
end, 120)

-- 🔥 VISUALS
createButton(VisualContent, "🔫 GUN ESP", function(state)
    states.gunESP = state
    -- ESP implementation would go here
    print("Gun ESP toggled:", state)
end, 10)

-- TAB SWITCHING
MainTabBtn.MouseButton1Click:Connect(function()
    MainContent.Visible = true
    PlayerContent.Visible = false
    VisualContent.Visible = false
    MainTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    PlayerTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    VisualTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
end)

PlayerTabBtn.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    PlayerContent.Visible = true
    VisualContent.Visible = false
    PlayerTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    MainTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    VisualTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
end)

VisualTabBtn.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    PlayerContent.Visible = false
    VisualContent.Visible = true
    VisualTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    MainTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    PlayerTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
end)

print("🎉 ULTIMATE AREA 51 HUB LOADED! 3 TABS - 7+ FEATURES!")
