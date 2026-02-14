local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("AL AI SOVEREIGN - BLATANT", "Midnight")

-- TAB UTAMA
local Tab1 = Window:NewTab("Blatant Farm")
local Section1 = Tab1:NewSection("Fish It! Hacks")

-- FUNGSI AUTO TAP LAYAR
Section1:NewToggle("Auto Tap Layar", "Otomatis nge-klik layar terus", function(state)
    _G.AutoTap = state
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
    end)
    spawn(function()
        while _G.AutoTap do
            vu:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            task.wait(0.1) -- Kecepatan tap (0.1 detik)
        end
    end)
end)

-- FUNGSI BLATANT FISHING (INSTANT CATCH)
Section1:NewToggle("Instant Catch (No Reel)", "Dapet ikan langsung masuk tas", function(state)
    _G.InstantFish = state
    spawn(function()
        while _G.InstantFish do
            local player = game.Players.LocalPlayer
            local tool = player.Character:FindFirstChildOfClass("Tool")
            if tool then
                -- Paksa lempar
                tool:Activate()
                task.wait(0.2)
                -- Paksa tembak event dapet ikan (Bypass Minigame)
                local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
                if remotes then
                    -- Kita tembak semua kemungkinan remote dapet ikan
                    for _, v in pairs(remotes:GetChildren()) do
                        if v:IsA("RemoteEvent") and (v.Name:find("Catch") or v.Name:find("Fish")) then
                            v:FireServer(true)
                        end
                    end
                end
            end
            task.wait(0.3)
        end
    end)
end)

-- TAB PLAYER (SPEED & JUMP)
local Tab2 = Window:NewTab("Player")
local Section2 = Tab2:NewSection("Movement")
Section2:NewSlider("WalkSpeed", "Lari", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
