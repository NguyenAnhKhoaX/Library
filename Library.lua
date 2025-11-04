-- NazuXHub.lua
-- Complete Windows 11 UI Library with Titlebar, Tabs and Full Features
-- Usage: local NazuX = require(script.Parent.NazuXHub)

local NazuXHub = {}
NazuXHub.__index = NazuXHub

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Colors based on Windows 11 25H2
local COLORS = {
    Background = Color3.fromRGB(32, 32, 32),
    MicaBackground = Color3.fromRGB(36, 36, 36),
    CardBackground = Color3.fromRGB(45, 45, 45),
    SectionBackground = Color3.fromRGB(42, 42, 42),
    TitlebarBackground = Color3.fromRGB(30, 30, 30),
    Primary = Color3.fromRGB(0, 120, 215),
    PrimaryLight = Color3.fromRGB(30, 150, 245),
    PrimaryDark = Color3.fromRGB(0, 90, 180),
    Success = Color3.fromRGB(16, 137, 62),
    Warning = Color3.fromRGB(202, 80, 16),
    Error = Color3.fromRGB(232, 17, 35),
    TextPrimary = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(200, 200, 200),
    TextDisabled = Color3.fromRGB(150, 150, 150),
    Border = Color3.fromRGB(70, 70, 70),
    Hover = Color3.fromRGB(60, 60, 60),
    Pressed = Color3.fromRGB(55, 55, 55),
    ToggleOff = Color3.fromRGB(80, 80, 80),
    ToggleOn = Color3.fromRGB(0, 120, 215),
    SliderTrack = Color3.fromRGB(70, 70, 70),
    SliderThumb = Color3.fromRGB(200, 200, 200),
    DropdownBackground = Color3.fromRGB(50, 50, 50),
    DropdownHover = Color3.fromRGB(65, 65, 65),
    TabActive = Color3.fromRGB(0, 120, 215),
    TabInactive = Color3.fromRGB(45, 45, 45),
    TabHover = Color3.fromRGB(60, 60, 60)
}

local FONTS = {
    Title = Enum.Font.GothamBold,
    Header = Enum.Font.GothamSemibold,
    Body = Enum.Font.Gotham,
    Caption = Enum.Font.GothamLight
}

-- Animation presets
local TWEEN_INFO = {
    Fast = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Normal = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Smooth = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Bounce = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
}

function NazuXHub.new(parentFrame, config)
    local self = setmetatable({}, NazuXHub)
    
    config = config or {}
    self.Parent = parentFrame
    self.Title = config.Title or "NazuX Hub"
    self.Subtitle = config.Subtitle or "Premium Script Hub"
    self.Pages = {}
    self.Tabs = {}
    self.CurrentPage = nil
    self.CurrentTab = nil
    self.ActiveDropdowns = {}
    self.Dragging = false
    self.DragStart = nil
    self.DragStartPosition = nil
    
    self:CreateMainContainer()
    self:CreateTitlebar()
    self:CreateNavigationPane()
    self:CreateContentArea()
    
    -- Close dropdowns when clicking outside
    self.ClickOutsideConnection = UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self:CloseAllDropdowns()
        end
    end)
    
    return self
end

function NazuXHub:CreateMainContainer()
    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Name = "NazuXHub"
    self.MainFrame.Size = UDim2.new(1, 0, 1, 0)
    self.MainFrame.BackgroundColor3 = COLORS.MicaBackground
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.ClipsDescendants = true
    self.MainFrame.Parent = self.Parent
    
    -- Mica effect with animation
    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 90
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, COLORS.MicaBackground),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
    })
    gradient.Parent = self.MainFrame
    
    -- Add subtle border
    local border = Instance.new("UIStroke")
    border.Color = COLORS.Border
    border.Thickness = 1
    border.Parent = self.MainFrame
    
    -- Entrance animation
    self.MainFrame.Size = UDim2.new(0, 0, 0, 0)
    self.MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    self.MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    
    local sizeTween = TweenService:Create(
        self.MainFrame,
        TWEEN_INFO.Smooth,
        {Size = UDim2.new(1, 0, 1, 0)}
    )
    sizeTween:Play()
end

