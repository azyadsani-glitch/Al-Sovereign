local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AL AI SOVEREIGN | ATOMIC EDITION",
   LoadingTitle = "Authenticating Sovereign...",
   LoadingSubtitle = "by Al AI",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SovereignConfig",
      FileName = "FishItHub"
   }
})

-- TAB UTAMA (FISHING)
local MainTab = Window:CreateTab("Auto Farm", 4483362458) -- Icon Home
local Section = MainTab:CreateSection("Blatant Mode")

MainTab:CreateToggle({
   Name = "Auto Fish (Blatant)",
   CurrentValue = false,
   Flag = "AutoFish",
   Callback = function(Value)
      _G.AutoFish = Value
      spawn(function()
         while _G.AutoFish do
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then
               -- Cast Power 100%
               tool:Activate()
               task.wait(0.1)
               -- Instant Catch Logic (Atomic Style)
               local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
               if remote then
                  for _, v in pairs(remote:GetChildren()) do
                     if v:IsA("RemoteEvent") then
                        v:FireServer("Caught", true)
                        v:FireServer(100, true)
                     end
                  end
               end
            end
            task.wait(0.5)
         end
      end)
   end,
})

-- TAB PLAYER (MODS)
local PlayerTab = Window:CreateTab("Player Mods", 4483362458)
PlayerTab:CreateSection("Movement")

PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

PlayerTab:CreateButton({
   Name = "Infinite Oxygen",
   Callback = function()
      -- Bypass Oksigen di Fish It!
      local player = game.Players.LocalPlayer
      if player.Character:FindFirstChild("Oxygen") then
          player.Character.Oxygen.Value = 9999
      end
      Rayfield:Notify({Title = "Success", Content = "Oxygen Set to Infinite", Duration = 3})
   end,
})

-- TAB VISUAL (MAP)
local MapTab = Window:
