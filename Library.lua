-- NovaZ.lua
-- Premium UI Library with Neon Effects & Modern Design

local NovaZ = {}
NovaZ.__index = NovaZ

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Color Palette với hiệu ứng neon
local COLORS = {
    Primary = Color3.fromRGB(15, 15, 25),
    Secondary = Color3.fromRGB(25, 25, 35),
    Tertiary = Color3.fromRGB(35, 35, 45),
    Accent = Color3.fromRGB(0, 200, 255),
    Accent2 = Color3.fromRGB(150, 0, 255),
    Success = Color3.fromRGB(0, 255, 150),
    Warning = Color3.fromRGB(255, 200, 0),
    Danger = Color3.fromRGB(255, 50, 100),
    Text = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(180, 180, 200),
    TextTertiary = Color3.fromRGB(120, 120, 140),
    Border = Color3.fromRGB(70, 70, 90),
    Hover = Color3.fromRGB(45, 45, 65),
    Glow = Color3.fromRGB(100, 200, 255)
}

-- Animation Presets
local TWEEN_INFO = {
    Quick = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Smooth = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Bounce = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    Elastic = TweenInfo.new(0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
}

-- Utility Functions
local function createRoundedCorner(radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

local function createPadding(left, right, top, bottom)
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, left or 12)
    padding.PaddingRight = UDim.new(0, right or 12)
    padding.PaddingTop = UDim.new(0, top or 12)
    padding.PaddingBottom = UDim.new(0, bottom or 12)
    return padding
end

local function createStroke(color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = thickness or 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return stroke
end

local function createGradient(colorA, colorB, rotation)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, colorA),
        ColorSequenceKeypoint.new(1, colorB)
    })
    gradient.Rotation = rotation or 0
    return gradient
end

local function createGlowEffect(parent, color)
    local glow = Instance.new("ImageLabel")
    glow.Name = "GlowEffect"
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(0, -10, 0, -10)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://8992230671"
    glow.ImageColor3 = color
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(100, 100, 100, 100)
    glow.Parent = parent
    return glow
end

function NovaZ.new()
    local self = setmetatable({}, NovaZ)
    self.elements = {}
    self.pages = {}
    self.currentPage = nil
    self.connections = {}
    return self
end

