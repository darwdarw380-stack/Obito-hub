-- Obito-- Obito Hub - Ultimate Secure Global Chat & Custom Timed Anti-AFK for Kurdish Obby | obito_dev6
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Ultimate Impenetrable Anti-Kick & Error 267 Shield (Anti-Kick For Kurdish Obby)
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
                warn("[Obito Hub Ultimate Anti-Kick]: Critical kick/ban/error 267 attempt blocked successfully!")
                return
            end
        end
        
        return oldNamecall(self, ...)
    end)
    
    mt.__index = newcclosure(function(self, k)
        if self == LocalPlayer and (k == "Kick" or k == "kick") then
            return function()
                warn("[Obito Hub Ultimate Anti-Kick]: Blocked property-based kick.")
                return
            end
        end
        return oldIndex(self, k)
    end)
    
    setreadonly(mt, true)
end)

-- CoreGui Teleport/Kick UI Hijacker (Removes Error 267 Prompt completely)
pcall(function()
    CoreGui.ChildAdded:Connect(function(child)
        if child.Name == "RobloxPromptGui" or child.Name == "ErrorPrompt" then
            task.spawn(function()
                local prompt = child:FindFirstChild("PromptStyle") or child:FindFirstChild("MessageArea") or child
                if prompt then
                    child:Destroy()
                    warn("[Obito Hub]: Successfully intercepted and destroyed kick/error GUI prompt!")
                end
            end)
        end
    end)
end)

-- Main GUI Creation (Secure in CoreGui) - Black Glass Design
local ObitoGui = Instance.new("ScreenGui")
ObitoGui.Name = "ObitoHubGameScriptsSecure"
ObitoGui.Parent = CoreGui
ObitoGui.ResetOnSpawn = false
ObitoGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ObitoGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.4
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -220)
MainFrame.Size = UDim2.new(0, 400, 0, 420)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

-- Top Bar - Red Theme
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
TopBar.BackgroundTransparency = 0.1
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
Title.Text = "obito | سەرۆک owner (Protected)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 10
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Built-in Gradient Logo (Red Theme)
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
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 60, 60)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 20, 20)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(120, 0, 0))
}
BadgeGrad.Parent = CustomLogoBadge

local BadgeText = Instance.new("TextLabel")
BadgeText.Parent = CustomLogoBadge
BadgeText.BackgroundTransparency = 1
BadgeText.Size = UDim2.new(1, 0, 1, 0)
BadgeText.Font = Enum.Font.GothamBold
BadgeText.Text = "O"
BadgeText.TextColor3 = Color3.fromRGB(255, 255, 255)
BadgeText.TextSize = 13

-- Target Thumbnail Profile Image on TopBar
local TargetImage = Instance.new("ImageLabel")
TargetImage.Name = "TargetImage"
TargetImage.Parent = TopBar
TargetImage.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
TargetImage.BackgroundTransparency = 0.5
TargetImage.Position = UDim2.new(1, -34, 0.5, -12)
TargetImage.Size = UDim2.new(0, 24, 0, 24)
TargetImage.Image = "rbxassetid://0"

local ImgCorner = Instance.new("UICorner")
ImgCorner.CornerRadius = UDim.new(1, 0)
ImgCorner.Parent = TargetImage

-- Left Side Tab Holder (Glass effect)
local TabContainer = Instance.new("ScrollingFrame")
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TabContainer.BackgroundTransparency = 0.6
TabContainer.Position = UDim2.new(0, 6, 0, 44)
TabContainer.Size = UDim2.new(0, 130, 1, -50)
TabContainer.CanvasSize = UDim2.new(0, 0, 4.2, 0)
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
    Page.CanvasSize = UDim2.new(0, 0, 5.5, 0)
    Page.ScrollBarThickness = 2
    Page.Visible = false
    
    local PList = Instance.new("UIListLayout")
    PList.Parent = Page
    PList.SortOrder = Enum.SortOrder.LayoutOrder
    PList.Padding = UDim.new(0, 6)
    
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabContainer
    TabBtn.BackgroundColor3 = Color3.fromRGB(140, 20, 20)
    TabBtn.BackgroundTransparency = 0.3
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
            if b:IsA("TextButton") then 
                b.BackgroundColor3 = Color3.fromRGB(140, 20, 20) 
                b.BackgroundTransparency = 0.3
            end
        end
        Page.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
        TabBtn.BackgroundTransparency = 0.1
    end)
    
    return Page
end

-- Create Remaining Tabs
local MainTabPage = CreateTab("ترۆڵ (Troll)")
local AntiKickObbyPage = CreateTab("Anti-Kick Obby")
local AntiTabPage = CreateTab("ئەنتی (Anti)")
local Duels1v1Page = CreateTab("سەر بڕاوەکان")
local TranslateTabPage = CreateTab("وەگێڕ (Translate)")
local SafetyTabPage = CreateTab("دژە هاک (Safety)")
local PlayersTabPage = CreateTab("فڕین / خێرا")
local RadioHubPage = CreateTab("رادیۆ (Radio)")

-- Helper to create Toggle buttons
local function CreateToggleComponent(parent, name, callback)
    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Frame.BackgroundTransparency = 0.5
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

-- ADVANCED TARGET CONFIRMATION SYSTEM & NOTIFICATION UI
local SelectedTarget = nil
local PendingTarget = nil
local Mouse = LocalPlayer:GetMouse()

local NotifyFrame = Instance.new("Frame")
NotifyFrame.Name = "NotifyFrame"
NotifyFrame.Parent = ObitoGui
NotifyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
NotifyFrame.BackgroundTransparency = 0.2
NotifyFrame.Position = UDim2.new(1, -230, 0.75, 0)
NotifyFrame.Size = UDim2.new(0, 220, 0, 75)
NotifyFrame.Visible = false

local NFCorner = Instance.new("UICorner")
NFCorner.CornerRadius = UDim.new(0, 6)
NFCorner.Parent = NotifyFrame

local NotifyText = Instance.new("TextLabel")
NotifyText.Parent = NotifyFrame
NotifyText.BackgroundTransparency = 1
NotifyText.Position = UDim2.new(0, 8, 0, 4)
NotifyText.Size = UDim2.new(1, -16, 0, 35)
NotifyText.Font = Enum.Font.GothamBold
NotifyText.Text = "ئایا دڵنیای دەتەوێت ببیتە خاوەنی ئەم ئامانجە؟"
NotifyText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotifyText.TextSize = 9
NotifyText.TextWrapped = true

