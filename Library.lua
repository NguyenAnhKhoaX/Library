-- NazuX Library - Windows 11 Style UI
-- Combined from multiple sources with clean organization

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
    local DefaultToggle = options.DefaultToggle or false
    
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
        BackgroundColor3 = DarkTheme.Background,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -300, 0.5, -200),
        Size = UDim2.new(0, 600, 0, 450),
        Active = true,
        Draggable = true
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
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Name = "TitleBar",
        BackgroundColor3 = DarkTheme.Secondary,
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
        Position = UDim2.new(0, 15, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        Font = Enum.Font.GothamSemibold,
        Text = WindowName,
        TextColor3 = DarkTheme.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
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
        BackgroundColor3 = DarkTheme.Secondary,
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
        BackgroundColor3 = DarkTheme.Tertiary,
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
        BackgroundColor3 = DarkTheme.Secondary,
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
        TextColor3 = DarkTheme.Text,
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
        TextColor3 = DarkTheme.SubText,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    Avatar.Parent = UserInfoFrame
    UsernameLabel.Parent = UserInfoFrame
    UserIdLabel.Parent = UserInfoFrame
    
    -- Search Bar
    local SearchContainer = Create("Frame", {
        Name = "SearchContainer",
        BackgroundColor3 = DarkTheme.Tertiary,
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
        PlaceholderColor3 = DarkTheme.SubText,
        Text = "",
        TextColor3 = DarkTheme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local SearchIcon = Create("ImageLabel", {
        Name = "SearchIcon",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -25, 0, 7),
        Size = UDim2.new(0, 20, 0, 20),
        Image = "rbxassetid://3926305904",
        ImageColor3 = DarkTheme.SubText,
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
        ScrollBarImageColor3 = DarkTheme.Tertiary,
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
    
    -- Loading Screen
    local LoadingScreen = Create("Frame", {
        Name = "LoadingScreen",
        BackgroundColor3 = DarkTheme.Background,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = ScreenGui
    })
    
    local LoadingSpinner = Create("ImageLabel", {
        Name = "LoadingSpinner",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, -20),
        Size = UDim2.new(0, 50, 0, 50),
        Image = "rbxassetid://3926305904",
        ImageColor3 = AccentColor,
        ImageRectOffset = Vector2.new(964, 324),
        ImageRectSize = Vector2.new(36, 36)
    })
    
    local LoadingText = Create("TextLabel", {
        Name = "LoadingText",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 30),
        Size = UDim2.new(0, 200, 0, 20),
        Font = Enum.Font.GothamSemibold,
        Text = "Loading NazuX Library...",
        TextColor3 = DarkTheme.Text,
        TextSize = 14,
        Parent = LoadingScreen
    })
    
    -- Animation for loading spinner
    local LoadingRotation = 0
    local LoadingConnection
    
    -- Functions
    function NazuXLibrary:ToggleUI()
        MainFrame.Visible = not MainFrame.Visible
    end
    
    function NazuXLibrary:ShowLoading(duration)
        LoadingScreen.Visible = true
        MainFrame.Visible = false
        
        LoadingConnection = RunService.Heartbeat:Connect(function(delta)
            LoadingRotation = (LoadingRotation + 180 * delta) % 360
            LoadingSpinner.Rotation = LoadingRotation
        end)
        
        if duration then
            delay(duration, function()
                NazuXLibrary:HideLoading()
            end)
        end
    end
    
    function NazuXLibrary:HideLoading()
        if LoadingConnection then
            LoadingConnection:Disconnect()
            LoadingConnection = nil
        end
        LoadingScreen.Visible = false
        MainFrame.Visible = true
    end
    
    -- Close Button Event
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(241, 112, 122)}, 0.2)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(232, 17, 35)}, 0.2)
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
            BackgroundColor3 = DarkTheme.Tertiary,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 35),
            Font = Enum.Font.Gotham,
            Text = TabName,
            TextColor3 = DarkTheme.SubText,
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
            ScrollBarImageColor3 = DarkTheme.Tertiary,
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
                        Tween(btn, {BackgroundColor3 = DarkTheme.Tertiary, TextColor3 = DarkTheme.SubText}, 0.2)
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
                Tween(TabButton, {BackgroundColor3 = DarkTheme.Tertiary}, 0.2)
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
                BackgroundColor3 = DarkTheme.Secondary,
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
                TextColor3 = DarkTheme.Text,
                TextSize = 12,
                Parent = ButtonContainer
            })
            
            Button.MouseButton1Click:Connect(function()
                Callback()
                Tween(ButtonContainer, {BackgroundColor3 = AccentColor}, 0.1)
                wait(0.1)
                Tween(ButtonContainer, {BackgroundColor3 = DarkTheme.Secondary}, 0.1)
            end)
            
            Button.MouseEnter:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = DarkTheme.Secondary}, 0.2)
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
                BackgroundColor3 = DarkTheme.Secondary,
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
                TextColor3 = DarkTheme.Text,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ToggleContainer
            })
            
            local ToggleButton = Create("Frame", {
                Name = ToggleName .. "Button",
                BackgroundColor3 = Default and AccentColor or Color3.fromRGB(80, 80, 80),
                BorderSizePixel = 0,
                Position = UDim2.new(1, -50, 0, 7),
                Size = UDim2.new(0, 40, 0, 20),
                Parent = ToggleContainer
            })
            
            local ToggleButtonUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 10),
                Parent = ToggleButton
            })
            
            local ToggleKnob = Create("Frame", {
                Name = ToggleName .. "Knob",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Position = UDim2.new(0, Default and 22 or 2, 0, 2),
                Size = UDim2.new(0, 16, 0, 16),
                Parent = ToggleButton
            })
            
            local ToggleKnobUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = ToggleKnob
            })
            
            local function UpdateToggle()
                Tween(ToggleButton, {BackgroundColor3 = ToggleState and AccentColor or Color3.fromRGB(80, 80, 80)}, 0.2)
                Tween(ToggleKnob, {Position = UDim2.new(0, ToggleState and 22 or 2, 0, 2)}, 0.2)
                Callback(ToggleState)
            end
            
            ToggleButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    ToggleState = not ToggleState
                    UpdateToggle()
                end
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
        
        -- AddSlider Function
        function TabFunctions:AddSlider(SliderConfig)
            SliderConfig = SliderConfig or {}
            local SliderName = SliderConfig.Name or "Slider"
            local Min = SliderConfig.Min or 0
            local Max = SliderConfig.Max or 100
            local Default = SliderConfig.Default or Min
            local Callback = SliderConfig.Callback or function() end
            
            local SliderValue = Default
            
            local SliderContainer = Create("Frame", {
                Name = SliderName .. "Container",
                BackgroundColor3 = DarkTheme.Secondary,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -20, 0, 60),
                Parent = TabContent
            })
            
            local SliderContainerUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = SliderContainer
            })
            
            local SliderLabel = Create("TextLabel", {
                Name = SliderName .. "Label",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 10, 0, 5),
                Size = UDim2.new(1, -20, 0, 15),
                Font = Enum.Font.Gotham,
                Text = SliderName,
                TextColor3 = DarkTheme.Text,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = SliderContainer
            })
            
            local ValueLabel = Create("TextLabel", {
                Name = SliderName .. "Value",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 10, 0, 5),
                Size = UDim2.new(1, -20, 0, 15),
                Font = Enum.Font.Gotham,
                Text = tostring(Default),
                TextColor3 = DarkTheme.SubText,
                TextSize = 11,
                TextXAlignment = Enum.TextXAlignment.Right,
                Parent = SliderContainer
            })
            
            local SliderTrack = Create("Frame", {
                Name = SliderName .. "Track",
                BackgroundColor3 = DarkTheme.Tertiary,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 10, 0, 30),
                Size = UDim2.new(1, -20, 0, 5),
                Parent = SliderContainer
            })
            
            local SliderTrackUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 3),
                Parent = SliderTrack
            })
            
            local SliderFill = Create("Frame", {
                Name = SliderName .. "Fill",
                BackgroundColor3 = AccentColor,
                BorderSizePixel = 0,
                Size = UDim2.new((Default - Min) / (Max - Min), 0, 1, 0),
                Parent = SliderTrack
            })
            
            local SliderFillUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 3),
                Parent = SliderFill
            })
            
            local SliderButton = Create("TextButton", {
                Name = SliderName .. "Button",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 10, 0, 25),
                Size = UDim2.new(1, -20, 0, 15),
                Text = "",
                Parent = SliderContainer
            })
            
            local function UpdateSlider(value)
                local percent = math.clamp((value - Min) / (Max - Min), 0, 1)
                SliderValue = math.floor(Min + (Max - Min) * percent)
                ValueLabel.Text = tostring(SliderValue)
                Tween(SliderFill, {Size = UDim2.new(percent, 0, 1, 0)}, 0.1)
                Callback(SliderValue)
            end
            
            local Dragging = false
            
            SliderButton.MouseButton1Down:Connect(function()
                Dragging = true
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = false
                end
            end)
            
            SliderButton.MouseMoved:Connect(function()
                if Dragging then
                    local mousePos = UserInputService:GetMouseLocation()
                    local sliderAbsPos = SliderTrack.AbsolutePosition
                    local sliderAbsSize = SliderTrack.AbsoluteSize
                    
                    local relativeX = math.clamp((mousePos.X - sliderAbsPos.X) / sliderAbsSize.X, 0, 1)
                    UpdateSlider(Min + (Max - Min) * relativeX)
                end
            end)
            
            UpdateSlider(Default)
            
            return {
                Set = function(self, value)
                    UpdateSlider(value)
                end,
                Get = function(self)
                    return SliderValue
                end
            }
        end
        
        -- AddDropdown Function
        function TabFunctions:AddDropdown(DropdownConfig)
            DropdownConfig = DropdownConfig or {}
            local DropdownName = DropdownConfig.Name or "Dropdown"
            local Options = DropdownConfig.Options or {}
            local Default = DropdownConfig.Default or Options[1]
            local Callback = DropdownConfig.Callback or function() end
            
            local DropdownOpen = false
            local SelectedOption = Default
            
            local DropdownContainer = Create("Frame", {
                Name = DropdownName .. "Container",
                BackgroundColor3 = DarkTheme.Secondary,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -20, 0, 35),
                Parent = TabContent
            })
            
            local DropdownContainerUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = DropdownContainer
            })
            
            local DropdownButton = Create("TextButton", {
                Name = DropdownName .. "Button",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.Gotham,
                Text = DropdownName .. ": " .. SelectedOption,
                TextColor3 = DarkTheme.Text,
                TextSize = 12,
                Parent = DropdownContainer
            })
            
            local DropdownArrow = Create("ImageLabel", {
                Name = DropdownName .. "Arrow",
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -25, 0, 10),
                Size = UDim2.new(0, 15, 0, 15),
                Image = "rbxassetid://3926305904",
                ImageColor3 = DarkTheme.SubText,
                ImageRectOffset = Vector2.new(884, 284),
                ImageRectSize = Vector2.new(36, 36),
                Rotation = 0,
                Parent = DropdownButton
            })
            
            local DropdownList = Create("ScrollingFrame", {
                Name = DropdownName .. "List",
                BackgroundColor3 = DarkTheme.Tertiary,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 1, 5),
                Size = UDim2.new(1, 0, 0, 0),
                CanvasSize = UDim2.new(0, 0, 0, 0),
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = DarkTheme.Tertiary,
                Visible = false,
                Parent = DropdownContainer
            })
            
            local DropdownListLayout = Create("UIListLayout", {
                Padding = UDim.new(0, 2),
                Parent = DropdownList
            })
            
            local function UpdateDropdown()
                DropdownButton.Text = DropdownName .. ": " .. SelectedOption
                Callback(SelectedOption)
            end
            
            local function ToggleDropdown()
                DropdownOpen = not DropdownOpen
                DropdownList.Visible = DropdownOpen
                
                if DropdownOpen then
                    Tween(DropdownList, {Size = UDim2.new(1, 0, 0, math.min(#Options * 25, 100))}, 0.2)
                    Tween(DropdownArrow, {Rotation = 180}, 0.2)
                else
                    Tween(DropdownList, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                    Tween(DropdownArrow, {Rotation = 0}, 0.2)
                end
            end
            
            DropdownButton.MouseButton1Click:Connect(ToggleDropdown)
            
            -- Create option buttons
            for i, option in pairs(Options) do
                local OptionButton = Create("TextButton", {
                    Name = option .. "Option",
                    BackgroundColor3 = DarkTheme.Secondary,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 25),
                    Font = Enum.Font.Gotham,
                    Text = option,
                    TextColor3 = DarkTheme.Text,
                    TextSize = 11,
                    AutoButtonColor = false
                })
                
                OptionButton.MouseButton1Click:Connect(function()
                    SelectedOption = option
                    UpdateDropdown()
                    ToggleDropdown()
                end)
                
                OptionButton.MouseEnter:Connect(function()
                    Tween(OptionButton, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, 0.2)
                end)
                
                OptionButton.MouseLeave:Connect(function()
                    Tween(OptionButton, {BackgroundColor3 = DarkTheme.Secondary}, 0.2)
                end)
                
                OptionButton.Parent = DropdownList
            end
            
            DropdownListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                DropdownList.CanvasSize = UDim2.new(0, 0, 0, DropdownListLayout.AbsoluteContentSize.Y)
            end)
            
            UpdateDropdown()
            
            return {
                Set = function(self, option)
                    if table.find(Options, option) then
                        SelectedOption = option
                        UpdateDropdown()
                    end
                end,
                Get = function(self)
                    return SelectedOption
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
    
    -- Show loading screen initially
    NazuXLibrary:ShowLoading(2)
    
    return NazuXLibrary
end

return NazuX