-- Main Window Creation
function NovaZ:CreateWindow(title, subtitle)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NovaZUI"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false

    local mainContainer = Instance.new("Frame")
    mainContainer.Name = "MainContainer"
    mainContainer.Size = UDim2.new(0, 700, 0, 550)
    mainContainer.Position = UDim2.new(0.5, -350, 0.5, -275)
    mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    mainContainer.BackgroundColor3 = COLORS.Primary
    mainContainer.BorderSizePixel = 0

    local mainCorner = createRoundedCorner(16)
    mainCorner.Parent = mainContainer

    local mainStroke = createStroke(COLORS.Border, 2)
    mainStroke.Parent = mainContainer

    -- Glow effect
    local containerGlow = createGlowEffect(mainContainer, COLORS.Glow)
    containerGlow.ImageTransparency = 0.8

    -- Header với gradient neon
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 70)
    header.BackgroundColor3 = COLORS.Secondary
    header.BorderSizePixel = 0

    local headerGradient = createGradient(COLORS.Accent, COLORS.Accent2, 45)
    headerGradient.Parent = header

    local headerCorner = createRoundedCorner(16)
    headerCorner.Parent = header

    local headerStroke = createStroke(COLORS.Accent, 1)
    headerStroke.Parent = header

    -- Title container
    local titleContainer = Instance.new("Frame")
    titleContainer.Name = "TitleContainer"
    titleContainer.Size = UDim2.new(1, -100, 1, 0)
    titleContainer.Position = UDim2.new(0, 20, 0, 0)
    titleContainer.BackgroundTransparency = 1

    local mainTitle = Instance.new("TextLabel")
    mainTitle.Name = "MainTitle"
    mainTitle.Size = UDim2.new(1, 0, 0, 35)
    mainTitle.Position = UDim2.new(0, 0, 0, 15)
    mainTitle.BackgroundTransparency = 1
    mainTitle.Text = title or "NovaZ Hub"
    mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainTitle.TextSize = 22
    mainTitle.TextXAlignment = Enum.TextXAlignment.Left
    mainTitle.Font = Enum.Font.GothamBlack
    mainTitle.TextStrokeTransparency = 0.8
    mainTitle.TextStrokeColor3 = COLORS.Accent
    mainTitle.Parent = titleContainer

    local subTitle = Instance.new("TextLabel")
    subTitle.Name = "SubTitle"
    subTitle.Size = UDim2.new(1, 0, 0, 20)
    subTitle.Position = UDim2.new(0, 0, 0, 45)
    subTitle.BackgroundTransparency = 1
    subTitle.Text = subtitle or "Next Generation UI"
    subTitle.TextColor3 = Color3.fromRGB(220, 220, 255)
    subTitle.TextSize = 12
    subTitle.TextXAlignment = Enum.TextXAlignment.Left
    subTitle.Font = Enum.Font.GothamBold
    subTitle.Parent = titleContainer

    titleContainer.Parent = header

    -- Control buttons
    local controlsContainer = Instance.new("Frame")
    controlsContainer.Name = "ControlsContainer"
    controlsContainer.Size = UDim2.new(0, 80, 1, 0)
    controlsContainer.Position = UDim2.new(1, -90, 0, 0)
    controlsContainer.BackgroundTransparency = 1

    local minimizeBtn = self:CreateControlButton("−", COLORS.Warning, controlsContainer, UDim2.new(0, 0, 0.5, -15))
    local closeBtn = self:CreateControlButton("×", COLORS.Danger, controlsContainer, UDim2.new(0, 40, 0.5, -15))

    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    minimizeBtn.MouseButton1Click:Connect(function()
        local content = mainContainer:FindFirstChild("ContentArea")
        if content then
            content.Visible = not content.Visible
        end
    end)

    controlsContainer.Parent = header
    header.Parent = mainContainer

    -- Content Area
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, 0, 1, -70)
    contentArea.Position = UDim2.new(0, 0, 0, 70)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = mainContainer

    -- Sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 220, 1, 0)
    sidebar.BackgroundColor3 = COLORS.Secondary
    sidebar.BorderSizePixel = 0
    sidebar.Parent = contentArea

    local sidebarCorner = createRoundedCorner(16)
    sidebarCorner.Parent = sidebar

    local sidebarPadding = createPadding(15, 15, 20, 20)
    sidebarPadding.Parent = sidebar

    -- Search Box
    local searchContainer = Instance.new("Frame")
    searchContainer.Name = "SearchContainer"
    searchContainer.Size = UDim2.new(1, 0, 0, 45)
    searchContainer.BackgroundTransparency = 1

    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(1, 0, 1, 0)
    searchBox.BackgroundColor3 = COLORS.Tertiary
    searchBox.Text = ""
    searchBox.PlaceholderText = "🔍 Search features..."
    searchBox.PlaceholderColor3 = COLORS.TextTertiary
    searchBox.TextColor3 = COLORS.Text
    searchBox.TextSize = 14
    searchBox.Font = Enum.Font.Gotham
    searchBox.ClearTextOnFocus = false

    local searchCorner = createRoundedCorner(10)
    searchCorner.Parent = searchBox

    local searchPadding = createPadding(15, 15, 10, 10)
    searchPadding.Parent = searchBox

    local searchStroke = createStroke(COLORS.Border, 1)
    searchStroke.Parent = searchBox

    searchBox.Focused:Connect(function()
        TweenService:Create(searchBox, TWEEN_INFO.Smooth, {
            BackgroundColor3 = COLORS.Hover,
            BackgroundTransparency = 0
        }):Play()
        TweenService:Create(searchStroke, TWEEN_INFO.Smooth, {Color = COLORS.Accent}):Play()
    end)

    searchBox.FocusLost:Connect(function()
        TweenService:Create(searchBox, TWEEN_INFO.Smooth, {
            BackgroundColor3 = COLORS.Tertiary
        }):Play()
        TweenService:Create(searchStroke, TWEEN_INFO.Smooth, {Color = COLORS.Border}):Play()
    end)

    searchBox.Parent = searchContainer
    searchContainer.Parent = sidebar

    -- Navigation List
    local navList = Instance.new("ScrollingFrame")
    navList.Name = "NavigationList"
    navList.Size = UDim2.new(1, 0, 1, -60)
    navList.Position = UDim2.new(0, 0, 0, 55)
    navList.BackgroundTransparency = 1
    navList.BorderSizePixel = 0
    navList.ScrollBarThickness = 4
    navList.ScrollBarImageColor3 = COLORS.Accent
    navList.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 10)
    listLayout.Parent = navList

    navList.Parent = sidebar

    -- Main Content
    local mainContent = Instance.new("Frame")
    mainContent.Name = "MainContent"
    mainContent.Size = UDim2.new(1, -230, 1, 0)
    mainContent.Position = UDim2.new(0, 230, 0, 0)
    mainContent.BackgroundTransparency = 1
    mainContent.ClipsDescendants = true
    mainContent.Parent = contentArea

    local contentPadding = createPadding(25, 25, 25, 25)
    contentPadding.Parent = mainContent

    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    self.elements = {
        ScreenGui = screenGui,
        MainContainer = mainContainer,
        Sidebar = sidebar,
        MainContent = mainContent,
        NavList = navList,
        SearchBox = searchBox
    }

    -- Setup search functionality
    self:SetupSearch()

    return self
