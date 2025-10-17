--[[
    NazuX Library
    Created with advanced UI elements and smooth animations
--]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Local variables
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Color themes
local Themes = {
    Dark = {
        Main = Color3.fromRGB(25, 25, 25),
        Secondary = Color3.fromRGB(35, 35, 35),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 200)
    },
    Light = {
        Main = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(220, 220, 220),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(0, 0, 0),
        TextSecondary = Color3.fromRGB(80, 80, 80)
    },
    Red = {
        Main = Color3.fromRGB(40, 20, 20),
        Secondary = Color3.fromRGB(60, 30, 30),
        Accent = Color3.fromRGB(220, 60, 60),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 150, 150)
    },
    Yellow = {
        Main = Color3.fromRGB(40, 40, 20),
        Secondary = Color3.fromRGB(60, 60, 30),
        Accent = Color3.fromRGB(220, 220, 60),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 150)
    },
    AMOLED = {
        Main = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(10, 10, 10),
        Accent = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(150, 150, 150)
    },
    Rose = {
        Main = Color3.fromRGB(30, 20, 25),
        Secondary = Color3.fromRGB(45, 30, 38),
        Accent = Color3.fromRGB(255, 105, 180),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 170, 180)
    }
}

function NazuX:CreateWindow(config)
    local window = {}
    setmetatable(window, NazuX)
    
    -- Configuration
    window.Config = {
        Name = config.Name or "NazuX Library",
        Owner = config.Owner or "Unknown Owner",
        OwnerImage = config.OwnerImage or "rbxassetid://7072717770",
        Theme = config.Theme or "Dark",
        LoadingEnabled = config.LoadingEnabled ~= false
    }
    
    -- Current theme
    window.CurrentTheme = Themes[window.Config.Theme] or Themes.Dark
    
    -- Create main screen GUI
    window.ScreenGui = Instance.new("ScreenGui")
    window.ScreenGui.Name = "NazuXLibrary"
    window.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    window.ScreenGui.Parent = player.PlayerGui
    
    -- Loading screen
    if window.Config.LoadingEnabled then
        window:CreateLoadingScreen()
        wait(2) -- Simulate loading time
    end
    
    -- Main container
    window.MainFrame = Instance.new("Frame")
    window.MainFrame.Name = "MainFrame"
    window.MainFrame.Size = UDim2.new(0, 600, 0, 400)
    window.MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    window.MainFrame.BackgroundColor3 = window.CurrentTheme.Main
    window.MainFrame.BorderSizePixel = 0
    window.MainFrame.ClipsDescendants = true
    window.MainFrame.Parent = window.ScreenGui

    -- Make window draggable
    window:MakeDraggable(window.MainFrame)
    
    -- Corner radius
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 8)
    mainCorner.Parent = window.MainFrame
    
    -- Shadow effect
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 20, 1, 20)
    shadow.Position = UDim2.new(0, -10, 0, -10)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://5554236805"
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(23, 23, 277, 277)
    shadow.Parent = window.MainFrame
    shadow.ZIndex = -1
    
    -- Title bar
    window:CreateTitleBar()
    
    -- Content area
    window:CreateContentArea()
    
    -- Initialize tabs
    window.Tabs = {}
    window.CurrentTab = nil
    
    return window
end

