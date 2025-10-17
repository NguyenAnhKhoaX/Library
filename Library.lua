--[[
    NazuX Library
    Advanced Roblox UI Library
    Created with modern design and smooth animations
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Colors
local Colors = {
    Dark = {
        Background = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(45, 45, 45),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(220, 220, 220),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(0, 0, 0)
    },
    Red = {
        Background = Color3.fromRGB(40, 20, 20),
        Secondary = Color3.fromRGB(60, 30, 30),
        Accent = Color3.fromRGB(220, 60, 60),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Yellow = {
        Background = Color3.fromRGB(40, 40, 20),
        Secondary = Color3.fromRGB(60, 60, 30),
        Accent = Color3.fromRGB(220, 220, 60),
        Text = Color3.fromRGB(255, 255, 255)
    },
    AMOLED = {
        Background = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(10, 10, 10),
        Accent = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Rose = {
        Background = Color3.fromRGB(25, 20, 25),
        Secondary = Color3.fromRGB(35, 25, 35),
        Accent = Color3.fromRGB(255, 150, 200),
        Text = Color3.fromRGB(255, 255, 255)
    }
}

function NazuX.new(Config)
    Config = Config or {}
    
    local self = setmetatable({}, NazuX)
    
    self.OwnerImage = Config.OwnerImage or "rbxassetid://0"
    self.OwnerInfo = Config.OwnerInfo or "Owner"
    self.Title = Config.Title or "NazuX Library"
    self.Theme = Config.Theme or "Dark"
    self.CurrentTab = nil
    self.Minimized = false
    self.Tabs = {}
    
    self:CreateMainUI()
    
    return self
end

function NazuX:CreateMainUI()
    -- Main ScreenGui
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "NazuXLibrary"
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Main Container
    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Name = "MainFrame"
    self.MainFrame.Size = UDim2.new(0, 600, 0, 450)
    self.MainFrame.Position = UDim2.new(0.5, -300, 0.5, -225)
    self.MainFrame.BackgroundColor3 = Colors[self.Theme].Background
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.ClipsDescendants = true
    self.MainFrame.Parent = self.ScreenGui
    
    -- Corner
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = self.MainFrame
    
    -- Shadow
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 12, 1, 12)
    shadow.Position = UDim2.new(0, -6, 0, -6)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://5554237731"
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(23, 23, 277, 277)
    shadow.Parent = self.MainFrame
    shadow.ZIndex = -1
    
    -- Top Bar
    self:CreateTopBar()
    
    -- Content Area
    self:CreateContentArea()
    
    -- Make draggable
    self:MakeDraggable(self.MainFrame, self.TopBar)
end

function NazuX:CreateTopBar()
    self.TopBar = Instance.new("Frame")
    self.TopBar.Name = "TopBar"
    self.TopBar.Size = UDim2.new(1, 0, 0, 40)
    self.TopBar.BackgroundColor3 = Colors[self.Theme].Secondary
    self.TopBar.BorderSizePixel = 0
    self.TopBar.Parent = self.MainFrame
    
    -- Logo
    local logo = Instance.new("ImageLabel")
    logo.Name = "Logo"
    logo.Size = UDim2.new(0, 24, 0, 24)
    logo.Position = UDim2.new(0, 10, 0.5, -12)
    logo.BackgroundTransparency = 1
    logo.Image = "rbxassetid://0" -- Add your logo image ID
    logo.Parent = self.TopBar
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -100, 1, 0)
    title.Position = UDim2.new(0, 40, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = self.Title
    title.TextColor3 = Colors[self.Theme].Text
    title.TextSize = 16
    title.Font = Enum.Font.GothamSemibold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = self.TopBar
    
    -- Control Buttons
    self:CreateControlButtons()
end

function NazuX:CreateControlButtons()
    -- Minimize Button
    self.MinimizeButton = Instance.new("TextButton")
    self.MinimizeButton.Name = "MinimizeButton"
    self.MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    self.MinimizeButton.Position = UDim2.new(1, -70, 0.5, -15)
    self.MinimizeButton.BackgroundColor3 = Colors[self.Theme].Secondary
    self.MinimizeButton.BorderSizePixel = 0
    self.MinimizeButton.Text = "-"
    self.MinimizeButton.TextColor3 = Colors[self.Theme].Text
    self.MinimizeButton.TextSize = 18
    self.MinimizeButton.Font = Enum.Font.GothamBold
    self.MinimizeButton.Parent = self.TopBar
    
    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0, 4)
    minimizeCorner.Parent = self.MinimizeButton
    
    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0.5, -15)
    closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "X"
    closeButton.TextColor3 = Colors[self.Theme].Text
    closeButton.TextSize = 14
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = self.TopBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 4)
    closeCorner.Parent = closeButton
    
    -- Button events
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    closeButton.MouseButton1Click:Connect(function()
        self:Destroy()
    end)