end

-- Control Button
function NovaZ:CreateControlButton(symbol, color, parent, position)
    local button = Instance.new("TextButton")
    button.Name = symbol .. "Btn"
    button.Size = UDim2.new(0, 30, 0, 30)
    button.Position = position
    button.BackgroundColor3 = color
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = symbol
    button.TextSize = 16
    button.Font = Enum.Font.GothamBold
    button.AutoButtonColor = false

    local buttonCorner = createRoundedCorner(8)
    buttonCorner.Parent = button

    local buttonStroke = createStroke(Color3.fromRGB(255, 255, 255), 1)
    buttonStroke.Parent = button

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TWEEN_INFO.Smooth, {Size = UDim2.new(0, 32, 0, 32)}):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TWEEN_INFO.Smooth, {Size = UDim2.new(0, 30, 0, 30)}):Play()
    end)

    button.Parent = parent
    return button
end

-- Search functionality
function NovaZ:SetupSearch()
    self.connections.search = self.elements.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = self.elements.SearchBox.Text:lower()
        
        for _, navButton in pairs(self.elements.NavList:GetChildren()) do
            if navButton:IsA("TextButton") and navButton.Name ~= "Section" then
                local label = navButton:FindFirstChild("Label")
                if label then
                    local buttonText = label.Text:lower()
                    if searchText == "" or buttonText:find(searchText) then
                        navButton.Visible = true
                        TweenService:Create(navButton, TWEEN_INFO.Quick, {BackgroundTransparency = 0}):Play()
                    else
                        TweenService:Create(navButton, TWEEN_INFO.Quick, {BackgroundTransparency = 1}):Play()
                        wait(0.15)
                        navButton.Visible = false
                    end
                end
            end
        end
    end)
end

-- Create Section
function NovaZ:CreateSection(title)
    local section = Instance.new("Frame")
    section.Name = "Section"
    section.Size = UDim2.new(1, 0, 0, 35)
    section.BackgroundTransparency = 1

    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Name = "SectionLabel"
    sectionLabel.Size = UDim2.new(1, 0, 1, 0)
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Text = "◈ " .. string.upper(title)
    sectionLabel.TextColor3 = COLORS.Accent
    sectionLabel.TextSize = 12
    sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    sectionLabel.Font = Enum.Font.GothamBold
    sectionLabel.TextTransparency = 0.3
    sectionLabel.Parent = section

    local sectionLine = Instance.new("Frame")
    sectionLine.Name = "SectionLine"
    sectionLine.Size = UDim2.new(1, 0, 0, 1)
    sectionLine.Position = UDim2.new(0, 0, 1, -1)
    sectionLine.BackgroundColor3 = COLORS.Border
    sectionLine.BorderSizePixel = 0
    sectionLine.Parent = section

    section.Parent = self.elements.NavList

    return section
end

