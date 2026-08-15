-- Obito Hub - Full Body & Outfit Stealer for Kurdish Obby (Delta Version) | obito_dev6
-- Obito Hub - Ultimate Secure Global Chat & Avatar Update | obito_dev6
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TextChatService = game:GetService("TextChatService")
local MessagingService = game:GetService("MessagingService")
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

-- Main GUI Creation
local ObitoGui = Instance.new("ScreenGui")
ObitoGui.Name = "ObitoHubUltimate"
ObitoGui.Parent = CoreGui
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
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "« Obito Hub | Secure Global Chat »"
Title.TextColor3 = Color3.fromRGB(0, 220, 200)
Title.TextSize = 10
Title.TextXAlignment = Enum.TextXAlignment.Left

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
TabContainer.CanvasSize = UDim2.new(0, 0, 2.5, 0)
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
    Page.CanvasSize = UDim2.new(0, 0, 2.0, 0)
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
local MainTabPage = CreateTab("ترۆڵ (Troll)")
local AntiTabPage = CreateTab("ئەنتی (Anti)")
local Duels1v1Page = CreateTab("ململانێ (1v1)")
local TargetTabPage = CreateTab("دیاریکردنی ناو")
local IntoTabPage = CreateTab("بەشی Into")
local TranslateTabPage = CreateTab("وەگێڕ (Translate)")
local SafetyTabPage = CreateTab("دژە هاک (Safety)")
local PlayersTabPage = CreateTab("فڕین / خێرا")
local OutfitTabPage = CreateTab("کۆپیکردنی جل و لەش")
local AnimHubPage = CreateTab("ئەنیمەیشن هب (Anim)")
local GlobalChatPage = CreateTab("گروپ چاتی هەب (Chat)")

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
local targetLeaveCounts = {}

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
                        local dist = (hrp.Position - p.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 4 then
                            underAttack = true
                            break
                        end
                    end
                end
                
                if underAttack then
                    if not originalPosBeforeUnderground then
                        originalPosBeforeUnderground = hrp.CFrame
                    end
                    hrp.CFrame = hrp.CFrame - Vector3.new(0, 50, 0)
                else
                    if originalPosBeforeUnderground then
                        originalPosBeforeUnderground = nil
                    end
                end
            end
        end
    end)
end)

AntiBangFloatingBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            hrp.CFrame = hrp.CFrame - Vector3.new(0, 60, 0)
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
                local char = LocalPlayer.Character
                if char and char:FindFirstChildOfClass("Humanoid") then
                    local hum = char.Humanoid
                    if hum.Health <= 5 then
                        hum.Health = hum.MaxHealth
                    end
                end
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

CreateToggleComponent(AntiTabPage, "🏴󐁧󐁢󐁥󐁮󐁧󐁿 ئەنتی AFK (Anti-AFK)", function(state)
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

-- SECURE GLOBAL CHAT TAB (With Avatar Thumbnails & Obito Owner Name)
local ChatHolder = Instance.new("ScrollingFrame")
ChatHolder.Parent = GlobalChatPage
ChatHolder.BackgroundColor3 = Color3.fromRGB(15, 45, 55)
ChatHolder.Size = UDim2.new(1, -4, 0, 180)
ChatHolder.CanvasSize = UDim2.new(0, 0, 2, 0)
ChatHolder.ScrollBarThickness = 3

local CHCorner = Instance.new("UICorner")
CHCorner.CornerRadius = UDim.new(0, 4)
CHCorner.Parent = ChatHolder

local ChatListLayout = Instance.new("UIListLayout")
ChatListLayout.Parent = ChatHolder
ChatListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ChatListLayout.Padding = UDim.new(0, 4)

local ChatInputBox = Instance.new("TextBox")
ChatInputBox.Parent = GlobalChatPage
ChatInputBox.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
ChatInputBox.Position = UDim2.new(0, 0, 0, 186)
ChatInputBox.Size = UDim2.new(1, -4, 0, 30)
ChatInputBox.Font = Enum.Font.Gotham
ChatInputBox.PlaceholderText = "لێرە قسە بنووسە بۆ هەموو بەکارهێنەران..."
ChatInputBox.Text = ""
ChatInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatInputBox.TextSize = 10

local CIBC = Instance.new("UICorner")
CIBC.CornerRadius = UDim.new(0, 3)
CIBC.Parent = ChatInputBox

local SendChatHubBtn = Instance.new("TextButton")
SendChatHubBtn.Parent = GlobalChatPage
SendChatHubBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 150)
SendChatHubBtn.Position = UDim2.new(0, 0, 0, 222)
SendChatHubBtn.Size = UDim2.new(1, -4, 0, 30)
SendChatHubBtn.Font = Enum.Font.GothamBold
SendChatHubBtn.Text = "ناردنی گشتی (Send Global)"
SendChatHubBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SendChatHubBtn.TextSize = 10

