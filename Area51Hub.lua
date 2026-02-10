print("🔥 Area 51 Alpha ELITE Hub loading...")

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "🚀 Area 51 Alpha | ELITE Hub",
   LoadingTitle = "hifsdfsddf Elite",
   ConfigurationSaving = { Enabled = true, FolderName = "Area51Elite" }
})

local MainTab = Window:CreateTab("🎮 Main")
local CombatTab = Window:CreateTab("⚔️ Combat") 
local PlayerTab = Window:CreateTab("👤 Player")

-- MAIN FEATURES (your working ones + improvements)
MainTab:CreateToggle({
   Name = "🚀 Super Speed (100)",
   CurrentValue = false,
   Callback = function(Value)
      spawn(function()
         while Value do
            wait()
            local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum.WalkSpeed = Value and 100 or 16 end
         end
      end)
   end
})

MainTab:CreateToggle({
   Name = "🦘 Infinite Jump", 
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         game:GetService("UserInputService").JumpRequest:Connect(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
         end)
      end
   end
})

-- AREA 51 SPECIFIC FEATURES
CombatTab:CreateButton({
   Name = "🔫 Auto Get Gun (F1)",
   Callback = function()
      spawn(function()
         while wait(1) do
            -- Scans workspace for guns and teleports to them
            for _, obj in pairs(workspace:GetChildren()) do
               if obj.Name:lower():find("gun") or obj.Name:lower():find("weapon") then
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = obj.CFrame
                  break
               end
            end
         end
      end)
   end
})

PlayerTab:CreateButton({
   Name = "📍 Teleport to Spawn",
   Callback = function()
      -- Common Area 51 spawn locations
      local spawns = {"SpawnLocation", "Spawn", "Lobby"}
      for _, spawnName in pairs(spawns) do
         local spawn = workspace:FindFirstChild(spawnName)
         if spawn then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spawn.CFrame
            break
         end
      end
   end
})

PlayerTab:CreateToggle({
   Name = "👻 Noclip",
   CurrentValue = false,
   Callback = function(Value)
      spawn(function()
         while Value do
            wait()
            if game.Players.LocalPlayer.Character 
