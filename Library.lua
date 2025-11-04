-- NazuXHub.lua
-- Complete Windows 11 UI Library with Smooth Animations
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
    DropdownPressed = Color3.fromRGB(75, 75, 75)
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

function NazuXHub.new(parentFrame)
    local self = setmetatable({}, NazuXHub)
    
    self.Parent = parentFrame
    self.Pages = {}
    self.Tabs = {}
    self.CurrentPage = nil
    self.CurrentTab = nil
    self.ActiveDropdowns = {}
    
    self:CreateMainContainer()
    self:CreateNavigationPane()
    self:CreateContentArea()
    self:CreateHeader()
    
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
    self.MainFrame.Parent = self.Parent
    
    -- Mica effect with animation
    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 90
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, COLORS.MicaBackground),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
    })
    gradient.Parent = self.MainFrame
    
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

function NazuXHub:CreateHeader()
    self.HeaderFrame = Instance.new("Frame")
    self.HeaderFrame.Name = "Header"
    self.HeaderFrame.Size = UDim2.new(1, 0, 0, 60)
    self.HeaderFrame.Position = UDim2.new(0, 0, 0, 0)
    self.HeaderFrame.BackgroundTransparency = 1
    self.HeaderFrame.Parent = self.MainFrame
    
    -- NazuX Hub Logo with fade-in animation
    local logoLabel = Instance.new("TextLabel")
    logoLabel.Name = "Logo"
    logoLabel.Size = UDim2.new(0, 120, 0, 32)
    logoLabel.Position = UDim2.new(0, 20, 0.5, -16)
    logoLabel.BackgroundTransparency = 1
    logoLabel.Text = "NazuX Hub"
    logoLabel.TextColor3 = COLORS.Primary
    logoLabel.TextSize = 18
    logoLabel.Font = FONTS.Title
    logoLabel.TextXAlignment = Enum.TextXAlignment.Left
    logoLabel.TextTransparency = 1
    logoLabel.Parent = self.HeaderFrame
    
    TweenService:Create(logoLabel, TWEEN_INFO.Smooth, {TextTransparency = 0}):Play()
    
    -- Page Title with slide animation
    self.HeaderTitle = Instance.new("TextLabel")
    self.HeaderTitle.Name = "Title"
    self.HeaderTitle.Size = UDim2.new(0.5, 0, 1, 0)
    self.HeaderTitle.Position = UDim2.new(0.2, -20, 0, 0)
    self.HeaderTitle.BackgroundTransparency = 1
    self.HeaderTitle.Text = "NazuX Hub"
    self.HeaderTitle.TextColor3 = COLORS.TextPrimary
    self.HeaderTitle.TextSize = 20
    self.HeaderTitle.Font = FONTS.Header
    self.HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
    self.HeaderTitle.TextTransparency = 1
    self.HeaderTitle.Parent = self.HeaderFrame
    
    local titleTween = TweenService:Create(
        self.HeaderTitle,
        TWEEN_INFO.Smooth,
        {TextTransparency = 0, Position = UDim2.new(0.2, 0, 0, 0)}
    )
    titleTween:Play()
end

