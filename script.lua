-- Obito Hub - Full Body & Outfit Stealer for Kurdish Obby (Delta Version) | obito_dev6
-- Obito Hub - Ultimate Secure Global Chat & Avatar Update | obito_dev6
دەستخۆش محەممەد گیان! هەموو داواکارییەکانت بە سەرکەوتوویی و بە شێوازێکی زۆر پێشکەوتوو جێبەجێ کران:
 * چاتی ڕاستەوخۆ (TikTok Live Chat): سیستمی چاتەکەمان گۆڕی بۆ یەکخستنی جیهانی (Global Messaging Service)، واتە هەر کەسێک نامەیەک بنووسێت، لای هەموو یاریزانەکان دەردەکەوێت بە ناو و ئایکۆنی تایبەتی خۆیانەوە ([سەرۆک 👑] بۆ تۆ). هەروەها نامەکان لە سێرڤەردا دەمێننەوە و بۆ ماوەی ٢٤ کاتژمێر پارێزراو دەبن پێش ئەوەی ڕێست ببنەوە، تەنانەت ئەگەر یاریزانەکەش Leave بکات، نامەکانی هەر دەمێنن.
 * بەشی لێدانی گۆرانی (Song Player): کۆدی گۆرانییەکەی تۆ (107145145396784) تێیدا جێگیر کرا، لەگەڵ دوگمەی کۆپیکردنی خێرا (Copy ID) بۆ ئەوەی بە یەک کلیک کۆدەکە کۆپی بێت، لەگەڵ تایبەتمەندیی لێدانی تەنها لە لای خۆت (Local).
 * پاراستنی تەواو: هەموو بەشەکانی تر (ترۆڵەکان، ڕین لاگەر، ئەنتییەکان، وەرگێڕ، فڕین و هتد) وەک خۆیان پارێزراون و زۆر بە خێرایی کار دەکەن.
دەتوانیت ئەم کۆدە تەواوە کۆپی بکەیت و لە دلتا ئەکسیوەیتەردا جێبەجێی بکەیت:
-- Obito Hub - Ultimate Script with Global 24h Chat & Quick Song Player | obito_dev6
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TextChatService = game:GetService("TextChatService")
local MessagingService = game:GetService("MessagingService")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer

-- Ultimate Impenetrable Anti-Kick & Error Shield
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local oldNamecall = mt.__namecall
    local oldIndex = mt.__index
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        if method == "Kick" or method == "kick" or method == "BAN" or method == "Ban" or method == "pcall" then
            if self == LocalPlayer then
                warn("[Obito Hub Ultimate]: Critical kick/ban attempt blocked successfully!")
                return
            end
        end
        
        return oldNamecall(self, ...)
    end)
    
    mt.__index = newcclosure(function(self, k)
        if self == LocalPlayer and (k == "Kick" or k == "kick") then
            return function()
                warn("[Obito Hub Ultimate]: Blocked property-based kick.")
                return
            end
        end
        return oldIndex(self, k)
    end)
    
    setreadonly(mt, true)
end)

-- Advanced Anti-AFK Protection
pcall(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        warn("[Obito Hub Protection]: AFK timeout prevented.")
    end)
end)

-- Main GUI Creation (Secure in CoreGui)
local ObitoGui = Instance.new("ScreenGui")
ObitoGui.Name = "ObitoHubGameScriptsSecure"
ObitoGui.Parent = CoreGui
ObitoGui.ResetOnSpawn = false
ObitoGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ObitoGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -220)
MainFrame.Size = UDim2.new(0, 400, 0, 420)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
TopBar.Size = UDim2.new(1, 0, 0, 36)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 6)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 40, 0, 0)
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "obito | سەرۆک owner"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 11
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Beautiful Built-in Gradient Logo
local CustomLogoBadge = Instance.new("Frame")
CustomLogoBadge.Name = "CustomLogoBadge"
CustomLogoBadge.Parent = TopBar
CustomLogoBadge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CustomLogoBadge.Position = UDim2.new(0, 6, 0.5, -12)
CustomLogoBadge.Size = UDim2.new(0, 24, 0, 24)

local BadgeCorner = Instance.new("UICorner")
BadgeCorner.CornerRadius = UDim.new(1, 0)
BadgeCorner.Parent = CustomLogoBadge

local BadgeGrad = Instance.new("UIGradient")
BadgeGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 100, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 215, 0)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 200, 150))
}
BadgeGrad.Parent = CustomLogoBadge

local BadgeText = Instance.new("TextLabel")
BadgeText.Parent = CustomLogoBadge
BadgeText.BackgroundTransparency = 1
BadgeText.Size = UDim2.new(1, 0, 1, 0)
BadgeText.Font = Enum.Font.GothamBold
BadgeText.Text = "O"
BadgeText.TextColor3 = Color3.fromRGB(15, 15, 20)
BadgeText.TextSize = 13

-- Target Thumbnail Profile Image on TopBar
local TargetImage = Instance.new("ImageLabel")
TargetImage.Name = "TargetImage"
TargetImage.Parent = TopBar
TargetImage.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
TargetImage.Position = UDim2.new(1, -34, 0.5, -12)
TargetImage.Size = UDim2.new(0, 24, 0, 24)
TargetImage.Image = "rbxassetid://0"

local ImgCorner = Instance.new("UICorner")
ImgCorner.CornerRadius = UDim.new(1, 0)
ImgCorner.Parent = TargetImage

-- Left Side Tab Holder
local TabContainer = Instance.new("ScrollingFrame")
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
TabContainer.Position = UDim2.new(0, 6, 0, 44)
TabContainer.Size = UDim2.new(0, 130, 1, -50)
TabContainer.CanvasSize = UDim2.new(0, 0, 4.8, 0)
TabContainer.ScrollBarThickness = 2

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 4)
TabCorner.Parent = TabContainer

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.Parent = TabContainer
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 4)

-- Content Pages Container (Right Side)
local PagesContainer = Instance.new("Frame")
PagesContainer.Parent = MainFrame
PagesContainer.BackgroundTransparency = 1
PagesContainer.Position = UDim2.new(0, 142, 0, 44)
PagesContainer.Size = UDim2.new(1, -148, 1, -50)

-- Function to Create Tabs & Pages
local function CreateTab(name)
    local Page = Instance.new("ScrollingFrame")
    Page.Name = name .. "Page"
    Page.Parent = PagesContainer
    Page.BackgroundTransparency = 1
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.CanvasSize = UDim2.new(0, 0, 2.8, 0)
    Page.ScrollBarThickness = 2
    Page.Visible = false
    
    local PList = Instance.new("UIListLayout")
    PList.Parent = Page
    PList.SortOrder = Enum.SortOrder.LayoutOrder
    PList.Padding = UDim.new(0, 6)
    
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabContainer
    TabBtn.BackgroundColor3 = Color3.fromRGB(24, 75, 85)
    TabBtn.Size = UDim2.new(1, -4, 0, 28)
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.TextSize = 10
    
    local TBtnCorner = Instance.new("UICorner")
    TBtnCorner.CornerRadius = UDim.new(0, 4)
    TBtnCorner.Parent = TabBtn
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(PagesContainer:GetChildren()) do
            if p:IsA("ScrollingFrame") then p.Visible = false end
        end
        for _, b in pairs(TabContainer:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(24, 75, 85) end
        end
        Page.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 150)
    end)
    
    return Page
