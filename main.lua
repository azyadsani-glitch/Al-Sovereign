local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "AL AI SOVEREIGN - FISH IT!", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- TAB FARM
local Tab = Window:MakeTab({
	Name = "Auto Blatant",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Auto Tap & Fish",
	Default = false,
	Callback = function(Value)
		_G.AutoFish = Value
		while _G.AutoFish do
			local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
			if tool then
				tool:Activate()
			end
			task.wait(0.1)
		end
	end    
})

-- TAB PLAYER
local Tab2 = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab2:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

OrionLib:Init()