end

function NazuX:CreateContentArea()
    -- Left Sidebar
    self.LeftSidebar = Instance.new("Frame")
    self.LeftSidebar.Name = "LeftSidebar"
    self.LeftSidebar.Size = UDim2.new(0, 200, 1, -40)
    self.LeftSidebar.Position = UDim2.new(0, 0, 0, 40)
    self.LeftSidebar.BackgroundColor3 = Colors[self.Theme].Secondary
    self.LeftSidebar.BorderSizePixel = 0
    self.LeftSidebar.Parent = self.MainFrame
    
    -- Owner Info Section
    self:CreateOwnerInfo()
    
    -- Search Bar
    self:CreateSearchBar()
    
    -- Tab Container
    self.TabContainer = Instance.new("ScrollingFrame")
    self.TabContainer.Name = "TabContainer"
    self.TabContainer.Size = UDim2.new(1, 0, 1, -150)
    self.TabContainer.Position = UDim2.new(0, 0, 0, 150)
    self.TabContainer.BackgroundTransparency = 1
    self.TabContainer.BorderSizePixel = 0
    self.TabContainer.ScrollBarThickness = 3
    self.TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    self.TabContainer.Parent = self.LeftSidebar
    
    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Padding = UDim.new(0, 5)
    uiListLayout.Parent = self.TabContainer
    
    -- Right Content Area
    self.ContentFrame = Instance.new("Frame")
    self.ContentFrame.Name = "ContentFrame"
    self.ContentFrame.Size = UDim2.new(1, -200, 1, -40)
    self.ContentFrame.Position = UDim2.new(0, 200, 0, 40)
    self.ContentFrame.BackgroundColor3 = Colors[self.Theme].Background
    self.ContentFrame.BorderSizePixel = 0
    self.ContentFrame.Parent = self.MainFrame
    
    -- Loading Screen
    self:CreateLoadingScreen()
end

function NazuX:CreateOwnerInfo()
    local ownerContainer = Instance.new("Frame")
    ownerContainer.Name = "OwnerContainer"
    ownerContainer.Size = UDim2.new(1, -20, 0, 60)
    ownerContainer.Position = UDim2.new(0, 10, 0, 10)
    ownerContainer.BackgroundTransparency = 1
    ownerContainer.Parent = self.LeftSidebar
    
    -- Owner Image
    local ownerImage = Instance.new("ImageLabel")
    ownerImage.Name = "OwnerImage"
    ownerImage.Size = UDim2.new(0, 40, 0, 40)
    ownerImage.Position = UDim2.new(0, 0, 0, 0)
    ownerImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ownerImage.Image = self.OwnerImage
    ownerImage.Parent = ownerContainer
    
    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(1, 0)
    imageCorner.Parent = ownerImage
    
    -- Owner Info Text
    local ownerText = Instance.new("TextLabel")
    ownerText.Name = "OwnerText"
    ownerText.Size = UDim2.new(1, -50, 1, 0)
    ownerText.Position = UDim2.new(0, 50, 0, 0)
    ownerText.BackgroundTransparency = 1
    ownerText.Text = self.OwnerInfo
    ownerText.TextColor3 = Colors[self.Theme].Text
    ownerText.TextSize = 14
    ownerText.Font = Enum.Font.GothamSemibold
    ownerText.TextXAlignment = Enum.TextXAlignment.Left
    ownerText.TextYAlignment = Enum.TextYAlignment.Center
    ownerText.Parent = ownerContainer
