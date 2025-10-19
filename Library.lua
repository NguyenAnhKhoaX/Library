-- NazuX Library
-- Designed with Windows 11 style

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Colors
local accentColor = Color3.fromRGB(0, 120, 215)
local backgroundColor = Color3.fromRGB(32, 32, 32)
local cardColor = Color3.fromRGB(42, 42, 42)
local textColor = Color3.fromRGB(255, 255, 255)

-- Create main UI
function NazuX:CreateWindow(title, settings)
    settings = settings or {}
    local window = {}
    setmetatable(window, NazuX)
    
    -- Main ScreenGui
    window.ScreenGui = Instance.new("ScreenGui")
    window.ScreenGui.Name = "NazuXUI"
    window.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    window.ScreenGui.ResetOnSpawn = false
    
    if RunService:IsStudio() then
        window.ScreenGui.Parent = script.Parent
    else
        window.ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    
    -- Main Frame
    window.MainFrame = Instance.new("Frame")
    window.MainFrame.Name = "MainFrame"
    window.MainFrame.Size = UDim2.new(0, 500, 0, 400)
    window.MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    window.MainFrame.BackgroundColor3 = backgroundColor
    window.MainFrame.BorderSizePixel = 0
    window.MainFrame.ClipsDescendants = true
    window.MainFrame.Parent = window.ScreenGui
    
    -- Shadow
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 12, 1, 12)
    shadow.Position = UDim2.new(0, -6, 0, -6)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://5554236805"
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(23, 23, 277, 277)
    shadow.Parent = window.MainFrame
    
    -- Title Bar
    window.TitleBar = Instance.new("Frame")
    window.TitleBar.Name = "TitleBar"
    window.TitleBar.Size = UDim2.new(1, 0, 0, 40)
    window.TitleBar.BackgroundColor3 = cardColor
    window.TitleBar.BorderSizePixel = 0
    window.TitleBar.Parent = window.MainFrame
    
    -- Search Bar (Centered in TitleBar)
    window.SearchBar = Instance.new("TextBox")
    window.SearchBar.Name = "SearchBar"
    window.SearchBar.Size = UDim2.new(0, 200, 0, 30)
    window.SearchBar.Position = UDim2.new(0.5, -100, 0.5, -15)
    window.SearchBar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    window.SearchBar.BorderSizePixel = 0
    window.SearchBar.Text = "Search..."
    window.SearchBar.TextColor3 = Color3.fromRGB(200, 200, 200)
    window.SearchBar.TextSize = 14
    window.SearchBar.Font = Enum.Font.Gotham
    window.SearchBar.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    window.SearchBar.Parent = window.TitleBar
    
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 8)
    searchCorner.Parent = window.SearchBar
    
    -- Window Title
    local windowTitle = Instance.new("TextLabel")
    windowTitle.Name = "WindowTitle"
    windowTitle.Size = UDim2.new(0, 100, 1, 0)
    windowTitle.Position = UDim2.new(0, 10, 0, 0)
    windowTitle.BackgroundTransparency = 1
    windowTitle.Text = title or "NazuX UI"
    windowTitle.TextColor3 = textColor
    windowTitle.TextSize = 16
    windowTitle.TextXAlignment = Enum.TextXAlignment.Left
    windowTitle.Font = Enum.Font.GothamSemibold
    windowTitle.Parent = window.TitleBar
    
    -- Minimize Button (for mobile)
    window.MinimizeButton = Instance.new("TextButton")
    window.MinimizeButton.Name = "MinimizeButton"
    window.MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    window.MinimizeButton.Position = UDim2.new(1, -70, 0.5, -15)
    window.MinimizeButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    window.MinimizeButton.BorderSizePixel = 0
    window.MinimizeButton.Text = "-"
    window.MinimizeButton.TextColor3 = textColor
    window.MinimizeButton.TextSize = 18
    window.MinimizeButton.Font = Enum.Font.GothamBold
    window.MinimizeButton.Visible = RunService:IsRunningOnMobile()
    window.MinimizeButton.Parent = window.TitleBar
    
    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(1, 0)
    minimizeCorner.Parent = window.MinimizeButton
    
    -- Content Area
    window.ContentArea = Instance.new("Frame")
    window.ContentArea.Name = "ContentArea"
    window.ContentArea.Size = UDim2.new(1, 0, 1, -40)
    window.ContentArea.Position = UDim2.new(0, 0, 0, 40)
    window.ContentArea.BackgroundTransparency = 1
    window.ContentArea.Parent = window.MainFrame
    
    -- Tab Container
    window.TabContainer = Instance.new("Frame")
    window.TabContainer.Name = "TabContainer"
    window.TabContainer.Size = UDim2.new(0, 150, 1, 0)
    window.TabContainer.BackgroundTransparency = 1
    window.TabContainer.Parent = window.ContentArea
    
    local tabListLayout = Instance.new("UIListLayout")
    tabListLayout.Padding = UDim.new(0, 5)
    tabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    tabListLayout.Parent = window.TabContainer
    
    -- Tab Content
    window.TabContent = Instance.new("Frame")
    window.TabContent.Name = "TabContent"
    window.TabContent.Size = UDim2.new(1, -160, 1, -10)
    window.TabContent.Position = UDim2.new(0, 160, 0, 5)
    window.TabContent.BackgroundTransparency = 1
    window.TabContent.Parent = window.ContentArea
    
    local tabContentListLayout = Instance.new("UIListLayout")
    tabContentListLayout.Padding = UDim.new(0, 10)
    tabContentListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabContentListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    tabContentListLayout.Parent = window.TabContent
    
    -- User Info
    window.UserInfo = Instance.new("Frame")
    window.UserInfo.Name = "UserInfo"
    window.UserInfo.Size = UDim2.new(1, -20, 0, 60)
    window.UserInfo.Position = UDim2.new(0, 10, 1, -70)
    window.UserInfo.BackgroundColor3 = cardColor
    window.UserInfo.Parent = window.ContentArea
    
    local userInfoCorner = Instance.new("UICorner")
    userInfoCorner.CornerRadius = UDim.new(0, 12)
    userInfoCorner.Parent = window.UserInfo
    
    -- Avatar
    local avatar = Instance.new("ImageLabel")
    avatar.Name = "Avatar"
    avatar.Size = UDim2.new(0, 40, 0, 40)
    avatar.Position = UDim2.new(0, 10, 0.5, -20)
    avatar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    avatar.BorderSizePixel = 0
    avatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    avatar.Parent = window.UserInfo
    
    local avatarCorner = Instance.new("UICorner")
    avatarCorner.CornerRadius = UDim.new(1, 0)
    avatarCorner.Parent = avatar
    
    -- Username
    local username = Instance.new("TextLabel")
    username.Name = "Username"
    username.Size = UDim2.new(1, -70, 1, 0)
    username.Position = UDim2.new(0, 60, 0, 0)
    username.BackgroundTransparency = 1
    username.Text = LocalPlayer.Name
    username.TextColor3 = textColor
    username.TextSize = 14
    username.TextXAlignment = Enum.TextXAlignment.Left
    username.Font = Enum.Font.Gotham
    username.Parent = window.UserInfo
    
    -- Toggle Button (for mobile)
    window.ToggleButton = Instance.new("TextButton")
    window.ToggleButton.Name = "ToggleButton"
    window.ToggleButton.Size = UDim2.new(0, 60, 0, 60)
    window.ToggleButton.Position = UDim2.new(0.5, -30, 0.5, -30)
    window.ToggleButton.BackgroundColor3 = accentColor
    window.ToggleButton.BorderSizePixel = 0
    window.ToggleButton.Text = "+"
    window.ToggleButton.TextColor3 = textColor
    window.ToggleButton.TextSize = 24
    window.ToggleButton.Font = Enum.Font.GothamBold
    window.ToggleButton.Visible = false
    window.ToggleButton.ZIndex = 100
    window.ToggleButton.Parent = window.ScreenGui
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = window.ToggleButton
    
    -- Variables
    window.Tabs = {}
    window.CurrentTab = nil
    window.IsMinimized = false
    
    -- Connect events
    window.MinimizeButton.MouseButton1Click:Connect(function()
        window:ToggleMinimize()
    end)
    
    window.ToggleButton.MouseButton1Click:Connect(function()
        window:ToggleMinimize()
    end)
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.LeftControl then
            window:ToggleVisibility()
        end
    end)
    
    return window
