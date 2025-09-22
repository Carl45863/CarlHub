-- PULL_A_SWORD_OFFICIAL_v1
-- Main Pull A Sword Script (Cartoony GUI with Auto features)

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Functions
local function autoClick()
    local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("ClickEvent")
    while _G.AutoClick do
        remote:FireServer()
        task.wait() -- super fast
    end
end

local function autoRebirth()
    local remote = ReplicatedStorage:WaitForChild("GameClient"):WaitForChild("Events"):WaitForChild("RemoteEvent"):WaitForChild("RebirthEvent")
    while _G.AutoRebirth do
        remote:FireServer()
        task.wait(0.5)
    end
end

local function autoBoss()
    local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("WinBossEvent")
    local bosses = {"Boss1","Boss2","Boss3","Boss4","Boss5","Boss6","Boss7","Boss8","Boss9","Boss10"}
    while _G.AutoBoss do
        for _,b in ipairs(bosses) do
            remote:FireServer(b)
        end
        task.wait()
    end
end

local function autoMega()
    local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("WinMegaBossEvent")
    while _G.AutoMega do
        remote:FireServer("Dragon2","Normal")
        task.wait()
    end
end

-- GUI (cartoony style basic)
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.Position = UDim2.new(0.5, -125, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(255, 200, 100)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 16)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "Pull A Sword"
Title.BackgroundColor3 = Color3.fromRGB(255, 170, 70)
Title.TextScaled = true

local function addButton(text, order, callback)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, 40 + (order * 40))
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(255, 220, 120)
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(callback)
end

addButton("Auto Click", 1, function()
    _G.AutoClick = not _G.AutoClick
    if _G.AutoClick then autoClick() end
end)

addButton("Auto Rebirth", 2, function()
    _G.AutoRebirth = not _G.AutoRebirth
    if _G.AutoRebirth then autoRebirth() end
end)

addButton("Auto Boss", 3, function()
    _G.AutoBoss = not _G.AutoBoss
    if _G.AutoBoss then autoBoss() end
end)

addButton("Auto Mega", 4, function()
    _G.AutoMega = not _G.AutoMega
    if _G.AutoMega then autoMega() end
end)