function NazuXHub:CreateTitlebar()
    self.Titlebar = Instance.new("Frame")
    self.Titlebar.Name = "Titlebar"
    self.Titlebar.Size = UDim2.new(1, 0, 0, 80)
    self.Titlebar.BackgroundColor3 = COLORS.TitlebarBackground
    self.Titlebar.BorderSizePixel = 0
    self.Titlebar.Parent = self.MainFrame
    
    -- Bottom border
    local border = Instance.new("Frame")
    border.Name = "BottomBorder"
    border.Size = UDim2.new(1, 0, 0, 1)
    border.Position = UDim2.new(0, 0, 1, -1)
    border.BackgroundColor3 = COLORS.Border
    border.BorderSizePixel = 0
    border.Parent = self.Titlebar
    
    -- App icon
    local icon = Instance.new("ImageLabel")
    icon.Name = "AppIcon"
    icon.Size = UDim2.new(0, 24, 0, 24)
    icon.Position = UDim2.new(0, 20, 0, 15)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxasset://textures/ui/LuaChat/icons/ic-settings.png"
    icon.ImageColor3 = COLORS.Primary
    icon.ImageTransparency = 1
    icon.Parent = self.Titlebar
    
    -- Main title
    self.TitleLabel = Instance.new("TextLabel")
    self.TitleLabel.Name = "Title"
    self.TitleLabel.Size = UDim2.new(0, 200, 0, 24)
    self.TitleLabel.Position = UDim2.new(0, 55, 0, 15)
    self.TitleLabel.BackgroundTransparency = 1
    self.TitleLabel.Text = self.Title
    self.TitleLabel.TextColor3 = COLORS.TextPrimary
    self.TitleLabel.TextSize = 18
    self.TitleLabel.Font = FONTS.Title
    self.TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    self.TitleLabel.TextTransparency = 1
    self.TitleLabel.Parent = self.Titlebar
    
    -- Subtitle
    self.SubtitleLabel = Instance.new("TextLabel")
    self.SubtitleLabel.Name = "Subtitle"
    self.SubtitleLabel.Size = UDim2.new(0, 300, 0, 18)
    self.SubtitleLabel.Position = UDim2.new(0, 55, 0, 40)
    self.SubtitleLabel.BackgroundTransparency = 1
    self.SubtitleLabel.Text = self.Subtitle
    self.SubtitleLabel.TextColor3 = COLORS.TextSecondary
    self.SubtitleLabel.TextSize = 12
    self.SubtitleLabel.Font = FONTS.Caption
    self.SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    self.SubtitleLabel.TextTransparency = 1
    self.SubtitleLabel.Parent = self.Titlebar
    
    -- Search box (centered in titlebar)
    self.SearchBox = Instance.new("Frame")
    self.SearchBox.Name = "SearchBox"
    self.SearchBox.Size = UDim2.new(0, 280, 0, 32)
    self.SearchBox.Position = UDim2.new(0.5, -140, 0.5, -16)
    self.SearchBox.BackgroundColor3 = COLORS.CardBackground
    self.SearchBox.BorderSizePixel = 0
    self.SearchBox.BackgroundTransparency = 1
    
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 6)
    searchCorner.Parent = self.SearchBox
    
    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Size = UDim2.new(0, 16, 0, 16)
    searchIcon.Position = UDim2.new(0, 12, 0.5, -8)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxasset://textures/ui/LuaChat/icons/ic-search.png"
    searchIcon.ImageColor3 = COLORS.TextSecondary
    searchIcon.ImageTransparency = 1
    searchIcon.Parent = self.SearchBox
    
    self.SearchTextBox = Instance.new("TextBox")
    self.SearchTextBox.Name = "SearchTextBox"
    self.SearchTextBox.Size = UDim2.new(1, -40, 1, 0)
    self.SearchTextBox.Position = UDim2.new(0, 35, 0, 0)
    self.SearchTextBox.BackgroundTransparency = 1
    self.SearchTextBox.PlaceholderText = "Search settings..."
    self.SearchTextBox.PlaceholderColor3 = COLORS.TextDisabled
    self.SearchTextBox.Text = ""
    self.SearchTextBox.TextColor3 = COLORS.TextPrimary
    self.SearchTextBox.TextSize = 14
    self.SearchTextBox.TextXAlignment = Enum.TextXAlignment.Left
    self.SearchTextBox.Font = FONTS.Body
    self.SearchTextBox.TextTransparency = 1
    self.SearchTextBox.Parent = self.SearchBox
    
    -- Search box focus effects
    self.SearchTextBox.Focused:Connect(function()
        TweenService:Create(self.SearchBox, TWEEN_INFO.Fast, {
            BackgroundColor3 = COLORS.Hover,
            BackgroundTransparency = 0
        }):Play()
    end)
    
    self.SearchTextBox.FocusLost:Connect(function()
        TweenService:Create(self.SearchBox, TWEEN_INFO.Fast, {
            BackgroundColor3 = COLORS.CardBackground,
            BackgroundTransparency = 0.5
        }):Play()
    end)
    
    self.SearchBox.Parent = self.Titlebar
    
    -- Window controls
    self:CreateWindowControls()
    
    -- Drag functionality
    self:SetupDrag()
    
    -- Entrance animations
    delay(0.1, function()
        TweenService:Create(icon, TWEEN_INFO.Smooth, {ImageTransparency = 0}):Play()
        TweenService:Create(self.TitleLabel, TWEEN_INFO.Smooth, {TextTransparency = 0}):Play()
        TweenService:Create(self.SubtitleLabel, TWEEN_INFO.Smooth, {TextTransparency = 0}):Play()
        TweenService:Create(self.SearchBox, TWEEN_INFO.Smooth, {BackgroundTransparency = 0.5}):Play()
        TweenService:Create(searchIcon, TWEEN_INFO.Smooth, {ImageTransparency = 0}):Play()
        TweenService:Create(self.SearchTextBox, TWEEN_INFO.Smooth, {TextTransparency = 0}):Play()
    end)
