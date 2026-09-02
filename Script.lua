-- Obito Hub - Steal an Egg Edition (Max Anti-Kick)

-- ١. بەهێزترین Anti-Kick (ڕێگریکردن لە پاڵنانی کایک و نامەی هەڵەی سێرڤەر)
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "Kick" or method == "kick" then
        if self == game.Players.LocalPlayer then
            warn("Obito Hub: ڕێگری کرا لە کیک کردن!")
            return -- ڕێگری دەکات لەوەی یارییەکە دەرتکات
        end
    end
    return old(self, ...)
end)
setreadonly(mt, true)

-- ٢. داپۆشینی ئاگاداركردنەوەی Error و Connection Loss (پەیوەندی سێرڤەر)
pcall(function()
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == "ErrorPrompt" then
            local message = child:FindFirstChild("MessageArea", true)
            if message and message:FindFirstChild("ErrorLabel") then
                -- ئەگەر کێشەی هێڵ یان سێرڤەر هەبوو، خۆکارانە سەرلەنوێ دەیبەستێتەوە یان دەیهێڵێتەوە
                task.wait(1)
                game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
            end
        end
    end)
end)

-- ماوەی سەرەکی سکریپتەکە
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("ObitoHubGui") then
    CoreGui.ObitoHubGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ObitoHubGui"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.02, 0, 0.12, 0)
ToggleButton.Size = UDim2.new(0, 120, 0, 40)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "⚡ Obito Hub"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 13
ToggleButton.Active = true
ToggleButton.Draggable = true

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -135)
MainFrame.Size = UDim2.new(0, 360, 0, 270)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TitleLabel.BorderSizePixel = 0
TitleLabel.Size = UDim2.new(1, 0, 0, 45)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "OBITO HUB - STEAL AN EGG"
TitleLabel.TextColor3 = Color3.fromRGB(255, 140, 0)
TitleLabel.TextSize = 14

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleLabel

local TitleCover = Instance.new("Frame")
TitleCover.Parent = TitleLabel
TitleCover.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TitleCover.BorderSizePixel = 0
TitleCover.Position = UDim2.new(0, 0, 0.7, 0)
TitleCover.Size = UDim2.new(1, 0, 0.3, 0)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Anti-AFK زۆر توند
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

task.spawn(function()
    while task.wait(20) do
        pcall(function()
            local vu = game:GetService("VirtualUser")
            vu:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
end)

local HopLabel = Instance.new("TextLabel")
HopLabel.Name = "HopLabel"
HopLabel.Parent = MainFrame
HopLabel.BackgroundTransparency = 1
HopLabel.Position = UDim2.new(0.05, 0, 0.22, 0)
HopLabel.Size = UDim2.new(0.9, 0, 0, 30)
HopLabel.Font = Enum.Font.GothamMedium
HopLabel.Text = "ژمارەی نەفەر لە سیرڤەر بنووسە:"
HopLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
HopLabel.TextSize = 12

local InputBox = Instance.new("TextBox")
InputBox.Name = "InputBox"
InputBox.Parent = MainFrame
InputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
InputBox.BorderColor3 = Color3.fromRGB(255, 140, 0)
InputBox.BorderSizePixel = 1
InputBox.Position = UDim2.new(0.08, 0, 0.38, 0)
InputBox.Size = UDim2.new(0.84, 0, 0, 40)
InputBox.Font = Enum.Font.GothamBold
InputBox.PlaceholderText = "نموونە: 1 یان 4"
InputBox.Text = "1"
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputBox.TextSize = 14

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = InputBox

local HopButton = Instance.new("TextButton")
HopButton.Name = "HopButton"
HopButton.Parent = MainFrame
HopButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
HopButton.BorderSizePixel = 0
HopButton.Position = UDim2.new(0.08, 0, 0.62, 0)
HopButton.Size = UDim2.new(0.84, 0, 0, 45)
HopButton.Font = Enum.Font.GothamBold
HopButton.Text = "گۆڕینی سیرڤەر (Server Hop)"
HopButton.TextColor3 = Color3.fromRGB(20, 20, 20)
HopButton.TextSize = 14

local HopCorner = Instance.new("UICorner")
HopCorner.CornerRadius = UDim.new(0, 6)
HopCorner.Parent = HopButton

local function ServerHop()
    local targetInput = InputBox.Text
    local targetCount = tonumber(targetInput)
    
    HopButton.Text = "دەگەڕێت..."
    
    local servers = {}
    
    pcall(function()
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local response = HttpService:JSONDecode(game:HttpGet(url))
        if response and response.data then
            for _, server in ipairs(response.data) do
                if server.playing and server.maxPlayers and server.id ~= game.JobId then
                    if targetCount and server.playing == targetCount then
                        table.insert(servers, server.id)
                    end
                end
            end
        end
    end)

    if #servers > 0 then
        local randomServer = servers[math.random(1, #servers)]
        TeleportService:TeleportToPlaceInstance(game.PlaceId, randomServer, LocalPlayer)
    else
        pcall(function()
            local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            local response = HttpService:JSONDecode(game:HttpGet(url))
            if response and response.data then
                for _, server in ipairs(response.data) do
                    if server.playing and server.id ~= game.JobId then
                        table.insert(servers, server.id)
                    end
                end
            end
        end)
        if #servers > 0 then
            local randomServer = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(game.PlaceId, randomServer, LocalPlayer)
        else
            HopButton.Text = "سیرڤەر نەدۆزرایەوە، دووبارە بکەرەوە"
            task.wait(2)
            HopButton.Text = "گۆڕینی سیرڤەر (Server Hop)"
        end
    end
end

HopButton.MouseButton1Click:Connect(ServerHop)