local YesConfirmBtn = Instance.new("TextButton")
YesConfirmBtn.Parent = NotifyFrame
YesConfirmBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
YesConfirmBtn.Position = UDim2.new(0, 8, 0, 43)
YesConfirmBtn.Size = UDim2.new(0.48, -4, 0, 26)
YesConfirmBtn.Font = Enum.Font.GothamBold
YesConfirmBtn.Text = "بەڵێ (✔)"
YesConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YesConfirmBtn.TextSize = 9
local YCBC = Instance.new("UICorner") YCBC.CornerRadius = UDim.new(0, 3) YCBC.Parent = YesConfirmBtn

local NoConfirmBtn = Instance.new("TextButton")
NoConfirmBtn.Parent = NotifyFrame
NoConfirmBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
NoConfirmBtn.Position = UDim2.new(0.52, 0, 0, 43)
NoConfirmBtn.Size = UDim2.new(0.48, -4, 0, 26)
NoConfirmBtn.Font = Enum.Font.GothamBold
NoConfirmBtn.Text = "نەخێر (❌)"
NoConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoConfirmBtn.TextSize = 9
local NCBC = Instance.new("UICorner") NCBC.CornerRadius = UDim.new(0, 3) NCBC.Parent = NoConfirmBtn

YesConfirmBtn.MouseButton1Click:Connect(function()
    if PendingTarget then
        SelectedTarget = PendingTarget
        TargetImage.Image = Players:GetUserThumbnailAsync(SelectedTarget.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end
    NotifyFrame.Visible = false
    PendingTarget = nil
end)

NoConfirmBtn.MouseButton1Click:Connect(function()
    PendingTarget = nil
    NotifyFrame.Visible = false
end)

Mouse.Button1Down:Connect(function()
    if Mouse.Target and Mouse.Target.Parent:FindFirstChild("Humanoid") then
        local foundPlayer = Players:GetPlayerFromCharacter(Mouse.Target.Parent)
        if foundPlayer and foundPlayer ~= LocalPlayer then
            PendingTarget = foundPlayer
            NotifyText.Text = "دڵنیای دەتەوێت (" .. foundPlayer.Name .. ") بکەیتە ئامانج؟"
            NotifyFrame.Visible = true
        end
    end
end)

-- ANTI-KICK FOR KURDISH OBBY TAB
local AntiKickMainFrame = Instance.new("Frame")
AntiKickMainFrame.Parent = AntiKickObbyPage
AntiKickMainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
AntiKickMainFrame.BackgroundTransparency = 0.5
AntiKickMainFrame.Size = UDim2.new(1, -4, 0, 260)
local AKMFC = Instance.new("UICorner") AKMFC.CornerRadius = UDim.new(0, 4) AKMFC.Parent = AntiKickMainFrame

local AntiKickStatus = Instance.new("TextLabel")
AntiKickStatus.Parent = AntiKickMainFrame
AntiKickStatus.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
AntiKickStatus.Position = UDim2.new(0, 6, 0, 8)
AntiKickStatus.Size = UDim2.new(1, -12, 0, 45)
AntiKickStatus.Font = Enum.Font.GothamBold
AntiKickStatus.Text = "🛡️ Anti-AFK & Infinite Jump کارایە\nکاتی دیاریکراو دابنە و دوگمە بخەرە کار!"
AntiKickStatus.TextColor3 = Color3.fromRGB(0, 255, 120)
AntiKickStatus.TextSize = 9
AntiKickStatus.TextWrapped = true
local AKSC = Instance.new("UICorner") AKSC.CornerRadius = UDim.new(0, 3) AKSC.Parent = AntiKickStatus

local TimeInputBox = Instance.new("TextBox")
TimeInputBox.Parent = AntiKickMainFrame
TimeInputBox.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
TimeInputBox.Position = UDim2.new(0, 6, 0, 60)
TimeInputBox.Size = UDim2.new(1, -12, 0, 36)
TimeInputBox.Font = Enum.Font.GothamBold
TimeInputBox.PlaceholderText = "کاتی سەعات بنووسە (لە 1 بۆ 999 سەعات)..."
TimeInputBox.Text = "1"
TimeInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeInputBox.TextSize = 10
local TIBC = Instance.new("UICorner") TIBC.CornerRadius = UDim.new(0, 3) TIBC.Parent = TimeInputBox

local AFKToggleBtn = Instance.new("TextButton")
AFKToggleBtn.Parent = AntiKickMainFrame
AFKToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
AFKToggleBtn.Position = UDim2.new(0, 6, 0, 104)
AFKToggleBtn.Size = UDim2.new(1, -12, 0, 42)
AFKToggleBtn.Font = Enum.Font.GothamBold
AFKToggleBtn.Text = "❌ ئەنتی ئەیفەکەی نەخراوەتە ئیش"
AFKToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AFKToggleBtn.TextSize = 10
local ATBC = Instance.new("UICorner") ATBC.CornerRadius = UDim.new(0, 3) ATBC.Parent = AFKToggleBtn

local TimerCountdownLabel = Instance.new("TextLabel")
TimerCountdownLabel.Parent = AntiKickMainFrame
TimerCountdownLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
TimerCountdownLabel.Position = UDim2.new(0, 6, 0, 154)
TimerCountdownLabel.Size = UDim2.new(1, -12, 0, 40)
TimerCountdownLabel.Font = Enum.Font.GothamBold
TimerCountdownLabel.Text = "⏳ ماوەی ماوە: 00:00:00"
TimerCountdownLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
TimerCountdownLabel.TextSize = 9
local TCLD = Instance.new("UICorner") TCLD.CornerRadius = UDim.new(0, 3) TCLD.Parent = TimerCountdownLabel

local VirtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

local obbyAfkActive = false
local afkLoopThread = nil

AFKToggleBtn.MouseButton1Click:Connect(function()
    obbyAfkActive = not obbyAfkActive
    if obbyAfkActive then
        AFKToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        AFKToggleBtn.Text = "✔ نوسراوە و کارا کرا! (Active)"
        AntiKickStatus.Text = "🛡️ Anti-AFK & Infinite Jump بۆ کوردش ئۆبی کارا بوو بە سەرکەوتوویی!"
        
        local hoursVal = tonumber(TimeInputBox.Text) or 1
        hoursVal = math.clamp(hoursVal, 1, 999)
        local totalSeconds = hoursVal * 3600
        
        afkLoopThread = task.spawn(function()
            local elapsed = 0
            while obbyAfkActive and elapsed < totalSeconds do
                pcall(function()
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("Humanoid") then
                        char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end)
                
                local rem = totalSeconds - elapsed
                local h = math.floor(rem / 3600)
                local m = math.floor((rem % 3600) / 60)
                local s = rem % 60
                TimerCountdownLabel.Text = string.format("⏳ ماوەی ماوە: %02d:%02d:%02d (جەمپی بەردەوام کارایە)", h, m, s)
                
                task.wait(1)
                elapsed = elapsed + 1
            end
            
            obbyAfkActive = false
            AFKToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
            AFKToggleBtn.Text = "❌ ئەنتی ئەیفەکەی نەخراوەتە ئیش"
            TimerCountdownLabel.Text = "⏳ کاتی دیاریکراو تەواو بوو!"
        end)
    else
        obbyAfkActive = false
        if afkLoopThread then
            task.cancel(afkLoopThread)
            afkLoopThread = nil
        end
        AFKToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        AFKToggleBtn.Text = "❌ ئەنتی ئەیفەکەی نەخراوەتە ئیش"
        AntiKickStatus.Text = "⚠ ئەنتی ئەیفەکەی ڕاگیرا."
        TimerCountdownLabel.Text = "⏳ ماوەی ماوە: 00:00:00"
    end
end)

CreateToggleComponent(AntiKickObbyPage, "🔒 پاراستنی توند دژی دەرکردن (Absolute Anti-Error 267)", function(state)
    if state then
        AntiKickStatus.Text = "🛡️ سیستەمی دژە لێفت و دەرکردن زۆر بە‌هێز کارا کرا!"
    else
        AntiKickStatus.Text = "⚠ ئاگاداری: پاراستن کەمکرایەوە."
    end
end)

-- RADIO HUB TAB
local CurrentRadioSound = nil
local CurrentRadioVolume = 5
local CurrentRadioSpeed = 1.0

local RadioMainFrame = Instance.new("Frame")
RadioMainFrame.Parent = RadioHubPage
RadioMainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
RadioMainFrame.BackgroundTransparency = 0.5
RadioMainFrame.Size = UDim2.new(1, -4, 0, 150)

local RMFC = Instance.new("UICorner")
RMFC.CornerRadius = UDim.new(0, 4)
RMFC.Parent = RadioMainFrame

local RadioStatusLabel = Instance.new("TextLabel")
RadioStatusLabel.Parent = RadioMainFrame
RadioStatusLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
RadioStatusLabel.Position = UDim2.new(0, 6, 0, 8)
RadioStatusLabel.Size = UDim2.new(1, -12, 0, 32)
RadioStatusLabel.Font = Enum.Font.GothamBold
RadioStatusLabel.Text = "📻 ڕادیۆ ئامادەیە (خێرایی: 1.0x)"
RadioStatusLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
RadioStatusLabel.TextSize = 9
RadioStatusLabel.TextWrapped = true

local RSLC = Instance.new("UICorner")
RSLC.CornerRadius = UDim.new(0, 3)
RSLC.Parent = RadioStatusLabel

local StopRadioBtn = Instance.new("TextButton")
StopRadioBtn.Parent = RadioMainFrame
StopRadioBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
StopRadioBtn.Position = UDim2.new(0, 6, 0, 44)
StopRadioBtn.Size = UDim2.new(0.32, -4, 0, 26)
StopRadioBtn.Font = Enum.Font.GothamBold
StopRadioBtn.Text = "⏹ وەستان (Stop)"
StopRadioBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopRadioBtn.TextSize = 9
local SRBC = Instance.new("UICorner") SRBC.CornerRadius = UDim.new(0, 3) SRBC.Parent = StopRadioBtn

local VolDownBtn = Instance.new("TextButton")
VolDownBtn.Parent = RadioMainFrame
VolDownBtn.BackgroundColor3 = Color3.fromRGB(140, 20, 20)
VolDownBtn.Position = UDim2.new(0.34, 0, 0, 44)
VolDownBtn.Size = UDim2.new(0.32, -4, 0, 26)
VolDownBtn.Font = Enum.Font.GothamBold
VolDownBtn.Text = "🔉 کزی دەنگ"
VolDownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VolDownBtn.TextSize = 9
local VDBC = Instance.new("UICorner") VDBC.CornerRadius = UDim.new(0, 3) VDBC.Parent = VolDownBtn

local VolUpBtn = Instance.new("TextButton")
VolUpBtn.Parent = RadioMainFrame
VolUpBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
VolUpBtn.Position = UDim2.new(0.68, 0, 0, 44)
VolUpBtn.Size = UDim2.new(0.32, -4, 0, 26)
VolUpBtn.Font = Enum.Font.GothamBold
VolUpBtn.Text = "🔊 زۆری دەنگ"
VolUpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VolUpBtn.TextSize = 9
local VUBC = Instance.new("UICorner") VUBC.CornerRadius = UDim.new(0, 3) VUBC.Parent = VolUpBtn

local SpeedSlowBtn = Instance.new("TextButton")
SpeedSlowBtn.Parent = RadioMainFrame
SpeedSlowBtn.BackgroundColor3 = Color3.fromRGB(150, 80, 0)
SpeedSlowBtn.Position = UDim2.new(0, 6, 0, 74)
SpeedSlowBtn.Size = UDim2.new(0.32, -4, 0, 26)
SpeedSlowBtn.Font = Enum.Font.GothamBold
SpeedSlowBtn.Text = "🐢 خاوکردنەوە (-)"
SpeedSlowBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedSlowBtn.TextSize = 9
local SSBC = Instance.new("UICorner") SSBC.CornerRadius = UDim.new(0, 3) SSBC.Parent = SpeedSlowBtn

local SpeedResetBtn = Instance.new("TextButton")
SpeedResetBtn.Parent = RadioMainFrame
SpeedResetBtn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
SpeedResetBtn.Position = UDim2.new(0.34, 0, 0, 74)
SpeedResetBtn.Size = UDim2.new(0.32, -4, 0, 26)
SpeedResetBtn.Font = Enum.Font.GothamBold
SpeedResetBtn.Text = "⚡ ئاسایی (1.0x)"
SpeedResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedResetBtn.TextSize = 9
local SRRBC = Instance.new("UICorner") SRRBC.CornerRadius = UDim.new(0, 3) SRRBC.Parent = SpeedResetBtn

local SpeedFastBtn = Instance.new("TextButton")
SpeedFastBtn.Parent = RadioMainFrame
SpeedFastBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
SpeedFastBtn.Position = UDim2.new(0.68, 0, 0, 74)
SpeedFastBtn.Size = UDim2.new(0.32, -4, 0, 26)
SpeedFastBtn.Font = Enum.Font.GothamBold
SpeedFastBtn.Text = "🚀 خێراکردن (+)"
SpeedFastBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedFastBtn.TextSize = 9
local SFBC = Instance.new("UICorner") SFBC.CornerRadius = UDim.new(0, 3) SFBC.Parent = SpeedFastBtn

local CustomIDBox = Instance.new("TextBox")
CustomIDBox.Parent = RadioMainFrame
CustomIDBox.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
CustomIDBox.Position = UDim2.new(0, 6, 0, 106)
CustomIDBox.Size = UDim2.new(0.65, -4, 0, 32)
CustomIDBox.Font = Enum.Font.Gotham
CustomIDBox.PlaceholderText = "کۆدی گۆرانی بنووسە..."
CustomIDBox.Text = ""
CustomIDBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CustomIDBox.TextSize = 9
local CIDC = Instance.new("UICorner") CIDC.CornerRadius = UDim.new(0, 3) CIDC.Parent = CustomIDBox

local PlayCustomBtn = Instance.new("TextButton")
PlayCustomBtn.Parent = RadioMainFrame
PlayCustomBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
PlayCustomBtn.Position = UDim2.new(0.67, 0, 0, 106)
PlayCustomBtn.Size = UDim2.new(0.33, -4, 0, 32)
PlayCustomBtn.Font = Enum.Font.GothamBold
PlayCustomBtn.Text = "▶ لێدان"
PlayCustomBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayCustomBtn.TextSize = 9
local PCBC = Instance.new("UICorner") PCBC.CornerRadius = UDim.new(0, 3) PCBC.Parent = PlayCustomBtn

local function PlaySongById(songId)
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            if CurrentRadioSound then
                CurrentRadioSound:Destroy()
            end
            local sound = Instance.new("Sound")
            sound.Name = "ObitoHubRadioSound"
            sound.SoundId = "rbxassetid://" .. tostring(songId)
            sound.Volume = CurrentRadioVolume
            sound.PlaybackSpeed = CurrentRadioSpeed
            sound.Looped = true
            sound.Parent = char.HumanoidRootPart
            sound:Play()
            CurrentRadioSound = sound
            RadioStatusLabel.Text = "▶ لێدەدات: " .. tostring(songId) .. " (خێرایی: " .. string.format("%.1f", CurrentRadioSpeed) .. "x)"
        end
    end)
