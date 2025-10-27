-- NazuX Library
-- By: [Your Name]

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
    White = {
        Main = Color3.fromRGB(245, 245, 245),
        Secondary = Color3.fromRGB(230, 230, 230),
        Text = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    Dark = {
        Main = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(25, 25, 25),
        Text = Color3.fromRGB(255, 255, 255),
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
    Yellow = {
        Main = Color3.fromRGB(40, 40, 20),
        Secondary = Color3.fromRGB(30, 30, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 255, 60)
    },
    Green = {
        Main = Color3.fromRGB(20, 40, 20),
        Secondary = Color3.fromRGB(15, 30, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(60, 255, 60)
    },
    Cam = {
        Main = Color3.fromRGB(40, 30, 20),
        Secondary = Color3.fromRGB(30, 22, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 165, 0)
    },
    AMOLED = {
        Main = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(0, 0, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 255, 255)
    },
    Rose = {
        Main = Color3.fromRGB(40, 20, 30),
        Secondary = Color3.fromRGB(30, 15, 22),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 182, 193)
    },
    Github = {
        Main = Color3.fromRGB(36, 41, 46),
        Secondary = Color3.fromRGB(28, 33, 38),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(88, 166, 255)
    }
}

-- Create rounded corner function
local function RoundedCorner(radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

-- Create stroke function
local function CreateStroke(thickness, color)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness
    stroke.Color = color
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return stroke
end

-- Draggable function
local function MakeDraggable(frame, handle)
    local dragging = false
    local dragInput, dragStart, startPos

    local function Update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
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
            Update(input)
        end
    end)
end

-- Notification function
function NazuX:Notify(title, content, duration)
    duration = duration or 5
    
    local Notification = Instance.new("Frame")
    local Background = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Content = Instance.new("TextLabel")
    local CloseBtn = Instance.new("TextButton")
    
    Notification.Name = "Notification"
    Notification.Parent = self.MainScreenGui
    Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Notification.BackgroundTransparency = 1.000
    Notification.Position = UDim2.new(1, 10, 0.8, 0)
    Notification.Size = UDim2.new(0, 300, 0, 120)
    
    Background.Name = "Background"
    Background.Parent = Notification
    Background.BackgroundColor3 = self.CurrentTheme.Main
    Background.BorderSizePixel = 0
    Background.Position = UDim2.new(0, 0, 0, 0)
    Background.Size = UDim2.new(1, 0, 1, 0)
    
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Background
    
    Title.Name = "Title"
    Title.Parent = Background
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0, 15, 0, 10)
    Title.Size = UDim2.new(1, -30, 0, 25)
    Title.Font = Enum.Font.GothamBold
    Title.Text = title
    Title.TextColor3 = self.CurrentTheme.Text
    Title.TextSize = 16.000
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    Content.Name = "Content"
    Content.Parent = Background
    Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Content.BackgroundTransparency = 1.000
    Content.Position = UDim2.new(0, 15, 0, 40)
    Content.Size = UDim2.new(1, -30, 1, -50)
    Content.Font = Enum.Font.Gotham
    Content.Text = content
    Content.TextColor3 = self.CurrentTheme.Text
    Content.TextSize = 14.000
    Content.TextWrapped = true
    Content.TextXAlignment = Enum.TextXAlignment.Left
    Content.TextYAlignment = Enum.TextYAlignment.Top
    
    CloseBtn.Name = "CloseBtn"
    CloseBtn.Parent = Background
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.BackgroundTransparency = 1.000
    CloseBtn.Position = UDim2.new(1, -25, 0, 5)
    CloseBtn.Size = UDim2.new(0, 20, 0, 20)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = self.CurrentTheme.Text
    CloseBtn.TextSize = 14.000
    
    CloseBtn.MouseButton1Click:Connect(function()
        Notification:Destroy()
    end)
    
    -- Animation
    local tweenIn = TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -310, 0.8, 0)
    })
    tweenIn:Play()
    
    wait(duration)
    
    local tweenOut = TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, 10, 0.8, 0)
    })
    tweenOut:Play()
    
    tweenOut.Completed:Connect(function()
        Notification:Destroy()
    end)
