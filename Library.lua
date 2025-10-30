--[[
    NazuX Library
    Modern Roblox UI Library with Windows 11 style
    Created with transparency, smooth animations, and multiple themes
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

-- Theme system
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
        instance[property] = value
    end
    return instance
end

local function Tween(Object, Info, Properties)
    local Tween = TweenService:Create(Object, Info, Properties)
    Tween:Play()
    return Tween
end

-- Main Window Class
function NazuX:CreateWindow(options)
    options = options or {}
    local window = setmetatable({}, NazuX)
    window.Title = options.Title or "NazuX Library"
    window.Size = options.Size or UDim2.new(0, 500, 0, 400)
    window.Theme = options.Theme or "Dark"
    window.MinimizeKey = options.MinimizeKey or Enum.KeyCode.LeftControl
    window.Tabs = {}
    window.Visible = true
    
    -- Create main screen GUI
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        Parent = player:WaitForChild("PlayerGui")
    })
    
    -- Loading screen
    local LoadingFrame = Create("Frame", {
        Name = "LoadingFrame",
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 0,
        Parent = ScreenGui
    })
    
    local LoadingLabel = Create("TextLabel", {
        Name = "LoadingLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, -100, 0.5, -20),
        Size = UDim2.new(0, 200, 0, 40),
        Font = Enum.Font.Gotham,
        Text = "Loading NazuX...",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 20,
        Parent = LoadingFrame
    })
    
    local LoadingBar = Create("Frame", {
        Name = "LoadingBar",
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -100, 0.5, 30),
        Size = UDim2.new(0, 200, 0, 4),
        Parent = LoadingFrame
    })
    
    local LoadingBarFill = Create("Frame", {
        Name = "LoadingBarFill",
        BackgroundColor3 = Color3.fromRGB(0, 120, 215),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 0, 1, 0),
        Parent = LoadingBar
    })
    
    -- Simulate loading
    spawn(function()
        for i = 1, 100 do
            LoadingBarFill.Size = UDim2.new(0, (i * 2), 1, 0)
            LoadingLabel.Text = "Loading NazuX... " .. i .. "%"
            wait(0.02)
        end
        wait(0.5)
        Tween(LoadingFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        wait(0.5)
        LoadingFrame:Destroy()
    end)
    
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
    
    -- Corner
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    -- Drop shadow
    local Shadow = Create("ImageLabel", {
        Name = "Shadow",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, -15, 0, -15),
        Size = UDim2.new(1, 30, 1, 30),
        Image = "rbxassetid://1316045217",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.5,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
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
    
    -- User info (above tabs)
    local UserInfo = Create("Frame", {
        Name = "UserInfo",
        BackgroundColor3 = Themes[window.Theme].Secondary,
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(1, 0, 0, 60),
        Parent = MainFrame
    })
    
    -- User avatar (left, rounded)
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
    
    -- User name
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
    
    -- User display name
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
    
    -- Search bar in title bar
    local SearchBox = Create("TextBox", {
        Name = "SearchBox",
        BackgroundColor3 = Themes[window.Theme].Background,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -150, 0.5, -15),
        Size = UDim2.new(0, 300, 0, 30),
        Font = Enum.Font.Gotham,
        PlaceholderColor3 = Color3.fromRGB(200, 200, 200),
        PlaceholderText = "Search...",
        Text = "",
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = SearchBox
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 10),
        Parent = SearchBox
    })
    
    -- Logo in title bar (left)
    local Logo = Create("ImageLabel", {
        Name = "Logo",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Image = "rbxassetid://0", -- Add your logo asset ID here
        Parent = TitleBar
    })
    
    -- Window title (centered)
    local TitleLabel = Create("TextLabel", {
        Name = "TitleLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, -100, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        Font = Enum.Font.Gotham,
        Text = window.Title,
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 16,
        Parent = TitleBar
    })
    
    -- Window controls (right)
    local Controls = Create("Frame", {
        Name = "Controls",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -100, 0, 0),
        Size = UDim2.new(0, 100, 1, 0),
        Parent = TitleBar
    })
    
    -- Minimize button
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
    
    -- Maximize button
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
    
    -- Close button
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
    
    -- Tabs container (left, transparent)
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
    
    -- Content container (right)
    local ContentContainer = Create("Frame", {
        Name = "ContentContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 150, 0, 100),
        Size = UDim2.new(1, -150, 1, -100),
        Parent = MainFrame
    })
    
    -- Current tab title
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
    
    -- Content scrolling frame
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
    
    -- Draggable functionality
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
    
    -- Window controls functionality
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
    
    -- Minimize key binding
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == window.MinimizeKey then
            window:Minimize()
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