end

function NazuX:CreateSearchBar()
    local searchContainer = Instance.new("Frame")
    searchContainer.Name = "SearchContainer"
    searchContainer.Size = UDim2.new(1, -20, 0, 35)
    searchContainer.Position = UDim2.new(0, 10, 0, 80)
    searchContainer.BackgroundColor3 = Colors[self.Theme].Background
    searchContainer.Parent = self.LeftSidebar
    
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 6)
    searchCorner.Parent = searchContainer
    
    -- Search Icon
    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Size = UDim2.new(0, 20, 0, 20)
    searchIcon.Position = UDim2.new(0, 8, 0.5, -10)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxassetid://0" -- Add search icon image ID
    searchIcon.Parent = searchContainer
    
    -- Search TextBox
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(1, -35, 1, 0)
    searchBox.Position = UDim2.new(0, 30, 0, 0)
    searchBox.BackgroundTransparency = 1
    searchBox.PlaceholderText = "Search..."
    searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    searchBox.TextColor3 = Colors[self.Theme].Text
    searchBox.TextSize = 14
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    searchBox.Parent = searchContainer
end

function NazuX:CreateLoadingScreen()
    self.LoadingFrame = Instance.new("Frame")
    self.LoadingFrame.Name = "LoadingFrame"
    self.LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
    self.LoadingFrame.BackgroundColor3 = Colors[self.Theme].Background
    self.LoadingFrame.BorderSizePixel = 0
    self.LoadingFrame.ZIndex = 10
    self.LoadingFrame.Visible = false
    self.LoadingFrame.Parent = self.MainFrame
    
    local loadingSpinner = Instance.new("ImageLabel")
    loadingSpinner.Name = "LoadingSpinner"
    loadingSpinner.Size = UDim2.new(0, 50, 0, 50)
    loadingSpinner.Position = UDim2.new(0.5, -25, 0.5, -25)
    loadingSpinner.BackgroundTransparency = 1
    loadingSpinner.Image = "rbxassetid://0" -- Add loading spinner image ID
    loadingSpinner.Parent = self.LoadingFrame
    
    local loadingText = Instance.new("TextLabel")
    loadingText.Name = "LoadingText"
    loadingText.Size = UDim2.new(1, 0, 0, 20)
    loadingText.Position = UDim2.new(0, 0, 0.5, 40)
    loadingText.BackgroundTransparency = 1
    loadingText.Text = "Loading..."
    loadingText.TextColor3 = Colors[self.Theme].Text
    loadingText.TextSize = 16
    loadingText.Font = Enum.Font.Gotham
    loadingText.Parent = self.LoadingFrame
end

function NazuX:MakeDraggable(frame, handle)
    local dragging = false
    local dragInput, dragStart, startPos
    
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
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

function NazuX:ToggleMinimize()
    self.Minimized = not self.Minimized
    
    if self.Minimized then
        -- Minimize animation
        self.LeftSidebar.Visible = false
        self.ContentFrame.Visible = false
        self.MainFrame.Size = UDim2.new(0, 600, 0, 40)
    else
        -- Restore animation
        self.LeftSidebar.Visible = true
        self.ContentFrame.Visible = true
        self.MainFrame.Size = UDim2.new(0, 600, 0, 450)
    end
end

function NazuX:ShowLoading(duration)
    self.LoadingFrame.Visible = true
    
    if duration then
        task.delay(duration, function()
            self.LoadingFrame.Visible = false
        end)
    end
end

function NazuX:HideLoading()
    self.LoadingFrame.Visible = false