end

-- Create new window
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowName = options.Name or "NazuX Window"
    local DefaultTheme = options.Theme or "Dark"
    
    -- Create main GUI
    local NazuXLib = {}
    
    -- Main ScreenGui
    NazuXLib.MainScreenGui = Instance.new("ScreenGui")
    NazuXLib.MainScreenGui.Name = "NazuXLib"
    NazuXLib.MainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    NazuXLib.MainScreenGui.Parent = game.CoreGui
    
    -- Main Frame
    NazuXLib.MainFrame = Instance.new("Frame")
    NazuXLib.MainFrame.Name = "MainFrame"
    NazuXLib.MainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    NazuXLib.MainFrame.BorderSizePixel = 0
    NazuXLib.MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    NazuXLib.MainFrame.Size = UDim2.new(0, 600, 0, 400)
    NazuXLib.MainFrame.Parent = NazuXLib.MainScreenGui
    
    -- Corner
    local MainCorner = RoundedCorner(8)
    MainCorner.Parent = NazuXLib.MainFrame
    
    -- Stroke
    local MainStroke = CreateStroke(1, Color3.fromRGB(60, 60, 60))
    MainStroke.Parent = NazuXLib.MainFrame
    
    -- Drag handle (bottom area)
    local DragHandle = Instance.new("Frame")
    DragHandle.Name = "DragHandle"
    DragHandle.BackgroundTransparency = 1
    DragHandle.Size = UDim2.new(1, 0, 0, 10)
    DragHandle.Position = UDim2.new(0, 0, 1, -10)
    DragHandle.Parent = NazuXLib.MainFrame
    
    MakeDraggable(NazuXLib.MainFrame, DragHandle)
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(1, 0, 0, 35)
    TitleBar.Parent = NazuXLib.MainFrame
    
    local TitleBarCorner = RoundedCorner(8)
    TitleBarCorner.Parent = TitleBar
    
    -- Logo
    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.BackgroundTransparency = 1
    Logo.Size = UDim2.new(0, 20, 0, 20)
    Logo.Position = UDim2.new(0, 10, 0.5, -10)
    Logo.Image = "rbxassetid://0" -- Add your logo ID here
    Logo.Parent = TitleBar
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 35, 0, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = WindowName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Center
    Title.Parent = TitleBar
    
    -- Search Bar
    local SearchBar = Instance.new("TextBox")
    SearchBar.Name = "SearchBar"
    SearchBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SearchBar.BorderSizePixel = 0
    SearchBar.Size = UDim2.new(0, 200, 0, 25)
    SearchBar.Position = UDim2.new(0.5, -100, 0.5, -12.5)
    SearchBar.Font = Enum.Font.Gotham
    SearchBar.PlaceholderText = "Search..."
    SearchBar.Text = ""
    SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBar.TextSize = 12
    SearchBar.Parent = TitleBar
    
    local SearchCorner = RoundedCorner(4)
    SearchCorner.Parent = SearchBar
    
    -- Control Buttons
    local ControlButtons = Instance.new("Frame")
    ControlButtons.Name = "ControlButtons"
    ControlButtons.BackgroundTransparency = 1
    ControlButtons.Size = UDim2.new(0, 75, 1, 0)
    ControlButtons.Position = UDim2.new(1, -80, 0, 0)
    ControlButtons.Parent = TitleBar
    
    -- Minimize Button
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Name = "MinimizeBtn"
    MinimizeBtn.BackgroundTransparency = 1
    MinimizeBtn.Size = UDim2.new(0, 25, 1, 0)
    MinimizeBtn.Position = UDim2.new(0, 0, 0, 0)
    MinimizeBtn.Font = Enum.Font.GothamBold
    MinimizeBtn.Text = "-"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.TextSize = 16
    MinimizeBtn.Parent = ControlButtons
    
    -- Square Button
    local SquareBtn = Instance.new("TextButton")
    SquareBtn.Name = "SquareBtn"
    SquareBtn.BackgroundTransparency = 1
    SquareBtn.Size = UDim2.new(0, 25, 1, 0)
    SquareBtn.Position = UDim2.new(0, 25, 0, 0)
    SquareBtn.Font = Enum.Font.GothamBold
    SquareBtn.Text = "□"
    SquareBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SquareBtn.TextSize = 12
    SquareBtn.Parent = ControlButtons
    
    -- Close Button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Name = "CloseBtn"
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Size = UDim2.new(0, 25, 1, 0)
    CloseBtn.Position = UDim2.new(0, 50, 0, 0)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    CloseBtn.TextSize = 16
    CloseBtn.Parent = ControlButtons
    
    -- User Info
    local UserInfo = Instance.new("Frame")
    UserInfo.Name = "UserInfo"
    UserInfo.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    UserInfo.BorderSizePixel = 0
    UserInfo.Size = UDim2.new(1, -20, 0, 60)
    UserInfo.Position = UDim2.new(0, 10, 0, 45)
    UserInfo.Parent = NazuXLib.MainFrame
    
    local UserInfoCorner = RoundedCorner(8)
    UserInfoCorner.Parent = UserInfo
    
    -- Avatar
    local Avatar = Instance.new("ImageLabel")
    Avatar.Name = "Avatar"
    Avatar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Avatar.Size = UDim2.new(0, 40, 0, 40)
    Avatar.Position = UDim2.new(0, 10, 0.5, -20)
    Avatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"
    Avatar.Parent = UserInfo
    
    local AvatarCorner = RoundedCorner(20)
    AvatarCorner.Parent = Avatar
    
    -- Username
    local Username = Instance.new("TextLabel")
    Username.Name = "Username"
    Username.BackgroundTransparency = 1
    Username.Size = UDim2.new(1, -70, 0.5, 0)
    Username.Position = UDim2.new(0, 60, 0, 5)
    Username.Font = Enum.Font.GothamBold
    Username.Text = LocalPlayer.Name
    Username.TextColor3 = Color3.fromRGB(255, 255, 255)
    Username.TextSize = 14
    Username.TextXAlignment = Enum.TextXAlignment.Left
    Username.Parent = UserInfo
    
    -- Display Name
    local DisplayName = Instance.new("TextLabel")
    DisplayName.Name = "DisplayName"
    DisplayName.BackgroundTransparency = 1
    DisplayName.Size = UDim2.new(1, -70, 0.5, 0)
    DisplayName.Position = UDim2.new(0, 60, 0, 25)
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
    MainContent.Position = UDim2.new(0, 10, 0, 115)
    MainContent.Parent = NazuXLib.MainFrame
    
    local MainContentCorner = RoundedCorner(8)
    MainContentCorner.Parent = MainContent
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabContainer.BorderSizePixel = 0
    TabContainer.Size = UDim2.new(0, 150, 1, 0)
    TabContainer.Parent = MainContent
    
    local TabContainerCorner = RoundedCorner(8)
    TabContainerCorner.Parent = TabContainer
    
    -- Tab Layout
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Name = "TabLayout"
    TabLayout.Padding = UDim.new(0, 5)
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
    ContentScrolling.ScrollBarThickness = 3
    ContentScrolling.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
    ContentScrolling.Parent = ContentContainer
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Name = "ContentLayout"
    ContentLayout.Padding = UDim.new(0, 10)
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Parent = ContentScrolling
    
    -- Update scrolling frame size
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentScrolling.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
    end)
    
    -- Variables
    NazuXLib.Tabs = {}
    NazuXLib.CurrentTab = nil
    NazuXLib.CurrentTheme = NazuX.Themes[DefaultTheme]
    
    -- Apply theme function
    function NazuXLib:ApplyTheme(themeName)
        local theme = NazuX.Themes[themeName]
        if theme then
            NazuXLib.CurrentTheme = theme
            
            -- Apply theme to all elements
            NazuXLib.MainFrame.BackgroundColor3 = theme.Main
            TitleBar.BackgroundColor3 = theme.Secondary
            UserInfo.BackgroundColor3 = theme.Secondary
            TabContainer.BackgroundColor3 = theme.Secondary
            ContentContainer.BackgroundColor3 = theme.Main
            
            -- Update text colors
            Title.TextColor3 = theme.Text
            Username.TextColor3 = theme.Text
            DisplayName.TextColor3 = theme.Text
            
            -- Update search bar
            SearchBar.BackgroundColor3 = theme.Main
            SearchBar.TextColor3 = theme.Text
            SearchBar.PlaceholderColor3 = Color3.fromRGB(theme.Text.R * 0.7, theme.Text.G * 0.7, theme.Text.B * 0.7)
        end
    end
    
    -- Apply default theme
    NazuXLib:ApplyTheme(DefaultTheme)
    
    -- Control button functions
    MinimizeBtn.MouseButton1Click:Connect(function()
        NazuXLib.MainFrame.Visible = false
    end)
    
    SquareBtn.MouseButton1Click:Connect(function()
        if NazuXLib.MainFrame.Size == UDim2.new(0, 600, 0, 400) then
            NazuXLib.MainFrame.Size = UDim2.new(0, 800, 0, 500)
        else
            NazuXLib.MainFrame.Size = UDim2.new(0, 600, 0, 400)
        end
    end)
    
    CloseBtn.MouseButton1Click:Connect(function()
        NazuXLib.MainScreenGui:Destroy()
    end)
    
    -- Minimize key
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.LeftControl then
            NazuXLib.MainFrame.Visible = not NazuXLib.MainFrame.Visible
        end
    end)
    
    -- Search function
    SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = string.lower(SearchBar.Text)
        
        for _, tab in pairs(NazuXLib.Tabs) do
            for _, element in pairs(tab.Elements) do
                if element:IsA("TextLabel") or element:IsA("TextButton") then
                    local elementText = string.lower(element.Text)
                    if string.find(elementText, searchText) then
                        element.Visible = true
                    else
                        element.Visible = false
                    end
                end
            end
        end
    end)
    
    -- Create tab function
    function NazuXLib:CreateTab(tabName)
        local Tab = {}
        Tab.Name = tabName
        Tab.Elements = {}
        
        -- Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "Tab"
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(1, -10, 0, 35)
        TabButton.Position = UDim2.new(0, 5, 0, 5 + (#NazuXLib.Tabs * 40))
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 14
        TabButton.Parent = TabContainer
        
        local TabButtonCorner = RoundedCorner(6)
        TabButtonCorner.Parent = TabButton
        
        -- Pill indicator
        local Pill = Instance.new("Frame")
        Pill.Name = "Pill"
        Pill.BackgroundColor3 = NazuXLib.CurrentTheme.Accent
        Pill.BorderSizePixel = 0
        Pill.Size = UDim2.new(0, 3, 0.6, 0)
        Pill.Position = UDim2.new(0, 3, 0.2, 0)
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
        TabContentLayout.Padding = UDim.new(0, 10)
        TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentLayout.Parent = TabContent
        
        Tab.Content = TabContent
        Tab.Button = TabButton
        Tab.Pill = Pill
        
        -- Tab button click event
        TabButton.MouseButton1Click:Connect(function()
            -- Hide all tab contents
            for _, otherTab in pairs(NazuXLib.Tabs) do
                otherTab.Content.Visible = false
                otherTab.Pill.Visible = false
                otherTab.Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end
            
            -- Show this tab content
            TabContent.Visible = true
            Pill.Visible = true
            TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            
            NazuXLib.CurrentTab = Tab
        end)
        
        -- Add to tabs
        table.insert(NazuXLib.Tabs, Tab)
        
        -- Select first tab
        if #NazuXLib.Tabs == 1 then
            TabButton.MouseButton1Click:Wait()
        end
        
        -- Tab methods
        function Tab:AddButton(options)
            options = options or {}
            local btnName = options.Name or "Button"
            local callback = options.Callback or function() end
            
            local Button = Instance.new("TextButton")
            Button.Name = btnName
            Button.BackgroundColor3 = NazuXLib.CurrentTheme.Accent
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, -20, 0, 35)
            Button.Font = Enum.Font.Gotham
            Button.Text = btnName
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14
            Button.Parent = TabContent
            
            local ButtonCorner = RoundedCorner(6)
            ButtonCorner.Parent = Button
            
            Button.MouseButton1Click:Connect(function()
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
            
            local Toggle = Instance.new("Frame")
            Toggle.Name = toggleName
            Toggle.BackgroundTransparency = 1
            Toggle.Size = UDim2.new(1, -20, 0, 30)
            Toggle.Parent = TabContent
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "Label"
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = toggleName
            ToggleLabel.TextColor3 = NazuXLib.CurrentTheme.Text
            ToggleLabel.TextSize = 14
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Parent = Toggle
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "Toggle"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Size = UDim2.new(0, 40, 0, 20)
            ToggleButton.Position = UDim2.new(1, -40, 0.5, -10)
            ToggleButton.Font = Enum.Font.Gotham
            ToggleButton.Text = ""
            ToggleButton.Parent = Toggle
            
            local ToggleCorner = RoundedCorner(10)
            ToggleCorner.Parent = ToggleButton
            
            local ToggleDot = Instance.new("Frame")
            ToggleDot.Name = "Dot"
            ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDot.BorderSizePixel = 0
            ToggleDot.Size = UDim2.new(0, 16, 0, 16)
            ToggleDot.Position = UDim2.new(0, 2, 0.5, -8)
            ToggleDot.Parent = ToggleButton
            
            local ToggleDotCorner = RoundedCorner(8)
            ToggleDotCorner.Parent = ToggleDot
            
            local isToggled = default
            
            local function UpdateToggle()
                if isToggled then
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                        BackgroundColor3 = NazuXLib.CurrentTheme.Accent
                    }):Play()
                    TweenService:Create(ToggleDot, TweenInfo.new(0.2), {
                        Position = UDim2.new(1, -18, 0.5, -8)
                    }):Play()
                else
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    }):Play()
                    TweenService:Create(ToggleDot, TweenInfo.new(0.2), {
                        Position = UDim2.new(0, 2, 0.5, -8)
                    }):Play()
                end
                callback(isToggled)
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                UpdateToggle()
            end)
            
            UpdateToggle()
            
            table.insert(Tab.Elements, Toggle)
            return Toggle
        end
        
        function Tab:AddSlider(options)
            options = options or {}
            local sliderName = options.Name or "Slider"
            local min = options.Min or 0
            local max = options.Max or 100
            local default = options.Default or 50
            local callback = options.Callback or function() end
            
            local Slider = Instance.new("Frame")
            Slider.Name = sliderName
            Slider.BackgroundTransparency = 1
            Slider.Size = UDim2.new(1, -20, 0, 50)
            Slider.Parent = TabContent
            
            local SliderLabel = Instance.new("TextLabel")
            SliderLabel.Name = "Label"
            SliderLabel.BackgroundTransparency = 1
            SliderLabel.Size = UDim2.new(1, 0, 0, 20)
            SliderLabel.Font = Enum.Font.Gotham
            SliderLabel.Text = sliderName
            SliderLabel.TextColor3 = NazuXLib.CurrentTheme.Text
            SliderLabel.TextSize = 14
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            SliderLabel.Parent = Slider
            
            local SliderBackground = Instance.new("Frame")
            SliderBackground.Name = "Background"
            SliderBackground.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            SliderBackground.BorderSizePixel = 0
            SliderBackground.Size = UDim2.new(1, 0, 0, 6)
            SliderBackground.Position = UDim2.new(0, 0, 1, -15)
            SliderBackground.Parent = Slider
            
            local SliderBackgroundCorner = RoundedCorner(3)
            SliderBackgroundCorner.Parent = SliderBackground
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Name = "Fill"
            SliderFill.BackgroundColor3 = NazuXLib.CurrentTheme.Accent
            SliderFill.BorderSizePixel = 0
            SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            SliderFill.Parent = SliderBackground
            
            local SliderFillCorner = RoundedCorner(3)
            SliderFillCorner.Parent = SliderFill
            
            local SliderValue = Instance.new("TextLabel")
            SliderValue.Name = "Value"
            SliderValue.BackgroundTransparency = 1
            SliderValue.Size = UDim2.new(0, 50, 0, 20)
            SliderValue.Position = UDim2.new(1, -50, 0, 0)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text = tostring(default)
            SliderValue.TextColor3 = NazuXLib.CurrentTheme.Text
            SliderValue.TextSize = 14
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right
            SliderValue.Parent = Slider
            
            local isSliding = false
            local currentValue = default
            
            local function UpdateSlider(value)
                value = math.clamp(value, min, max)
                currentValue = value
                SliderFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                SliderValue.Text = tostring(math.floor(value))
                callback(value)
            end
            
            SliderBackground.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    isSliding = true
                end
            end)
            
            SliderBackground.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    isSliding = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if isSliding and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
                    local sliderPos = SliderBackground.AbsolutePosition
                    local sliderSize = SliderBackground.AbsoluteSize
                    
                    local relativeX = (mousePos.X - sliderPos.X) / sliderSize.X
                    relativeX = math.clamp(relativeX, 0, 1)
                    
                    local value = min + (max - min) * relativeX
                    UpdateSlider(value)
                end
            end)
            
            UpdateSlider(default)
            
            table.insert(Tab.Elements, Slider)
            return Slider
        end
        
        function Tab:AddSection(sectionName)
            local Section = {}
            
            local SectionFrame = Instance.new("Frame")
            SectionFrame.Name = sectionName .. "Section"
            SectionFrame.BackgroundTransparency = 1
            SectionFrame.Size = UDim2.new(1, -20, 0, 30)
            SectionFrame.Parent = TabContent
            
            local SectionLabel = Instance.new("TextLabel")
            SectionLabel.Name = "Label"
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Size = UDim2.new(1, 0, 1, 0)
            SectionLabel.Font = Enum.Font.GothamBold
            SectionLabel.Text = sectionName
            SectionLabel.TextColor3 = NazuXLib.CurrentTheme.Text
            SectionLabel.TextSize = 16
            SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            SectionLabel.Parent = SectionFrame
            
            local SectionLine = Instance.new("Frame")
            SectionLine.Name = "Line"
            SectionLine.BackgroundColor3 = NazuXLib.CurrentTheme.Accent
            SectionLine.BorderSizePixel = 0
            SectionLine.Size = UDim2.new(1, 0, 0, 2)
            SectionLine.Position = UDim2.new(0, 0, 1, -2)
            SectionLine.Parent = SectionFrame
            
            Section.Frame = SectionFrame
            
            function Section:AddButton(options)
                return Tab:AddButton(options)
            end
            
            function Section:AddToggle(options)
                return Tab:AddToggle(options)
            end
            
            function Section:AddSlider(options)
                return Tab:AddSlider(options)
            end
            
            table.insert(Tab.Elements, SectionFrame)
            return Section
        end
        
        return Tab
    end
    
    return NazuXLib
end

return NazuX