function NazuX:MakeDraggable(frame)
    local dragging = false
    local dragInput, dragStart, startPos

    frame.InputBegan:Connect(function(input)
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

    frame.InputChanged:Connect(function(input)
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

function NazuX:CreateLoadingScreen()
    local loadingFrame = Instance.new("Frame")
    loadingFrame.Name = "LoadingFrame"
    loadingFrame.Size = UDim2.new(1, 0, 1, 0)
    loadingFrame.BackgroundColor3 = self.CurrentTheme.Main
    loadingFrame.BorderSizePixel = 0
    loadingFrame.ZIndex = 100
    loadingFrame.Parent = self.ScreenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = loadingFrame
    
    -- Loading text
    local loadingText = Instance.new("TextLabel")
    loadingText.Name = "LoadingText"
    loadingText.Size = UDim2.new(1, 0, 0, 30)
    loadingText.Position = UDim2.new(0, 0, 0.5, -15)
    loadingText.BackgroundTransparency = 1
    loadingText.Text = "Loading "..self.Config.Name.."..."
    loadingText.TextColor3 = self.CurrentTheme.Text
    loadingText.TextSize = 18
    loadingText.Font = Enum.Font.Gotham
    loadingText.Parent = loadingFrame
    
    -- Loading bar
    local loadingBar = Instance.new("Frame")
    loadingBar.Name = "LoadingBar"
    loadingBar.Size = UDim2.new(0, 200, 0, 4)
    loadingBar.Position = UDim2.new(0.5, -100, 0.5, 20)
    loadingBar.BackgroundColor3 = self.CurrentTheme.Secondary
    loadingBar.BorderSizePixel = 0
    loadingBar.Parent = loadingFrame
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = loadingBar
    
    local progressBar = Instance.new("Frame")
    progressBar.Name = "ProgressBar"
    progressBar.Size = UDim2.new(0, 0, 1, 0)
    progressBar.BackgroundColor3 = self.CurrentTheme.Accent
    progressBar.BorderSizePixel = 0
    progressBar.Parent = loadingBar
    
    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(1, 0)
    progressCorner.Parent = progressBar
    
    -- Animate loading
    spawn(function()
        for i = 1, 100 do
            progressBar.Size = UDim2.new(i/100, 0, 1, 0)
            wait(0.02)
        end
        wait(0.5)
        loadingFrame:Destroy()
    end)
end

function NazuX:CreateTitleBar()
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = self.CurrentTheme.Secondary
    titleBar.BorderSizePixel = 0
    titleBar.Parent = self.MainFrame
    
    -- Make title bar draggable
    self:MakeDraggable(titleBar)
    
    -- Logo
    local logo = Instance.new("ImageLabel")
    logo.Name = "Logo"
    logo.Size = UDim2.new(0, 24, 0, 24)
    logo.Position = UDim2.new(0, 10, 0.5, -12)
    logo.BackgroundTransparency = 1
    logo.Image = "rbxassetid://7072718302"
    logo.Parent = titleBar
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -100, 1, 0)
    title.Position = UDim2.new(0, 40, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = self.Config.Name
    title.TextColor3 = self.CurrentTheme.Text
    title.TextSize = 16
    title.Font = Enum.Font.GothamSemibold
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = titleBar
    
    -- Control buttons
    local buttonContainer = Instance.new("Frame")
    buttonContainer.Name = "ControlButtons"
    buttonContainer.Size = UDim2.new(0, 60, 1, 0)
    buttonContainer.Position = UDim2.new(1, -60, 0, 0)
    buttonContainer.BackgroundTransparency = 1
    buttonContainer.Parent = titleBar
    
    -- Minimize button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "MinimizeButton"
    minimizeBtn.Size = UDim2.new(0, 30, 1, 0)
    minimizeBtn.BackgroundTransparency = 1
    minimizeBtn.Text = "-"
    minimizeBtn.TextColor3 = self.CurrentTheme.Text
    minimizeBtn.TextSize = 18
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.Parent = buttonContainer
    
    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Size = UDim2.new(0, 30, 1, 0)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "X"
    closeBtn.TextColor3 = self.CurrentTheme.Text
    closeBtn.TextSize = 14
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = buttonContainer
    
    -- Button events
    minimizeBtn.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        self.ScreenGui:Destroy()
    end)
    
    -- Button hover effects
    local function setupButtonHover(button)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        end)
        
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
        end)
    end
    
    setupButtonHover(minimizeBtn)
    setupButtonHover(closeBtn)
end

