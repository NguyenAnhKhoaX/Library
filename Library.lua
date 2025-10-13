--[[
    NazuX Library
    Phiên bản: 1.0
    Tác giả: DeepSeek=))))
    Tính năng: Giao diện trong suốt với các control cơ bản
--]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Colors
local Theme = {
    Background = Color3.fromRGB(30, 30, 40),
    Secondary = Color3.fromRGB(40, 40, 50),
    Accent = Color3.fromRGB(100, 70, 200),
    Text = Color3.fromRGB(240, 240, 240),
    Success = Color3.fromRGB(80, 200, 120),
    Warning = Color3.fromRGB(220, 180, 60),
    Error = Color3.fromRGB(220, 80, 80),
}

-- Utility functions
local function Create(class, properties)
    local obj = Instance.new(class)
    for prop, value in pairs(properties) do
        obj[prop] = value
    end
    return obj
end

local function Tween(object, goals, duration, style, direction)
    style = style or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    
    local tweenInfo = TweenInfo.new(duration, style, direction)
    local tween = TweenService:Create(object, tweenInfo, goals)
    tween:Play()
    return tween
end

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    local windowTitle = options.Title or "NazuX Library"
    local toggleKey = options.ToggleKey or Enum.KeyCode.RightShift
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        Parent = game.CoreGui
    })
    
    -- Main Frame
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        Size = UDim2.new(0, 500, 0, 400),
        Position = UDim2.new(0.5, -250, 0.5, -200),
        BackgroundColor3 = Theme.Background,
        BackgroundTransparency = 0.2, -- Độ trong suốt
        BorderSizePixel = 0,
        Parent = ScreenGui
    })
    
    -- Corner
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    -- Stroke
    Create("UIStroke", {
        Color = Theme.Accent,
        Thickness = 1,
        Parent = MainFrame
    })
    
    -- Top Bar
    local TopBar = Create("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        Parent = MainFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = TopBar
    })
    
    -- Title
    local Title = Create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 200, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = windowTitle,
        TextColor3 = Theme.Text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamSemibold,
        Parent = TopBar
    })
    
    -- Close Button
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -30, 0, 0),
        BackgroundTransparency = 1,
        Text = "X",
        TextColor3 = Theme.Error,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        Parent = TopBar
    })
    
    -- Tab Container
    local TabContainer = Create("Frame", {
        Name = "TabContainer",
        Size = UDim2.new(0, 120, 1, -30),
        Position = UDim2.new(0, 0, 0, 30),
        BackgroundTransparency = 1,
        Parent = MainFrame
    })
    
    -- Content Container
    local ContentContainer = Create("ScrollingFrame", {
        Name = "ContentContainer",
        Size = UDim2.new(1, -120, 1, -30),
        Position = UDim2.new(0, 120, 0, 30),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = MainFrame
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = ContentContainer
    })
    
    Create("UIPadding", {
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        Parent = ContentContainer
    })
    
    -- Variables
    local tabs = {}
    local currentTab = nil
    
    -- Close functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Dragging functionality
    local dragging = true
    local dragInput, dragStart, startPos
    
    local function Update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    TopBar.InputBegan:Connect(function(input)
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
    
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            Update(input)
        end
    end)
    
    -- Toggle visibility
    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == toggleKey then
            MainFrame.Visible = not MainFrame.Visible
        end
    end)
    
    -- Tab functions
    local function CreateTab(name)
        local tabButton = Create("TextButton", {
            Name = name .. "Tab",
            Size = UDim2.new(1, -10, 0, 30),
            BackgroundColor3 = Theme.Secondary,
            BackgroundTransparency = 0.5,
            Text = name,
            TextColor3 = Theme.Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            Parent = TabContainer,
            LayoutOrder = #tabs + 1
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 4),
            Parent = tabButton
        })
        
        local tabContent = Create("Frame", {
            Name = name .. "Content",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Visible = false,
            Parent = ContentContainer
        })
        
        Create("UIListLayout", {
            Padding = UDim.new(0, 5),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = tabContent
        })
        
        Create("UIPadding", {
            PaddingTop = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5),
            Parent = tabContent
        })
        
        local tab = {
            Button = tabButton,
            Content = tabContent,
            Name = name
        }
        
        table.insert(tabs, tab)
        
        tabButton.MouseButton1Click:Connect(function()
            if currentTab then
                currentTab.Content.Visible = false
                Tween(currentTab.Button, {BackgroundColor3 = Theme.Secondary}, 0.2)
            end
            
            currentTab = tab
            tab.Content.Visible = true
            Tween(tab.Button, {BackgroundColor3 = Theme.Accent}, 0.2)
        end)
        
        if #tabs == 1 then
            currentTab = tab
            tab.Content.Visible = true
            Tween(tab.Button, {BackgroundColor3 = Theme.Accent}, 0.2)
        end
        
        return tab
    end
    
    -- Update ContentContainer size
    local function UpdateContentSize()
        local content = currentTab and currentTab.Content
        if content then
            local layout = content:FindFirstChildOfClass("UIListLayout")
            if layout then
                local absoluteContentSize = layout.AbsoluteContentSize
                ContentContainer.CanvasSize = UDim2.new(0, 0, 0, absoluteContentSize.Y + 20)
            end
        end
    end
    
    RunService.Heartbeat:Connect(UpdateContentSize)
    
    -- Return window functions
    local window = {}
    
    function window:AddTab(name)
        return CreateTab(name)
    end
    
    function window:Destroy()
        ScreenGui:Destroy()
    end
    
    return window
