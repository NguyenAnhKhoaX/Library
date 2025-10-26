-- NazuX Library
-- Clean and Fixed Version

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Local Player
local player = Players.LocalPlayer

-- Theme System
local Themes = {
    Dark = {
        Main = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(25, 25, 25),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 215),
        Background = Color3.fromRGB(40, 40, 40)
    }
}

-- Utility Functions
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

local function Tween(Object, Info, Properties)
    local Tween = TweenService:Create(Object, Info, Properties)
    Tween:Play()
    return Tween
end

-- Dragging Function
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

-- Main Window Creation
function NazuX:CreateWindow(options)
    options = options or {}
    local Window = {
        Tabs = {},
        CurrentTab = nil,
        Minimized = false,
        Theme = options.Theme or "Dark",
        MinimizeKey = options.MinimizeKey or Enum.KeyCode.LeftControl
    }
    
    setmetatable(Window, NazuX)
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXUI",
        DisplayOrder = 10,
        Parent = game.CoreGui
    })
    
    -- Main Container
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        Size = UDim2.new(0, 500, 0, 350),
        Position = UDim2.new(0.5, -250, 0.5, -175),
        BackgroundColor3 = Themes[Window.Theme].Main,
        BorderSizePixel = 0,
        Parent = ScreenGui
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    Create("UIStroke", {
        Color = Themes[Window.Theme].Accent,
        Thickness = 1,
        Parent = MainFrame
    })
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = Themes[Window.Theme].Secondary,
        BorderSizePixel = 0,
        Parent = MainFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = TitleBar
    })
    
    -- Title
    local Title = Create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0.5, 0, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = options.Title or "NazuX UI",
        TextColor3 = Themes[Window.Theme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    -- Control Buttons
    local ControlButtons = Create("Frame", {
        Name = "ControlButtons",
        Size = UDim2.new(0, 60, 1, 0),
        Position = UDim2.new(1, -60, 0, 0),
        BackgroundTransparency = 1,
        Parent = TitleBar
    })
    
    local MinimizeButton = Create("TextButton", {
        Name = "MinimizeButton",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 5, 0.5, -10),
        BackgroundColor3 = Themes[Window.Theme].Accent,
        TextColor3 = Themes[Window.Theme].Text,
        Text = "_",
        TextSize = 14,
        Font = Enum.Font.Gotham,
        Parent = ControlButtons
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = MinimizeButton
    })
    
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(1, -25, 0.5, -10),
        BackgroundColor3 = Color3.fromRGB(220, 50, 50),
        TextColor3 = Themes[Window.Theme].Text,
        Text = "×",
        TextSize = 14,
        Font = Enum.Font.Gotham,
        Parent = ControlButtons
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = CloseButton
    })
    
    -- Tabs Container
    local TabsContainer = Create("Frame", {
        Name = "TabsContainer",
        Size = UDim2.new(0, 120, 1, -35),
        Position = UDim2.new(0, 5, 0, 35),
        BackgroundTransparency = 1,
        Parent = MainFrame
    })
    
    local TabsList = Create("ScrollingFrame", {
        Name = "TabsList",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        Parent = TabsContainer
    })
    
    local UIListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Parent = TabsList
    })
    
    -- Content Container
    local ContentContainer = Create("Frame", {
        Name = "ContentContainer",
        Size = UDim2.new(1, -130, 1, -40),
        Position = UDim2.new(0, 125, 0, 35),
        BackgroundTransparency = 1,
        Parent = MainFrame
    })
    
    -- Tab Title
    local TabTitle = Create("TextLabel", {
        Name = "TabTitle",
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = Themes[Window.Theme].Text,
        TextSize = 16,
        Font = Enum.Font.Gotham,
        Parent = ContentContainer
    })
    
    -- Elements Container
    local ElementsContainer = Create("ScrollingFrame", {
        Name = "ElementsContainer",
        Size = UDim2.new(1, 0, 1, -35),
        Position = UDim2.new(0, 0, 0, 35),
        BackgroundTransparency = 1,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        Parent = ContentContainer
    })
    
    local ElementsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        Parent = ElementsContainer
    })
    
    -- Functions
    function Window:ApplyTheme(themeName)
        if Themes[themeName] then
            Window.Theme = themeName
            local theme = Themes[themeName]
            
            MainFrame.BackgroundColor3 = theme.Main
            TitleBar.BackgroundColor3 = theme.Secondary
            Title.TextColor3 = theme.Text
            MinimizeButton.BackgroundColor3 = theme.Accent
            TabTitle.TextColor3 = theme.Text
            
            -- Update UIStroke
            for _, child in pairs(MainFrame:GetChildren()) do
                if child:IsA("UIStroke") then
                    child.Color = theme.Accent
                end
            end
            
            -- Update all existing elements with new theme
            for _, tab in pairs(Window.Tabs) do
                for _, element in pairs(tab.Elements) do
                    if element.ThemeUpdate then
                        element:ThemeUpdate(theme)
                    end
                end
            end
        end
    end
    
    -- Events
    MakeDraggable(MainFrame, TitleBar)
    
    MinimizeButton.MouseButton1Click:Connect(function()
        Window.Minimized = not Window.Minimized
        if Window.Minimized then
            Tween(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 500, 0, 30)})
            TabsContainer.Visible = false
            ContentContainer.Visible = false
        else
            Tween(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 500, 0, 350)})
            TabsContainer.Visible = true
            ContentContainer.Visible = true
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Window.MinimizeKey then
            Window.Minimized = not Window.Minimized
            if Window.Minimized then
                Tween(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 500, 0, 30)})
                TabsContainer.Visible = false
                ContentContainer.Visible = false
            else
                Tween(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 500, 0, 350)})
                TabsContainer.Visible = true
                ContentContainer.Visible = true
            end
        end
    end)
    
    -- Update tabs list size
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabsList.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    end)
    
    -- Update elements container size
    ElementsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ElementsContainer.CanvasSize = UDim2.new(0, 0, 0, ElementsListLayout.AbsoluteContentSize.Y)
    end)
    
    -- Tab Methods
    function Window:AddTab(name)
        local Tab = {
            Name = name,
            Elements = {}
        }
        
        local TabButton = Create("TextButton", {
            Name = name .. "Tab",
            Size = UDim2.new(0.9, 0, 0, 30),
            BackgroundColor3 = Themes[Window.Theme].Secondary,
            TextColor3 = Themes[Window.Theme].Text,
            Text = name,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            Parent = TabsList
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 4),
            Parent = TabButton
        })
        
        local Pill = Create("Frame", {
            Name = "Pill",
            Size = UDim2.new(0, 3, 0, 0),
            Position = UDim2.new(0, -8, 0.5, 0),
            BackgroundColor3 = Themes[Window.Theme].Accent,
            Visible = false,
            Parent = TabButton
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = Pill
        })
        
        TabButton.MouseButton1Click:Connect(function()
            Window:SwitchTab(Tab)
        end)
        
        table.insert(Window.Tabs, Tab)
        
        if #Window.Tabs == 1 then
            Window:SwitchTab(Tab)
        end
        
        setmetatable(Tab, {
            __index = function(self, index)
                if index == "AddButton" then
                    return function(options, callback)
                        return Window:AddButton(Tab, options, callback)
                    end
                elseif index == "AddToggle" then
                    return function(options, callback)
                        return Window:AddToggle(Tab, options, callback)
                    end
                elseif index == "AddSlider" then
                    return function(options, callback)
                        return Window:AddSlider(Tab, options, callback)
                    end
                end
                return rawget(self, index)
            end
        })
        
        return Tab
    end
    
    function Window:SwitchTab(tab)
        if Window.CurrentTab then
            -- Hide current tab elements
            for _, element in pairs(Window.CurrentTab.Elements) do
                if element.Frame then
                    element.Frame.Visible = false
                end
            end
            -- Reset pill
            local oldButton = TabsList:FindFirstChild(Window.CurrentTab.Name .. "Tab")
            if oldButton then
                oldButton.Pill.Visible = false
                Tween(oldButton.Pill, TweenInfo.new(0.2), {Size = UDim2.new(0, 3, 0, 0)})
            end
        end
        
        Window.CurrentTab = tab
        TabTitle.Text = tab.Name
        
        -- Show new tab elements
        for _, element in pairs(tab.Elements) do
            if element.Frame then
                element.Frame.Visible = true
            end
        end
        
        -- Show pill
        local newButton = TabsList:FindFirstChild(tab.Name .. "Tab")
        if newButton then
            newButton.Pill.Visible = true
            Tween(newButton.Pill, TweenInfo.new(0.2), {Size = UDim2.new(0, 3, 0, 20)})
        end
    end
    
    -- Element Creation Methods
    function Window:AddButton(tab, options, callback)
        options = options or {}
        
        local Button = {
            Type = "Button",
            Value = false
        }
        
        local ButtonFrame = Create("Frame", {
            Name = "Button_" .. options.Name,
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = Themes[Window.Theme].Secondary,
            Parent = ElementsContainer,
            Visible = Window.CurrentTab == tab
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 4),
            Parent = ButtonFrame
        })
        
        local ButtonLabel = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(1, -10, 1, 0),
            Position = UDim2.new(0, 5, 0, 0),
            BackgroundTransparency = 1,
            Text = options.Name or "Button",
            TextColor3 = Themes[Window.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = ButtonFrame
        })
        
        local ButtonButton = Create("TextButton", {
            Name = "Button",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            Parent = ButtonFrame
        })
        
        ButtonButton.MouseButton1Click:Connect(function()
            Button.Value = true
            if callback then
                callback(Button.Value)
            end
            Button.Value = false
        end)
        
        Button.Frame = ButtonFrame
        table.insert(tab.Elements, Button)
        
        return Button
    end
    
    function Window:AddToggle(tab, options, callback)
        options = options or {}
        
        local Toggle = {
            Type = "Toggle",
            Value = options.Default or false
        }
        
        local ToggleFrame = Create("Frame", {
            Name = "Toggle_" .. options.Name,
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = Themes[Window.Theme].Secondary,
            Parent = ElementsContainer,
            Visible = Window.CurrentTab == tab
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 4),
            Parent = ToggleFrame
        })
        
        local ToggleLabel = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(0.7, 0, 1, 0),
            Position = UDim2.new(0, 5, 0, 0),
            BackgroundTransparency = 1,
            Text = options.Name or "Toggle",
            TextColor3 = Themes[Window.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = ToggleFrame
        })
        
        local ToggleButton = Create("TextButton", {
            Name = "Toggle",
            Size = UDim2.new(0, 40, 0, 20),
            Position = UDim2.new(1, -45, 0.5, -10),
            BackgroundColor3 = Toggle.Value and Themes[Window.Theme].Accent or Themes[Window.Theme].Background,
            Text = "",
            Parent = ToggleFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = ToggleButton
        })
        
        local ToggleKnob = Create("Frame", {
            Name = "Knob",
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0, Toggle.Value and 22 or 2, 0.5, -8),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Parent = ToggleButton
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = ToggleKnob
        })
        
        function Toggle:SetValue(value)
            Toggle.Value = value
            Tween(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = value and Themes[Window.Theme].Accent or Themes[Window.Theme].Background})
            Tween(ToggleKnob, TweenInfo.new(0.2), {Position = UDim2.new(0, value and 22 or 2, 0.5, -8)})
            if callback then
                callback(value)
            end
        end
        
        function Toggle:ThemeUpdate(theme)
            ToggleButton.BackgroundColor3 = Toggle.Value and theme.Accent or theme.Background
        end
        
        ToggleButton.MouseButton1Click:Connect(function()
            Toggle:SetValue(not Toggle.Value)
        end)
        
        Toggle.Frame = ToggleFrame
        table.insert(tab.Elements, Toggle)
        
        return Toggle
    end
    
    function Window:AddSlider(tab, options, callback)
        options = options or {}
        
        local Slider = {
            Type = "Slider",
            Value = options.Default or options.Min or 0
        }
        
        local SliderFrame = Create("Frame", {
            Name = "Slider_" .. options.Name,
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundColor3 = Themes[Window.Theme].Secondary,
            Parent = ElementsContainer,
            Visible = Window.CurrentTab == tab
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 4),
            Parent = SliderFrame
        })
        
        local SliderLabel = Create("TextLabel", {
            Name = "Label",
            Size = UDim2.new(1, -10, 0, 20),
            Position = UDim2.new(0, 5, 0, 0),
            BackgroundTransparency = 1,
            Text = options.Name or "Slider",
            TextColor3 = Themes[Window.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = SliderFrame
        })
        
        local ValueLabel = Create("TextLabel", {
            Name = "Value",
            Size = UDim2.new(0, 50, 0, 20),
            Position = UDim2.new(1, -55, 0, 0),
            BackgroundTransparency = 1,
            Text = tostring(Slider.Value),
            TextColor3 = Themes[Window.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Right,
            Parent = SliderFrame
        })
        
        local SliderTrack = Create("Frame", {
            Name = "Track",
            Size = UDim2.new(1, -10, 0, 5),
            Position = UDim2.new(0, 5, 1, -15),
            BackgroundColor3 = Themes[Window.Theme].Background,
            Parent = SliderFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = SliderTrack
        })
        
        local SliderFill = Create("Frame", {
            Name = "Fill",
            Size = UDim2.new(0, 0, 1, 0),
            BackgroundColor3 = Themes[Window.Theme].Accent,
            Parent = SliderTrack
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = SliderFill
        })
        
        local SliderButton = Create("TextButton", {
            Name = "SliderButton",
            Size = UDim2.new(0, 15, 0, 15),
            Position = UDim2.new(0, -7, 0.5, -7),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Text = "",
            Parent = SliderTrack
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = SliderButton
        })
        
        local min = options.Min or 0
        local max = options.Max or 100
        local dragging = false
        
        function Slider:SetValue(value)
            value = math.clamp(value, min, max)
            Slider.Value = value
            local percentage = (value - min) / (max - min)
            SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            SliderButton.Position = UDim2.new(percentage, -7, 0.5, -7)
            ValueLabel.Text = tostring(math.floor(value))
            if callback then
                callback(value)
            end
        end
        
        function Slider:ThemeUpdate(theme)
            SliderTrack.BackgroundColor3 = theme.Background
            SliderFill.BackgroundColor3 = theme.Accent
        end
        
        SliderButton.MouseButton1Down:Connect(function()
            dragging = true
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        SliderTrack.MouseButton1Down:Connect(function(x, y)
            dragging = true
            local relativeX = x - SliderTrack.AbsolutePosition.X
            local percentage = math.clamp(relativeX / SliderTrack.AbsoluteSize.X, 0, 1)
            local value = min + (max - min) * percentage
            Slider:SetValue(value)
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mousePos = UserInputService:GetMouseLocation()
                local relativeX = mousePos.X - SliderTrack.AbsolutePosition.X
                local percentage = math.clamp(relativeX / SliderTrack.AbsoluteSize.X, 0, 1)
                local value = min + (max - min) * percentage
                Slider:SetValue(value)
            end
        end)
        
        Slider:SetValue(Slider.Value)
        Slider.Frame = SliderFrame
        table.insert(tab.Elements, Slider)
        
        return Slider
    end
    
    Window.ScreenGui = ScreenGui
    return Window
end

return NazuX