function NazuX:CreateContentArea()
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, 0, 1, -40)
    contentArea.Position = UDim2.new(0, 0, 0, 40)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = self.MainFrame
    
    -- Left sidebar (Owner info + Search + Tabs)
    local leftSidebar = Instance.new("Frame")
    leftSidebar.Name = "LeftSidebar"
    leftSidebar.Size = UDim2.new(0, 200, 1, 0)
    leftSidebar.BackgroundColor3 = self.CurrentTheme.Secondary
    leftSidebar.BorderSizePixel = 0
    leftSidebar.Parent = contentArea
    
    local sidebarCorner = Instance.new("UICorner")
    sidebarCorner.CornerRadius = UDim.new(0, 8)
    sidebarCorner.Parent = leftSidebar
    
    -- Owner info section (moved to top)
    self:CreateOwnerInfo(leftSidebar)
    
    -- Search bar (moved below owner info)
    self:CreateSearchBar(leftSidebar)
    
    -- Tabs container (below search)
    local tabsContainer = Instance.new("ScrollingFrame")
    tabsContainer.Name = "TabsContainer"
    tabsContainer.Size = UDim2.new(1, 0, 1, -180)
    tabsContainer.Position = UDim2.new(0, 0, 0, 180)
    tabsContainer.BackgroundTransparency = 1
    tabsContainer.BorderSizePixel = 0
    tabsContainer.ScrollBarThickness = 3
    tabsContainer.ScrollBarImageColor3 = self.CurrentTheme.Accent
    tabsContainer.Parent = leftSidebar
    
    local tabsList = Instance.new("UIListLayout")
    tabsList.Name = "TabsList"
    tabsList.SortOrder = Enum.SortOrder.LayoutOrder
    tabsList.Padding = UDim.new(0, 5)
    tabsList.Parent = tabsContainer
    
    -- Right content area
    local rightContent = Instance.new("Frame")
    rightContent.Name = "RightContent"
    rightContent.Size = UDim2.new(1, -210, 1, 0)
    rightContent.Position = UDim2.new(0, 210, 0, 0)
    rightContent.BackgroundTransparency = 1
    rightContent.Parent = contentArea
    
    self.TabsContainer = tabsContainer
    self.RightContent = rightContent
end

function NazuX:CreateOwnerInfo(parent)
    local ownerContainer = Instance.new("Frame")
    ownerContainer.Name = "OwnerContainer"
    ownerContainer.Size = UDim2.new(1, -20, 0, 80)
    ownerContainer.Position = UDim2.new(0, 10, 0, 10)
    ownerContainer.BackgroundTransparency = 1
    ownerContainer.Parent = parent
    
    -- Owner image (rounded)
    local ownerImage = Instance.new("ImageLabel")
    ownerImage.Name = "OwnerImage"
    ownerImage.Size = UDim2.new(0, 50, 0, 50)
    ownerImage.BackgroundTransparency = 1
    ownerImage.Image = self.Config.OwnerImage
    ownerImage.Parent = ownerContainer
    
    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(1, 0)
    imageCorner.Parent = ownerImage
    
    local imageStroke = Instance.new("UIStroke")
    imageStroke.Color = self.CurrentTheme.Accent
    imageStroke.Thickness = 2
    imageStroke.Parent = ownerImage
    
    -- Owner name and info
    local ownerInfo = Instance.new("Frame")
    ownerInfo.Name = "OwnerInfo"
    ownerInfo.Size = UDim2.new(1, -60, 1, 0)
    ownerInfo.Position = UDim2.new(0, 60, 0, 0)
    ownerInfo.BackgroundTransparency = 1
    ownerInfo.Parent = ownerContainer
    
    local ownerName = Instance.new("TextLabel")
    ownerName.Name = "OwnerName"
    ownerName.Size = UDim2.new(1, 0, 0, 25)
    ownerName.BackgroundTransparency = 1
    ownerName.Text = self.Config.Owner
    ownerName.TextColor3 = self.CurrentTheme.Text
    ownerName.TextSize = 16
    ownerName.Font = Enum.Font.GothamSemibold
    ownerName.TextXAlignment = Enum.TextXAlignment.Left
    ownerName.TextTruncate = Enum.TextTruncate.AtEnd
    ownerName.Parent = ownerInfo
    
    local ownerStatus = Instance.new("TextLabel")
    ownerStatus.Name = "OwnerStatus"
    ownerStatus.Size = UDim2.new(1, 0, 0, 20)
    ownerStatus.Position = UDim2.new(0, 0, 0, 25)
    ownerStatus.BackgroundTransparency = 1
    ownerStatus.Text = "Library Owner"
    ownerStatus.TextColor3 = self.CurrentTheme.TextSecondary
    ownerStatus.TextSize = 12
    ownerStatus.Font = Enum.Font.Gotham
    ownerStatus.TextXAlignment = Enum.TextXAlignment.Left
    ownerStatus.Parent = ownerInfo
