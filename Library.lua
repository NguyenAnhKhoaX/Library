--[[
    NazuX Library
    Created with modern Windows 11 style
    Transparent UI with smooth animations
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Player
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Minimize Key
NazuX.MinimizeKey = Enum.KeyCode.LeftControl

-- Colors
local ThemeColors = {
    Background = Color3.fromRGB(30, 30, 30),
    Secondary = Color3.fromRGB(40, 40, 40),
    Accent = Color3.fromRGB(0, 120, 215),
    Text = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(200, 200, 200)
}

-- Utility Functions
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

local function Tween(Object, Properties, Duration, Style, Direction)
    local TweenInfo = TweenInfo.new(Duration or 0.3, Style or Enum.EasingStyle.Quad, Direction or Enum.EasingDirection.Out)
    local Tween = TweenService:Create(Object, TweenInfo, Properties)
    Tween:Play()
    return Tween
end

-- Main Window Creation
function NazuX:CreateWindow(options)
    options = options or {}
    local Window = {
        Tabs = {},
        CurrentTab = nil,
        Minimized = false
    }
    setmetatable(Window, self)
    
    -- Create ScreenGui
    Window.ScreenGui = Create("ScreenGui", {
        Name = "NazuXUI",
        Parent = PlayerGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    })
    
    -- Main Container
    Window.MainFrame = Create("Frame", {
        Parent = Window.ScreenGui,
        Size = UDim2.new(0, 600, 0, 400),
        Position = UDim2.new(0.5, -300, 0.5, -200),
        BackgroundColor3 = ThemeColors.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    -- Corner Radius
    Create("UICorner", {
        Parent = Window.MainFrame,
        CornerRadius = UDim.new(0, 8)
    })
    
    -- Drop Shadow
    local Shadow = Create("ImageLabel", {
        Parent = Window.MainFrame,
        Name = "Shadow",
        Image = "rbxassetid://1316045217",
        ImageColor3 = Color3.new(0, 0, 0),
        ImageTransparency = 0.88,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
        Size = UDim2.new(1, 20, 1, 20),
        Position = UDim2.new(0, -10, 0, -10),
        BackgroundTransparency = 1,
        ZIndex = 0
    })
    
    -- Title Bar
    Window.TitleBar = Create("Frame", {
        Parent = Window.MainFrame,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = ThemeColors.Secondary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = Window.TitleBar,
        CornerRadius = UDim.new(0, 8, 0, 0)
    })
    
    -- Search Bar in Title Bar
    Window.SearchFrame = Create("Frame", {
        Parent = Window.TitleBar,
        Size = UDim2.new(0, 200, 0, 30),
        Position = UDim2.new(0.5, -100, 0.5, -15),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = Window.SearchFrame,
        CornerRadius = UDim.new(0, 6)
    })
    
    Window.SearchBox = Create("TextBox", {
        Parent = Window.SearchFrame,
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 35, 0, 0),
        BackgroundTransparency = 1,
        Text = "Search...",
        TextColor3 = ThemeColors.TextSecondary,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local SearchIcon = Create("ImageLabel", {
        Parent = Window.SearchFrame,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 8, 0.5, -10),
        BackgroundTransparency = 1,
        Image = "rbxassetid://3926305904",
        ImageRectOffset = Vector2.new(964, 324),
        ImageRectSize = Vector2.new(36, 36),
        ImageColor3 = ThemeColors.TextSecondary
    })
    
    -- Window Controls
    local Controls = {"Minimize", "Maximize", "Close"}
    local ControlIcons = {
        Minimize = "rbxassetid://3926305904",
        Maximize = "rbxassetid://3926305904", 
        Close = "rbxassetid://3926305904"
    }
    
    Window.ControlButtons = {}
    for i, control in ipairs(Controls) do
        local Button = Create("TextButton", {
            Parent = Window.TitleBar,
            Size = UDim2.new(0, 30, 0, 30),
            Position = UDim2.new(1, -35 * (4 - i), 0.5, -15),
            BackgroundColor3 = ThemeColors.Secondary,
            Text = "",
            BorderSizePixel = 0
        })
        
        Create("UICorner", {
            Parent = Button,
            CornerRadius = UDim.new(0, 6)
        })
        
        local Icon = Create("ImageLabel", {
            Parent = Button,
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0.5, -8, 0.5, -8),
            BackgroundTransparency = 1,
            Image = ControlIcons[control],
            ImageColor3 = ThemeColors.Text
        })
        
        if control == "Minimize" then
            Icon.ImageRectOffset = Vector2.new(4, 124)
            Icon.ImageRectSize = Vector2.new(36, 36)
        elseif control == "Maximize" then
            Icon.ImageRectOffset = Vector2.new(44, 124)
            Icon.ImageRectSize = Vector2.new(36, 36)
        elseif control == "Close" then
            Icon.ImageRectOffset = Vector2.new(924, 284)
            Icon.ImageRectSize = Vector2.new(36, 36)
        end
        
        Window.ControlButtons[control] = Button
        
        -- Button interactions
        Button.MouseEnter:Connect(function()
            Tween(Button, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, 0.2)
        end)
        
        Button.MouseLeave:Connect(function()
            Tween(Button, {BackgroundColor3 = ThemeColors.Secondary}, 0.2)
        end)
    end
    
    -- User Info Section (Above Tabs)
    Window.UserInfoFrame = Create("Frame", {
        Parent = Window.MainFrame,
        Size = UDim2.new(1, 0, 0, 60),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1
    })
    
    -- Avatar (Circular, Left Side)
    Window.Avatar = Create("ImageLabel", {
        Parent = Window.UserInfoFrame,
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 15, 0.5, -20),
        BackgroundColor3 = ThemeColors.Secondary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = Window.Avatar,
        CornerRadius = UDim.new(1, 0)
    })
    
    -- User Info Text
    Window.UserName = Create("TextLabel", {
        Parent = Window.UserInfoFrame,
        Size = UDim2.new(0, 200, 0, 20),
        Position = UDim2.new(0, 70, 0.3, 0),
        BackgroundTransparency = 1,
        Text = LocalPlayer.Name,
        TextColor3 = ThemeColors.Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    Window.UserId = Create("TextLabel", {
        Parent = Window.UserInfoFrame,
        Size = UDim2.new(0, 200, 0, 16),
        Position = UDim2.new(0, 70, 0.6, 0),
        BackgroundTransparency = 1,
        Text = "ID: " .. LocalPlayer.UserId,
        TextColor3 = ThemeColors.TextSecondary,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Load Avatar
    pcall(function()
        local Thumbnail = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        Window.Avatar.Image = Thumbnail
    end)
    
    -- Tab Container
    Window.TabContainer = Create("Frame", {
        Parent = Window.MainFrame,
        Size = UDim2.new(0, 150, 0, 300),
        Position = UDim2.new(0, 0, 0, 100),
        BackgroundTransparency = 1
    })
    
    -- Content Container
    Window.ContentContainer = Create("Frame", {
        Parent = Window.MainFrame,
        Size = UDim2.new(1, -150, 1, -140),
        Position = UDim2.new(0, 150, 0, 100),
        BackgroundTransparency = 1,
        ClipsDescendants = true
    })
    
    -- Tab Title Bar
    Window.TabTitle = Create("Frame", {
        Parent = Window.ContentContainer,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = ThemeColors.Secondary,
        BorderSizePixel = 0
    })
    
    Window.TabTitleText = Create("TextLabel", {
        Parent = Window.TabTitle,
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = "Welcome",
        TextColor3 = ThemeColors.Text,
        TextSize = 18,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Tab Content
    Window.TabContent = Create("ScrollingFrame", {
        Parent = Window.ContentContainer,
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = ThemeColors.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    Create("UIListLayout", {
        Parent = Window.TabContent,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    -- Control Button Functionality
    Window.ControlButtons.Minimize.MouseButton1Click:Connect(function()
        Window:Minimize()
    end)
    
    Window.ControlButtons.Close.MouseButton1Click:Connect(function()
        Window:Destroy()
    end)
    
    -- Search Functionality
    Window.SearchBox.Focused:Connect(function()
        if Window.SearchBox.Text == "Search..." then
            Window.SearchBox.Text = ""
            Window.SearchBox.TextColor3 = ThemeColors.Text
        end
    end)
    
    Window.SearchBox.FocusLost:Connect(function()
        if Window.SearchBox.Text == "" then
            Window.SearchBox.Text = "Search..."
            Window.SearchBox.TextColor3 = ThemeColors.TextSecondary
        end
    end)
    
    -- Minimize Key Binding
    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == NazuX.MinimizeKey then
            Window:Minimize()
        end
    end)
    
    -- Make Window Draggable
    local Dragging, DragInput, DragStart, StartPosition
    
    local function Update(input)
        local Delta = input.Position - DragStart
        Window.MainFrame.Position = UDim2.new(
            StartPosition.X.Scale, 
            StartPosition.X.Offset + Delta.X, 
            StartPosition.Y.Scale, 
            StartPosition.Y.Offset + Delta.Y
        )
    end
    
    Window.TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = input.Position
            StartPosition = Window.MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    
    Window.TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            Update(input)
        end
    end)
    
    -- Loading Animation
    Window:ShowLoading()
    
    return Window
end

-- Loading Function
function NazuX:ShowLoading()
    local LoadingFrame = Create("Frame", {
        Parent = self.MainFrame,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = ThemeColors.Background,
        BackgroundTransparency = 0,
        ZIndex = 10
    })
    
    Create("UICorner", {
        Parent = LoadingFrame,
        CornerRadius = UDim.new(0, 8)
    })
    
    local LoadingText = Create("TextLabel", {
        Parent = LoadingFrame,
        Size = UDim2.new(0, 200, 0, 30),
        Position = UDim2.new(0.5, -100, 0.5, -15),
        BackgroundTransparency = 1,
        Text = "Loading NazuX...",
        TextColor3 = ThemeColors.Text,
        TextSize = 18,
        Font = Enum.Font.GothamSemibold
    })
    
    -- Simulate loading
    wait(1.5)
    Tween(LoadingFrame, {BackgroundTransparency = 1}, 0.5)
    wait(0.5)
    LoadingFrame:Destroy()
end

-- Minimize Function
function NazuX:Minimize()
    if self.Minimized then
        -- Restore
        Tween(self.MainFrame, {Size = UDim2.new(0, 600, 0, 400)}, 0.3)
        Tween(self.MainFrame, {Position = UDim2.new(0.5, -300, 0.5, -200)}, 0.3)
        self.Minimized = false
    else
        -- Minimize
        Tween(self.MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        Tween(self.MainFrame, {Position = UDim2.new(1, -10, 1, -10)}, 0.3)
        self.Minimized = true
    end
end

-- Destroy Function
function NazuX:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
end

-- Tab Creation
function NazuX:CreateTab(name, icon)
    local Tab = {
        Name = name,
        Buttons = {},
        Elements = {}
    }
    
    -- Tab Button
    Tab.Button = Create("TextButton", {
        Parent = self.TabContainer,
        Size = UDim2.new(1, -10, 0, 40),
        Position = UDim2.new(0, 5, 0, #self.Tabs * 45),
        BackgroundColor3 = ThemeColors.Secondary,
        BackgroundTransparency = 0.8,
        Text = "",
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = Tab.Button,
        CornerRadius = UDim.new(0, 6)
    })
    
    local TabText = Create("TextLabel", {
        Parent = Tab.Button,
        Size = UDim2.new(1, -15, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = ThemeColors.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Tab Content Frame
    Tab.Content = Create("ScrollingFrame", {
        Parent = self.TabContent,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = ThemeColors.Accent,
        Visible = false,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    local ContentLayout = Create("UIListLayout", {
        Parent = Tab.Content,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    })
    
    Create("UIPadding", {
        Parent = Tab.Content,
        PaddingLeft = UDim.new(0, 15),
        PaddingTop = UDim.new(0, 15)
    })
    
    -- Tab Selection
    Tab.Button.MouseButton1Click:Connect(function()
        self:SelectTab(Tab)
    end)
    
    table.insert(self.Tabs, Tab)
    
    -- Select first tab
    if #self.Tabs == 1 then
        self:SelectTab(Tab)
    end
    
    return Tab
end

-- Tab Selection
function NazuX:SelectTab(tab)
    if self.CurrentTab then
        self.CurrentTab.Content.Visible = false
        Tween(self.CurrentTab.Button, {BackgroundTransparency = 0.8}, 0.2)
    end
    
    self.CurrentTab = tab
    tab.Content.Visible = true
    Tween(tab.Button, {BackgroundTransparency = 0.5}, 0.2)
    self.TabTitleText.Text = tab.Name
end

-- UI Elements
function NazuX:AddButton(tab, config)
    config = config or {}
    
    local Button = Create("TextButton", {
        Parent = tab.Content,
        Size = UDim2.new(1, -30, 0, 40),
        BackgroundColor3 = ThemeColors.Secondary,
        BackgroundTransparency = 0.5,
        Text = config.Text or "Button",
        TextColor3 = ThemeColors.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        AutoButtonColor = false,
        LayoutOrder = #tab.Elements + 1
    })
    
    Create("UICorner", {
        Parent = Button,
        CornerRadius = UDim.new(0, 6)
    })
    
    -- Hover effects
    Button.MouseEnter:Connect(function()
        Tween(Button, {BackgroundTransparency = 0.3}, 0.2)
    end)
    
    Button.MouseLeave:Connect(function()
        Tween(Button, {BackgroundTransparency = 0.5}, 0.2)
    end)
    
    Button.MouseButton1Click:Connect(function()
        if config.Callback then
            config.Callback()
        end
    end)
    
    table.insert(tab.Elements, Button)
    return Button
end

function NazuX:AddToggle(tab, config)
    config = config or {}
    
    local Toggle = {
        Value = config.Default or false
    }
    
    local ToggleFrame = Create("Frame", {
        Parent = tab.Content,
        Size = UDim2.new(1, -30, 0, 40),
        BackgroundTransparency = 1,
        LayoutOrder = #tab.Elements + 1
    })
    
    local ToggleButton = Create("TextButton", {
        Parent = ToggleFrame,
        Size = UDim2.new(0, 40, 0, 20),
        Position = UDim2.new(1, -45, 0.5, -10),
        BackgroundColor3 = ThemeColors.Secondary,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("UICorner", {
        Parent = ToggleButton,
        CornerRadius = UDim.new(1, 0)
    })
    
    local ToggleKnob = Create("Frame", {
        Parent = ToggleButton,
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = ThemeColors.Text,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = ToggleKnob,
        CornerRadius = UDim.new(1, 0)
    })
    
    local ToggleText = Create("TextLabel", {
        Parent = ToggleFrame,
        Size = UDim2.new(1, -60, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "Toggle",
        TextColor3 = ThemeColors.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local function UpdateToggle()
        if Toggle.Value then
            Tween(ToggleButton, {BackgroundColor3 = ThemeColors.Accent}, 0.2)
            Tween(ToggleKnob, {Position = UDim2.new(1, -18, 0.5, -8)}, 0.2)
        else
            Tween(ToggleButton, {BackgroundColor3 = ThemeColors.Secondary}, 0.2)
            Tween(ToggleKnob, {Position = UDim2.new(0, 2, 0.5, -8)}, 0.2)
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(function()
        Toggle.Value = not Toggle.Value
        UpdateToggle()
        if config.Callback then
            config.Callback(Toggle.Value)
        end
    end)
    
    UpdateToggle()
    table.insert(tab.Elements, ToggleFrame)
    return Toggle
end

function NazuX:AddSlider(tab, config)
    config = config or {}
    
    local Slider = {
        Value = config.Default or config.Min or 0
    }
    
    local SliderFrame = Create("Frame", {
        Parent = tab.Content,
        Size = UDim2.new(1, -30, 0, 60),
        BackgroundTransparency = 1,
        LayoutOrder = #tab.Elements + 1
    })
    
    local SliderText = Create("TextLabel", {
        Parent = SliderFrame,
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Text = config.Text or "Slider",
        TextColor3 = ThemeColors.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local ValueText = Create("TextLabel", {
        Parent = SliderFrame,
        Size = UDim2.new(0, 60, 0, 20),
        Position = UDim2.new(1, -60, 0, 0),
        BackgroundTransparency = 1,
        Text = tostring(Slider.Value),
        TextColor3 = ThemeColors.TextSecondary,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right
    })
    
    local SliderTrack = Create("Frame", {
        Parent = SliderFrame,
        Size = UDim2.new(1, 0, 0, 6),
        Position = UDim2.new(0, 0, 1, -20),
        BackgroundColor3 = ThemeColors.Secondary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = SliderTrack,
        CornerRadius = UDim.new(1, 0)
    })
    
    local SliderFill = Create("Frame", {
        Parent = SliderTrack,
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = ThemeColors.Accent,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = SliderFill,
        CornerRadius = UDim.new(1, 0)
    })
    
    local SliderButton = Create("TextButton", {
        Parent = SliderTrack,
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(0, -8, 0.5, -8),
        BackgroundColor3 = ThemeColors.Text,
        Text = "",
        BorderSizePixel = 0,
        ZIndex = 2
    })
    
    Create("UICorner", {
        Parent = SliderButton,
        CornerRadius = UDim.new(1, 0)
    })
    
    local min = config.Min or 0
    local max = config.Max or 100
    
    local function UpdateSlider(value)
        local percentage = (value - min) / (max - min)
        SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
        SliderButton.Position = UDim2.new(percentage, -8, 0.5, -8)
        ValueText.Text = tostring(math.floor(value))
        Slider.Value = value
    end
    
    local Dragging = false
    
    local function UpdateInput(input)
        local relativeX = (input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X
        local value = math.floor(min + (max - min) * math.clamp(relativeX, 0, 1))
        UpdateSlider(value)
        if config.Callback then
            config.Callback(value)
        end
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        Dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            UpdateInput(input)
        end
    end)
    
    SliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            UpdateInput(input)
        end
    end)
    
    UpdateSlider(Slider.Value)
    table.insert(tab.Elements, SliderFrame)
    return Slider
end

function NazuX:AddLabel(tab, config)
    config = config or {}
    
    local Label = Create("TextLabel", {
        Parent = tab.Content,
        Size = UDim2.new(1, -30, 0, 30),
        BackgroundTransparency = 1,
        Text = config.Text or "Label",
        TextColor3 = ThemeColors.Text,
        TextSize = config.Size or 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = #tab.Elements + 1
    })
    
    table.insert(tab.Elements, Label)
    return Label
end

-- Export the library
return NazuX