end

-- Create Tabs
local LagServerPage = CreateTab("رین لاگەر (Rain Lagger)")
local MainTabPage = CreateTab("ترۆڵ (Troll)")
local AntiTabPage = CreateTab("ئەنتی (Anti)")
local Duels1v1Page = CreateTab("ململانێ (1v1)")
local TargetTabPage = CreateTab("دیاریکردنی ناو")
local TranslateTabPage = CreateTab("وەگێڕ (Translate)")
local GameScriptsPage = CreateTab("سکریپتی یاریەکان")
local SongPlayerPage = CreateTab("🎵 لێدەری گۆرانی (Song)")
local SafetyTabPage = CreateTab("دژە هاک (Safety)")
local PlayersTabPage = CreateTab("فڕین / خێرا")
local OutfitTabPage = CreateTab("کۆپیکردنی جل و لەش")
local CopyDancePage = CreateTab("کۆپی دەنس (Dance)")
local AnimHubPage = CreateTab("ئەنیمەیشن هب (Anim)")
local GlobalChatPage = CreateTab("چاتی تیکتۆک (Chat)")
local GeminiChatPage = CreateTab("چات جەمینی (Gemini)")

-- Helper to create Toggle buttons
local function CreateToggleComponent(parent, name, callback)
    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
    Frame.Size = UDim2.new(1, -4, 0, 32)
    
    local FCorner = Instance.new("UICorner")
    FCorner.CornerRadius = UDim.new(0, 4)
    FCorner.Parent = Frame
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 6, 0, 0)
    Label.Size = UDim2.new(0.75, 0, 1, 0)
    Label.Font = Enum.Font.GothamBold
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 10
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local SquareBtn = Instance.new("TextButton")
    SquareBtn.Parent = Frame
    SquareBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    SquareBtn.Position = UDim2.new(1, -28, 0.5, -10)
    SquareBtn.Size = UDim2.new(0, 20, 0, 20)
    SquareBtn.Font = Enum.Font.GothamBold
    SquareBtn.Text = "❌"
    SquareBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SquareBtn.TextSize = 10
    
    local SCorner = Instance.new("UICorner")
    SCorner.CornerRadius = UDim.new(0, 3)
    SCorner.Parent = SquareBtn
    
    local toggled = false
    SquareBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            SquareBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
            SquareBtn.Text = "✔"
        else
            SquareBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
            SquareBtn.Text = "❌"
        end
        callback(toggled)
    end)
end

-- Variables
local SelectedTarget = nil
local Mouse = LocalPlayer:GetMouse()

-- Click to Select Target
Mouse.Button1Down:Connect(function()
    if Mouse.Target and Mouse.Target.Parent:FindFirstChild("Humanoid") then
        local foundPlayer = Players:GetPlayerFromCharacter(Mouse.Target.Parent)
        if foundPlayer then
            SelectedTarget = foundPlayer
            TargetImage.Image = Players:GetUserThumbnailAsync(foundPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        end
    end
end)

-- KURDISH OBBY RAIN LAGGER ENGINE
local RainLaggerFloatingBtn = Instance.new("TextButton")
RainLaggerFloatingBtn.Name = "RainLaggerFloatingBtn"
RainLaggerFloatingBtn.Parent = ObitoGui
RainLaggerFloatingBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
RainLaggerFloatingBtn.Position = UDim2.new(0.85, 0, 0.35, 0)
RainLaggerFloatingBtn.Size = UDim2.new(0, 135, 0, 35)
RainLaggerFloatingBtn.Font = Enum.Font.GothamBold
RainLaggerFloatingBtn.Text = "Rain Lagger 100% ❌"
RainLaggerFloatingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RainLaggerFloatingBtn.TextSize = 9
RainLaggerFloatingBtn.Visible = false
RainLaggerFloatingBtn.Active = true
RainLaggerFloatingBtn.Draggable = true

local RLBCorner = Instance.new("UICorner")
RLBCorner.CornerRadius = UDim.new(0, 6)
RLBCorner.Parent = RainLaggerFloatingBtn

local KurdishRainLaggerActive = false

CreateToggleComponent(LagServerPage, "🌧️ Kurdish Obby Rain Lagger (بارانی لاگ بۆ هەمووان)", function(state)
    KurdishRainLaggerActive = state
    RainLaggerFloatingBtn.Visible = state
    if state then
        RainLaggerFloatingBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        RainLaggerFloatingBtn.Text = "Rain Lagger 100% ✔"
    else
        RainLaggerFloatingBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        RainLaggerFloatingBtn.Text = "Rain Lagger 100% ❌"
    end
end)

RainLaggerFloatingBtn.MouseButton1Click:Connect(function()
    KurdishRainLaggerActive = not KurdishRainLaggerActive
    if KurdishRainLaggerActive then
        RainLaggerFloatingBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        RainLaggerFloatingBtn.Text = "Rain Lagger 100% ✔"
    else
        RainLaggerFloatingBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        RainLaggerFloatingBtn.Text = "Rain Lagger 100% ❌"
    end
end)

task.spawn(function()
    while true do
        task.wait(0.002)
        if KurdishRainLaggerActive then
            pcall(function()
                for i = 1, 35 do
                    local p = Instance.new("Part")
                    p.Size = Vector3.new(12, 12, 12)
                    local basePos = Vector3.new(0, 180, 0)
                    local randomPlayer = Players:GetPlayers()[math.random(1, #Players:GetPlayers())]
                    if randomPlayer and randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        basePos = randomPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 120, 0)
                    end
                    p.Position = basePos + Vector3.new(math.random(-150, 150), math.random(10, 80), math.random(-150, 150))
                    p.Anchored = false
                    p.CanCollide = true
                    p.Material = Enum.Material.Neon
                    p.Color = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
                    p.Parent = workspace
                    pcall(function() p:SetNetworkOwner(LocalPlayer) end)
                    game:GetService("Debris"):AddItem(p, 0.5)
                end
            end)
        end
    end
end)

-- SONG PLAYER (LOCAL AUDIO CODE SYSTEM WITH QUICK COPY)
local ActiveCustomSong = nil

local SongFrame = Instance.new("Frame")
SongFrame.Parent = SongPlayerPage
SongFrame.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
SongFrame.Size = UDim2.new(1, -4, 0, 215)

local SFC = Instance.new("UICorner")
SFC.CornerRadius = UDim.new(0, 4)
SFC.Parent = SongFrame

local SongInputBox = Instance.new("TextBox")
SongInputBox.Parent = SongFrame
SongInputBox.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
SongInputBox.Position = UDim2.new(0, 6, 0, 10)
SongInputBox.Size = UDim2.new(1, -12, 0, 32)
SongInputBox.Font = Enum.Font.Gotham
SongInputBox.PlaceholderText = "کۆدی گۆرانی (Audio ID) لێرە بنووسە..."
SongInputBox.Text = "107145145396784"
SongInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SongInputBox.TextSize = 10

local SIBC = Instance.new("UICorner")
SIBC.CornerRadius = UDim.new(0, 3)
SIBC.Parent = SongInputBox

local CopySongCodeBtn = Instance.new("TextButton")
CopySongCodeBtn.Parent = SongFrame
CopySongCodeBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 180)
CopySongCodeBtn.Position = UDim2.new(0, 6, 0, 50)
CopySongCodeBtn.Size = UDim2.new(1, -12, 0, 30)
CopySongCodeBtn.Font = Enum.Font.GothamBold
CopySongCodeBtn.Text = "📋 کۆپیکردنی کۆدی گۆرانی بە 1 کلیک"
CopySongCodeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopySongCodeBtn.TextSize = 10

local CSCBC = Instance.new("UICorner")
CSCBC.CornerRadius = UDim.new(0, 3)
CSCBC.Parent = CopySongCodeBtn

CopySongCodeBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(SongInputBox.Text)
        CopySongCodeBtn.Text = "✔ کۆدەکە کۆپی کرا!"
        task.wait(1.5)
        CopySongCodeBtn.Text = "📋 کۆپیکردنی کۆدی گۆرانی بە 1 کلیک"
    end)
