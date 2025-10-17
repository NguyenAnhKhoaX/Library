--[[
    NazuX Library - Fixed Titlebar Version
    Advanced Roblox UI Library with Modern Design
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
    },
    Ocean = {
        Background = Color3.fromRGB(20, 25, 40),
        Secondary = Color3.fromRGB(30, 35, 50),
        Accent = Color3.fromRGB(0, 150, 255),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Forest = {
        Background = Color3.fromRGB(20, 35, 25),
        Secondary = Color3.fromRGB(30, 45, 35),
        Accent = Color3.fromRGB(0, 200, 100),
        Text = Color3.fromRGB(255, 255, 255)
    }
}

function NazuX.new(Config)
    Config = Config or {}
    
    local self = setmetatable({}, NazuX)
    
    self.OwnerImage = Config.OwnerImage or "rbxassetid://0"
    self.OwnerInfo = Config.OwnerInfo or "Owner"
    self.Title = Config.Title or "NazuX Library"
    self.Icon = Config.Icon or "rbxassetid://0"
    self.Theme = Config.Theme or "Dark"
    self.CurrentTab = nil
    self.Minimized = false
    self.Tabs = {}
    self.ThemeWindow = nil
    
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
    
    -- Enhanced Shadow
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 24, 1, 24)
    shadow.Position = UDim2.new(0, -12, 0, -12)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://5554237731"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.8
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(23, 23, 277, 277)
    shadow.Parent = self.MainFrame
    shadow.ZIndex = -1
    
    -- Top Bar (Title Bar for dragging) - FIXED STRUCTURE
    self:CreateTitleBar()
    
    -- Content Area
    self:CreateContentArea()
    
    -- Make draggable using title bar
    self:MakeDraggable(self.MainFrame, self.TitleBar)
    
    -- Create theme settings window (hidden by default)
    self:CreateThemeSettingsWindow()
end

function NazuX:CreateTitleBar()
    -- Title Bar Container - FIXED
    self.TitleBar = Instance.new("Frame")
    self.TitleBar.Name = "TitleBar"
    self.TitleBar.Size = UDim2.new(1, 0, 0, 35)
    self.TitleBar.BackgroundColor3 = Colors[self.Theme].Secondary
    self.TitleBar.BorderSizePixel = 0
    self.TitleBar.Parent = self.MainFrame
    
    -- Left Icon - FIXED POSITION
    local leftIcon = Instance.new("ImageLabel")
    leftIcon.Name = "LeftIcon"
    leftIcon.Size = UDim2.new(0, 20, 0, 20)
    leftIcon.Position = UDim2.new(0, 10, 0.5, -10)
    leftIcon.BackgroundTransparency = 1
    leftIcon.Image = self.Icon
    leftIcon.Parent = self.TitleBar
    
    -- Title Container - PROPERLY CENTERED
    local titleContainer = Instance.new("Frame")
    titleContainer.Name = "TitleContainer"
    titleContainer.Size = UDim2.new(0, 200, 1, 0)
    titleContainer.Position = UDim2.new(0.5, -100, 0, 0)
    titleContainer.BackgroundTransparency = 1
    titleContainer.Parent = self.TitleBar
    
    -- Main Title - FIXED
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 1, 0)
    title.BackgroundTransparency = 1
    title.Text = self.Title
    title.TextColor3 = Colors[self.Theme].Text
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = titleContainer
    
    -- Title Glow Effect - FIXED
    local titleGlow = Instance.new("TextLabel")
    titleGlow.Name = "TitleGlow"
    titleGlow.Size = UDim2.new(1, 0, 1, 0)
    titleGlow.Position = UDim2.new(0, 0, 0, 0)
    titleGlow.BackgroundTransparency = 1
    titleGlow.Text = self.Title
    titleGlow.TextColor3 = Colors[self.Theme].Accent
    titleGlow.TextSize = 16
    titleGlow.Font = Enum.Font.GothamBold
    titleGlow.TextXAlignment = Enum.TextXAlignment.Center
    titleGlow.TextTransparency = 0.7
    titleGlow.ZIndex = -1
    titleGlow.Parent = titleContainer
    
    -- Control Buttons - FIXED POSITIONS
    self:CreateControlButtons()
end