end

-- Toggle minimize state
function NazuX:ToggleMinimize()
    self.IsMinimized = not self.IsMinimized
    
    if self.IsMinimized then
        self.MainFrame.Visible = false
        if RunService:IsRunningOnMobile() then
            self.ToggleButton.Visible = true
        end
    else
        self.MainFrame.Visible = true
        self.ToggleButton.Visible = false
    end
end

-- Toggle visibility
function NazuX:ToggleVisibility()
    self.MainFrame.Visible = not self.MainFrame.Visible
    if not self.MainFrame.Visible and RunService:IsRunningOnMobile() then
        self.ToggleButton.Visible = true
    else
        self.ToggleButton.Visible = false
    end
end

-- Create tab
function NazuX:CreateTab(name, icon)
    local tab = {}
    
    -- Tab Button
    tab.Button = Instance.new("TextButton")
    tab.Button.Name = name .. "Tab"
    tab.Button.Size = UDim2.new(0.9, 0, 0, 40)
    tab.Button.BackgroundColor3 = cardColor
    tab.Button.BorderSizePixel = 0
    tab.Button.Text = name
    tab.Button.TextColor3 = textColor
    tab.Button.TextSize = 14
    tab.Button.Font = Enum.Font.Gotham
    tab.Button.Parent = self.TabContainer
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tab.Button
    
    -- Tab Content
    tab.Content = Instance.new("ScrollingFrame")
    tab.Content.Name = name .. "Content"
    tab.Content.Size = UDim2.new(1, 0, 1, 0)
    tab.Content.BackgroundTransparency = 1
    tab.Content.BorderSizePixel = 0
    tab.Content.ScrollBarThickness = 3
    tab.Content.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
    tab.Content.Visible = false
    tab.Content.Parent = self.TabContent
    
    local contentListLayout = Instance.new("UIListLayout")
    contentListLayout.Padding = UDim.new(0, 10)
    contentListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    contentListLayout.Parent = tab.Content
    
    -- Hover effects
    tab.Button.MouseEnter:Connect(function()
        if self.CurrentTab ~= tab then
            tab.Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
    end)
    
    tab.Button.MouseLeave:Connect(function()
        if self.CurrentTab ~= tab then
            tab.Button.BackgroundColor3 = cardColor
        end
    end)
    
    -- Click event
    tab.Button.MouseButton1Click:Connect(function()
        self:SwitchTab(tab)
    end)
    
    -- Add to tabs
    table.insert(self.Tabs, tab)
    
    -- Set as first tab if none selected
    if not self.CurrentTab then
        self:SwitchTab(tab)
    end
    
    return tab