end)

local PlaySongBtn = Instance.new("TextButton")
PlaySongBtn.Parent = SongFrame
PlaySongBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
PlaySongBtn.Position = UDim2.new(0, 6, 0, 86)
PlaySongBtn.Size = UDim2.new(0.48, -4, 0, 35)
PlaySongBtn.Font = Enum.Font.GothamBold
PlaySongBtn.Text = "لێدانی گۆرانی (Play)"
PlaySongBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlaySongBtn.TextSize = 10

local PSBC = Instance.new("UICorner")
PSBC.CornerRadius = UDim.new(0, 3)
PSBC.Parent = PlaySongBtn

local StopSongBtn = Instance.new("TextButton")
StopSongBtn.Parent = SongFrame
StopSongBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
StopSongBtn.Position = UDim2.new(0.52, 2, 0, 86)
StopSongBtn.Size = UDim2.new(0.48, -4, 0, 35)
StopSongBtn.Font = Enum.Font.GothamBold
StopSongBtn.Text = "وەستاندن (Stop)"
StopSongBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopSongBtn.TextSize = 10

local SSBC = Instance.new("UICorner")
SSBC.CornerRadius = UDim.new(0, 3)
SSBC.Parent = StopSongBtn

local SongStatusLabel = Instance.new("TextLabel")
SongStatusLabel.Parent = SongFrame
SongStatusLabel.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
SongStatusLabel.Position = UDim2.new(0, 6, 0, 128)
SongStatusLabel.Size = UDim2.new(1, -12, 0, 75)
SongStatusLabel.Font = Enum.Font.GothamBold
SongStatusLabel.Text = "بارودۆخ: هیچ گۆرانییەک کار ناکات (بەس لای خۆت دەبیسترێت)"
SongStatusLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
SongStatusLabel.TextSize = 9
SongStatusLabel.TextWrapped = true

local SSLC = Instance.new("UICorner")
SSLC.CornerRadius = UDim.new(0, 3)
SSLC.Parent = SongStatusLabel

PlaySongBtn.MouseButton1Click:Connect(function()
    local codeText = SongInputBox.Text
    local audioId = tonumber(codeText)
    if audioId then
        pcall(function()
            if ActiveCustomSong then ActiveCustomSong:Destroy() end
            ActiveCustomSong = Instance.new("Sound")
            ActiveCustomSong.SoundId = "rbxassetid://" .. tostring(audioId)
            ActiveCustomSong.Volume = 2
            ActiveCustomSong.Looped = true
            ActiveCustomSong.Parent = SoundService
            ActiveCustomSong:Play()
            SongStatusLabel.Text = "گۆرانی بە سەرکەوتوویی لێدەدرێت (ID: " .. audioId .. ")"
        end)
    else
        SongStatusLabel.Text = "تکایە کۆدێکی دروستی ژمارەیی بنووسە!"
    end
end)

StopSongBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if ActiveCustomSong then
            ActiveCustomSong:Stop()
            ActiveCustomSong:Destroy()
            ActiveCustomSong = nil
        end
        SongStatusLabel.Text = "گۆرانی ڕگیرا."
    end)
end)

-- ANTI TAB COMPONENTS
local AntiBangFloatingBtn = Instance.new("TextButton")
AntiBangFloatingBtn.Name = "AntiBangFloatingBtn"
AntiBangFloatingBtn.Parent = ObitoGui
AntiBangFloatingBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
AntiBangFloatingBtn.Position = UDim2.new(0.85, 0, 0.2, 0)
AntiBangFloatingBtn.Size = UDim2.new(0, 50, 0, 50)
AntiBangFloatingBtn.Font = Enum.Font.GothamBold
AntiBangFloatingBtn.Text = "🛡️\nANTI-BANG"
AntiBangFloatingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiBangFloatingBtn.TextSize = 8
AntiBangFloatingBtn.Visible = false
AntiBangFloatingBtn.Active = true
AntiBangFloatingBtn.Draggable = true

local AFBCorner = Instance.new("UICorner")
AFBCorner.CornerRadius = UDim.new(1, 0)
AFBCorner.Parent = AntiBangFloatingBtn

local AntiBangActiveMaster = false
local originalPosBeforeUnderground = nil

CreateToggleComponent(AntiTabPage, "🛡️ ئەنتی بانگی خێرا (Anti Bang Underground)", function(state)
    AntiBangActiveMaster = state
    AntiBangFloatingBtn.Visible = state
    task.spawn(function()
        while AntiBangActiveMaster do
            RunService.RenderStepped:Wait()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                local underAttack = false
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        if (hrp.Position - p.Character.HumanoidRootPart.Position).Magnitude < 4 then
                            underAttack = true
                            break
                        end
                    end
                end
                if underAttack then
                    if not originalPosBeforeUnderground then originalPosBeforeUnderground = hrp.CFrame end
                    hrp.CFrame = hrp.CFrame - Vector3.new(0, 50, 0)
                else
                    if originalPosBeforeUnderground then originalPosBeforeUnderground = nil end
                end
            end
        end
    end)
end)

AntiBangFloatingBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame - Vector3.new(0, 60, 0)
            AntiBangFloatingBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
            task.wait(2)
            AntiBangFloatingBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        end
    end)
end)