end

function NazuXHub:CreateWindowControls()
    local controlsFrame = Instance.new("Frame")
    controlsFrame.Name = "WindowControls"
    controlsFrame.Size = UDim2.new(0, 120, 0, 32)
    controlsFrame.Position = UDim2.new(1, -130, 0, 15)
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.Parent = self.Titlebar
    
    local controlsLayout = Instance.new("UIListLayout")
    controlsLayout.FillDirection = Enum.FillDirection.Horizontal
    controlsLayout.Padding = UDim.new(0, 8)
    controlsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    controlsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    controlsLayout.Parent = controlsFrame
    
    -- Minimize button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "Minimize"
    minimizeBtn.Size = UDim2.new(0, 32, 0, 32)
    minimizeBtn.BackgroundColor3 = COLORS.CardBackground
    minimizeBtn.AutoButtonColor = false
    minimizeBtn.Text = "─"
    minimizeBtn.TextColor3 = COLORS.TextPrimary
    minimizeBtn.TextSize = 16
    minimizeBtn.Font = FONTS.Body
    
    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0, 6)
    minimizeCorner.Parent = minimizeBtn
    
    -- Maximize button
    local maximizeBtn = Instance.new("TextButton")
    maximizeBtn.Name = "Maximize"
    maximizeBtn.Size = UDim2.new(0, 32, 0, 32)
    maximizeBtn.BackgroundColor3 = COLORS.CardBackground
    maximizeBtn.AutoButtonColor = false
    maximizeBtn.Text = "□"
    maximizeBtn.TextColor3 = COLORS.TextPrimary
    maximizeBtn.TextSize = 14
    maximizeBtn.Font = FONTS.Body
    
    local maximizeCorner = Instance.new("UICorner")
    maximizeCorner.CornerRadius = UDim.new(0, 6)
    maximizeCorner.Parent = maximizeBtn
    
    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.Size = UDim2.new(0, 32, 0, 32)
    closeBtn.BackgroundColor3 = COLORS.Error
    closeBtn.AutoButtonColor = false
    closeBtn.Text = "×"
    closeBtn.TextColor3 = COLORS.TextPrimary
    closeBtn.TextSize = 18
    closeBtn.Font = FONTS.Body
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = closeBtn
    
    -- Button hover effects
    local function setupButton(button, hoverColor)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TWEEN_INFO.Fast, {BackgroundColor3 = hoverColor}):Play()
        end)
        
        button.MouseLeave:Connect(function()
            local defaultColor = button == closeBtn and COLORS.Error or COLORS.CardBackground
            TweenService:Create(button, TWEEN_INFO.Fast, {BackgroundColor3 = defaultColor}):Play()
        end)
        
        button.MouseButton1Click:Connect(function()
            TweenService:Create(button, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.Pressed}):Play()
            wait(0.1)
            TweenService:Create(button, TWEEN_INFO.Fast, {
                BackgroundColor3 = button == closeBtn and COLORS.Error or COLORS.CardBackground
            }):Play()
        end)
    end
    
    setupButton(minimizeBtn, COLORS.Hover)
    setupButton(maximizeBtn, COLORS.Hover)
    setupButton(closeBtn, Color3.fromRGB(255, 50, 50))
    
    -- Button actions
    minimizeBtn.MouseButton1Click:Connect(function()
        self:Minimize()
    end)
    
    maximizeBtn.MouseButton1Click:Connect(function()
        self:ToggleMaximize()
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        self:Close()
    end)
    
    minimizeBtn.Parent = controlsFrame
    maximizeBtn.Parent = controlsFrame
    closeBtn.Parent = controlsFrame
end

function NazuXHub:SetupDrag()
    self.Titlebar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self.Dragging = true
            self.DragStart = input.Position
            self.DragStartPosition = self.MainFrame.Position
            
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    self.Dragging = false
                    connection:Disconnect()
                end
            end)
        end
    end)
    
    self.Titlebar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and self.Dragging then
            local delta = input.Position - self.DragStart
            self.MainFrame.Position = UDim2.new(
                self.DragStartPosition.X.Scale,
                self.DragStartPosition.X.Offset + delta.X,
                self.DragStartPosition.Y.Scale,
                self.DragStartPosition.Y.Offset + delta.Y
            )
        end
    end)
end