end

function NazuX:ChangeTheme(themeName)
    if Colors[themeName] then
        self.Theme = themeName
        self:UpdateTheme()
    end
end

function NazuX:UpdateTheme()
    local theme = Colors[self.Theme]
    
    -- Update all elements with new colors
    self.MainFrame.BackgroundColor3 = theme.Background
    self.TopBar.BackgroundColor3 = theme.Secondary
    self.LeftSidebar.BackgroundColor3 = theme.Secondary
    
    -- Update text colors
    for _, element in pairs(self.MainFrame:GetDescendants()) do
        if element:IsA("TextLabel") or element:IsA("TextBox") then
            element.TextColor3 = theme.Text
        end
    end
end

-- Tab Methods
function NazuX:CreateTab(tabName)
    local tab = {}
    tab.Name = tabName
    
    -- Tab Button
    tab.Button = Instance.new("TextButton")
    tab.Button.Name = tabName .. "Tab"
    tab.Button.Size = UDim2.new(1, -20, 0, 35)
    tab.Button.BackgroundColor3 = Colors[self.Theme].Secondary
    tab.Button.BorderSizePixel = 0
    tab.Button.Text = tabName
    tab.Button.TextColor3 = Colors[self.Theme].Text
    tab.Button.TextSize = 14
    tab.Button.Font = Enum.Font.GothamSemibold
    tab.Button.Parent = self.TabContainer
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = tab.Button
    
    -- Tab Content
    tab.Content = Instance.new("ScrollingFrame")
    tab.Content.Name = tabName .. "Content"
    tab.Content.Size = UDim2.new(1, 0, 1, 0)
    tab.Content.BackgroundTransparency = 1
    tab.Content.BorderSizePixel = 0
    tab.Content.ScrollBarThickness = 3
    tab.Content.Visible = false
    tab.Content.Parent = self.ContentFrame
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 10)
    contentLayout.Parent = tab.Content
    
    -- Tab button click event
    tab.Button.MouseButton1Click:Connect(function()
        self:SwitchTab(tab)
    end)
    
    self.Tabs[tabName] = tab
    
    -- Update canvas size
    self:UpdateTabContainerSize()
    
    return tab
end

function NazuX:SwitchTab(tab)
    -- Hide all tab contents
    for _, otherTab in pairs(self.Tabs) do
        otherTab.Content.Visible = false
        otherTab.Button.BackgroundColor3 = Colors[self.Theme].Secondary
    end
    
    -- Show selected tab content
    tab.Content.Visible = true
    tab.Button.BackgroundColor3 = Colors[self.Theme].Accent
    
    -- Update current tab
    self.CurrentTab = tab
    
    -- Rotation animation
    self:AnimateTabSwitch(tab.Button)
end

function NazuX:AnimateTabSwitch(tabButton)
    local rotation = 0
    local connection
    
    connection = RunService.Heartbeat:Connect(function(delta)
        rotation = rotation + delta * 360 -- 360 degrees per second
        if rotation >= 360 then
            rotation = 0
            connection:Disconnect()
        end
        tabButton.Rotation = rotation
    end)
end

function NazuX:UpdateTabContainerSize()
    local tabCount = 0
    for _ in pairs(self.Tabs) do
        tabCount = tabCount + 1
    end
    
    local totalHeight = tabCount * 40 + (tabCount - 1) * 5
    self.TabContainer.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