function NazuXHub:CreateNavigationPane()
    self.NavFrame = Instance.new("Frame")
    self.NavFrame.Name = "NavigationPane"
    self.NavFrame.Size = UDim2.new(0, 280, 1, -60)
    self.NavFrame.Position = UDim2.new(-0.3, 0, 0, 60)
    self.NavFrame.BackgroundColor3 = COLORS.SectionBackground
    self.NavFrame.BorderSizePixel = 0
    self.NavFrame.Parent = self.MainFrame
    
    -- Slide in animation
    TweenService:Create(
        self.NavFrame,
        TWEEN_INFO.Smooth,
        {Position = UDim2.new(0, 0, 0, 60)}
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
    self.ContentFrame.Size = UDim2.new(1, -280, 1, -60)
    self.ContentFrame.Position = UDim2.new(1, 0, 0, 60)
    self.ContentFrame.BackgroundColor3 = COLORS.Background
    self.ContentFrame.BorderSizePixel = 0
    self.ContentFrame.Parent = self.MainFrame
    
    -- Slide in animation
    TweenService:Create(
        self.ContentFrame,
        TWEEN_INFO.Smooth,
        {Position = UDim2.new(0, 280, 0, 60)}
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
        Tabs = {}
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
    
    -- Update header with smooth transition
    TweenService:Create(self.HeaderTitle, TWEEN_INFO.Normal, {TextTransparency = 1}):Play()
    wait(0.1)
    self.HeaderTitle.Text = page.Name
    TweenService:Create(self.HeaderTitle, TWEEN_INFO.Normal, {TextTransparency = 0}):Play()
    
    -- Render sections with staggered animations
    local sectionsToRender = page.Sections
    if page.SelectedTab then
        sectionsToRender = page.SelectedTab.Sections
    end
    
    for i, section in ipairs(sectionsToRender) do
        self:RenderSection(section, i * 0.1)
    end
    
    -- Render tabs if available
    if #page.Tabs > 0 then
        self:RenderTabs(page, #sectionsToRender * 0.1 + 0.1)
    end
    
    self.CurrentPage = pageName
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

function NazuXHub:CreateButtonControl(control, parent)
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Size = UDim2.new(0, control.Width or 120, 0, 32)
    button.BackgroundColor3 = COLORS.Primary
    button.AutoButtonColor = false
    button.Text = control.Text
    button.TextColor3 = COLORS.TextPrimary
    button.TextSize = 14
    button.Font = FONTS.Body
    button.TextTransparency = 1
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    -- Hover effects with animations
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.PrimaryLight}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.Primary}):Play()
    end)
    
    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.PrimaryDark}):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.PrimaryLight}):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        -- Ripple effect
        local ripple = Instance.new("Frame")
        ripple.Name = "Ripple"
        ripple.Size = UDim2.new(0, 0, 0, 0)
        ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
        ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        ripple.BackgroundColor3 = Color3.new(1, 1, 1)
        ripple.BackgroundTransparency = 0.8
        ripple.BorderSizePixel = 0
        ripple.Parent = button
        
        local rippleCorner = Instance.new("UICorner")
        rippleCorner.CornerRadius = UDim.new(1, 0)
        rippleCorner.Parent = ripple
        
        TweenService:Create(ripple, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(2, 0, 2, 0),
            BackgroundTransparency = 1
        }):Play()
        
        delay(0.6, function()
            ripple:Destroy()
        end)
        
        if control.Callback then
            control.Callback()
        end
    end)
    
    TweenService:Create(button, TWEEN_INFO.Smooth, {TextTransparency = 0}):Play()
    button.Parent = parent
end

function NazuXHub:CreateToggleControl(control, parent)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = "ToggleFrame"
    toggleFrame.Size = UDim2.new(1, 0, 0, 24)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = parent
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "Toggle"
    toggleButton.Size = UDim2.new(0, 40, 0, 20)
    toggleButton.Position = UDim2.new(1, -40, 0, 0)
    toggleButton.BackgroundColor3 = control.Value and COLORS.ToggleOn or COLORS.ToggleOff
    toggleButton.AutoButtonColor = false
    toggleButton.Text = ""
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleButton
    
    local toggleThumb = Instance.new("Frame")
    toggleThumb.Name = "Thumb"
    toggleThumb.Size = UDim2.new(0, 16, 0, 16)
    toggleThumb.Position = UDim2.new(0, control.Value and 20 or 2, 0, 2)
    toggleThumb.BackgroundColor3 = COLORS.TextPrimary
    toggleThumb.BorderSizePixel = 0
    
    local thumbCorner = Instance.new("UICorner")
    thumbCorner.CornerRadius = UDim.new(1, 0)
    thumbCorner.Parent = toggleThumb
    
    toggleThumb.Parent = toggleButton
    
    toggleButton.MouseButton1Click:Connect(function()
        control.Value = not control.Value
        
        local thumbTween = TweenService:Create(
            toggleThumb,
            TWEEN_INFO.Normal,
            {Position = UDim2.new(0, control.Value and 20 or 2, 0, 2)}
        )
        thumbTween:Play()
        
        local colorTween = TweenService:Create(
            toggleButton,
            TWEEN_INFO.Normal,
            {BackgroundColor3 = control.Value and COLORS.ToggleOn or COLORS.ToggleOff}
        )
        colorTween:Play()
        
        if control.Callback then
            control.Callback(control.Value)
        end
    end)
    
    toggleButton.Parent = toggleFrame