function NazuXHub:CreateNavigationPane()
    self.NavFrame = Instance.new("Frame")
    self.NavFrame.Name = "NavigationPane"
    self.NavFrame.Size = UDim2.new(0, 280, 1, -80)
    self.NavFrame.Position = UDim2.new(-0.3, 0, 0, 80)
    self.NavFrame.BackgroundColor3 = COLORS.SectionBackground
    self.NavFrame.BorderSizePixel = 0
    self.NavFrame.Parent = self.MainFrame
    
    -- Slide in animation
    TweenService:Create(
        self.NavFrame,
        TWEEN_INFO.Smooth,
        {Position = UDim2.new(0, 0, 0, 80)}
    ):Play()
    
    local navScrollingFrame = Instance.new("ScrollingFrame")
    navScrollingFrame.Name = "NavScrollingFrame"
    navScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    navScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
    navScrollingFrame.BackgroundTransparency = 1
    navScrollingFrame.BorderSizePixel = 0
    navScrollingFrame.ScrollBarThickness = 3
    navScrollingFrame.ScrollBarImageColor3 = COLORS.Border
    navScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    navScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    navScrollingFrame.Parent = self.NavFrame
    
    self.NavScrollingFrame = navScrollingFrame
    
    local navUIListLayout = Instance.new("UIListLayout")
    navUIListLayout.Name = "NavUIListLayout"
    navUIListLayout.Padding = UDim.new(0, 8)
    navUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    navUIListLayout.Parent = navScrollingFrame
    
    local navPadding = Instance.new("UIPadding")
    navPadding.PaddingLeft = UDim.new(0, 15)
    navPadding.PaddingRight = UDim.new(0, 15)
    navPadding.PaddingTop = UDim.new(0, 15)
    navPadding.PaddingBottom = UDim.new(0, 15)
    navPadding.Parent = navScrollingFrame
end

function NazuXHub:CreateContentArea()
    self.ContentFrame = Instance.new("Frame")
    self.ContentFrame.Name = "ContentArea"
    self.ContentFrame.Size = UDim2.new(1, -280, 1, -80)
    self.ContentFrame.Position = UDim2.new(1, 0, 0, 80)
    self.ContentFrame.BackgroundColor3 = COLORS.Background
    self.ContentFrame.BorderSizePixel = 0
    self.ContentFrame.Parent = self.MainFrame
    
    -- Slide in animation
    TweenService:Create(
        self.ContentFrame,
        TWEEN_INFO.Smooth,
        {Position = UDim2.new(0, 280, 0, 80)}
    ):Play()
    
    local contentScrollingFrame = Instance.new("ScrollingFrame")
    contentScrollingFrame.Name = "ContentScrollingFrame"
    contentScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    contentScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
    contentScrollingFrame.BackgroundTransparency = 1
    contentScrollingFrame.BorderSizePixel = 0
    contentScrollingFrame.ScrollBarThickness = 3
    contentScrollingFrame.ScrollBarImageColor3 = COLORS.Border
    contentScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    contentScrollingFrame.Parent = self.ContentFrame
    
    self.ContentScrollingFrame = contentScrollingFrame
    
    local contentUIListLayout = Instance.new("UIListLayout")
    contentUIListLayout.Name = "ContentUIListLayout"
    contentUIListLayout.Padding = UDim.new(0, 20)
    contentUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentUIListLayout.Parent = contentScrollingFrame
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.Name = "ContentPadding"
    contentPadding.PaddingLeft = UDim.new(0, 40)
    contentPadding.PaddingRight = UDim.new(0, 40)
    contentPadding.PaddingTop = UDim.new(0, 20)
    contentPadding.PaddingBottom = UDim.new(0, 20)
    contentPadding.Parent = contentScrollingFrame
end

-- PUBLIC API METHODS

function NazuXHub:AddPage(pageName, iconId)
    local page = {
        Name = pageName,
        Sections = {},
        Tabs = {},
        SelectedTab = nil
    }
    
    self.Pages[pageName] = page
    self:CreateNavItem(pageName, iconId or "rbxasset://textures/ui/LuaChat/icons/ic-settings.png")
    
    if not self.CurrentPage then
        self:ShowPage(pageName)
    end
    
    return page
end

function NazuXHub:AddTab(pageName, tabName)
    local page = self.Pages[pageName]
    if not page then return end
    
    local tab = {
        Name = tabName,
        Sections = {}
    }
    
    table.insert(page.Tabs, tab)
    
    if not page.SelectedTab then
        page.SelectedTab = tab
    end
    
    return tab
end

function NazuXHub:AddSection(pageName, sectionData, tabName)
    local page = self.Pages[pageName]
    if not page then return end
    
    if tabName then
        for _, tab in ipairs(page.Tabs) do
            if tab.Name == tabName then
                table.insert(tab.Sections, sectionData)
                break
            end
        end
    else
        table.insert(page.Sections, sectionData)
    end
    
    if self.CurrentPage == pageName then
        self:ShowPage(pageName)
    end
end

-- Control Methods
function NazuXHub:AddButton(sectionData, buttonData)
    if not sectionData.Controls then
        sectionData.Controls = {}
    end
    
    buttonData.Type = "Button"
    table.insert(sectionData.Controls, buttonData)
end

function NazuXHub:AddToggle(sectionData, toggleData)
    if not sectionData.Controls then
        sectionData.Controls = {}
    end
    
    toggleData.Type = "Toggle"
    table.insert(sectionData.Controls, toggleData)
end

function NazuXHub:AddSlider(sectionData, sliderData)
    if not sectionData.Controls then
        sectionData.Controls = {}
    end
    
    sliderData.Type = "Slider"
    table.insert(sectionData.Controls, sliderData)
