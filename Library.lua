--[[
    NazuX Library - Windows 11 Style UI Library
    Created based on multiple UI libraries
    Version: 1.0
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

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
    Background = Color3.fromRGB(242, 242, 242),
    Secondary = Color3.fromRGB(255, 255, 255),
    Tertiary = Color3.fromRGB(230, 230, 230),
    Text = Color3.fromRGB(0, 0, 0),
    SubText = Color3.fromRGB(100, 100, 100)
}

-- Utility Functions
local function Create(class, properties)
    local obj = Instance.new(class)
    for prop, value in pairs(properties) do
        obj[prop] = value
    end
    return obj
end

local function Tween(Object, Goals, Duration, Style, Direction)
    Style = Style or Enum.EasingStyle.Quad
    Direction = Direction or Enum.EasingDirection.Out
    
    local TweenInfo = TweenInfo.new(Duration, Style, Direction)
    local Tween = TweenService:Create(Object, TweenInfo, Goals)
    Tween:Play()
    return Tween
end

-- Main Window Creation
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowTitle = options.Title or "NazuX Library"
    local AutoShow = options.AutoShow or true
    local Theme = options.Theme or "Dark"
    
    local CurrentTheme = Theme == "Dark" and DarkTheme or LightTheme
    
    -- ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        ResetOnSpawn = false
    })
    
    -- Main Frame
    local MainFrame = Create("Frame", {
        Parent = ScreenGui,
        Name = "MainFrame",
        Size = UDim2.new(0, 500, 0, 400),
        Position = UDim2.new(0.5, -250, 0.5, -200),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    -- Corner
    Create("UICorner", {
        Parent = MainFrame,
        CornerRadius = UDim.new(0, 8)
    })
    
    -- Drop Shadow
    local Shadow = Create("ImageLabel", {
        Parent = MainFrame,
        Name = "Shadow",
        Image = "rbxassetid://6014261993",
        ImageColor3 = Color3.new(0, 0, 0),
        ImageTransparency = 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        Size = UDim2.new(1, 20, 1, 20),
        Position = UDim2.new(0, -10, 0, -10),
        BackgroundTransparency = 1,
        ZIndex = 0
    })
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Parent = MainFrame,
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = CurrentTheme.Secondary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = TitleBar,
        CornerRadius = UDim.new(0, 8)
    })
    
    -- Title Text
    local TitleLabel = Create("TextLabel", {
        Parent = TitleBar,
        Name = "TitleLabel",
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = WindowTitle,
        TextColor3 = CurrentTheme.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham
    })
    
    -- Close Button
    local CloseButton = Create("TextButton", {
        Parent = TitleBar,
        Name = "CloseButton",
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -32, 0, 0),
        BackgroundTransparency = 1,
        Text = "×",
        TextColor3 = CurrentTheme.Text,
        TextSize = 20,
        Font = Enum.Font.GothamBold
    })
    
    -- Tab Container
    local TabContainer = Create("Frame", {
        Parent = MainFrame,
        Name = "TabContainer",
        Size = UDim2.new(0, 120, 1, -32),
        Position = UDim2.new(0, 0, 0, 32),
        BackgroundColor3 = CurrentTheme.Secondary,
        BorderSizePixel = 0
    })
    
    -- Content Container
    local ContentContainer = Create("ScrollingFrame", {
        Parent = MainFrame,
        Name = "ContentContainer",
        Size = UDim2.new(1, -120, 1, -32),
        Position = UDim2.new(0, 120, 0, 32),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = CurrentTheme.SubText,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    -- UIListLayout for Content
    local ContentLayout = Create("UIListLayout", {
        Parent = ContentContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentContainer.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
    end)
    
    -- UIListLayout for Tabs
    local TabLayout = Create("UIListLayout", {
        Parent = TabContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2)
    })
    
    -- Make window draggable
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
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
            update(input)
        end
    end)
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(232, 17, 35)}, 0.2)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0)}, 0.2)
    end)
    
    -- Store window data
    local Window = {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        TabContainer = TabContainer,
        ContentContainer = ContentContainer,
        CurrentTheme = CurrentTheme,
        Tabs = {}
    }
    
    -- Auto show
    if AutoShow then
        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end
    
    -- Tab methods
    function Window:CreateTab(TabName)
        local TabButton = Create("TextButton", {
            Parent = TabContainer,
            Name = TabName .. "Tab",
            Size = UDim2.new(1, -10, 0, 30),
            Position = UDim2.new(0, 5, 0, 5),
            BackgroundColor3 = CurrentTheme.Tertiary,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false
        })
        
        Create("UICorner", {
            Parent = TabButton,
            CornerRadius = UDim.new(0, 4)
        })
        
        local TabLabel = Create("TextLabel", {
            Parent = TabButton,
            Name = "TabLabel",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = TabName,
            TextColor3 = CurrentTheme.SubText,
            TextSize = 12,
            Font = Enum.Font.Gotham
        })
        
        local TabContent = Create("Frame", {
            Parent = ContentContainer,
            Name = TabName .. "Content",
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1,
            Visible = false
        })
        
        local TabContentLayout = Create("UIListLayout", {
            Parent = TabContent,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        })
        
        TabContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.Size = UDim2.new(1, 0, 0, TabContentLayout.AbsoluteContentSize.Y)
        end)
        
        -- Tab selection logic
        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(Window.Tabs) do
                tab.Content.Visible = false
                Tween(tab.Button, {BackgroundColor3 = CurrentTheme.Tertiary}, 0.2)
                Tween(tab.Button.TabLabel, {TextColor3 = CurrentTheme.SubText}, 0.2)
            end
            
            TabContent.Visible = true
            Tween(TabButton, {BackgroundColor3 = AccentColor}, 0.2)
            Tween(TabLabel, {TextColor3 = CurrentTheme.Text}, 0.2)
        end)
        
        local TabData = {
            Button = TabButton,
            Content = TabContent,
            Name = TabName
        }
        
        table.insert(Window.Tabs, TabData)
        
        -- Select first tab
        if #Window.Tabs == 1 then
            TabButton.MouseButton1Click:Fire()
        end
        
        return TabData
    end
    
    -- Make window methods available
    setmetatable(Window, {__index = self})
    
    return Window