-- Create Navigation Button với hiệu ứng neon
function NovaZ:CreateNavButton(title, icon)
    local navButton = Instance.new("TextButton")
    navButton.Name = title .. "Nav"
    navButton.Size = UDim2.new(1, 0, 0, 50)
    navButton.BackgroundColor3 = COLORS.Tertiary
    navButton.Text = ""
    navButton.AutoButtonColor = false

    local buttonCorner = createRoundedCorner(10)
    buttonCorner.Parent = navButton

    local buttonPadding = createPadding(20, 20, 12, 12)
    buttonPadding.Parent = navButton

    local buttonStroke = createStroke(COLORS.Border, 1)
    buttonStroke.Parent = navButton

    local buttonLabel = Instance.new("TextLabel")
    buttonLabel.Name = "Label"
    buttonLabel.Size = UDim2.new(1, -40, 1, 0)
    buttonLabel.Position = UDim2.new(0, 40, 0, 0)
    buttonLabel.BackgroundTransparency = 1
    buttonLabel.Text = title
    buttonLabel.TextColor3 = COLORS.Text
    buttonLabel.TextSize = 14
    buttonLabel.TextXAlignment = Enum.TextXAlignment.Left
    buttonLabel.Font = Enum.Font.GothamSemibold
    buttonLabel.Parent = navButton

    local buttonIcon = Instance.new("TextLabel")
    buttonIcon.Name = "Icon"
    buttonIcon.Size = UDim2.new(0, 30, 0, 30)
    buttonIcon.Position = UDim2.new(0, 5, 0.5, -15)
    buttonIcon.BackgroundTransparency = 1
    buttonIcon.Text = icon or "✦"
    buttonIcon.TextColor3 = COLORS.Accent
    buttonIcon.TextSize = 16
    buttonIcon.Font = Enum.Font.GothamBold
    buttonIcon.Parent = navButton

    -- Hover effects với glow
    navButton.MouseEnter:Connect(function()
        if not navButton:GetAttribute("Active") then
            TweenService:Create(navButton, TWEEN_INFO.Smooth, {
                BackgroundColor3 = COLORS.Hover,
                BackgroundTransparency = 0
            }):Play()
            TweenService:Create(buttonLabel, TWEEN_INFO.Smooth, {TextColor3 = COLORS.Accent}):Play()
            TweenService:Create(buttonStroke, TWEEN_INFO.Smooth, {Color = COLORS.Accent}):Play()
            TweenService:Create(buttonIcon, TWEEN_INFO.Smooth, {TextColor3 = COLORS.Success}):Play()
        end
    end)

    navButton.MouseLeave:Connect(function()
        if not navButton:GetAttribute("Active") then
            TweenService:Create(navButton, TWEEN_INFO.Smooth, {
                BackgroundColor3 = COLORS.Tertiary
            }):Play()
            TweenService:Create(buttonLabel, TWEEN_INFO.Smooth, {TextColor3 = COLORS.Text}):Play()
            TweenService:Create(buttonStroke, TWEEN_INFO.Smooth, {Color = COLORS.Border}):Play()
            TweenService:Create(buttonIcon, TWEEN_INFO.Smooth, {TextColor3 = COLORS.Accent}):Play()
        end
    end)

    navButton.Parent = self.elements.NavList

    return navButton
end

-- Create Page
function NovaZ:CreatePage(title)
    local page = Instance.new("ScrollingFrame")
    page.Name = title .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 5
    page.ScrollBarImageColor3 = COLORS.Accent
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = false

    local pageLayout = Instance.new("UIListLayout")
    pageLayout.Padding = UDim.new(0, 20)
    pageLayout.Parent = page

    local pagePadding = createPadding(10, 10, 10, 10)
    pagePadding.Parent = page

    page.Parent = self.elements.MainContent

    self.pages[title] = page
    return page
end

-- Switch Page
function NovaZ:SwitchToPage(pageName)
    if self.currentPage then
        self.currentPage.Visible = false
    end
    
    if self.pages[pageName] then
        self.pages[pageName].Visible = true
        self.currentPage = self.pages[pageName]
    end
end

-- Create Card với hiệu ứng glow
function NovaZ:CreateCard(parent, height)
    local card = Instance.new("Frame")
    card.Name = "Card"
    card.Size = UDim2.new(1, 0, 0, height or 90)
    card.BackgroundColor3 = COLORS.Secondary
    card.BorderSizePixel = 0

    local cardCorner = createRoundedCorner(12)
    cardCorner.Parent = card

    local cardStroke = createStroke(COLORS.Border, 1)
    cardStroke.Parent = card

    local cardPadding = createPadding(25, 25, 20, 20)
    cardPadding.Parent = card

    -- Glow effect
    local cardGlow = createGlowEffect(card, COLORS.Glow)
    cardGlow.ImageTransparency = 0.9

    card.Parent = parent
    return card
end

-- Create Label với hiệu ứng
function NovaZ:CreateLabel(parent, text, isTitle)
    local labelContainer = Instance.new("Frame")
    labelContainer.Name = "LabelContainer"
    labelContainer.Size = UDim2.new(1, 0, 0, isTitle and 40 or 30)
    labelContainer.BackgroundTransparency = 1

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = isTitle and COLORS.Text or COLORS.TextSecondary
    label.TextSize = isTitle and 20 or 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = isTitle and Enum.Font.GothamBlack or Enum.Font.GothamSemibold
    label.TextStrokeTransparency = isTitle and 0.7 or 1
    label.TextStrokeColor3 = isTitle and COLORS.Accent or COLORS.Text
    label.Parent = labelContainer

    if isTitle then
        local titleLine = Instance.new("Frame")
        titleLine.Name = "TitleLine"
        titleLine.Size = UDim2.new(0, 60, 0, 3)
        titleLine.Position = UDim2.new(0, 0, 1, -3)
        titleLine.BackgroundColor3 = COLORS.Accent
        titleLine.BorderSizePixel = 0
        
        local lineGradient = createGradient(COLORS.Accent, COLORS.Accent2)
        lineGradient.Parent = titleLine
        
        titleLine.Parent = labelContainer
    end

    labelContainer.Parent = parent
    return labelContainer