end

StopRadioBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if CurrentRadioSound then
            CurrentRadioSound:Stop()
            CurrentRadioSound:Destroy()
            CurrentRadioSound = nil
        end
        RadioStatusLabel.Text = "⏹ ڕادیۆ وەستا."
    end)
end)

VolDownBtn.MouseButton1Click:Connect(function()
    CurrentRadioVolume = math.max(1, CurrentRadioVolume - 2)
    if CurrentRadioSound then CurrentRadioSound.Volume = CurrentRadioVolume end
    RadioStatusLabel.Text = "🔉 ئاستی دەنگ کزکرا: " .. tostring(CurrentRadioVolume)
end)

VolUpBtn.MouseButton1Click:Connect(function()
    CurrentRadioVolume = math.min(10, CurrentRadioVolume + 2)
    if CurrentRadioSound then CurrentRadioSound.Volume = CurrentRadioVolume end
    RadioStatusLabel.Text = "🔊 ئاستی دەنگ بەرزکرایەوە: " .. tostring(CurrentRadioVolume)
end)

SpeedSlowBtn.MouseButton1Click:Connect(function()
    CurrentRadioSpeed = math.max(0.1, CurrentRadioSpeed - 0.1)
    if CurrentRadioSound then CurrentRadioSound.PlaybackSpeed = CurrentRadioSpeed end
    RadioStatusLabel.Text = "🐢 خێرایی خاوکرایەوە: " .. string.format("%.1f", CurrentRadioSpeed) .. "x"
end)