end

function NazuX:CreateSearchBar(parent)
    local searchContainer = Instance.new("Frame")
    searchContainer.Name = "SearchContainer"
    searchContainer.Size = UDim2.new(1, -20, 0, 40)
    searchContainer.Position = UDim2.new(0, 10, 0, 100) -- Position below owner info
    searchContainer.BackgroundColor3 = self.CurrentTheme.Main
    searchContainer.BorderSizePixel = 0
    searchContainer.Parent = parent
    
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 6)
    searchCorner.Parent = searchContainer
    
    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Size = UDim2.new(0, 20, 0, 20)
    searchIcon.Position = UDim2.new(0, 10, 0.5, -10)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxassetid://6035067831"
    searchIcon.ImageColor3 = self.CurrentTheme.TextSecondary
    searchIcon.Parent = searchContainer
    
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(1, -40, 1, 0)
    searchBox.Position = UDim2.new(0, 40, 0, 0)
    searchBox.BackgroundTransparency = 1
    searchBox.PlaceholderText = "Search..."
    searchBox.PlaceholderColor3 = self.CurrentTheme.TextSecondary
    searchBox.Text = ""
    searchBox.TextColor3 = self.CurrentTheme.Text
    searchBox.TextSize = 14
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    searchBox.Parent = searchContainer
    
    -- Search box focus effects
    searchBox.Focused:Connect(function()
        TweenService:Create(searchContainer, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
    end)
    
    searchBox.FocusLost:Connect(function()
        TweenService:Create(searchContainer, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Main}):Play()
    end)
end

function NazuX:ToggleMinimize()
    local contentArea = self.MainFrame:FindFirstChild("ContentArea")
    local titleBar = self.MainFrame:FindFirstChild("TitleBar")
    
    if contentArea then
        if contentArea.Visible then
            -- Minimize
            contentArea.Visible = false
            self.MainFrame.Size = UDim2.new(0, 600, 0, 40)
        else
            -- Restore
            contentArea.Visible = true
            self.MainFrame.Size = UDim2.new(0, 600, 0, 400)
        end
    end
end

