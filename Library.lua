-- NazuX Library - Fixed Draggable Version
local NazuX = {}
NazuX.__index = NazuX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Local variables
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Theme colors
NazuX.Themes = {
    Dark = {
        Main = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(25, 25, 25),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    White = {
        Main = Color3.fromRGB(245, 245, 245),
        Secondary = Color3.fromRGB(230, 230, 230),
        Text = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    Darker = {
        Main = Color3.fromRGB(20, 20, 20),
        Secondary = Color3.fromRGB(15, 15, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    Red = {
        Main = Color3.fromRGB(40, 20, 20),
        Secondary = Color3.fromRGB(30, 15, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 60, 60)
    },
    Green = {
        Main = Color3.fromRGB(20, 40, 20),
        Secondary = Color3.fromRGB(15, 30, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(60, 255, 60)
    },
    Blue = {
        Main = Color3.fromRGB(20, 20, 40),
        Secondary = Color3.fromRGB(15, 15, 30),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(60, 120, 255)
    },
    Purple = {
        Main = Color3.fromRGB(30, 20, 40),
        Secondary = Color3.fromRGB(22, 15, 30),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(180, 60, 255)
    },
    AMOLED = {
        Main = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(0, 0, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 255, 255)
    },
    Github = {
        Main = Color3.fromRGB(36, 41, 46),
        Secondary = Color3.fromRGB(28, 33, 38),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(88, 166, 255)
    },
    Rose = {
        Main = Color3.fromRGB(40, 20, 30),
        Secondary = Color3.fromRGB(30, 15, 22),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 182, 193)
    }
}

-- Create rounded corner function
local function RoundedCorner(radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

-- Create stroke function
local function CreateStroke(thickness, color, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness
    stroke.Color = color
    stroke.Transparency = transparency or 0
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return stroke
end

-- FIXED Draggable function với Active true
local function MakeDraggable(frame, handle)
    local dragging = false
    local dragInput, dragStart, startPos

    -- QUAN TRỌNG: Đặt Active true cho handle
    handle.Active = true
    handle.Draggable = true

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            -- Animation effect when starting drag
            local tween = TweenService:Create(frame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            })
            tween:Play()
            
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    connection:Disconnect()
                    
                    -- Animation effect when ending drag
                    local tween2 = TweenService:Create(frame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                    })
                    tween2:Play()
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, 
                startPos.X.Offset + delta.X, 
                startPos.Y.Scale, 
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- Create new window
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowName = options.Name or "NazuX Window"
    
    -- Create main GUI
    local NazuXLib = {}
    
    -- Main ScreenGui
    NazuXLib.MainScreenGui = Instance.new("ScreenGui")
    NazuXLib.MainScreenGui.Name = "NazuXLib"
    NazuXLib.MainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    NazuXLib.MainScreenGui.ResetOnSpawn = false
    
    if game:GetService("RunService"):IsStudio() then
        NazuXLib.MainScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    else
        NazuXLib.MainScreenGui.Parent = game.CoreGui
    end

    -- Main Frame với entrance animation
    NazuXLib.MainFrame = Instance.new("Frame")
    NazuXLib.MainFrame.Name = "MainFrame"
    NazuXLib.MainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    NazuXLib.MainFrame.BorderSizePixel = 0
    NazuXLib.MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    NazuXLib.MainFrame.Size = UDim2.new(0, 600, 0, 400)
    NazuXLib.MainFrame.Parent = NazuXLib.MainScreenGui
    NazuXLib.MainFrame.ClipsDescendants = true

    -- Entrance animation
    NazuXLib.MainFrame.Size = UDim2.new(0, 0, 0, 0)
    NazuXLib.MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    local openTween = TweenService:Create(NazuXLib.MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 600, 0, 400),
        Position = UDim2.new(0.3, 0, 0.3, 0)
    })
    openTween:Play()

    -- Corner and stroke
    local MainCorner = RoundedCorner(12)
    MainCorner.Parent = NazuXLib.MainFrame

    local MainStroke = CreateStroke(2, Color3.fromRGB(60, 60, 60))
    MainStroke.Parent = NazuXLib.MainFrame

    -- Title Bar - FIXED: Đặt Active và Draggable true
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(1, 0, 0, 35)
    TitleBar.Parent = NazuXLib.MainFrame
    
    -- QUAN TRỌNG: Đặt Active và Draggable true
    TitleBar.Active = true
    TitleBar.Draggable = true

    local TitleBarCorner = RoundedCorner(12)
    TitleBarCorner.Parent = TitleBar

    -- Make entire title bar draggable - FIXED
    MakeDraggable(NazuXLib.MainFrame, TitleBar)

    -- Logo với animation
    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.BackgroundTransparency = 1
    Logo.Size = UDim2.new(0, 20, 0, 20)
    Logo.Position = UDim2.new(0, 15, 0.5, -10)
    Logo.Image = "rbxassetid://7072716642" -- Default Roblox icon
    Logo.ImageColor3 = Color3.fromRGB(0, 120, 215)
    Logo.Parent = TitleBar

    -- Animated logo rotation
    spawn(function()
        while Logo and Logo.Parent do
            local tween = TweenService:Create(Logo, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                Rotation = 360
            })
            tween:Play()
            tween.Completed:Wait()
            Logo.Rotation = 0
        end
    end)

    -- Title với glow effect
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0.5, 0, 1, 0)
    Title.Position = UDim2.new(0.25, 0, 0, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = WindowName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.TextStrokeTransparency = 0.8
    Title.TextStrokeColor3 = Color3.fromRGB(0, 120, 215)
    Title.Parent = TitleBar

    -- Control Buttons với hover effects
    local ControlButtons = Instance.new("Frame")
    ControlButtons.Name = "ControlButtons"
    ControlButtons.BackgroundTransparency = 1
    ControlButtons.Size = UDim2.new(0, 75, 1, 0)
    ControlButtons.Position = UDim2.new(1, -80, 0, 0)
    ControlButtons.Parent = TitleBar

    -- Minimize Button với animation
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Name = "MinimizeBtn"
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    MinimizeBtn.BorderSizePixel = 0
    MinimizeBtn.Size = UDim2.new(0, 25, 0, 25)
    MinimizeBtn.Position = UDim2.new(0, 0, 0.5, -12.5)
    MinimizeBtn.Font = Enum.Font.GothamBold
    MinimizeBtn.Text = "-"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.TextSize = 16
    MinimizeBtn.Parent = ControlButtons
    MinimizeBtn.AutoButtonColor = false

    local MinimizeCorner = RoundedCorner(6)
    MinimizeCorner.Parent = MinimizeBtn

    -- Close Button với animation
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Name = "CloseBtn"
    CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Size = UDim2.new(0, 25, 0, 25)
    CloseBtn.Position = UDim2.new(0, 50, 0.5, -12.5)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    CloseBtn.TextSize = 16
    CloseBtn.Parent = ControlButtons
    CloseBtn.AutoButtonColor = false

    local CloseCorner = RoundedCorner(6)
    CloseCorner.Parent = CloseBtn

    -- Button hover animations
    local function setupButtonHover(button, hoverColor, textColor)
        local originalColor = button.BackgroundColor3
        local originalTextColor = button.TextColor3
        
        button.MouseEnter:Connect(function()
            local tween = TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = hoverColor,
                TextColor3 = textColor or originalTextColor,
                Size = UDim2.new(0, 28, 0, 28),
                Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset - 1.5, button.Position.Y.Scale, button.Position.Y.Offset - 1.5)
            })
            tween:Play()
        end)
        
        button.MouseLeave:Connect(function()
            local tween = TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = originalColor,
                TextColor3 = originalTextColor,
                Size = UDim2.new(0, 25, 0, 25),
                Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset + 1.5, button.Position.Y.Scale, button.Position.Y.Offset + 1.5)
            })
            tween:Play()
        end)
    end

    setupButtonHover(MinimizeBtn, Color3.fromRGB(80, 80, 80))
    setupButtonHover(CloseBtn, Color3.fromRGB(255, 60, 60), Color3.fromRGB(255, 255, 255))

    -- User Info với animation
    local UserInfo = Instance.new("Frame")
    UserInfo.Name = "UserInfo"
    UserInfo.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    UserInfo.BorderSizePixel = 0
    UserInfo.Size = UDim2.new(1, -20, 0, 70)
    UserInfo.Position = UDim2.new(0, 10, 0, 45)
    UserInfo.Parent = NazuXLib.MainFrame

    local UserInfoCorner = RoundedCorner(10)
    UserInfoCorner.Parent = UserInfo

    -- Avatar với pulse animation
    local Avatar = Instance.new("ImageLabel")
    Avatar.Name = "Avatar"
    Avatar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Avatar.Size = UDim2.new(0, 50, 0, 50)
    Avatar.Position = UDim2.new(0, 10, 0.5, -25)
    Avatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"
    Avatar.Parent = UserInfo

    local AvatarCorner = RoundedCorner(25)
    AvatarCorner.Parent = Avatar

    local AvatarStroke = CreateStroke(2, Color3.fromRGB(0, 120, 215))
    AvatarStroke.Parent = Avatar

    -- Pulse animation for avatar
    spawn(function()
        while Avatar and Avatar.Parent do
            local tween1 = TweenService:Create(AvatarStroke, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Transparency = 0.5
            })
            local tween2 = TweenService:Create(AvatarStroke, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Transparency = 0
            })
            tween1:Play()
            tween1.Completed:Wait()
            tween2:Play()
            tween2.Completed:Wait()
        end
    end)

    -- Username với typing animation
    local Username = Instance.new("TextLabel")
    Username.Name = "Username"
    Username.BackgroundTransparency = 1
    Username.Size = UDim2.new(1, -70, 0.5, 0)
    Username.Position = UDim2.new(0, 70, 0, 10)
    Username.Font = Enum.Font.GothamBold
    Username.Text = ""
    Username.TextColor3 = Color3.fromRGB(255, 255, 255)
    Username.TextSize = 14
    Username.TextXAlignment = Enum.TextXAlignment.Left
    Username.Parent = UserInfo

    -- Typing animation for username
    spawn(function()
        local text = LocalPlayer.Name
        for i = 1, #text do
            Username.Text = string.sub(text, 1, i)
            wait(0.03)
        end
    end)

    -- Display Name
    local DisplayName = Instance.new("TextLabel")
    DisplayName.Name = "DisplayName"
    DisplayName.BackgroundTransparency = 1
    DisplayName.Size = UDim2.new(1, -70, 0.5, 0)
    DisplayName.Position = UDim2.new(0, 70, 0, 35)
    DisplayName.Font = Enum.Font.Gotham
    DisplayName.Text = LocalPlayer.DisplayName
    DisplayName.TextColor3 = Color3.fromRGB(200, 200, 200)
    DisplayName.TextSize = 12
    DisplayName.TextXAlignment = Enum.TextXAlignment.Left
    DisplayName.Parent = UserInfo

    -- Main Content Area
    local MainContent = Instance.new("Frame")
    MainContent.Name = "MainContent"
    MainContent.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainContent.BorderSizePixel = 0
    MainContent.Size = UDim2.new(1, -20, 1, -140)
    MainContent.Position = UDim2.new(0, 10, 0, 125)
    MainContent.Parent = NazuXLib.MainFrame

    local MainContentCorner = RoundedCorner(10)
    MainContentCorner.Parent = MainContent

    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabContainer.BorderSizePixel = 0
    TabContainer.Size = UDim2.new(0, 150, 1, 0)
    TabContainer.Parent = MainContent

    local TabContainerCorner = RoundedCorner(10)
    TabContainerCorner.Parent = TabContainer

    -- Tab Layout
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Name = "TabLayout"
    TabLayout.Padding = UDim.new(0, 8)
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabLayout.Parent = TabContainer

    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Size = UDim2.new(1, -160, 1, -10)
    ContentContainer.Position = UDim2.new(0, 155, 0, 5)
    ContentContainer.Parent = MainContent

    local ContentContainerCorner = RoundedCorner(8)
    ContentContainerCorner.Parent = ContentContainer

    -- Content Scrolling Frame
    local ContentScrolling = Instance.new("ScrollingFrame")
    ContentScrolling.Name = "ContentScrolling"
    ContentScrolling.BackgroundTransparency = 1
    ContentScrolling.BorderSizePixel = 0
    ContentScrolling.Size = UDim2.new(1, -10, 1, -10)
    ContentScrolling.Position = UDim2.new(0, 5, 0, 5)
    ContentScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentScrolling.ScrollBarThickness = 4
    ContentScrolling.ScrollBarImageColor3 = Color3.fromRGB(0, 120, 215)
    ContentScrolling.Parent = ContentContainer

    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Name = "ContentLayout"
    ContentLayout.Padding = UDim.new(0, 12)
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Parent = ContentScrolling

    -- Update scrolling frame size
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentScrolling.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 20)
    end)

    -- Variables
    NazuXLib.Tabs = {}
    NazuXLib.CurrentTab = nil

    -- Control button functions với animations
    MinimizeBtn.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(NazuXLib.MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        tween:Play()
        tween.Completed:Wait()
        NazuXLib.MainFrame.Visible = false
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(NazuXLib.MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            BackgroundTransparency = 1
        })
        tween:Play()
        tween.Completed:Wait()
        NazuXLib.MainScreenGui:Destroy()
    end)

    -- Minimize key với animation
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.LeftControl then
            if NazuXLib.MainFrame.Visible then
                local tween = TweenService:Create(NazuXLib.MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                    Size = UDim2.new(0, 0, 0, 0),
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                })
                tween:Play()
                tween.Completed:Wait()
                NazuXLib.MainFrame.Visible = false
            else
                NazuXLib.MainFrame.Visible = true
                local tween = TweenService:Create(NazuXLib.MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 600, 0, 400),
                    Position = UDim2.new(0.3, 0, 0.3, 0)
                })
                tween:Play()
            end
        end
    end)

    -- Create tab function với animations
    function NazuXLib:CreateTab(tabName)
        local Tab = {}
        Tab.Name = tabName
        Tab.Elements = {}

        -- Tab Button với hover effects
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "Tab"
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(1, -10, 0, 40)
        TabButton.Position = UDim2.new(0, 5, 0, 5 + ((#NazuXLib.Tabs) * 48))
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 13
        TabButton.AutoButtonColor = false
        TabButton.Parent = TabContainer

        local TabButtonCorner = RoundedCorner(8)
        TabButtonCorner.Parent = TabButton

        -- Tab button hover animation
        TabButton.MouseEnter:Connect(function()
            if NazuXLib.CurrentTab ~= Tab then
                local tween = TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(60, 60, 60),
                    TextColor3 = Color3.fromRGB(220, 220, 255)
                })
                tween:Play()
            end
        end)

        TabButton.MouseLeave:Connect(function()
            if NazuXLib.CurrentTab ~= Tab then
                local tween = TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
                tween:Play()
            end
        end)

        -- Pill indicator với animation
        local Pill = Instance.new("Frame")
        Pill.Name = "Pill"
        Pill.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        Pill.BorderSizePixel = 0
        Pill.Size = UDim2.new(0, 4, 0, 0)
        Pill.Position = UDim2.new(0, 3, 0.5, 0)
        Pill.Visible = false
        Pill.Parent = TabButton

        local PillCorner = RoundedCorner(2)
        PillCorner.Parent = Pill

        -- Tab Content
        local TabContent = Instance.new("Frame")
        TabContent.Name = tabName .. "Content"
        TabContent.BackgroundTransparency = 1
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Visible = false
        TabContent.Parent = ContentScrolling

        local TabContentLayout = Instance.new("UIListLayout")
        TabContentLayout.Name = "Layout"
        TabContentLayout.Padding = UDim.new(0, 12)
        TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentLayout.Parent = TabContent

        Tab.Content = TabContent
        Tab.Button = TabButton
        Tab.Pill = Pill

        -- Tab button click event với animations
        TabButton.MouseButton1Click:Connect(function()
            -- Hide all tab contents với animation
            for _, otherTab in pairs(NazuXLib.Tabs) do
                if otherTab ~= Tab then
                    otherTab.Content.Visible = false
                    
                    -- Pill shrink animation
                    local pillTween = TweenService:Create(otherTab.Pill, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 4, 0, 0),
                        BackgroundColor3 = Color3.fromRGB(0, 120, 215)
                    })
                    pillTween:Play()
                    
                    -- Button color animation
                    local buttonTween = TweenService:Create(otherTab.Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    })
                    buttonTween:Play()
                end
            end
            
            -- Show this tab content
            TabContent.Visible = true
            
            -- Pill grow animation
            local pillTween = TweenService:Create(Pill, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 4, 0, 24),
                BackgroundColor3 = Color3.fromRGB(0, 200, 255)
            })
            pillTween:Play()
            
            -- Button active animation
            local buttonTween = TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 60),
                TextColor3 = Color3.fromRGB(220, 220, 255)
            })
            buttonTween:Play()
            
            NazuXLib.CurrentTab = Tab
        end)

        -- Add to tabs
        table.insert(NazuXLib.Tabs, Tab)

        -- Select first tab với animation
        if #NazuXLib.Tabs == 1 then
            wait(0.5) -- Wait for opening animation
            TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            TabContent.Visible = true
            Pill.Visible = true
            Pill.Size = UDim2.new(0, 4, 0, 24)
            Pill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
            NazuXLib.CurrentTab = Tab
            
            -- Entrance animation for first tab content
            TabContent.Position = UDim2.new(0, 20, 0, 0)
            TabContent.Transparency = 0.5
            
            local entranceTween = TweenService:Create(TabContent, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 0, 0, 0),
                Transparency = 0
            })
            entranceTween:Play()
        end

        -- Tab methods với enhanced animations
        function Tab:AddButton(options)
            options = options or {}
            local btnName = options.Name or "Button"
            local callback = options.Callback or function() end

            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Name = btnName .. "Frame"
            ButtonFrame.BackgroundTransparency = 1
            ButtonFrame.Size = UDim2.new(1, 0, 0, 40)
            ButtonFrame.Parent = TabContent

            local Button = Instance.new("TextButton")
            Button.Name = btnName
            Button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.Font = Enum.Font.GothamSemibold
            Button.Text = btnName
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14
            Button.AutoButtonColor = false
            Button.Parent = ButtonFrame

            local ButtonCorner = RoundedCorner(8)
            ButtonCorner.Parent = Button

            local ButtonStroke = CreateStroke(1, Color3.fromRGB(255, 255, 255), 0.8)
            ButtonStroke.Parent = Button

            -- Button hover animation
            Button.MouseEnter:Connect(function()
                local tween = TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(0, 150, 255),
                    Size = UDim2.new(1, -5, 1, -5),
                    Position = UDim2.new(0, 2.5, 0, 2.5)
                })
                tween:Play()
            end)

            Button.MouseLeave:Connect(function()
                local tween = TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(0, 120, 215),
                    Size = UDim2.new(1, 0, 1, 0),
                    Position = UDim2.new(0, 0, 0, 0)
                })
                tween:Play()
            end)

            -- Button click animation
            Button.MouseButton1Click:Connect(function()
                local clickTween1 = TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(0, 200, 255),
                    Size = UDim2.new(1, -10, 1, -10),
                    Position = UDim2.new(0, 5, 0, 5)
                })
                local clickTween2 = TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(0, 150, 255),
                    Size = UDim2.new(1, 0, 1, 0),
                    Position = UDim2.new(0, 0, 0, 0)
                })
                
                clickTween1:Play()
                clickTween1.Completed:Wait()
                clickTween2:Play()
                
                callback()
            end)

            table.insert(Tab.Elements, Button)
            return Button
        end

        function Tab:AddToggle(options)
            options = options or {}
            local toggleName = options.Name or "Toggle"
            local default = options.Default or false
            local callback = options.Callback or function() end

            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = toggleName .. "Frame"
            ToggleFrame.BackgroundTransparency = 1
            ToggleFrame.Size = UDim2.new(1, 0, 0, 35)
            ToggleFrame.Parent = TabContent

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "Label"
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = toggleName
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextSize = 14
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Parent = ToggleFrame

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "Toggle"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Size = UDim2.new(0, 50, 0, 25)
            ToggleButton.Position = UDim2.new(1, -55, 0.5, -12.5)
            ToggleButton.Font = Enum.Font.Gotham
            ToggleButton.Text = ""
            ToggleButton.AutoButtonColor = false
            ToggleButton.Parent = ToggleFrame

            local ToggleCorner = RoundedCorner(12)
            ToggleCorner.Parent = ToggleButton

            local ToggleDot = Instance.new("Frame")
            ToggleDot.Name = "Dot"
            ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDot.BorderSizePixel = 0
            ToggleDot.Size = UDim2.new(0, 21, 0, 21)
            ToggleDot.Position = UDim2.new(0, 2, 0.5, -10.5)
            ToggleDot.Parent = ToggleButton

            local ToggleDotCorner = RoundedCorner(10)
            ToggleDotCorner.Parent = ToggleDot

            local isToggled = default

            local function UpdateToggle()
                if isToggled then
                    local tween1 = TweenService:Create(ToggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(0, 200, 100)
                    })
                    local tween2 = TweenService:Create(ToggleDot, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Position = UDim2.new(1, -23, 0.5, -10.5)
                    })
                    tween1:Play()
                    tween2:Play()
                else
                    local tween1 = TweenService:Create(ToggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    })
                    local tween2 = TweenService:Create(ToggleDot, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Position = UDim2.new(0, 2, 0.5, -10.5)
                    })
                    tween1:Play()
                    tween2:Play()
                end
                callback(isToggled)
            end

            -- Toggle hover effect
            ToggleButton.MouseEnter:Connect(function()
                local hoverColor = isToggled and Color3.fromRGB(0, 230, 120) or Color3.fromRGB(100, 100, 100)
                local tween = TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = hoverColor
                })
                tween:Play()
            end)

            ToggleButton.MouseLeave:Connect(function()
                local normalColor = isToggled and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(80, 80, 80)
                local tween = TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = normalColor
                })
                tween:Play()
            end)

            ToggleButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                UpdateToggle()
            end)

            UpdateToggle()

            table.insert(Tab.Elements, ToggleFrame)
            
            local ToggleObject = {}
            function ToggleObject:Set(value)
                isToggled = value
                UpdateToggle()
            end
            function ToggleObject:Get()
                return isToggled
            end
            
            return ToggleObject
        end

        function Tab:AddSection(sectionName)
            local SectionFrame = Instance.new("Frame")
            SectionFrame.Name = sectionName .. "Section"
            SectionFrame.BackgroundTransparency = 1
            SectionFrame.Size = UDim2.new(1, 0, 0, 50)
            SectionFrame.Parent = TabContent

            local SectionLabel = Instance.new("TextLabel")
            SectionLabel.Name = "Label"
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Size = UDim2.new(1, 0, 0, 25)
            SectionLabel.Font = Enum.Font.GothamBold
            SectionLabel.Text = sectionName
            SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SectionLabel.TextSize = 16
            SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            SectionLabel.Parent = SectionFrame

            local SectionLine = Instance.new("Frame")
            SectionLine.Name = "Line"
            SectionLine.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
            SectionLine.BorderSizePixel = 0
            SectionLine.Size = UDim2.new(0, 0, 0, 2)
            SectionLine.Position = UDim2.new(0, 0, 1, -2)
            SectionLine.Parent = SectionFrame

            -- Animate section line
            local lineTween = TweenService:Create(SectionLine, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 0, 2)
            })
            lineTween:Play()

            table.insert(Tab.Elements, SectionFrame)
            
            local Section = {}
            function Section:AddButton(options)
                return Tab:AddButton(options)
            end
            function Section:AddToggle(options)
                return Tab:AddToggle(options)
            end
            
            return Section
        end

        return Tab
    end

    -- Notification function với animations
    function NazuXLib:Notify(title, content)
        local Notification = Instance.new("Frame")
        Notification.Name = "Notification"
        Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Notification.BorderSizePixel = 0
        Notification.Size = UDim2.new(0, 300, 0, 80)
        Notification.Position = UDim2.new(1, 10, 0.8, 0)
        Notification.Parent = self.MainScreenGui

        local NotificationCorner = RoundedCorner(12)
        NotificationCorner.Parent = Notification

        local NotificationStroke = CreateStroke(2, Color3.fromRGB(0, 120, 215))
        NotificationStroke.Parent = Notification

        local TitleLabel = Instance.new("TextLabel")
        TitleLabel.Name = "Title"
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Size = UDim2.new(1, -20, 0, 25)
        TitleLabel.Position = UDim2.new(0, 10, 0, 5)
        TitleLabel.Font = Enum.Font.GothamBold
        TitleLabel.Text = title
        TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TitleLabel.TextSize = 14
        TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        TitleLabel.Parent = Notification

        local ContentLabel = Instance.new("TextLabel")
        ContentLabel.Name = "Content"
        ContentLabel.BackgroundTransparency = 1
        ContentLabel.Size = UDim2.new(1, -20, 1, -35)
        ContentLabel.Position = UDim2.new(0, 10, 0, 30)
        ContentLabel.Font = Enum.Font.Gotham
        ContentLabel.Text = content
        ContentLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        ContentLabel.TextSize = 12
        ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
        ContentLabel.TextYAlignment = Enum.TextYAlignment.Top
        ContentLabel.TextWrapped = true
        ContentLabel.Parent = Notification

        -- Entrance animation
        local entranceTween = TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, -310, 0.8, 0)
        })
        entranceTween:Play()

        -- Auto remove after 5 seconds
        spawn(function()
            wait(5)
            local exitTween = TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 10, 0.8, 0),
                BackgroundTransparency = 1
            })
            exitTween:Play()
            exitTween.Completed:Wait()
            Notification:Destroy()
        end)
    end

    -- Theme changer function
    function NazuXLib:ChangeTheme(themeName)
        local theme = NazuX.Themes[themeName]
        if theme then
            -- Apply theme to all elements với animation
            local tween = TweenService:Create(NazuXLib.MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = theme.Main
            })
            tween:Play()
        end
    end

    -- Initial notification
    spawn(function()
        wait(1)
        NazuXLib:Notify("Welcome", "NazuX UI Loaded Successfully! 🎉")
    end)

    return NazuXLib
end

return NazuX
