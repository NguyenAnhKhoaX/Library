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
local colors = {
    Background = Color3.fromRGB(32, 32, 32),
    Secondary = Color3.fromRGB(42, 42, 42),
    Accent = Color3.fromRGB(0, 120, 215),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(200, 200, 200),
    Shadow = Color3.fromRGB(0, 0, 0),
    Border = Color3.fromRGB(64, 64, 64)
}

-- Utility functions
local function createCorner(radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

local function createStroke()
    local stroke = Instance.new("UIStroke")
    stroke.Color = colors.Border
    stroke.Thickness = 1
    return stroke
end

local function createShadow(parent)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Size = UDim2.new(1, 10, 1, 10)
    shadow.Position = UDim2.new(0, -5, 0, -5)
    shadow.Image = "rbxassetid://5554236805"
    shadow.ImageColor3 = colors.Shadow
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.ZIndex = 0
    
    local shadowCorner = createCorner(8)
    shadowCorner.Parent = shadow
    
    shadow.Parent = parent
    return shadow
end

-- Main Library Function
function NazuX:CreateWindow(name)
    local window = {}
    window.Tabs = {}
    window.Elements = {}
    
    -- Main ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NazuXLib"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false
    
    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 550, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
    mainFrame.BackgroundColor3 = colors.Background
    mainFrame.ClipsDescendants = true
    
    -- Shadow
    createShadow(mainFrame)
    
    -- Corner
    local mainCorner = createCorner(8)
    mainCorner.Parent = mainFrame
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = colors.Secondary
    titleBar.BorderSizePixel = 0
    
    local titleBarCorner = createCorner(8)
    titleBarCorner.CornerRadius = UDim.new(0, 8)
    titleBarCorner.Parent = titleBar
    
    -- Search Bar (Centered in Title Bar)
    local searchContainer = Instance.new("Frame")
    searchContainer.Name = "SearchContainer"
    searchContainer.Size = UDim2.new(0, 200, 0, 30)
    searchContainer.Position = UDim2.new(0.5, -100, 0.5, -15)
    searchContainer.BackgroundColor3 = colors.Background
    searchContainer.BorderSizePixel = 0
    
    local searchCorner = createCorner(6)
    searchCorner.Parent = searchContainer
    
    local searchStroke = createStroke()
    searchStroke.Parent = searchContainer
    
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(1, -40, 1, 0)
    searchBox.Position = UDim2.new(0, 10, 0, 0)
    searchBox.BackgroundTransparency = 1
    searchBox.Text = "Search settings..."
    searchBox.TextColor3 = colors.SubText
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextSize = 14
    searchBox.ClearTextOnFocus = false
    
    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Size = UDim2.new(0, 16, 0, 16)
    searchIcon.Position = UDim2.new(1, -30, 0.5, -8)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxassetid://3926305904"
    searchIcon.ImageRectOffset = Vector2.new(964, 324)
    searchIcon.ImageRectSize = Vector2.new(36, 36)
    searchIcon.ImageColor3 = colors.SubText
    
    -- Window Title
    local windowTitle = Instance.new("TextLabel")
    windowTitle.Name = "WindowTitle"
    windowTitle.Size = UDim2.new(0, 100, 1, 0)
    windowTitle.Position = UDim2.new(0, 15, 0, 0)
    windowTitle.BackgroundTransparency = 1
    windowTitle.Text = name or "NazuX Library"
    windowTitle.TextColor3 = colors.Text
    windowTitle.TextXAlignment = Enum.TextXAlignment.Left
    windowTitle.Font = Enum.Font.GothamSemibold
    windowTitle.TextSize = 16
    
    -- User Info
    local userInfo = Instance.new("Frame")
    userInfo.Name = "UserInfo"
    userInfo.Size = UDim2.new(0, 120, 1, 0)
    userInfo.Position = UDim2.new(1, -135, 0, 0)
    userInfo.BackgroundTransparency = 1
    
    local avatar = Instance.new("ImageLabel")
    avatar.Name = "Avatar"
    avatar.Size = UDim2.new(0, 30, 0, 30)
    avatar.Position = UDim2.new(0, 0, 0.5, -15)
    avatar.BackgroundColor3 = colors.Accent
    avatar.BorderSizePixel = 0
    
    local avatarCorner = createCorner(15)
    avatarCorner.Parent = avatar
    
    local userName = Instance.new("TextLabel")
    userName.Name = "UserName"
    userName.Size = UDim2.new(1, -35, 1, 0)
    userName.Position = UDim2.new(0, 35, 0, 0)
    userName.BackgroundTransparency = 1
    userName.Text = LocalPlayer.Name
    userName.TextColor3 = colors.Text
    userName.TextXAlignment = Enum.TextXAlignment.Left
    userName.Font = Enum.Font.Gotham
    userName.TextSize = 14
    
    -- Minus Button (Toggle)
    local minusButton = Instance.new("TextButton")
    minusButton.Name = "MinusButton"
    minusButton.Size = UDim2.new(0, 30, 0, 30)
    minusButton.Position = UDim2.new(1, -35, 0.5, -15)
    minusButton.BackgroundColor3 = colors.Secondary
    minusButton.Text = "-"
    minusButton.TextColor3 = colors.Text
    minusButton.TextSize = 20
    minusButton.Font = Enum.Font.GothamBold
    
    local minusCorner = createCorner(15)
    minusCorner.Parent = minusButton
    
    -- Toggle Button (for mobile)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0, 50, 0, 50)
    toggleButton.Position = UDim2.new(0.5, -25, 0.5, -25)
    toggleButton.BackgroundColor3 = colors.Accent
    toggleButton.TextColor3 = colors.Text
    toggleButton.TextSize = 24
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.Visible = false
    toggleButton.ZIndex = 100
    
    local toggleCorner = createCorner(25)
    toggleCorner.Parent = toggleButton
    
    -- Tab Container
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(0, 150, 1, -40)
    tabContainer.Position = UDim2.new(0, 0, 0, 40)
    tabContainer.BackgroundColor3 = colors.Secondary
    tabContainer.BorderSizePixel = 0
    
    local tabList = Instance.new("ScrollingFrame")
    tabList.Name = "TabList"
    tabList.Size = UDim2.new(1, 0, 1, 0)
    tabList.BackgroundTransparency = 1
    tabList.BorderSizePixel = 0
    tabList.ScrollBarThickness = 3
    tabList.ScrollBarImageColor3 = colors.Accent
    
    local tabListLayout = Instance.new("UIListLayout")
    tabListLayout.Padding = UDim.new(0, 5)
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Content Container
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentContainer"
    contentContainer.Size = UDim2.new(1, -150, 1, -40)
    contentContainer.Position = UDim2.new(0, 150, 0, 40)
    contentContainer.BackgroundColor3 = colors.Background
    contentContainer.BorderSizePixel = 0
    
    local contentScrolling = Instance.new("ScrollingFrame")
    contentScrolling.Name = "ContentScrolling"
    contentScrolling.Size = UDim2.new(1, -20, 1, -20)
    contentScrolling.Position = UDim2.new(0, 10, 0, 10)
    contentScrolling.BackgroundTransparency = 1
    contentScrolling.BorderSizePixel = 0
    contentScrolling.ScrollBarThickness = 3
    contentScrolling.ScrollBarImageColor3 = colors.Accent
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 10)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Parent everything
    searchIcon.Parent = searchContainer
    searchBox.Parent = searchContainer
    searchContainer.Parent = titleBar
    
    windowTitle.Parent = titleBar
    
    avatar.Parent = userInfo
    userName.Parent = userInfo
    userInfo.Parent = titleBar
    
    minusButton.Parent = titleBar
    titleBar.Parent = mainFrame
    
    tabListLayout.Parent = tabList
    tabList.Parent = tabContainer
    tabContainer.Parent = mainFrame
    
    contentLayout.Parent = contentScrolling
    contentScrolling.Parent = contentContainer
    contentContainer.Parent = mainFrame
    
    toggleButton.Parent = screenGui
    mainFrame.Parent = screenGui
    screenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
    
    -- Load avatar
    pcall(function()
        avatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    
    -- Search functionality
    local function filterElements(searchText)
        for _, element in pairs(window.Elements) do
            if element:IsA("TextLabel") or element:IsA("TextButton") then
                local elementText = element.Text:lower()
                local shouldShow = searchText == "" or elementText:find(searchText:lower())
                element.Visible = shouldShow
                if element.Parent then
                    element.Parent.Visible = shouldShow
                end
            end
        end
    end
    
    searchBox.Focused:Connect(function()
        if searchBox.Text == "Search settings..." then
            searchBox.Text = ""
            searchBox.TextColor3 = colors.Text
        end
    end)
    
    searchBox.FocusLost:Connect(function()
        if searchBox.Text == "" then
            searchBox.Text = "Search settings..."
            searchBox.TextColor3 = colors.SubText
        end
    end)
    
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        filterElements(searchBox.Text)
    end)
    
    -- Minus button functionality
    local isMobile = UserInputService.TouchEnabled
    
    minusButton.MouseButton1Click:Connect(function()
        if isMobile then
            -- Show toggle button in center for mobile
            toggleButton.Visible = true
            toggleButton.Text = "+"
            mainFrame.Visible = false
        else
            -- Hide completely on PC
            mainFrame.Visible = false
            toggleButton.Visible = false
        end
    end)
    
    toggleButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = true
        toggleButton.Visible = false
    end)
    
    -- LeftControl to show on PC
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftControl then
            if not isMobile then
                mainFrame.Visible = not mainFrame.Visible
            end
        end
    end)
    
    -- Make window draggable
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    -- Tab functions
    function window:CreateTab(name, icon)
        local tab = {}
        
        -- Tab Button
        local tabButton = Instance.new("TextButton")
        tabButton.Name = name .. "Tab"
        tabButton.Size = UDim2.new(1, -10, 0, 35)
        tabButton.Position = UDim2.new(0, 5, 0, 5 + (#window.Tabs * 40))
        tabButton.BackgroundColor3 = colors.Secondary
        tabButton.Text = "  " .. name
        tabButton.TextColor3 = colors.Text
        tabButton.TextXAlignment = Enum.TextXAlignment.Left
        tabButton.Font = Enum.Font.Gotham
        tabButton.TextSize = 14
        tabButton.AutoButtonColor = false
        
        local tabCorner = createCorner(6)
        tabCorner.Parent = tabButton
        
        local tabStroke = createStroke()
        tabStroke.Parent = tabButton
        
        -- Tab Icon
        if icon then
            local tabIcon = Instance.new("ImageLabel")
            tabIcon.Name = "TabIcon"
            tabIcon.Size = UDim2.new(0, 20, 0, 20)
            tabIcon.Position = UDim2.new(0, 8, 0.5, -10)
            tabIcon.BackgroundTransparency = 1
            tabIcon.Image = icon
            tabIcon.ImageColor3 = colors.Text
            tabIcon.Parent = tabButton
        end
        
        -- Tab Content
        local tabContent = Instance.new("Frame")
        tabContent.Name = name .. "Content"
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.Visible = false
        
        local tabContentLayout = Instance.new("UIListLayout")
        tabContentLayout.Padding = UDim.new(0, 10)
        tabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        
        tabContentLayout.Parent = tabContent
        tabContent.Parent = contentScrolling
        
        -- Select first tab by default
        if #window.Tabs == 0 then
            tabButton.BackgroundColor3 = colors.Accent
            tabContent.Visible = true
        end
        
        -- Tab selection
        tabButton.MouseButton1Click:Connect(function()
            for _, otherTab in pairs(window.Tabs) do
                otherTab.Button.BackgroundColor3 = colors.Secondary
                otherTab.Content.Visible = false
            end
            
            tabButton.BackgroundColor3 = colors.Accent
            tabContent.Visible = true
        end)
        
        -- Hover effects
        tabButton.MouseEnter:Connect(function()
            if tabButton.BackgroundColor3 ~= colors.Accent then
                tabButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
            end
        end)
        
        tabButton.MouseLeave:Connect(function()
            if tabButton.BackgroundColor3 ~= colors.Accent then
                tabButton.BackgroundColor3 = colors.Secondary
            end
        end)
        
        tabButton.Parent = tabList
        
        -- Store tab data
        tab.Button = tabButton
        tab.Content = tabContent
        table.insert(window.Tabs, tab)
        
        -- Tab functions
        function tab:AddButton(config)
            local button = Instance.new("TextButton")
            button.Name = config.Title .. "Button"
            button.Size = UDim2.new(1, 0, 0, 35)
            button.BackgroundColor3 = colors.Secondary
            button.Text = "  " .. config.Title
            button.TextColor3 = colors.Text
            button.TextXAlignment = Enum.TextXAlignment.Left
            button.Font = Enum.Font.Gotham
            button.TextSize = 14
            button.AutoButtonColor = false
            
            local buttonCorner = createCorner(6)
            buttonCorner.Parent = button
            
            local buttonStroke = createStroke()
            buttonStroke.Parent = button
            
            -- Button icon
            if config.Icon then
                local buttonIcon = Instance.new("ImageLabel")
                buttonIcon.Name = "ButtonIcon"
                buttonIcon.Size = UDim2.new(0, 20, 0, 20)
                buttonIcon.Position = UDim2.new(0, 8, 0.5, -10)
                buttonIcon.BackgroundColor3 = colors.Text
                buttonIcon.BackgroundTransparency = 0
                buttonIcon.Image = config.Icon
                
                local iconCorner = createCorner(10)
                iconCorner.Parent = buttonIcon
                
                buttonIcon.Parent = button
            end
            
            -- Hover effects
            button.MouseEnter:Connect(function()
                button.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
            end)
            
            button.MouseLeave:Connect(function()
                button.BackgroundColor3 = colors.Secondary
            end)
            
            -- Click callback
            button.MouseButton1Click:Connect(function()
                if config.Callback then
                    pcall(config.Callback)
                end
            end)
            
            button.Parent = tabContent
            table.insert(window.Elements, button)
            
            return button
        end
        
        function tab:AddToggle(config)
            local toggle = Instance.new("Frame")
            toggle.Name = config.Title .. "Toggle"
            toggle.Size = UDim2.new(1, 0, 0, 35)
            toggle.BackgroundTransparency = 1
            
            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Name = "ToggleLabel"
            toggleLabel.Size = UDim2.new(1, -50, 1, 0)
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Text = "  " .. config.Title
            toggleLabel.TextColor3 = colors.Text
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.Font = Enum.Font.Gotham
            toggleLabel.TextSize = 14
            
            local toggleButton = Instance.new("TextButton")
            toggleButton.Name = "ToggleButton"
            toggleButton.Size = UDim2.new(0, 40, 0, 20)
            toggleButton.Position = UDim2.new(1, -45, 0.5, -10)
            toggleButton.BackgroundColor3 = colors.Secondary
            toggleButton.Text = ""
            toggleButton.AutoButtonColor = false
            
            local toggleCorner = createCorner(10)
            toggleCorner.Parent = toggleButton
            
            local toggleStroke = createStroke()
            toggleStroke.Parent = toggleButton
            
            local toggleState = config.Default or false
            
            local function updateToggle()
                if toggleState then
                    toggleButton.BackgroundColor3 = colors.Accent
                else
                    toggleButton.BackgroundColor3 = colors.Secondary
                end
                
                if config.Callback then
                    pcall(config.Callback, toggleState)
                end
            end
            
            toggleButton.MouseButton1Click:Connect(function()
                toggleState = not toggleState
                updateToggle()
            end)
            
            updateToggle()
            
            toggleLabel.Parent = toggle
            toggleButton.Parent = toggle
            toggle.Parent = tabContent
            table.insert(window.Elements, toggleLabel)
            
            return {
                Set = function(self, value)
                    toggleState = value
                    updateToggle()
                end,
                Get = function(self)
                    return toggleState
                end
            }
        end
        
        function tab:AddSlider(config)
            local slider = Instance.new("Frame")
            slider.Name = config.Title .. "Slider"
            slider.Size = UDim2.new(1, 0, 0, 50)
            slider.BackgroundTransparency = 1
            
            local sliderLabel = Instance.new("TextLabel")
            sliderLabel.Name = "SliderLabel"
            sliderLabel.Size = UDim2.new(1, 0, 0, 20)
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.Text = "  " .. config.Title
            sliderLabel.TextColor3 = colors.Text
            sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            sliderLabel.Font = Enum.Font.Gotham
            sliderLabel.TextSize = 14
            
            local valueLabel = Instance.new("TextLabel")
            valueLabel.Name = "ValueLabel"
            valueLabel.Size = UDim2.new(0, 50, 0, 20)
            valueLabel.Position = UDim2.new(1, -50, 0, 0)
            valueLabel.BackgroundTransparency = 1
            valueLabel.Text = tostring(config.Default or config.Min)
            valueLabel.TextColor3 = colors.SubText
            valueLabel.TextXAlignment = Enum.TextXAlignment.Right
            valueLabel.Font = Enum.Font.Gotham
            valueLabel.TextSize = 14
            
            local sliderTrack = Instance.new("Frame")
            sliderTrack.Name = "SliderTrack"
            sliderTrack.Size = UDim2.new(1, -10, 0, 5)
            sliderTrack.Position = UDim2.new(0, 5, 1, -15)
            sliderTrack.BackgroundColor3 = colors.Secondary
            sliderTrack.BorderSizePixel = 0
            
            local trackCorner = createCorner(3)
            trackCorner.Parent = sliderTrack
            
            local sliderFill = Instance.new("Frame")
            sliderFill.Name = "SliderFill"
            sliderFill.Size = UDim2.new(0, 0, 1, 0)
            sliderFill.BackgroundColor3 = colors.Accent
            sliderFill.BorderSizePixel = 0
            
            local fillCorner = createCorner(3)
            fillCorner.Parent = sliderFill
            
            local sliderButton = Instance.new("TextButton")
            sliderButton.Name = "SliderButton"
            sliderButton.Size = UDim2.new(0, 15, 0, 15)
            sliderButton.Position = UDim2.new(0, 0, 0.5, -7.5)
            sliderButton.BackgroundColor3 = colors.Text
            sliderButton.Text = ""
            sliderButton.AutoButtonColor = false
            
            local buttonCorner = createCorner(7)
            buttonCorner.Parent = sliderButton
            
            local min = config.Min or 0
            local max = config.Max or 100
            local value = config.Default or min
            local dragging = false
            
            local function updateSlider()
                local percentage = (value - min) / (max - min)
                sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
                sliderButton.Position = UDim2.new(percentage, -7.5, 0.5, -7.5)
                valueLabel.Text = tostring(math.floor(value))
                
                if config.Callback then
                    pcall(config.Callback, value)
                end
            end
            
            local function updateValueFromPosition(x)
                local absoluteX = x - sliderTrack.AbsolutePosition.X
                local percentage = math.clamp(absoluteX / sliderTrack.AbsoluteSize.X, 0, 1)
                value = math.floor(min + (max - min) * percentage)
                updateSlider()
            end
            
            sliderButton.MouseButton1Down:Connect(function()
                dragging = true
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateValueFromPosition(input.Position.X)
                end
            end)
            
            sliderTrack.MouseButton1Down:Connect(function(x, y)
                updateValueFromPosition(x)
            end)
            
            updateSlider()
            
            sliderFill.Parent = sliderTrack
            sliderButton.Parent = sliderTrack
            sliderTrack.Parent = slider
            valueLabel.Parent = slider
            sliderLabel.Parent = slider
            slider.Parent = tabContent
            table.insert(window.Elements, sliderLabel)
            
            return {
                Set = function(self, newValue)
                    value = math.clamp(newValue, min, max)
                    updateSlider()
                end,
                Get = function(self)
                    return value
                end
            }
        end
        
        function tab:AddDropdown(config)
            local dropdown = Instance.new("Frame")
            dropdown.Name = config.Title .. "Dropdown"
            dropdown.Size = UDim2.new(1, 0, 0, 35)
            dropdown.BackgroundTransparency = 1
            
            local dropdownButton = Instance.new("TextButton")
            dropdownButton.Name = "DropdownButton"
            dropdownButton.Size = UDim2.new(1, 0, 0, 35)
            dropdownButton.BackgroundColor3 = colors.Secondary
            dropdownButton.Text = "  " .. config.Title
            dropdownButton.TextColor3 = colors.Text
            dropdownButton.TextXAlignment = Enum.TextXAlignment.Left
            dropdownButton.Font = Enum.Font.Gotham
            dropdownButton.TextSize = 14
            dropdownButton.AutoButtonColor = false
            
            local dropdownCorner = createCorner(6)
            dropdownCorner.Parent = dropdownButton
            
            local dropdownStroke = createStroke()
            dropdownStroke.Parent = dropdownButton
            
            local dropdownArrow = Instance.new("ImageLabel")
            dropdownArrow.Name = "DropdownArrow"
            dropdownArrow.Size = UDim2.new(0, 16, 0, 16)
            dropdownArrow.Position = UDim2.new(1, -25, 0.5, -8)
            dropdownArrow.BackgroundTransparency = 1
            dropdownArrow.Image = "rbxassetid://3926305904"
            dropdownArrow.ImageRectOffset = Vector2.new(964, 324)
            dropdownArrow.ImageRectSize = Vector2.new(36, 36)
            dropdownArrow.ImageColor3 = colors.Text
            dropdownArrow.Rotation = 180
            
            local dropdownContent = Instance.new("Frame")
            dropdownContent.Name = "DropdownContent"
            dropdownContent.Size = UDim2.new(1, 0, 0, 0)
            dropdownContent.Position = UDim2.new(0, 0, 1, 5)
            dropdownContent.BackgroundColor3 = colors.Secondary
            dropdownContent.ClipsDescendants = true
            dropdownContent.Visible = false
            
            local contentCorner = createCorner(6)
            contentCorner.Parent = dropdownContent
            
            local contentStroke = createStroke()
            contentStroke.Parent = dropdownContent
            
            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Padding = UDim.new(0, 2)
            contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
            
            local isOpen = false
            local options = config.Options or {}
            local selected = config.Default
            
            local function updateDropdown()
                if selected then
                    dropdownButton.Text = "  " .. selected
                else
                    dropdownButton.Text = "  " .. config.Title
                end
            end
            
            local function toggleDropdown()
                isOpen = not isOpen
                dropdownContent.Visible = isOpen
                
                if isOpen then
                    dropdownArrow.Rotation = 0
                    dropdownContent.Size = UDim2.new(1, 0, 0, #options * 30)
                else
                    dropdownArrow.Rotation = 180
                    dropdownContent.Size = UDim2.new(1, 0, 0, 0)
                end
            end
            
            dropdownButton.MouseButton1Click:Connect(toggleDropdown)
            
            -- Create option buttons
            for i, option in ipairs(options) do
                local optionButton = Instance.new("TextButton")
                optionButton.Name = option .. "Option"
                optionButton.Size = UDim2.new(1, -10, 0, 28)
                optionButton.Position = UDim2.new(0, 5, 0, (i-1)*30)
                optionButton.BackgroundColor3 = colors.Background
                optionButton.Text = "  " .. option
                optionButton.TextColor3 = colors.Text
                optionButton.TextXAlignment = Enum.TextXAlignment.Left
                optionButton.Font = Enum.Font.Gotham
                optionButton.TextSize = 12
                optionButton.AutoButtonColor = false
                
                local optionCorner = createCorner(4)
                optionCorner.Parent = optionButton
                
                optionButton.MouseEnter:Connect(function()
                    optionButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
                end)
                
                optionButton.MouseLeave:Connect(function()
                    optionButton.BackgroundColor3 = colors.Background
                end)
                
                optionButton.MouseButton1Click:Connect(function()
                    selected = option
                    updateDropdown()
                    toggleDropdown()
                    
                    if config.Callback then
                        pcall(config.Callback, option)
                    end
                end)
                
                optionButton.Parent = dropdownContent
            end
            
            contentLayout.Parent = dropdownContent
            dropdownArrow.Parent = dropdownButton
            dropdownButton.Parent = dropdown
            dropdownContent.Parent = dropdown
            dropdown.Parent = tabContent
            table.insert(window.Elements, dropdownButton)
            
            updateDropdown()
            
            return {
                Set = function(self, value)
                    if table.find(options, value) then
                        selected = value
                        updateDropdown()
                    end
                end,
                Get = function(self)
                    return selected
                end
            }
        end
        
        return tab
    end
    
    return window
end

return NazuX
