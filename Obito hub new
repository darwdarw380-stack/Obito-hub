-- Obito Hub - Full Body & Outfit Stealer for Kurdish Obby (Delta Version) | obito_dev6
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Main GUI Creation
local ObitoGui = Instance.new("ScreenGui")
ObitoGui.Name = "ObitoHubUltimate"
ObitoGui.Parent = CoreGui
ObitoGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Container
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
Title.Text = "« Obito Hub | obito_dev6 »"
Title.TextColor3 = Color3.fromRGB(0, 220, 200)
Title.TextSize = 12
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
TabContainer.CanvasSize = UDim2.new(0, 0, 1.9, 0)
TabContainer.ScrollBarThickness = 2

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 4)
TabCorner.Parent = TabContainer

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.Parent = TabContainer
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 4)

-- Content Pages Frame Container (Right Side)
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
    Page.CanvasSize = UDim2.new(0, 0, 1.5, 0)
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

-- Create Tabs in Left Panel
local MainTabPage = CreateTab("ترۆڵ (Troll)")
local Duels1v1Page = CreateTab("ململانێ (1v1)")
local TargetTabPage = CreateTab("دیاریکردنی ناو")
local IntoTabPage = CreateTab("بەشی Into")
local TranslateTabPage = CreateTab("وەرگێڕ (Translate)")
local SafetyTabPage = CreateTab("دژە هاک (Safety)")
local PlayersTabPage = CreateTab("فڕین / خێرا")
local OutfitTabPage = TotalPage or CreateTab("کۆپیکردنی جل و لەش")

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

-- 1. FULL BODY & OUTFIT COPY TAB (Kurdish Obby Feature)
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
            
            -- 1. Copy Clothes (Shirt, Pants, Graphic T-Shirt)
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
            
            -- 2. Copy Body Parts Mesh/Appearance (Arms, Legs, Torso, Head Scalings if R15/R6)
            local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
            local myHum = myChar:FindFirstChildOfClass("Humanoid")
            
            if targetHum and myHum and targetHum.RigType == Enum.HumanoidRigType.R15 and myHum.RigType == Enum.HumanoidRigType.R15 then
                local bodyPartsNames = {"LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot", "UpperTorso", "LowerTorso", "Head"}
                for _, partName in ipairs(bodyPartsNames) do
                    local tPart = targetChar:FindFirstChild(partName)
                    local mPart = myChar:FindFirstChild(partName)
                    if tPart and mPart then
                        for _, desc in pairs(mPart:GetChildren()) do
                            if desc:IsA("SpecialMesh") or desc:IsA("DataModelMesh") or desc.Name == "BodyColors" then
                                desc:Destroy()
                            end
                        end
                        for _, desc in pairs(tPart:GetChildren()) do
                            if desc:IsA("SpecialMesh") or desc:IsA("DataModelMesh") or desc.Name == "BodyColors" then
                                desc:Clone().Parent = mPart
                            end
                        end
                        mPart.Color = tPart.Color
                    end
                end
            end
            
            OutfitStatus.Text = "سەرکەوتوو بوو! جل و لەشی (" .. SelectedTarget.Name .. ") بە تەواوی کۆپی کران."
        end)
    else
        OutfitStatus.Text = "تکایە سەرەتا کەسێک بە ماوس یان لە بەشی ناو دیاری بکە!"
    end
end)

-- 2. 1v1 DUELS TAB
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
                TextChatService.TextChannels.RBXGeneral:SendAsync("[Obito Hub 1v1]: بژی تۆ بردتەوە! ئەو نەفەرە دەرکرا و تاکو ئێستا " .. count .. " جار لیفتی کردووە.")
            else
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Obito Hub 1v1]: بژی تۆ بردتەوە! ئەو نەفەرە دەرکرا و تاکو ئێستا " .. count .. " جار لیفتی کردووە.", "All")
            end
        end)
    end
end)

-- 3. TARGET TAB
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

-- 4. TROLL TAB
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

local BangFrontActive = false
CreateToggleComponent(MainTabPage, "بانگی دەم (Front Bang)", function(state)
    BangFrontActive = state
    task.spawn(function()
        while BangFrontActive do
            task.wait(0.01)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local tHRP = SelectedTarget.Character.HumanoidRootPart
                local mHRP = LocalPlayer.Character.HumanoidRootPart
                mHRP.CFrame = tHRP.CFrame * CFrame.new(0, 0, -1.2) * CFrame.Angles(0, math.pi, 0)
            end
        end
    end)
end)

local BangBottomActive = false
CreateToggleComponent(MainTabPage, "بانگی ژێرەوە و پشت (Bottom/Back)", function(state)
    BangBottomActive = state
    task.spawn(function()
        while BangBottomActive do
            task.wait(0.008)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local tHRP = SelectedTarget.Character.HumanoidRootPart
                local mHRP = LocalPlayer.Character.HumanoidRootPart
                local speedOffset = math.sin(tick() * 50) * 0.8
                mHRP.CFrame = tHRP.CFrame * CFrame.new(0, -0.2, 0.9 + speedOffset)
            end
        end
    end)
end)

local FastSafeBangActive = false
CreateToggleComponent(MainTabPage, "بانگی سەریع و سەلامەت (Fast Safe Bang)", function(state)
    FastSafeBangActive = state
    task.spawn(function()
        while FastSafeBangActive do
            task.wait(0.003)
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local tHRP = SelectedTarget.Character.HumanoidRootPart
                local mHRP = LocalPlayer.Character.HumanoidRootPart
                local offset = math.sin(tick() * 60) * 0.5
                mHRP.CFrame = tHRP.CFrame * CFrame.new(0, 0, 0.8 + offset)
            end
        end
    end)
end)

-- 5. INTO TAB
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
                local channel = TextChatService.TextChannels.RBXGeneral
                channel:SendAsync("[Obito Hub Into]: " .. msg)
            else
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Obito Hub Into]: " .. msg, "All")
            end
        end)
    end
end)

-- 6. TRANSLATE TAB
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
                local channel = TextChatService.TextChannels.RBXGeneral
                channel:SendAsync(textToSend)
            else
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(textToSend, "All")
            end
        end)
    end
end)

-- 7. SAFETY TAB
CreateToggleComponent(SafetyTabPage, "دژە هاک (Anti-Ban/Bang/Fling)", function(state)
    if state then
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" or method == "kick" or method == "Ban" then
                return
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)

        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0, 100, 100)
                end
            end
        end
    end
end)

-- 8. PLAYERS TAB
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

local InfJumpEnabled = false
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
CreateToggleComponent(PlayersTabPage, "Infinite Jump", function(state)
    InfJumpEnabled = state
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
