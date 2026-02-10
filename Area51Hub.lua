--[[
    In Area 51 (Alpha) - Custom Script Hub (v0.1)
    Upload this file to your GitHub repo, then use:
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURNAME/in-area-51-alpha-hub/main/Area51Hub.lua"))()
--]]

-- Check game (optional warning)
if game.PlaceId ~= XXXXXXXX then -- <-- REPLACE with Actual PlaceId of "In Area 51 (Alpha)"
    warn("This script is meant for 'In Area 51 (Alpha)' only.")
    return
end

-- // Load Rayfield
local Rayfield
pcall(function()
    Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()
end)

if not Rayfield then
    warn("Failed to load Rayfield UI, terminating.")
    return
end

local Window = Rayfield:CreateWindow({
    Name = "In Area 51 (Alpha) | Perplexity Hub",
    LoadingTitle = "Custom Script Hub",
    LoadingSubtitle = "by Perplexity",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "InArea51Hub"
    }
})

-- Tabs
local MainTab      = Window:CreateTab("Main")
local MovementTab  = Window:CreateTab("Movement")
local MiscTab      = Window:CreateTab("Misc")

-- ===== MAIN FEATURES ===== --

-- Auto‑Jump Proxy (Infinite Jump)
do
    local InfJumpToggle = MainTab:CreateToggle({
        Name = "Infinite Jump",
        CurrentValue = false
    })

    InfJumpToggle:SetCallback(function(State)
        if State then
            game:GetService("UserInputService").JumpRequest:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:ChangeState("Jumping")
                    end
                end
            end)
        end
    end)
end

-- High Walkspeed
do
    local WalkSpeedToggle = MovementTab:CreateToggle({
        Name = "High Walkspeed",
        CurrentValue = false
    })

    local WalkSpeedSlider = MovementTab:CreateSlider({
        Name = "Walkspeed Value",
        Min = 16,
        Max = 250,
        CurrentValue = 50,
        Prefix = "studs/sec",
        Callback = function(Value)
            if WalkSpeedToggle.Value then
                local char = game.Players.LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum.WalkSpeed = Value
                    end
                end
            end
        end
    })

    WalkSpeedToggle:SetCallback(function(State)
        if State then
            repeat
                task.wait()
                local char = game.Players.LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.WalkSpeed ~= WalkSpeedSlider.Value then
                        hum.WalkSpeed = WalkSpeedSlider.Value
                    end
                end
            until not State
        end
    end)
end

-- Simple Teleport Button
do
    local player = game.Players.LocalPlayer

    local TPToSpawnButton = MiscTab:CreateButton({
        Name = "Teleport to Spawn",
        Callback = function()
            local char = player.Character or player.CharacterAdded:Wait()
            local root = char:WaitForChild("HumanoidRootPart")

            local spawnFolder = workspace:FindFirstChild("Spawn") -- adjust name for Area 51
            if not spawnFolder then return end

            local spawnCFrame = workspace.Spawn.CFrame -- find correct spawn in game via Explorer
            if spawnCFrame then
                root.CFrame = spawnCFrame
            end
        end
    })
end

-- Example: Toggle Noclip (you will have to tweak depending on Area 51’s movement logic)
do
    local NoclipToggle = MiscTab:CreateToggle({
        Name = "Noclip (Toggle)",
        CurrentValue = false,
    })

    NoclipToggle:SetCallback(function(State)
        local char = game.Players.LocalPlayer.Character
        if not char then return end

        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local connection
        if State then
            root.Anchored = true
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                local ignoreList = { root, workspace.Terrain }
                local cam = workspace.CurrentCamera
                if not cam then return end

                local mouseHit = cam.ViewportMouse:MouseToWorldRay(root.Position, cam.CFrame.LookVector * 500)
                repeat task.wait() until mouseHit
                root.CFrame = mouseHit
            end)
        else
            root.Anchored = false
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end)
end