end

-- Switch tab
function NazuX:SwitchTab(tab)
    -- Hide all tab contents
    for _, t in pairs(self.Tabs) do
        t.Content.Visible = false
        t.Button.BackgroundColor3 = cardColor
    end
    
    -- Show selected tab
    tab.Content.Visible = true
    tab.Button.BackgroundColor3 = accentColor
    
    self.CurrentTab = tab
end

-- Create button
function NazuX:CreateButton(tab, title, callback, icon)
    local button = Instance.new("Frame")
    button.Name = "Button"
    button.Size = UDim2.new(0.95, 0, 0, 40)
    button.BackgroundColor3 = cardColor
    button.BorderSizePixel = 0
    button.Parent = tab.Content
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = textColor
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.Gotham
    titleLabel.Parent = button
    
    -- Icon
    local iconFrame = Instance.new("Frame")
    iconFrame.Name = "Icon"
    iconFrame.Size = UDim2.new(0, 30, 0, 30)
    iconFrame.Position = UDim2.new(1, -40, 0.5, -15)
    iconFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    iconFrame.BorderSizePixel = 0
    iconFrame.Parent = button
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(1, 0)
    iconCorner.Parent = iconFrame
    
    -- Button
    local buttonBtn = Instance.new("TextButton")
    buttonBtn.Name = "ButtonBtn"
    buttonBtn.Size = UDim2.new(1, 0, 1, 0)
    buttonBtn.BackgroundTransparency = 1
    buttonBtn.Text = ""
    buttonBtn.Parent = button
    
    -- Hover effects
    buttonBtn.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    
    buttonBtn.MouseLeave:Connect(function()
        button.BackgroundColor3 = cardColor
    end)
    
    -- Click event
    buttonBtn.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
    
    return button
end