end

function NazuXHub:CreateSliderControl(control, parent)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = "SliderFrame"
    sliderFrame.Size = UDim2.new(1, 0, 0, 40)
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.Parent = parent
    
    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Size = UDim2.new(1, -60, 0, 4)
    track.Position = UDim2.new(0, 0, 0.5, -2)
    track.BackgroundColor3 = COLORS.SliderTrack
    track.BorderSizePixel = 0
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new((control.Value - control.Min) / (control.Max - control.Min), 0, 1, 0)
    fill.BackgroundColor3 = COLORS.Primary
    fill.BorderSizePixel = 0
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    fill.Parent = track
    
    local thumb = Instance.new("TextButton")
    thumb.Name = "Thumb"
    thumb.Size = UDim2.new(0, 16, 0, 16)
    thumb.Position = UDim2.new((control.Value - control.Min) / (control.Max - control.Min), -8, 0.5, -8)
    thumb.BackgroundColor3 = COLORS.SliderThumb
    thumb.AutoButtonColor = false
    thumb.Text = ""
    thumb.ZIndex = 2
    
    local thumbCorner = Instance.new("UICorner")
    thumbCorner.CornerRadius = UDim.new(1, 0)
    thumbCorner.Parent = thumb
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Position = UDim2.new(1, 10, 0.5, -10)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(control.Value)
    valueLabel.TextColor3 = COLORS.TextSecondary
    valueLabel.TextSize = 12
    valueLabel.Font = FONTS.Body
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = sliderFrame
    
    -- Dragging logic with smooth animations
    local function updateSlider(input)
        local relativeX = (input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X
        local value = math.clamp(relativeX * (control.Max - control.Min) + control.Min, control.Min, control.Max)
        
        if control.Step then
            value = math.floor(value / control.Step + 0.5) * control.Step
        end
        
        control.Value = value
        
        TweenService:Create(fill, TWEEN_INFO.Fast, {
            Size = UDim2.new((value - control.Min) / (control.Max - control.Min), 0, 1, 0)
        }):Play()
        
        TweenService:Create(thumb, TWEEN_INFO.Fast, {
            Position = UDim2.new((value - control.Min) / (control.Max - control.Min), -8, 0.5, -8)
        }):Play()
        
        valueLabel.Text = tostring(value)
        
        if control.Callback then
            control.Callback(value)
        end
    end
    
    thumb.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            TweenService:Create(thumb, TWEEN_INFO.Fast, {Size = UDim2.new(0, 18, 0, 18)}):Play()
            
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    TweenService:Create(thumb, TWEEN_INFO.Fast, {Size = UDim2.new(0, 16, 0, 16)}):Play()
                    connection:Disconnect()
                else
                    updateSlider(input)
                end
            end)
        end
    end)
    
    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            updateSlider(input)
        end
    end)
    
    track.Parent = sliderFrame
    thumb.Parent = sliderFrame
end