function NazuX:CreateControlButtons()
    -- Settings Button (Gear Icon) - FIXED POSITION
    self.SettingsButton = Instance.new("TextButton") -- Changed to TextButton for better compatibility
    self.SettingsButton.Name = "SettingsButton"
    self.SettingsButton.Size = UDim2.new(0, 25, 0, 25)
    self.SettingsButton.Position = UDim2.new(1, -90, 0.5, -12.5)
    self.SettingsButton.BackgroundColor3 = Colors[self.Theme].Secondary
    self.SettingsButton.BorderSizePixel = 0
    self.SettingsButton.Text = "⚙" -- Gear icon
    self.SettingsButton.TextColor3 = Colors[self.Theme].Text
    self.SettingsButton.TextSize = 14
    self.SettingsButton.Font = Enum.Font.GothamBold
    self.SettingsButton.Parent = self.TitleBar
    
    local settingsCorner = Instance.new("UICorner")
    settingsCorner.CornerRadius = UDim.new(0, 4)
    settingsCorner.Parent = self.SettingsButton
    
    -- Minimize Button - FIXED POSITION AND ICON
    self.MinimizeButton = Instance.new("TextButton")
    self.MinimizeButton.Name = "MinimizeButton"
    self.MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
    self.MinimizeButton.Position = UDim2.new(1, -60, 0.5, -12.5)
    self.MinimizeButton.BackgroundColor3 = Colors[self.Theme].Secondary
    self.MinimizeButton.BorderSizePixel = 0
    self.MinimizeButton.Text = "–" -- New minimize icon
    self.MinimizeButton.TextColor3 = Colors[self.Theme].Text
    self.MinimizeButton.TextSize = 16
    self.MinimizeButton.Font = Enum.Font.GothamBold
    self.MinimizeButton.Parent = self.TitleBar
    
    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0, 4)
    minimizeCorner.Parent = self.MinimizeButton
    
    -- Close Button - FIXED POSITION
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 25, 0, 25)
    closeButton.Position = UDim2.new(1, -30, 0.5, -12.5)
    closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "X"
    closeButton.TextColor3 = Colors[self.Theme].Text
    closeButton.TextSize = 14
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = self.TitleBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 4)
    closeCorner.Parent = closeButton
    
    -- Button hover effects - FIXED
    local function createHoverEffect(button, isClose)
        button.MouseEnter:Connect(function()
            if isClose then
                button.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
            else
                button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end
        end)
        
        button.MouseLeave:Connect(function()
            if isClose then
                button.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
            else
                button.BackgroundColor3 = Colors[self.Theme].Secondary
            end
        end)
    end
    
    createHoverEffect(self.SettingsButton, false)
    createHoverEffect(self.MinimizeButton, false)
    createHoverEffect(closeButton, true)
    
    -- Special rotation effect for settings button
    self.SettingsButton.MouseEnter:Connect(function()
        local tween = TweenService:Create(self.SettingsButton, TweenInfo.new(0.5), {
            Rotation = 360
        })
        tween:Play()
    end)
    
    self.SettingsButton.MouseLeave:Connect(function()
        local tween = TweenService:Create(self.SettingsButton, TweenInfo.new(0.3), {
            Rotation = 0
        })
        tween:Play()
    end)
    
    -- Button events - FIXED
    self.SettingsButton.MouseButton1Click:Connect(function()
        self:ToggleThemeSettings()
    end)
    
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self:ToggleMinimizeWithAnimation()
    end)
    
    closeButton.MouseButton1Click:Connect(function()
        self:DestroyWithAnimation()
    end)
end

function NazuX:CreateContentArea()
    -- Left Sidebar
    self.LeftSidebar = Instance.new("Frame")
    self.LeftSidebar.Name = "LeftSidebar"
    self.LeftSidebar.Size = UDim2.new(0, 200, 1, -35)
    self.LeftSidebar.Position = UDim2.new(0, 0, 0, 35)
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
    self.TabContainer.Size = UDim2.new(1, 0, 1, -160)
    self.TabContainer.Position = UDim2.new(0, 0, 0, 160)
    self.TabContainer.BackgroundTransparency = 1
    self.TabContainer.BorderSizePixel = 0
    self.TabContainer.ScrollBarThickness = 3
    self.TabContainer.ScrollBarImageColor3 = Colors[self.Theme].Accent
    self.TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    self.TabContainer.Parent = self.LeftSidebar
    
    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Padding = UDim.new(0, 8)
    uiListLayout.Parent = self.TabContainer
    
    -- Right Content Area
    self.ContentFrame = Instance.new("Frame")
    self.ContentFrame.Name = "ContentFrame"
    self.ContentFrame.Size = UDim2.new(1, -200, 1, -35)
    self.ContentFrame.Position = UDim2.new(0, 200, 0, 35)
    self.ContentFrame.BackgroundColor3 = Colors[self.Theme].Background
    self.ContentFrame.BorderSizePixel = 0
    self.ContentFrame.Parent = self.MainFrame
    
    -- Loading Screen
    self:CreateLoadingScreen()