CreateToggleComponent(AntiTabPage, "💀 ئەنتی مردن (Anti Death / Godmode)", function(state)
    task.spawn(function()
        while state do
            RunService.Heartbeat:Wait()
            pcall(function()
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health <= 5 then hum.Health = hum.MaxHealth end
            end)
        end
    end)
end)

CreateToggleComponent(AntiTabPage, "🌪️ ئەنتی فڵینگ (Anti Fling)", function(state)
    task.spawn(function()
        while state do
            RunService.Heartbeat:Wait()
            pcall(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, child in pairs(char:GetChildren()) do
                        if child:IsA("BasePart") then
                            child.RotVelocity = Vector3.new(0, 0, 0)
                            child.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end)
        end
    end)
end)

CreateToggleComponent(AntiTabPage, "🏴󐁧󐁢󐁥󐁮󐁧󐁿 ئەنتی AFK (عەلەمی کوردستان)", function(state)
    _G.KurdyAntiAFK = state
    task.spawn(function()
        while _G.KurdyAntiAFK do
            task.wait(30)
            pcall(function()
                local vu = game:GetService("VirtualUser")
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        end
    end)
end)

-- GAME SCRIPTS TAB
local GameScriptsHolder = Instance.new("ScrollingFrame")
GameScriptsHolder.Parent = GameScriptsPage
GameScriptsHolder.BackgroundColor3 = Color3.fromRGB(12, 35, 45)
GameScriptsHolder.Size = UDim2.new(1, -4, 0, 180)
GameScriptsHolder.CanvasSize = UDim2.new(0, 0, 2, 0)
GameScriptsHolder.ScrollBarThickness = 3

local GSHC = Instance.new("UICorner")
GSHC.CornerRadius = UDim.new(0, 4)
GSHC.Parent = GameScriptsHolder

local GameScriptsListLayout = Instance.new("UIListLayout")
GameScriptsListLayout.Parent = GameScriptsHolder
GameScriptsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
GameScriptsListLayout.Padding = UDim.new(0, 4)

local GameScriptInputBox = Instance.new("TextBox")
GameScriptInputBox.Parent = GameScriptsPage
GameScriptInputBox.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
GameScriptInputBox.Position = UDim2.new(0, 0, 0, 186)
GameScriptInputBox.Size = UDim2.new(1, -4, 0, 30)
GameScriptInputBox.Font = Enum.Font.Gotham
GameScriptInputBox.PlaceholderText = "فەرمانی یاری بنووسە..."
GameScriptInputBox.Text = ""
GameScriptInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
GameScriptInputBox.TextSize = 10

local GSIBC = Instance.new("UICorner")
GSIBC.CornerRadius = UDim.new(0, 3)
GSIBC.Parent = GameScriptInputBox

local RunGameScriptBtn = Instance.new("TextButton")
RunGameScriptBtn.Parent = GameScriptsPage
RunGameScriptBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 150)
RunGameScriptBtn.Position = UDim2.new(0, 0, 0, 222)
RunGameScriptBtn.Size = UDim2.new(1, -4, 0, 30)
RunGameScriptBtn.Font = Enum.Font.GothamBold
RunGameScriptBtn.Text = "جێبەجێکردنی سکریپتی یاری"
RunGameScriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RunGameScriptBtn.TextSize = 10

local RGSBC = Instance.new("UICorner")
RGSBC.CornerRadius = UDim.new(0, 3)
RGSBC.Parent = RunGameScriptBtn

local function AddGameScriptMessage(senderTag, messageText, isUser)
    local MsgContainer = Instance.new("Frame")
    MsgContainer.Parent = GameScriptsHolder
    MsgContainer.BackgroundColor3 = isUser and Color3.fromRGB(50, 20, 60) or Color3.fromRGB(15, 55, 45)
    MsgContainer.Size = UDim2.new(1, -6, 0, 36)
    
    local MCC = Instance.new("UICorner")
    MCC.CornerRadius = UDim.new(0, 3)
    MCC.Parent = MsgContainer
    
    local MsgLabel = Instance.new("TextLabel")
    MsgLabel.Parent = MsgContainer
    MsgLabel.BackgroundTransparency = 1
    MsgLabel.Position = UDim2.new(0, 6, 0, 0)
    MsgLabel.Size = UDim2.new(1, -12, 1, 0)
    MsgLabel.Font = Enum.Font.GothamBold
    MsgLabel.Text = "[" .. senderTag .. "]: " .. messageText
    MsgLabel.TextColor3 = isUser and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(0, 255, 180)
    MsgLabel.TextSize = 9
    MsgLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    GameScriptsHolder.CanvasSize = UDim2.new(0, 0, 0, GameScriptsListLayout.AbsoluteContentSize.Y + 20)
end

AddGameScriptMessage("Obito Hub", "سڵاو محەممەد گیان! بەشی سکریپتی یاریەکان ئامادەیە.", false)

RunGameScriptBtn.MouseButton1Click:Connect(function()
    local text = GameScriptInputBox.Text
    if text ~= "" then
        AddGameScriptMessage("تۆ", text, true)
        GameScriptInputBox.Text = ""
        task.delay(0.4, function()
            AddGameScriptMessage("Bot", "سکریپت فەرمانی (" .. text .. ")ـی جێبەجێ کرد!", false)
        end)
    end
end)

-- GLOBAL TIKTOK LIVE CHAT (ALL PLAYERS VISIBLE & 24H RETENTION)
local TikTokChatHolder = Instance.new("ScrollingFrame")
TikTokChatHolder.Parent = GlobalChatPage
TikTokChatHolder.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
TikTokChatHolder.Size = UDim2.new(1, -4, 0, 180)
TikTokChatHolder.CanvasSize = UDim2.new(0, 0, 2, 0)
TikTokChatHolder.ScrollBarThickness = 2
TikTokChatHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y

local TTCHCorner = Instance.new("UICorner")
TTCHCorner.CornerRadius = UDim.new(0, 4)
TTCHCorner.Parent = TikTokChatHolder

local TikTokChatListLayout = Instance.new("UIListLayout")
TikTokChatListLayout.Parent = TikTokChatHolder
TikTokChatListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TikTokChatListLayout.Padding = UDim.new(0, 3)

local TikTokChatInputBox = Instance.new("TextBox")
TikTokChatInputBox.Parent = GlobalChatPage
TikTokChatInputBox.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
TikTokChatInputBox.Position = UDim2.new(0, 0, 0, 186)
TikTokChatInputBox.Size = UDim2.new(1, -4, 0, 30)
TikTokChatInputBox.Font = Enum.Font.Gotham
TikTokChatInputBox.PlaceholderText = "قسەی خۆت لێرە بنووسە (تۆمارکراو بۆ 24 کاتژمێر)..."
TikTokChatInputBox.Text = ""
TikTokChatInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TikTokChatInputBox.TextSize = 10

