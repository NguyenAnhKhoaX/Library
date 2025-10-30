--[[
    NazuX Library - COMPLETE FIXED VERSION
    Modern Roblox UI Library with All Themes
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- Local player
local player = Players.LocalPlayer

-- Complete Theme system
local Themes = {
    White = {
        Background = Color3.fromRGB(255, 255, 255),
        Foreground = Color3.fromRGB(0, 0, 0),
        Primary = Color3.fromRGB(0, 120, 215),
        Secondary = Color3.fromRGB(240, 240, 240),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(0, 0, 0),
        Border = Color3.fromRGB(200, 200, 200)
    },
    Dark = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(0, 120, 215),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(64, 64, 64)
    },
    Darker = {
        Background = Color3.fromRGB(16, 16, 16),
        Foreground = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(0, 120, 215),
        Secondary = Color3.fromRGB(32, 32, 32),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(48, 48, 48)
    },
    Red = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(255, 0, 0),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(255, 0, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(64, 64, 64)
    },
    Yellow = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(255, 255, 0),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(255, 255, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(64, 64, 64)
    },
    Green = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(0, 255, 0),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(0, 255, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(64, 64, 64)
    },
    Cam = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(255, 165, 0),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(255, 165, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(64, 64, 64)
    },
    AMOLED = {
        Background = Color3.fromRGB(0, 0, 0),
        Foreground = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(255, 255, 255),
        Secondary = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(20, 20, 20)
    },
    Rose = {
        Background = Color3.fromRGB(25, 23, 36),
        Foreground = Color3.fromRGB(224, 222, 244),
        Primary = Color3.fromRGB(245, 224, 220),
        Secondary = Color3.fromRGB(38, 35, 58),
        Accent = Color3.fromRGB(235, 111, 146),
        Text = Color3.fromRGB(224, 222, 244),
        Border = Color3.fromRGB(57, 53, 82)
    },
    Github = {
        Background = Color3.fromRGB(13, 17, 23),
        Foreground = Color3.fromRGB(201, 209, 217),
        Primary = Color3.fromRGB(88, 166, 255),
        Secondary = Color3.fromRGB(22, 27, 34),
        Accent = Color3.fromRGB(88, 166, 255),
        Text = Color3.fromRGB(201, 209, 217),
        Border = Color3.fromRGB(48, 54, 61)
    }
}

-- Utility functions
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        if instance[property] ~= nil then
            instance[property] = value
        end
    end
    return instance
end

local function Tween(Object, Info, Properties)
    local Tween = TweenService:Create(Object, Info, Properties)
    Tween:Play()
    return Tween
end

-- Main Window Class - COMPLETELY FIXED
function NazuX:CreateWindow(options)
    options = options or {}
    local window = setmetatable({}, NazuX)
    window.Title = options.Title or "NazuX Library"
    window.Size = options.Size or UDim2.new(0, 500, 0, 400)
    window.Theme = options.Theme or "Dark"
    window.MinimizeKey = options.MinimizeKey or Enum.KeyCode.LeftControl
    window.Tabs = {}
    window.Visible = true
    
    -- FIXED: Wait for PlayerGui to exist
    if not player:FindFirstChild("PlayerGui") then
        player:WaitForChild("PlayerGui")
    end
    
    -- Create main screen GUI
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        Parent = player.PlayerGui
    })
    
    -- Main container
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = Themes[window.Theme].Background,
        BackgroundTransparency = 0.1,
        BorderColor3 = Themes[window.Theme].Border,
        BorderSizePixel = 1,
        Position = UDim2.new(0.5, -window.Size.X.Offset/2, 0.5, -window.Size.Y.Offset/2),
        Size = window.Size,
        ClipsDescendants = true,
        Parent = ScreenGui
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    -- Title bar
    local TitleBar = Create("Frame", {
        Name = "TitleBar",
        BackgroundColor3 = Themes[window.Theme].Secondary,
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        Parent = MainFrame
    })
    
    -- Logo
    local Logo = Create("ImageLabel", {
        Name = "Logo",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Image = "rbxassetid://0",
        Parent = TitleBar
    })
    
    -- Window title (LEFT-ALIGNED)
    local TitleLabel = Create("TextLabel", {
        Name = "TitleLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 40, 0, 0),
        Size = UDim2.new(0, 150, 1, 0),
        Font = Enum.Font.Gotham,
        Text = window.Title,
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = TitleBar
    })
    
    -- Search bar (OPTIMIZED SIZE)
    local SearchBox = Create("TextBox", {
        Name = "SearchBox",
        BackgroundColor3 = Themes[window.Theme].Background,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 200, 0.5, -12),
        Size = UDim2.new(0, 180, 0, 24),
        Font = Enum.Font.Gotham,
        PlaceholderColor3 = Color3.fromRGB(200, 200, 200),
        PlaceholderText = "Tìm kiếm...",
        Text = "",
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = SearchBox
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 8),
        Parent = SearchBox
    })
    
    -- Window controls
    local Controls = Create("Frame", {
        Name = "Controls",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -100, 0, 0),
        Size = UDim2.new(0, 100, 1, 0),
        Parent = TitleBar
    })
    
    local MinimizeButton = Create("TextButton", {
        Name = "MinimizeButton",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(0, 33, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "-",
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 18,
        Parent = Controls
    })
    
    local MaximizeButton = Create("TextButton", {
        Name = "MaximizeButton",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 33, 0, 0),
        Size = UDim2.new(0, 33, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "□",
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 14,
        Parent = Controls
    })
    
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 66, 0, 0),
        Size = UDim2.new(0, 34, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "×",
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 18,
        Parent = Controls
    })
    
    -- User info
    local UserInfo = Create("Frame", {
        Name = "UserInfo",
        BackgroundColor3 = Themes[window.Theme].Secondary,
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(1, 0, 0, 60),
        Parent = MainFrame
    })
    
    local Avatar = Create("ImageLabel", {
        Name = "Avatar",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0.5, -20),
        Size = UDim2.new(0, 40, 0, 40),
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=150&height=150&format=png",
        Parent = UserInfo
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = Avatar
    })
    
    local UserName = Create("TextLabel", {
        Name = "UserName",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 70, 0, 10),
        Size = UDim2.new(0, 200, 0, 20),
        Font = Enum.Font.Gotham,
        Text = player.Name,
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = UserInfo
    })
    
    local DisplayName = Create("TextLabel", {
        Name = "DisplayName",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 70, 0, 30),
        Size = UDim2.new(0, 200, 0, 20),
        Font = Enum.Font.Gotham,
        Text = "@" .. player.DisplayName,
        TextColor3 = Themes[window.Theme].Text,
        TextTransparency = 0.5,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = UserInfo
    })
    
    -- Tabs container
    local TabsContainer = Create("ScrollingFrame", {
        Name = "TabsContainer",
        BackgroundColor3 = Themes[window.Theme].Secondary,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 100),
        Size = UDim2.new(0, 150, 1, -100),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Themes[window.Theme].Primary,
        Parent = MainFrame
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = TabsContainer
    })
    
    -- Content container
    local ContentContainer = Create("Frame", {
        Name = "ContentContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 150, 0, 100),
        Size = UDim2.new(1, -150, 1, -100),
        Parent = MainFrame
    })
    
    local CurrentTabTitle = Create("TextLabel", {
        Name = "CurrentTabTitle",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 20, 0, 10),
        Size = UDim2.new(1, -40, 0, 30),
        Font = Enum.Font.GothamSemibold,
        Text = "",
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = false,
        Parent = ContentContainer
    })
    
    local ContentScrolling = Create("ScrollingFrame", {
        Name = "ContentScrolling",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 50),
        Size = UDim2.new(1, 0, 1, -50),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Themes[window.Theme].Primary,
        Parent = ContentContainer
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = ContentScrolling
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 20),
        PaddingRight = UDim.new(0, 20),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
        Parent = ContentScrolling
    })
    
    -- FIXED: Control buttons functionality
    MinimizeButton.MouseButton1Click:Connect(function()
        window:Minimize()
    end)
    
    MaximizeButton.MouseButton1Click:Connect(function()
        if MainFrame.Size == window.Size then
            MainFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
            MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
        else
            MainFrame.Size = window.Size
            MainFrame.Position = UDim2.new(0.5, -window.Size.X.Offset/2, 0.5, -window.Size.Y.Offset/2)
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        window:Destroy()
    end)
    
    -- FIXED: Minimize key binding
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == window.MinimizeKey then
            window:Minimize()
        end
    end)
    
    -- FIXED: Draggable functionality
    local dragging = false
    local dragInput, dragStart, startPos
    
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
    
    -- Store references
    window.MainFrame = MainFrame
    window.ScreenGui = ScreenGui
    window.TabsContainer = TabsContainer
    window.ContentScrolling = ContentScrolling
    window.CurrentTabTitle = CurrentTabTitle
    window.Themes = Themes
    
    return window