end

function NazuX:CreateOwnerInfo()
    local ownerContainer = Instance.new("Frame")
    ownerContainer.Name = "OwnerContainer"
    ownerContainer.Size = UDim2.new(1, -20, 0, 80)
    ownerContainer.Position = UDim2.new(0, 10, 0, 10)
    ownerContainer.BackgroundTransparency = 1
    ownerContainer.Parent = self.LeftSidebar
    
    -- Owner Image
    local ownerImage = Instance.new("ImageLabel")
    ownerImage.Name = "OwnerImage"
    ownerImage.Size = UDim2.new(0, 50, 0, 50)
    ownerImage.Position = UDim2.new(0.5, -25, 0, 0)
    ownerImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ownerImage.Image = self.OwnerImage
    ownerImage.Parent = ownerContainer
    
    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(1, 0)
    imageCorner.Parent = ownerImage
    
    -- Owner Info Text (Centered below image)
    local ownerText = Instance.new("TextLabel")
    ownerText.Name = "OwnerText"
    ownerText.Size = UDim2.new(1, 0, 0, 20)
    ownerText.Position = UDim2.new(0, 0, 0, 55)
    ownerText.BackgroundTransparency = 1
    ownerText.Text = self.OwnerInfo
    ownerText.TextColor3 = Colors[self.Theme].Text
    ownerText.TextSize = 14
    ownerText.Font = Enum.Font.GothamBold
    ownerText.TextXAlignment = Enum.TextXAlignment.Center
    ownerText.Parent = ownerContainer
end