function NazuXHub:CreateDropdownControl(control, parent)
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Name = "DropdownFrame"
    dropdownFrame.Size = UDim2.new(0, 200, 0, 32)
    dropdownFrame.BackgroundTransparency = 1
    dropdownFrame.Parent = parent
    
    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Name = "DropdownButton"
    dropdownButton.Size = UDim2.new(1, 0, 0, 32)
    dropdownButton.BackgroundColor3 = COLORS.DropdownBackground
    dropdownButton.AutoButtonColor = false
    dropdownButton.Text = ""
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 6)
    dropdownCorner.Parent = dropdownButton
    
    local selectedLabel = Instance.new("TextLabel")
    selectedLabel.Name = "Selected"
    selectedLabel.Size = UDim2.new(1, -30, 1, 0)
    selectedLabel.Position = UDim2.new(0, 10, 0, 0)
    selectedLabel.BackgroundTransparency = 1
    selectedLabel.Text = control.Options[control.SelectedIndex or 1]
    selectedLabel.TextColor3 = COLORS.TextPrimary
    selectedLabel.TextSize = 14
    selectedLabel.Font = FONTS.Body
    selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
    selectedLabel.Parent = dropdownButton
    
    local arrowIcon = Instance.new("ImageLabel")
    arrowIcon.Name = "Arrow"
    arrowIcon.Size = UDim2.new(0, 16, 0, 16)
    arrowIcon.Position = UDim2.new(1, -20, 0.5, -8)
    arrowIcon.BackgroundTransparency = 1
    arrowIcon.Image = "rbxasset://textures/ui/LuaChat/icons/ic-chevron-down.png"
    arrowIcon.ImageColor3 = COLORS.TextSecondary
    arrowIcon.Parent = dropdownButton
    
    -- Dropdown list
    local dropdownList = Instance.new("Frame")
    dropdownList.Name = "DropdownList"
    dropdownList.Size = UDim2.new(1, 0, 0, 0)
    dropdownList.Position = UDim2.new(0, 0, 1, 5)
    dropdownList.BackgroundColor3 = COLORS.DropdownBackground
    dropdownList.BorderSizePixel = 0
    dropdownList.Visible = false
    dropdownList.ClipsDescendants = true
    
    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 6)
    listCorner.Parent = dropdownList
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 1)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = dropdownList
    
    -- Create option buttons
    for i, option in ipairs(control.Options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Name = "Option_" .. i
        optionButton.Size = UDim2.new(1, 0, 0, 32)
        optionButton.BackgroundColor3 = COLORS.DropdownBackground
        optionButton.AutoButtonColor = false
        optionButton.Text = option
        optionButton.TextColor3 = COLORS.TextPrimary
        optionButton.TextSize = 14
        optionButton.Font = FONTS.Body
        optionButton.LayoutOrder = i
        
        optionButton.MouseEnter:Connect(function()
            if optionButton.BackgroundColor3 ~= COLORS.Primary then
                TweenService:Create(optionButton, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.DropdownHover}):Play()
            end
        end)
        
        optionButton.MouseLeave:Connect(function()
            if optionButton.BackgroundColor3 ~= COLORS.Primary then
                TweenService:Create(optionButton, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.DropdownBackground}):Play()
            end
        end)
        
        optionButton.MouseButton1Click:Connect(function()
            control.SelectedIndex = i
            selectedLabel.Text = option
            
            TweenService:Create(optionButton, TWEEN_INFO.Fast, {BackgroundColor3 = COLORS.Primary}):Play()
            
            if control.Callback then
                control.Callback(option, i)
            end
            
            self:CloseDropdown(dropdownList)
        end)
        
        optionButton.Parent = dropdownList
    end
    
    dropdownList.Parent = dropdownButton
    
    -- Toggle dropdown
    dropdownButton.MouseButton1Click:Connect(function()
        if dropdownList.Visible then
            self:CloseDropdown(dropdownList)
        else
            self:CloseAllDropdowns()
            self:OpenDropdown(dropdownList, #control.Options)
        end
    end)
    
    dropdownButton.Parent = dropdownFrame
    table.insert(self.ActiveDropdowns, dropdownList)
end

function NazuXHub:OpenDropdown(dropdownList, optionCount)
    dropdownList.Visible = true
    dropdownList.Size = UDim2.new(1, 0, 0, 0)
    
    local targetSize = math.min(optionCount * 33, 165) -- Max height with scroll
    TweenService:Create(dropdownList, TWEEN_INFO.Smooth, {Size = UDim2.new(1, 0, 0, targetSize)}):Play()
end

function NazuXHub:CloseDropdown(dropdownList)
    TweenService:Create(dropdownList, TWEEN_INFO.Smooth, {Size = UDim2.new(1, 0, 0, 0)}):Play()
    delay(0.3, function()
        dropdownList.Visible = false
    end)
end

function NazuXHub:CloseAllDropdowns()
    for _, dropdown in ipairs(self.ActiveDropdowns) do
        if dropdown.Visible then
            self:CloseDropdown(dropdown)
        end
    end
end

function NazuXHub:CreateTextboxControl(control, parent)
    local textbox = Instance.new("TextBox")
    textbox.Name = "Textbox"
    textbox.Size = UDim2.new(0, 200, 0, 32)
    textbox.BackgroundColor3 = COLORS.CardBackground
    textbox.BorderSizePixel = 0
    textbox.Text = control.Value or ""
    textbox.PlaceholderText = control.Placeholder or ""
    textbox.TextColor3 = COLORS.TextPrimary
    textbox.PlaceholderColor3 = COLORS.TextDisabled
    textbox.TextSize = 14
    textbox.Font = FONTS.Body
    textbox.ClearTextOnFocus = false
    
    local textboxCorner = Instance.new("UICorner")
    textboxCorner.CornerRadius = UDim.new(0, 6)
    textboxCorner.Parent = textbox
    
    local textboxPadding = Instance.new("UIPadding")
    textboxPadding.PaddingLeft = UDim.new(0, 10)
    textboxPadding.PaddingRight = UDim.new(0, 10)
    textboxPadding.Parent = textbox
    
    -- Focus animations
    textbox.Focused:Connect(function()
        TweenService:Create(textbox, TWEEN_INFO.Fast, {
            BackgroundColor3 = COLORS.Hover,
            Size = UDim2.new(0, 220, 0, 32)
        }):Play()
    end)
    
    textbox.FocusLost:Connect(function(enterPressed)
        TweenService:Create(textbox, TWEEN_INFO.Fast, {
            BackgroundColor3 = COLORS.CardBackground,
            Size = UDim2.new(0, 200, 0, 32)
        }):Play()
        
        control.Value = textbox.Text
        if control.Callback then
            control.Callback(textbox.Text, enterPressed)
        end
    end)
    
    textbox.Parent = parent
end

function NazuXHub:CreateLabelControl(control, parent)
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.Text = control.Text
    label.TextColor3 = control.Color or COLORS.TextPrimary
    label.TextSize = control.TextSize or 14
    label.Font = FONTS.Body
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.AutomaticSize = Enum.AutomaticSize.Y
    label.Parent = parent
end

function NazuXHub:RenderTabs(page, delayTime)
    if #page.Tabs == 0 then return end
    
    local tabsContainer = Instance.new("Frame")
    tabsContainer.Name = "TabsContainer"
    tabsContainer.Size = UDim2.new(1, 0, 0, 40)
    tabsContainer.BackgroundTransparency = 1
    tabsContainer.LayoutOrder = 0
    
    local tabsLayout = Instance.new("UIListLayout")
    tabsLayout.FillDirection = Enum.FillDirection.Horizontal
    tabsLayout.Padding = UDim.new(0, 8)
    tabsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    tabsLayout.Parent = tabsContainer
    
    for i, tab in ipairs(page.Tabs) do
        local tabButton = Instance.new("TextButton")
        tabButton.Name = tab.Name .. "Tab"
        tabButton.Size = UDim2.new(0, 120, 0, 32)
        tabButton.BackgroundColor3 = page.SelectedTab == tab and COLORS.Primary or COLORS.CardBackground
        tabButton.AutoButtonColor = false
        tabButton.Text = tab.Name
        tabButton.TextColor3 = COLORS.TextPrimary
        tabButton.TextSize = 14
        tabButton.Font = FONTS.Body
        
        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 6)
        tabCorner.Parent = tabButton
        
        tabButton.MouseButton1Click:Connect(function()
            page.SelectedTab = tab
            self:ShowPage(page.Name)
        end)
        
        tabButton.Parent = tabsContainer
    end
    
    tabsContainer.Parent = self.ContentScrollingFrame
    
    -- Entrance animation
    delay(delayTime or 0, function()
        TweenService:Create(tabsContainer, TWEEN_INFO.Smooth, {BackgroundTransparency = 0}):Play()
    end)