end

-- Button Element
function NazuX:AddButton(Tab, options)
    options = options or {}
    local ButtonText = options.Text or "Button"
    local Callback = options.Callback or function() end
    
    local Button = Create("TextButton", {
        Parent = Tab.Content,
        Name = ButtonText .. "Button",
        Size = UDim2.new(1, -20, 0, 32),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundColor3 = self.CurrentTheme.Tertiary,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = #Tab.Content:GetChildren()
    })
    
    Create("UICorner", {
        Parent = Button,
        CornerRadius = UDim.new(0, 4)
    })
    
    local ButtonLabel = Create("TextLabel", {
        Parent = Button,
        Name = "ButtonLabel",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = ButtonText,
        TextColor3 = self.CurrentTheme.Text,
        TextSize = 12,
        Font = Enum.Font.Gotham
    })
    
    -- Button interactions
    Button.MouseEnter:Connect(function()
        Tween(Button, {BackgroundColor3 = Color3.fromRGB(
            math.clamp(self.CurrentTheme.Tertiary.R * 255 + 10, 0, 255),
            math.clamp(self.CurrentTheme.Tertiary.G * 255 + 10, 0, 255),
            math.clamp(self.CurrentTheme.Tertiary.B * 255 + 10, 0, 255)
        )}, 0.2)
    end)
    
    Button.MouseLeave:Connect(function()
        Tween(Button, {BackgroundColor3 = self.CurrentTheme.Tertiary}, 0.2)
    end)
    
    Button.MouseButton1Click:Connect(function()
        Tween(Button, {BackgroundColor3 = AccentColor}, 0.1)
        wait(0.1)
        Tween(Button, {BackgroundColor3 = self.CurrentTheme.Tertiary}, 0.1)
        Callback()
    end)
    
    return Button