local SCHBC = Instance.new("UICorner")
SCHBC.CornerRadius = UDim.new(0, 3)
SCHBC.Parent = SendChatHubBtn

local function AddHubMessageWithAvatar(senderName, messageText, isOwner, userId)
    local MsgContainer = Instance.new("Frame")
    MsgContainer.Parent = ChatHolder
    MsgContainer.BackgroundColor3 = isOwner and Color3.fromRGB(40, 20, 70) or Color3.fromRGB(20, 60, 70)
    MsgContainer.Size = UDim2.new(1, -6, 0, 32)
    
    local MCC = Instance.new("UICorner")
    MCC.CornerRadius = UDim.new(0, 3)
    MCC.Parent = MsgContainer
    
    -- Avatar Image
    local AvatarImg = Instance.new("ImageLabel")
    AvatarImg.Parent = MsgContainer
    AvatarImg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    AvatarImg.Position = UDim2.new(0, 4, 0.5, -12)
    AvatarImg.Size = UDim2.new(0, 24, 0, 24)
    AvatarImg.Image = "rbxassetid://0"
    
    local AIC = Instance.new("UICorner")
    AIC.CornerRadius = UDim.new(1, 0)
    AIC.Parent = AvatarImg
    
    pcall(function()
        if userId and userId > 0 then
            AvatarImg.Image = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        end
    end)
    
    -- Text Label
    local MsgLabel = Instance.new("TextLabel")
    MsgLabel.Parent = MsgContainer
    MsgLabel.BackgroundTransparency = 1
    MsgLabel.Position = UDim2.new(0, 32, 0, 0)
    MsgLabel.Size = UDim2.new(1, -34, 1, 0)
    MsgLabel.Font = Enum.Font.GothamBold
    local tag = isOwner and "👑 Obito" or "User"
    MsgLabel.Text = " [" .. tag .. "] " .. senderName .. ": " .. messageText
    MsgLabel.TextColor3 = isOwner and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(0, 255, 200)
    MsgLabel.TextSize = 9
    MsgLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    ChatHolder.CanvasSize = UDim2.new(0, 0, 0, ChatListLayout.AbsoluteContentSize.Y + 20)
end

AddHubMessageWithAvatar("ObitoBot", "سیستمی گروپ چاتی پارێزراو کار دەکات!", false, 1)

-- Cross-Server Messaging Service Connection
pcall(function()
    MessagingService:SubscribeAsync("ObitoGlobalChatChannelV3", function(message)
        local data = message.Data
        if data and data.sender and data.text then
            AddHubMessageWithAvatar(data.sender, data.text, data.isOwner, data.userId)
        end
    end)
end)

SendChatHubBtn.MouseButton1Click:Connect(function()
    local text = ChatInputBox.Text
    if text ~= "" then
        local senderDisplayName = "Obito" -- ناوی سەرەکی تۆ لە چاتەکەدا
        local myUserId = LocalPlayer.UserId
        
        pcall(function()
            MessagingService:PublishAsync("ObitoGlobalChatChannelV3", {
                sender = senderDisplayName,
                text = text,
                isOwner = true,
                userId = myUserId
            })
        end)
        
        AddHubMessageWithAvatar(senderDisplayName, text, true, myUserId)
        ChatInputBox.Text = ""
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

local OutfitTitle = Instance.new("TextLabel")
OutfitTitle.Parent = OutfitFrame
OutfitTitle.BackgroundTransparency = 1
OutfitTitle.Position = UDim2.new(0, 6, 0, 6)
OutfitTitle.Size = UDim2.new(1, -12, 0, 20)
OutfitTitle.Font = Enum.Font.GothamBold
OutfitTitle.Text = "« Full Body & Outfit Stealer »"
OutfitTitle.TextColor3 = Color3.fromRGB(0, 220, 200)
OutfitTitle.TextSize = 10

local OutfitStatus = Instance.new("TextLabel")
OutfitStatus.Parent = OutfitFrame
OutfitStatus.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
OutfitStatus.Position = UDim2.new(0, 6, 0, 28)
OutfitStatus.Size = UDim2.new(1, -12, 0, 32)
OutfitStatus.Font = Enum.Font.Gotham
OutfitStatus.Text = "نەفەرێک دیاری بکە بۆ کۆپیکردنی جل و قەبارەی لەشی..."
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
            local targetChar = SelectedTarget.Character
            local myChar = LocalPlayer.Character
            
            for _, v in pairs(myChar:GetChildren()) do
                if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") or v:IsA("Accessory") then
                    v:Destroy()
                end
            end
            
            for _, v in pairs(targetChar:GetChildren()) do
                if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") or v:IsA("Accessory") then
                    local cloneItem = v:Clone()
                    cloneItem.Parent = myChar
                end
            end
            
            OutfitStatus.Text = "سەرکەوتوو بوو! جل و لەشی (" .. SelectedTarget.Name .. ") بە تەواوی کۆپی کران."
        end)
    else
        OutfitStatus.Text = "تکایە سەرەتا کەسێک دیاری بکە!"
    end
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
                if currentAnimTrack then
                    currentAnimTrack:Stop()
                    currentAnimTrack = nil
                end
                local animObject = Instance.new("Animation")
                animObject.AnimationId = "rbxassetid://" .. tostring(animId)
                currentAnimTrack = animator:LoadAnimation(animObject)
                currentAnimTrack.Looped = true
                currentAnimTrack:Play()
            end
        end)
    end)