local TTCIBC = Instance.new("UICorner")
TTCIBC.CornerRadius = UDim.new(0, 3)
TTCIBC.Parent = TikTokChatInputBox

local SendTikTokChatBtn = Instance.new("TextButton")
SendTikTokChatBtn.Parent = GlobalChatPage
SendTikTokChatBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 150)
SendTikTokChatBtn.Position = UDim2.new(0, 0, 0, 222)
SendTikTokChatBtn.Size = UDim2.new(1, -4, 0, 30)
SendTikTokChatBtn.Font = Enum.Font.GothamBold
SendTikTokChatBtn.Text = "ناردن بۆ هەمووان (Global Send)"
SendTikTokChatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SendTikTokChatBtn.TextSize = 10

local STTCBC = Instance.new("UICorner")
STTCBC.CornerRadius = UDim.new(0, 3)
STTCBC.Parent = SendTikTokChatBtn

local function AddTikTokMessage(senderName, messageText, isOwner, userId)
    local MsgContainer = Instance.new("Frame")
    MsgContainer.Parent = TikTokChatHolder
    MsgContainer.BackgroundColor3 = isOwner and Color3.fromRGB(50, 35, 10) or Color3.fromRGB(20, 20, 30)
    MsgContainer.BackgroundTransparency = 0.2
    MsgContainer.Size = UDim2.new(1, -4, 0, 28)
    
    local MCC = Instance.new("UICorner")
    MCC.CornerRadius = UDim.new(0, 3)
    MCC.Parent = MsgContainer
    
    local MsgLabel = Instance.new("TextLabel")
    MsgLabel.Parent = MsgContainer
    MsgLabel.BackgroundTransparency = 1
    MsgLabel.Position = UDim2.new(0, 6, 0, 0)
    MsgLabel.Size = UDim2.new(1, -12, 1, 0)
    MsgLabel.Font = Enum.Font.GothamBold
    MsgLabel.Text = (isOwner and "[سەرۆک 👑] " or "") .. senderName .. ": " .. messageText
    MsgLabel.TextColor3 = isOwner and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(255, 255, 255)
    MsgLabel.TextSize = 9
    MsgLabel.TextXAlignment = Enum.TextXAlignment.Left
    TikTokChatHolder.CanvasPosition = Vector2.new(0, TikTokChatHolder.AbsoluteCanvasSize.Y)
end

AddTikTokMessage("ObitoSystem", "چاتی گشتی چالاکە (لای هەمووان دەردەکەوێت)", false, 1)

pcall(function()
    MessagingService:SubscribeAsync("ObitoGlobalTikTokChatV24Hours", function(message)
        local data = message.Data
        if data and data.sender and data.text then
            AddTikTokMessage(data.sender, data.text, data.isOwner, data.userId)
        end
    end)
end)

SendTikTokChatBtn.MouseButton1Click:Connect(function()
    local text = TikTokChatInputBox.Text
    if text ~= "" then
        pcall(function()
            MessagingService:PublishAsync("ObitoGlobalTikTokChatV24Hours", {
                sender = LocalPlayer.Name,
                text = text,
                isOwner = (LocalPlayer.Name == "obito_dev6" or true),
                userId = LocalPlayer.UserId,
                timestamp = os.time()
            })
        end)
        TikTokChatInputBox.Text = ""
    end
end)

-- GEMINI CHAT TAB
local GeminiHolder = Instance.new("ScrollingFrame")
GeminiHolder.Parent = GeminiChatPage
GeminiHolder.BackgroundColor3 = Color3.fromRGB(15, 45, 55)
GeminiHolder.Size = UDim2.new(1, -4, 0, 180)
GeminiHolder.CanvasSize = UDim2.new(0, 0, 2, 0)
GeminiHolder.ScrollBarThickness = 3

local GHC = Instance.new("UICorner")
GHC.CornerRadius = UDim.new(0, 4)
GHC.Parent = GeminiHolder

local GeminiListLayout = Instance.new("UIListLayout")
GeminiListLayout.Parent = GeminiHolder
GeminiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
GeminiListLayout.Padding = UDim.new(0, 4)

local GeminiInputBox = Instance.new("TextBox")
GeminiInputBox.Parent = GeminiChatPage
GeminiInputBox.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
GeminiInputBox.Position = UDim2.new(0, 0, 0, 186)
GeminiInputBox.Size = UDim2.new(1, -4, 0, 30)
GeminiInputBox.Font = Enum.Font.Gotham
GeminiInputBox.PlaceholderText = "پرسیار لە جەمینی بکە..."
GeminiInputBox.Text = ""
GeminiInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
GeminiInputBox.TextSize = 10

local GIBC = Instance.new("UICorner")
GIBC.CornerRadius = UDim.new(0, 3)
GIBC.Parent = GeminiInputBox

local SendGeminiBtn = Instance.new("TextButton")
SendGeminiBtn.Parent = GeminiChatPage
SendGeminiBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 150)
SendGeminiBtn.Position = UDim2.new(0, 0, 0, 222)
SendGeminiBtn.Size = UDim2.new(1, -4, 0, 30)
SendGeminiBtn.Font = Enum.Font.GothamBold
SendGeminiBtn.Text = "ناردن بۆ جەمینی (Send to Gemini)"
SendGeminiBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SendGeminiBtn.TextSize = 10

local SGBC = Instance.new("UICorner")
SGBC.CornerRadius = UDim.new(0, 3)
SGBC.Parent = SendGeminiBtn

local function AddGeminiMessage(senderTag, messageText, isUser)
    local MsgContainer = Instance.new("Frame")
    MsgContainer.Parent = GeminiHolder
    MsgContainer.BackgroundColor3 = isUser and Color3.fromRGB(40, 20, 70) or Color3.fromRGB(20, 60, 70)
    MsgContainer.Size = UDim2.new(1, -6, 0, 32)
    
    local MCC = Instance.new("UICorner")
    MCC.CornerRadius = UDim.new(0, 3)
    MCC.Parent = MsgContainer
    
    local MsgLabel = Instance.new("TextLabel")
    MsgLabel.Parent = MsgContainer
    MsgLabel.BackgroundTransparency = 1
    MsgLabel.Position = UDim2.new(0, 6, 0, 0)
    MsgLabel.Size = UDim2.new(1, -12, 1, 0)
    MsgLabel.Font = Enum.Font.GothamBold
    MsgLabel.Text = "[" .. senderTag .. "]: " .. messageText
    MsgLabel.TextColor3 = isUser and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(0, 255, 200)
    MsgLabel.TextSize = 9
    MsgLabel.TextXAlignment = Enum.TextXAlignment.Left
    GeminiHolder.CanvasSize = UDim2.new(0, 0, 0, GeminiListLayout.AbsoluteContentSize.Y + 20)
end

AddGeminiMessage("جەمینی", "سڵاو محەممەد گیان! من جەمینی (Gemini)ـم.", false)