end

function NazuXHub:AddDropdown(sectionData, dropdownData)
    if not sectionData.Controls then
        sectionData.Controls = {}
    end
    
    dropdownData.Type = "Dropdown"
    table.insert(sectionData.Controls, dropdownData)
end

function NazuXHub:AddTextbox(sectionData, textboxData)
    if not sectionData.Controls then
        sectionData.Controls = {}
    end
    
    textboxData.Type = "Textbox"
    table.insert(sectionData.Controls, textboxData)
end

function NazuXHub:AddLabel(sectionData, labelData)
    if not sectionData.Controls then
        sectionData.Controls = {}
    end
    
    labelData.Type = "Label"
    table.insert(sectionData.Controls, labelData)
end

function NazuXHub:AddKeybind(sectionData, keybindData)
    if not sectionData.Controls then
        sectionData.Controls = {}
    end
    
    keybindData.Type = "Keybind"
    table.insert(sectionData.Controls, keybindData)
end

function NazuXHub:AddColorPicker(sectionData, colorPickerData)
    if not sectionData.Controls then
        sectionData.Controls = {}
    end
    
    colorPickerData.Type = "ColorPicker"
    table.insert(sectionData.Controls, colorPickerData)
end

function NazuXHub:AddSeparator(sectionData)
    if not sectionData.Controls then
        sectionData.Controls = {}
    end
    
    table.insert(sectionData.Controls, {Type = "Separator"})
end

-- PRIVATE METHODS

function NazuXHub:CreateNavItem(name, iconId)
    local navButton = Instance.new("TextButton")
    navButton.Name = name .. "Nav"
    navButton.Size = UDim2.new(1, 0, 0, 45)
    navButton.BackgroundColor3 = COLORS.SectionBackground
    navButton.BorderSizePixel = 0
    navButton.AutoButtonColor = false
    navButton.Text = ""
    navButton.BackgroundTransparency = 1
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = navButton
    
    local buttonPadding = Instance.new("UIPadding")
    buttonPadding.PaddingLeft = UDim.new(0, 15)
    buttonPadding.PaddingRight = UDim.new(0, 15)
    buttonPadding.Parent = navButton
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.FillDirection = Enum.FillDirection.Horizontal
    contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    contentLayout.Padding = UDim.new(0, 12)
    contentLayout.Parent = navButton
    
    local iconLabel = Instance.new("ImageLabel")
    iconLabel.Name = "Icon"
    iconLabel.Size = UDim2.new(0, 20, 0, 20)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Image = iconId
    iconLabel.ImageColor3 = COLORS.TextSecondary
    iconLabel.ImageTransparency = 1
    iconLabel.Parent = navButton
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Text"
    textLabel.Size = UDim2.new(1, -32, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = name
    textLabel.TextColor3 = COLORS.TextPrimary
    textLabel.TextSize = 14
    textLabel.Font = FONTS.Body
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextTransparency = 1
    textLabel.Parent = navButton
    
    -- Hover effects with animations
    navButton.MouseEnter:Connect(function()
        if not navButton:GetAttribute("IsSelected") then
            TweenService:Create(navButton, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.Hover, BackgroundTransparency = 0}):Play()
            TweenService:Create(iconLabel, TWEEN_INFO.Fast, {ImageColor3 = COLORS.TextPrimary}):Play()
        end
    end)
    
    navButton.MouseLeave:Connect(function()
        if not navButton:GetAttribute("IsSelected") then
            TweenService:Create(navButton, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.SectionBackground, BackgroundTransparency = 0.5}):Play()
            TweenService:Create(iconLabel, TWEEN_INFO.Fast, {ImageColor3 = COLORS.TextSecondary}):Play()
        end
    end)
    
    navButton.MouseButton1Click:Connect(function()
        self:SelectNavItem(navButton, name)
    end)
    
    navButton.Parent = self.NavScrollingFrame
    
    -- Staggered entrance animation
    delay(#self.NavScrollingFrame:GetChildren() * 0.05, function()
        TweenService:Create(navButton, TWEEN_INFO.Smooth, {BackgroundTransparency = 0}):Play()
        TweenService:Create(iconLabel, TWEEN_INFO.Smooth, {ImageTransparency = 0}):Play()
        TweenService:Create(textLabel, TWEEN_INFO.Smooth, {TextTransparency = 0}):Play()
    end)
    
    return navButton
end

