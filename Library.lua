-- NazuX Library - Fixed Tabs & Buttons with Icons & Themes
local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Utility Functions
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

local function Tween(Object, Goals, Duration, Style, Direction)
    local TweenInfo = TweenInfo.new(Duration or 0.3, Style or Enum.EasingStyle.Quad, Direction or Enum.EasingDirection.Out)
    local Tween = TweenService:Create(Object, TweenInfo, Goals)
    Tween:Play()
    return Tween
end

-- Icons Library
local Icons = {
    ["perm_media"] = "http://www.roblox.com/asset/?id=6031215982",
    ["sticky_note_2"] = "http://www.roblox.com/asset/?id=6031265972",
    ["gavel"] = "http://www.roblox.com/asset/?id=6023565902",
    ["table_view"] = "http://www.roblox.com/asset/?id=6031233835",
    ["home"] = "http://www.roblox.com/asset/?id=6026568195",
    -- ... (tất cả các icon khác ở đây)
    ["sparkle"] = "http://www.roblox.com/asset/?id=4483362748"
}

-- Themes System
local Themes = {
    Names = {
        "Dark",
        "Darker", 
        "AMOLED",
        "NazuX",
        "Light",
        "Balloon",
        "SoftCream",
        "Aqua", 
        "Amethyst",
        "Rose",
        "Midnight",
        "Forest",
        "Sunset", 
        "Ocean",
        "Emerald",
        "Sapphire",
        "Cloud",
        "Grape",
        "Bloody",
        "Arctic"
    },
    Dark = {
        Name = "Dark",
        Accent = Color3.fromRGB(96, 205, 255),
        AcrylicMain = Color3.fromRGB(60, 60, 60),
        AcrylicBorder = Color3.fromRGB(90, 90, 90),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
        AcrylicNoise = 0.9,
        TitleBarLine = Color3.fromRGB(75, 75, 75),
        Tab = Color3.fromRGB(120, 120, 120),
        Element = Color3.fromRGB(120, 120, 120),
        ElementBorder = Color3.fromRGB(35, 35, 35),
        InElementBorder = Color3.fromRGB(90, 90, 90),
        ElementTransparency = 0.87,
        ToggleSlider = Color3.fromRGB(120, 120, 120),
        ToggleToggled = Color3.fromRGB(42, 42, 42),
        SliderRail = Color3.fromRGB(120, 120, 120),
        DropdownFrame = Color3.fromRGB(160, 160, 160),
        DropdownHolder = Color3.fromRGB(45, 45, 45),
        DropdownBorder = Color3.fromRGB(35, 35, 35),
        DropdownOption = Color3.fromRGB(120, 120, 120),
        Keybind = Color3.fromRGB(120, 120, 120),
        Input = Color3.fromRGB(160, 160, 160),
        InputFocused = Color3.fromRGB(10, 10, 10),
        InputIndicator = Color3.fromRGB(150, 150, 150),
        Dialog = Color3.fromRGB(45, 45, 45),
        DialogHolder = Color3.fromRGB(35, 35, 35),
        DialogHolderLine = Color3.fromRGB(30, 30, 30),
        DialogButton = Color3.fromRGB(45, 45, 45),
        DialogButtonBorder = Color3.fromRGB(80, 80, 80),
        DialogBorder = Color3.fromRGB(70, 70, 70),
        DialogInput = Color3.fromRGB(55, 55, 55),
        DialogInputLine = Color3.fromRGB(160, 160, 160),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Hover = Color3.fromRGB(120, 120, 120),
        HoverChange = 0.07,
    },
    -- ... (tất cả các theme khác ở đây)
    Arctic = {
        Name = "Arctic",
        Accent = Color3.fromRGB(64, 224, 255),
        AcrylicMain = Color3.fromRGB(10, 18, 25),
        AcrylicBorder = Color3.fromRGB(35, 55, 70),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(15, 25, 35), Color3.fromRGB(18, 30, 40)),
        AcrylicNoise = 0.94,
        TitleBarLine = Color3.fromRGB(45, 70, 90),
        Tab = Color3.fromRGB(70, 110, 140),
        Element = Color3.fromRGB(60, 95, 120),
        ElementBorder = Color3.fromRGB(60, 95, 120),
        InElementBorder = Color3.fromRGB(70, 110, 140),
        ElementTransparency = 0.88,
        ToggleSlider = Color3.fromRGB(90, 140, 180),
        ToggleToggled = Color3.fromRGB(15, 25, 35),
        SliderRail = Color3.fromRGB(90, 140, 180),
        DropdownFrame = Color3.fromRGB(110, 170, 220),
        DropdownHolder = Color3.fromRGB(30, 45, 60),
        DropdownBorder = Color3.fromRGB(60, 95, 120),
        DropdownOption = Color3.fromRGB(90, 140, 180),
        Keybind = Color3.fromRGB(90, 140, 180),
        Input = Color3.fromRGB(90, 140, 180),
        InputFocused = Color3.fromRGB(10, 18, 25),
        InputIndicator = Color3.fromRGB(130, 200, 255),
        InputIndicatorFocus = Color3.fromRGB(64, 224, 255),
        Dialog = Color3.fromRGB(30, 45, 60),
        DialogHolder = Color3.fromRGB(18, 30, 40),
        DialogHolderLine = Color3.fromRGB(15, 25, 35),
        DialogButton = Color3.fromRGB(30, 45, 60),
        DialogButtonBorder = Color3.fromRGB(45, 70, 90),
        DialogBorder = Color3.fromRGB(40, 60, 80),
        DialogInput = Color3.fromRGB(35, 55, 70),
        DialogInputLine = Color3.fromRGB(110, 170, 220),
        Text = Color3.fromRGB(240, 250, 255),
        SubText = Color3.fromRGB(180, 200, 220),
        Hover = Color3.fromRGB(90, 140, 180),
        HoverChange = 0.04
    }
}

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowName = options.Name or "NazuX Hub"
    local Size = options.Size or UDim2.new(0, 700, 0, 500)
    local Position = options.Position or UDim2.new(0.5, -350, 0.5, -250)
    local MinimizeKey = options.MinimizeKey or Enum.KeyCode.RightControl
    
    local NazuXLibrary = {}
    local LocalPlayer = Players.LocalPlayer
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        ResetOnSpawn = false
    })
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Main Container
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = Position,
        Size = Size,
        Active = true,
        Draggable = true,
        Parent = ScreenGui
    })
    
    local UICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = MainFrame
    })
    
    local UIStroke = Create("UIStroke", {
        Color = Color3.fromRGB(60, 60, 60),
        Thickness = 2,
        Parent = MainFrame
    })
    
    -- Title Bar
    local TopFrame = Create("Frame", {
        Name = "TopFrame",
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 45),
        Parent = MainFrame
    })
    
    local UICornerTop = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = TopFrame
    })
    
    local Title = Create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 20, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        Font = Enum.Font.GothamBold,
        Text = WindowName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopFrame
    })
    
    -- Theme Button (mới thêm)
    local ThemeButton = Create("TextButton", {
        Name = "ThemeButton",
        BackgroundColor3 = Color3.fromRGB(80, 180, 80),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -105, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = Enum.Font.GothamBold,
        Text = "🎨",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        AutoButtonColor = false,
        Parent = TopFrame
    })
    
    local ThemeUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = ThemeButton
    })
    
    -- Minimize Button
    local MinimizeButton = Create("TextButton", {
        Name = "MinimizeButton",
        BackgroundColor3 = Color3.fromRGB(255, 180, 0),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -75, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = Enum.Font.GothamBold,
        Text = "_",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        AutoButtonColor = false,
        Parent = TopFrame
    })
    
    local MinimizeUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = MinimizeButton
    })
    
    -- Close Button
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -35, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = Enum.Font.GothamBold,
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        AutoButtonColor = false,
        Parent = TopFrame
    })
    
    local CloseUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = CloseButton
    })
    
    -- Search Bar
    local SearchContainer = Create("Frame", {
        Name = "SearchContainer",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BackgroundTransparency = 0.2,
        Position = UDim2.new(0.25, 0, 0.5, -15),
        Size = UDim2.new(0.35, 0, 0, 30),
        Parent = TopFrame
    })
    
    local SearchCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = SearchContainer
    })
    
    local SearchIcon = Create("TextLabel", {
        Name = "SearchIcon",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 8, 0, 0),
        Size = UDim2.new(0, 20, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "🔍",
        TextColor3 = Color3.fromRGB(150, 150, 150),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SearchContainer
    })
    
    local SearchBox = Create("TextBox", {
        Name = "SearchBox",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 30, 0, 0),
        Size = UDim2.new(1, -35, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "",
        PlaceholderText = "Search features...",
        PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SearchContainer
    })
    
    local ClearSearchButton = Create("TextButton", {
        Name = "ClearSearchButton",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -25, 0, 0),
        Size = UDim2.new(0, 20, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "×",
        TextColor3 = Color3.fromRGB(150, 150, 150),
        TextSize = 16,
        Visible = false,
        AutoButtonColor = false,
        Parent = SearchContainer
    })
    
    -- Left Sidebar với User Info
    local LeftSidebar = Create("Frame", {
        Name = "LeftSidebar",
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 45),
        Size = UDim2.new(0, 180, 1, -45),
        Parent = MainFrame
    })
    
    local SidebarCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = LeftSidebar
    })
    
    -- User Info Frame
    local UserInfoFrame = Create("Frame", {
        Name = "UserInfoFrame",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 10),
        Size = UDim2.new(1, -20, 0, 80),
        Parent = LeftSidebar
    })
    
    local UserInfoCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = UserInfoFrame
    })
    
    local UserInfoStroke = Create("UIStroke", {
        Color = Color3.fromRGB(70, 70, 70),
        Thickness = 1,
        Parent = UserInfoFrame
    })
    
    -- Avatar Thật
    local UserAvatar = Create("ImageLabel", {
        Name = "UserAvatar",
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        Position = UDim2.new(0.5, -20, 0, 10),
        Size = UDim2.new(0, 40, 0, 40),
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=150&height=150&format=png",
        Parent = UserInfoFrame
    })
    
    local AvatarCorner = Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = UserAvatar
    })
    
    local AvatarStroke = Create("UIStroke", {
        Color = Color3.fromRGB(100, 100, 100),
        Thickness = 2,
        Parent = UserAvatar
    })
    
    -- User Info Text
    local UsernameLabel = Create("TextLabel", {
        Name = "UsernameLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 55),
        Size = UDim2.new(1, 0, 0, 16),
        Font = Enum.Font.GothamSemibold,
        Text = "@" .. LocalPlayer.Name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = UserInfoFrame
    })
    
    local UserIdLabel = Create("TextLabel", {
        Name = "UserIdLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 70),
        Size = UDim2.new(1, 0, 0, 12),
        Font = Enum.Font.Gotham,
        Text = "ID: " .. LocalPlayer.UserId,
        TextColor3 = Color3.fromRGB(150, 150, 150),
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = UserInfoFrame
    })
    
    -- Tabs Container - FIXED
    local TabsContainer = Create("ScrollingFrame", {
        Name = "TabsContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 100),
        Size = UDim2.new(1, -20, 1, -110),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
        Parent = LeftSidebar
    })
    
    local TabsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        Parent = TabsContainer
    })
    
    TabsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabsContainer.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
    end)
    
    -- Content Area - FIXED
    local ContentArea = Create("Frame", {
        Name = "ContentArea",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 185, 0, 45),
        Size = UDim2.new(1, -185, 1, -45),
        Parent = MainFrame
    })
    
    -- Search Results Panel
    local SearchResults = Create("ScrollingFrame", {
        Name = "SearchResults",
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 10),
        Size = UDim2.new(1, -20, 1, -20),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
        Visible = false,
        Parent = ContentArea
    })
    
    local SearchResultsLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        Parent = SearchResults
    })
    
    local SearchResultsPadding = Create("UIPadding", {
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        Parent = SearchResults
    })
    
    SearchResultsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        SearchResults.CanvasSize = UDim2.new(0, 0, 0, SearchResultsLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Theme Management System
    local CurrentTheme = "Dark"
    local ThemeElements = {}
    
    local function ApplyTheme(themeName)
        local theme = Themes[themeName]
        if not theme then return end
        
        CurrentTheme = themeName
        
        -- Apply theme to all registered elements
        for _, elementData in pairs(ThemeElements) do
            if elementData.ApplyTheme then
                elementData.ApplyTheme(theme)
            end
        end
        
        -- Apply to main UI elements
        MainFrame.BackgroundColor3 = theme.AcrylicMain
        TopFrame.BackgroundColor3 = theme.AcrylicMain
        LeftSidebar.BackgroundColor3 = theme.AcrylicMain
        UIStroke.Color = theme.AcrylicBorder
        
        -- Update theme button to show current theme
        ThemeButton.Text = "🎨 " .. themeName
    end
    
    -- Register theme elements
    local function RegisterThemeElement(elementData)
        table.insert(ThemeElements, elementData)
        -- Apply current theme immediately
        if elementData.ApplyTheme then
            elementData.ApplyTheme(Themes[CurrentTheme])
        end
    end
    
    -- Theme Button Functionality
    local currentThemeIndex = 1
    
    ThemeButton.MouseEnter:Connect(function()
        Tween(ThemeButton, {
            BackgroundColor3 = Color3.fromRGB(100, 200, 100),
            Size = UDim2.new(0, 26, 0, 26),
            Position = UDim2.new(1, -106, 0.5, -13)
        }, 0.2)
    end)
    
    ThemeButton.MouseLeave:Connect(function()
        Tween(ThemeButton, {
            BackgroundColor3 = Color3.fromRGB(80, 180, 80),
            Size = UDim2.new(0, 24, 0, 24),
            Position = UDim2.new(1, -105, 0.5, -12)
        }, 0.2)
    end)
    
    ThemeButton.MouseButton1Click:Connect(function()
        currentThemeIndex = currentThemeIndex + 1
        if currentThemeIndex > #Themes.Names then
            currentThemeIndex = 1
        end
        
        local nextTheme = Themes.Names[currentThemeIndex]
        ApplyTheme(nextTheme)
        
        -- Animation feedback
        Tween(ThemeButton, {
            Rotation = 360,
            BackgroundColor3 = Themes[nextTheme].Accent
        }, 0.5)
        
        wait(0.5)
        
        Tween(ThemeButton, {
            Rotation = 0
        }, 0.2)
    end)
    
    -- Minimize Key Functionality
    local IsMinimized = false
    local OriginalSize = Size
    local OriginalPosition = Position
    
    local function ToggleMinimize()
        if IsMinimized then
            -- Hiện lại UI
            MainFrame.Visible = true
            Tween(MainFrame, {
                Size = OriginalSize,
                Position = OriginalPosition,
                BackgroundTransparency = 0.1
            }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        else
            -- Ẩn UI
            Tween(MainFrame, {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1
            }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            wait(0.3)
            MainFrame.Visible = false
        end
        IsMinimized = not IsMinimized
    end
    
    -- Minimize Key Binding
    local MinimizeConnection
    if MinimizeKey then
        MinimizeConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode == MinimizeKey then
                ToggleMinimize()
            end
        end)
    end
    
    -- Minimize Button
    MinimizeButton.MouseEnter:Connect(function()
        Tween(MinimizeButton, {
            BackgroundColor3 = Color3.fromRGB(255, 200, 50),
            Size = UDim2.new(0, 26, 0, 26),
            Position = UDim2.new(1, -76, 0.5, -13)
        }, 0.2)
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        Tween(MinimizeButton, {
            BackgroundColor3 = Color3.fromRGB(255, 180, 0),
            Size = UDim2.new(0, 24, 0, 24),
            Position = UDim2.new(1, -75, 0.5, -12)
        }, 0.2)
    end)
    
    MinimizeButton.MouseButton1Click:Connect(function()
        ToggleMinimize()
    end)
    
    -- Search Box Animations
    SearchBox.Focused:Connect(function()
        Tween(SearchContainer, {
            BackgroundTransparency = 0.1,
            Size = UDim2.new(0.4, 0, 0, 30)
        }, 0.3)
        SearchIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    SearchBox.FocusLost:Connect(function()
        Tween(SearchContainer, {
            BackgroundTransparency = 0.2,
            Size = UDim2.new(0.35, 0, 0, 30)
        }, 0.3)
        SearchIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
    end)
    
    -- Clear Search Button
    ClearSearchButton.MouseButton1Click:Connect(function()
        SearchBox.Text = ""
        ClearSearchButton.Visible = false
        NazuXLibrary:ClearSearch()
    end)
    
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        ClearSearchButton.Visible = SearchBox.Text ~= ""
        if SearchBox.Text ~= "" then
            NazuXLibrary:PerformSearch(SearchBox.Text)
        else
            NazuXLibrary:ClearSearch()
        end
    end)
    
    -- Close Button
    local closeDebounce = false
    
    CloseButton.MouseEnter:Connect(function()
        if not closeDebounce then
            Tween(CloseButton, {
                BackgroundColor3 = Color3.fromRGB(240, 80, 80),
                Rotation = 90,
                Size = UDim2.new(0, 26, 0, 26),
                Position = UDim2.new(1, -36, 0.5, -13)
            }, 0.2)
        end
    end)
    
    CloseButton.MouseLeave:Connect(function()
        if not closeDebounce then
            Tween(CloseButton, {
                BackgroundColor3 = Color3.fromRGB(220, 60, 60),
                Rotation = 0,
                Size = UDim2.new(0, 24, 0, 24),
                Position = UDim2.new(1, -35, 0.5, -12)
            }, 0.2)
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        if not closeDebounce then
            closeDebounce = true
            
            Tween(CloseButton, {
                BackgroundColor3 = Color3.fromRGB(255, 100, 100),
                Size = UDim2.new(0, 28, 0, 28),
                Position = UDim2.new(1, -37, 0.5, -14),
                Rotation = 180
            }, 0.2)
            
            wait(0.2)
            
            if MinimizeConnection then
                MinimizeConnection:Disconnect()
            end
            
            Tween(MainFrame, {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1
            }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            
            wait(0.4)
            
            ScreenGui:Destroy()
        end
    end)
    
    -- Tab Management - FIXED HOÀN TOÀN
    local CurrentTab = nil
    local TabContents = {}
    local TabButtons = {}
    local AllElements = {}
    
    function NazuXLibrary:CreateTab(TabName, IconName)
        local TabFunctions = {}
        
        -- Tạo tab button với icon
        local TabButton = Create("Frame", {
            Name = TabName .. "TabButton",
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 45),
            Parent = TabsContainer
        })
        
        local TabButtonUICorner = Create("UICorner", {
            CornerRadius = UDim.new(0, 8),
            Parent = TabButton
        })
        
        local TabButtonStroke = Create("UIStroke", {
            Color = Color3.fromRGB(80, 80, 80),
            Thickness = 1,
            Parent = TabButton
        })
        
        local TabIcon = Create("ImageLabel", {
            Name = "TabIcon",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0.5, -10),
            Size = UDim2.new(0, 20, 0, 20),
            Image = Icons[IconName] or Icons["folder"],
            Parent = TabButton
        })
        
        local TabLabel = Create("TextLabel", {
            Name = "TabLabel",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 40, 0, 0),
            Size = UDim2.new(1, -40, 1, 0),
            Font = Enum.Font.GothamSemibold,
            Text = TabName,
            TextColor3 = Color3.fromRGB(200, 200, 200),
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = TabButton
        })
        
        local TabClickArea = Create("TextButton", {
            Name = "TabClickArea",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Text = "",
            AutoButtonColor = false,
            Parent = TabButton
        })
        
        -- Tạo content cho tab - FIXED
        local TabContent = Create("ScrollingFrame", {
            Name = TabName .. "Content",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
            Visible = false,
            Parent = ContentArea
        })
        
        local TabContentListLayout = Create("UIListLayout", {
            Padding = UDim.new(0, 12),
            Parent = TabContent
        })
        
        local TabContentPadding = Create("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            Parent = TabContent
        })
        
        TabContentListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentListLayout.AbsoluteContentSize.Y + 20)
        end)
        
        TabContents[TabName] = TabContent
        TabButtons[TabName] = TabButton
        
        -- Register tab for themes
        RegisterThemeElement({
            ApplyTheme = function(theme)
                TabButton.BackgroundColor3 = theme.Tab
                TabButtonStroke.Color = theme.ElementBorder
                TabLabel.TextColor3 = theme.Text
            end
        })
        
        -- Tab Button Animations
        TabClickArea.MouseEnter:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {
                    BackgroundColor3 = Color3.fromRGB(70, 70, 70),
                }, 0.2)
                Tween(TabLabel, {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, 0.2)
            end
        end)
        
        TabClickArea.MouseLeave:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {
                    BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                }, 0.2)
                Tween(TabLabel, {
                    TextColor3 = Color3.fromRGB(200, 200, 200)
                }, 0.2)
            end
        end)
        
        -- Tab Click Functionality - FIXED
        TabClickArea.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Visible = false
                
                -- Reset tất cả tab buttons
                for tabName, btn in pairs(TabButtons) do
                    if TabContents[tabName] ~= CurrentTab then
                        Tween(btn, {
                            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                        }, 0.2)
                        Tween(TabLabel, {
                            TextColor3 = Color3.fromRGB(200, 200, 200)
                        }, 0.2)
                    end
                end
            end
            
            -- Hiển thị tab mới
            CurrentTab = TabContent
            TabContent.Visible = true
            SearchResults.Visible = false
            
            -- Highlight tab button mới
            Tween(TabButton, {
                BackgroundColor3 = Color3.fromRGB(0, 120, 215),
            }, 0.2)
            Tween(TabLabel, {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, 0.2)
        end)
        
        -- BUTTON FUNCTION - FIXED HOÀN TOÀN
        function TabFunctions:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            local ButtonName = ButtonConfig.Name or "Button"
            local Callback = ButtonConfig.Callback or function() end
            local ButtonIcon = ButtonConfig.Icon or "radio_button_unchecked"
            
            local ButtonContainer = Create("Frame", {
                Name = ButtonName .. "Container",
                BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 45),
                Parent = TabContent
            })
            
            local ButtonContainerCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 10),
                Parent = ButtonContainer
            })
            
            local ButtonContainerStroke = Create("UIStroke", {
                Color = Color3.fromRGB(70, 70, 70),
                Thickness = 1,
                Parent = ButtonContainer
            })
            
            local ButtonIconLabel = Create("ImageLabel", {
                Name = "ButtonIcon",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 15, 0.5, -10),
                Size = UDim2.new(0, 20, 0, 20),
                Image = Icons[ButtonIcon] or Icons["radio_button_unchecked"],
                Parent = ButtonContainer
            })
            
            local Button = Create("TextButton", {
                Name = ButtonName .. "Button",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 45, 0, 0),
                Size = UDim2.new(1, -45, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ButtonName,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutoButtonColor = false,
                Parent = ButtonContainer
            })
            
            -- Register for themes
            RegisterThemeElement({
                ApplyTheme = function(theme)
                    ButtonContainer.BackgroundColor3 = theme.Element
                    ButtonContainerStroke.Color = theme.ElementBorder
                    Button.TextColor3 = theme.Text
                end
            })
            
            -- Lưu element để search
            local elementData = {
                Type = "Button",
                Name = ButtonName,
                Container = ButtonContainer,
                Tab = TabName,
                Callback = Callback
            }
            table.insert(AllElements, elementData)
            
            -- Button Animations - FIXED
            local buttonDebounce = false
            
            Button.MouseEnter:Connect(function()
                if not buttonDebounce then
                    Tween(ButtonContainer, {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
                        BackgroundTransparency = 0.1
                    }, 0.2)
                end
            end)
            
            Button.MouseLeave:Connect(function()
                if not buttonDebounce then
                    Tween(ButtonContainer, {
                        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                        BackgroundTransparency = 0.2
                    }, 0.2)
                end
            end)
            
            Button.MouseButton1Click:Connect(function()
                if not buttonDebounce then
                    buttonDebounce = true
                    
                    -- Click animation
                    Tween(ButtonContainer, {
                        BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    }, 0.1)
                    
                    wait(0.1)
                    
                    Tween(ButtonContainer, {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    }, 0.1)
                    
                    -- Execute callback
                    Callback()
                    
                    wait(0.2)
                    buttonDebounce = false
                end
            end)
            
            return Button
        end
        
        -- TOGGLE FUNCTION - FIXED
        function TabFunctions:AddToggle(ToggleConfig)
            ToggleConfig = ToggleConfig or {}
            local ToggleName = ToggleConfig.Name or "Toggle"
            local Default = ToggleConfig.Default or false
            local Callback = ToggleConfig.Callback or function() end
            local ToggleIcon = ToggleConfig.Icon or "toggle_off"
            
            local ToggleContainer = Create("Frame", {
                Name = ToggleName .. "Container",
                BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 45),
                Parent = TabContent
            })
            
            local ToggleContainerCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 10),
                Parent = ToggleContainer
            })
            
            local ToggleContainerStroke = Create("UIStroke", {
                Color = Color3.fromRGB(70, 70, 70),
                Thickness = 1,
                Parent = ToggleContainer
            })
            
            local ToggleIconLabel = Create("ImageLabel", {
                Name = "ToggleIcon",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 15, 0.5, -10),
                Size = UDim2.new(0, 20, 0, 20),
                Image = Icons[ToggleIcon] or Icons["toggle_off"],
                Parent = ToggleContainer
            })
            
            local ToggleLabel = Create("TextLabel", {
                Name = "ToggleLabel",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 45, 0, 0),
                Size = UDim2.new(0.7, -45, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ToggleName,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ToggleContainer
            })
            
            local ToggleButton = Create("Frame", {
                Name = "ToggleButton",
                BackgroundColor3 = Default and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(80, 80, 80),
                Position = UDim2.new(0.85, -25, 0.5, -12),
                Size = UDim2.new(0, 50, 0, 24),
                Parent = ToggleContainer
            })
            
            local ToggleButtonCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 12),
                Parent = ToggleButton
            })
            
            local ToggleKnob = Create("Frame", {
                Name = "ToggleKnob",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = Default and UDim2.new(0.5, 0, 0.5, -8) or UDim2.new(0, 4, 0.5, -8),
                Size = UDim2.new(0, 16, 0, 16),
                Parent = ToggleButton
            })
            
            local ToggleKnobCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = ToggleKnob
            })
            
            local ToggleClickArea = Create("TextButton", {
                Name = "ToggleClickArea",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Text = "",
                AutoButtonColor = false,
                Parent = ToggleContainer
            })
            
            local ToggleState = Default
            
            local function UpdateToggle()
                if ToggleState then
                    Tween(ToggleButton, {
                        BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                    }, 0.2)
                    Tween(ToggleKnob, {
                        Position = UDim2.new(0.5, 0, 0.5, -8)
                    }, 0.2)
                else
                    Tween(ToggleButton, {
                        BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    }, 0.2)
                    Tween(ToggleKnob, {
                        Position = UDim2.new(0, 4, 0.5, -8)
                    }, 0.2)
                end
                Callback(ToggleState)
            end
            
            ToggleClickArea.MouseButton1Click:Connect(function()
                ToggleState = not ToggleState
                UpdateToggle()
            end)
            
            -- Register for themes
            RegisterThemeElement({
                ApplyTheme = function(theme)
                    ToggleContainer.BackgroundColor3 = theme.Element
                    ToggleContainerStroke.Color = theme.ElementBorder
                    ToggleLabel.TextColor3 = theme.Text
                    ToggleButton.BackgroundColor3 = ToggleState and theme.ToggleToggled or theme.ToggleSlider
                end
            })
            
            -- Lưu element để search
            local elementData = {
                Type = "Toggle",
                Name = ToggleName,
                Container = ToggleContainer,
                Tab = TabName,
                GetState = function() return ToggleState end,
                SetState = function(value) ToggleState = value UpdateToggle() end
            }
            table.insert(AllElements, elementData)
            
            -- Toggle Container Animations
            ToggleClickArea.MouseEnter:Connect(function()
                Tween(ToggleContainer, {
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45),
                    BackgroundTransparency = 0.1
                }, 0.2)
            end)
            
            ToggleClickArea.MouseLeave:Connect(function()
                Tween(ToggleContainer, {
                    BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                    BackgroundTransparency = 0.2
                }, 0.2)
            end)
            
            UpdateToggle()
            
            local ToggleFunctions = {}
            
            function ToggleFunctions:SetValue(Value)
                ToggleState = Value
                UpdateToggle()
            end
            
            function ToggleFunctions:GetValue()
                return ToggleState
            end
            
            return ToggleFunctions
        end
        
        -- Auto-select tab đầu tiên
        if not CurrentTab then
            CurrentTab = TabContent
            TabContent.Visible = true
            Tween(TabButton, {
                BackgroundColor3 = Color3.fromRGB(0, 120, 215),
            }, 0.2)
            Tween(TabLabel, {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, 0.2)
        end
        
        return TabFunctions
    end
    
    -- SEARCH FUNCTIONS
    function NazuXLibrary:PerformSearch(searchText)
        local searchLower = string.lower(searchText)
        local foundResults = false
        
        -- Ẩn tất cả tab contents
        for _, tabContent in pairs(TabContents) do
            tabContent.Visible = false
        end
        
        -- Hiển thị search results
        SearchResults.Visible = true
        
        -- Xóa kết quả cũ
        for _, child in pairs(SearchResults:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        
        -- Tìm kiếm và hiển thị kết quả
        for _, element in pairs(AllElements) do
            if string.find(string.lower(element.Name), searchLower) then
                foundResults = true
                
                local ResultItem = Create("TextButton", {
                    Name = element.Name .. "Result",
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45),
                    BackgroundTransparency = 0.2,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 50),
                    Font = Enum.Font.Gotham,
                    Text = "",
                    AutoButtonColor = false,
                    Parent = SearchResults
                })
                
                local ResultCorner = Create("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = ResultItem
                })
                
                local ResultStroke = Create("UIStroke", {
                    Color = Color3.fromRGB(80, 80, 80),
                    Thickness = 1,
                    Parent = ResultItem
                })
                
                local Icon = Create("TextLabel", {
                    Name = "Icon",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 15, 0, 0),
                    Size = UDim2.new(0, 30, 1, 0),
                    Font = Enum.Font.Gotham,
                    Text = element.Type == "Button" and "🔘" or element.Type == "Toggle" and "⚡" or "🏷️",
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    TextSize = 16,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = ResultItem
                })
                
                local NameLabel = Create("TextLabel", {
                    Name = "NameLabel",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 50, 0, 8),
                    Size = UDim2.new(0.6, -50, 0, 20),
                    Font = Enum.Font.GothamSemibold,
                    Text = element.Name,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = ResultItem
                })
                
                local TypeLabel = Create("TextLabel", {
                    Name = "TypeLabel",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 50, 0, 28),
                    Size = UDim2.new(0.6, -50, 0, 14),
                    Font = Enum.Font.Gotham,
                    Text = element.Type .. " • " .. element.Tab,
                    TextColor3 = Color3.fromRGB(150, 150, 150),
                    TextSize = 11,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = ResultItem
                })
                
                local ActionButton = Create("TextButton", {
                    Name = "ActionButton",
                    BackgroundColor3 = Color3.fromRGB(0, 120, 215),
                    BackgroundTransparency = 0.2,
                    Position = UDim2.new(0.8, 10, 0.5, -15),
                    Size = UDim2.new(0.2, -20, 0, 30),
                    Font = Enum.Font.Gotham,
                    Text = element.Type == "Button" and "RUN" or element.Type == "Toggle" and "TOGGLE" or "VIEW",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 12,
                    AutoButtonColor = false,
                    Parent = ResultItem
                })
                
                local ActionCorner = Create("UICorner", {
                    CornerRadius = UDim.new(0, 6),
                    Parent = ActionButton
                })
                
                -- Action khi click
                ActionButton.MouseButton1Click:Connect(function()
                    if element.Type == "Button" and element.Callback then
                        element.Callback()
                    elseif element.Type == "Toggle" and element.SetState then
                        local currentState = element.GetState()
                        element.SetState(not currentState)
                        ActionButton.Text = element.GetState() and "ON" or "OFF"
                    end
                    
                    Tween(ResultItem, {
                        BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                    }, 0.3)
                end)
                
                -- Hover effects
                ResultItem.MouseEnter:Connect(function()
                    Tween(ResultItem, {
                        BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                    }, 0.2)
                end)
                
                ResultItem.MouseLeave:Connect(function()
                    Tween(ResultItem, {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    }, 0.2)
                end)
                
                ActionButton.MouseEnter:Connect(function()
                    Tween(ActionButton, {
                        BackgroundColor3 = Color3.fromRGB(0, 140, 255)
                    }, 0.2)
                end)
                
                ActionButton.MouseLeave:Connect(function()
                    Tween(ActionButton, {
                        BackgroundColor3 = Color3.fromRGB(0, 120, 215)
                    }, 0.2)
                end)
            end
        end
        
        -- Hiển thị thông báo nếu không tìm thấy kết quả
        if not foundResults then
            local NoResults = Create("TextLabel", {
                Name = "NoResults",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 100),
                Font = Enum.Font.Gotham,
                Text = "No results found for: \"" .. searchText .. "\"",
                TextColor3 = Color3.fromRGB(150, 150, 150),
                TextSize = 14,
                Parent = SearchResults
            })
        end
    end
    
    function NazuXLibrary:ClearSearch()
        SearchResults.Visible = false
        if CurrentTab then
            CurrentTab.Visible = true
        end
    end
    
    -- Toggle UI Function
    function NazuXLibrary:ToggleUI()
        ToggleMinimize()
    end
    
    -- Change Theme Function
    function NazuXLibrary:ChangeTheme(themeName)
        if Themes[themeName] then
            ApplyTheme(themeName)
        end
    end
    
    -- Get Current Theme Function
    function NazuXLibrary:GetCurrentTheme()
        return CurrentTheme
    end
    
    -- Get Available Themes Function
    function NazuXLibrary:GetAvailableThemes()
        return Themes.Names
    end
    
    -- Destroy Function
    function NazuXLibrary:Destroy()
        if MinimizeConnection then
            MinimizeConnection:Disconnect()
        end
        ScreenGui:Destroy()
    end
    
    -- Apply default theme
    ApplyTheme("Dark")
    
    return NazuXLibrary
end

-- Export Icons and Themes for external use
NazuX.Icons = Icons
NazuX.Themes = Themes

return NazuX
