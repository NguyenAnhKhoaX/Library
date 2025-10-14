-- NazuX Library - Windows 11 Style UI
-- Added Theme Change Button

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Colors
local AccentColor = Color3.fromRGB(0, 120, 215)
local DarkTheme = {
    Background = Color3.fromRGB(32, 32, 32),
    Secondary = Color3.fromRGB(40, 40, 40),
    Tertiary = Color3.fromRGB(50, 50, 50),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(200, 200, 200)
}

local LightTheme = {
    Background = Color3.fromRGB(240, 240, 240),
    Secondary = Color3.fromRGB(220, 220, 220),
    Tertiary = Color3.fromRGB(200, 200, 200),
    Text = Color3.fromRGB(0, 0, 0),
    SubText = Color3.fromRGB(80, 80, 80)
}

local CurrentTheme = DarkTheme

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
    
    -- Main Container (Hiển thị ngay)
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = CurrentTheme.Background,
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

    -- Transparent Loading Screen (trên cùng MainFrame)
    local LoadingScreen = Create("Frame", {
        Name = "LoadingScreen",
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.7, -- Trong suốt
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 10,
        Parent = MainFrame
    })
    
    local LoadingContainer = Create("Frame", {
        Name = "LoadingContainer",
        BackgroundColor3 = CurrentTheme.Background,
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
        ImageColor3 = AccentColor,
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
        Text = "Loading NazuX Library...",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        ZIndex = 12,
        Parent = LoadingContainer
    })
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Name = "TitleBar",
        BackgroundColor3 = CurrentTheme.Secondary,
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
        TextColor3 = CurrentTheme.Text,
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
        TextColor3 = CurrentTheme.SubText,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    -- Theme Change Button (ở giữa titlebar)
    local ThemeButton = Create("TextButton", {
        Name = "ThemeButton",
        BackgroundColor3 = AccentColor,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -40, 0, 10),
        Size = UDim2.new(0, 80, 0, 20),
        Font = Enum.Font.Gotham,
        Text = "Dark Theme",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 11,
        Parent = TitleBar
    })
    
    local ThemeButtonUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = ThemeButton
    })
    
    -- Close Button
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
    
    -- Content Area
    local ContentArea = Create("Frame", {
        Name = "ContentArea",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(1, 0, 1, -40),
        Parent = MainFrame
    })
    
    -- Left Sidebar (Tabs)
    local LeftSidebar = Create("Frame", {
        Name = "LeftSidebar",
        BackgroundColor3 = CurrentTheme.Secondary,
        BackgroundTransparency = 0.3, -- Trong suốt
        BorderSizePixel = 0,
        Size = UDim2.new(0, 180, 1, 0),
        Parent = ContentArea
    })
    
    local SidebarUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = LeftSidebar
    })
    
    -- User Info Section
    local UserInfoFrame = Create("Frame", {
        Name = "UserInfoFrame",
        BackgroundColor3 = CurrentTheme.Tertiary,
        BackgroundTransparency = 0.2,
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
        BackgroundColor3 = CurrentTheme.Secondary,
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
        TextColor3 = CurrentTheme.Text,
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
        TextColor3 = CurrentTheme.SubText,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    Avatar.Parent = UserInfoFrame
    UsernameLabel.Parent = UserInfoFrame
    UserIdLabel.Parent = UserInfoFrame
    
    -- Search Bar
    local SearchContainer = Create("Frame", {
        Name = "SearchContainer",
        BackgroundColor3 = CurrentTheme.Tertiary,
        BackgroundTransparency = 0.2,
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
        PlaceholderText = "Search...",
        PlaceholderColor3 = CurrentTheme.SubText,
        Text = "",
        TextColor3 = CurrentTheme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local SearchIcon = Create("ImageLabel", {
        Name = "SearchIcon",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -25, 0, 7),
        Size = UDim2.new(0, 20, 0, 20),
        Image = "rbxassetid://3926305904",
        ImageColor3 = CurrentTheme.SubText,
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
        ScrollBarImageColor3 = CurrentTheme.Tertiary,
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
        Parent = ContentArea
    })
    
    -- Animation for loading spinner
    local LoadingRotation = 0
    local LoadingConnection = RunService.Heartbeat:Connect(function(delta)
        LoadingRotation = (LoadingRotation + 180 * delta) % 360
        LoadingSpinner.Rotation = LoadingRotation
    end)

    -- Theme Management
    local function UpdateTheme()
        -- Update Main Frame
        Tween(MainFrame, {BackgroundColor3 = CurrentTheme.Background}, 0.3)
        Tween(TitleBar, {BackgroundColor3 = CurrentTheme.Secondary}, 0.3)
        Tween(LeftSidebar, {BackgroundColor3 = CurrentTheme.Secondary}, 0.3)
        
        -- Update Text Colors
        Tween(TitleLabel, {TextColor3 = CurrentTheme.Text}, 0.3)
        Tween(SubtitleLabel, {TextColor3 = CurrentTheme.SubText}, 0.3)
        Tween(UsernameLabel, {TextColor3 = CurrentTheme.Text}, 0.3)
        Tween(UserIdLabel, {TextColor3 = CurrentTheme.SubText}, 0.3)
        Tween(SearchBox, {TextColor3 = CurrentTheme.Text, PlaceholderColor3 = CurrentTheme.SubText}, 0.3)
        Tween(SearchIcon, {ImageColor3 = CurrentTheme.SubText}, 0.3)
        
        -- Update Containers
        Tween(UserInfoFrame, {BackgroundColor3 = CurrentTheme.Tertiary}, 0.3)
        Tween(SearchContainer, {BackgroundColor3 = CurrentTheme.Tertiary}, 0.3)
        Tween(Avatar, {BackgroundColor3 = CurrentTheme.Secondary}, 0.3)
        
        -- Update Loading Screen
        Tween(LoadingContainer, {BackgroundColor3 = CurrentTheme.Background}, 0.3)
        
        -- Update Theme Button Text
        if CurrentTheme == DarkTheme then
            ThemeButton.Text = "Light Theme"
        else
            ThemeButton.Text = "Dark Theme"
        end
    end

    -- Functions
    function NazuXLibrary:ToggleUI()
        MainFrame.Visible = not MainFrame.Visible
    end
    
    function NazuXLibrary:ToggleTheme()
        if CurrentTheme == DarkTheme then
            CurrentTheme = LightTheme
        else
            CurrentTheme = DarkTheme
        end
        UpdateTheme()
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
    
    -- Theme Button Event
    ThemeButton.MouseButton1Click:Connect(function()
        NazuXLibrary:ToggleTheme()
    end)
    
    ThemeButton.MouseEnter:Connect(function()
        Tween(ThemeButton, {BackgroundColor3 = Color3.fromRGB(0, 140, 255)}, 0.2)
    end)
    
    ThemeButton.MouseLeave:Connect(function()
        Tween(ThemeButton, {BackgroundColor3 = AccentColor}, 0.2)
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
            BackgroundColor3 = CurrentTheme.Tertiary,
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 35),
            Font = Enum.Font.Gotham,
            Text = TabName,
            TextColor3 = CurrentTheme.SubText,
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
            ScrollBarImageColor3 = CurrentTheme.Tertiary,
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
                        Tween(btn, {BackgroundColor3 = CurrentTheme.Tertiary, TextColor3 = CurrentTheme.SubText}, 0.2)
                    end
                end
            end
            
            CurrentTab = TabContent
            TabContent.Visible = true
            Tween(TabButton, {BackgroundColor3 = AccentColor, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
        end)
        
        TabButton.MouseEnter:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, 0.2)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {BackgroundColor3 = CurrentTheme.Tertiary}, 0.2)
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
                BackgroundColor3 = CurrentTheme.Secondary,
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
                TextColor3 = CurrentTheme.Text,
                TextSize = 12,
                Parent = ButtonContainer
            })
            
            Button.MouseButton1Click:Connect(function()
                Callback()
                Tween(ButtonContainer, {BackgroundColor3 = AccentColor}, 0.1)
                wait(0.1)
                Tween(ButtonContainer, {BackgroundColor3 = CurrentTheme.Secondary}, 0.1)
            end)
            
            Button.MouseEnter:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = CurrentTheme.Secondary}, 0.2)
            end)
            
            return ButtonContainer
        end
        
        -- AddToggle Function
        function TabFunctions:AddToggle(ToggleConfig)
            ToggleConfig = ToggleConfig or {}
            local ToggleName = ToggleConfig.Name or "Toggle"
            local Default = ToggleConfig.Default or false
            local Callback = ToggleConfig.Callback or function() end
            
            local ToggleState = Default
            
            local ToggleContainer = Create("Frame", {
                Name = ToggleName .. "Container",
                BackgroundColor3 = CurrentTheme.Secondary,
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -20, 0, 35),
                Parent = TabContent
            })
            
            local ToggleContainerUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = ToggleContainer
            })
            
            local ToggleLabel = Create("TextLabel", {
                Name = ToggleName .. "Label",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 10, 0, 0),
                Size = UDim2.new(0.7, -10, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ToggleName,
                TextColor3 = CurrentTheme.Text,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ToggleContainer
            })
            
            local ToggleButton = Create("TextButton", {
                Name = ToggleName .. "Button",
                BackgroundTransparency = 1,
                Position = UDim2.new(0.7, 0, 0, 0),
                Size = UDim2.new(0.3, 0, 1, 0),
                Text = "",
                AutoButtonColor = false,
                Parent = ToggleContainer
            })
            
            local ToggleBackground = Create("Frame", {
                Name = ToggleName .. "Background",
                BackgroundColor3 = Default and AccentColor or Color3.fromRGB(80, 80, 80),
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, -20, 0.5, -10),
                Size = UDim2.new(0, 40, 0, 20),
                Parent = ToggleButton
            })
            
            local ToggleBackgroundUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 10),
                Parent = ToggleBackground
            })
            
            local ToggleKnob = Create("Frame", {
                Name = ToggleName .. "Knob",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Position = UDim2.new(0, Default and 22 or 2, 0, 2),
                Size = UDim2.new(0, 16, 0, 16),
                Parent = ToggleBackground
            })
            
            local ToggleKnobUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = ToggleKnob
            })
            
            local function UpdateToggle()
                Tween(ToggleBackground, {BackgroundColor3 = ToggleState and AccentColor or Color3.fromRGB(80, 80, 80)}, 0.2)
                Tween(ToggleKnob, {Position = UDim2.new(0, ToggleState and 22 or 2, 0, 2)}, 0.2)
                Callback(ToggleState)
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                ToggleState = not ToggleState
                UpdateToggle()
            end)
            
            ToggleButton.MouseEnter:Connect(function()
                Tween(ToggleBackground, {BackgroundColor3 = ToggleState and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(100, 100, 100)}, 0.2)
            end)
            
            ToggleButton.MouseLeave:Connect(function()
                Tween(ToggleBackground, {BackgroundColor3 = ToggleState and AccentColor or Color3.fromRGB(80, 80, 80)}, 0.2)
            end)
            
            UpdateToggle()
            
            return {
                Set = function(self, state)
                    ToggleState = state
                    UpdateToggle()
                end,
                Get = function(self)
                    return ToggleState
                end
            }
        end
        
        -- Auto-select first tab
        if not CurrentTab then
            CurrentTab = TabContent
            TabContent.Visible = true
            Tween(TabButton, {BackgroundColor3 = AccentColor, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
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