end

CreateAnimButton("🔥 ئەنیمەیشنی Jerk (Jerk Animation)", 33796059)
CreateAnimButton("🔹 ئەنیمەیشنی سەما (Dance 1)", 507710230)
CreateAnimButton("🔹 ئەنیمەیشنی سەما (Dance 2)", 33796059)
CreateAnimButton("🔹 ئەنیمەیشنی شۆک / گریان (Shock/Cry)", 507770677)

local StopAnimBtn = Instance.new("TextButton")
StopAnimBtn.Parent = AnimHubPage
StopAnimBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
StopAnimBtn.Size = UDim2.new(1, -4, 0, 32)
StopAnimBtn.Font = Enum.Font.GothamBold
StopAnimBtn.Text = "❌ ڕاگرتنی هەموو ئەنیمەیشنەکان (Stop)"
StopAnimBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopAnimBtn.TextSize = 10

local SABC = Instance.new("UICorner")
SABC.CornerRadius = UDim.new(0, 4)
SABC.Parent = StopAnimBtn

StopAnimBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
                track:Stop()
            end
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

local DuelTitle = Instance.new("TextLabel")
DuelTitle.Parent = DuelFrame
DuelTitle.BackgroundTransparency = 1
DuelTitle.Position = UDim2.new(0, 6, 0, 4)
DuelTitle.Size = UDim2.new(1, -12, 0, 20)
DuelTitle.Font = Enum.Font.GothamBold
DuelTitle.Text = "« 1v1 Arena & Target Stats »"
DuelTitle.TextColor3 = Color3.fromRGB(0, 220, 200)
DuelTitle.TextSize = 11

local MyAvatar = Instance.new("ImageLabel")
MyAvatar.Parent = DuelFrame
MyAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
MyAvatar.Position = UDim2.new(0, 15, 0, 32)
MyAvatar.Size = UDim2.new(0, 45, 0, 45)
MyAvatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
local MAC = Instance.new("UICorner")
MAC.CornerRadius = UDim.new(1, 0)
MAC.Parent = MyAvatar

local VSText = Instance.new("TextLabel")
VSText.Parent = DuelFrame
VSText.BackgroundTransparency = 1
VSText.Position = UDim2.new(0.5, -25, 0, 42)
VSText.Size = UDim2.new(0, 50, 0, 25)
VSText.Font = Enum.Font.GothamBold
VSText.Text = "VS"
VSText.TextColor3 = Color3.fromRGB(255, 100, 100)
VSText.TextSize = 16

local EnemyAvatar = Instance.new("ImageLabel")
EnemyAvatar.Parent = DuelFrame
EnemyAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
EnemyAvatar.Position = UDim2.new(1, -60, 0, 32)
EnemyAvatar.Size = UDim2.new(0, 45, 0, 45)
EnemyAvatar.Image = "rbxassetid://0"
local EAC = Instance.new("UICorner")
EAC.CornerRadius = UDim.new(1, 0)
EAC.Parent = EnemyAvatar