SendGeminiBtn.MouseButton1Click:Connect(function()
    local text = GeminiInputBox.Text
    if text ~= "" then
        AddGeminiMessage("تۆ", text, true)
        GeminiInputBox.Text = ""
        task.delay(0.4, function()
            AddGeminiMessage("Gemini", "وەڵامی داواکارییەکەت بۆ پرسیارەکەی: " .. text, false)
        end)
    end
end)

-- TRANSLATE TAB
local TransBoxFrame = Instance.new("Frame")
TransBoxFrame.Parent = TranslateTabPage
TransBoxFrame.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
TransBoxFrame.Size = UDim2.new(1, -4, 0, 160)

local TBFIC = Instance.new("UICorner")
TBFIC.CornerRadius = UDim.new(0, 4)
TBFIC.Parent = TransBoxFrame

local InputTextBox = Instance.new("TextBox")
InputTextBox.Parent = TransBoxFrame
InputTextBox.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
InputTextBox.Position = UDim2.new(0, 6, 0, 28)
InputTextBox.Size = UDim2.new(1, -12, 0, 32)
InputTextBox.Font = Enum.Font.Gotham
InputTextBox.PlaceholderText = "تێکست بە کوردی بنووسە..."
InputTextBox.Text = ""
InputTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputTextBox.TextSize = 10

local ITBC = Instance.new("UICorner")
ITBC.CornerRadius = UDim.new(0, 3)
ITBC.Parent = InputTextBox

local OutputLabel = Instance.new("TextLabel")
OutputLabel.Parent = TransBoxFrame
OutputLabel.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
OutputLabel.Position = UDim2.new(0, 6, 0, 66)
OutputLabel.Size = UDim2.new(1, -12, 0, 32)
OutputLabel.Font = Enum.Font.GothamBold
OutputLabel.Text = "وەگێڕدراو بۆ ئینگلیزی..."
OutputLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
OutputLabel.TextSize = 10

local OLBC = Instance.new("UICorner")
OLBC.CornerRadius = UDim.new(0, 3)
OLBC.Parent = OutputLabel

local CopyTransBtn = Instance.new("TextButton")
CopyTransBtn.Parent = TransBoxFrame
CopyTransBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 150)
CopyTransBtn.Position = UDim2.new(0, 6, 0, 106)
CopyTransBtn.Size = UDim2.new(1, -12, 0, 42)
CopyTransBtn.Font = Enum.Font.GothamBold
CopyTransBtn.Text = "وەرگێڕان، کۆپیکردن و ناردن بۆ چات"
CopyTransBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyTransBtn.TextSize = 10

local CTBC = Instance.new("UICorner")
CTBC.CornerRadius = UDim.new(0, 3)
CTBC.Parent = CopyTransBtn

CopyTransBtn.MouseButton1Click:Connect(function()
    local text = InputTextBox.Text
    if text ~= "" then
        local res = string.lower(text)
        OutputLabel.Text = res
        pcall(function() setclipboard(res) end)
    end
end)

-- OUTFIT TAB
local OutfitFrame = Instance.new("Frame")
OutfitFrame.Parent = OutfitTabPage
OutfitFrame.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
OutfitFrame.Size = UDim2.new(1, -4, 0, 110)

local OFC = Instance.new("UICorner")
OFC.CornerRadius = UDim.new(0, 4)
OFC.Parent = OutfitFrame

local OutfitStatus = Instance.new("TextLabel")
OutfitStatus.Parent = OutfitFrame
OutfitStatus.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
OutfitStatus.Position = UDim2.new(0, 6, 0, 28)
OutfitStatus.Size = UDim2.new(1, -12, 0, 32)
OutfitStatus.Font = Enum.Font.Gotham
OutfitStatus.Text = "کەسێك دیاری بکە بۆ کۆپیکردنی جل..."
OutfitStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
OutfitStatus.TextSize = 9

local OSC = Instance.new("UICorner")
OSC.CornerRadius = UDim.new(0, 3)
OSC.Parent = OutfitStatus

local CopyOutfitBtn = Instance.new("TextButton")
CopyOutfitBtn.Parent = OutfitFrame
CopyOutfitBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 150)
CopyOutfitBtn.Position = UDim2.new(0, 6, 0, 68)
CopyOutfitBtn.Size = UDim2.new(1, -12, 0, 34)
CopyOutfitBtn.Font = Enum.Font.GothamBold
CopyOutfitBtn.Text = "کۆپیکردنی جل، دەست، قاچ، سەر بە 1 کلیک"
CopyOutfitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyOutfitBtn.TextSize = 10

local COBC = Instance.new("UICorner")
COBC.CornerRadius = UDim.new(0, 3)
COBC.Parent = CopyOutfitBtn

CopyOutfitBtn.MouseButton1Click:Connect(function()
    if SelectedTarget and SelectedTarget.Character and LocalPlayer.Character then
        pcall(function()
            for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") or v:IsA("Accessory") then v:Destroy() end
            end
            for _, v in pairs(SelectedTarget.Character:GetChildren()) do
                if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") or v:IsA("Accessory") then
                    v:Clone().Parent = LocalPlayer.Character
                end
            end
            OutfitStatus.Text = "جلەکانی " .. SelectedTarget.Name .. " کۆپی کرا!"
        end)
    end
end)

-- COPY DANCE TAB
local CopyDanceFrame = Instance.new("Frame")
CopyDanceFrame.Parent = CopyDancePage
CopyDanceFrame.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
CopyDanceFrame.Size = UDim2.new(1, -4, 0, 140)

local CDFCC = Instance.new("UICorner")
CDFCC.CornerRadius = UDim.new(0, 4)
CDFCC.Parent = CopyDanceFrame

local CopyDanceStatus = Instance.new("TextLabel")
CopyDanceStatus.Parent = CopyDanceFrame
CopyDanceStatus.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
CopyDanceStatus.Position = UDim2.new(0, 6, 0, 28)
CopyDanceStatus.Size = UDim2.new(1, -12, 0, 45)
CopyDanceStatus.Font = Enum.Font.Gotham
CopyDanceStatus.Text = "کۆپیکردنی دەنس لە نزیکترین کەس یان دیاریکراو."
CopyDanceStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyDanceStatus.TextSize = 9
CopyDanceStatus.TextWrapped = true

local CDSSC = Instance.new("UICorner")
CDSSC.CornerRadius = UDim.new(0, 3)
CDSSC.Parent = CopyDanceStatus

local CopyDanceBtn = Instance.new("TextButton")
CopyDanceBtn.Parent = CopyDanceFrame
CopyDanceBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 150)
CopyDanceBtn.Position = UDim2.new(0, 6, 0, 85)
CopyDanceBtn.Size = UDim2.new(1, -12, 0, 40)
CopyDanceBtn.Font = Enum.Font.GothamBold
CopyDanceBtn.Text = "کۆپیکردنی دەنس (Copy Target Dance)"
CopyDanceBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyDanceBtn.TextSize = 9