end

-- Create Toggle với hiệu ứng neon
function NovaZ:CreateToggle(parent, text, defaultState, callback)
    local toggleContainer = Instance.new("Frame")
    toggleContainer.Name = "ToggleContainer"
    toggleContainer.Size = UDim2.new(1, 0, 0, 55)
    toggleContainer.BackgroundColor3 = COLORS.Secondary
    toggleContainer.BorderSizePixel = 0

    local toggleCorner = createRoundedCorner(10)
    toggleCorner.Parent = toggleContainer

    local togglePadding = createPadding(25, 25, 15, 15)
    togglePadding.Parent = toggleContainer

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = COLORS.Text
    label.TextSize = 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.GothamSemibold
    label.Parent = toggleContainer

    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "Toggle"
    toggleButton.Size = UDim2.new(0, 60, 0, 30)
    toggleButton.Position = UDim2.new(1, -65, 0.5, -15)
    toggleButton.BackgroundColor3 = defaultState and COLORS.Success or COLORS.Tertiary
    toggleButton.Text = ""

    local toggleBtnCorner = createRoundedCorner(15)
    toggleBtnCorner.Parent = toggleButton

    local toggleStroke = createStroke(defaultState and COLORS.Success or COLORS.Border, 2)
    toggleStroke.Parent = toggleButton

    local thumb = Instance.new("Frame")
    thumb.Name = "Thumb"
    thumb.Size = UDim2.new(0, 26, 0, 26)
    thumb.Position = defaultState and UDim2.new(1, -27, 0.5, -13) or UDim2.new(0, 1, 0.5, -13)
    thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    thumb.BorderSizePixel = 0

    local thumbCorner = createRoundedCorner(13)
    thumbCorner.Parent = thumb
    thumb.Parent = toggleButton

    local isOn = defaultState or false

    toggleButton.MouseButton1Click:Connect(function()
        isOn = not isOn
        
        local goalPosition = isOn and UDim2.new(1, -27, 0.5, -13) or UDim2.new(0, 1, 0.5, -13)
        local goalColor = isOn and COLORS.Success or COLORS.Tertiary
        local goalStroke = isOn and COLORS.Success or COLORS.Border
        
        TweenService:Create(thumb, TWEEN_INFO.Bounce, {Position = goalPosition}):Play()
        TweenService:Create(toggleButton, TWEEN_INFO.Smooth, {BackgroundColor3 = goalColor}):Play()
        TweenService:Create(toggleStroke, TWEEN_INFO.Smooth, {Color = goalStroke}):Play()
        
        if callback then
            callback(isOn)
        end
    end)

    toggleButton.Parent = toggleContainer
    toggleContainer.Parent = parent

    return {
        Container = toggleContainer,
        GetState = function() return isOn end,
        SetState = function(state)
            isOn = state
            thumb.Position = state and UDim2.new(1, -27, 0.5, -13) or UDim2.new(0, 1, 0.5, -13)
            toggleButton.BackgroundColor3 = state and COLORS.Success or COLORS.Tertiary
            toggleStroke.Color = state and COLORS.Success or COLORS.Border
        end
    }
end

