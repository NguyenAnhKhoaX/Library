--[[
    🔥 NAZUX LIBRARY - Ultimate Windows 11 UI
    Combined features from all libraries with Win11 design
    Version: 2.1.0
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Win11 Color Scheme
local NazuXColors = {
    Primary = Color3.fromRGB(0, 120, 215),
    Secondary = Color3.fromRGB(0, 100, 190),
    Background = Color3.fromRGB(32, 32, 32),
    Card = Color3.fromRGB(43, 43, 43),
    Surface = Color3.fromRGB(55, 55, 55),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(180, 180, 180),
    Accent = Color3.fromRGB(0, 184, 148)
}

-- Utility Functions
local function CreateInstance(className, properties)
    local obj = Instance.new(className)
    for prop, value in pairs(properties) do
        if prop == "Parent" then
            obj.Parent = value
        else
            obj[prop] = value
        end
    end
    return obj
end

local function TweenObject(obj, properties, duration, easingStyle, easingDirection)
    local tweenInfo = TweenInfo.new(duration or 0.3, easingStyle or Enum.EasingStyle.Quad, easingDirection or Enum.EasingDirection.Out)
    local tween = TweenService:Create(obj, tweenInfo, properties)
    tween:Play()
    return tween
end

-- Main Library
function NazuX:CreateWindow(config)
    config = config or {}
    local Window = {
        Title = config.Title or "NazuX Library",
        Subtitle = config.Subtitle or "Premium Script Hub",
        Size = config.Size or UDim2.new(0, 600, 0, 450),
        Theme = config.Theme or "Dark",
        Acrylic = config.Acrylic or false
    }
    
    setmetatable(Window, NazuX)
    
    -- Create GUI
    local ScreenGui = CreateInstance("ScreenGui", {
        Name = "NazuXUI",
        DisplayOrder = 999,
        ResetOnSpawn = false
    })
    
    -- Main Container
    local MainFrame = CreateInstance("Frame", {
        Name = "MainFrame",
        Size = Window.Size,
        Position = UDim2.new(0.5, -Window.Size.X.Offset/2, 0.5, -Window.Size.Y.Offset/2),
        BackgroundColor3 = NazuXColors.Background,
        BorderSizePixel = 0,
        Parent = ScreenGui
    })
    
    -- Rounded Corners
    CreateInstance("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = MainFrame
    })
    
    -- Drop Shadow
    CreateInstance("ImageLabel", {
        Name = "Shadow",
        Image = "rbxassetid://6014261993",
        ImageColor3 = Color3.new(0, 0, 0),
        ImageTransparency = 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        Size = UDim2.new(1, 24, 1, 24),
        Position = UDim2.new(0, -12, 0, -12),
        BackgroundTransparency = 1,
        Parent = MainFrame,
        ZIndex = 0
    })
    
    -- Title Bar
    local TitleBar = CreateInstance("Frame", {
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = NazuXColors.Card,
        BorderSizePixel = 0,
        Parent = MainFrame
    })
    
    CreateInstance("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = TitleBar
    })
    
    -- Title and Subtitle
    local TitleContainer = CreateInstance("Frame", {
        Name = "TitleContainer",
        Size = UDim2.new(1, -120, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Parent = TitleBar
    })
    
    CreateInstance("TextLabel", {
        Name = "Title",
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 2),
        BackgroundTransparency = 1,
        Text = Window.Title,
        TextColor3 = NazuXColors.Text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamSemibold,
        Parent = TitleContainer
    })
    
    CreateInstance("TextLabel", {
        Name = "Subtitle",
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = Window.Subtitle,
        TextColor3 = NazuXColors.SubText,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = TitleContainer
    })
    
    -- Window Controls
    local ControlsFrame = CreateInstance("Frame", {
        Name = "Controls",
        Size = UDim2.new(0, 80, 1, 0),
        Position = UDim2.new(1, -80, 0, 0),
        BackgroundTransparency = 1,
        Parent = TitleBar
    })
    
    -- Minimize Button
    local MinimizeButton = CreateInstance("TextButton", {
        Name = "MinimizeButton",
        Size = UDim2.new(0, 40, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Text = "_",
        TextColor3 = NazuXColors.Text,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        Parent = ControlsFrame
    })
    
    -- Close Button
    local CloseButton = CreateInstance("TextButton", {
        Name = "CloseButton",
        Size = UDim2.new(0, 40, 1, 0),
        Position = UDim2.new(1, -40, 0, 0),
        BackgroundTransparency = 1,
        Text = "×",
        TextColor3 = NazuXColors.Text,
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        Parent = ControlsFrame
    })
    
    -- Content Area (will be minimized)
    local ContentArea = CreateInstance("Frame", {
        Name = "ContentArea",
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1,
        Parent = MainFrame
    })
    
    -- User Info Section
    local UserInfoFrame = CreateInstance("Frame", {
        Name = "UserInfo",
        Size = UDim2.new(0, 180, 0, 80),
        Position = UDim2.new(0, 15, 0, 10),
        BackgroundColor3 = NazuXColors.Card,
        BorderSizePixel = 0,
        Parent = ContentArea
    })
    
    CreateInstance("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = UserInfoFrame
    })
    
    -- User Avatar
    local Player = Players.LocalPlayer
    CreateInstance("ImageLabel", {
        Name = "Avatar",
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.new(0, 10, 0.5, -25),
        BackgroundColor3 = NazuXColors.Surface,
        BorderSizePixel = 0,
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..Player.UserId.."&width=150&height=150&format=png",
        Parent = UserInfoFrame
    })
    
    CreateInstance("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = UserInfoFrame:FindFirstChild("Avatar")
    })
    
    -- User Info Text
    CreateInstance("TextLabel", {
        Name = "UserName",
        Size = UDim2.new(1, -70, 0, 20),
        Position = UDim2.new(0, 70, 0, 15),
        BackgroundTransparency = 1,
        Text = Player.Name,
        TextColor3 = NazuXColors.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamSemibold,
        Parent = UserInfoFrame
    })
    
    CreateInstance("TextLabel", {
        Name = "UserDisplayName",
        Size = UDim2.new(1, -70, 0, 18),
        Position = UDim2.new(0, 70, 0, 35),
        BackgroundTransparency = 1,
        Text = "@"..Player.DisplayName,
        TextColor3 = NazuXColors.SubText,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = UserInfoFrame
    })
    
    -- Search Bar
    local SearchFrame = CreateInstance("Frame", {
        Name = "SearchBar",
        Size = UDim2.new(0, 180, 0, 35),
        Position = UDim2.new(0, 15, 0, 100),
        BackgroundColor3 = NazuXColors.Surface,
        BorderSizePixel = 0,
        Parent = ContentArea
    })
    
    CreateInstance("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = SearchFrame
    })
    
    local SearchBox = CreateInstance("TextBox", {
        Name = "SearchBox",
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = "Search features...",
        TextColor3 = NazuXColors.Text,
        PlaceholderColor3 = NazuXColors.SubText,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = SearchFrame
    })
    
    CreateInstance("ImageLabel", {
        Name = "SearchIcon",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(1, -30, 0.5, -10),
        BackgroundTransparency = 1,
        Image = "rbxassetid://3926305904",
        ImageColor3 = NazuXColors.SubText,
        ImageRectSize = Vector2.new(24, 24),
        ImageRectOffset = Vector2.new(964, 324),
        Parent = SearchFrame
    })
    
    -- Tab Container (Left Side)
    local TabContainer = CreateInstance("ScrollingFrame", {
        Name = "TabContainer",
        Size = UDim2.new(0, 180, 1, -150),
        Position = UDim2.new(0, 15, 0, 145),
        BackgroundColor3 = NazuXColors.Card,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = NazuXColors.Primary,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = ContentArea
    })
    
    CreateInstance("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = TabContainer
    })
    
    local TabListLayout = CreateInstance("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
        Parent = TabContainer
    })
    
    -- Content Container (Right Side)
    local ContentContainer = CreateInstance("ScrollingFrame", {
        Name = "ContentContainer",
        Size = UDim2.new(1, -210, 1, -20),
        Position = UDim2.new(0, 210, 0, 10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = NazuXColors.Primary,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = ContentArea
    })
    
    local ContentLayout = CreateInstance("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10),
        Parent = ContentContainer
    })
    
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentContainer.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Window State Management
    local IsMinimized = false
    local OriginalSize = Window.Size
    local OriginalPosition = MainFrame.Position
    
    -- Minimize Functionality
    local function ToggleMinimize()
        IsMinimized = not IsMinimized
        
        if IsMinimized then
            -- Minimize to title bar only
            TweenObject(ContentArea, {Size = UDim2.new(1, 0, 0, 0)}, 0.3)
            TweenObject(MainFrame, {Size = UDim2.new(OriginalSize.X.Scale, OriginalSize.X.Offset, 0, 40)}, 0.3)
            TweenObject(MinimizeButton, {TextColor3 = NazuXColors.Primary}, 0.2)
        else
            -- Restore to original size
            TweenObject(ContentArea, {Size = UDim2.new(1, 0, 1, -40)}, 0.3)
            TweenObject(MainFrame, {Size = OriginalSize}, 0.3)
            TweenObject(MinimizeButton, {TextColor3 = NazuXColors.Text}, 0.2)
        end
    end
    
    -- Window Dragging
    local dragging, dragInput, dragStart, startPos
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    -- Control Button Functionality
    MinimizeButton.MouseButton1Click:Connect(ToggleMinimize)
    
    MinimizeButton.MouseEnter:Connect(function()
        TweenObject(MinimizeButton, {BackgroundColor3 = NazuXColors.Surface}, 0.2)
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        if not IsMinimized then
            TweenObject(MinimizeButton, {BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0)}, 0.2)
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    CloseButton.MouseEnter:Connect(function()
        TweenObject(CloseButton, {BackgroundColor3 = Color3.fromRGB(232, 17, 35)}, 0.2)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenObject(CloseButton, {BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0)}, 0.2)
    end)
    
    -- Search Functionality
    local function PerformSearch(query)
        for _, tab in pairs(Window.Tabs or {}) do
            for _, element in pairs(tab.Elements or {}) do
                if element:IsA("TextLabel") or element:IsA("TextButton") or element:FindFirstChild("ButtonText") then
                    local textElement = element:IsA("TextLabel") and element or element:FindFirstChild("ButtonText")
                    if textElement and textElement.Text then
                        local text = textElement.Text:lower()
                        if text:find(query:lower(), 1, true) then
                            TweenObject(textElement, {TextColor3 = NazuXColors.Accent}, 0.3)
                        else
                            TweenObject(textElement, {TextColor3 = NazuXColors.Text}, 0.3)
                        end
                    end
                end
            end
        end
    end
    
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        PerformSearch(SearchBox.Text)
    end)
    
    -- Store Window Data
    Window.GUI = ScreenGui
    Window.MainFrame = MainFrame
    Window.ContentArea = ContentArea
    Window.TabContainer = TabContainer
    Window.ContentContainer = ContentContainer
    Window.Tabs = {}
    Window.CurrentTab = nil
    Window.IsMinimized = false
    
    -- Tab Creation Method
    function Window:CreateTab(tabName, tabIcon)
        local TabButton = CreateInstance("TextButton", {
            Name = tabName.."Tab",
            Size = UDim2.new(1, -20, 0, 40),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundColor3 = NazuXColors.Surface,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            Parent = self.TabContainer,
            LayoutOrder = #self.Tabs + 1
        })
        
        CreateInstance("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = TabButton
        })
        
        local TabText = CreateInstance("TextLabel", {
            Name = "TabText",
            Size = UDim2.new(1, -10, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            Text = tabName,
            TextColor3 = NazuXColors.SubText,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.GothamSemibold,
            Parent = TabButton
        })
        
        local TabContent = CreateInstance("Frame", {
            Name = tabName.."Content",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Visible = false,
            Parent = self.ContentContainer
        })
        
        local TabContentLayout = CreateInstance("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 12),
            Parent = TabContent
        })
        
        TabContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.Size = UDim2.new(1, 0, 0, TabContentLayout.AbsoluteContentSize.Y)
        end)
        
        local TabData = {
            Name = tabName,
            Button = TabButton,
            Content = TabContent,
            Elements = {}
        }
        
        table.insert(self.Tabs, TabData)
        
        -- Tab Selection
        TabButton.MouseButton1Click:Connect(function()
            if self.CurrentTab then
                self.CurrentTab.Content.Visible = false
                TweenObject(self.CurrentTab.Button, {BackgroundColor3 = NazuXColors.Surface}, 0.3)
                TweenObject(self.CurrentTab.Button.TabText, {TextColor3 = NazuXColors.SubText}, 0.3)
            end
            
            self.CurrentTab = TabData
            TabContent.Visible = true
            TweenObject(TabButton, {BackgroundColor3 = NazuXColors.Primary}, 0.3)
            TweenObject(TabText, {TextColor3 = NazuXColors.Text}, 0.3)
        end)
        
        -- Auto-select first tab
        if #self.Tabs == 1 then
            TabButton.MouseButton1Click:Fire()
        end
        
        -- Update tab container size
        TabContainer.CanvasSize = UDim2.new(0, 0, 0, (#self.Tabs * 45) + 10)
        
        return TabData
    end
    
    -- Add Button Element
    function Window:AddButton(tab, config)
        config = config or {}
        local Button = CreateInstance("TextButton", {
            Name = config.Name or "Button",
            Size = UDim2.new(1, -20, 0, 42),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundColor3 = NazuXColors.Card,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            Parent = tab.Content,
            LayoutOrder = #tab.Elements + 1
        })
        
        CreateInstance("UICorner", {
            CornerRadius = UDim.new(0, 8),
            Parent = Button
        })
        
        CreateInstance("TextLabel", {
            Name = "ButtonText",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = config.Text or "Button",
            TextColor3 = NazuXColors.Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            Parent = Button
        })
        
        -- Button Interactions
        Button.MouseEnter:Connect(function()
            TweenObject(Button, {BackgroundColor3 = NazuXColors.Surface}, 0.2)
        end)
        
        Button.MouseLeave:Connect(function()
            TweenObject(Button, {BackgroundColor3 = NazuXColors.Card}, 0.2)
        end)
        
        Button.MouseButton1Click:Connect(function()
            TweenObject(Button, {BackgroundColor3 = NazuXColors.Primary}, 0.1)
            wait(0.1)
            TweenObject(Button, {BackgroundColor3 = NazuXColors.Card}, 0.1)
            if config.Callback then
                config.Callback()
            end
        end)
        
        table.insert(tab.Elements, Button)
        return Button
    end
    
    -- Add Toggle Element
    function Window:AddToggle(tab, config)
        config = config or {}
        local ToggleState = config.Default or false
        
        local ToggleFrame = CreateInstance("Frame", {
            Name = config.Name or "Toggle",
            Size = UDim2.new(1, -20, 0, 36),
            BackgroundTransparency = 1,
            Parent = tab.Content,
            LayoutOrder = #tab.Elements + 1
        })
        
        local ToggleLabel = CreateInstance("TextLabel", {
            Name = "ToggleLabel",
            Size = UDim2.new(1, -50, 1, 0),
            BackgroundTransparency = 1,
            Text = config.Text or "Toggle",
            TextColor3 = NazuXColors.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.Gotham,
            Parent = ToggleFrame
        })
        
        local ToggleButton = CreateInstance("TextButton", {
            Name = "ToggleButton",
            Size = UDim2.new(0, 45, 0, 24),
            Position = UDim2.new(1, -45, 0.5, -12),
            BackgroundColor3 = NazuXColors.Surface,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            Parent = ToggleFrame
        })
        
        CreateInstance("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = ToggleButton
        })
        
        local ToggleKnob = CreateInstance("Frame", {
            Name = "ToggleKnob",
            Size = UDim2.new(0, 18, 0, 18),
            Position = UDim2.new(0, 3, 0.5, -9),
            BackgroundColor3 = NazuXColors.Text,
            BorderSizePixel = 0,
            Parent = ToggleButton
        })
        
        CreateInstance("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = ToggleKnob
        })
        
        local function UpdateToggle()
            if ToggleState then
                TweenObject(ToggleButton, {BackgroundColor3 = NazuXColors.Primary}, 0.2)
                TweenObject(ToggleKnob, {Position = UDim2.new(1, -21, 0.5, -9)}, 0.2)
            else
                TweenObject(ToggleButton, {BackgroundColor3 = NazuXColors.Surface}, 0.2)
                TweenObject(ToggleKnob, {Position = UDim2.new(0, 3, 0.5, -9)}, 0.2)
            end
            if config.Callback then
                config.Callback(ToggleState)
            end
        end
        
        ToggleButton.MouseButton1Click:Connect(function()
            ToggleState = not ToggleState
            UpdateToggle()
        end)
        
        UpdateToggle()
        table.insert(tab.Elements, ToggleFrame)
        
        return {
            Set = function(value)
                ToggleState = value
                UpdateToggle()
            end,
            Get = function()
                return ToggleState
            end
        }
    end
    
    -- Add Slider Element
    function Window:AddSlider(tab, config)
        config = config or {}
        local Min = config.Min or 0
        local Max = config.Max or 100
        local Default = config.Default or Min
        local Value = Default
        
        local SliderFrame = CreateInstance("Frame", {
            Name = config.Name or "Slider",
            Size = UDim2.new(1, -20, 0, 60),
            BackgroundTransparency = 1,
            Parent = tab.Content,
            LayoutOrder = #tab.Elements + 1
        })
        
        local SliderHeader = CreateInstance("Frame", {
            Name = "SliderHeader",
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundTransparency = 1,
            Parent = SliderFrame
        })
        
        CreateInstance("TextLabel", {
            Name = "SliderLabel",
            Size = UDim2.new(1, -60, 1, 0),
            BackgroundTransparency = 1,
            Text = config.Text or "Slider",
            TextColor3 = NazuXColors.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.Gotham,
            Parent = SliderHeader
        })
        
        local ValueLabel = CreateInstance("TextLabel", {
            Name = "ValueLabel",
            Size = UDim2.new(0, 60, 1, 0),
            Position = UDim2.new(1, -60, 0, 0),
            BackgroundTransparency = 1,
            Text = tostring(Value),
            TextColor3 = NazuXColors.SubText,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Right,
            Font = Enum.Font.Gotham,
            Parent = SliderHeader
        })
        
        local SliderTrack = CreateInstance("Frame", {
            Name = "SliderTrack",
            Size = UDim2.new(1, 0, 0, 6),
            Position = UDim2.new(0, 0, 1, -25),
            BackgroundColor3 = NazuXColors.Surface,
            BorderSizePixel = 0,
            Parent = SliderFrame
        })
        
        CreateInstance("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = SliderTrack
        })
        
        local SliderFill = CreateInstance("Frame", {
            Name = "SliderFill",
            Size = UDim2.new((Value - Min) / (Max - Min), 0, 1, 0),
            BackgroundColor3 = NazuXColors.Primary,
            BorderSizePixel = 0,
            Parent = SliderTrack
        })
        
        CreateInstance("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = SliderFill
        })
        
        local SliderButton = CreateInstance("TextButton", {
            Name = "SliderButton",
            Size = UDim2.new(0, 18, 0, 18),
            Position = UDim2.new((Value - Min) / (Max - Min), -9, 0.5, -9),
            BackgroundColor3 = NazuXColors.Text,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            Parent = SliderTrack
        })
        
        CreateInstance("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = SliderButton
        })
        
        local function UpdateSlider(newValue)
            Value = math.clamp(newValue, Min, Max)
            local percent = (Value - Min) / (Max - Min)
            
            ValueLabel.Text = tostring(math.floor(Value))
            SliderFill.Size = UDim2.new(percent, 0, 1, 0)
            SliderButton.Position = UDim2.new(percent, -9, 0.5, -9)
            
            if config.Callback then
                config.Callback(Value)
            end
        end
        
        local dragging = false
        SliderButton.MouseButton1Down:Connect(function()
            dragging = true
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mousePos = UserInputService:GetMouseLocation()
                local trackAbsolutePos = SliderTrack.AbsolutePosition
                local trackAbsoluteSize = SliderTrack.AbsoluteSize
                
                local relativeX = (mousePos.X - trackAbsolutePos.X) / trackAbsoluteSize.X
                relativeX = math.clamp(relativeX, 0, 1)
                
                local newValue = Min + (Max - Min) * relativeX
                UpdateSlider(newValue)
            end
        end)
        
        UpdateSlider(Default)
        table.insert(tab.Elements, SliderFrame)
        
        return {
            Set = function(value)
                UpdateSlider(value)
            end,
            Get = function()
                return Value
            end
        }
    end
    
    -- Add Dropdown Element
    function Window:AddDropdown(tab, config)
        config = config or {}
        local Options = config.Options or {}
        local Selected = config.Default or Options[1]
        local DropdownOpen = false
        
        local DropdownFrame = CreateInstance("Frame", {
            Name = config.Name or "Dropdown",
            Size = UDim2.new(1, -20, 0, 36),
            BackgroundTransparency = 1,
            Parent = tab.Content,
            LayoutOrder = #tab.Elements + 1
        })
        
        local DropdownButton = CreateInstance("TextButton", {
            Name = "DropdownButton",
            Size = UDim2.new(1, 0, 0, 36),
            BackgroundColor3 = NazuXColors.Card,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            Parent = DropdownFrame
        })
        
        CreateInstance("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = DropdownButton
        })
        
        CreateInstance("TextLabel", {
            Name = "DropdownLabel",
            Size = UDim2.new(1, -30, 1, 0),
            BackgroundTransparency = 1,
            Text = config.Text or "Dropdown: "..Selected,
            TextColor3 = NazuXColors.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.Gotham,
            Parent = DropdownButton
        })
        
        CreateInstance("ImageLabel", {
            Name = "DropdownArrow",
            Size = UDim2.new(0, 20, 0, 20),
            Position = UDim2.new(1, -25, 0.5, -10),
            BackgroundTransparency = 1,
            Image = "rbxassetid://3926305904",
            ImageColor3 = NazuXColors.SubText,
            ImageRectSize = Vector2.new(24, 24),
            ImageRectOffset = Vector2.new(324, 364),
            Parent = DropdownButton
        })
        
        local DropdownList = CreateInstance("ScrollingFrame", {
            Name = "DropdownList",
            Size = UDim2.new(1, 0, 0, 0),
            Position = UDim2.new(0, 0, 1, 5),
            BackgroundColor3 = NazuXColors.Card,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = NazuXColors.Primary,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            Visible = false,
            Parent = DropdownFrame
        })
        
        CreateInstance("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = DropdownList
        })
        
        local ListLayout = CreateInstance("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2),
            Parent = DropdownList
        })
        
        local function UpdateDropdown()
            DropdownButton:FindFirstChild("DropdownLabel").Text = config.Text or "Dropdown: "..Selected
            if config.Callback then
                config.Callback(Selected)
            end
        end
        
        local function ToggleDropdown()
            DropdownOpen = not DropdownOpen
            
            if DropdownOpen then
                DropdownList.Visible = true
                TweenObject(DropdownList, {Size = UDim2.new(1, 0, 0, math.min(#Options * 32, 120))}, 0.3)
                TweenObject(DropdownButton:FindFirstChild("DropdownArrow"), {Rotation = 180}, 0.3)
            else
                TweenObject(DropdownList, {Size = UDim2.new(1, 0, 0, 0)}, 0.3)
                TweenObject(DropdownButton:FindFirstChild("DropdownArrow"), {Rotation = 0}, 0.3)
                wait(0.3)
                DropdownList.Visible = false
            end
        end
        
        -- Create option buttons
        for i, option in pairs(Options) do
            local OptionButton = CreateInstance("TextButton", {
                Name = option.."Option",
                Size = UDim2.new(1, -10, 0, 30),
                Position = UDim2.new(0, 5, 0, (i-1)*32),
                BackgroundColor3 = NazuXColors.Surface,
                BorderSizePixel = 0,
                Text = option,
                TextColor3 = NazuXColors.Text,
                TextSize = 12,
                AutoButtonColor = false,
                Parent = DropdownList,
                LayoutOrder = i
            })
            
            CreateInstance("UICorner", {
                CornerRadius = UDim.new(0, 4),
                Parent = OptionButton
            })
            
            OptionButton.MouseButton1Click:Connect(function()
                Selected = option
                UpdateDropdown()
                ToggleDropdown()
            end)
            
            OptionButton.MouseEnter:Connect(function()
                TweenObject(OptionButton, {BackgroundColor3 = NazuXColors.Primary}, 0.2)
            end)
            
            OptionButton.MouseLeave:Connect(function()
                TweenObject(OptionButton, {BackgroundColor3 = NazuXColors.Surface}, 0.2)
            end)
        end
        
        ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            DropdownList.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y)
        end)
        
        DropdownButton.MouseButton1Click:Connect(ToggleDropdown)
        UpdateDropdown()
        table.insert(tab.Elements, DropdownFrame)
        
        return {
            Set = function(option)
                if table.find(Options, option) then
                    Selected = option
                    UpdateDropdown()
                end
            end,
            Get = function()
                return Selected
            end
        }
    end
    
    -- Window Control Methods
    function Window:Minimize()
        ToggleMinimize()
    end
    
    function Window:Maximize()
        if IsMinimized then
            ToggleMinimize()
        end
    end
    
    function Window:SetTitle(title, subtitle)
        TitleContainer.Title.Text = title or Window.Title
        TitleContainer.Subtitle.Text = subtitle or Window.Subtitle
    end
    
    -- Show Window
    function Window:Show()
        self.GUI.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        return self
    end
    
    -- Hide Window
    function Window:Hide()
        self.GUI.Parent = nil
        return self
    end
    
    -- Destroy Window
    function Window:Destroy()
        self.GUI:Destroy()
    end
    
    return Window:Show()
end

return NazuX