-- Tab system
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
    
    -- Content frame for this tab
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
    
    -- Update tabs container size
    self.TabsContainer.CanvasSize = UDim2.new(0, 0, 0, (#self.Tabs * 45) + 5)
    
    table.insert(self.Tabs, tab)
    
    -- Select first tab
    if #self.Tabs == 1 then
        self:SelectTab(tab)
    end
    
    -- Tab methods
    function tab:AddButton(options)
        return self:CreateButton(options)
    end
    
    function tab:AddToggle(options)
        return self:CreateToggle(options)
    end
    
    function tab:AddSlider(options)
        return self:CreateSlider(options)
    end
    
    function tab:AddSection(name)
        return self:CreateSection(name)
    end
    
    -- Store reference to parent window
    tab.Parent = self
    
    return tab
end

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

-- Button element
function NazuX:CreateButton(options)
    local button = {}
    options = options or {}
    
    local ButtonFrame = Create("Frame", {
        Name = "ButtonFrame",
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        LayoutOrder = #self.Buttons + 1,
        Parent = self.Content
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
    
    -- Update content size
    self.Content.CanvasSize = UDim2.new(0, 0, 0, (#self.Buttons + 1) * 50)
    
    table.insert(self.Buttons, ButtonFrame)
    
    return button
end

-- Toggle element
function NazuX:CreateToggle(options)
    local toggle = {}
    options = options or {}
    toggle.Value = options.Default or false
    
    local ToggleFrame = Create("Frame", {
        Name = "ToggleFrame",
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        LayoutOrder = #self.Buttons + 1,
        Parent = self.Content
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
            Tween(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = self.Themes[self.Parent.Theme].Primary})
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
    
    -- Update content size
    self.Content.CanvasSize = UDim2.new(0, 0, 0, (#self.Buttons + 1) * 50)
    
    table.insert(self.Buttons, ToggleFrame)
    
    return toggle
end

-- Slider element
function NazuX:CreateSlider(options)
    local slider = {}
    options = options or {}
    slider.Value = options.Default or options.Min or 0
    slider.Min = options.Min or 0
    slider.Max = options.Max or 100
    
    local SliderFrame = Create("Frame", {
        Name = "SliderFrame",
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 60),
        LayoutOrder = #self.Buttons + 1,
        Parent = self.Content
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = SliderFrame
    })
    
    local SliderLabel = Create("TextLabel", {
        Name = "SliderLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 5),
        Size = UDim2.new(1, -20, 0, 20),
        Font = Enum.Font.Gotham,
        Text = options.Name or "Slider",
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SliderFrame
    })
    
    local ValueLabel = Create("TextLabel", {
        Name = "ValueLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 5),
        Size = UDim2.new(1, -20, 0, 20),
        Font = Enum.Font.Gotham,
        Text = tostring(slider.Value),
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = SliderFrame
    })
    
    local SliderTrack = Create("Frame", {
        Name = "SliderTrack",
        BackgroundColor3 = Color3.fromRGB(80, 80, 80),
        BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 35),
        Size = UDim2.new(1, -20, 0, 5),
        Parent = SliderFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = SliderTrack
    })
    
    local SliderFill = Create("Frame", {
        Name = "SliderFill",
        BackgroundColor3 = self.Themes[self.Theme].Primary,
        BorderSizePixel = 0,
        Size = UDim2.new((slider.Value - slider.Min) / (slider.Max - slider.Min), 0, 1, 0),
        Parent = SliderTrack
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = SliderFill
    })
    
    local SliderButton = Create("TextButton", {
        Name = "SliderButton",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Text = "",
        Parent = SliderTrack
    })
    
    local dragging = false
    
    local function updateSlider(value)
        value = math.clamp(value, slider.Min, slider.Max)
        slider.Value = value
        ValueLabel.Text = tostring(math.floor(value))
        SliderFill.Size = UDim2.new((value - slider.Min) / (slider.Max - slider.Min), 0, 1, 0)
        
        if options.Callback then
            options.Callback(value)
        end
    end
    
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
            local trackPos = SliderTrack.AbsolutePosition
            local trackSize = SliderTrack.AbsoluteSize
            local relativeX = (mousePos.X - trackPos.X) / trackSize.X
            local value = slider.Min + (relativeX * (slider.Max - slider.Min))
            updateSlider(value)
        end
    end)
    
    -- Update content size
    self.Content.CanvasSize = UDim2.new(0, 0, 0, (#self.Buttons + 1) * 65)
    
    table.insert(self.Buttons, SliderFrame)
    
    return slider
end

-- Section element
function NazuX:CreateSection(name)
    local section = {}
    
    local SectionFrame = Create("Frame", {
        Name = "SectionFrame",
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BackgroundTransparency = 0.9,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        LayoutOrder = #self.Buttons + 1,
        Parent = self.Content
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
    
    -- Section methods
    function section:AddButton(options)
        return self.Parent:CreateButton(options)
    end
    
    function section:AddToggle(options)
        return self.Parent:CreateToggle(options)
    end
    
    function section:AddSlider(options)
        return self.Parent:CreateSlider(options)
    end
    
    section.Parent = self
    section.Frame = SectionFrame
    
    -- Update content size
    self.Content.CanvasSize = UDim2.new(0, 0, 0, (#self.Buttons + 1) * 50)
    
    table.insert(self.Buttons, SectionFrame)
    
    return section
end

-- Notification system
function NazuX:Notify(title, content, duration)
    duration = duration or 5
    
    local Notification = Create("Frame", {
        Name = "Notification",
        BackgroundColor3 = self.Themes[self.Theme].Background,
        BackgroundTransparency = 0.1,
        BorderColor3 = self.Themes[self.Theme].Border,
        BorderSizePixel = 1,
        Position = UDim2.new(1, 10, 1, -150),
        Size = UDim2.new(0, 300, 0, 100),
        Parent = self.ScreenGui
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = Notification
    })
    
    local Shadow = Create("ImageLabel", {
        Name = "Shadow",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, -15, 0, -15),
        Size = UDim2.new(1, 30, 1, 30),
        Image = "rbxassetid://1316045217",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.5,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
        Parent = Notification
    })
    
    local Title = Create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 10),
        Size = UDim2.new(1, -30, 0, 20),
        Font = Enum.Font.GothamSemibold,
        Text = title,
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Notification
    })
    
    local Content = Create("TextLabel", {
        Name = "Content",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 35),
        Size = UDim2.new(1, -30, 1, -45),
        Font = Enum.Font.Gotham,
        Text = content,
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Parent = Notification
    })
    
    -- Animate in
    Notification.Position = UDim2.new(1, 10, 1, 10)
    Tween(Notification, TweenInfo.new(0.3), {Position = UDim2.new(1, -310, 1, -150)})
    
    -- Auto remove after duration
    delay(duration, function()
        Tween(Notification, TweenInfo.new(0.3), {Position = UDim2.new(1, 10, 1, 10)})
        wait(0.3)
        Notification:Destroy()
    end)
end

-- Theme system
function NazuX:SetTheme(themeName)
    if Themes[themeName] then
        self.Theme = themeName
        self:UpdateTheme()
    end
end

function NazuX:UpdateTheme()
    local theme = Themes[self.Theme]
    
    -- Update main colors
    self.MainFrame.BackgroundColor3 = theme.Background
    self.MainFrame.BorderColor3 = theme.Border
    
    -- Update title bar
    self.MainFrame.TitleBar.BackgroundColor3 = theme.Secondary
    self.MainFrame.TitleBar.TitleLabel.TextColor3 = theme.Text
    self.MainFrame.TitleBar.Controls.MinimizeButton.TextColor3 = theme.Text
    self.MainFrame.TitleBar.Controls.MaximizeButton.TextColor3 = theme.Text
    self.MainFrame.TitleBar.Controls.CloseButton.TextColor3 = theme.Text
    
    -- Update user info
    self.MainFrame.UserInfo.BackgroundColor3 = theme.Secondary
    self.MainFrame.UserInfo.UserName.TextColor3 = theme.Text
    self.MainFrame.UserInfo.DisplayName.TextColor3 = theme.Text
    
    -- Update search box
    self.MainFrame.TitleBar.SearchBox.BackgroundColor3 = theme.Background
    self.MainFrame.TitleBar.SearchBox.TextColor3 = theme.Text
    
    -- Update tabs
    self.MainFrame.TabsContainer.BackgroundColor3 = theme.Secondary
    self.MainFrame.TabsContainer.ScrollBarImageColor3 = theme.Primary
    
    -- Update content
    self.MainFrame.ContentContainer.CurrentTabTitle.TextColor3 = theme.Text
    self.MainFrame.ContentContainer.ContentScrolling.ScrollBarImageColor3 = theme.Primary
end

-- Window methods
function NazuX:Minimize()
    self.Visible = not self.Visible
    self.MainFrame.Visible = self.Visible
end

function NazuX:Destroy()
    self.ScreenGui:Destroy()
end

-- Make tab methods available
for methodName, method in pairs(NazuX) do
    if string.sub(methodName, 1, 1) ~= "_" and type(method) == "function" then
        local tabMeta = getmetatable(NazuX) or {}
        tabMeta[methodName] = method
    end
end

return NazuX