end

-- FIXED: Tab system
function NazuX:CreateTab(name)
    local tab = {}
    tab.Name = name
    tab.Buttons = {}
    
    -- Tab button
    local TabButton = Create("TextButton", {
        Name = name .. "Tab",
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BackgroundTransparency = 0.9,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 40),
        Font = Enum.Font.Gotham,
        Text = name,
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 14,
        Parent = self.TabsContainer
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = TabButton
    })
    
    -- Content frame
    local TabContent = Create("ScrollingFrame", {
        Name = name .. "Content",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        Visible = false,
        Parent = self.ContentScrolling
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = TabContent
    })
    
    tab.Button = TabButton
    tab.Content = TabContent
    
    -- Tab selection
    TabButton.MouseButton1Click:Connect(function()
        self:SelectTab(tab)
    end)
    
    -- FIXED: Update tabs container size
    self.TabsContainer.CanvasSize = UDim2.new(0, 0, 0, (#self.Tabs * 45) + 5)
    
    table.insert(self.Tabs, tab)
    
    -- Select first tab
    if #self.Tabs == 1 then
        self:SelectTab(tab)
    end
    
    -- Tab methods
    function tab:AddButton(options)
        return self.Parent:CreateButton(self, options)
    end
    
    function tab:AddToggle(options)
        return self.Parent:CreateToggle(self, options)
    end
    
    function tab:AddSlider(options)
        return self.Parent:CreateSlider(self, options)
    end
    
    function tab:AddSection(name)
        return self.Parent:CreateSection(self, name)
    end
    
    tab.Parent = self
    
    return tab
end

-- FIXED: Select tab function
function NazuX:SelectTab(tab)
    -- Hide all tab contents
    for _, t in pairs(self.Tabs) do
        t.Content.Visible = false
        t.Button.BackgroundTransparency = 0.9
    end
    
    -- Show selected tab content
    tab.Content.Visible = true
    tab.Button.BackgroundTransparency = 0.7
    
    -- Update current tab title
    self.CurrentTabTitle.Text = tab.Name
    self.CurrentTabTitle.Visible = true
end

-- FIXED: Button element
function NazuX:CreateButton(tab, options)
    local button = {}
    options = options or {}
    
    local ButtonFrame = Create("Frame", {
        Name = "ButtonFrame",
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        LayoutOrder = #tab.Buttons + 1,
        Parent = tab.Content
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = ButtonFrame
    })
    
    local Button = Create("TextButton", {
        Name = "Button",
        BackgroundColor3 = self.Themes[self.Theme].Primary,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 5, 0, 5),
        Size = UDim2.new(1, -10, 1, -10),
        Font = Enum.Font.Gotham,
        Text = options.Name or "Button",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Parent = ButtonFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = Button
    })
    
    -- Hover effects
    Button.MouseEnter:Connect(function()
        Tween(Button, TweenInfo.new(0.2), {BackgroundTransparency = 0})
    end)
    
    Button.MouseLeave:Connect(function()
        Tween(Button, TweenInfo.new(0.2), {BackgroundTransparency = 0.2})
    end)
    
    -- Click callback
    if options.Callback then
        Button.MouseButton1Click:Connect(function()
            options.Callback()
        end)
    end
    
    -- FIXED: Update content size
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, (#tab.Buttons + 1) * 50)
    
    table.insert(tab.Buttons, ButtonFrame)
    
    return button
end

-- FIXED: Toggle element
function NazuX:CreateToggle(tab, options)
    local toggle = {}
    options = options or {}
    toggle.Value = options.Default or false
    
    local ToggleFrame = Create("Frame", {
        Name = "ToggleFrame",
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        LayoutOrder = #tab.Buttons + 1,
        Parent = tab.Content
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = ToggleFrame
    })
    
    local ToggleLabel = Create("TextLabel", {
        Name = "ToggleLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(0.7, -10, 1, 0),
        Font = Enum.Font.Gotham,
        Text = options.Name or "Toggle",
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = ToggleFrame
    })
    
    local ToggleButton = Create("TextButton", {
        Name = "ToggleButton",
        BackgroundColor3 = Color3.fromRGB(80, 80, 80),
        BorderSizePixel = 0,
        Position = UDim2.new(1, -50, 0.5, -10),
        Size = UDim2.new(0, 40, 0, 20),
        Font = Enum.Font.Gotham,
        Text = "",
        Parent = ToggleFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = ToggleButton
    })
    
    local ToggleKnob = Create("Frame", {
        Name = "ToggleKnob",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        Position = UDim2.new(0, 2, 0.5, -8),
        Size = UDim2.new(0, 16, 0, 16),
        Parent = ToggleButton
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = ToggleKnob
    })
    
    local function updateToggle()
        if toggle.Value then
            Tween(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = self.Themes[self.Theme].Primary})
            Tween(ToggleKnob, TweenInfo.new(0.2), {Position = UDim2.new(0, 22, 0.5, -8)})
        else
            Tween(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)})
            Tween(ToggleKnob, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -8)})
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(function()
        toggle.Value = not toggle.Value
        updateToggle()
        if options.Callback then
            options.Callback(toggle.Value)
        end
    end)
    
    updateToggle()
    
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, (#tab.Buttons + 1) * 50)
    
    table.insert(tab.Buttons, ToggleFrame)
    
    return toggle
end

-- FIXED: Section element
function NazuX:CreateSection(tab, name)
    local section = {}
    
    local SectionFrame = Create("Frame", {
        Name = "SectionFrame",
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BackgroundTransparency = 0.9,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        LayoutOrder = #tab.Buttons + 1,
        Parent = tab.Content
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = SectionFrame
    })
    
    local SectionLabel = Create("TextLabel", {
        Name = "SectionLabel",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.GothamSemibold,
        Text = name,
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 16,
        Parent = SectionFrame
    })
    
    section.Parent = self
    section.Frame = SectionFrame
    
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, (#tab.Buttons + 1) * 50)
    
    table.insert(tab.Buttons, SectionFrame)
    
    return section
end

-- FIXED: Window methods
function NazuX:Minimize()
    self.Visible = not self.Visible
    self.MainFrame.Visible = self.Visible
end

function NazuX:Destroy()
    self.ScreenGui:Destroy()
end

function NazuX:SetTheme(themeName)
    if self.Themes[themeName] then
        self.Theme = themeName
        -- Simple theme update (can be enhanced)
        self.MainFrame.BackgroundColor3 = self.Themes[themeName].Background
        self.MainFrame.TitleBar.BackgroundColor3 = self.Themes[themeName].Secondary
    end
end

return NazuX