-- Create Button với gradient và glow
function NovaZ:CreateButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Name = text .. "Button"
    button.Size = UDim2.new(1, 0, 0, 50)
    button.BackgroundColor3 = COLORS.Accent
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 15
    button.Font = Enum.Font.GothamBlack
    button.AutoButtonColor = false

    local buttonCorner = createRoundedCorner(10)
    buttonCorner.Parent = button

    local buttonPadding = createPadding(25, 25, 15, 15)
    buttonPadding.Parent = button

    local buttonGradient = createGradient(COLORS.Accent, COLORS.Accent2, 45)
    buttonGradient.Parent = button

    local buttonStroke = createStroke(Color3.fromRGB(255, 255, 255), 1)
    buttonStroke.Parent = button

    -- Glow effect
    local buttonGlow = createGlowEffect(button, COLORS.Accent)
    buttonGlow.ImageTransparency = 0.8

    -- Hover effects
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TWEEN_INFO.Smooth, {
            Size = UDim2.new(1, -5, 0, 50),
            BackgroundTransparency = 0
        }):Play()
        TweenService:Create(buttonGlow, TWEEN_INFO.Smooth, {ImageTransparency = 0.6}):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TWEEN_INFO.Smooth, {
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundTransparency = 0
        }):Play()
        TweenService:Create(buttonGlow, TWEEN_INFO.Smooth, {ImageTransparency = 0.8}):Play()
    end)

    button.MouseButton1Click:Connect(function()
        -- Click animation
        TweenService:Create(button, TWEEN_INFO.Quick, {BackgroundTransparency = 0.3}):Play()
        TweenService:Create(buttonGlow, TWEEN_INFO.Quick, {ImageTransparency = 0.4}):Play()
        wait(0.1)
        TweenService:Create(button, TWEEN_INFO.Quick, {BackgroundTransparency = 0}):Play()
        TweenService:Create(buttonGlow, TWEEN_INFO.Quick, {ImageTransparency = 0.8}):Play()
        
        if callback then
            callback()
        end
    end)

    button.Parent = parent
    return button
end

-- Create Slider với hiệu ứng
function NovaZ:CreateSlider(parent, text, minValue, maxValue, defaultValue, callback)
    local sliderContainer = Instance.new("Frame")
    sliderContainer.Name = "SliderContainer"
    sliderContainer.Size = UDim2.new(1, 0, 0, 80)
    sliderContainer.BackgroundColor3 = COLORS.Secondary
    sliderContainer.BorderSizePixel = 0

    local sliderCorner = createRoundedCorner(10)
    sliderCorner.Parent = sliderContainer

    local sliderPadding = createPadding(25, 25, 20, 20)
    sliderPadding.Parent = sliderContainer

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. defaultValue
    label.TextColor3 = COLORS.Text
    label.TextSize = 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.GothamSemibold
    label.Parent = sliderContainer

    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Size = UDim2.new(1, 0, 0, 8)
    track.Position = UDim2.new(0, 0, 1, -30)
    track.BackgroundColor3 = COLORS.Tertiary
    track.BorderSizePixel = 0

    local trackCorner = createRoundedCorner(4)
    trackCorner.Parent = track
    track.Parent = sliderContainer

    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new((defaultValue - minValue) / (maxValue - minValue), 0, 1, 0)
    fill.BackgroundColor3 = COLORS.Accent
    fill.BorderSizePixel = 0

    local fillCorner = createRoundedCorner(4)
    fillCorner.Parent = fill
    fill.Parent = track

    local fillGradient = createGradient(COLORS.Accent, COLORS.Accent2)
    fillGradient.Parent = fill

    local thumb = Instance.new("TextButton")
    thumb.Name = "Thumb"
    thumb.Size = UDim2.new(0, 20, 0, 20)
    thumb.Position = UDim2.new((defaultValue - minValue) / (maxValue - minValue), -10, 0.5, -10)
    thumb.BackgroundColor3 = COLORS.Accent
    thumb.Text = ""

    local thumbCorner = createRoundedCorner(10)
    thumbCorner.Parent = thumb
    thumb.Parent = sliderContainer

    local thumbStroke = createStroke(Color3.fromRGB(255, 255, 255), 2)
    thumbStroke.Parent = thumb

    local thumbGlow = createGlowEffect(thumb, COLORS.Accent)
    thumbGlow.ImageTransparency = 0.7

    local currentValue = defaultValue

    local function updateValue(xPosition)
        local relativeX = math.clamp(xPosition, 0, track.AbsoluteSize.X)
        local value = minValue + (relativeX / track.AbsoluteSize.X) * (maxValue - minValue)
        currentValue = math.floor(value)
        
        fill.Size = UDim2.new(relativeX / track.AbsoluteSize.X, 0, 1, 0)
        thumb.Position = UDim2.new(relativeX / track.AbsoluteSize.X, -10, 0.5, -10)
        label.Text = text .. ": " .. currentValue
        
        if callback then
            callback(currentValue)
        end
    end

    thumb.MouseButton1Down:Connect(function()
        local connection
        connection = UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                updateValue(input.Position.X - track.AbsolutePosition.X)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                connection:Disconnect()
            end
        end)
    end)

    sliderContainer.Parent = parent

    return {
        Container = sliderContainer,
        GetValue = function() return currentValue end,
        SetValue = function(value)
            currentValue = math.clamp(value, minValue, maxValue)
            local relativeX = ((currentValue - minValue) / (maxValue - minValue)) * track.AbsoluteSize.X
            fill.Size = UDim2.new(relativeX / track.AbsoluteSize.X, 0, 1, 0)
            thumb.Position = UDim2.new(relativeX / track.AbsoluteSize.X, -10, 0.5, -10)
            label.Text = text .. ": " .. currentValue
        end
    }