function NazuX:CreateSearchBar()
    local searchContainer = Instance.new("Frame")
    searchContainer.Name = "SearchContainer"
    searchContainer.Size = UDim2.new(1, -20, 0, 35)
    searchContainer.Position = UDim2.new(0, 10, 0, 100)
    searchContainer.BackgroundColor3 = Colors[self.Theme].Background
    searchContainer.Parent = self.LeftSidebar
    
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 6)
    searchCorner.Parent = searchContainer
    
    -- Search Icon - CHANGED TO EMOJI
    local searchIcon = Instance.new("TextLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Size = UDim2.new(0, 20, 0, 20)
    searchIcon.Position = UDim2.new(0, 8, 0.5, -10)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Text = "🔎" -- New search emoji
    searchIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
    searchIcon.TextSize = 14
    searchIcon.Font = Enum.Font.Gotham
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
    
    -- Search box focus effects
    searchBox.Focused:Connect(function()
        searchContainer.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        searchIcon.TextColor3 = Colors[self.Theme].Accent
    end)
    
    searchBox.FocusLost:Connect(function()
        searchContainer.BackgroundColor3 = Colors[self.Theme].Background
        searchIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
    end)
end

function NazuX:CreateThemeSettingsWindow()
    self.ThemeWindow = Instance.new("Frame")
    self.ThemeWindow.Name = "ThemeSettingsWindow"
    self.ThemeWindow.Size = UDim2.new(0, 300, 0, 400)
    self.ThemeWindow.Position = UDim2.new(0.5, -150, 0.5, -200)
    self.ThemeWindow.BackgroundColor3 = Colors[self.Theme].Background
    self.ThemeWindow.BorderSizePixel = 0
    self.ThemeWindow.Visible = false
    self.ThemeWindow.ZIndex = 20
    self.ThemeWindow.Parent = self.ScreenGui
    
    local themeCorner = Instance.new("UICorner")
    themeCorner.CornerRadius = UDim.new(0, 8)
    themeCorner.Parent = self.ThemeWindow
    
    -- Theme window title
    local themeTitle = Instance.new("TextLabel")
    themeTitle.Name = "ThemeTitle"
    themeTitle.Size = UDim2.new(1, 0, 0, 40)
    themeTitle.BackgroundColor3 = Colors[self.Theme].Secondary
    themeTitle.BorderSizePixel = 0
    themeTitle.Text = "Theme Settings"
    themeTitle.TextColor3 = Colors[self.Theme].Text
    themeTitle.TextSize = 18
    themeTitle.Font = Enum.Font.GothamBold
    themeTitle.Parent = self.ThemeWindow
    
    -- Close theme window button
    local closeThemeButton = Instance.new("TextButton")
    closeThemeButton.Name = "CloseThemeButton"
    closeThemeButton.Size = UDim2.new(0, 25, 0, 25)
    closeThemeButton.Position = UDim2.new(1, -30, 0, 7.5)
    closeThemeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
    closeThemeButton.BorderSizePixel = 0
    closeThemeButton.Text = "X"
    closeThemeButton.TextColor3 = Colors[self.Theme].Text
    closeThemeButton.TextSize = 14
    closeThemeButton.Font = Enum.Font.GothamBold
    closeThemeButton.Parent = themeTitle
    
    closeThemeButton.MouseButton1Click:Connect(function()
        self:ToggleThemeSettings()
    end)
    
    -- Theme selection container
    local themeContainer = Instance.new("ScrollingFrame")
    themeContainer.Name = "ThemeContainer"
    themeContainer.Size = UDim2.new(1, -20, 1, -60)
    themeContainer.Position = UDim2.new(0, 10, 0, 50)
    themeContainer.BackgroundTransparency = 1
    themeContainer.BorderSizePixel = 0
    themeContainer.ScrollBarThickness = 3
    themeContainer.ScrollBarImageColor3 = Colors[self.Theme].Accent
    themeContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    themeContainer.Parent = self.ThemeWindow
    
    local themeLayout = Instance.new("UIGridLayout")
    themeLayout.CellSize = UDim2.new(0.5, -10, 0, 80)
    themeLayout.CellPadding = UDim2.new(0, 10, 0, 10)
    themeLayout.Parent = themeContainer
    
    -- Create theme buttons
    self:CreateThemeButtons(themeContainer)
    
    -- Make theme window draggable
    self:MakeDraggable(self.ThemeWindow, themeTitle)
end

function NazuX:CreateThemeButtons(container)
    local themeNames = {"Dark", "Light", "Red", "Yellow", "AMOLED", "Rose", "Ocean", "Forest"}
    
    for _, themeName in ipairs(themeNames) do
        local themeButton = Instance.new("TextButton")
        themeButton.Name = themeName .. "Theme"
        themeButton.Size = UDim2.new(1, 0, 1, 0)
        themeButton.BackgroundColor3 = Colors[themeName].Background
        themeButton.BorderSizePixel = 0
        themeButton.Text = themeName
        themeButton.TextColor3 = Colors[themeName].Text
        themeButton.TextSize = 14
        themeButton.Font = Enum.Font.GothamSemibold
        themeButton.Parent = container
        
        local themeCorner = Instance.new("UICorner")
        themeCorner.CornerRadius = UDim.new(0, 6)
        themeCorner.Parent = themeButton
        
        -- Accent color preview
        local accentPreview = Instance.new("Frame")
        accentPreview.Name = "AccentPreview"
        accentPreview.Size = UDim2.new(1, -20, 0, 4)
        accentPreview.Position = UDim2.new(0, 10, 1, -15)
        accentPreview.BackgroundColor3 = Colors[themeName].Accent
        accentPreview.BorderSizePixel = 0
        accentPreview.Parent = themeButton
        
        local accentCorner = Instance.new("UICorner")
        accentCorner.CornerRadius = UDim.new(1, 0)
        accentCorner.Parent = accentPreview
        
        -- Click event
        themeButton.MouseButton1Click:Connect(function()
            self:ChangeTheme(themeName)
            self:ToggleThemeSettings()
        end)
    end
    
    -- Update container size
    container.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#themeNames / 2) * 90)
end

function NazuX:ToggleThemeSettings()
    self.ThemeWindow.Visible = not self.ThemeWindow.Visible
end

function NazuX:CreateLoadingScreen()
    self.LoadingFrame = Instance.new("Frame")
    self.LoadingFrame.Name = "LoadingFrame"
    self.LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
    self.LoadingFrame.BackgroundColor3 = Colors[self.Theme].Background
    self.LoadingFrame.BackgroundTransparency = 0.1
    self.LoadingFrame.BorderSizePixel = 0
    self.LoadingFrame.ZIndex = 10
    self.LoadingFrame.Visible = false
    self.LoadingFrame.Parent = self.MainFrame
    
    local loadingSpinner = Instance.new("TextLabel")
    loadingSpinner.Name = "LoadingSpinner"
    loadingSpinner.Size = UDim2.new(0, 50, 0, 50)
    loadingSpinner.Position = UDim2.new(0.5, -25, 0.5, -25)
    loadingSpinner.BackgroundTransparency = 1
    loadingSpinner.Text = "⟳"
    loadingSpinner.TextColor3 = Colors[self.Theme].Accent
    loadingSpinner.TextSize = 30
    loadingSpinner.Font = Enum.Font.GothamBold
    loadingSpinner.Parent = self.LoadingFrame
    
    -- Spinning animation
    local spinConnection
    spinConnection = RunService.Heartbeat:Connect(function(delta)
        if self.LoadingFrame.Visible then
            loadingSpinner.Rotation = loadingSpinner.Rotation + delta * 180
        else
            spinConnection:Disconnect()
        end
    end)
    
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

function NazuX:ToggleMinimizeWithAnimation()
    self.Minimized = not self.Minimized
    
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if self.Minimized then
        -- Minimize animation
        local tween = TweenService:Create(self.MainFrame, tweenInfo, {
            Size = UDim2.new(0, 600, 0, 35)
        })
        tween:Play()
        
        -- Hide content after animation
        tween.Completed:Connect(function()
            self.LeftSidebar.Visible = false
            self.ContentFrame.Visible = false
        end)
    else
        -- Show content first
        self.LeftSidebar.Visible = true
        self.ContentFrame.Visible = true
        
        -- Restore animation
        local tween = TweenService:Create(self.MainFrame, tweenInfo, {
            Size = UDim2.new(0, 600, 0, 450)
        })
        tween:Play()
    end
end

function NazuX:DestroyWithAnimation()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    -- Scale down and fade out
    local destroyTween = TweenService:Create(self.MainFrame, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    })
    destroyTween:Play()
    
    destroyTween.Completed:Connect(function()
        self:Destroy()
    end)
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
    self.TitleBar.BackgroundColor3 = theme.Secondary
    self.LeftSidebar.BackgroundColor3 = theme.Secondary
    
    -- Update text colors
    for _, element in pairs(self.MainFrame:GetDescendants()) do
        if element:IsA("TextLabel") or element:IsA("TextBox") or element:IsA("TextButton") then
            if element.Name == "Title" or element.Name == "OwnerText" then
                element.TextColor3 = theme.Text
            elseif element.Name == "TitleGlow" then
                element.TextColor3 = theme.Accent
            else
                element.TextColor3 = theme.Text
            end
        end
    end
    
    -- Update scroll bars
    if self.TabContainer then
        self.TabContainer.ScrollBarImageColor3 = theme.Accent
    end