-- Create toggle
function NazuX:CreateToggle(tab, title, default, callback)
    local toggle = Instance.new("Frame")
    toggle.Name = "Toggle"
    toggle.Size = UDim2.new(0.95, 0, 0, 40)
    toggle.BackgroundColor3 = cardColor
    toggle.BorderSizePixel = 0
    toggle.Parent = tab.Content
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggle
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = textColor
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.Gotham
    titleLabel.Parent = toggle
    
    -- Toggle Background
    local toggleBg = Instance.new("Frame")
    toggleBg.Name = "ToggleBg"
    toggleBg.Size = UDim2.new(0, 50, 0, 25)
    toggleBg.Position = UDim2.new(1, -60, 0.5, -12.5)
    toggleBg.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    toggleBg.BorderSizePixel = 0
    toggleBg.Parent = toggle
    
    local toggleBgCorner = Instance.new("UICorner")
    toggleBgCorner.CornerRadius = UDim.new(1, 0)
    toggleBgCorner.Parent = toggleBg
    
    -- Toggle Button
    local toggleBtn = Instance.new("Frame")
    toggleBtn.Name = "ToggleBtn"
    toggleBtn.Size = UDim2.new(0, 21, 0, 21)
    toggleBtn.Position = UDim2.new(0, 2, 0.5, -10.5)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = toggleBg
    
    local toggleBtnCorner = Instance.new("UICorner")
    toggleBtnCorner.CornerRadius = UDim.new(1, 0)
    toggleBtnCorner.Parent = toggleBtn
    
    -- Toggle Button
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(1, 0, 1, 0)
    toggleButton.BackgroundTransparency = 1
    toggleButton.Text = ""
    toggleButton.Parent = toggle
    
    local state = default or false
    
    -- Update toggle appearance
    local function updateToggle()
        if state then
            toggleBg.BackgroundColor3 = accentColor
            toggleBtn.Position = UDim2.new(1, -23, 0.5, -10.5)
        else
            toggleBg.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            toggleBtn.Position = UDim2.new(0, 2, 0.5, -10.5)
        end
    end
    
    -- Hover effects
    toggleButton.MouseEnter:Connect(function()
        toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    
    toggleButton.MouseLeave:Connect(function()
        toggle.BackgroundColor3 = cardColor
    end)
    
    -- Click event
    toggleButton.MouseButton1Click:Connect(function()
        state = not state
        updateToggle()
        if callback then
            callback(state)
        end
    end)
    
    -- Set initial state
    updateToggle()
    
    return {
        Set = function(newState)
            state = newState
            updateToggle()
        end,
        Get = function()
            return state
        end
    }
end

-- Create slider
function NazuX:CreateSlider(tab, title, min, max, default, callback)
    local slider = Instance.new("Frame")
    slider.Name = "Slider"
    slider.Size = UDim2.new(0.95, 0, 0, 60)
    slider.BackgroundColor3 = cardColor
    slider.BorderSizePixel = 0
    slider.Parent = tab.Content
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 8)
    sliderCorner.Parent = slider
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -20, 0, 20)
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = textColor
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.Gotham
    titleLabel.Parent = slider
    
    -- Value
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Position = UDim2.new(1, -60, 0, 5)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(default or min)
    valueLabel.TextColor3 = textColor
    valueLabel.TextSize = 14
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.Parent = slider
    
    -- Slider Track
    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Size = UDim2.new(1, -20, 0, 5)
    track.Position = UDim2.new(0, 10, 1, -20)
    track.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    track.BorderSizePixel = 0
    track.Parent = slider
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    -- Slider Fill
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0.5, 0, 1, 0)
    fill.BackgroundColor3 = accentColor
    fill.BorderSizePixel = 0
    fill.Parent = track
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    -- Slider Button
    local sliderBtn = Instance.new("Frame")
    sliderBtn.Name = "SliderBtn"
    sliderBtn.Size = UDim2.new(0, 15, 0, 15)
    sliderBtn.Position = UDim2.new(0.5, -7.5, 0.5, -7.5)
    sliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderBtn.BorderSizePixel = 0
    sliderBtn.Parent = track
    
    local sliderBtnCorner = Instance.new("UICorner")
    sliderBtnCorner.CornerRadius = UDim.new(1, 0)
    sliderBtnCorner.Parent = sliderBtn
    
    local value = default or min
    local isDragging = false
    
    -- Update slider appearance
    local function updateSlider()
        local percentage = (value - min) / (max - min)
        fill.Size = UDim2.new(percentage, 0, 1, 0)
        sliderBtn.Position = UDim2.new(percentage, -7.5, 0.5, -7.5)
        valueLabel.Text = tostring(math.floor(value))
    end
    
    -- Mouse events
    local function updateValue(x)
        local relativeX = math.clamp(x - track.AbsolutePosition.X, 0, track.AbsoluteSize.X)
        local percentage = relativeX / track.AbsoluteSize.X
        value = math.floor(min + (max - min) * percentage)
        updateSlider()
        if callback then
            callback(value)
        end
    end
    
    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            updateValue(input.Position.X)
        end
    end)
    
    track.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateValue(input.Position.X)
        end
    end)
    
    -- Set initial value
    updateSlider()
    
    return {
        Set = function(newValue)
            value = math.clamp(newValue, min, max)
            updateSlider()
        end,
        Get = function()
            return value
        end
    }
