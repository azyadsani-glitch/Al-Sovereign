-- [[ AL AI SOVEREIGN - MANUAL UI ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoFishBtn = Instance.new("TextButton")
local SpeedBtn = Instance.new("TextButton")

-- Setting UI Dasar
ScreenGui.Parent = game.CoreGui
MainFrame.Name = "SovereignMenu"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "AL AI SOVEREIGN"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Tombol Auto Fish
AutoFishBtn.Parent = MainFrame
AutoFishBtn.Position = UDim2.new(0, 10, 0, 40)
AutoFishBtn.Size = UDim2.new(0, 180, 0, 40)
AutoFishBtn.Text = "Auto Fish: OFF"
AutoFishBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

-- Tombol Speed
SpeedBtn.Parent = MainFrame
SpeedBtn.Position = UDim2.new(0, 10, 0, 90)
SpeedBtn.Size = UDim2.new(0, 180, 0, 40)
SpeedBtn.Text = "Speed: 100"
SpeedBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)

-- LOGIC --
local fishing = false
AutoFishBtn.MouseButton1Click:Connect(function()
    fishing = not fishing
    AutoFishBtn.Text = fishing and "Auto Fish: ON" or "Auto Fish: OFF"
    spawn(function()
        while fishing do
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
            task.wait(0.5)
        end
    end)
end)

SpeedBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)