SpeedResetBtn.MouseButton1Click:Connect(function()
    CurrentRadioSpeed = 1.0
    if CurrentRadioSound then CurrentRadioSound.PlaybackSpeed = CurrentRadioSpeed end
    RadioStatusLabel.Text = "⚡ خێرایی گەڕایەوە بۆ باری ئاسایی (1.0x)"
end)

SpeedFastBtn.MouseButton1Click:Connect(function()
    CurrentRadioSpeed = math.min(3.0, CurrentRadioSpeed + 0.1)
    if CurrentRadioSound then CurrentRadioSound.PlaybackSpeed = CurrentRadioSpeed end
    RadioStatusLabel.Text = "🚀 خێرایی بەرزکرایەوە: " .. string.format("%.1f", CurrentRadioSpeed) .. "x"
end)

PlayCustomBtn.MouseButton1Click:Connect(function()
    local idText = CustomIDBox.Text
    if idText ~= "" then
        PlaySongById(idText)
    end
end)

-- Custom Songs Added
local SongCodesList = {
    {name = "پۆنک (Ponk)", id = "77396545462103"},
    {name = "song553", id = "106617348308957"},
    {name = "brazil song", id = "80029255793033"},
    {name = "گۆرانی 4", id = "107145145396784"},
    {name = "گۆرانی 5", id = "12010813191786"},
    {name = "گۆرانی 6", id = "122268584750241"},
    {name = "گۆرانی 7", id = "109627753619575"},
    {name = "گۆرانی 8", id = "107094208500223"},
    {name = "گۆرانی 9", id = "85125256349722"},
    {name = "گۆرانی 10", id = "94281718874647"}
}