local DuelStatusLabel = Instance.new("TextLabel")
DuelStatusLabel.Parent = DuelFrame
DuelStatusLabel.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
DuelStatusLabel.Position = UDim2.new(0, 8, 0, 88)
DuelStatusLabel.Size = UDim2.new(1, -16, 0, 60)
DuelStatusLabel.Font = Enum.Font.Gotham
DuelStatusLabel.Text = "کەسێك هەڵبژێرە بۆ دەستپێکردنی 1v1..."
DuelStatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DuelStatusLabel.TextSize = 10
DuelStatusLabel.TextWrapped = true

local DSLC = Instance.new("UICorner")
DSLC.CornerRadius = UDim.new(0, 4)
DSLC.Parent = DuelStatusLabel

RunService.Heartbeat:Connect(function()
    if SelectedTarget and SelectedTarget.Parent then
        EnemyAvatar.Image = Players:GetUserThumbnailAsync(SelectedTarget.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        DuelStatusLabel.Text = "ململانێ لەگەڵ: " .. SelectedTarget.Name .. " بەڕێوەچوونی هەیە!"
    else
        EnemyAvatar.Image = "rbxassetid://0"
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player == SelectedTarget then
        if not targetLeaveCounts[player.UserId] then
            targetLeaveCounts[player.UserId] = 0
        end
        targetLeaveCounts[player.UserId] = targetLeaveCounts[player.UserId] + 1
        local count = targetLeaveCounts[player.UserId]
        
        DuelStatusLabel.Text = "« بژی تۆ بردتەوە، ئەو دەرکرا! »\nئەم نەفەرە تا ئێستا (" .. count .. ") جار هاتوەتە ناو یاری و لیفتی کردووە."
        
        pcall(function()
            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                TextChatService.TextChannels.RBXGeneral:SendAsync("[Obito 1v1]: بژی تۆ بردتەوە! ئەو نەفەرە دەرکرا و تاکو ئێستا " .. count .. " جار لیفتی کردووە.")
            else
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Obito 1v1]: بژی تۆ بردتەوە! ئەو نەفەرە دەرکرا و تاکو ئێستا " .. count .. " جار لیفتی کردووە.", "All")
            end
        end)
    end
end)

-- TARGET TAB
local TargetInputFrame = Instance.new("Frame")
TargetInputFrame.Parent = TargetTabPage
TargetInputFrame.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
TargetInputFrame.Size = UDim2.new(1, -4, 0, 45)

local TIC = Instance.new("UICorner")
TIC.CornerRadius = UDim.new(0, 4)
TIC.Parent = TargetInputFrame

local TargetTextBox = Instance.new("TextBox")
TargetTextBox.Parent = TargetInputFrame
TargetTextBox.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
TargetTextBox.Position = UDim2.new(0, 6, 0.5, -14)
TargetTextBox.Size = UDim2.new(1, -12, 0, 28)
TargetTextBox.Font = Enum.Font.Gotham
TargetTextBox.PlaceholderText = "ناوی نەفەر بنووسە..."
TargetTextBox.Text = ""
TargetTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetTextBox.TextSize = 10

local TBCC = Instance.new("UICorner")
TBCC.CornerRadius = UDim.new(0, 3)
TBCC.Parent = TargetTextBox

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

-- TROLL TAB
local R6SitBangActive = false
CreateToggleComponent(MainTabPage, "💺 R6 دانیشتن و تەکان بۆ دەم (Ultra Fast Sit)", function(state)
    R6SitBangActive = state
    task.spawn(function()
        while R6SitBangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("Head") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local tHead = SelectedTarget.Character.Head
                local mHRP = LocalPlayer.Character.HumanoidRootPart
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                
                if hum then
                    hum.Sit = true
                end
                
                local speed = tick() * 110
                local thrust = math.sin(speed) * 0.45
                
                mHRP.CFrame = tHead.CFrame * CFrame.new(0, 0.15, -0.65 + thrust) * CFrame.Angles(0, math.pi, 0)
                if hum then 
                    hum.PlatformStand = false 
                end
            end
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.Sit = false
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
    end)
end)

local UltraFastHyperBangActive = false
CreateToggleComponent(MainTabPage, "⚡ بانگی زۆر زۆر خێرا و سارێح (Hyper Bang)", function(state)
    UltraFastHyperBangActive = state
    task.spawn(function()
        while UltraFastHyperBangActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local tHRP = SelectedTarget.Character.HumanoidRootPart
                local mHRP = LocalPlayer.Character.HumanoidRootPart
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                
                local hyperSpeed = tick() * 120
                local hyperOffset = math.sin(hyperSpeed) * 0.9
                mHRP.CFrame = tHRP.CFrame * CFrame.new(0, 0, 0.5 + hyperOffset) * CFrame.Angles(math.rad(25), 0, 0)
                if hum then hum.PlatformStand = true end
            end
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
    end)
end)