function NazuX:AddTab(tabName, tabIcon)
    local tab = {}
    
    -- Create tab button
    local tabButton = Instance.new("TextButton")
    tabButton.Name = "TabButton_"..tabName
    tabButton.Size = UDim2.new(1, -20, 0, 40)
    tabButton.BackgroundColor3 = self.CurrentTheme.Main
    tabButton.BorderSizePixel = 0
    tabButton.Text = ""
    tabButton.Parent = self.TabsContainer
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tabButton
    
    -- Tab icon
    if tabIcon then
        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0, 20, 0, 20)
        icon.Position = UDim2.new(0, 10, 0.5, -10)
        icon.BackgroundTransparency = 1
        icon.Image = tabIcon
        icon.Parent = tabButton
    end
    
    -- Tab name
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "TabName"
    nameLabel.Size = UDim2.new(1, -40, 1, 0)
    nameLabel.Position = UDim2.new(0, 40, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = tabName
    nameLabel.TextColor3 = self.CurrentTheme.Text
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.Gotham
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = tabButton
    
    -- Tab content frame
    local tabContent = Instance.new("ScrollingFrame")
    tabContent.Name = "TabContent_"..tabName
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.BackgroundTransparency = 1
    tabContent.BorderSizePixel = 0
    tabContent.ScrollBarThickness = 3
    tabContent.ScrollBarImageColor3 = self.CurrentTheme.Accent
    tabContent.Visible = false
    tabContent.Parent = self.RightContent
    
    local contentList = Instance.new("UIListLayout")
    contentList.Name = "ContentList"
    contentList.SortOrder = Enum.SortOrder.LayoutOrder
    contentList.Padding = UDim.new(0, 10)
    contentList.Parent = tabContent
    
    -- Tab selection indicator
    local indicator = Instance.new("Frame")
    indicator.Name = "SelectionIndicator"
    indicator.Size = UDim2.new(0, 3, 0.6, 0)
    indicator.Position = UDim2.new(0, 5, 0.2, 0)
    indicator.BackgroundColor3 = self.CurrentTheme.Accent
    indicator.BorderSizePixel = 0
    indicator.Visible = false
    indicator.Parent = tabButton
    
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(1, 0)
    indicatorCorner.Parent = indicator
    
    -- Tab button hover effects
    tabButton.MouseEnter:Connect(function()
        if self.CurrentTab ~= tabName then
            TweenService:Create(tabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        end
    end)
    
    tabButton.MouseLeave:Connect(function()
        if self.CurrentTab ~= tabName then
            TweenService:Create(tabButton, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Main}):Play()
        end
    end)
    
    -- Tab button click event
    tabButton.MouseButton1Click:Connect(function()
        self:SwitchTab(tabName)
    end)
    
    -- Store tab data
    tab.Button = tabButton
    tab.Content = tabContent
    tab.Indicator = indicator
    tab.Elements = {}
    
    self.Tabs[tabName] = tab
    
    -- Auto-select first tab
    if not self.CurrentTab then
        self:SwitchTab(tabName)
    end
    
    -- Update tabs container size
    self.TabsContainer.CanvasSize = UDim2.new(0, 0, 0, (#self.Tabs * 45) + 5)
    
    return tab
end

function NazuX:SwitchTab(tabName)
    -- Hide current tab
    if self.CurrentTab then
        self.Tabs[self.CurrentTab].Content.Visible = false
        self.Tabs[self.CurrentTab].Indicator.Visible = false
        
        -- Animate current tab button
        local currentBtn = self.Tabs[self.CurrentTab].Button
        TweenService:Create(currentBtn, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Main}):Play()
    end
    
    -- Show new tab
    self.Tabs[tabName].Content.Visible = true
    self.Tabs[tabName].Indicator.Visible = true
    
    -- Animate new tab button
    local newBtn = self.Tabs[tabName].Button
    TweenService:Create(newBtn, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Accent}):Play()
    
    self.CurrentTab = tabName
end

-- Element creation functions
function NazuX:AddButton(tab, config)
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Name = "Button_"..config.Name
    buttonFrame.Size = UDim2.new(1, -20, 0, 40)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Parent = tab.Content
    
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundColor3 = self.CurrentTheme.Secondary
    button.BorderSizePixel = 0
    button.Text = config.Name
    button.TextColor3 = self.CurrentTheme.Text
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.Parent = buttonFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button
    
    -- Fingerprint icon
    local fingerprint = Instance.new("ImageLabel")
    fingerprint.Name = "Fingerprint"
    fingerprint.Size = UDim2.new(0, 20, 0, 20)
    fingerprint.Position = UDim2.new(1, -30, 0.5, -10)
    fingerprint.BackgroundTransparency = 1
    fingerprint.Image = "rbxassetid://7072716643"
    fingerprint.ImageColor3 = self.CurrentTheme.TextSecondary
    fingerprint.Parent = button
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        TweenService:Create(button, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
        TweenService:Create(fingerprint, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(0, 0, 0)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Secondary}):Play()
        TweenService:Create(button, TweenInfo.new(0.2), {TextColor3 = self.CurrentTheme.Text}):Play()
        TweenService:Create(fingerprint, TweenInfo.new(0.2), {ImageColor3 = self.CurrentTheme.TextSecondary}):Play()
    end)
    
    -- Click event
    if config.Callback then
        button.MouseButton1Click:Connect(function()
            config.Callback()
        end)
    end
    
    return button
