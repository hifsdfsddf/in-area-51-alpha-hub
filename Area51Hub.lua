print("🔥 Area 51 Alpha Hub loading...")

-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
print("✅ Rayfield loaded!")

local Window = Rayfield:CreateWindow({
   Name = "Area 51 Alpha | hifsdfsddf Hub",
   LoadingTitle = "Custom Hub v1.0",
   LoadingSubtitle = "by hifsdfsddf",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Area51Hub",
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false
})

-- Main Tab
local MainTab = Window:CreateTab("🎮 Main", 4483362458)

-- Speed Hack
MainTab:CreateToggle({
   Name = "🚀 Speed Hack (50)",
   CurrentValue = false,
   Flag = "SpeedHack",
   Callback = function(Value)
      spawn(function()
         while MainTab.Flags.SpeedHack do
            wait(0.1)
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
               player.Character.Humanoid.WalkSpeed = 50
            end
         end
         -- Reset speed when disabled
         local player = game.Players.LocalPlayer
         if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16
         end
      end)
   end,
})

-- Infinite Jump
MainTab:CreateToggle({
   Name = "🦘 Infinite Jump",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value)
      if Value then
         local UserInputService = game:GetService("UserInputService")
         UserInputService.JumpRequest:Connect(function()
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
               player.Character.Humanoid:ChangeState("Jumping")
            end
         end)
      end
   end,
})

-- Fly (Bonus feature!)
MainTab:CreateToggle({
   Name = "✈️ Fly Hack",
   CurrentValue = false,
   Flag = "FlyHack",
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if Value and player.Character then
         local bodyVelocity = Instance.new("BodyVelocity")
         bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
         bodyVelocity.Velocity = Vector3.new(0, 0, 0)
         bodyVelocity.Parent = player.Character.HumanoidRootPart
         
         spawn(function()
            while MainTab.Flags.FlyHack do
               wait()
               if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                  local camera = workspace.CurrentCamera
                  local moveVector = Vector3.new(0, 0, 0)
                  
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                     moveVector = moveVector + camera.CFrame.LookVector
                  end
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                     moveVector = moveVector - camera.CFrame.LookVector
                  end
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                     moveVector = moveVector - camera.CFrame.RightVector
                  end
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                     moveVector = moveVector + camera.CFrame.RightVector
                  end
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                     moveVector = moveVector + Vector3.new(0, 1, 0)
                  end
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                     moveVector = moveVector - Vector3.new(0, 1, 0)
                  end
                  
                  bodyVelocity.Velocity = moveVector * 50
               end
            end
            if bodyVelocity then bodyVelocity:Destroy() end
         end)
      end
   end,
})

print("🎉 Hub fully loaded! GUI should appear now.")
