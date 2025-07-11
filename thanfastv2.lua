-- Reyz Hub - Fast Attack (Thanhub Style)

repeat wait() until game:IsLoaded()
wait(2)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

_G.FastAttackV2 = false

-- Coba ambil CombatFramework
local success, CombatFramework = pcall(function()
    return require(LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
end)

local controller
if success and CombatFramework then
    local up = getupvalues(CombatFramework)
    controller = up[2]
end

-- UI Setup (Fix tampil di semua executor)
local gui = Instance.new("ScreenGui")
gui.Name = "ReyzHubFastAttack"
pcall(function()
    gui.Parent = game:GetService("CoreGui")
end)

local btn = Instance.new("TextButton")
btn.Parent = gui
btn.Size = UDim2.new(0, 120, 0, 40)
btn.Position = UDim2.new(0.02, 0, 0.3, 0)
btn.Text = "Fast OFF"
btn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14
btn.BorderSizePixel = 0
btn.AutoButtonColor = false

btn.MouseButton1Click:Connect(function()
    _G.FastAttackV2 = not _G.FastAttackV2
    btn.Text = _G.FastAttackV2 and "Fast ON" or "Fast OFF"
    btn.BackgroundColor3 = _G.FastAttackV2 and Color3.fromRGB(50, 120, 255) or Color3.fromRGB(100, 100, 100)
end)

RunService.RenderStepped:Connect(function()
    if _G.FastAttackV2 and controller then
        pcall(function()
            controller.timeToNextAttack = 0
            controller.hitboxMagnitude = 500
            controller.increment = 3
            controller:attack()
        end)
    end
end)

print("✅ Reyz Hub Fast Attack V2 loaded.")