-- Control Methods
function NazuX:AddButton(tab, buttonName, callback)
    local button = Instance.new("TextButton")
    button.Name = buttonName
    button.Size = UDim2.new(1, -20, 0, 35)
    button.Position = UDim2.new(0, 10, 0, #tab.Content:GetChildren() * 45)
    button.BackgroundColor3 = Colors[self.Theme].Secondary
    button.BorderSizePixel = 0
    button.Text = buttonName
    button.TextColor3 = Colors[self.Theme].Text
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.Parent = tab.Content
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    -- Fingerprint icon
    local fingerprint = Instance.new("ImageLabel")
    fingerprint.Name = "Fingerprint"
    fingerprint.Size = UDim2.new(0, 20, 0, 20)
    fingerprint.Position = UDim2.new(1, -25, 0.5, -10)
    fingerprint.BackgroundTransparency = 1
    fingerprint.Image = "rbxassetid://0" -- Add fingerprint icon
    fingerprint.Parent = button
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        button.TextColor3 = Color3.fromRGB(0, 0, 0)
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Colors[self.Theme].Secondary
        button.TextColor3 = Colors[self.Theme].Text
    end)
    
    button.MouseButton1Click:Connect(callback)
    
    self:UpdateContentSize(tab.Content)
end

function NazuX:AddToggle(tab, toggleName, defaultValue, callback)
    local toggle = {}
    toggle.Value = defaultValue or false
    
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = toggleName .. "Toggle"
    toggleFrame.Size = UDim2.new(1, -20, 0, 35)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = tab.Content
    
    -- Toggle text
    local toggleText = Instance.new("TextLabel")
    toggleText.Name = "ToggleText"
    toggleText.Size = UDim2.new(0.7, 0, 1, 0)
    toggleText.BackgroundTransparency = 1
    toggleText.Text = toggleName
    toggleText.TextColor3 = Colors[self.Theme].Text
    toggleText.TextSize = 14
    toggleText.Font = Enum.Font.GothamSemibold
    toggleText.TextXAlignment = Enum.TextXAlignment.Left
    toggleText.Parent = toggleFrame
    
    -- Toggle button
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0, 50, 0, 25)
    toggleButton.Position = UDim2.new(1, -55, 0.5, -12.5)
    toggleButton.BackgroundColor3 = Colors[self.Theme].Secondary
    toggleButton.BorderSizePixel = 0
    toggleButton.Text = ""
    toggleButton.Parent = toggleFrame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleButton
    
    -- Toggle indicator
    local toggleIndicator = Instance.new("Frame")
    toggleIndicator.Name = "ToggleIndicator"
    toggleIndicator.Size = UDim2.new(0, 21, 0, 21)
    toggleIndicator.Position = UDim2.new(0, 2, 0, 2)
    toggleIndicator.BackgroundColor3 = Colors[self.Theme].Text
    toggleIndicator.BorderSizePixel = 0
    toggleIndicator.Parent = toggleButton
    
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(1, 0)
    indicatorCorner.Parent = toggleIndicator
    
    -- Update toggle state
    local function updateToggle()
        if toggle.Value then
            toggleIndicator.Position = UDim2.new(1, -23, 0, 2)
            toggleButton.BackgroundColor3 = Colors[self.Theme].Accent
        else
            toggleIndicator.Position = UDim2.new(0, 2, 0, 2)
            toggleButton.BackgroundColor3 = Colors[self.Theme].Secondary
        end
    end
    
    -- Toggle click event
    toggleButton.MouseButton1Click:Connect(function()
        toggle.Value = not toggle.Value
        updateToggle()
        if callback then
            callback(toggle.Value)
        end
    end)
    
    updateToggle()
    self:UpdateContentSize(tab.Content)
    
    return toggle
end