end

-- Tab Methods with Enhanced Effects
function NazuX:CreateTab(tabName)
    local tab = {}
    tab.Name = tabName
    
    -- Tab Button
    tab.Button = Instance.new("TextButton")
    tab.Button.Name = tabName .. "Tab"
    tab.Button.Size = UDim2.new(1, -20, 0, 40)
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
    tab.Content.ScrollBarImageColor3 = Colors[self.Theme].Accent
    tab.Content.Visible = false
    tab.Content.Parent = self.ContentFrame
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 12)
    contentLayout.Parent = tab.Content
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.PaddingTop = UDim.new(0, 10)
    contentPadding.PaddingLeft = UDim.new(0, 10)
    contentPadding.PaddingRight = UDim.new(0, 10)
    contentPadding.Parent = tab.Content
    
    -- Enhanced Tab Button Effects
    tab.Button.MouseEnter:Connect(function()
        if self.CurrentTab ~= tab then
            local tween = TweenService:Create(tab.Button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 60),
                Size = UDim2.new(1, -15, 0, 40)
            })
            tween:Play()
        end
    end)
    
    tab.Button.MouseLeave:Connect(function()
        if self.CurrentTab ~= tab then
            local tween = TweenService:Create(tab.Button, TweenInfo.new(0.2), {
                BackgroundColor3 = Colors[self.Theme].Secondary,
                Size = UDim2.new(1, -20, 0, 40)
            })
            tween:Play()
        end
    end)
    
    -- Tab button click event with enhanced effects
    tab.Button.MouseButton1Click:Connect(function()
        self:SwitchTabWithEffects(tab)
    end)
    
    self.Tabs[tabName] = tab
    
    -- Update canvas size
    self:UpdateTabContainerSize()
    
    -- Select first tab if none selected
    if not self.CurrentTab then
        self:SwitchTabWithEffects(tab)
    end
    
    return tab
end