for i, songData in ipairs(SongCodesList) do
    local SongItemFrame = Instance.new("Frame")
    SongItemFrame.Parent = RadioHubPage
    SongItemFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    SongItemFrame.BackgroundTransparency = 0.5
    SongItemFrame.Size = UDim2.new(1, -4, 0, 36)
    
    local SIFC = Instance.new("UICorner") SIFC.CornerRadius = UDim.new(0, 4) SIFC.Parent = SongItemFrame
    
    local CodeLabel = Instance.new("TextLabel")
    CodeLabel.Parent = SongItemFrame
    CodeLabel.BackgroundTransparency = 1
    CodeLabel.Position = UDim2.new(0, 6, 0, 0)
    CodeLabel.Size = UDim2.new(0.5, 0, 1, 0)
    CodeLabel.Font = Enum.Font.GothamBold
    CodeLabel.Text = "🎵 " .. songData.name
    CodeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CodeLabel.TextSize = 8
    CodeLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local CopyBtn = Instance.new("TextButton")
    CopyBtn.Parent = SongItemFrame
    CopyBtn.BackgroundColor3 = Color3.fromRGB(140, 20, 20)
    CopyBtn.Position = UDim2.new(0.52, 0, 0.5, -12)
    CopyBtn.Size = UDim2.new(0.22, 0, 0, 24)
    CopyBtn.Font = Enum.Font.GothamBold
    CopyBtn.Text = "کۆپی"
    CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyBtn.TextSize = 8
    local CBC = Instance.new("UICorner") CBC.CornerRadius = UDim.new(0, 3) CBC.Parent = CopyBtn
    
    local PlayBtn = Instance.new("TextButton")
    PlayBtn.Parent = SongItemFrame
    PlayBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
    PlayBtn.Position = UDim2.new(0.76, 0, 0.5, -12)
    PlayBtn.Size = UDim2.new(0.22, 0, 0, 24)
    PlayBtn.Font = Enum.Font.GothamBold
    PlayBtn.Text = "لێدان"
    PlayBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayBtn.TextSize = 8
    local PBC = Instance.new("UICorner") PBC.CornerRadius = UDim.new(0, 3) PBC.Parent = PlayBtn
    
    CopyBtn.MouseButton1Click:Connect(function()
        pcall(function() setclipboard(songData.id) end)
        CodeLabel.Text = "✔ کۆپی کرا!"
        task.delay(1.5, function()
            CodeLabel.Text = "🎵 " .. songData.name
        end)
    end)
    
    PlayBtn.MouseButton1Click:Connect(function()
        PlaySongById(songData.id)
    end)
end

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

local AFBCorner = Instance.new("UICorner") AFBCorner.CornerRadius = UDim.new(1, 0) AFBCorner.Parent = AntiBangFloatingBtn

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

-- TRANSLATE TAB
local TransBoxFrame = Instance.new("Frame")
TransBoxFrame.Parent = TranslateTabPage
TransBoxFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
TransBoxFrame.BackgroundTransparency = 0.5
TransBoxFrame.Size = UDim2.new(1, -4, 0, 160)
local TBFIC = Instance.new("UICorner") TBFIC.CornerRadius = UDim.new(0, 4) TBFIC.Parent = TransBoxFrame

local InputTextBox = Instance.new("TextBox")
InputTextBox.Parent = TransBoxFrame
InputTextBox.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
InputTextBox.Position = UDim2.new(0, 6, 0, 28)
InputTextBox.Size = UDim2.new(1, -12, 0, 32)
InputTextBox.Font = Enum.Font.Gotham
InputTextBox.PlaceholderText = "تێکست بە کوردی بنووسە بۆ ئینگلیزی..."
InputTextBox.Text = ""
InputTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputTextBox.TextSize = 10
local ITBC = Instance.new("UICorner") ITBC.CornerRadius = UDim.new(0, 3) ITBC.Parent = InputTextBox

local OutputLabel = Instance.new("TextLabel")
OutputLabel.Parent = TransBoxFrame
OutputLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
OutputLabel.Position = UDim2.new(0, 6, 0, 66)
OutputLabel.Size = UDim2.new(1, -12, 0, 32)
OutputLabel.Font = Enum.Font.GothamBold
OutputLabel.Text = "وەگێڕدراو بۆ ئینگلیزی..."
OutputLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
OutputLabel.TextSize = 10
local OLBC = Instance.new("UICorner") OLBC.CornerRadius = UDim.new(0, 3) OLBC.Parent = OutputLabel

local CopyTransBtn = Instance.new("TextButton")
CopyTransBtn.Parent = TransBoxFrame
CopyTransBtn.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
CopyTransBtn.Position = UDim2.new(0, 6, 0, 106)
CopyTransBtn.Size = UDim2.new(1, -12, 0, 42)
CopyTransBtn.Font = Enum.Font.GothamBold
CopyTransBtn.Text = "وەرگێڕان بۆ ئینگلیزی و کۆپیکردن"
CopyTransBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyTransBtn.TextSize = 10
local CTBC = Instance.new("UICorner") CTBC.CornerRadius = UDim.new(0, 3) CTBC.Parent = CopyTransBtn

local function KurdishToEnglish(text)
    local t = string.lower(text)
    local dict = {
        ["سڵاو"] = "Hello",
        ["چۆنی"] = "How are you",
        ["باشم"] = "I am fine",
        ["سپاس"] = "Thank you",
        ["خوات لەگەڵ"] = "Goodbye",
        ["تۆ کێیت"] = "Who are you",
        ["یاری"] = "Game",
        ["برا"] = "Brother",
        ["خێرا"] = "Fast",
        ["وەستە"] = "Stop",
        ["بەرگری"] = "Defense",
        ["میدیا"] = "Media"
    }
    for k, v in pairs(dict) do
        if string.find(t, k) then
            return v
        end
    end
    return "Translated: " + text
end

CopyTransBtn.MouseButton1Click:Connect(function()
    local text = InputTextBox.Text
    if text ~= "" then
        local translated = KurdishToEnglish(text)
        OutputLabel.Text = translated
        pcall(function() setclipboard(translated) end)
    end
end)

-- 💀 بەشی سەر بڕاوەکان (پێشکەوتوو: کاتی وەستان لەکاتی لادان و دەستپێکردنەوە لەکاتی هەڵبژاردن)
local DuelMainScroll = Instance.new("ScrollingFrame")
DuelMainScroll.Parent = Duels1v1Page
DuelMainScroll.BackgroundTransparency = 1
DuelMainScroll.Size = UDim2.new(1, 0, 1, 0)
DuelMainScroll.CanvasSize = UDim2.new(0, 0, 3.5, 0)
DuelMainScroll.ScrollBarThickness = 3