end

-- Create Dropdown với animation
function NovaZ:CreateDropdown(parent, text, options, defaultOption, callback)
    local dropdownContainer = Instance.new("Frame")
    dropdownContainer.Name = "DropdownContainer"
    dropdownContainer.Size = UDim2.new(1, 0, 0, 80)
    dropdownContainer.BackgroundTransparency = 1

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = COLORS.Text
    label.TextSize = 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.GothamSemibold
    label.Parent = dropdownContainer

    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Name = "DropdownButton"
    dropdownButton.Size = UDim2.new(1, 0, 0, 45)
    dropdownButton.Position = UDim2.new(0, 0, 0, 30)
    dropdownButton.BackgroundColor3 = COLORS.Secondary
    dropdownButton.Text = defaultOption or options[1] or "Select..."
    dropdownButton.TextColor3 = COLORS.Text
    dropdownButton.TextSize = 14
    dropdownButton.Font = Enum.Font.Gotham
    dropdownButton.AutoButtonColor = false

    local buttonCorner = createRoundedCorner(8)
    buttonCorner.Parent = dropdownButton

    local buttonPadding = createPadding(15, 35, 12, 12)
    buttonPadding.Parent = dropdownButton

    local buttonStroke = createStroke(COLORS.Border, 1)
    buttonStroke.Parent = dropdownButton

    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(0, 25, 0, 25)
    arrow.Position = UDim2.new(1, -30, 0.5, -12.5)
    arrow.BackgroundTransparency = 1
    arrow.Text = "▼"
    arrow.TextColor3 = COLORS.Accent
    arrow.TextSize = 14
    arrow.Font = Enum.Font.GothamBold
    arrow.Parent = dropdownButton

    local dropdownList = Instance.new("Frame")
    dropdownList.Name = "DropdownList"
    dropdownList.Size = UDim2.new(1, 0, 0, 0)
    dropdownList.Position = UDim2.new(0, 0, 1, 5)
    dropdownList.BackgroundColor3 = COLORS.Secondary
    dropdownList.Visible = false
    dropdownList.BorderSizePixel = 0
    dropdownList.ClipsDescendants = true

    local listCorner = createRoundedCorner(8)
    listCorner.Parent = dropdownList

    local listLayout = Instance.new("UIListLayout")
    listLayout.Parent = dropdownList

    local isOpen = false
    local selectedOption = defaultOption or options[1]

    local function toggleDropdown()
        isOpen = not isOpen
        dropdownList.Visible = isOpen
        
        if isOpen then
            dropdownList.Size = UDim2.new(1, 0, 0, math.min(#options * 40, 200))
            TweenService:Create(arrow, TWEEN_INFO.Smooth, {Rotation = 180}):Play()
            TweenService:Create(buttonStroke, TWEEN_INFO.Smooth, {Color = COLORS.Accent}):Play()
        else
            dropdownList.Size = UDim2.new(1, 0, 0, 0)
            TweenService:Create(arrow, TWEEN_INFO.Smooth, {Rotation = 0}):Play()
            TweenService:Create(buttonStroke, TWEEN_INFO.Smooth, {Color = COLORS.Border}):Play()
        end
    end

    dropdownButton.MouseButton1Click:Connect(toggleDropdown)

    -- Create options
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Name = option
        optionButton.Size = UDim2.new(1, 0, 0, 40)
        optionButton.BackgroundColor3 = COLORS.Secondary
        optionButton.Text = option
        optionButton.TextColor3 = COLORS.Text
        optionButton.TextSize = 14
        optionButton.Font = Enum.Font.Gotham
        optionButton.AutoButtonColor = false

        local optionCorner = createRoundedCorner(6)
        optionCorner.Parent = optionButton

        local optionPadding = createPadding(15, 15, 10, 10)
        optionPadding.Parent = optionButton

        optionButton.MouseEnter:Connect(function()
            TweenService:Create(optionButton, TWEEN_INFO.Smooth, {BackgroundColor3 = COLORS.Hover}):Play()
        end)

        optionButton.MouseLeave:Connect(function()
            TweenService:Create(optionButton, TWEEN_INFO.Smooth, {BackgroundColor3 = COLORS.Secondary}):Play()
        end)

        optionButton.MouseButton1Click:Connect(function()
            selectedOption = option
            dropdownButton.Text = option
            toggleDropdown()
            
            if callback then
                callback(option)
            end
        end)

        optionButton.Parent = dropdownList
    end

    dropdownList.Parent = dropdownButton
    dropdownButton.Parent = dropdownContainer
    dropdownContainer.Parent = parent

    return {
        Container = dropdownContainer,
        GetSelected = function() return selectedOption end,
        SetSelected = function(option)
            if table.find(options, option) then
                selectedOption = option
                dropdownButton.Text = option
            end
        end
    }
end

-- Create Input với hiệu ứng focus
function NovaZ:CreateInput(parent, text, placeholder, callback)
    local inputContainer = Instance.new("Frame")
    inputContainer.Name = "InputContainer"
    inputContainer.Size = UDim2.new(1, 0, 0, 80)
    inputContainer.BackgroundTransparency = 1

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = COLORS.Text
    label.TextSize = 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.GothamSemibold
    label.Parent = inputContainer

    local textBox = Instance.new("TextBox")
    textBox.Name = "TextBox"
    textBox.Size = UDim2.new(1, 0, 0, 45)
    textBox.Position = UDim2.new(0, 0, 0, 30)
    textBox.BackgroundColor3 = COLORS.Secondary
    textBox.Text = ""
    textBox.PlaceholderText = placeholder or "Enter text..."
    textBox.PlaceholderColor3 = COLORS.TextTertiary
    textBox.TextColor3 = COLORS.Text
    textBox.TextSize = 14
    textBox.Font = Enum.Font.Gotham
    textBox.ClearTextOnFocus = false

    local boxCorner = createRoundedCorner(8)
    boxCorner.Parent = textBox

    local boxPadding = createPadding(15, 15, 12, 12)
    boxPadding.Parent = textBox

    local boxStroke = createStroke(COLORS.Border, 1)
    boxStroke.Parent = textBox

    textBox.Focused:Connect(function()
        TweenService:Create(textBox, TWEEN_INFO.Smooth, {BackgroundColor3 = COLORS.Hover}):Play()
        TweenService:Create(boxStroke, TWEEN_INFO.Smooth, {Color = COLORS.Accent}):Play()
    end)

    textBox.FocusLost:Connect(function()
        TweenService:Create(textBox, TWEEN_INFO.Smooth, {BackgroundColor3 = COLORS.Secondary}):Play()
        TweenService:Create(boxStroke, TWEEN_INFO.Smooth, {Color = COLORS.Border}):Play()
        
        if callback then
            callback(textBox.Text)
        end
    end)

    textBox.Parent = inputContainer
    inputContainer.Parent = parent

    return {
        Container = inputContainer,
        GetText = function() return textBox.Text end,
        SetText = function(newText) textBox.Text = newText end
    }
end

-- Notification System
function NovaZ:Notify(title, message, duration)
    duration = duration or 5
    
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Size = UDim2.new(0, 300, 0, 80)
    notification.Position = UDim2.new(1, -320, 1, -100)
    notification.BackgroundColor3 = COLORS.Secondary
    notification.BorderSizePixel = 0

    local notifCorner = createRoundedCorner(10)
    notifCorner.Parent = notification

    local notifStroke = createStroke(COLORS.Accent, 2)
    notifStroke.Parent = notification

    local notifPadding = createPadding(15, 15, 12, 12)
    notifPadding.Parent = notification

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 25)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = COLORS.Accent
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = notification

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Name = "Message"
    messageLabel.Size = UDim2.new(1, 0, 1, -25)
    messageLabel.Position = UDim2.new(0, 0, 0, 25)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = COLORS.Text
    messageLabel.TextSize = 13
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.Parent = notification

    notification.Parent = self.elements.ScreenGui

    -- Animation in
    notification.Position = UDim2.new(1, 350, 1, -100)
    TweenService:Create(notification, TWEEN_INFO.Elastic, {
        Position = UDim2.new(1, -320, 1, -100)
    }):Play()

    -- Auto remove
    delay(duration, function()
        TweenService:Create(notification, TWEEN_INFO.Smooth, {
            Position = UDim2.new(1, 350, 1, -100)
        }):Play()
        wait(0.3)
        notification:Destroy()
    end)
end

-- Cleanup
function NovaZ:Destroy()
    for _, connection in pairs(self.connections) do
        connection:Disconnect()
    end
    
    if self.elements.ScreenGui then
        self.elements.ScreenGui:Destroy()
    end
end

return NovaZ