function NazuXHub:SelectNavItem(button, pageName)
    -- Deselect all with animation
    for _, child in ipairs(self.NavScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            local wasSelected = child:GetAttribute("IsSelected")
            child:SetAttribute("IsSelected", false)
            
            if wasSelected then
                local icon = child:FindFirstChild("Icon")
                TweenService:Create(child, TWEEN_INFO.Normal, {BackgroundColor3 = COLORS.SectionBackground}):Play()
                if icon then
                    TweenService:Create(icon, TWEEN_INFO.Normal, {ImageColor3 = COLORS.TextSecondary}):Play()
                end
            end
        end
    end
    
    -- Select current with smooth animation
    button:SetAttribute("IsSelected", true)
    local icon = button:FindFirstChild("Icon")
    
    TweenService:Create(button, TWEEN_INFO.Normal, {BackgroundColor3 = COLORS.Primary}):Play()
    if icon then
        TweenService:Create(icon, TWEEN_INFO.Normal, {ImageColor3 = COLORS.TextPrimary}):Play()
    end
    
    self:ShowPage(pageName)
end

function NazuXHub:ShowPage(pageName)
    local page = self.Pages[pageName]
    if not page then return end
    
    -- Fade out current content
    for _, child in ipairs(self.ContentScrollingFrame:GetChildren()) do
        if child:IsA("Frame") then
            TweenService:Create(child, TWEEN_INFO.Fast, {BackgroundTransparency = 1}):Play()
            for _, desc in ipairs(child:GetDescendants()) do
                if desc:IsA("TextLabel") or desc:IsA("TextButton") or desc:IsA("TextBox") then
                    TweenService:Create(desc, TWEEN_INFO.Fast, {TextTransparency = 1}):Play()
                elseif desc:IsA("ImageLabel") then
                    TweenService:Create(desc, TWEEN_INFO.Fast, {ImageTransparency = 1}):Play()
                end
            end
        end
    end
    
    -- Clear content after fade out
    wait(0.2)
    self.ContentScrollingFrame:ClearAllChildren()
    
    -- Update titlebar with smooth transition
    TweenService:Create(self.TitleLabel, TWEEN_INFO.Normal, {TextTransparency = 1}):Play()
    TweenService:Create(self.SubtitleLabel, TWEEN_INFO.Normal, {TextTransparency = 1}):Play()
    
    wait(0.1)
    
    self.TitleLabel.Text = page.Name
    self.SubtitleLabel.Text = "NazuX Hub - " .. page.Name
    
    TweenService:Create(self.TitleLabel, TWEEN_INFO.Normal, {TextTransparency = 0}):Play()
    TweenService:Create(self.SubtitleLabel, TWEEN_INFO.Normal, {TextTransparency = 0}):Play()
    
    -- Render tabs if available
    if #page.Tabs > 0 then
        self:RenderTabs(page)
    end
    
    -- Render sections with staggered animations
    local sectionsToRender = page.Sections
    if page.SelectedTab then
        sectionsToRender = page.SelectedTab.Sections
    end
    
    for i, section in ipairs(sectionsToRender) do
        self:RenderSection(section, i * 0.1)
    end
    
    self.CurrentPage = pageName
end

function NazuXHub:RenderTabs(page)
    local tabsContainer = Instance.new("Frame")
    tabsContainer.Name = "TabsContainer"
    tabsContainer.Size = UDim2.new(1, 0, 0, 48)
    tabsContainer.BackgroundTransparency = 1
    tabsContainer.LayoutOrder = 0
    tabsContainer.BackgroundTransparency = 1
    
    local tabsLayout = Instance.new("UIListLayout")
    tabsLayout.FillDirection = Enum.FillDirection.Horizontal
    tabsLayout.Padding = UDim.new(0, 8)
    tabsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    tabsLayout.Parent = tabsContainer
    
    for i, tab in ipairs(page.Tabs) do
        local tabButton = Instance.new("TextButton")
        tabButton.Name = tab.Name .. "Tab"
        tabButton.Size = UDim2.new(0, 120, 0, 36)
        tabButton.BackgroundColor3 = page.SelectedTab == tab and COLORS.TabActive or COLORS.TabInactive
        tabButton.AutoButtonColor = false
        tabButton.Text = tab.Name
        tabButton.TextColor3 = COLORS.TextPrimary
        tabButton.TextSize = 14
        tabButton.Font = FONTS.Body
        tabButton.TextTransparency = 1
        
        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 6)
        tabCorner.Parent = tabButton
        
        -- Tab hover effects
        tabButton.MouseEnter:Connect(function()
            if page.SelectedTab ~= tab then
                TweenService:Create(tabButton, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.TabHover}):Play()
            end
        end)
        
        tabButton.MouseLeave:Connect(function()
            if page.SelectedTab ~= tab then
                TweenService:Create(tabButton, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.TabInactive}):Play()
            end
        end)
        
        tabButton.MouseButton1Click:Connect(function()
            page.SelectedTab = tab
            self:ShowPage(page.Name)
        end)
        
        tabButton.Parent = tabsContainer
        
        -- Tab entrance animation
        delay(i * 0.05, function()
            TweenService:Create(tabButton, TWEEN_INFO.Smooth, {TextTransparency = 0}):Play()
        end)
    end
    
    tabsContainer.Parent = self.ContentScrollingFrame
    
    -- Entrance animation
    TweenService:Create(tabsContainer, TWEEN_INFO.Smooth, {BackgroundTransparency = 0}):Play()
end