function NazuX:AddSlider(tab, sliderName, minValue, maxValue, defaultValue, callback)
    local slider = {}
    slider.Value = defaultValue or minValue
    
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = sliderName .. "Slider"
    sliderFrame.Size = UDim2.new(1, -20, 0, 60)
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.Parent = tab.Content
    
    -- Slider text
    local sliderText = Instance.new("TextLabel")
    sliderText.Name = "SliderText"
    sliderText.Size = UDim2.new(1, 0, 0, 20)
    sliderText.BackgroundTransparency = 1
    sliderText.Text = sliderName .. ": " .. slider.Value
    sliderText.TextColor3 = Colors[self.Theme].Text
    sliderText.TextSize = 14
    sliderText.Font = Enum.Font.GothamSemibold
    sliderText.TextXAlignment = Enum.TextXAlignment.Left
    sliderText.Parent = sliderFrame
    
    -- Slider track
    local sliderTrack = Instance.new("Frame")
    sliderTrack.Name = "SliderTrack"
    sliderTrack.Size = UDim2.new(1, 0, 0, 5)
    sliderTrack.Position = UDim2.new(0, 0, 0, 30)
    sliderTrack.BackgroundColor3 = Colors[self.Theme].Secondary
    sliderTrack.BorderSizePixel = 0
    sliderTrack.Parent = sliderFrame
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = sliderTrack
    
    -- Slider fill
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "SliderFill"
    sliderFill.Size = UDim2.new((slider.Value - minValue) / (maxValue - minValue), 0, 1, 0)
    sliderFill.BackgroundColor3 = Colors[self.Theme].Accent
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderTrack
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill
    
    -- Slider thumb
    local sliderThumb = Instance.new("Frame")
    sliderThumb.Name = "SliderThumb"
    sliderThumb.Size = UDim2.new(0, 15, 0, 15)
    sliderThumb.Position = UDim2.new((slider.Value - minValue) / (maxValue - minValue), -7.5, 0.5, -7.5)
    sliderThumb.BackgroundColor3 = Colors[self.Theme].Text
    sliderThumb.BorderSizePixel = 0
    sliderThumb.Parent = sliderTrack
    
    local thumbCorner = Instance.new("UICorner")
    thumbCorner.CornerRadius = UDim.new(1, 0)
    thumbCorner.Parent = sliderThumb
    
    -- Slider dragging
    local dragging = false
    
    local function updateSlider(value)
        value = math.clamp(value, minValue, maxValue)
        slider.Value = value
        sliderText.Text = sliderName .. ": " .. math.floor(value)
        
        local fillSize = (value - minValue) / (maxValue - minValue)
        sliderFill.Size = UDim2.new(fillSize, 0, 1, 0)
        sliderThumb.Position = UDim2.new(fillSize, -7.5, 0.5, -7.5)
        
        if callback then
            callback(value)
        end
    end
    
    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    sliderTrack.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = input.Position
            local trackPos = sliderTrack.AbsolutePosition
            local trackSize = sliderTrack.AbsoluteSize
            
            local relativeX = (mousePos.X - trackPos.X) / trackSize.X
            local value = minValue + (maxValue - minValue) * relativeX
            
            updateSlider(value)
        end
    end)
    
    self:UpdateContentSize(tab.Content)
    
    return slider
end

