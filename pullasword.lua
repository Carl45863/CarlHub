-- Pull A Sword Hub 🍭🍬 By Carl 💫

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Title = Instance.new("TextLabel")

-- GUI setup
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Active = true
MainFrame.Draggable = true

-- Rounded corners
UICorner.CornerRadius = UDim.new(0, 25)
UICorner.Parent = MainFrame

-- Gradient background
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 182, 193)), -- light pink
    ColorSequenceKeypoint.new(1, Color3.fromRGB(135, 206, 250)) -- sky blue
}
UIGradient.Rotation = 45
UIGradient.Parent = MainFrame

-- Title
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Text = "🍭 Pull A Sword Hub 🍬\nBy Carl 💫"
Title.Font = Enum.Font.Cartoon
Title.TextSize = 28
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextStrokeTransparency = 0.2

-- Function to create buttons
local function createButton(text, posY, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = MainFrame
    btn.Size = UDim2.new(0, 180, 0, 40)
    btn.Position = UDim2.new(0.5, -90, 0, posY)
    btn.BackgroundColor3 = color
    btn.Font = Enum.Font.Cartoon
    btn.TextSize = 20
    btn.Text = text
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Auto Click
local autoClicking = false
createButton("⚡ Auto Click", 80, Color3.fromRGB(255, 228, 181), function()
    autoClicking = not autoClicking
    if autoClicking then
        spawn(function()
            while autoClicking do
                ReplicatedStorage.Remotes.Events.ClickEvent:FireServer()
                task.wait() -- sobrang bilis!
            end
        end)
    end
end)

-- Auto Rebirth
local autoRebirth = false
createButton("🔄 Auto Rebirth", 130, Color3.fromRGB(152, 251, 152), function()
    autoRebirth = not autoRebirth
    if autoRebirth then
        spawn(function()
            while autoRebirth do
                ReplicatedStorage.GameClient.Events.RemoteEvent.RebirthEvent:FireServer()
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Boss (Boss1 - Boss10)
local autoBoss = false
createButton("👹 Auto Boss 1-10", 180, Color3.fromRGB(255, 160, 122), function()
    autoBoss = not autoBoss
    if autoBoss then
        spawn(function()
            while autoBoss do
                for i=1,10 do
                    ReplicatedStorage.Remotes.Events.WinBossEvent:FireServer("Boss"..i)
                end
                task.wait()
            end
        end)
    end
end)

-- Auto Dragon Boss
local autoMega = false
createButton("🐉 Auto Dragon", 230, Color3.fromRGB(135, 206, 235), function()
    autoMega = not autoMega
    if autoMega then
        spawn(function()
            while autoMega do
                ReplicatedStorage.Remotes.Events.WinMegaBossEvent:FireServer("Dragon2","Normal")
                task.wait()
            end
        end)
    end
end)
