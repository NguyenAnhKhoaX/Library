-- NazuX Library - Clean Version
local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Colors
local colors = {
    Background = Color3.fromRGB(32, 32, 32),
    Secondary = Color3.fromRGB(42, 42, 42),
    Accent = Color3.fromRGB(0, 120, 215),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(200, 200, 200),
    Shadow = Color3.fromRGB(0, 0, 0, 0.5),
    Border = Color3.fromRGB(64, 64, 64)
}

-- Utility Functions
local function createCorner(radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

local function createStroke(parent)
    local stroke = Instance.new("UIStroke")
    stroke.Color = colors.Border
    stroke.Thickness = 1
    stroke.Parent = parent
    return stroke
end

local function createShadow(parent)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Size = UDim2.new(1, 12, 1, 12)
    shadow.Position = UDim2.new(0, -6, 0, -6)
    shadow.Image = "rbxassetid://5554236805"
    shadow.ImageColor3 = colors.Shadow
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.ZIndex = 0
    
    createCorner(8).Parent = shadow
    shadow.Parent = parent
    return shadow
end

-- Main Library
function NazuX:CreateWindow(name)
    local window = {}
    window.Tabs = {}
    
    -- ScreenGui
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
    
    createShadow(mainFrame)
    createCorner(8).Parent = mainFrame
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = colors.Secondary
    titleBar.BorderSizePixel = 0
    
    createCorner(8).Parent = titleBar
    
    -- Search Bar (Center)
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(0, 200, 0, 30)
    searchBox.Position = UDim2.new(0.5, -100, 0.5, -15)
    searchBox.BackgroundColor3 = colors.Background
    searchBox.PlaceholderText = "Search settings..."
    searchBox.PlaceholderColor3 = colors.SubText
    searchBox.Text = ""
    searchBox.TextColor3 = colors.Text
    searchBox.TextSize = 14
    searchBox.Font = Enum.Font.Gotham
    searchBox.ClearTextOnFocus = false
    
    createCorner(6).Parent = searchBox
    createStroke(searchBox)
    
    -- Window Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0, 100, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = name or "NazuX"
    titleLabel.TextColor3 = colors.Text
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.GothamSemibold
    titleLabel.TextSize = 16
    
    -- Minus Button
    local minusBtn = Instance.new("TextButton")
    minusBtn.Name = "MinusBtn"
    minusBtn.Size = UDim2.new(0, 30, 0, 30)
    minusBtn.Position = UDim2.new(1, -35, 0.5, -15)
    minusBtn.BackgroundColor3 = colors.Secondary
    minusBtn.Text = "-"
    minusBtn.TextColor3 = colors.Text
    minusBtn.TextSize = 18
    minusBtn.Font = Enum.Font.GothamBold
    
    createCorner(15).Parent = minusBtn
    
    -- Mobile Toggle Button
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "ToggleBtn"
    toggleBtn.Size = UDim2.new(0, 50, 0, 50)
    toggleBtn.Position = UDim2.new(0.5, -25, 0.5, -25)
    toggleBtn.BackgroundColor3 = colors.Accent
    toggleBtn.TextColor3 = colors.Text
    toggleBtn.TextSize = 20
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.Visible = false
    toggleBtn.ZIndex = 100
    
    createCorner(25).Parent = toggleBtn
    
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
    tabList.ScrollBarThickness = 3
    tabList.ScrollBarImageColor3 = colors.Accent
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Content Container
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentContainer"
    contentContainer.Size = UDim2.new(1, -150, 1, -40)
    contentContainer.Position = UDim2.new(0, 150, 0, 40)
    contentContainer.BackgroundColor3 = colors.Background
    contentContainer.BorderSizePixel = 0
    
    local contentScroll = Instance.new("ScrollingFrame")
    contentScroll.Name = "ContentScroll"
    contentScroll.Size = UDim2.new(1, -20, 1, -20)
    contentScroll.Position = UDim2.new(0, 10, 0, 10)
    contentScroll.BackgroundTransparency = 1
    contentScroll.ScrollBarThickness = 3
    contentScroll.ScrollBarImageColor3 = colors.Accent
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 10)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Assemble UI
    searchBox.Parent = titleBar
    titleLabel.Parent = titleBar
    minusBtn.Parent = titleBar
    titleBar.Parent = mainFrame
    
    tabLayout.Parent = tabList
    tabList.Parent = tabContainer
    tabContainer.Parent = mainFrame
    
    contentLayout.Parent = contentScroll
    contentScroll.Parent = contentContainer
    contentContainer.Parent = mainFrame
    
    toggleBtn.Parent = screenGui
    mainFrame.Parent = screenGui
    screenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
    
    -- Mobile Detection
    local isMobile = UserInputService.TouchEnabled
    
    -- Minus Button Functionality
    minusBtn.MouseButton1Click:Connect(function()
        if isMobile then
            toggleBtn.Visible = true
            toggleBtn.Text = "+"
            mainFrame.Visible = false
        else
            mainFrame.Visible = false
        end
    end)
    
    toggleBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = true
        toggleBtn.Visible = false
    end)
    
    -- LeftControl Show/Hide
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.LeftControl then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)
    
    -- Dragging
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
    
    -- Tab Functions
    function window:CreateTab(name)
        local tab = {}
        
        -- Tab Button
        local tabBtn = Instance.new("TextButton")
        tabBtn.Name = name .. "Tab"
        tabBtn.Size = UDim2.new(1, -10, 0, 35)
        tabBtn.BackgroundColor3 = colors.Secondary
        tabBtn.Text = name
        tabBtn.TextColor3 = colors.Text
        tabBtn.TextSize = 14
        tabBtn.Font = Enum.Font.Gotham
        tabBtn.AutoButtonColor = false
        
        createCorner(6).Parent = tabBtn
        createStroke(tabBtn)
        
        -- Tab Content
        local tabContent = Instance.new("Frame")
        tabContent.Name = name .. "Content"
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.Visible = false
        
        local contentList = Instance.new("UIListLayout")
        contentList.Padding = UDim.new(0, 8)
        contentList.SortOrder = Enum.SortOrder.LayoutOrder
        
        -- Select First Tab
        if #window.Tabs == 0 then
            tabBtn.BackgroundColor3 = colors.Accent
            tabContent.Visible = true
        end
        
        -- Tab Selection
        tabBtn.MouseButton1Click:Connect(function()
            for _, otherTab in pairs(window.Tabs) do
                otherTab.Button.BackgroundColor3 = colors.Secondary
                otherTab.Content.Visible = false
            end
            tabBtn.BackgroundColor3 = colors.Accent
            tabContent.Visible = true
        end)
        
        -- Hover Effects
        tabBtn.MouseEnter:Connect(function()
            if tabBtn.BackgroundColor3 ~= colors.Accent then
                game:GetService("TweenService"):Create(tabBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(52, 52, 52)}):Play()
            end
        end)
        
        tabBtn.MouseLeave:Connect(function()
            if tabBtn.BackgroundColor3 ~= colors.Accent then
                game:GetService("TweenService"):Create(tabBtn, TweenInfo.new(0.2), {BackgroundColor3 = colors.Secondary}):Play()
            end
        end)
        
        contentList.Parent = tabContent
        tabContent.Parent = contentScroll
        tabBtn.Parent = tabList
        
        tab.Button = tabBtn
        tab.Content = tabContent
        table.insert(window.Tabs, tab)
        
        -- Element Functions
        function tab:AddButton(config)
            local buttonFrame = Instance.new("Frame")
            buttonFrame.Size = UDim2.new(1, 0, 0, 35)
            buttonFrame.BackgroundTransparency = 1
            
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 1, 0)
            button.BackgroundColor3 = colors.Secondary
            button.Text = "  " .. config.Title
            button.TextColor3 = colors.Text
            button.TextXAlignment = Enum.TextXAlignment.Left
            button.TextSize = 14
            button.Font = Enum.Font.Gotham
            button.AutoButtonColor = false
            
            createCorner(6).Parent = button
            createStroke(button)
            
            -- White Round Icon on RIGHT
            if config.Icon then
                local icon = Instance.new("ImageLabel")
                icon.Size = UDim2.new(0, 20, 0, 20)
                icon.Position = UDim2.new(1, -30, 0.5, -10)
                icon.BackgroundColor3 = Color3.new(1, 1, 1)
                icon.BackgroundTransparency = 0
                icon.Image = config.Icon
                
                createCorner(10).Parent = icon
                icon.Parent = button
            end
            
            -- Hover Effects
            button.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(52, 52, 52)}):Play()
            end)
            
            button.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = colors.Secondary}):Play()
            end)
            
            -- Click
            button.MouseButton1Click:Connect(function()
                if config.Callback then
                    pcall(config.Callback)
                end
            end)
            
            button.Parent = buttonFrame
            buttonFrame.Parent = tabContent
            
            return button
        end
        
        function tab:AddToggle(config)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Size = UDim2.new(1, 0, 0, 35)
            toggleFrame.BackgroundTransparency = 1
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -50, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "  " .. config.Title
            label.TextColor3 = colors.Text
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.TextSize = 14
            label.Font = Enum.Font.Gotham
            
            local toggle = Instance.new("TextButton")
            toggle.Size = UDim2.new(0, 40, 0, 20)
            toggle.Position = UDim2.new(1, -45, 0.5, -10)
            toggle.BackgroundColor3 = colors.Secondary
            toggle.Text = ""
            toggle.AutoButtonColor = false
            
            createCorner(10).Parent = toggle
            createStroke(toggle)
            
            local state = config.Default or false
            
            local function updateToggle()
                if state then
                    toggle.BackgroundColor3 = colors.Accent
                else
                    toggle.BackgroundColor3 = colors.Secondary
                end
                if config.Callback then
                    pcall(config.Callback, state)
                end
            end
            
            toggle.MouseButton1Click:Connect(function()
                state = not state
                updateToggle()
            end)
            
            updateToggle()
            
            label.Parent = toggleFrame
            toggle.Parent = toggleFrame
            toggleFrame.Parent = tabContent
            
            return {
                Set = function(self, value)
                    state = value
                    updateToggle()
                end,
                Get = function(self)
                    return state
                end
            }
        end
        
        function tab:AddSlider(config)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Size = UDim2.new(1, 0, 0, 50)
            sliderFrame.BackgroundTransparency = 1
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0, 20)
            label.BackgroundTransparency = 1
            label.Text = "  " .. config.Title
            label.TextColor3 = colors.Text
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.TextSize = 14
            label.Font = Enum.Font.Gotham
            
            local valueLabel = Instance.new("TextLabel")
            valueLabel.Size = UDim2.new(0, 50, 0, 20)
            valueLabel.Position = UDim2.new(1, -50, 0, 0)
            valueLabel.BackgroundTransparency = 1
            valueLabel.Text = tostring(config.Default or config.Min)
            valueLabel.TextColor3 = colors.SubText
            valueLabel.TextXAlignment = Enum.TextXAlignment.Right
            valueLabel.TextSize = 14
            valueLabel.Font = Enum.Font.Gotham
            
            local track = Instance.new("Frame")
            track.Size = UDim2.new(1, -10, 0, 5)
            track.Position = UDim2.new(0, 5, 1, -15)
            track.BackgroundColor3 = colors.Secondary
            
            createCorner(3).Parent = track
            
            local fill = Instance.new("Frame")
            fill.Size = UDim2.new(0, 0, 1, 0)
            fill.BackgroundColor3 = colors.Accent
            
            createCorner(3).Parent = fill
            
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 15, 0, 15)
            button.BackgroundColor3 = colors.Text
            button.Text = ""
            button.AutoButtonColor = false
            
            createCorner(7).Parent = button
            
            local min, max, value = config.Min or 0, config.Max or 100, config.Default or min
            local dragging = false
            
            local function updateSlider()
                local percent = (value - min) / (max - min)
                fill.Size = UDim2.new(percent, 0, 1, 0)
                button.Position = UDim2.new(percent, -7.5, 0.5, -7.5)
                valueLabel.Text = tostring(math.floor(value))
                if config.Callback then
                    pcall(config.Callback, value)
                end
            end
            
            button.MouseButton1Down:Connect(function()
                dragging = true
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local pos = input.Position.X
                    local absoluteX = pos - track.AbsolutePosition.X
                    local percent = math.clamp(absoluteX / track.AbsoluteSize.X, 0, 1)
                    value = math.floor(min + (max - min) * percent)
                    updateSlider()
                end
            end)
            
            updateSlider()
            
            fill.Parent = track
            button.Parent = track
            track.Parent = sliderFrame
            valueLabel.Parent = sliderFrame
            label.Parent = sliderFrame
            sliderFrame.Parent = tabContent
            
            return {
                Set = function(self, val)
                    value = math.clamp(val, min, max)
                    updateSlider()
                end,
                Get = function(self)
                    return value
                end
            }
        end
        
        function tab:AddDropdown(config)
            local dropdownFrame = Instance.new("Frame")
            dropdownFrame.Size = UDim2.new(1, 0, 0, 35)
            dropdownFrame.BackgroundTransparency = 1
            
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 1, 0)
            button.BackgroundColor3 = colors.Secondary
            button.Text = "  " .. config.Title
            button.TextColor3 = colors.Text
            button.TextXAlignment = Enum.TextXAlignment.Left
            button.TextSize = 14
            button.Font = Enum.Font.Gotham
            button.AutoButtonColor = false
            
            createCorner(6).Parent = button
            createStroke(button)
            
            local arrow = Instance.new("ImageLabel")
            arrow.Size = UDim2.new(0, 16, 0, 16)
            arrow.Position = UDim2.new(1, -25, 0.5, -8)
            arrow.BackgroundTransparency = 1
            arrow.Image = "rbxassetid://3926307971"
            arrow.ImageRectOffset = Vector2.new(884, 420)
            arrow.ImageRectSize = Vector2.new(36, 36)
            arrow.ImageColor3 = colors.Text
            
            local content = Instance.new("Frame")
            content.Size = UDim2.new(1, 0, 0, 0)
            content.Position = UDim2.new(0, 0, 1, 5)
            content.BackgroundColor3 = colors.Secondary
            content.ClipsDescendants = true
            content.Visible = false
            
            createCorner(6).Parent = content
            createStroke(content)
            
            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Padding = UDim.new(0, 2)
            
            local isOpen = false
            local options = config.Options or {}
            local selected = config.Default
            
            local function updateDropdown()
                button.Text = "  " .. (selected or config.Title)
            end
            
            local function toggleDropdown()
                isOpen = not isOpen
                content.Visible = isOpen
                content.Size = isOpen and UDim2.new(1, 0, 0, #options * 30) or UDim2.new(1, 0, 0, 0)
                arrow.Rotation = isOpen and 0 or 180
            end
            
            button.MouseButton1Click:Connect(toggleDropdown)
            
            for i, option in ipairs(options) do
                local optionBtn = Instance.new("TextButton")
                optionBtn.Size = UDim2.new(1, -10, 0, 28)
                optionBtn.Position = UDim2.new(0, 5, 0, (i-1)*30)
                optionBtn.BackgroundColor3 = colors.Background
                optionBtn.Text = "  " .. option
                optionBtn.TextColor3 = colors.Text
                optionBtn.TextXAlignment = Enum.TextXAlignment.Left
                optionBtn.TextSize = 12
                optionBtn.Font = Enum.Font.Gotham
                optionBtn.AutoButtonColor = false
                
                createCorner(4).Parent = optionBtn
                
                optionBtn.MouseButton1Click:Connect(function()
                    selected = option
                    updateDropdown()
                    toggleDropdown()
                    if config.Callback then
                        pcall(config.Callback, option)
                    end
                end)
                
                optionBtn.Parent = content
            end
            
            contentLayout.Parent = content
            arrow.Parent = button
            button.Parent = dropdownFrame
            content.Parent = dropdownFrame
            dropdownFrame.Parent = tabContent
            
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