function NazuX:SwitchTabWithEffects(tab)
    -- Hide all tab contents
    for _, otherTab in pairs(self.Tabs) do
        otherTab.Content.Visible = false
        
        -- Reset other tab buttons
        if otherTab ~= tab then
            local tween = TweenService:Create(otherTab.Button, TweenInfo.new(0.3), {
                BackgroundColor3 = Colors[self.Theme].Secondary,
                Size = UDim2.new(1, -20, 0, 40),
                TextColor3 = Colors[self.Theme].Text
            })
            tween:Play()
        end
    end
    
    -- Show selected tab content with fade in effect
    tab.Content.Visible = true
    tab.Content.BackgroundTransparency = 1
    
    local fadeIn = TweenService:Create(tab.Content, TweenInfo.new(0.3), {
        BackgroundTransparency = 1
    })
    fadeIn:Play()
    
    -- Enhanced tab button selection effect
    local selectTween = TweenService:Create(tab.Button, TweenInfo.new(0.3), {
        BackgroundColor3 = Colors[self.Theme].Accent,
        Size = UDim2.new(1, -10, 0, 45),
        TextColor3 = Color3.fromRGB(255, 255, 255)
    })
    selectTween:Play()
    
    -- Tab switching animation
    self:AnimateTabSwitch(tab.Button)
    
    -- Update current tab
    self.CurrentTab = tab
end

function NazuX:AnimateTabSwitch(tabButton)
    -- Scale animation
    local scaleUp = TweenService:Create(tabButton, TweenInfo.new(0.1), {
        Size = UDim2.new(1, -5, 0, 42)
    })
    
    local scaleDown = TweenService:Create(tabButton, TweenInfo.new(0.1), {
        Size = UDim2.new(1, -10, 0, 45)
    })
    
    scaleUp:Play()
    scaleUp.Completed:Connect(function()
        scaleDown:Play()
    end)
    
    -- Rotation animation
    local rotation = 0
    local connection
    
    connection = RunService.Heartbeat:Connect(function(delta)
        rotation = rotation + delta * 360
        if rotation >= 180 then
            rotation = 0
            tabButton.Rotation = 0
            connection:Disconnect()
        else
            tabButton.Rotation = rotation
        end
    end)
end

function NazuX:UpdateTabContainerSize()
    local tabCount = 0
    for _ in pairs(self.Tabs) do
        tabCount = tabCount + 1
    end
    
    local totalHeight = tabCount * 48
    self.TabContainer.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

-- Control Methods
function NazuX:AddButton(tab, buttonName, callback)
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Name = buttonName .. "Button"
    buttonFrame.Size = UDim2.new(1, -20, 0, 40)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Parent = tab.Content
    
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundColor3 = Colors[self.Theme].Secondary
    button.BorderSizePixel = 0
    button.Text = buttonName
    button.TextColor3 = Colors[self.Theme].Text
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.Parent = buttonFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    -- Fingerprint icon
    local fingerprint = Instance.new("TextLabel")
    fingerprint.Name = "Fingerprint"
    fingerprint.Size = UDim2.new(0, 20, 0, 20)
    fingerprint.Position = UDim2.new(1, -30, 0.5, -10)
    fingerprint.BackgroundTransparency = 1
    fingerprint.Text = "👆"
    fingerprint.TextColor3 = Colors[self.Theme].Text
    fingerprint.TextSize = 12
    fingerprint.Font = Enum.Font.Gotham
    fingerprint.Parent = button
    
    -- Enhanced hover effects
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            TextColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(1, 5, 1, 5)
        })
        tween:Play()
        
        local iconTween = TweenService:Create(fingerprint, TweenInfo.new(0.2), {
            TextColor3 = Color3.fromRGB(0, 0, 0)
        })
        iconTween:Play()
    end)
    
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Colors[self.Theme].Secondary,
            TextColor3 = Colors[self.Theme].Text,
            Size = UDim2.new(1, 0, 1, 0)
        })
        tween:Play()
        
        local iconTween = TweenService:Create(fingerprint, TweenInfo.new(0.2), {
            TextColor3 = Colors[self.Theme].Text
        })
        iconTween:Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
    
    self:UpdateContentSize(tab.Content)
    
    return button
end

function NazuX:UpdateContentSize(contentFrame)
    local totalHeight = 0
    for _, child in pairs(contentFrame:GetChildren()) do
        if child:IsA("Frame") and child ~= contentFrame:FindFirstChild("UIListLayout") then
            totalHeight = totalHeight + child.Size.Y.Offset + 12
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
