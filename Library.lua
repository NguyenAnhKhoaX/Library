-- NazuX Library - Windows 11 Style UI
-- AMOLED đen trắng + Minimize chỉ còn titlebar

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Themes System
local Themes = {
    Dark = {
        Name = "Dark",
        Background = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(40, 40, 40),
        Tertiary = Color3.fromRGB(50, 50, 50),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(200, 200, 200),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    Light = {
        Name = "Light",
        Background = Color3.fromRGB(242, 242, 242),
        Secondary = Color3.fromRGB(255, 255, 255),
        Tertiary = Color3.fromRGB(230, 230, 230),
        Text = Color3.fromRGB(0, 0, 0),
        SubText = Color3.fromRGB(100, 100, 100),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    AMOLED = {
        Name = "AMOLED",
        Background = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(0, 0, 0),
        Tertiary = Color3.fromRGB(10, 10, 10),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(150, 150, 150),
        Accent = Color3.fromRGB(255, 255, 255)  -- Chỉ có trắng
    },
    Rose = {
        Name = "Rose",
        Background = Color3.fromRGB(25, 23, 36),
        Secondary = Color3.fromRGB(31, 29, 43),
        Tertiary = Color3.fromRGB(38, 35, 53),
        Text = Color3.fromRGB(224, 222, 244),
        SubText = Color3.fromRGB(144, 140, 170),
        Accent = Color3.fromRGB(235, 111, 146)
    },
    Ocean = {
        Name = "Ocean",
        Background = Color3.fromRGB(23, 33, 43),
        Secondary = Color3.fromRGB(30, 41, 51),
        Tertiary = Color3.fromRGB(38, 50, 60),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(180, 200, 220),
        Accent = Color3.fromRGB(0, 180, 216)
    }
}

local CurrentTheme = "Dark"

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

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowName = options.Name or "NazuX Library"
    local SubtitleText = options.Subtitle or "Powered by NazuX"
    local DefaultToggle = options.DefaultToggle or false
    local Size = options.Size or UDim2.new(0, 600, 0, 450)
    local Position = options.Position or UDim2.new(0.5, -300, 0.5, -225)
    
    local NazuXLibrary = {}
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        ResetOnSpawn = false
    })
    
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
    end
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Main Container
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = Themes[CurrentTheme].Background,
        BorderSizePixel = 0,
        Position = Position,
        Size = Size,
        Active = true,
        Draggable = true,
        Parent = ScreenGui
    })
    
    local UICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    local DropShadow = Create("ImageLabel", {
        Name = "DropShadow",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, -15, 0, -15),
        Size = UDim2.new(1, 30, 1, 30),
        Image = "rbxassetid://6015897843",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.5,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        Parent = MainFrame
    })

    -- Loading Screen
    local LoadingScreen = Create("Frame", {
        Name = "LoadingScreen",
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 10,
        Parent = MainFrame
    })
    
    local LoadingContainer = Create("Frame", {
        Name = "LoadingContainer",
        BackgroundColor3 = Themes[CurrentTheme].Background,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 200, 0, 120),
        ZIndex = 11,
        Parent = LoadingScreen
    })
    
    local LoadingContainerCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = LoadingContainer
    })
    
    local LoadingSpinner = Create("ImageLabel", {
        Name = "LoadingSpinner",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.4, 0),
        Size = UDim2.new(0, 40, 0, 40),
        Image = "rbxassetid://3926305904",
        ImageColor3 = Themes[CurrentTheme].Accent,
        ImageRectOffset = Vector2.new(964, 324),
        ImageRectSize = Vector2.new(36, 36),
        ZIndex = 12,
        Parent = LoadingContainer
    })
    
    local LoadingText = Create("TextLabel", {
        Name = "LoadingText",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.75, 0),
        Size = UDim2.new(0.8, 0, 0, 20),
        Font = Enum.Font.GothamSemibold,
        Text = "Đang tải NazuX Library...",
        TextColor3 = Themes[CurrentTheme].Text,
        TextSize = 12,
        ZIndex = 12,
        Parent = LoadingContainer
    })
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Name = "TitleBar",
        BackgroundColor3 = Themes[CurrentTheme].Secondary,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        Parent = MainFrame
    })
    
    local TitleBarUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = TitleBar
    })
    
    local TitleLabel = Create("TextLabel", {
        Name = "TitleLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 5),
        Size = UDim2.new(0, 200, 0, 18),
        Font = Enum.Font.GothamSemibold,
        Text = WindowName,
        TextColor3 = Themes[CurrentTheme].Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    local SubtitleLabel = Create("TextLabel", {
        Name = "SubtitleLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 22),
        Size = UDim2.new(0, 200, 0, 14),
        Font = Enum.Font.Gotham,
        Text = SubtitleText,
        TextColor3 = Themes[CurrentTheme].SubText,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    -- Window Control Buttons - Nút change theme ở GIỮA
    local ChangeThemeButton = Create("TextButton", {
        Name = "ChangeThemeButton",
        BackgroundColor3 = Themes[CurrentTheme].Accent,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -10, 0, 10),
        Size = UDim2.new(0, 20, 0, 20),
        Font = Enum.Font.GothamBold,
        Text = "🎨",
        TextColor3 = CurrentTheme == "AMOLED" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        Parent = TitleBar
    })
    
    local ChangeThemeButtonUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = ChangeThemeButton
    })
    
    local MinimizeButton = Create("TextButton", {
        Name = "MinimizeButton",
        BackgroundColor3 = Color3.fromRGB(255, 196, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(1, -60, 0, 10),
        Size = UDim2.new(0, 20, 0, 20),
        Font = Enum.Font.GothamBold,
        Text = "_",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Parent = TitleBar
    })
    
    local MinimizeButtonUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = MinimizeButton
    })
    
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        BackgroundColor3 = Color3.fromRGB(232, 17, 35),
        BorderSizePixel = 0,
        Position = UDim2.new(1, -30, 0, 10),
        Size = UDim2.new(0, 20, 0, 20),
        Font = Enum.Font.GothamBold,
        Text = "×",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Parent = TitleBar
    })
    
    local CloseButtonUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = CloseButton
    })
    
    -- CONTENT CONTAINER (TẤT CẢ NỘI DUNG SẼ ẨN KHI MINIMIZE)
    local ContentContainer = Create("Frame", {
        Name = "ContentContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(1, 0, 1, -40),
        Parent = MainFrame
    })
    
    -- Left Sidebar (Tabs)
    local LeftSidebar = Create("Frame", {
        Name = "LeftSidebar",
        BackgroundColor3 = Themes[CurrentTheme].Secondary,
        BackgroundTransparency = CurrentTheme == "AMOLED" and 0 or 0.3,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 180, 1, 0),
        Parent = ContentContainer
    })
    
    local SidebarUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = LeftSidebar
    })
    
    -- User Info Section
    local UserInfoFrame = Create("Frame", {
        Name = "UserInfoFrame",
        BackgroundColor3 = Themes[CurrentTheme].Tertiary,
        BackgroundTransparency = CurrentTheme == "AMOLED" and 0.1 or 0.2,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -10, 0, 80),
        Position = UDim2.new(0, 5, 0, 5),
        Parent = LeftSidebar
    })
    
    local UserInfoUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = UserInfoFrame
    })
    
    local Avatar = Create("ImageLabel", {
        Name = "Avatar",
        BackgroundColor3 = Themes[CurrentTheme].Secondary,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 10),
        Size = UDim2.new(0, 40, 0, 40),
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=150&height=150&format=png"
    })
    
    local AvatarUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 20),
        Parent = Avatar
    })
    
    local UsernameLabel = Create("TextLabel", {
        Name = "UsernameLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 60, 0, 15),
        Size = UDim2.new(1, -65, 0, 20),
        Font = Enum.Font.GothamSemibold,
        Text = LocalPlayer.Name,
        TextColor3 = Themes[CurrentTheme].Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd
    })
    
    local UserIdLabel = Create("TextLabel", {
        Name = "UserIdLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 60, 0, 35),
        Size = UDim2.new(1, -65, 0, 15),
        Font = Enum.Font.Gotham,
        Text = "ID: "..LocalPlayer.UserId,
        TextColor3 = Themes[CurrentTheme].SubText,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    Avatar.Parent = UserInfoFrame
    UsernameLabel.Parent = UserInfoFrame
    UserIdLabel.Parent = UserInfoFrame
    
    -- Search Bar
    local SearchContainer = Create("Frame", {
        Name = "SearchContainer",
        BackgroundColor3 = Themes[CurrentTheme].Tertiary,
        BackgroundTransparency = CurrentTheme == "AMOLED" and 0.1 or 0.2,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -10, 0, 35),
        Position = UDim2.new(0, 5, 0, 90),
        Parent = LeftSidebar
    })
    
    local SearchUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = SearchContainer
    })
    
    local SearchBox = Create("TextBox", {
        Name = "SearchBox",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(1, -40, 1, 0),
        Font = Enum.Font.Gotham,
        PlaceholderText = "Tìm kiếm...",
        PlaceholderColor3 = Themes[CurrentTheme].SubText,
        Text = "",
        TextColor3 = Themes[CurrentTheme].Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local SearchIcon = Create("ImageLabel", {
        Name = "SearchIcon",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -25, 0, 7),
        Size = UDim2.new(0, 20, 0, 20),
        Image = "rbxassetid://3926305904",
        ImageColor3 = Themes[CurrentTheme].SubText,
        ImageRectOffset = Vector2.new(964, 324),
        ImageRectSize = Vector2.new(36, 36)
    })
    
    SearchBox.Parent = SearchContainer
    SearchIcon.Parent = SearchContainer
    
    -- Tabs Container
    local TabsContainer = Create("ScrollingFrame", {
        Name = "TabsContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 5, 0, 130),
        Size = UDim2.new(1, -10, 1, -135),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Themes[CurrentTheme].Tertiary,
        Parent = LeftSidebar
    })
    
    local TabsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        Parent = TabsContainer
    })
    
    -- Right Content Area
    local RightContent = Create("Frame", {
        Name = "RightContent",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 185, 0, 0),
        Size = UDim2.new(1, -185, 1, 0),
        Parent = ContentContainer
    })
    
    -- Animation for loading spinner
    local LoadingRotation = 0
    local LoadingConnection = RunService.Heartbeat:Connect(function(delta)
        LoadingRotation = (LoadingRotation + 180 * delta) % 360
        LoadingSpinner.Rotation = LoadingRotation
    end)

    -- Minimize State
    local IsMinimized = false
    local OriginalSize = Size

    -- Theme Management
    local function ApplyTheme(themeName)
        CurrentTheme = themeName
        local theme = Themes[themeName]
        
        -- Apply colors to all elements
        MainFrame.BackgroundColor3 = theme.Background
        TitleBar.BackgroundColor3 = theme.Secondary
        LeftSidebar.BackgroundColor3 = theme.Secondary
        UserInfoFrame.BackgroundColor3 = theme.Tertiary
        SearchContainer.BackgroundColor3 = theme.Tertiary
        LoadingContainer.BackgroundColor3 = theme.Background
        
        -- Điều chỉnh độ trong suốt cho AMOLED
        if themeName == "AMOLED" then
            LeftSidebar.BackgroundTransparency = 0
            UserInfoFrame.BackgroundTransparency = 0.1
            SearchContainer.BackgroundTransparency = 0.1
        else
            LeftSidebar.BackgroundTransparency = 0.3
            UserInfoFrame.BackgroundTransparency = 0.2
            SearchContainer.BackgroundTransparency = 0.2
        end
        
        -- Text colors
        TitleLabel.TextColor3 = theme.Text
        SubtitleLabel.TextColor3 = theme.SubText
        UsernameLabel.TextColor3 = theme.Text
        UserIdLabel.TextColor3 = theme.SubText
        SearchBox.TextColor3 = theme.Text
        SearchBox.PlaceholderColor3 = theme.SubText
        SearchIcon.ImageColor3 = theme.SubText
        LoadingText.TextColor3 = theme.Text
        LoadingSpinner.ImageColor3 = theme.Accent
        
        -- Buttons
        ChangeThemeButton.BackgroundColor3 = theme.Accent
        ChangeThemeButton.TextColor3 = themeName == "AMOLED" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        
        -- Update all tab buttons
        for _, tabButton in pairs(TabsContainer:GetChildren()) do
            if tabButton:IsA("TextButton") then
                if tabButton.BackgroundColor3 == Themes[CurrentTheme].Accent then
                    tabButton.BackgroundColor3 = theme.Accent
                    tabButton.TextColor3 = themeName == "AMOLED" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
                else
                    tabButton.BackgroundColor3 = theme.Tertiary
                    tabButton.TextColor3 = theme.SubText
                end
            end
        end
        
        -- Update scroll bars
        TabsContainer.ScrollBarImageColor3 = theme.Tertiary
    end

    -- Theme Selection Popup
    local ThemePopup = Create("Frame", {
        Name = "ThemePopup",
        BackgroundColor3 = Themes[CurrentTheme].Secondary,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -100, 0.5, -150),
        Size = UDim2.new(0, 200, 0, 250),
        Visible = false,
        ZIndex = 20,
        Parent = ScreenGui
    })
    
    local ThemePopupCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = ThemePopup
    })
    
    local ThemePopupShadow = Create("ImageLabel", {
        Name = "ThemePopupShadow",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, -15, 0, -15),
        Size = UDim2.new(1, 30, 1, 30),
        Image = "rbxassetid://6015897843",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.5,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        ZIndex = 19,
        Parent = ThemePopup
    })
    
    local ThemePopupTitle = Create("TextLabel", {
        Name = "ThemePopupTitle",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 15),
        Size = UDim2.new(1, 0, 0, 25),
        Font = Enum.Font.GothamSemibold,
        Text = "Chọn Theme",
        TextColor3 = Themes[CurrentTheme].Text,
        TextSize = 16,
        ZIndex = 21,
        Parent = ThemePopup
    })
    
    local ThemesList = Create("ScrollingFrame", {
        Name = "ThemesList",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 50),
        Size = UDim2.new(1, -20, 1, -70),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Themes[CurrentTheme].Tertiary,
        ZIndex = 21,
        Parent = ThemePopup
    })
    
    local ThemesListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        Parent = ThemesList
    })
    
    -- Create theme buttons
    for themeName, themeData in pairs(Themes) do
        local ThemeButton = Create("TextButton", {
            Name = themeName .. "ThemeButton",
            BackgroundColor3 = themeData.Accent,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 35),
            Font = Enum.Font.Gotham,
            Text = themeData.Name,
            TextColor3 = themeName == "AMOLED" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255),
            TextSize = 12,
            AutoButtonColor = false,
            ZIndex = 22,
            Parent = ThemesList
        })
        
        local ThemeButtonCorner = Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = ThemeButton
        })
        
        ThemeButton.MouseButton1Click:Connect(function()
            ApplyTheme(themeName)
            ThemePopup.Visible = false
        end)
        
        ThemeButton.MouseEnter:Connect(function()
            if themeName == "AMOLED" then
                Tween(ThemeButton, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}, 0.2)
                Tween(ThemeButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
            else
                Tween(ThemeButton, {BackgroundColor3 = Color3.fromRGB(
                    math.min(themeData.Accent.R * 255 + 30, 255),
                    math.min(themeData.Accent.G * 255 + 30, 255),
                    math.min(themeData.Accent.B * 255 + 30, 255)
                )}, 0.2)
            end
        end)
        
        ThemeButton.MouseLeave:Connect(function()
            ThemeButton.BackgroundColor3 = themeData.Accent
            ThemeButton.TextColor3 = themeName == "AMOLED" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        end)
    end
    
    -- Update themes list size
    ThemesListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ThemesList.CanvasSize = UDim2.new(0, 0, 0, ThemesListLayout.AbsoluteContentSize.Y)
    end)

    -- Functions
    function NazuXLibrary:ToggleUI()
        MainFrame.Visible = not MainFrame.Visible
    end
    
    function NazuXLibrary:Minimize()
        IsMinimized = not IsMinimized
        
        if IsMinimized then
            -- Thu nhỏ: ẩn TOÀN BỘ ContentContainer, chỉ còn TitleBar
            Tween(ContentContainer, {
                Size = UDim2.new(1, 0, 0, 0)
            }, 0.3)
            
            Tween(MainFrame, {
                Size = UDim2.new(OriginalSize.X.Scale, OriginalSize.X.Offset, 0, 40)
            }, 0.3)
        else
            -- Mở rộng: hiện lại TOÀN BỘ ContentContainer
            Tween(ContentContainer, {
                Size = UDim2.new(1, 0, 1, -40)
            }, 0.3)
            
            Tween(MainFrame, {
                Size = OriginalSize
            }, 0.3)
        end
    end
    
    function NazuXLibrary:ShowLoading(duration, text)
        if text then
            LoadingText.Text = text
        end
        LoadingScreen.Visible = true
        
        if duration then
            delay(duration, function()
                self:HideLoading()
            end)
        end
    end
    
    function NazuXLibrary:HideLoading()
        LoadingScreen.Visible = false
    end
    
    function NazuXLibrary:ChangeTheme(themeName)
        if Themes[themeName] then
            ApplyTheme(themeName)
        end
    end
    
    -- Close Button Event
    CloseButton.MouseButton1Click:Connect(function()
        if LoadingConnection then
            LoadingConnection:Disconnect()
        end
        ScreenGui:Destroy()
    end)
    
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(241, 112, 122)}, 0.2)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(232, 17, 35)}, 0.2)
    end)
    
    -- Minimize Button Event
    MinimizeButton.MouseButton1Click:Connect(function()
        NazuXLibrary:Minimize()
    end)
    
    MinimizeButton.MouseEnter:Connect(function()
        Tween(MinimizeButton, {BackgroundColor3 = Color3.fromRGB(255, 213, 0)}, 0.2)
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        Tween(MinimizeButton, {BackgroundColor3 = Color3.fromRGB(255, 196, 0)}, 0.2)
    end)
    
    -- Change Theme Button Event
    ChangeThemeButton.MouseButton1Click:Connect(function()
        ThemePopup.Visible = not ThemePopup.Visible
    end)
    
    ChangeThemeButton.MouseEnter:Connect(function()
        if CurrentTheme == "AMOLED" then
            Tween(ChangeThemeButton, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}, 0.2)
            Tween(ChangeThemeButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
        else
            Tween(ChangeThemeButton, {BackgroundColor3 = Color3.fromRGB(
                math.min(Themes[CurrentTheme].Accent.R * 255 + 30, 255),
                math.min(Themes[CurrentTheme].Accent.G * 255 + 30, 255),
                math.min(Themes[CurrentTheme].Accent.B * 255 + 30, 255)
            )}, 0.2)
        end
    end)
    
    ChangeThemeButton.MouseLeave:Connect(function()
        ChangeThemeButton.BackgroundColor3 = Themes[CurrentTheme].Accent
        ChangeThemeButton.TextColor3 = CurrentTheme == "AMOLED" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    end)
    
    -- Close theme popup when clicking outside
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and ThemePopup.Visible then
            local mousePos = UserInputService:GetMouseLocation()
            local themePopupAbsPos = ThemePopup.AbsolutePosition
            local themePopupSize = ThemePopup.AbsoluteSize
            
            if mousePos.X < themePopupAbsPos.X or mousePos.X > themePopupAbsPos.X + themePopupSize.X or
               mousePos.Y < themePopupAbsPos.Y or mousePos.Y > themePopupAbsPos.Y + themePopupSize.Y then
                ThemePopup.Visible = false
            end
        end
    end)
    
    -- Search Functionality
    local function FilterElements(searchText)
        for _, tabButton in pairs(TabsContainer:GetChildren()) do
            if tabButton:IsA("TextButton") then
                local tabName = tabButton.Name:gsub("TabButton", "")
                if string.find(string.lower(tabName), string.lower(searchText)) or searchText == "" then
                    tabButton.Visible = true
                else
                    tabButton.Visible = false
                end
            end
        end
    end
    
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        FilterElements(SearchBox.Text)
    end)
    
    -- Tab Management
    local CurrentTab = nil
    local TabContents = {}
    
    function NazuXLibrary:CreateTab(TabName)
        local TabButton = Create("TextButton", {
            Name = TabName .. "TabButton",
            BackgroundColor3 = Themes[CurrentTheme].Tertiary,
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 35),
            Font = Enum.Font.Gotham,
            Text = TabName,
            TextColor3 = Themes[CurrentTheme].SubText,
            TextSize = 12,
            AutoButtonColor = false
        })
        
        local TabButtonUICorner = Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = TabButton
        })
        
        local TabContent = Create("ScrollingFrame", {
            Name = TabName .. "Content",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = Themes[CurrentTheme].Tertiary,
            Visible = false
        })
        
        local TabContentListLayout = Create("UIListLayout", {
            Padding = UDim.new(0, 10),
            Parent = TabContent
        })
        
        TabContentListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentListLayout.AbsoluteContentSize.Y + 10)
        end)
        
        TabContent.Parent = RightContent
        TabButton.Parent = TabsContainer
        
        -- Update tabs container size
        TabsContainer.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
        
        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Visible = false
                -- Reset all tab buttons
                for _, btn in pairs(TabsContainer:GetChildren()) do
                    if btn:IsA("TextButton") then
                        Tween(btn, {BackgroundColor3 = Themes[CurrentTheme].Tertiary, TextColor3 = Themes[CurrentTheme].SubText}, 0.2)
                    end
                end
            end
            
            CurrentTab = TabContent
            TabContent.Visible = true
            Tween(TabButton, {BackgroundColor3 = Themes[CurrentTheme].Accent, TextColor3 = CurrentTheme == "AMOLED" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)}, 0.2)
        end)
        
        TabButton.MouseEnter:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(
                    math.min(Themes[CurrentTheme].Tertiary.R * 255 + 10, 255),
                    math.min(Themes[CurrentTheme].Tertiary.G * 255 + 10, 255),
                    math.min(Themes[CurrentTheme].Tertiary.B * 255 + 10, 255)
                )}, 0.2)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {BackgroundColor3 = Themes[CurrentTheme].Tertiary}, 0.2)
            end
        end)
        
        local TabFunctions = {}
        
        -- AddButton Function
        function TabFunctions:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            local ButtonName = ButtonConfig.Name or "Button"
            local Callback = ButtonConfig.Callback or function() end
            
            local ButtonContainer = Create("Frame", {
                Name = ButtonName .. "Container",
                BackgroundColor3 = Themes[CurrentTheme].Secondary,
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -20, 0, 35),
                Parent = TabContent
            })
            
            local ButtonContainerUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = ButtonContainer
            })
            
            local Button = Create("TextButton", {
                Name = ButtonName .. "Button",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ButtonName,
                TextColor3 = Themes[CurrentTheme].Text,
                TextSize = 12,
                Parent = ButtonContainer
            })
            
            Button.MouseButton1Click:Connect(function()
                Callback()
                Tween(ButtonContainer, {BackgroundColor3 = Themes[CurrentTheme].Accent}, 0.1)
                wait(0.1)
                Tween(ButtonContainer, {BackgroundColor3 = Themes[CurrentTheme].Secondary}, 0.1)
            end)
            
            Button.MouseEnter:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(
                    math.min(Themes[CurrentTheme].Secondary.R * 255 + 10, 255),
                    math.min(Themes[CurrentTheme].Secondary.G * 255 + 10, 255),
                    math.min(Themes[CurrentTheme].Secondary.B * 255 + 10, 255)
                )}, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Themes[CurrentTheme].Secondary}, 0.2)
            end)
            
            return ButtonContainer
        end
        
        -- Auto-select first tab
        if not CurrentTab then
            CurrentTab = TabContent
            TabContent.Visible = true
            Tween(TabButton, {BackgroundColor3 = Themes[CurrentTheme].Accent, TextColor3 = CurrentTheme == "AMOLED" and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)}, 0.2)
        end
        
        return TabFunctions
    end
    
    -- Tự động ẩn loading sau 2 giây
    delay(2, function()
        NazuXLibrary:HideLoading()
    end)
    
    return NazuXLibrary
end

return NazuX