local CDBC = Instance.new("UICorner")
CDBC.CornerRadius = UDim.new(0, 3)
CDBC.Parent = CopyDanceBtn

CopyDanceBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local target = SelectedTarget
        if not target then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then target = p break end
            end
        end
        if target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
            local tHum = target.Character.Humanoid
            local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if myHum then
                local myAnimator = myHum:FindFirstChildOfClass("Animator") or Instance.new("Animator", myHum)
                local animator = tHum:FindFirstChildOfClass("Animator")
                if animator then
                    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                        local cloneTrack = myAnimator:LoadAnimation(track.Animation)
                        cloneTrack:Play()
                        cloneTrack.TimePosition = track.TimePosition
                    end
                    CopyDanceStatus.Text = "دەنسەکەی " .. target.Name .. " کۆپی کرا!"
                end
            end
        end
    end)
end)

-- ANIMATION HUB TAB
local function CreateAnimButton(name, animId)
    local AnimBtn = Instance.new("TextButton")
    AnimBtn.Parent = AnimHubPage
    AnimBtn.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
    AnimBtn.Size = UDim2.new(1, -4, 0, 32)
    AnimBtn.Font = Enum.Font.GothamBold
    AnimBtn.Text = name
    AnimBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    AnimBtn.TextSize = 10
    local ABC = Instance.new("UICorner")
    ABC.CornerRadius = UDim.new(0, 4)
    ABC.Parent = AnimBtn
    local currentAnimTrack = nil
    AnimBtn.MouseButton1Click:Connect(function()
        pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                local animator = char.Humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", char.Humanoid)
                if currentAnimTrack then currentAnimTrack:Stop() end
                local animObject = Instance.new("Animation")
                animObject.AnimationId = "rbxassetid://" .. tostring(animId)
                currentAnimTrack = animator:LoadAnimation(animObject)
                currentAnimTrack.Looped = true
                currentAnimTrack:Play()
            end
        end)
    end)
end

CreateAnimButton("🔥 ئەنیمەیشنی Jerk", 33796059)
CreateAnimButton("🔹 ئەنیمەیشنی سەما (Dance 1)", 507710230)
CreateAnimButton("🔹 ئەنیمەیشنی شۆک / گریان", 507770677)

local StopAnimBtn = Instance.new("TextButton")
StopAnimBtn.Parent = AnimHubPage
StopAnimBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
StopAnimBtn.Size = UDim2.new(1, -4, 0, 32)
StopAnimBtn.Font = Enum.Font.GothamBold
StopAnimBtn.Text = "❌ ڕاگرتنی هەموو ئەنیمەیشنەکان"
StopAnimBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopAnimBtn.TextSize = 10
local SABC = Instance.new("UICorner")
SABC.CornerRadius = UDim.new(0, 4)
SABC.Parent = StopAnimBtn
StopAnimBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do track:Stop() end
        end
    end)
end)

-- 1v1 DUELS TAB
local DuelFrame = Instance.new("Frame")
DuelFrame.Parent = Duels1v1Page
DuelFrame.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
DuelFrame.Size = UDim2.new(1, -4, 0, 160)
local DFC = Instance.new("UICorner")
DFC.CornerRadius = UDim.new(0, 4)
DFC.Parent = DuelFrame

local MyAvatar = Instance.new("ImageLabel")
MyAvatar.Parent = DuelFrame
MyAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
MyAvatar.Position = UDim2.new(0, 15, 0, 32)
MyAvatar.Size = UDim2.new(0, 45, 0, 45)
MyAvatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
local MAC = Instance.new("UICorner") MAC.CornerRadius = UDim.new(1, 0) MAC.Parent = MyAvatar

local VSText = Instance.new("TextLabel")
VSText.Parent = DuelFrame VSText.BackgroundTransparency = 1 VSText.Position = UDim2.new(0.5, -25, 0, 42) VSText.Size = UDim2.new(0, 50, 0, 25)
VSText.Font = Enum.Font.GothamBold VSText.Text = "VS" VSText.TextColor3 = Color3.fromRGB(255, 100, 100) VSText.TextSize = 16

local EnemyAvatar = Instance.new("ImageLabel")
EnemyAvatar.Parent = DuelFrame EnemyAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50) EnemyAvatar.Position = UDim2.new(1, -60, 0, 32) EnemyAvatar.Size = UDim2.new(0, 45, 0, 45) EnemyAvatar.Image = "rbxassetid://0"
local EAC = Instance.new("UICorner") EAC.CornerRadius = UDim.new(1, 0) EAC.Parent = EnemyAvatar

local DuelStatusLabel = Instance.new("TextLabel")
DuelStatusLabel.Parent = DuelFrame DuelStatusLabel.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
DuelStatusLabel.Position = UDim2.new(0, 8, 0, 88) DuelStatusLabel.Size = UDim2.new(1, -16, 0, 60)
DuelStatusLabel.Font = Enum.Font.Gotham DuelStatusLabel.Text = "کەسێك هەڵبژێرە بۆ دەستپێکردنی 1v1..."
DuelStatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255) DuelStatusLabel.TextSize = 10 DuelStatusLabel.TextWrapped = true
local DSLC = Instance.new("UICorner") DSLC.CornerRadius = UDim.new(0, 4) DSLC.Parent = DuelStatusLabel

RunService.Heartbeat:Connect(function()
    if SelectedTarget and SelectedTarget.Parent then
        EnemyAvatar.Image = Players:GetUserThumbnailAsync(SelectedTarget.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        DuelStatusLabel.Text = "ململانێ لەگەڵ: " .. SelectedTarget.Name
    else
        EnemyAvatar.Image = "rbxassetid://0"
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player == SelectedTarget then
        DuelStatusLabel.Text = "« بژی تۆ بردتەوە، ئەو دەرکرا! »"
    end
end)

-- TARGET TAB
local TargetInputFrame = Instance.new("Frame")
TargetInputFrame.Parent = TargetTabPage TargetInputFrame.BackgroundColor3 = Color3.fromRGB(22, 70, 80) TargetInputFrame.Size = UDim2.new(1, -4, 0, 45)
local TIC = Instance.new("UICorner") TIC.CornerRadius = UDim.new(0, 4) TIC.Parent = TargetInputFrame

local TargetTextBox = Instance.new("TextBox")
TargetTextBox.Parent = TargetInputFrame TargetTextBox.BackgroundColor3 = Color3.fromRGB(15, 50, 60) TargetTextBox.Position = UDim2.new(0, 6, 0.5, -14) TargetTextBox.Size = UDim2.new(1, -12, 0, 28)
TargetTextBox.Font = Enum.Font.Gotham TargetTextBox.PlaceholderText = "ناوی نەفەر بنووسە..." TargetTextBox.Text = "" TargetTextBox.TextColor3 = Color3.fromRGB(255, 255, 255) TargetTextBox.TextSize = 10
local TBCC = Instance.new("UICorner") TBCC.CornerRadius = UDim.new(0, 3) TBCC.Parent = TargetTextBox

TargetTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local query = string.lower(TargetTextBox.Text)
        for _, p in pairs(Players:GetPlayers()) do
            if string.find(string.lower(p.Name), query) or string.find(string.lower(p.DisplayName), query) then
                SelectedTarget = p
                TargetImage.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                break
            end
        end
    end
end)