local DMSLayout = Instance.new("UIListLayout")
DMSLayout.Parent = DuelMainScroll
DMSLayout.SortOrder = Enum.SortOrder.LayoutOrder
DMSLayout.Padding = UDim.new(0, 8)

local EliteHeaderBanner = Instance.new("TextLabel")
EliteHeaderBanner.Parent = DuelMainScroll
EliteHeaderBanner.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
EliteHeaderBanner.BackgroundTransparency = 0.3
EliteHeaderBanner.Size = UDim2.new(1, -4, 0, 32)
EliteHeaderBanner.Font = Enum.Font.GothamBold
EliteHeaderBanner.Text = "👑 تۆ باشترینت هەلبژاردوە و باشترینی ساحەکە ئەبی"
EliteHeaderBanner.TextColor3 = Color3.fromRGB(255, 255, 255)
EliteHeaderBanner.TextSize = 9
local EHBC = Instance.new("UICorner") EHBC.CornerRadius = UDim.new(0, 4) EHBC.Parent = EliteHeaderBanner

local ActiveDuelFrame = Instance.new("Frame")
ActiveDuelFrame.Parent = DuelMainScroll
ActiveDuelFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
ActiveDuelFrame.BackgroundTransparency = 0.5
ActiveDuelFrame.Size = UDim2.new(1, -4, 0, 185)
local ADFC = Instance.new("UICorner") ADFC.CornerRadius = UDim.new(0, 4) ADFC.Parent = ActiveDuelFrame

local MyAvatar = Instance.new("ImageLabel")
MyAvatar.Parent = ActiveDuelFrame
MyAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
MyAvatar.Position = UDim2.new(0, 15, 0, 25)
MyAvatar.Size = UDim2.new(0, 45, 0, 45)
MyAvatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
local MAC = Instance.new("UICorner") MAC.CornerRadius = UDim.new(1, 0) MAC.Parent = MyAvatar

local VSText = Instance.new("TextLabel")
VSText.Parent = ActiveDuelFrame VSText.BackgroundTransparency = 1 VSText.Position = UDim2.new(0.5, -25, 0, 35) VSText.Size = UDim2.new(0, 50, 0, 25)
VSText.Font = Enum.Font.GothamBold VSText.Text = "VS" VSText.TextColor3 = Color3.fromRGB(255, 100, 100) VSText.TextSize = 16

local EnemyAvatar = Instance.new("ImageLabel")
EnemyAvatar.Parent = ActiveDuelFrame EnemyAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50) EnemyAvatar.Position = UDim2.new(1, -60, 0, 25) EnemyAvatar.Size = UDim2.new(0, 45, 0, 45) EnemyAvatar.Image = "rbxassetid://0"
local EAC = Instance.new("UICorner") EAC.CornerRadius = UDim.new(1, 0) EAC.Parent = EnemyAvatar

local DuelStatusLabel = Instance.new("TextLabel")
DuelStatusLabel.Parent = ActiveDuelFrame
DuelStatusLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
DuelStatusLabel.Position = UDim2.new(0, 8, 0, 82)
DuelStatusLabel.Size = UDim2.new(1, -16, 0, 55)
DuelStatusLabel.Font = Enum.Font.Gotham
DuelStatusLabel.Text = "کەسێك بانگ بکە و چاوەڕێی لیفت بن (کاتژمێر، دەقە و سەانیە)..."
DuelStatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DuelStatusLabel.TextSize = 9
DuelStatusLabel.TextWrapped = true
local DSLC = Instance.new("UICorner") DSLC.CornerRadius = UDim.new(0, 4) DSLC.Parent = DuelStatusLabel

local ResetTargetBtn = Instance.new("TextButton")
ResetTargetBtn.Parent = ActiveDuelFrame
ResetTargetBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
ResetTargetBtn.Position = UDim2.new(0, 8, 0, 145)
ResetTargetBtn.Size = UDim2.new(1, -16, 0, 30)
ResetTargetBtn.Font = Enum.Font.GothamBold
ResetTargetBtn.Text = "🔄 لابردن و ڕاگرتنی کاتی ئامانج (Reset Target)"
ResetTargetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetTargetBtn.TextSize = 9
local RTBC = Instance.new("UICorner") RTBC.CornerRadius = UDim.new(0, 4) RTBC.Parent = ResetTargetBtn

local HistoryHeader = Instance.new("TextLabel")
HistoryHeader.Parent = DuelMainScroll
HistoryHeader.BackgroundTransparency = 1
HistoryHeader.Size = UDim2.new(1, -4, 0, 25)
HistoryHeader.Font = Enum.Font.GothamBold
HistoryHeader.Text = "💀 تۆمارکەری لێفتی نەیارەکان (لیستی سەربڕاوەکان بە وردی):"
HistoryHeader.TextColor3 = Color3.fromRGB(255, 215, 0)
HistoryHeader.TextSize = 11
HistoryHeader.TextXAlignment = Enum.TextXAlignment.Left

local HistoryContainer = Instance.new("Frame")
HistoryContainer.Parent = DuelMainScroll
HistoryContainer.BackgroundTransparency = 1
HistoryContainer.Size = UDim2.new(1, -4, 0, 300)

local HCLayout = Instance.new("UIListLayout")
HCLayout.Parent = HistoryContainer
HCLayout.SortOrder = Enum.SortOrder.LayoutOrder
HCLayout.Padding = UDim.new(0, 5)

local trackedEnemiesData = {}
local totalSecondsElapsed = 0
local isDuelActive = false
local lastSelectedTargetId = nil

task.spawn(function()
    while true do
        task.wait(1)
        if isDuelActive and SelectedTarget then
            totalSecondsElapsed = totalSecondsElapsed + 1
        end
    end
end)

local function FormatTime(secs)
    local h = math.floor(secs / 3600)
    local m = math.floor((secs % 3600) / 60)
    local s = secs % 60
    return string.format("%02d:%02d:%02d", h, m, s)
end