end

-- Example usage method
function NazuXHub:CreateExampleHub()
    -- Home Page
    local homePage = self:AddPage("Home", "rbxasset://textures/ui/LuaChat/icons/ic-home.png")
    
    local homeSection = {
        Title = "Welcome to NazuX Hub",
        Description = "Experience the ultimate Windows 11 style UI library"
    }
    
    self:AddButton(homeSection, {
        Name = "WelcomeButton",
        Title = "Get Started",
        Text = "Click Me!",
        Callback = function()
            print("Welcome to NazuX Hub!")
        end
    })
    
    self:AddSection("Home", homeSection)
    
    -- Settings Page
    local settingsPage = self:AddPage("Settings", "rbxasset://textures/ui/LuaChat/icons/ic-settings.png")
    
    -- Graphics Section
    local graphicsSection = {
        Title = "Graphics Settings",
        Description = "Adjust visual quality and performance"
    }
    
    self:AddToggle(graphicsSection, {
        Name = "HighQuality",
        Title = "High Quality Mode",
        Description = "Enable for better graphics (may affect performance)",
        Value = true,
        Callback = function(value)
            print("High Quality:", value)
        end
    })
    
    self:AddSlider(graphicsSection, {
        Name = "RenderDistance",
        Title = "Render Distance",
        Description = "How far you can see objects",
        Value = 100,
        Min = 10,
        Max = 500,
        Callback = function(value)
            print("Render Distance:", value)
        end
    })
    
    self:AddSection("Settings", graphicsSection)
    
    -- Audio Section
    local audioSection = {
        Title = "Audio Settings"
    }
    
    self:AddSlider(audioSection, {
        Name = "MasterVolume",
        Title = "Master Volume",
        Value = 80,
        Min = 0,
        Max = 100,
        Callback = function(value)
            print("Volume:", value)
        end
    })
    
    self:AddDropdown(audioSection, {
        Name = "AudioDevice",
        Title = "Audio Device",
        Options = {"Headphones", "Speakers", "Monitor", "Virtual"},
        SelectedIndex = 1,
        Callback = function(option, index)
            print("Audio Device:", option)
        end
    })
    
    self:AddSection("Settings", audioSection)
    
    -- Controls Page with Tabs
    local controlsPage = self:AddPage("Controls", "rbxasset://textures/ui/LuaChat/icons/ic-game.png")
    
    self:AddTab("Controls", "Basic")
    self:AddTab("Controls", "Advanced")
    
    -- Basic Controls
    local basicSection = {
        Title = "Basic Controls"
    }
    
    self:AddTextbox(basicSection, {
        Name = "PlayerName",
        Title = "Player Name",
        Placeholder = "Enter your name...",
        Callback = function(text)
            print("Player Name:", text)
        end
    })
    
    self:AddButton(basicSection, {
        Name = "ResetSettings",
        Title = "Reset to Default",
        Text = "Reset",
        Callback = function()
            print("Settings reset!")
        end
    })
    
    self:AddSection("Controls", basicSection, "Basic")
    
    -- Advanced Controls
    local advancedSection = {
        Title = "Advanced Settings"
    }
    
    self:AddLabel(advancedSection, {
        Name = "WarningLabel",
        Text = "⚠️ These settings are for advanced users only!",
        Color = COLORS.Warning,
        TextSize = 12
    })
    
    self:AddDropdown(advancedSection, {
        Name = "Theme",
        Title = "UI Theme",
        Options = {"Dark", "Light", "Auto", "Custom"},
        SelectedIndex = 1,
        Callback = function(option, index)
            print("Theme:", option)
        end
    })
    
    self:AddSection("Controls", advancedSection, "Advanced")
end

-- Cleanup method
function NazuXHub:Destroy()
    if self.ClickOutsideConnection then
        self.ClickOutsideConnection:Disconnect()
    end
    self.MainFrame:Destroy()
end

return NazuXHub