function NazuXHub:RenderSection(section, delayTime)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Name = section.Title .. "Section"
    sectionFrame.Size = UDim2.new(1, 0, 0, 0)
    sectionFrame.BackgroundColor3 = COLORS.CardBackground
    sectionFrame.BorderSizePixel = 0
    sectionFrame.AutomaticSize = Enum.AutomaticSize.Y
    sectionFrame.BackgroundTransparency = 1
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 8)
    sectionCorner.Parent = sectionFrame
    
    local sectionPadding = Instance.new("UIPadding")
    sectionPadding.PaddingLeft = UDim.new(0, 20)
    sectionPadding.PaddingRight = UDim.new(0, 20)
    sectionPadding.PaddingTop = UDim.new(0, 20)
    sectionPadding.PaddingBottom = UDim.new(0, 20)
    sectionPadding.Parent = sectionFrame
    
    local sectionLayout = Instance.new("UIListLayout")
    sectionLayout.Padding = UDim.new(0, 15)
    sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sectionLayout.Parent = sectionFrame
    
    -- Section header
    if section.Title then
        local headerLabel = Instance.new("TextLabel")
        headerLabel.Name = "Header"
        headerLabel.Size = UDim2.new(1, 0, 0, 24)
        headerLabel.BackgroundTransparency = 1
        headerLabel.Text = section.Title
        headerLabel.TextColor3 = COLORS.TextPrimary
        headerLabel.TextSize = 18
        headerLabel.Font = FONTS.Header
        headerLabel.TextXAlignment = Enum.TextXAlignment.Left
        headerLabel.LayoutOrder = 1
        headerLabel.TextTransparency = 1
        headerLabel.Parent = sectionFrame
        
        if section.Description then
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Description"
            descLabel.Size = UDim2.new(1, 0, 0, 18)
            descLabel.BackgroundTransparency = 1
            descLabel.Text = section.Description
            descLabel.TextColor3 = COLORS.TextSecondary
            descLabel.TextSize = 14
            descLabel.Font = FONTS.Body
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.TextWrapped = true
            descLabel.LayoutOrder = 2
            descLabel.TextTransparency = 1
            descLabel.Parent = sectionFrame
        end
    end
    
    -- Add controls
    if section.Controls then
        for i, control in ipairs(section.Controls) do
            self:RenderControl(control, sectionFrame, i * 0.05)
        end
    end
    
    sectionFrame.Parent = self.ContentScrollingFrame
    
    -- Entrance animation
    delay(delayTime or 0, function()
        TweenService:Create(sectionFrame, TWEEN_INFO.Smooth, {BackgroundTransparency = 0}):Play()
        
        for _, desc in ipairs(sectionFrame:GetDescendants()) do
            if desc:IsA("TextLabel") and desc.TextTransparency == 1 then
                TweenService:Create(desc, TWEEN_INFO.Smooth, {TextTransparency = 0}):Play()
            end
        end
    end)
end

function NazuXHub:RenderControl(control, parent, delayTime)
    if control.Type == "Separator" then
        self:CreateSeparator(parent, delayTime)
        return
    end
    
    local controlFrame = Instance.new("Frame")
    controlFrame.Name = control.Name .. "Control"
    controlFrame.Size = UDim2.new(1, 0, 0, 0)
    controlFrame.BackgroundTransparency = 1
    controlFrame.AutomaticSize = Enum.AutomaticSize.Y
    controlFrame.LayoutOrder = control.LayoutOrder or 10
    controlFrame.BackgroundTransparency = 1
    
    local controlLayout = Instance.new("UIListLayout")
    controlLayout.Padding = UDim.new(0, 8)
    controlLayout.SortOrder = Enum.SortOrder.LayoutOrder
    controlLayout.Parent = controlFrame
    
    -- Control header
    local headerFrame = Instance.new("Frame")
    headerFrame.Name = "Header"
    headerFrame.Size = UDim2.new(1, 0, 0, 0)
    headerFrame.BackgroundTransparency = 1
    headerFrame.AutomaticSize = Enum.AutomaticSize.Y
    headerFrame.LayoutOrder = 1
    headerFrame.BackgroundTransparency = 1
    
    local headerLayout = Instance.new("UIListLayout")
    headerLayout.Padding = UDim.new(0, 4)
    headerLayout.SortOrder = Enum.SortOrder.LayoutOrder
    headerLayout.Parent = headerFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = control.Title
    titleLabel.TextColor3 = COLORS.TextPrimary
    titleLabel.TextSize = 14
    titleLabel.Font = FONTS.Body
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.LayoutOrder = 1
    titleLabel.TextTransparency = 1
    titleLabel.Parent = headerFrame
    
    if control.Description then
        local descLabel = Instance.new("TextLabel")
        descLabel.Name = "Description"
        descLabel.Size = UDim2.new(1, 0, 0, 0)
        descLabel.BackgroundTransparency = 1
        descLabel.Text = control.Description
        descLabel.TextColor3 = COLORS.TextSecondary
        descLabel.TextSize = 12
        descLabel.Font = FONTS.Caption
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        descLabel.TextWrapped = true
        descLabel.AutomaticSize = Enum.AutomaticSize.Y
        descLabel.LayoutOrder = 2
        descLabel.TextTransparency = 1
        descLabel.Parent = headerFrame
    end
    
    headerFrame.Parent = controlFrame
    
    -- Control element
    local elementFrame = Instance.new("Frame")
    elementFrame.Name = "Element"
    elementFrame.Size = UDim2.new(1, 0, 0, 0)
    elementFrame.BackgroundTransparency = 1
    elementFrame.AutomaticSize = Enum.AutomaticSize.Y
    elementFrame.LayoutOrder = 2
    elementFrame.BackgroundTransparency = 1
    
    if control.Type == "Button" then
        self:CreateButtonControl(control, elementFrame)
    elseif control.Type == "Toggle" then
        self:CreateToggleControl(control, elementFrame)
    elseif control.Type == "Slider" then
        self:CreateSliderControl(control, elementFrame)
    elseif control.Type == "Dropdown" then
        self:CreateDropdownControl(control, elementFrame)
    elseif control.Type == "Textbox" then
        self:CreateTextboxControl(control, elementFrame)
    elseif control.Type == "Label" then
        self:CreateLabelControl(control, elementFrame)
    elseif control.Type == "Keybind" then
        self:CreateKeybindControl(control, elementFrame)
    elseif control.Type == "ColorPicker" then
        self:CreateColorPickerControl(control, elementFrame)
    end
    
    elementFrame.Parent = controlFrame
    controlFrame.Parent = parent
    
    -- Staggered entrance animation
    delay(delayTime or 0, function()
        TweenService:Create(controlFrame, TWEEN_INFO.Smooth, {BackgroundTransparency = 0}):Play()
        TweenService:Create(headerFrame, TWEEN_INFO.Smooth, {BackgroundTransparency = 0}):Play()
        TweenService:Create(elementFrame, TWEEN_INFO.Smooth, {BackgroundTransparency = 0}):Play()
        
        for _, desc in ipairs(controlFrame:GetDescendants()) do
            if desc:IsA("TextLabel") and desc.TextTransparency == 1 then
                TweenService:Create(desc, TWEEN_INFO.Smooth, {TextTransparency = 0}):Play()
            end
        end
    end)