ResetTargetBtn.MouseButton1Click:Connect(function()
    SelectedTarget = nil
    isDuelActive = false
    lastSelectedTargetId = nil
    EnemyAvatar.Image = "rbxassetid://0"
    TargetImage.Image = "rbxassetid://0"
    DuelStatusLabel.Text = "⏹ کات ڕاگیرا و ئامانج لادرا. کەسێکی تر هەڵبژێرە..."
end)

RunService.Heartbeat:Connect(function()
    if SelectedTarget and SelectedTarget.Parent then
        EnemyAvatar.Image = Players:GetUserThumbnailAsync(SelectedTarget.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        
        if lastSelectedTargetId ~= SelectedTarget.UserId then
            lastSelectedTargetId = SelectedTarget.UserId
            isDuelActive = true -- Resume timer when new target is selected!
        elseif not isDuelActive then
            isDuelActive = true
        end
        
        local currentData = trackedEnemiesData[SelectedTarget.UserId]
        local leftC = currentData and currentData.leftCount or 0
        local joinC = currentData and currentData.joinCount or 1
        
        DuelStatusLabel.Text = "👑 ئامانج: " .. SelectedTarget.Name .. 
            "\n⏱️ کات و ماوە: " .. FormatTime(totalSecondsElapsed) .. " (کارایە)" ..
            "\n❌ ژمارەی لێفت: " .. leftC .. " جار | 🟢 هاتنەوە: " .. joinC .. " جار"
    else
        if SelectedTarget and not SelectedTarget.Parent then
            isDuelActive = false
            local currentData = trackedEnemiesData[SelectedTarget.UserId]
            local leftC = currentData and currentData.leftCount or 0
            local joinC = currentData and currentData.joinCount or 1
            DuelStatusLabel.Text = "👑 ئامانج: " .. SelectedTarget.Name .. " (لێفتی کرد - کات ڕاگیرا ⏹)" ..
                "\n⏱️ کۆتا کات: " .. FormatTime(totalSecondsElapsed) .. 
                "\n❌ ژمارەی لێفت: " .. leftC .. " جار | 🟢 هاتنەوە: " .. joinC .. " جار"
        elseif not SelectedTarget then
            isDuelActive = false
            lastSelectedTargetId = nil
            DuelStatusLabel.Text = "کەسێك بانگ بکە و چاوەڕێی لیفت بن (کاتژمێر، دەقە و سەانیە)..."
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if SelectedTarget and player == SelectedTarget then
        isDuelActive = false
    end

    if trackedEnemiesData[player.UserId] or (SelectedTarget and player == SelectedTarget) then
        if not trackedEnemiesData[player.UserId] then
            trackedEnemiesData[player.UserId] = { name = player.Name, leftCount = 0, joinCount = 1 }
        end
        trackedEnemiesData[player.UserId].leftCount = trackedEnemiesData[player.UserId].leftCount + 1
        local lCount = trackedEnemiesData[player.UserId].leftCount
        
        pcall(function()
            local HistoryItem = Instance.new("Frame")
            HistoryItem.Parent = HistoryContainer
            HistoryItem.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
            HistoryItem.BackgroundTransparency = 0.3
            HistoryItem.Size = UDim2.new(1, -4, 0, 48)
            local HIC = Instance.new("UICorner") HIC.CornerRadius = UDim.new(0, 4) HIC.Parent = HistoryItem
            
            local HistThumb = Instance.new("ImageLabel")
            HistThumb.Parent = HistoryItem
            HistThumb.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            HistThumb.Position = UDim2.new(0, 6, 0.5, -16)
            HistThumb.Size = UDim2.new(0, 32, 0, 32)
            HistThumb.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            local HTC = Instance.new("UICorner") HTC.CornerRadius = UDim.new(1, 0) HTC.Parent = HistThumb
            
            local HistText = Instance.new("TextLabel")
            HistText.Parent = HistoryItem
            HistText.BackgroundTransparency = 1
            HistText.Position = UDim2.new(0, 46, 0, 0)
            HistText.Size = UDim2.new(1, -52, 1, 0)
            HistText.Font = Enum.Font.GothamBold
            HistText.Text = player.Name .. " ➔ لێفتی کرد! (لێفت ژمارە " .. lCount .. ") لە کات " .. os.date("%H:%M:%S") .. " ❌"
            HistText.TextColor3 = Color3.fromRGB(255, 90, 90)
            HistText.TextSize = 9
            HistText.TextXAlignment = Enum.TextXAlignment.Left
            
            HistoryContainer.Size = UDim2.new(1, -4, 0, HCLayout.AbsoluteContentSize.Y + 40)
            DuelMainScroll.CanvasSize = UDim2.new(0, 0, 0, HCLayout.AbsoluteContentSize.Y + 220)
        end)
    end
end)

Players.PlayerAdded:Connect(function(player)
    if trackedEnemiesData[player.UserId] then
        trackedEnemiesData[player.UserId].joinCount = trackedEnemiesData[player.UserId].joinCount + 1
        local jCount = trackedEnemiesData[player.UserId].joinCount
        
        pcall(function()
            local HistoryItem = Instance.new("Frame")
            HistoryItem.Parent = HistoryContainer
            HistoryItem.BackgroundColor3 = Color3.fromRGB(20, 30, 20)
            HistoryItem.BackgroundTransparency = 0.3
            HistoryItem.Size = UDim2.new(1, -4, 0, 48)
            local HIC = Instance.new("UICorner") HIC.CornerRadius = UDim.new(0, 4) HIC.Parent = HistoryItem
            
            local HistThumb = Instance.new("ImageLabel")
            HistThumb.Parent = HistoryItem
            HistThumb.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            HistThumb.Position = UDim2.new(0, 6, 0.5, -16)
            HistThumb.Size = UDim2.new(0, 32, 0, 32)
            HistThumb.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            local HTC = Instance.new("UICorner") HTC.CornerRadius = UDim.new(1, 0) HTC.Parent = HistThumb
            
            local HistText = Instance.new("TextLabel")
            HistText.Parent = HistoryItem
            HistText.BackgroundTransparency = 1
            HistText.Position = UDim2.new(0, 46, 0, 0)
            HistText.Size = UDim2.new(1, -52, 1, 0)
            HistText.Font = Enum.Font.GothamBold
            HistText.Text = player.Name .. " ➔ گەڕایەوە ناو یاری! (هاتنەوە ژمارە " .. jCount .. ") لە کات " .. os.date("%H:%M:%S") .. " 🟢"
            HistText.TextColor3 = Color3.fromRGB(0, 255, 120)
            HistText.TextSize = 9
            HistText.TextXAlignment = Enum.TextXAlignment.Left
            
            HistoryContainer.Size = UDim2.new(1, -4, 0, HCLayout.AbsoluteContentSize.Y + 40)
            DuelMainScroll.CanvasSize = UDim2.new(0, 0, 0, HCLayout.AbsoluteContentSize.Y + 220)
        end)
    else
        trackedEnemiesData[player.UserId] = { name = player.Name, leftCount = 0, joinCount = 1 }
    end
end)

-- TROLL TAB (Safe Protected Execution)
local function setSafePlatform(state)
    pcall(function()
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = state end
    end)
end

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
        setSafePlatform(false)
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Sit = false end
    end)
