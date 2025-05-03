-- Carl's Roast Hub (Fixed Scroll + GUI Controls)
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RoastHub"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 450)
frame.Position = UDim2.new(0.5, -150, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = false

Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Text = "Carl's Roast Hub"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18

local roastList = Instance.new("ScrollingFrame", frame)
roastList.Size = UDim2.new(1, -10, 0, 350)
roastList.Position = UDim2.new(0, 5, 0, 35)
roastList.ScrollBarThickness = 8
roastList.BackgroundTransparency = 1
roastList.CanvasSize = UDim2.new(0, 0, 0, 0)

local layout = Instance.new("UIListLayout", roastList)
layout.Padding = UDim.new(0, 5)
layout.SortOrder = Enum.SortOrder.LayoutOrder

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    roastList.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end)

local copyLabel = Instance.new("TextLabel", frame)
copyLabel.Size = UDim2.new(1, -20, 0, 40)
copyLabel.Position = UDim2.new(0, 10, 0, 390)
copyLabel.Text = "Click a roast to copy it!"
copyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLabel.Font = Enum.Font.SourceSans
copyLabel.TextSize = 16
copyLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", copyLabel)

local closeButton = Instance.new("TextButton", frame)
closeButton.Text = "Close"
closeButton.Size = UDim2.new(0, 80, 0, 30)
closeButton.Position = UDim2.new(1, -90, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSans
closeButton.TextSize = 16
Instance.new("UICorner", closeButton)

closeButton.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

local roasts = {
    "You're like a cloud. When you disappear, it’s a beautiful day.",
    "I’d agree with you, but then we’d both be wrong.",
    "Your brain is like a web browser – 20 tabs open, 17 frozen.",
    "You bring everyone joy — when you leave.",
    "You're the reason shampoo has instructions.",
    "You're proof anyone can be useless and still breathe.",
    "You have something on your chin... no, the third one down.",
    "You're not stupid — you just have bad luck thinking.",
    "You're like a participation trophy come to life.",
    "If I wanted to hear from you, I’d turn off mute.",
    "You're like a soggy sandwich: disappointing in every way.",
    "Your face makes onions cry.",
    "You have something between your ears — I think it’s air.",
    "Your personality is like a rock — boring and in the way.",
    "You must be a magician — every word disappears my brain cells."
}

-- Create roast buttons
for _, roast in ipairs(roasts) do
    local button = Instance.new("TextButton", roastList)
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Text = roast
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    Instance.new("UICorner", button)
    
    button.MouseButton1Click:Connect(function()
        setclipboard(roast)
        copyLabel.Text = "Copied: " .. roast
    end)
end

-- Open GUI when typing "roast me"
player.Chatted:Connect(function(msg)
    if msg:lower() == "roast me" then
        frame.Visible = true
    end
end)
