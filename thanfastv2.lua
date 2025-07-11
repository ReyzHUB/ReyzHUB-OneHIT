repeat wait() until game:IsLoaded()
wait(2)

local gui = Instance.new("ScreenGui")
gui.Name = "ReyzHubFastAttack"
gui.ResetOnSpawn = false

-- Uji apakah bisa masuk ke CoreGui atau PlayerGui
local success = pcall(function()
	gui.Parent = game:GetService("CoreGui")
end)

if not success then
	pcall(function()
		gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	end)
end

-- Tombol UI
local btn = Instance.new("TextButton")
btn.Parent = gui
btn.Size = UDim2.new(0, 120, 0, 40)
btn.Position = UDim2.new(0.05, 0, 0.3, 0)
btn.Text = "Fast OFF"
btn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14
btn.BorderSizePixel = 0
btn.AutoButtonColor = false

btn.MouseButton1Click:Connect(function()
	btn.Text = (btn.Text == "Fast OFF") and "Fast ON" or "Fast OFF"
end)

print("✅ UI Loaded")
