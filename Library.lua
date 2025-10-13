-- NazuX Library
-- Transparent UI với Tab thẳng bên trái

local NazuX = {}
NazuX.__index = NazuX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Local variables
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

function NazuX:CreateWindow(options)
    local config = {
        name = options.name or "NazuX Library",
        theme = options.theme or "Dark",
        accentColor = options.accentColor or Color3.fromRGB(0, 170, 255)
    }
    
    local Window = {}
    Window.Tabs = {}
    
    -- Main ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NazuXLibrary"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999
    ScreenGui.Parent = game.CoreGui
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 600, 0, 450)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -225)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame
    
    -- Drop Shadow
    local DropShadow = Instance.new("ImageLabel")
    DropShadow.Name = "DropShadow"
    DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    DropShadow.Size = UDim2.new(1, 40, 1, 40)
    DropShadow.BackgroundTransparency = 1
    DropShadow.Image = "rbxassetid://6014261993"
    DropShadow.ImageColor3 = Color3.new(0, 0, 0)
    DropShadow.ImageTransparency = 0.5
    DropShadow.ScaleType = Enum.ScaleType.Slice
    DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
    DropShadow.Parent = MainFrame
    
    -- Header
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, 40)
    Header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Header.BackgroundTransparency = 0.1
    Header.BorderSizePixel = 0
    Header.Parent = MainFrame
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 8)
    HeaderCorner.Parent = Header
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0, 200, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = config.name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamSemibold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0.5, -15)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    CloseButton.BackgroundTransparency = 0.1
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = Header
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 4)
    CloseCorner.Parent = CloseButton
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 150, 1, -40)
    TabContainer.Position = UDim2.new(0, 0, 0, 40)
    TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TabContainer.BackgroundTransparency = 0.1
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = MainFrame
    
    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Padding = UDim.new(0, 5)
    TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    TabListLayout.Parent = TabContainer
    
    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -150, 1, -40)
    ContentContainer.Position = UDim2.new(0, 150, 0, 40)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Parent = MainFrame
    
    -- Make window draggable
    local dragging = false
    local dragInput, dragStart, startPos
    
    Header.InputBegan:Connect(function(input)
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
    
    Header.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    function Window:CreateTab(tabName)
        local Tab = {}
        Tab.Name = tabName
        Tab.Buttons = {}
        
        -- Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "TabButton"
        TabButton.Size = UDim2.new(0.9, 0, 0, 35)
        TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        TabButton.BackgroundTransparency = 0.1
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabButton.TextSize = 14
        TabButton.Font = Enum.Font.Gotham
        TabButton.Parent = TabContainer
        
        local TabButtonCorner = Instance.new("UICorner")
        TabButtonCorner.CornerRadius = UDim.new(0, 6)
        TabButtonCorner.Parent = TabButton
        
        -- Tab Content
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = tabName .. "Content"
        TabContent.Size = UDim2.new(1, -20, 1, -20)
        TabContent.Position = UDim2.new(0, 10, 0, 10)
        TabContent.BackgroundTransparency = 1
        TabContent.ScrollBarThickness = 3
        TabContent.ScrollBarImageColor3 = config.accentColor
        TabContent.Visible = false
        TabContent.Parent = ContentContainer
        
        local TabContentList = Instance.new("UIListLayout")
        TabContentList.Padding = UDim.new(0, 8)
        TabContentList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        TabContentList.Parent = TabContent
        
        TabContentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentList.AbsoluteContentSize.Y + 20)
        end)
        
        -- Tab button click event
        TabButton.MouseButton1Click:Connect(function()
            for _, otherTab in pairs(Window.Tabs) do
                if otherTab.Content then
                    otherTab.Content.Visible = false
                end
            end
            TabContent.Visible = true
            
            -- Update button colors
            for _, btn in pairs(TabContainer:GetChildren()) do
                if btn:IsA("TextButton") then
                    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
                end
            end
            TabButton.BackgroundColor3 = config.accentColor
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        end)
        
        -- Make first tab active by default
        if #Window.Tabs == 0 then
            TabContent.Visible = true
            TabButton.BackgroundColor3 = config.accentColor
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        
        Tab.Content = TabContent
        table.insert(Window.Tabs, Tab)
        
        function Tab:AddButton(options)
            local buttonConfig = {
                name = options.name or "Button",
                callback = options.callback or function() end
            }
            
            local Button = Instance.new("TextButton")
            Button.Name = buttonConfig.name .. "Button"
            Button.Size = UDim2.new(1, 0, 0, 35)
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Button.BackgroundTransparency = 0.1
            Button.Text = buttonConfig.name
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14
            Button.Font = Enum.Font.Gotham
            Button.Parent = TabContent
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 6)
            ButtonCorner.Parent = Button
            
            -- Hover effects
            Button.MouseEnter:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = config.accentColor}):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
            end)
            
            Button.MouseButton1Click:Connect(function()
                buttonConfig.callback()
            end)
            
            table.insert(Tab.Buttons, Button)
            return Button
        end
        
        function Tab:AddToggle(options)
            local toggleConfig = {
                name = options.name or "Toggle",
                default = options.default or false,
                callback = options.callback or function() end
            }
            
            local Toggle = {}
            Toggle.Value = toggleConfig.default
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = toggleConfig.name .. "Toggle"
            ToggleFrame.Size = UDim2.new(1, 0, 0, 35)
            ToggleFrame.BackgroundTransparency = 1
            ToggleFrame.Parent = TabContent
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "Label"
            ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Text = toggleConfig.name
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextSize = 14
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Parent = ToggleFrame
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Size = UDim2.new(0, 50, 0, 25)
            ToggleButton.Position = UDim2.new(1, -55, 0.5, -12.5)
            ToggleButton.BackgroundColor3 = Toggle.Value and config.accentColor or Color3.fromRGB(80, 80, 80)
            ToggleButton.Text = ""
            ToggleButton.Parent = ToggleFrame
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 12)
            ToggleCorner.Parent = ToggleButton
            
            local ToggleDot = Instance.new("Frame")
            ToggleDot.Name = "ToggleDot"
            ToggleDot.Size = UDim2.new(0, 19, 0, 19)
            ToggleDot.Position = UDim2.new(0, 3, 0.5, -9.5)
            ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDot.Parent = ToggleButton
            
            if Toggle.Value then
                ToggleDot.Position = UDim2.new(1, -22, 0.5, -9.5)
            end
            
            local ToggleDotCorner = Instance.new("UICorner")
            ToggleDotCorner.CornerRadius = UDim.new(0, 9)
            ToggleDotCorner.Parent = ToggleDot
            
            ToggleButton.MouseButton1Click:Connect(function()
                Toggle.Value = not Toggle.Value
                
                if Toggle.Value then
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = config.accentColor}):Play()
                    TweenService:Create(ToggleDot, TweenInfo.new(0.2), {Position = UDim2.new(1, -22, 0.5, -9.5)}):Play()
                else
                    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
                    TweenService:Create(ToggleDot, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -9.5)}):Play()
                end
                
                toggleConfig.callback(Toggle.Value)
            end)
            
            table.insert(Tab.Buttons, ToggleFrame)
            return Toggle
        end
        
        function Tab:AddSlider(options)
            local sliderConfig = {
                name = options.name or "Slider",
                min = options.min or 0,
                max = options.max or 100,
                default = options.default or 50,
                callback = options.callback or function() end
            }
            
            local Slider = {}
            Slider.Value = sliderConfig.default
            
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Name = sliderConfig.name .. "Slider"
            SliderFrame.Size = UDim2.new(1, 0, 0, 50)
            SliderFrame.BackgroundTransparency = 1
            SliderFrame.Parent = TabContent
            
            local SliderLabel = Instance.new("TextLabel")
            SliderLabel.Name = "Label"
            SliderLabel.Size = UDim2.new(1, 0, 0, 20)
            SliderLabel.BackgroundTransparency = 1
            SliderLabel.Text = sliderConfig.name .. ": " .. sliderConfig.default
            SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderLabel.TextSize = 14
            SliderLabel.Font = Enum.Font.Gotham
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            SliderLabel.Parent = SliderFrame
            
            local SliderTrack = Instance.new("Frame")
            SliderTrack.Name = "Track"
            SliderTrack.Size = UDim2.new(1, 0, 0, 6)
            SliderTrack.Position = UDim2.new(0, 0, 0, 30)
            SliderTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            SliderTrack.Parent = SliderFrame
            
            local SliderTrackCorner = Instance.new("UICorner")
            SliderTrackCorner.CornerRadius = UDim.new(0, 3)
            SliderTrackCorner.Parent = SliderTrack
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Name = "Fill"
            SliderFill.Size = UDim2.new((sliderConfig.default - sliderConfig.min) / (sliderConfig.max - sliderConfig.min), 0, 1, 0)
            SliderFill.BackgroundColor3 = config.accentColor
            SliderFill.Parent = SliderTrack
            
            local SliderFillCorner = Instance.new("UICorner")
            SliderFillCorner.CornerRadius = UDim.new(0, 3)
            SliderFillCorner.Parent = SliderFill
            
            local SliderButton = Instance.new("TextButton")
            SliderButton.Name = "SliderButton"
            SliderButton.Size = UDim2.new(0, 16, 0, 16)
            SliderButton.Position = UDim2.new((sliderConfig.default - sliderConfig.min) / (sliderConfig.max - sliderConfig.min), -8, 0.5, -8)
            SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderButton.Text = ""
            SliderButton.Parent = SliderTrack
            
            local SliderButtonCorner = Instance.new("UICorner")
            SliderButtonCorner.CornerRadius = UDim.new(0, 8)
            SliderButtonCorner.Parent = SliderButton
            
            local dragging = false
            
            local function updateSlider(input)
                local pos = UDim2.new(
                    math.clamp((input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1),
                    0, 0.5, -8
                )
                SliderButton.Position = pos
                
                local value = math.floor(sliderConfig.min + ((pos.X.Scale) * (sliderConfig.max - sliderConfig.min)))
                Slider.Value = value
                SliderLabel.Text = sliderConfig.name .. ": " .. value
                SliderFill.Size = UDim2.new(pos.X.Scale, 0, 1, 0)
                
                sliderConfig.callback(value)
            end
            
            SliderButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            
            SliderButton.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(input)
                end
            end)
            
            SliderTrack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    updateSlider(input)
                end
            end)
            
            table.insert(Tab.Buttons, SliderFrame)
            return Slider
        end
        
        function Tab:AddDropdown(options)
            local dropdownConfig = {
                name = options.name or "Dropdown",
                options = options.options or {},
                default = options.default or nil,
                callback = options.callback or function() end
            }
            
            local Dropdown = {}
            Dropdown.Value = dropdownConfig.default
            Dropdown.Open = false
            
            local DropdownFrame = Instance.new("Frame")
            DropdownFrame.Name = dropdownConfig.name .. "Dropdown"
            DropdownFrame.Size = UDim2.new(1, 0, 0, 35)
            DropdownFrame.BackgroundTransparency = 1
            DropdownFrame.Parent = TabContent
            
            local DropdownButton = Instance.new("TextButton")
            DropdownButton.Name = "DropdownButton"
            DropdownButton.Size = UDim2.new(1, 0, 0, 35)
            DropdownButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            DropdownButton.Text = dropdownConfig.name .. (dropdownConfig.default and ": " .. dropdownConfig.default or ": ...")
            DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownButton.TextSize = 14
            DropdownButton.Font = Enum.Font.Gotham
            DropdownButton.Parent = DropdownFrame
            
            local DropdownButtonCorner = Instance.new("UICorner")
            DropdownButtonCorner.CornerRadius = UDim.new(0, 6)
            DropdownButtonCorner.Parent = DropdownButton
            
            local DropdownArrow = Instance.new("ImageLabel")
            DropdownArrow.Name = "Arrow"
            DropdownArrow.Size = UDim2.new(0, 20, 0, 20)
            DropdownArrow.Position = UDim2.new(1, -25, 0.5, -10)
            DropdownArrow.BackgroundTransparency = 1
            DropdownArrow.Image = "rbxassetid://6031090990"
            DropdownArrow.ImageColor3 = Color3.fromRGB(255, 255, 255)
            DropdownArrow.Parent = DropdownButton
            
            local DropdownOptions = Instance.new("ScrollingFrame")
            DropdownOptions.Name = "Options"
            DropdownOptions.Size = UDim2.new(1, 0, 0, 0)
            DropdownOptions.Position = UDim2.new(0, 0, 1, 5)
            DropdownOptions.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            DropdownOptions.ScrollBarThickness = 3
            DropdownOptions.ScrollBarImageColor3 = config.accentColor
            DropdownOptions.Visible = false
            DropdownOptions.Parent = DropdownFrame
            
            local DropdownOptionsList = Instance.new("UIListLayout")
            DropdownOptionsList.Padding = UDim.new(0, 2)
            DropdownOptionsList.Parent = DropdownOptions
            
            DropdownOptionsList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                DropdownOptions.CanvasSize = UDim2.new(0, 0, 0, DropdownOptionsList.AbsoluteContentSize.Y)
            end)
            
            local DropdownOptionsCorner = Instance.new("UICorner")
            DropdownOptionsCorner.CornerRadius = UDim.new(0, 6)
            DropdownOptionsCorner.Parent = DropdownOptions
            
            for _, option in pairs(dropdownConfig.options) do
                local OptionButton = Instance.new("TextButton")
                OptionButton.Name = option .. "Option"
                OptionButton.Size = UDim2.new(1, 0, 0, 30)
                OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                OptionButton.BackgroundTransparency = 1
                OptionButton.Text = option
                OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                OptionButton.TextSize = 14
                OptionButton.Font = Enum.Font.Gotham
                OptionButton.Parent = DropdownOptions
                
                local OptionCorner = Instance.new("UICorner")
                OptionCorner.CornerRadius = UDim.new(0, 4)
                OptionCorner.Parent = OptionButton
                
                OptionButton.MouseButton1Click:Connect(function()
                    Dropdown.Value = option
                    DropdownButton.Text = dropdownConfig.name .. ": " .. option
                    Dropdown.Open = false
                    DropdownOptions.Visible = false
                    DropdownOptions.Size = UDim2.new(1, 0, 0, 0)
                    TweenService:Create(DropdownArrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
                    dropdownConfig.callback(option)
                end)
                
                OptionButton.MouseEnter:Connect(function()
                    TweenService:Create(OptionButton, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
                end)
                
                OptionButton.MouseLeave:Connect(function()
                    TweenService:Create(OptionButton, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                end)
            end
            
            DropdownButton.MouseButton1Click:Connect(function()
                Dropdown.Open = not Dropdown.Open
                DropdownOptions.Visible = Dropdown.Open
                
                if Dropdown.Open then
                    DropdownOptions.Size = UDim2.new(1, 0, 0, math.min(#dropdownConfig.options * 32, 160))
                    TweenService:Create(DropdownArrow, TweenInfo.new(0.2), {Rotation = 180}):Play()
                else
                    DropdownOptions.Size = UDim2.new(1, 0, 0, 0)
                    TweenService:Create(DropdownArrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
                end
            end)
            
            table.insert(Tab.Buttons, DropdownFrame)
            return Dropdown
        end
        
        function Tab:AddLabel(options)
            local labelConfig = {
                text = options.text or "Label",
                color = options.color or Color3.fromRGB(255, 255, 255)
            }
            
            local LabelFrame = Instance.new("Frame")
            LabelFrame.Name = "LabelFrame"
            LabelFrame.Size = UDim2.new(1, 0, 0, 25)
            LabelFrame.BackgroundTransparency = 1
            LabelFrame.Parent = TabContent
            
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Size = UDim2.new(1, 0, 1, 0)
            Label.BackgroundTransparency = 1
            Label.Text = labelConfig.text
            Label.TextColor3 = labelConfig.color
            Label.TextSize = 14
            Label.Font = Enum.Font.Gotham
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = LabelFrame
            
            table.insert(Tab.Buttons, LabelFrame)
            return Label
        end
        
        return Tab
    end
    
    return Window
end

return NazuX
