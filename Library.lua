-- NazuX UI Library - Transparent Theme - No Round Corners
-- Created for Roblox Lua

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Colors (Transparent Theme)
local COLORS = {
    Background = Color3.new(0, 0, 0),
    Secondary = Color3.new(0.1, 0.1, 0.1),
    Text = Color3.new(1, 1, 1),
    ToggleOff = Color3.new(0.3, 0.3, 0.3),
    ToggleOn = Color3.new(1, 1, 1),
    Hover = Color3.new(0.2, 0.2, 0.2),
    Press = Color3.new(0.4, 0.4, 0.4),
    Accent = Color3.new(0.15, 0.15, 0.15)
}

-- Animation Presets
local TWEEN_INFO = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local TWEEN_INFO_SMOOTH = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

function NazuX:CreateWindow(title, subtitle, size)
    local Window = {}
    
    -- Main Container
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NazuXUI"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = size or UDim2.new(0, 500, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MainFrame.BackgroundColor3 = COLORS.Background
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.BackgroundColor3 = COLORS.Secondary
    TitleBar.BackgroundTransparency = 0.3
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    -- Title and Subtitle
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(0, 200, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title or "NazuX UI"
    TitleLabel.TextColor3 = COLORS.Text
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Font = Enum.Font.GothamSemibold
    TitleLabel.Parent = TitleBar
    
    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Name = "SubtitleLabel"
    SubtitleLabel.Size = UDim2.new(0, 200, 1, 0)
    SubtitleLabel.Position = UDim2.new(0, 10, 0, 20)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Text = subtitle or "Library"
    SubtitleLabel.TextColor3 = COLORS.Text
    TitleLabel.TextTransparency = 0.7
    SubtitleLabel.TextSize = 12
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubtitleLabel.TextTransparency = 0.5
    SubtitleLabel.Font = Enum.Font.Gotham
    SubtitleLabel.Parent = TitleBar
    
    -- Search Bar
    local SearchBox = Instance.new("TextBox")
    SearchBox.Name = "SearchBox"
    SearchBox.Size = UDim2.new(0, 200, 0, 30)
    SearchBox.Position = UDim2.new(0.5, -100, 0, 5)
    SearchBox.BackgroundColor3 = COLORS.Background
    SearchBox.BackgroundTransparency = 0.5
    SearchBox.BorderSizePixel = 0
    SearchBox.Text = "Search..."
    SearchBox.TextColor3 = COLORS.Text
    SearchBox.TextSize = 14
    SearchBox.PlaceholderColor3 = Color3.new(0.7, 0.7, 0.7)
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.Parent = TitleBar
    
    -- Control Buttons
    local ControlContainer = Instance.new("Frame")
    ControlContainer.Name = "ControlContainer"
    ControlContainer.Size = UDim2.new(0, 90, 1, 0)
    ControlContainer.Position = UDim2.new(1, -90, 0, 0)
    ControlContainer.BackgroundTransparency = 1
    ControlContainer.Parent = TitleBar
    
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 30, 1, 0)
    MinimizeButton.Position = UDim2.new(0, 0, 0, 0)
    MinimizeButton.BackgroundTransparency = 1
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = COLORS.Text
    MinimizeButton.TextSize = 18
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = ControlContainer
    
    local MaximizeButton = Instance.new("TextButton")
    MaximizeButton.Name = "MaximizeButton"
    MaximizeButton.Size = UDim2.new(0, 30, 1, 0)
    MaximizeButton.Position = UDim2.new(0, 30, 0, 0)
    MaximizeButton.BackgroundTransparency = 1
    MaximizeButton.Text = "□"
    MaximizeButton.TextColor3 = COLORS.Text
    MaximizeButton.TextSize = 14
    MaximizeButton.Font = Enum.Font.GothamBold
    MaximizeButton.Parent = ControlContainer
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 30, 1, 0)
    CloseButton.Position = UDim2.new(0, 60, 0, 0)
    CloseButton.BackgroundTransparency = 1
    CloseButton.Text = "×"
    CloseButton.TextColor3 = COLORS.Text
    CloseButton.TextSize = 18
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = ControlContainer
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 120, 1, -40)
    TabContainer.Position = UDim2.new(0, 0, 0, 40)
    TabContainer.BackgroundColor3 = COLORS.Secondary
    TabContainer.BackgroundTransparency = 0.3
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = MainFrame
    
    local TabList = Instance.new("ScrollingFrame")
    TabList.Name = "TabList"
    TabList.Size = UDim2.new(1, 0, 1, 0)
    TabList.BackgroundTransparency = 1
    TabList.BorderSizePixel = 0
    TabList.ScrollBarThickness = 0
    TabList.Parent = TabContainer
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = TabList
    
    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -120, 1, -40)
    ContentContainer.Position = UDim2.new(0, 120, 0, 40)
    ContentContainer.BackgroundColor3 = COLORS.Background
    ContentContainer.BackgroundTransparency = 0.2
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Parent = MainFrame
    
    -- Variables
    local Tabs = {}
    local CurrentTab = nil
    local IsMinimized = false
    local IsMaximized = false
    local OriginalSize = MainFrame.Size
    local OriginalPosition = MainFrame.Position
    
    -- Make draggable
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    -- Control Button Functions with Effects
    MinimizeButton.MouseEnter:Connect(function()
        TweenService:Create(MinimizeButton, TWEEN_INFO, {BackgroundColor3 = COLORS.Hover, BackgroundTransparency = 0}):Play()
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        TweenService:Create(MinimizeButton, TWEEN_INFO, {BackgroundTransparency = 1}):Play()
    end)
    
    MinimizeButton.MouseButton1Click:Connect(function()
        TweenService:Create(MinimizeButton, TWEEN_INFO, {BackgroundColor3 = COLORS.Press, BackgroundTransparency = 0}):Play()
        wait(0.1)
        TweenService:Create(MinimizeButton, TWEEN_INFO, {BackgroundTransparency = 1}):Play()
        
        IsMinimized = not IsMinimized
        if IsMinimized then
            TweenService:Create(MainFrame, TWEEN_INFO_SMOOTH, {Size = UDim2.new(0, 500, 0, 40)}):Play()
        else
            TweenService:Create(MainFrame, TWEEN_INFO_SMOOTH, {Size = OriginalSize}):Play()
        end
    end)
    
    MaximizeButton.MouseEnter:Connect(function()
        TweenService:Create(MaximizeButton, TWEEN_INFO, {BackgroundColor3 = COLORS.Hover, BackgroundTransparency = 0}):Play()
    end)
    
    MaximizeButton.MouseLeave:Connect(function()
        TweenService:Create(MaximizeButton, TWEEN_INFO, {BackgroundTransparency = 1}):Play()
    end)
    
    MaximizeButton.MouseButton1Click:Connect(function()
        TweenService:Create(MaximizeButton, TWEEN_INFO, {BackgroundColor3 = COLORS.Press, BackgroundTransparency = 0}):Play()
        wait(0.1)
        TweenService:Create(MaximizeButton, TWEEN_INFO, {BackgroundTransparency = 1}):Play()
        
        IsMaximized = not IsMaximized
        if IsMaximized then
            OriginalSize = MainFrame.Size
            OriginalPosition = MainFrame.Position
            TweenService:Create(MainFrame, TWEEN_INFO_SMOOTH, {
                Size = UDim2.new(1, -20, 1, -20),
                Position = UDim2.new(0, 10, 0, 10)
            }):Play()
        else
            TweenService:Create(MainFrame, TWEEN_INFO_SMOOTH, {
                Size = OriginalSize,
                Position = OriginalPosition
            }):Play()
        end
    end)
    
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TWEEN_INFO, {BackgroundColor3 = Color3.new(1, 0, 0), BackgroundTransparency = 0}):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TWEEN_INFO, {BackgroundTransparency = 1}):Play()
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        TweenService:Create(CloseButton, TWEEN_INFO, {BackgroundColor3 = Color3.new(0.8, 0, 0), BackgroundTransparency = 0}):Play()
        wait(0.1)
        TweenService:Create(MainFrame, TWEEN_INFO_SMOOTH, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        wait(0.2)
        ScreenGui:Destroy()
    end)
    
    -- Show/Hide with LeftControl
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.LeftControl then
            MainFrame.Visible = not MainFrame.Visible
        end
    end)
    
    -- Button hover effects
    local function SetupButtonHover(button)
        local originalTransparency = button.BackgroundTransparency
        
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TWEEN_INFO, {
                BackgroundColor3 = COLORS.Hover,
                BackgroundTransparency = originalTransparency - 0.1
            }):Play()
        end)
        
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TWEEN_INFO, {
                BackgroundColor3 = COLORS.Secondary,
                BackgroundTransparency = originalTransparency
            }):Play()
        end)
        
        button.MouseButton1Down:Connect(function()
            TweenService:Create(button, TWEEN_INFO, {
                BackgroundColor3 = COLORS.Press,
                BackgroundTransparency = originalTransparency - 0.2
            }):Play()
        end)
        
        button.MouseButton1Up:Connect(function()
            TweenService:Create(button, TWEEN_INFO, {
                BackgroundColor3 = COLORS.Hover,
                BackgroundTransparency = originalTransparency - 0.1
            }):Play()
        end)
    end
    
    -- Search box effects
    SearchBox.Focused:Connect(function()
        TweenService:Create(SearchBox, TWEEN_INFO, {
            BackgroundTransparency = 0.3,
            Size = UDim2.new(0, 250, 0, 30)
        }):Play()
        if SearchBox.Text == "Search..." then
            SearchBox.Text = ""
        end
    end)
    
    SearchBox.FocusLost:Connect(function()
        TweenService:Create(SearchBox, TWEEN_INFO, {
            BackgroundTransparency = 0.5,
            Size = UDim2.new(0, 200, 0, 30)
        }):Play()
        if SearchBox.Text == "" then
            SearchBox.Text = "Search..."
        end
    end)
    
    -- Window Methods
    function Window:CreateTab(name)
        local Tab = {}
        
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Size = UDim2.new(1, 0, 0, 40)
        TabButton.BackgroundColor3 = COLORS.Secondary
        TabButton.BackgroundTransparency = 0.3
        TabButton.BorderSizePixel = 0
        TabButton.Text = name
        TabButton.TextColor3 = COLORS.Text
        TabButton.TextSize = 14
        TabButton.Font = Enum.Font.Gotham
        TabButton.Parent = TabList
        
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = "TabContent"
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.ScrollBarThickness = 0
        TabContent.Visible = false
        TabContent.Parent = ContentContainer
        
        local ContentList = Instance.new("UIListLayout")
        ContentList.Padding = UDim.new(0, 5)
        ContentList.Parent = TabContent
        
        -- Tab button effects
        TabButton.MouseEnter:Connect(function()
            if TabButton ~= CurrentTab.Button then
                TweenService:Create(TabButton, TWEEN_INFO, {BackgroundTransparency = 0.2}):Play()
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if TabButton ~= CurrentTab.Button then
                TweenService:Create(TabButton, TWEEN_INFO, {BackgroundTransparency = 0.3}):Play()
            end
        end)
        
        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                TweenService:Create(CurrentTab.Button, TWEEN_INFO, {BackgroundTransparency = 0.3}):Play()
                CurrentTab.Content.Visible = false
            end
            
            CurrentTab = Tab
            TweenService:Create(TabButton, TWEEN_INFO, {BackgroundTransparency = 0}):Play()
            TabContent.Visible = true
            
            -- Auto-select first tab if none selected
            if not Window.FirstTabSelected then
                Window.FirstTabSelected = true
                TweenService:Create(TabButton, TWEEN_INFO, {BackgroundTransparency = 0}):Play()
                TabContent.Visible = true
                CurrentTab = Tab
            end
        end)
        
        Tab.Button = TabButton
        Tab.Content = TabContent
        
        table.insert(Tabs, Tab)
        
        -- Auto-select first tab
        if #Tabs == 1 then
            TweenService:Create(TabButton, TWEEN_INFO, {BackgroundTransparency = 0}):Play()
            TabContent.Visible = true
            CurrentTab = Tab
            Window.FirstTabSelected = true
        end
        
        function Tab:CreateSection(name)
            local Section = {}
            
            local SectionFrame = Instance.new("Frame")
            SectionFrame.Name = "SectionFrame"
            SectionFrame.Size = UDim2.new(1, -20, 0, 40)
            SectionFrame.Position = UDim2.new(0, 10, 0, 0)
            SectionFrame.BackgroundColor3 = COLORS.Secondary
            SectionFrame.BackgroundTransparency = 0.3
            SectionFrame.BorderSizePixel = 0
            SectionFrame.Parent = TabContent
            
            local SectionLabel = Instance.new("TextLabel")
            SectionLabel.Name = "SectionLabel"
            SectionLabel.Size = UDim2.new(1, 0, 1, 0)
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Text = name
            SectionLabel.TextColor3 = COLORS.Text
            SectionLabel.TextSize = 16
            SectionLabel.Font = Enum.Font.GothamSemibold
            SectionLabel.Parent = SectionFrame
            
            function Section:CreateButton(config)
                local Button = {}
                local callback = config.Callback or function() end
                
                local ButtonFrame = Instance.new("TextButton")
                ButtonFrame.Name = "ButtonFrame"
                ButtonFrame.Size = UDim2.new(1, -20, 0, 40)
                ButtonFrame.Position = UDim2.new(0, 10, 0, 0)
                ButtonFrame.BackgroundColor3 = COLORS.Secondary
                ButtonFrame.BackgroundTransparency = 0.3
                ButtonFrame.BorderSizePixel = 0
                ButtonFrame.Text = ""
                ButtonFrame.Parent = TabContent
                
                local ButtonLabel = Instance.new("TextLabel")
                ButtonLabel.Name = "ButtonLabel"
                ButtonLabel.Size = UDim2.new(1, -50, 1, 0)
                ButtonLabel.Position = UDim2.new(0, 10, 0, 0)
                ButtonLabel.BackgroundTransparency = 1
                ButtonLabel.Text = config.Title or "Button"
                ButtonLabel.TextColor3 = COLORS.Text
                ButtonLabel.TextSize = 14
                ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
                ButtonLabel.Font = Enum.Font.Gotham
                ButtonLabel.Parent = ButtonFrame
                
                local IconLabel = Instance.new("TextLabel")
                IconLabel.Name = "IconLabel"
                IconLabel.Size = UDim2.new(0, 30, 1, 0)
                IconLabel.Position = UDim2.new(1, -40, 0, 0)
                IconLabel.BackgroundTransparency = 1
                IconLabel.Text = "🔒"
                IconLabel.TextColor3 = COLORS.Text
                IconLabel.TextSize = 16
                IconLabel.Font = Enum.Font.Gotham
                IconLabel.Parent = ButtonFrame
                
                SetupButtonHover(ButtonFrame)
                
                ButtonFrame.MouseButton1Click:Connect(function()
                    TweenService:Create(ButtonFrame, TWEEN_INFO, {
                        BackgroundColor3 = COLORS.Press,
                        BackgroundTransparency = 0.1
                    }):Play()
                    wait(0.1)
                    TweenService:Create(ButtonFrame, TWEEN_INFO, {
                        BackgroundColor3 = COLORS.Hover,
                        BackgroundTransparency = 0.2
                    }):Play()
                    callback()
                end)
                
                function Button:Update(newConfig)
                    if newConfig.Title then
                        ButtonLabel.Text = newConfig.Title
                    end
                    if newConfig.Callback then
                        callback = newConfig.Callback
                    end
                end
                
                return Button
            end
            
            function Section:CreateToggle(config)
                local Toggle = {}
                local value = config.Default or false
                local callback = config.Callback or function() end
                
                local ToggleFrame = Instance.new("TextButton")
                ToggleFrame.Name = "ToggleFrame"
                ToggleFrame.Size = UDim2.new(1, -20, 0, 40)
                ToggleFrame.Position = UDim2.new(0, 10, 0, 0)
                ToggleFrame.BackgroundColor3 = COLORS.Secondary
                ToggleFrame.BackgroundTransparency = 0.3
                ToggleFrame.BorderSizePixel = 0
                ToggleFrame.Text = ""
                ToggleFrame.Parent = TabContent
                
                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Size = UDim2.new(1, -70, 1, 0)
                ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
                ToggleLabel.BackgroundTransparency = 1
                ToggleLabel.Text = config.Title or "Toggle"
                ToggleLabel.TextColor3 = COLORS.Text
                ToggleLabel.TextSize = 14
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
                ToggleLabel.Font = Enum.Font.Gotham
                ToggleLabel.Parent = ToggleFrame
                
                local ToggleCircle = Instance.new("Frame")
                ToggleCircle.Name = "ToggleCircle"
                ToggleCircle.Size = UDim2.new(0, 20, 0, 20)
                ToggleCircle.Position = UDim2.new(1, -40, 0.5, -10)
                ToggleCircle.BackgroundColor3 = value and COLORS.ToggleOn or COLORS.ToggleOff
                ToggleCircle.BorderSizePixel = 0
                ToggleCircle.Parent = ToggleFrame
                
                SetupButtonHover(ToggleFrame)
                
                ToggleFrame.MouseButton1Click:Connect(function()
                    value = not value
                    TweenService:Create(ToggleCircle, TWEEN_INFO, {
                        BackgroundColor3 = value and COLORS.ToggleOn or COLORS.ToggleOff
                    }):Play()
                    callback(value)
                end)
                
                function Toggle:Update(newConfig)
                    if newConfig.Title then
                        ToggleLabel.Text = newConfig.Title
                    end
                    if newConfig.Callback then
                        callback = newConfig.Callback
                    end
                end
                
                function Toggle:SetValue(newValue)
                    value = newValue
                    ToggleCircle.BackgroundColor3 = value and COLORS.ToggleOn or COLORS.ToggleOff
                end
                
                return Toggle
            end
            
            function Section:CreateSlider(config)
                local Slider = {}
                local value = config.Default or config.Min or 0
                local callback = config.Callback or function() end
                
                local SliderFrame = Instance.new("Frame")
                SliderFrame.Name = "SliderFrame"
                SliderFrame.Size = UDim2.new(1, -20, 0, 60)
                SliderFrame.Position = UDim2.new(0, 10, 0, 0)
                SliderFrame.BackgroundColor3 = COLORS.Secondary
                SliderFrame.BackgroundTransparency = 0.3
                SliderFrame.BorderSizePixel = 0
                SliderFrame.Parent = TabContent
                
                local SliderLabel = Instance.new("TextLabel")
                SliderLabel.Name = "SliderLabel"
                SliderLabel.Size = UDim2.new(1, -20, 0, 20)
                SliderLabel.Position = UDim2.new(0, 10, 0, 5)
                SliderLabel.BackgroundTransparency = 1
                SliderLabel.Text = config.Title or "Slider"
                SliderLabel.TextColor3 = COLORS.Text
                SliderLabel.TextSize = 14
                SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
                SliderLabel.Font = Enum.Font.Gotham
                SliderLabel.Parent = SliderFrame
                
                local ValueLabel = Instance.new("TextLabel")
                ValueLabel.Name = "ValueLabel"
                ValueLabel.Size = UDim2.new(0, 60, 0, 20)
                ValueLabel.Position = UDim2.new(1, -70, 0, 5)
                ValueLabel.BackgroundTransparency = 1
                ValueLabel.Text = tostring(value)
                ValueLabel.TextColor3 = COLORS.Text
                ValueLabel.TextSize = 14
                ValueLabel.Font = Enum.Font.Gotham
                ValueLabel.Parent = SliderFrame
                
                local Track = Instance.new("Frame")
                Track.Name = "Track"
                Track.Size = UDim2.new(1, -20, 0, 4)
                Track.Position = UDim2.new(0, 10, 0, 35)
                Track.BackgroundColor3 = COLORS.Background
                Track.BackgroundTransparency = 0.5
                Track.BorderSizePixel = 0
                Track.Parent = SliderFrame
                
                local Fill = Instance.new("Frame")
                Fill.Name = "Fill"
                Fill.Size = UDim2.new((value - (config.Min or 0)) / ((config.Max or 100) - (config.Min or 0)), 0, 1, 0)
                Fill.BackgroundColor3 = COLORS.ToggleOn
                Fill.BorderSizePixel = 0
                Fill.Parent = Track
                
                local dragging = false
                
                local function updateSlider(input)
                    local relativeX = (input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X
                    relativeX = math.clamp(relativeX, 0, 1)
                    
                    value = math.floor((config.Min or 0) + relativeX * ((config.Max or 100) - (config.Min or 0)))
                    ValueLabel.Text = tostring(value)
                    TweenService:Create(Fill, TWEEN_INFO, {Size = UDim2.new(relativeX, 0, 1, 0)}):Play()
                    
                    callback(value)
                end
                
                Track.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        updateSlider(input)
                    end
                end)
                
                Track.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        updateSlider(input)
                    end
                end)
                
                function Slider:Update(newConfig)
                    if newConfig.Title then
                        SliderLabel.Text = newConfig.Title
                    end
                    if newConfig.Callback then
                        callback = newConfig.Callback
                    end
                end
                
                function Slider:SetValue(newValue)
                    value = math.clamp(newValue, config.Min or 0, config.Max or 100)
                    ValueLabel.Text = tostring(value)
                    local relativeX = (value - (config.Min or 0)) / ((config.Max or 100) - (config.Min or 0))
                    TweenService:Create(Fill, TWEEN_INFO, {Size = UDim2.new(relativeX, 0, 1, 0)}):Play()
                end
                
                return Slider
            end
            
            function Section:CreateDropdown(config)
                local Dropdown = {}
                local value = config.Default or ""
                local options = config.Options or {}
                local callback = config.Callback or function() end
                local isOpen = false
                
                local DropdownFrame = Instance.new("TextButton")
                DropdownFrame.Name = "DropdownFrame"
                DropdownFrame.Size = UDim2.new(1, -20, 0, 40)
                DropdownFrame.Position = UDim2.new(0, 10, 0, 0)
                DropdownFrame.BackgroundColor3 = COLORS.Secondary
                DropdownFrame.BackgroundTransparency = 0.3
                DropdownFrame.BorderSizePixel = 0
                DropdownFrame.Text = ""
                DropdownFrame.Parent = TabContent
                
                local DropdownLabel = Instance.new("TextLabel")
                DropdownLabel.Name = "DropdownLabel"
                DropdownLabel.Size = UDim2.new(1, -70, 1, 0)
                DropdownLabel.Position = UDim2.new(0, 10, 0, 0)
                DropdownLabel.BackgroundTransparency = 1
                DropdownLabel.Text = config.Title or "Dropdown"
                DropdownLabel.TextColor3 = COLORS.Text
                DropdownLabel.TextSize = 14
                DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
                DropdownLabel.Font = Enum.Font.Gotham
                DropdownLabel.Parent = DropdownFrame
                
                local ValueLabel = Instance.new("TextLabel")
                ValueLabel.Name = "ValueLabel"
                ValueLabel.Size = UDim2.new(0, 50, 1, 0)
                ValueLabel.Position = UDim2.new(1, -60, 0, 0)
                ValueLabel.BackgroundTransparency = 1
                ValueLabel.Text = value
                ValueLabel.TextColor3 = COLORS.Text
                ValueLabel.TextSize = 14
                ValueLabel.Font = Enum.Font.Gotham
                ValueLabel.Parent = DropdownFrame
                
                local ArrowLabel = Instance.new("TextLabel")
                ArrowLabel.Name = "ArrowLabel"
                ArrowLabel.Size = UDim2.new(0, 20, 1, 0)
                ArrowLabel.Position = UDim2.new(1, -30, 0, 0)
                ArrowLabel.BackgroundTransparency = 1
                ArrowLabel.Text = "▼"
                ArrowLabel.TextColor3 = COLORS.Text
                ArrowLabel.TextSize = 12
                ArrowLabel.Font = Enum.Font.Gotham
                ArrowLabel.Parent = DropdownFrame
                
                local OptionsFrame = Instance.new("Frame")
                OptionsFrame.Name = "OptionsFrame"
                OptionsFrame.Size = UDim2.new(1, 0, 0, 0)
                OptionsFrame.Position = UDim2.new(0, 0, 0, 45)
                OptionsFrame.BackgroundColor3 = COLORS.Background
                OptionsFrame.BackgroundTransparency = 0.3
                OptionsFrame.BorderSizePixel = 0
                OptionsFrame.Visible = false
                OptionsFrame.Parent = DropdownFrame
                
                local OptionsList = Instance.new("UIListLayout")
                OptionsList.Parent = OptionsFrame
                
                SetupButtonHover(DropdownFrame)
                
                local function updateOptions()
                    for _, option in pairs(OptionsFrame:GetChildren()) do
                        if option:IsA("TextButton") then
                            option:Destroy()
                        end
                    end
                    
                    for i, option in ipairs(options) do
                        local OptionButton = Instance.new("TextButton")
                        OptionButton.Name = "OptionButton"
                        OptionButton.Size = UDim2.new(1, 0, 0, 30)
                        OptionButton.Position = UDim2.new(0, 0, 0, (i-1)*30)
                        OptionButton.BackgroundColor3 = COLORS.Secondary
                        OptionButton.BackgroundTransparency = 0.3
                        OptionButton.BorderSizePixel = 0
                        OptionButton.Text = option
                        OptionButton.TextColor3 = COLORS.Text
                        OptionButton.TextSize = 14
                        OptionButton.Font = Enum.Font.Gotham
                        OptionButton.Parent = OptionsFrame
                        
                        SetupButtonHover(OptionButton)
                        
                        OptionButton.MouseButton1Click:Connect(function()
                            value = option
                            ValueLabel.Text = value
                            isOpen = false
                            OptionsFrame.Visible = false
                            TweenService:Create(ArrowLabel, TWEEN_INFO, {Rotation = 0}):Play()
                            TweenService:Create(OptionsFrame, TWEEN_INFO, {Size = UDim2.new(1, 0, 0, 0)}):Play()
                            callback(value)
                        end)
                    end
                    
                    OptionsFrame.Size = UDim2.new(1, 0, 0, #options * 30)
                end
                
                DropdownFrame.MouseButton1Click:Connect(function()
                    isOpen = not isOpen
                    OptionsFrame.Visible = isOpen
                    TweenService:Create(ArrowLabel, TWEEN_INFO, {Rotation = isOpen and 180 or 0}):Play()
                    if isOpen then
                        TweenService:Create(OptionsFrame, TWEEN_INFO, {Size = UDim2.new(1, 0, 0, #options * 30)}):Play()
                    else
                        TweenService:Create(OptionsFrame, TWEEN_INFO, {Size = UDim2.new(1, 0, 0, 0)}):Play()
                    end
                    updateOptions()
                end)
                
                updateOptions()
                
                function Dropdown:Update(newConfig)
                    if newConfig.Title then
                        DropdownLabel.Text = newConfig.Title
                    end
                    if newConfig.Options then
                        options = newConfig.Options
                        updateOptions()
                    end
                    if newConfig.Callback then
                        callback = newConfig.Callback
                    end
                end
                
                function Dropdown:SetValue(newValue)
                    value = newValue
                    ValueLabel.Text = value
                end
                
                return Dropdown
            end
            
            return Section
        end
        
        return Tab
    end
    
    -- Parent to PlayerGui
    if game.Players.LocalPlayer then
        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    else
        ScreenGui.Parent = game:GetService("CoreGui")
    end
    
    return Window
end

return NazuX