end

-- Create dropdown
function NazuX:CreateDropdown(tab, title, options, default, callback)
    local dropdown = Instance.new("Frame")
    dropdown.Name = "Dropdown"
    dropdown.Size = UDim2.new(0.95, 0, 0, 40)
    dropdown.BackgroundColor3 = cardColor
    dropdown.BorderSizePixel = 0
    dropdown.ClipsDescendants = true
    dropdown.Parent = tab.Content
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 8)
    dropdownCorner.Parent = dropdown
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = textColor
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.Gotham
    titleLabel.Parent = dropdown
    
    -- Selected Value
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Size = UDim2.new(0.2, 0, 1, 0)
    valueLabel.Position = UDim2.new(0.7, 0, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = default or options[1] or "Select"
    valueLabel.TextColor3 = textColor
    valueLabel.TextSize = 14
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.Parent = dropdown
    
    -- Dropdown Button
    local dropdownBtn = Instance.new("TextButton")
    dropdownBtn.Name = "DropdownBtn"
    dropdownBtn.Size = UDim2.new(1, 0, 1, 0)
    dropdownBtn.BackgroundTransparency = 1
    dropdownBtn.Text = ""
    dropdownBtn.Parent = dropdown
    
    -- Options Frame
    local optionsFrame = Instance.new("Frame")
    optionsFrame.Name = "Options"
    optionsFrame.Size = UDim2.new(1, 0, 0, 0)
    optionsFrame.Position = UDim2.new(0, 0, 1, 5)
    optionsFrame.BackgroundColor3 = cardColor
    optionsFrame.BorderSizePixel = 0
    optionsFrame.Visible = false
    optionsFrame.Parent = dropdown
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 8)
    optionsCorner.Parent = optionsFrame
    
    local optionsListLayout = Instance.new("UIListLayout")
    optionsListLayout.Padding = UDim.new(0, 2)
    optionsListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    optionsListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    optionsListLayout.Parent = optionsFrame
    
    local isOpen = false
    local selectedValue = default or options[1]
    
    -- Create option buttons
    for i, option in pairs(options) do
        local optionBtn = Instance.new("TextButton")
        optionBtn.Name = option
        optionBtn.Size = UDim2.new(0.9, 0, 0, 30)
        optionBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        optionBtn.BorderSizePixel = 0
        optionBtn.Text = option
        optionBtn.TextColor3 = textColor
        optionBtn.TextSize = 14
        optionBtn.Font = Enum.Font.Gotham
        optionBtn.Parent = optionsFrame
        
        local optionCorner = Instance.new("UICorner")
        optionCorner.CornerRadius = UDim.new(0, 6)
        optionCorner.Parent = optionBtn
        
        optionBtn.MouseButton1Click:Connect(function()
            selectedValue = option
            valueLabel.Text = option
            isOpen = false
            optionsFrame.Visible = false
            dropdown.Size = UDim2.new(0.95, 0, 0, 40)
            
            if callback then
                callback(option)
            end
        end)
        
        optionBtn.MouseEnter:Connect(function()
            optionBtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
        end)
        
        optionBtn.MouseLeave:Connect(function()
            optionBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        end)
    end
    
    -- Toggle dropdown
    dropdownBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        optionsFrame.Visible = isOpen
        
        if isOpen then
            local optionCount = #options
            dropdown.Size = UDim2.new(0.95, 0, 0, 40 + (optionCount * 32) + 10)
            optionsFrame.Size = UDim2.new(1, 0, 0, optionCount * 32)
        else
            dropdown.Size = UDim2.new(0.95, 0, 0, 40)
        end
    end)
    
    -- Hover effects
    dropdownBtn.MouseEnter:Connect(function()
        dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    
    dropdownBtn.MouseLeave:Connect(function()
        if not isOpen then
            dropdown.BackgroundColor3 = cardColor
        end
    end)
    
    return {
        Set = function(newValue)
            if table.find(options, newValue) then
                selectedValue = newValue
                valueLabel.Text = newValue
            end
        end,
        Get = function()
            return selectedValue
        end
    }
end

return NazuX