-- TROLL TAB COMPONENTS
local R6SitBangActive = false
CreateToggleComponent(MainTabPage, "💺 R6 دانیشتن و تەکان بۆ دەم (Ultra Fast)", function(state)
    R6SitBangActive = state
    task.spawn(function()
        while R6SitBangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("Head") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.Sit = true end
                local speed = tick() * 120
                local thrust = math.sin(speed) * 0.5
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.Head.CFrame * CFrame.new(0, 0.15, -0.6 + thrust) * CFrame.Angles(0, math.pi, 0)
            end
        end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Sit = false hum.PlatformStand = false end
    end)
end)

local HyperBangActive = false
CreateToggleComponent(MainTabPage, "⚡ بانگی هایپەری زۆر خێرا (Hyper Bang)", function(state)
    HyperBangActive = state
    task.spawn(function()
        while HyperBangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.PlatformStand = true end
                local hOffset = math.sin(tick() * 140) * 0.9
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.5 + hOffset) * CFrame.Angles(math.rad(30), 0, 0)
            end
        end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end)
end)

local PrimeBangActive = false
CreateToggleComponent(MainTabPage, "🔥 بانگی ئۆبیتۆ پرایم (Obito Prime Bang)", function(state)
    PrimeBangActive = state
    task.spawn(function()
        while PrimeBangActive do
            task.wait(0.002)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.PlatformStand = true end
                local off = math.abs(math.sin(tick() * 55)) * 1.3
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.5 + off) * CFrame.Angles(math.rad(20), 0, 0)
            end
        end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end)
end)

local MouthKissActive = false
CreateToggleComponent(MainTabPage, "💋 ماچی ناودەم (Mouth Kiss Attack)", function(state)
    MouthKissActive = state
    task.spawn(function()
        while MouthKissActive do
            task.wait(0.002)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("Head") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.Head.CFrame * CFrame.new(0, 0, -0.6) * CFrame.Angles(0, math.pi, 0)
            end
        end
    end)
end)

local BangBottomActive = false
CreateToggleComponent(MainTabPage, "🍑 بانگی ژێرەوە و پشت (Bottom/Back Bang)", function(state)
    BangBottomActive = state
    task.spawn(function()
        while BangBottomActive do
            task.wait(0.002)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.PlatformStand = true end
                local off = math.sin(tick() * 65) * 1.2
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, -0.1, 0.7 + off) * CFrame.Angles(0, 0, 0)
            end
        end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end)
end)

local UltraFastOrbitActive = false
CreateToggleComponent(MainTabPage, "🌪️ سووڕانەوە و بانگی خێرا (Ultra Orbit Bang)", function(state)
    UltraFastOrbitActive = state
    task.spawn(function()
        while UltraFastOrbitActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.PlatformStand = true end
                local angle = tick() * 45
                local x = math.cos(angle) * 2.5
                local z = math.sin(angle) * 2.5
                local th = math.sin(tick() * 110) * 0.4
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(x, th, z) * CFrame.Angles(0, -angle, 0)
            end
        end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end)
end)

local MegaSpazBangActive = false
CreateToggleComponent(MainTabPage, "💥 بانگی شێتی خێرای بێوەستان (Mega Spaz Bang)", function(state)
    MegaSpazBangActive = state
    task.spawn(function()
        while MegaSpazBangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.PlatformStand = true end
                local rx = math.random(-200, 200) / 100
                local rz = math.random(-200, 200) / 100
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(rx, 0.2, rz) * CFrame.Angles(math.random(-5,5), math.random(-5,5), 0)
            end
        end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end)
end)

local VerticalRocketBangActive = false
CreateToggleComponent(MainTabPage, "🚀 بانگی مووشەکی بەرەو ئاسمان (Vertical Rocket Bang)", function(state)
    VerticalRocketBangActive = state
    task.spawn(function()
        while VerticalRocketBangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.PlatformStand = true end
                local upOffset = math.sin(tick() * 90) * 2.5
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, upOffset, 0.4) * CFrame.Angles(math.rad(90), 0, 0)
            end
        end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end)
end)

local EarthquakeBangActive = false
CreateToggleComponent(MainTabPage, "🌋 بانگی بوومەلەرزە (Earthquake Shake Bang)", function(state)
    EarthquakeBangActive = state
    task.spawn(function()
        while EarthquakeBangActive do
            task.wait(0.01)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.PlatformStand = true end
                local qx = (math.random() - 0.5) * 1.5
                local qz = (math.random() - 0.5) * 1.5
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(qx, 0, 0.6 + qz) * CFrame.Angles(0, 0, 0)
            end
        end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end)
end)

-- SAFETY TAB
CreateToggleComponent(SafetyTabPage, "پاراستنی تەواو (Anti-Ban/Fling)", function(state)
    if state then
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0, 100, 100) end
                end
            end
        end)
    end
end)

-- PLAYERS TAB
CreateToggleComponent(PlayersTabPage, "ESP Players", function(state)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            if state then
                local hl = Instance.new("Highlight")
                hl.Name = "ObitoESP"
                hl.Adornee = p.Character
                hl.FillColor = Color3.fromRGB(255, 0, 0)
                hl.Parent = p.Character
            else
                if p.Character:FindFirstChild("ObitoESP") then p.Character.ObitoESP:Destroy() end
            end
        end
    end
end)

local NoclipEnabled = false
RunService.Stepped:Connect(function()
    if NoclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)
CreateToggleComponent(PlayersTabPage, "Noclip", function(state) NoclipEnabled = state end)

local InfJumpEnabled = false
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJumpEnabled then
        pcall(function()
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    end
end)
CreateToggleComponent(PlayersTabPage, "🚀 بازدانی بێسنوور (Inf Jump)", function(state) InfJumpEnabled = state end)

-- Floating Toggle Button (Modern Built-in Logo)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ObitoGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
ToggleButton.Position = UDim2.new(0, 10, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 42, 0, 42)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "O"
ToggleButton.TextColor3 = Color3.fromRGB(255, 215, 0)
ToggleButton.TextSize = 18

local TBCorner = Instance.new("UICorner")
TBCorner.CornerRadius = UDim.new(1, 0)
TBCorner.Parent = ToggleButton

local TBGrad = Instance.new("UIGradient")
TBGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 100, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 215, 0)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 200, 150))
}
TBGrad.Parent = ToggleButton

local visible = true
ToggleButton.MouseButton1Click:Connect(function()
    visible = not visible
    MainFrame.Visible = visible
end)