end

function NazuX:AddToggle(tab, config)
    local toggle = Instance.new("Frame")
    toggle.Name = "Toggle_"..config.Name
    toggle.Size = UDim2.new(1, -20, 0, 40)
    toggle.BackgroundTransparency = 1
    toggle.Parent = tab.Content
    
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Name = "ToggleLabel"
    toggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = config.Name
    toggleLabel.TextColor3 = self.CurrentTheme.Text
    toggleLabel.TextSize = 14
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Parent = toggle
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0, 40, 0, 20)
    toggleButton.Position = UDim2.new(1, -40, 0.5, -10)
    toggleButton.BackgroundColor3 = self.CurrentTheme.Secondary
    toggleButton.BorderSizePixel = 0
    toggleButton.Text = ""
    toggleButton.Parent = toggle
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleButton
    
    local toggleState = config.Default or false
    
    local function updateToggle()
        if toggleState then
            TweenService:Create(toggleButton, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Accent}):Play()
            -- Add checkmark
            if not toggleButton:FindFirstChild("Checkmark") then
                local checkmark = Instance.new("ImageLabel")
                checkmark.Name = "Checkmark"
                checkmark.Size = UDim2.new(0, 12, 0, 12)
                checkmark.Position = UDim2.new(0.5, -6, 0.5, -6)
                checkmark.BackgroundTransparency = 1
                checkmark.Image = "rbxassetid://7072717770"
                checkmark.Parent = toggleButton
            end
        else
            TweenService:Create(toggleButton, TweenInfo.new(0.2), {BackgroundColor3 = self.CurrentTheme.Secondary}):Play()
            local checkmark = toggleButton:FindFirstChild("Checkmark")
            if checkmark then
                checkmark:Destroy()
            end
        end
    end
    
    toggleButton.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        updateToggle()
        if config.Callback then
            config.Callback(toggleState)
        end
    end)
    
    updateToggle()
    
    return toggle
end