function NazuX:AddDropdown(tab, dropdownName, options, defaultValue, callback)
    local dropdown = {}
    dropdown.Value = defaultValue or options[1]
    dropdown.Open = false
    
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Name = dropdownName .. "Dropdown"
    dropdownFrame.Size = UDim2.new(1, -20, 0, 35)
    dropdownFrame.BackgroundTransparency = 1
    dropdownFrame.ClipsDescendants = true
    dropdownFrame.Parent = tab.Content
    
    -- Dropdown button
    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Name = "DropdownButton"
    dropdownButton.Size = UDim2.new(1, 0, 0, 35)
    dropdownButton.BackgroundColor3 = Colors[self.Theme].Secondary
    dropdownButton.BorderSizePixel = 0
    dropdownButton.Text = dropdownName .. ": " .. dropdown.Value
    dropdownButton.TextColor3 = Colors[self.Theme].Text
    dropdownButton.TextSize = 14
    dropdownButton.Font = Enum.Font.GothamSemibold
    dropdownButton.Parent = dropdownFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = dropdownButton
    
    -- Dropdown arrow
    local dropdownArrow = Instance.new("ImageLabel")
    dropdownArrow.Name = "DropdownArrow"
    dropdownArrow.Size = UDim2.new(0, 20, 0, 20)
    dropdownArrow.Position = UDim2.new(1, -25, 0.5, -10)
    dropdownArrow.BackgroundTransparency = 1
    dropdownArrow.Image = "rbxassetid://0" -- Add dropdown arrow icon
    dropdownArrow.Parent = dropdownButton
    
    -- Options frame
    local optionsFrame = Instance.new("Frame")
    optionsFrame.Name = "OptionsFrame"
    optionsFrame.Size = UDim2.new(1, 0, 0, #options * 35)
    optionsFrame.Position = UDim2.new(0, 0, 0, 40)
    optionsFrame.BackgroundColor3 = Colors[self.Theme].Secondary
    optionsFrame.Visible = false
    optionsFrame.Parent = dropdownFrame
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 6)
    optionsCorner.Parent = optionsFrame
    
    -- Create option buttons
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Name = option .. "Option"
        optionButton.Size = UDim2.new(1, -10, 0, 30)
        optionButton.Position = UDim2.new(0, 5, 0, (i-1) * 35)
        optionButton.BackgroundColor3 = Colors[self.Theme].Background
        optionButton.BorderSizePixel = 0
        optionButton.Text = option
        optionButton.TextColor3 = Colors[self.Theme].Text
        optionButton.TextSize = 12
        optionButton.Font = Enum.Font.Gotham
        optionButton.Parent = optionsFrame
        
        local optionCorner = Instance.new("UICorner")
        optionCorner.CornerRadius = UDim.new(0, 4)
        optionCorner.Parent = optionButton
        
        optionButton.MouseButton1Click:Connect(function()
            dropdown.Value = option
            dropdownButton.Text = dropdownName .. ": " .. option
            optionsFrame.Visible = false
            dropdown.Open = false
            dropdownFrame.Size = UDim2.new(1, -20, 0, 35)
            
            if callback then
                callback(option)
            end
        end)
    end
    
    -- Toggle dropdown
    dropdownButton.MouseButton1Click:Connect(function()
        dropdown.Open = not dropdown.Open
        optionsFrame.Visible = dropdown.Open
        
        if dropdown.Open then
            dropdownFrame.Size = UDim2.new(1, -20, 0, 35 + #options * 35)
        else
            dropdownFrame.Size = UDim2.new(1, -20, 0, 35)
        end
        
        self:UpdateContentSize(tab.Content)
    end)
    
    self:UpdateContentSize(tab.Content)
    
    return dropdown
end

function NazuX:AddSection(tab, sectionName)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Name = sectionName .. "Section"
    sectionFrame.Size = UDim2.new(1, -20, 0, 40)
    sectionFrame.BackgroundTransparency = 1
    sectionFrame.Parent = tab.Content
    
    -- Section text
    local sectionText = Instance.new("TextLabel")
    sectionText.Name = "SectionText"
    sectionText.Size = UDim2.new(1, 0, 1, 0)
    sectionText.BackgroundTransparency = 1
    sectionText.Text = sectionName
    sectionText.TextColor3 = Colors[self.Theme].Text
    sectionText.TextSize = 16
    sectionText.Font = Enum.Font.GothamBold
    sectionText.Parent = sectionFrame
    
    -- Section line
    local sectionLine = Instance.new("Frame")
    sectionLine.Name = "SectionLine"
    sectionLine.Size = UDim2.new(1, 0, 0, 1)
    sectionLine.Position = UDim2.new(0, 0, 1, -5)
    sectionLine.BackgroundColor3 = Colors[self.Theme].Accent
    sectionLine.BorderSizePixel = 0
    sectionLine.Parent = sectionFrame
    
    self:UpdateContentSize(tab.Content)
    
    return sectionFrame
end

function NazuX:UpdateContentSize(contentFrame)
    local totalHeight = 0
    for _, child in pairs(contentFrame:GetChildren()) do
        if child:IsA("Frame") and child ~= contentFrame:FindFirstChild("UIListLayout") then
            totalHeight = totalHeight + child.Size.Y.Offset + 10
        end
    end
    
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

function NazuX:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
end

return NazuX