end

-- Control functions
function NazuX:AddButton(tab, options)
    options = options or {}
    local name = options.Name or "Button"
    local callback = options.Callback or function() end
    
    local Button = Create("TextButton", {
        Name = name .. "Button",
        Size = UDim2.new(1, -10, 0, 35),
        BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.5,
        Text = name,
        TextColor3 = Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = Button
    })
    
    Create("UIStroke", {
        Color = Theme.Accent,
        Thickness = 1,
        Parent = Button
    })
    
    Button.MouseEnter:Connect(function()
        Tween(Button, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}, 0.2)
    end)
    
    Button.MouseLeave:Connect(function()
        Tween(Button, {BackgroundColor3 = Theme.Secondary}, 0.2)
    end)
    
    Button.MouseButton1Click:Connect(function()
        Tween(Button, {BackgroundColor3 = Theme.Accent}, 0.1)
        Tween(Button, {BackgroundColor3 = Theme.Secondary}, 0.1)
        callback()
    end)
    
    return Button
end

function NazuX:AddToggle(tab, options)
    options = options or {}
    local name = options.Name or "Toggle"
    local default = options.Default or false
    local callback = options.Callback or function() end
    
    local ToggleFrame = Create("Frame", {
        Name = name .. "Toggle",
        Size = UDim2.new(1, -10, 0, 35),
        BackgroundTransparency = 1,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    local Label = Create("TextLabel", {
        Name = "Label",
        Size = UDim2.new(0.7, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = Theme.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = ToggleFrame
    })
    
    local ToggleButton = Create("TextButton", {
        Name = "ToggleButton",
        Size = UDim2.new(0, 40, 0, 20),
        Position = UDim2.new(1, -40, 0.5, -10),
        BackgroundColor3 = default and Theme.Success or Theme.Secondary,
        Text = "",
        Parent = ToggleFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = ToggleButton
    })
    
    local ToggleState = default
    
    local function UpdateToggle()
        Tween(ToggleButton, {BackgroundColor3 = ToggleState and Theme.Success or Theme.Secondary}, 0.2)
        callback(ToggleState)
    end
    
    ToggleButton.MouseButton1Click:Connect(function()
        ToggleState = not ToggleState
        UpdateToggle()
    end)
    
    UpdateToggle()
    
    local toggle = {}
    
    function toggle:Set(value)
        ToggleState = value
        UpdateToggle()
    end
    
    function toggle:Get()
        return ToggleState
    end
    
    return toggle
end

function NazuX:AddSlider(tab, options)
    options = options or {}
    local name = options.Name or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.Default or min
    local callback = options.Callback or function() end
    
    local SliderFrame = Create("Frame", {
        Name = name .. "Slider",
        Size = UDim2.new(1, -10, 0, 50),
        BackgroundTransparency = 1,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    local Label = Create("TextLabel", {
        Name = "Label",
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = Theme.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = SliderFrame
    })
    
    local ValueLabel = Create("TextLabel", {
        Name = "ValueLabel",
        Size = UDim2.new(0, 50, 0, 20),
        Position = UDim2.new(1, -50, 0, 0),
        BackgroundTransparency = 1,
        Text = tostring(default),
        TextColor3 = Theme.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Right,
        Font = Enum.Font.Gotham,
        Parent = SliderFrame
    })
    
    local SliderBackground = Create("Frame", {
        Name = "SliderBackground",
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 1, -20),
        BackgroundColor3 = Theme.Secondary,
        Parent = SliderFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = SliderBackground
    })
    
    local SliderFill = Create("Frame", {
        Name = "SliderFill",
        Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = Theme.Accent,
        Parent = SliderBackground
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = SliderFill
    })
    
    local SliderButton = Create("TextButton", {
        Name = "SliderButton",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Parent = SliderBackground
    })
    
    local dragging = false
    local currentValue = default
    
    local function UpdateSlider(value)
        value = math.clamp(value, min, max)
        currentValue = value
        local percentage = (value - min) / (max - min)
        
        Tween(SliderFill, {Size = UDim2.new(percentage, 0, 1, 0)}, 0.1)
        ValueLabel.Text = tostring(math.floor(value))
        callback(value)
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    SliderButton.MouseMoved:Connect(function()
        if dragging then
            local mousePos = UserInputService:GetMouseLocation()
            local sliderAbsPos = SliderBackground.AbsolutePosition
            local sliderAbsSize = SliderBackground.AbsoluteSize
            
            local relativeX = (mousePos.X - sliderAbsPos.X) / sliderAbsSize.X
            relativeX = math.clamp(relativeX, 0, 1)
            
            local value = min + (max - min) * relativeX
            UpdateSlider(value)
        end
    end)
    
    UpdateSlider(default)
    
    local slider = {}
    
    function slider:Set(value)
        UpdateSlider(value)
    end
    
    function slider:Get()
        return currentValue
    end
    
    return slider
end

function NazuX:AddLabel(tab, options)
    options = options or {}
    local text = options.Text or "Label"
    
    local Label = Create("TextLabel", {
        Name = "Label",
        Size = UDim2.new(1, -10, 0, 25),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = Theme.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    return Label
end

function NazuX:AddSeparator(tab, options)
    options = options or {}
    local text = options.Text or ""
    
    local SeparatorFrame = Create("Frame", {
        Name = "Separator",
        Size = UDim2.new(1, -10, 0, 20),
        BackgroundTransparency = 1,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    local Line = Create("Frame", {
        Name = "Line",
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = Theme.Secondary,
        Parent = SeparatorFrame
    })
    
    if text ~= "" then
        Line.Size = UDim2.new(0.4, 0, 0, 1)
        Line.Position = UDim2.new(0, 0, 0.5, 0)
        
        local RightLine = Create("Frame", {
            Name = "RightLine",
            Size = UDim2.new(0.4, 0, 0, 1),
            Position = UDim2.new(0.6, 0, 0.5, 0),
            BackgroundColor3 = Theme.Secondary,
            Parent = SeparatorFrame
        })
        
        local TextLabel = Create("TextLabel", {
            Name = "TextLabel",
            Size = UDim2.new(0.2, 0, 1, 0),
            Position = UDim2.new(0.4, 0, 0, 0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = Theme.Text,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            Parent = SeparatorFrame
        })
    end
    
    return SeparatorFrame
end

return NazuX