function NazuX:AddSlider(tab, config)
    local slider = Instance.new("Frame")
    slider.Name = "Slider_"..config.Name
    slider.Size = UDim2.new(1, -20, 0, 60)
    slider.BackgroundTransparency = 1
    slider.Parent = tab.Content
    
    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Name = "SliderLabel"
    sliderLabel.Size = UDim2.new(1, 0, 0, 20)
    sliderLabel.BackgroundTransparency = 1
    sliderLabel.Text = config.Name
    sliderLabel.TextColor3 = self.CurrentTheme.Text
    sliderLabel.TextSize = 14
    sliderLabel.Font = Enum.Font.Gotham
    sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    sliderLabel.Parent = slider
    
    local sliderContainer = Instance.new("Frame")
    sliderContainer.Name = "SliderContainer"
    sliderContainer.Size = UDim2.new(1, 0, 0, 30)
    sliderContainer.Position = UDim2.new(0, 0, 0, 25)
    sliderContainer.BackgroundColor3 = self.CurrentTheme.Secondary
    sliderContainer.BorderSizePixel = 0
    sliderContainer.Parent = slider
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 6)
    containerCorner.Parent = sliderContainer
    
    local sliderBar = Instance.new("Frame")
    sliderBar.Name = "SliderBar"
    sliderBar.Size = UDim2.new(0, 0, 1, 0)
    sliderBar.BackgroundColor3 = self.CurrentTheme.Accent
    sliderBar.BorderSizePixel = 0
    sliderBar.Parent = sliderContainer
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 6)
    barCorner.Parent = sliderBar
    
    local sliderValue = Instance.new("TextLabel")
    sliderValue.Name = "SliderValue"
    sliderValue.Size = UDim2.new(0, 40, 1, 0)
    sliderValue.Position = UDim2.new(1, -45, 0, 0)
    sliderValue.BackgroundTransparency = 1
    sliderValue.Text = tostring(config.Default or config.Min)
    sliderValue.TextColor3 = self.CurrentTheme.Text
    sliderValue.TextSize = 12
    sliderValue.Font = Enum.Font.Gotham
    sliderValue.Parent = sliderContainer
    
    local isSliding = false
    local currentValue = config.Default or config.Min
    
    local function updateSlider(value)
        local percentage = (value - config.Min) / (config.Max - config.Min)
        sliderBar.Size = UDim2.new(percentage, 0, 1, 0)
        sliderValue.Text = tostring(math.floor(value))
        currentValue = value
        
        if config.Callback then
            config.Callback(value)
        end
    end
    
    sliderContainer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isSliding = true
        end
    end)
    
    sliderContainer.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isSliding = false
        end
    end)
    
    sliderContainer.MouseMoved:Connect(function()
        if isSliding then
            local mousePos = UserInputService:GetMouseLocation()
            local sliderAbsPos = sliderContainer.AbsolutePosition
            local sliderAbsSize = sliderContainer.AbsoluteSize
            
            local relativeX = (mousePos.X - sliderAbsPos.X) / sliderAbsSize.X
            relativeX = math.clamp(relativeX, 0, 1)
            
            local value = config.Min + (relativeX * (config.Max - config.Min))
            value = math.floor(value)
            
            updateSlider(value)
        end
    end)
    
    updateSlider(currentValue)
    
    return slider
end

function NazuX:AddSection(tab, config)
    local section = Instance.new("Frame")
    section.Name = "Section_"..config.Name
    section.Size = UDim2.new(1, -20, 0, 50)
    section.BackgroundTransparency = 1
    section.Parent = tab.Content
    
    local sectionLine = Instance.new("Frame")
    sectionLine.Name = "SectionLine"
    sectionLine.Size = UDim2.new(1, 0, 0, 1)
    sectionLine.Position = UDim2.new(0, 0, 0.5, 0)
    sectionLine.BackgroundColor3 = self.CurrentTheme.TextSecondary
    sectionLine.BorderSizePixel = 0
    sectionLine.Parent = section
    
    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Name = "SectionLabel"
    sectionLabel.Size = UDim2.new(0.4, 0, 0, 20)
    sectionLabel.Position = UDim2.new(0.3, 0, 0.5, -10)
    sectionLabel.BackgroundColor3 = self.CurrentTheme.Main
    sectionLabel.BorderSizePixel = 0
    sectionLabel.Text = config.Name
    sectionLabel.TextColor3 = self.CurrentTheme.Text
    sectionLabel.TextSize = 12
    sectionLabel.Font = Enum.Font.GothamSemibold
    sectionLabel.Parent = section
    
    local labelCorner = Instance.new("UICorner")
    labelCorner.CornerRadius = UDim.new(0, 4)
    labelCorner.Parent = sectionLabel
    
    return section
end

function NazuX:ChangeTheme(themeName)
    if Themes[themeName] then
        self.CurrentTheme = Themes[themeName]
        self.Config.Theme = themeName
        -- Note: You would need to implement theme updating for all elements
    end
end

-- Export the library
return NazuX