end

-- Toggle Element
function NazuX:AddToggle(Tab, options)
    options = options or {}
    local ToggleText = options.Text or "Toggle"
    local Default = options.Default or false
    local Callback = options.Callback or function() end
    
    local ToggleState = Default
    
    local ToggleFrame = Create("Frame", {
        Parent = Tab.Content,
        Name = ToggleText .. "Toggle",
        Size = UDim2.new(1, -20, 0, 32),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        LayoutOrder = #Tab.Content:GetChildren()
    })
    
    local ToggleLabel = Create("TextLabel", {
        Parent = ToggleFrame,
        Name = "ToggleLabel",
        Size = UDim2.new(1, -40, 1, 0),
        BackgroundTransparency = 1,
        Text = ToggleText,
        TextColor3 = self.CurrentTheme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham
    })
    
    local ToggleButton = Create("TextButton", {
        Parent = ToggleFrame,
        Name = "ToggleButton",
        Size = UDim2.new(0, 40, 0, 20),
        Position = UDim2.new(1, -40, 0.5, -10),
        BackgroundColor3 = self.CurrentTheme.Tertiary,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("UICorner", {
        Parent = ToggleButton,
        CornerRadius = UDim.new(0, 10)
    })
    
    local ToggleKnob = Create("Frame", {
        Parent = ToggleButton,
        Name = "ToggleKnob",
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = self.CurrentTheme.Text,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = ToggleKnob,
        CornerRadius = UDim.new(1, 0)
    })
    
    local function UpdateToggle()
        if ToggleState then
            Tween(ToggleButton, {BackgroundColor3 = AccentColor}, 0.2)
            Tween(ToggleKnob, {Position = UDim2.new(1, -18, 0.5, -8)}, 0.2)
        else
            Tween(ToggleButton, {BackgroundColor3 = self.CurrentTheme.Tertiary}, 0.2)
            Tween(ToggleKnob, {Position = UDim2.new(0, 2, 0.5, -8)}, 0.2)
        end
        Callback(ToggleState)
    end
    
    ToggleButton.MouseButton1Click:Connect(function()
        ToggleState = not ToggleState
        UpdateToggle()
    end)
    
    -- Initialize
    UpdateToggle()
    
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

-- Slider Element
function NazuX:AddSlider(Tab, options)
    options = options or {}
    local SliderText = options.Text or "Slider"
    local Min = options.Min or 0
    local Max = options.Max or 100
    local Default = options.Default or Min
    local Callback = options.Callback or function() end
    
    local SliderValue = Default
    
    local SliderFrame = Create("Frame", {
        Parent = Tab.Content,
        Name = SliderText .. "Slider",
        Size = UDim2.new(1, -20, 0, 50),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        LayoutOrder = #Tab.Content:GetChildren()
    })
    
    local SliderLabel = Create("TextLabel", {
        Parent = SliderFrame,
        Name = "SliderLabel",
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Text = SliderText,
        TextColor3 = self.CurrentTheme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham
    })
    
    local ValueLabel = Create("TextLabel", {
        Parent = SliderFrame,
        Name = "ValueLabel",
        Size = UDim2.new(0, 60, 0, 20),
        Position = UDim2.new(1, -60, 0, 0),
        BackgroundTransparency = 1,
        Text = tostring(SliderValue),
        TextColor3 = self.CurrentTheme.SubText,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Right,
        Font = Enum.Font.Gotham
    })
    
    local SliderTrack = Create("Frame", {
        Parent = SliderFrame,
        Name = "SliderTrack",
        Size = UDim2.new(1, 0, 0, 4),
        Position = UDim2.new(0, 0, 1, -15),
        BackgroundColor3 = self.CurrentTheme.Tertiary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = SliderTrack,
        CornerRadius = UDim.new(1, 0)
    })
    
    local SliderFill = Create("Frame", {
        Parent = SliderTrack,
        Name = "SliderFill",
        Size = UDim2.new((SliderValue - Min) / (Max - Min), 0, 1, 0),
        BackgroundColor3 = AccentColor,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = SliderFill,
        CornerRadius = UDim.new(1, 0)
    })
    
    local SliderButton = Create("TextButton", {
        Parent = SliderTrack,
        Name = "SliderButton",
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new((SliderValue - Min) / (Max - Min), -8, 0.5, -8),
        BackgroundColor3 = self.CurrentTheme.Text,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("UICorner", {
        Parent = SliderButton,
        CornerRadius = UDim.new(1, 0)
    })
    
    local function UpdateSlider(value)
        SliderValue = math.clamp(value, Min, Max)
        local percent = (SliderValue - Min) / (Max - Min)
        
        ValueLabel.Text = tostring(math.floor(SliderValue))
        SliderFill.Size = UDim2.new(percent, 0, 1, 0)
        SliderButton.Position = UDim2.new(percent, -8, 0.5, -8)
        
        Callback(SliderValue)
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
            
            local value = Min + (Max - Min) * relativeX
            UpdateSlider(value)
        end
    end)
    
    -- Initialize
    UpdateSlider(Default)
    
    return {
        Set = function(value)
            UpdateSlider(value)
        end,
        Get = function()
            return SliderValue
        end
    }
end

-- Dropdown Element
function NazuX:AddDropdown(Tab, options)
    options = options or {}
    local DropdownText = options.Text or "Dropdown"
    local Options = options.Options or {}
    local Default = options.Default or Options[1]
    local Callback = options.Callback or function() end
    
    local DropdownOpen = false
    local SelectedOption = Default
    
    local DropdownFrame = Create("Frame", {
        Parent = Tab.Content,
        Name = DropdownText .. "Dropdown",
        Size = UDim2.new(1, -20, 0, 32),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        LayoutOrder = #Tab.Content:GetChildren()
    })
    
    local DropdownButton = Create("TextButton", {
        Parent = DropdownFrame,
        Name = "DropdownButton",
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = self.CurrentTheme.Tertiary,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("UICorner", {
        Parent = DropdownButton,
        CornerRadius = UDim.new(0, 4)
    })
    
    local DropdownLabel = Create("TextLabel", {
        Parent = DropdownButton,
        Name = "DropdownLabel",
        Size = UDim2.new(1, -30, 1, 0),
        BackgroundTransparency = 1,
        Text = DropdownText .. ": " .. SelectedOption,
        TextColor3 = self.CurrentTheme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham
    })
    
    local DropdownArrow = Create("TextLabel", {
        Parent = DropdownButton,
        Name = "DropdownArrow",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(1, -25, 0.5, -10),
        BackgroundTransparency = 1,
        Text = "▼",
        TextColor3 = self.CurrentTheme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham
    })
    
    local DropdownList = Create("ScrollingFrame", {
        Parent = DropdownFrame,
        Name = "DropdownList",
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 1, 2),
        BackgroundColor3 = self.CurrentTheme.Tertiary,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = self.CurrentTheme.SubText,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Visible = false,
        ClipsDescendants = true
    })
    
    Create("UICorner", {
        Parent = DropdownList,
        CornerRadius = UDim.new(0, 4)
    })
    
    local DropdownListLayout = Create("UIListLayout", {
        Parent = DropdownList,
        SortOrder = Enum.SortOrder.LayoutOrder
    })
    
    local function UpdateDropdown()
        DropdownLabel.Text = DropdownText .. ": " .. SelectedOption
        Callback(SelectedOption)
    end
    
    local function ToggleDropdown()
        DropdownOpen = not DropdownOpen
        
        if DropdownOpen then
            DropdownList.Visible = true
            Tween(DropdownList, {Size = UDim2.new(1, 0, 0, math.min(#Options * 30, 120))}, 0.2)
            Tween(DropdownArrow, {Rotation = 180}, 0.2)
        else
            Tween(DropdownList, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            Tween(DropdownArrow, {Rotation = 0}, 0.2)
            wait(0.2)
            DropdownList.Visible = false
        end
    end
    
    DropdownButton.MouseButton1Click:Connect(ToggleDropdown)
    
    -- Create option buttons
    for _, option in pairs(Options) do
        local OptionButton = Create("TextButton", {
            Parent = DropdownList,
            Name = option .. "Option",
            Size = UDim2.new(1, -10, 0, 28),
            Position = UDim2.new(0, 5, 0, 0),
            BackgroundColor3 = self.CurrentTheme.Secondary,
            BorderSizePixel = 0,
            Text = option,
            TextColor3 = self.CurrentTheme.Text,
            TextSize = 12,
            AutoButtonColor = false,
            LayoutOrder = _
        })
        
        Create("UICorner", {
            Parent = OptionButton,
            CornerRadius = UDim.new(0, 4)
        })
        
        OptionButton.MouseButton1Click:Connect(function()
            SelectedOption = option
            UpdateDropdown()
            ToggleDropdown()
        end)
        
        OptionButton.MouseEnter:Connect(function()
            Tween(OptionButton, {BackgroundColor3 = AccentColor}, 0.2)
        end)
        
        OptionButton.MouseLeave:Connect(function()
            Tween(OptionButton, {BackgroundColor3 = self.CurrentTheme.Secondary}, 0.2)
        end)
    end
    
    DropdownListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        DropdownList.CanvasSize = UDim2.new(0, 0, 0, DropdownListLayout.AbsoluteContentSize.Y)
    end)
    
    -- Initialize
    UpdateDropdown()
    
    return {
        Set = function(option)
            if table.find(Options, option) then
                SelectedOption = option
                UpdateDropdown()
            end
        end,
        Get = function()
            return SelectedOption
        end
    }
end

-- Textbox Element
function NazuX:AddTextbox(Tab, options)
    options = options or {}
    local TextboxText = options.Text or "Textbox"
    local Default = options.Default or ""
    local Placeholder = options.Placeholder or "Enter text..."
    local Callback = options.Callback or function() end
    
    local TextboxFrame = Create("Frame", {
        Parent = Tab.Content,
        Name = TextboxText .. "Textbox",
        Size = UDim2.new(1, -20, 0, 32),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        LayoutOrder = #Tab.Content:GetChildren()
    })
    
    local TextboxLabel = Create("TextLabel", {
        Parent = TextboxFrame,
        Name = "TextboxLabel",
        Size = UDim2.new(1, 0, 0, 15),
        BackgroundTransparency = 1,
        Text = TextboxText,
        TextColor3 = self.CurrentTheme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham
    })
    
    local Textbox = Create("TextBox", {
        Parent = TextboxFrame,
        Name = "Textbox",
        Size = UDim2.new(1, 0, 0, 32),
        Position = UDim2.new(0, 0, 0, 15),
        BackgroundColor3 = self.CurrentTheme.Tertiary,
        BorderSizePixel = 0,
        Text = Default,
        PlaceholderText = Placeholder,
        TextColor3 = self.CurrentTheme.Text,
        PlaceholderColor3 = self.CurrentTheme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham
    })
    
    Create("UICorner", {
        Parent = Textbox,
        CornerRadius = UDim.new(0, 4)
    })
    
    Textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            Callback(Textbox.Text)
        end
    end)
    
    return {
        Set = function(text)
            Textbox.Text = text
        end,
        Get = function()
            return Textbox.Text
        end
    }
end

-- Label Element
function NazuX:AddLabel(Tab, options)
    options = options or {}
    local LabelText = options.Text or "Label"
    
    local Label = Create("TextLabel", {
        Parent = Tab.Content,
        Name = LabelText .. "Label",
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = LabelText,
        TextColor3 = self.CurrentTheme.Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        LayoutOrder = #Tab.Content:GetChildren()
    })
    
    return Label
end

return NazuX