end

function NazuXHub:CreateSeparator(parent, delayTime)
    local separator = Instance.new("Frame")
    separator.Name = "Separator"
    separator.Size = UDim2.new(1, 0, 0, 1)
    separator.BackgroundColor3 = COLORS.Border
    separator.BorderSizePixel = 0
    separator.BackgroundTransparency = 1
    separator.LayoutOrder = 10
    
    separator.Parent = parent
    
    delay(delayTime or 0, function()
        TweenService:Create(separator, TWEEN_INFO.Smooth, {BackgroundTransparency = 0}):Play()
    end)
end

-- WINDOW CONTROLS
function NazuXHub:Minimize()
    TweenService:Create(self.MainFrame, TWEEN_INFO.Smooth, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
end

function NazuXHub:ToggleMaximize()
    if self.MainFrame.Size == UDim2.new(1, 0, 1, 0) then
        -- Restore to default size
        self.MainFrame.Size = UDim2.new(0, 1000, 0, 650)
        self.MainFrame.Position = UDim2.new(0.5, -500, 0.5, -325)
    else
        -- Maximize to full screen
        self.MainFrame.Size = UDim2.new(1, 0, 1, 0)
        self.MainFrame.Position = UDim2.new(0, 0, 0, 0)
    end
end

function NazuXHub:Close()
    TweenService:Create(self.MainFrame, TWEEN_INFO.Smooth, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    
    wait(0.3)
    self:Destroy()
end

function NazuXHub:Destroy()
    if self.ClickOutsideConnection then
        self.ClickOutsideConnection:Disconnect()
    end
    self.MainFrame:Destroy()
end

-- CONTROL CREATION METHODS (giữ nguyên từ code trước)
function NazuXHub:CreateButtonControl(control, parent)
    -- Implementation giống code trước
end

function NazuXHub:CreateToggleControl(control, parent)
    -- Implementation giống code trước
end

function NazuXHub:CreateSliderControl(control, parent)
    -- Implementation giống code trước
end

function NazuXHub:CreateDropdownControl(control, parent)
    -- Implementation giống code trước
end

function NazuXHub:CreateTextboxControl(control, parent)
    -- Implementation giống code trước
end

function NazuXHub:CreateLabelControl(control, parent)
    -- Implementation giống code trước
end

function NazuXHub:CreateKeybindControl(control, parent)
    -- Implementation cho keybind
end

function NazuXHub:CreateColorPickerControl(control, parent)
    -- Implementation cho color picker
end

-- Search functionality
function NazuXHub:SetupSearch()
    self.SearchTextBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = self.SearchTextBox.Text:lower()
        if searchText == "" then
            -- Show all controls
            return
        end
        
        -- Filter controls based on search text
        self:FilterControls(searchText)
    end)
end

function NazuXHub:FilterControls(searchText)
    -- Implementation for search filtering
end

return NazuXHub