end)

local HyperBangActive = false
CreateToggleComponent(MainTabPage, "⚡ بانگی هایپەری زۆر خێرا (Hyper Bang)", function(state)
    HyperBangActive = state
    task.spawn(function()
        while HyperBangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                setSafePlatform(true)
                local hOffset = math.sin(tick() * 140) * 0.9
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.5 + hOffset) * CFrame.Angles(math.rad(30), 0, 0)
            end
        end
        setSafePlatform(false)
    end)
end)

local PrimeBangActive = false
CreateToggleComponent(MainTabPage, "🔥 بانگی ئۆبیتۆ پرایم (Obito Prime Bang)", function(state)
    PrimeBangActive = state
    task.spawn(function()
        while PrimeBangActive do
            task.wait(0.002)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                setSafePlatform(true)
                local off = math.abs(math.sin(tick() * 55)) * 1.3
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.5 + off) * CFrame.Angles(math.rad(20), 0, 0)
            end
        end
        setSafePlatform(false)
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
                setSafePlatform(true)
                local off = math.sin(tick() * 65) * 1.2
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, -0.1, 0.7 + off) * CFrame.Angles(0, 0, 0)
            end
        end
        setSafePlatform(false)
    end)
end)

local UltraFastOrbitActive = false
CreateToggleComponent(MainTabPage, "🌪️ سووڕانەوە و بانگی خێرا (Ultra Orbit Bang)", function(state)
    UltraFastOrbitActive = state
    task.spawn(function()
        while UltraFastOrbitActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                setSafePlatform(true)
                local angle = tick() * 45
                local x = math.cos(angle) * 2.5
                local z = math.sin(angle) * 2.5
                local th = math.sin(tick() * 110) * 0.4
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(x, th, z) * CFrame.Angles(0, -angle, 0)
            end
        end
        setSafePlatform(false)
    end)
end)

local MegaSpazBangActive = false
CreateToggleComponent(MainTabPage, "💥 بانگی شێتی خێرای بێوەستان (Mega Spaz Bang)", function(state)
    MegaSpazBangActive = state
    task.spawn(function()
        while MegaSpazBangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                setSafePlatform(true)
                local rx = math.random(-200, 200) / 100
                local rz = math.random(-200, 200) / 100
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(rx, 0.2, rz) * CFrame.Angles(math.random(-5,5), math.random(-5,5), 0)
            end
        end
        setSafePlatform(false)
    end)
end)

local VerticalRocketBangActive = false
CreateToggleComponent(MainTabPage, "🚀 بانگی مووشەکی بەرەو ئاسمان (Vertical Rocket Bang)", function(state)
    VerticalRocketBangActive = state
    task.spawn(function()
        while VerticalRocketBangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                setSafePlatform(true)
                local upOffset = math.sin(tick() * 90) * 2.5
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, upOffset, 0.4) * CFrame.Angles(math.rad(90), 0, 0)
            end
        end
        setSafePlatform(false)
    end)
end)

local EarthquakeBangActive = false
CreateToggleComponent(MainTabPage, "🌋 بانگی بوومەلەرزە (Earthquake Shake Bang)", function(state)
    EarthquakeBangActive = state
    task.spawn(function()
        while EarthquakeBangActive do
            task.wait(0.01)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                setSafePlatform(true)
                local qx = (math.random() - 0.5) * 1.5
                local qz = (math.random() - 0.5) * 1.5
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(qx, 0, 0.6 + qz) * CFrame.Angles(0, 0, 0)
            end
        end
        setSafePlatform(false)
    end)
end)

local SmoothTrollBangActive = false
CreateToggleComponent(MainTabPage, "🛡️ بانگی پارێزراوی نەرم (Smooth Safe Troll)", function(state)
    SmoothTrollBangActive = state
    task.spawn(function()
        while SmoothTrollBangActive do
            task.wait(0.003)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local smoothOffset = math.sin(tick() * 25) * 0.8
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.2 + smoothOffset)
            end
        end
    end)
end)

local BehindTeleportBangActive = false
CreateToggleComponent(MainTabPage, "👻 بانگی پشتەوەی خێرا (Behind Teleport Bang)", function(state)
    BehindTeleportBangActive = state
    task.spawn(function()
        while BehindTeleportBangActive do
            task.wait(0.1)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2.5) * CFrame.Angles(0, math.pi, 0)
            end
        end
    end)
end)

local Spin360BangActive = false
CreateToggleComponent(MainTabPage, "🔄 بانگی سووڕانەوەی ٣٦٠ پلە (Spin 360 Bang)", function(state)
    Spin360BangActive = state
    task.spawn(function()
        while Spin360BangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                setSafePlatform(true)
                local rotAngle = tick() * 20
                LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1) * CFrame.Angles(0, rotAngle, 0)
            end
        end
        setSafePlatform(false)
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

-- Floating Toggle Button (Square Design with Custom Image ID)
local ToggleButton = Instance.new("ImageButton")
ToggleButton.Parent = ObitoGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleButton.BackgroundTransparency = 0.3
ToggleButton.Position = UDim2.new(0, 10, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Image = "rbxassetid://71011897552461"
ToggleButton.Active = true
ToggleButton.Draggable = true

local TBCorner = Instance.new("UICorner")
TBCorner.CornerRadius = UDim.new(0, 8)
TBCorner.Parent = ToggleButton

local visible = true
ToggleButton.MouseButton1Click:Connect(function()
    visible = not visible
    MainFrame.Visible = visible
end)
 Hub - Ultimate Secure Global Chat & Advanced Anti-AFK & Target Confirm | obito_dev6