local PrimeBangActive = false
CreateToggleComponent(MainTabPage, "by obito prime (بانگی بەهێز)", function(state)
    PrimeBangActive = state
    task.spawn(function()
        while PrimeBangActive do
            task.wait(0.005)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local tHRP = SelectedTarget.Character.HumanoidRootPart
                local mHRP = LocalPlayer.Character.HumanoidRootPart
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                local speedOffset = math.abs(math.sin(tick() * 45)) * 1.4
                mHRP.CFrame = tHRP.CFrame * CFrame.new(0, 0, 0.6 + speedOffset) * CFrame.Angles(math.rad(15), 0, 0)
                if hum then hum.PlatformStand = true end
            end
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
    end)
end)

local MouthKissActive = false
CreateToggleComponent(MainTabPage, "ماچی ناودەم (Mouth Kiss)", function(state)
    MouthKissActive = state
    task.spawn(function()
        while MouthKissActive do
            task.wait(0.005)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("Head") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
                local tHead = SelectedTarget.Character.Head
                local mHRP = LocalPlayer.Character.HumanoidRootPart
                mHRP.CFrame = tHead.CFrame * CFrame.new(0, 0, -0.6) * CFrame.Angles(0, math.pi, 0)
            end
        end
    end)
end)

local BangBottomActive = false
CreateToggleComponent(MainTabPage, "بانگی ژێرەوە و پشت (Bottom/Back)", function(state)
    BangBottomActive = state
    task.spawn(function()
        while BangBottomActive do
            task.wait(0.005)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local tHRP = SelectedTarget.Character.HumanoidRootPart
                local mHRP = LocalPlayer.Character.HumanoidRootPart
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                local speedOffset = math.sin(tick() * 55) * 1.1
                mHRP.CFrame = tHRP.CFrame * CFrame.new(0, -0.1, 0.8 + speedOffset) * CFrame.Angles(0, 0, 0)
                if hum then hum.PlatformStand = true end
            end
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
    end)
end)

local UltraFastOrbitActive = false
CreateToggleComponent(MainTabPage, "سووڕانەوە و بانگی زۆر خێرا (Ultra Fast Orbit Bang)", function(state)
    UltraFastOrbitActive = state
    task.spawn(function()
        while UltraFastOrbitActive do
            RunService.RenderStepped:Wait()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local tHRP = SelectedTarget.Character.HumanoidRootPart
                local mHRP = LocalPlayer.Character.HumanoidRootPart
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                
                local angle = tick() * 35
                local radius = 2.5
                local xOffset = math.cos(angle) * radius
                local zOffset = math.sin(angle) * radius
                local fastThrust = math.sin(tick() * 100) * 0.4
                
                mHRP.CFrame = tHRP.CFrame * CFrame.new(xOffset, fastThrust, zOffset) * CFrame.Angles(0, -angle, 0)
                if hum then hum.PlatformStand = true end
            end
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
    end)
end)

-- INTO TAB
local IntoFrame = Instance.new("Frame")
IntoFrame.Parent = IntoTabPage
IntoFrame.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
IntoFrame.Size = UDim2.new(1, -4, 0, 110)

local IFC = Instance.new("UICorner")
IFC.CornerRadius = UDim.new(0, 4)
IFC.Parent = IntoFrame

local IntoTextBox = Instance.new("TextBox")
IntoTextBox.Parent = IntoFrame
IntoTextBox.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
IntoTextBox.Position = UDim2.new(0, 6, 0, 8)
IntoTextBox.Size = UDim2.new(1, -12, 0, 32)
IntoTextBox.Font = Enum.Font.Gotham
IntoTextBox.PlaceholderText = "لێرە قسە بنووسە (Into Chat)..."
IntoTextBox.Text = ""
IntoTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
IntoTextBox.TextSize = 10

local ITBC2 = Instance.new("UICorner")
ITBC2.CornerRadius = UDim.new(0, 3)
ITBC2.Parent = IntoTextBox

