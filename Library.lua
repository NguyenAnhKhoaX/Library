--[[
    NazuX Library
    Modern Roblox UI Library with Windows 11 style
    With optimized search bar and left-aligned title
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
    -- ... (other themes remain the same)
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
    
    -- Title bar với title bên trái
    local TitleBar = Create("Frame", {
        Name = "TitleBar",
        BackgroundColor3 = Themes[window.Theme].Secondary,
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        Parent = MainFrame
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
    
    -- Window title (LEFT-ALIGNED)
    local TitleLabel = Create("TextLabel", {
        Name = "TitleLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 40, 0, 0),
        Size = UDim2.new(0, 150, 1, 0), -- Giới hạn chiều rộng
        Font = Enum.Font.Gotham,
        Text = window.Title,
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd, -- Tự động cắt nếu dài
        Parent = TitleBar
    })
    
    -- Search bar in title bar (SHORTER - optimized size)
    local SearchBox = Create("TextBox", {
        Name = "SearchBox",
        BackgroundColor3 = Themes[window.Theme].Background,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 200, 0.5, -12), -- Vị trí mới
        Size = UDim2.new(0, 180, 0, 24), -- NHỎ HƠN: 180 thay vì 300
        Font = Enum.Font.Gotham,
        PlaceholderColor3 = Color3.fromRGB(200, 200, 200),
        PlaceholderText = "Tìm kiếm...",
        Text = "",
        TextColor3 = Themes[window.Theme].Text,
        TextSize = 12, -- Nhỏ hơn
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = SearchBox
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 8), -- Padding nhỏ hơn
        Parent = SearchBox
    })
    
    -- Search icon
    local SearchIcon = Create("ImageLabel", {
        Name = "SearchIcon",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -20, 0.5, -8),
        Size = UDim2.new(0, 16, 0, 16),
        Image = "rbxassetid://0", -- Search icon
        ImageColor3 = Color3.fromRGB(150, 150, 150),
        Parent = SearchBox
    })
    
    -- Window controls (right)
    local Controls = Create("Frame", {
        Name = "Controls",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -100, 0, 0),
        Size = UDim2.new(0, 100, 1, 0),
        Parent = TitleBar
    })
    
    -- Control buttons
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
    
    -- User avatar
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
    
    -- User info text
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
    
    -- Search functionality
    local function PerformSearch(searchText)
        searchText = string.lower(searchText)
        
        for _, tab in pairs(window.Tabs) do
            for _, element in pairs(tab.Buttons) do
                local elementName = element:FindFirstChild("Button") and element.Button.Text or 
                                  element:FindFirstChild("ToggleLabel") and element.ToggleLabel.Text or
                                  element:FindFirstChild("SliderLabel") and element.SliderLabel.Text or
                                  element:FindFirstChild("SectionLabel") and element.SectionLabel.Text or ""
                
                if string.find(string.lower(elementName), searchText) then
                    element.Visible = true
                else
                    element.Visible = false
                end
            end
        end
    end
    
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        if SearchBox.Text == "" then
            -- Show all elements when search is cleared
            for _, tab in pairs(window.Tabs) do
                for _, element in pairs(tab.Buttons) do
                    element.Visible = true
                end
            end
        else
            PerformSearch(SearchBox.Text)
        end
    end)
    
    -- Store references
    window.MainFrame = MainFrame
    window.ScreenGui = ScreenGui
    window.TabsContainer = TabsContainer
    window.ContentScrolling = ContentScrolling
    window.CurrentTabTitle = CurrentTabTitle
    window.Themes = Themes
    window.SearchBox = SearchBox
    
    return window
end

-- Tab system với description
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
    
    self.TabsContainer.CanvasSize = UDim2.new(0, 0, 0, (#self.Tabs * 45) + 5)
    
    table.insert(self.Tabs, tab)
    
    if #self.Tabs == 1 then
        self:SelectTab(tab)
    end
    
    -- Tab methods với description
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

-- Button element với description
function NazuX:CreateButton(tab, options)
    local button = {}
    options = options or {}
    
    local ButtonFrame = Create("Frame", {
        Name = "ButtonFrame",
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, options.Description and 60 or 40),
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
        Size = UDim2.new(1, -10, options.Description and 0.6 or 1, -10),
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
    
    -- Thêm description nếu có
    if options.Description then
        local Description = Create("TextLabel", {
            Name = "Description",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 10, 0.6, 0),
            Size = UDim2.new(1, -20, 0.4, -5),
            Font = Enum.Font.Gotham,
            Text = options.Description,
            TextColor3 = self.Themes[self.Theme].Text,
            TextTransparency = 0.6,
            TextSize = 12,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = ButtonFrame
        })
    end
    
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
    
    tab.Content.CanvasSize = UDim2.new(0, 0, 0, (#tab.Buttons + 1) * (options.Description and 65 or 50))
    
    table.insert(tab.Buttons, ButtonFrame)
    
    return button
end

-- Các function khác giữ nguyên...
function NazuX:SelectTab(tab)
    for _, t in pairs(self.Tabs) do
        t.Content.Visible = false
        t.Button.BackgroundTransparency = 0.9
    end
    
    tab.Content.Visible = true
    tab.Button.BackgroundTransparency = 0.7
    
    self.CurrentTabTitle.Text = tab.Name
    self.CurrentTabTitle.Visible = true
end

-- ... (các function khác giữ nguyên)

return NazuX