local IntoSendBtn = Instance.new("TextButton")
IntoSendBtn.Parent = IntoFrame
IntoSendBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 150)
IntoSendBtn.Position = UDim2.new(0, 6, 0, 48)
IntoSendBtn.Size = UDim2.new(1, -12, 0, 32)
IntoSendBtn.Font = Enum.Font.GothamBold
IntoSendBtn.Text = "ناردنی قسەکان لە Into (Send)"
IntoSendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
IntoSendBtn.TextSize = 10

local ISBC = Instance.new("UICorner")
ISBC.CornerRadius = UDim.new(0, 3)
ISBC.Parent = IntoSendBtn

IntoSendBtn.MouseButton1Click:Connect(function()
    local msg = IntoTextBox.Text
    if msg ~= "" then
        pcall(function()
            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                TextChatService.TextChannels.RBXGeneral:SendAsync("[Obito Into]: " .. msg)
            else
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Obito Into]: " .. msg, "All")
            end
        end)
    end
end)

-- TRANSLATE TAB
local TransBoxFrame = Instance.new("Frame")
TransBoxFrame.Parent = TranslateTabPage
TransBoxFrame.BackgroundColor3 = Color3.fromRGB(22, 70, 80)
TransBoxFrame.Size = UDim2.new(1, -4, 0, 100)

local TBFIC = Instance.new("UICorner")
TBFIC.CornerRadius = UDim.new(0, 4)
TBFIC.Parent = TransBoxFrame

local InputTextBox = Instance.new("TextBox")
InputTextBox.Parent = TransBoxFrame
InputTextBox.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
InputTextBox.Position = UDim2.new(0, 6, 0, 6)
InputTextBox.Size = UDim2.new(1, -12, 0, 26)
InputTextBox.Font = Enum.Font.Gotham
InputTextBox.PlaceholderText = "تێکست بە کوردی بنووسە..."
InputTextBox.Text = ""
InputTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputTextBox.TextSize = 10

local OutputLabel = Instance.new("TextLabel")
OutputLabel.Parent = TransBoxFrame
OutputLabel.BackgroundColor3 = Color3.fromRGB(15, 50, 60)
OutputLabel.Position = UDim2.new(0, 6, 0, 38)
OutputLabel.Size = UDim2.new(1, -12, 0, 26)
OutputLabel.Font = Enum.Font.Gotham
OutputLabel.Text = "وەگێڕدراو بۆ ئینگلیزی..."
OutputLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
OutputLabel.TextSize = 10

local function QuickTranslate(text)
    local t = string.lower(text)
    t = string.gsub(t, "سلاو", "hello")
    t = string.gsub(t, "چۆنی", "how are you")
    t = string.gsub(t, "باشم", "im good")
    return t ~= "" and t or "translated text"
end

InputTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local translated = QuickTranslate(InputTextBox.Text)
        OutputLabel.Text = translated
        pcall(function() setclipboard(translated) end)
    end
end)

local SendChatBtn = Instance.new("TextButton")
SendChatBtn.Parent = TranslateTabPage
SendChatBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 130)
SendChatBtn.Size = UDim2.new(1, -4, 0, 28)
SendChatBtn.Font = Enum.Font.GothamBold
SendChatBtn.Text = "ناردن بۆ چات (Send to Chat)"
SendChatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SendChatBtn.TextSize = 10

SendChatBtn.MouseButton1Click:Connect(function()
    local textToSend = OutputLabel.Text
    if textToSend ~= "" and textToSend ~= "وەگێڕدراو بۆ ئینگلیزی..." then
        pcall(function()
            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                TextChatService.TextChannels.RBXGeneral:SendAsync(textToSend)
            else
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(textToSend, "All")
            end
        end)
    end
end)

-- SAFETY TAB
CreateToggleComponent(SafetyTabPage, "پاراستنی تەواو (Anti-Ban/Fling)", function(state)
    if state then
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0, 100, 100)
                    end
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
                if p.Character:FindFirstChild("ObitoESP") then
                    p.Character.ObitoESP:Destroy()
                end
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
CreateToggleComponent(PlayersTabPage, "Noclip", function(state)
    NoclipEnabled = state
end)

-- Floating Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ObitoGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
ToggleButton.Position = UDim2.new(0, 10, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 36, 0, 36)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "OBI"
ToggleButton.TextColor3 = Color3.fromRGB(0, 220, 200)
ToggleButton.TextSize = 10

local TBCorner = Instance.new("UICorner")
TBCorner.CornerRadius = UDim.new(0, 6)
TBCorner.Parent = ToggleButton

local visible = true
ToggleButton.MouseButton1Click:Connect(function()
    visible = not visible
    MainFrame.Visible = visible
end)
