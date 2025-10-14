-- NazuX Library - With Special Themes
local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Theme Colors với themes đặc biệt
local Themes = {
    Dark = {
        Name = "Dark",
        Background = Color3.fromRGB(25, 25, 25),
        Secondary = Color3.fromRGB(30, 30, 30),
        Tertiary = Color3.fromRGB(35, 35, 35),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(200, 200, 200)
    },
    Light = {
        Name = "Light", 
        Background = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(220, 220, 220),
        Tertiary = Color3.fromRGB(200, 200, 200),
        Text = Color3.fromRGB(0, 0, 0),
        SubText = Color3.fromRGB(80, 80, 80)
    },
    Blue = {
        Name = "Blue",
        Background = Color3.fromRGB(25, 35, 60),
        Secondary = Color3.fromRGB(35, 45, 70),
        Tertiary = Color3.fromRGB(45, 55, 80),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(180, 200, 255)
    },
    Purple = {
        Name = "Purple",
        Background = Color3.fromRGB(40, 25, 60),
        Secondary = Color3.fromRGB(50, 35, 70),
        Tertiary = Color3.fromRGB(60, 45, 80),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(220, 180, 255)
    },
    -- THEMES ĐẶC BIỆT
    AMOLED = {
        Name = "AMOLED",
        Background = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(5, 5, 5),
        Tertiary = Color3.fromRGB(10, 10, 10),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(100, 100, 100)
    },
    Rose = {
        Name = "Rose",
        Background = Color3.fromRGB(60, 25, 45),
        Secondary = Color3.fromRGB(70, 35, 55),
        Tertiary = Color3.fromRGB(80, 45, 65),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(255, 200, 220)
    },
    Cyber = {
        Name = "Cyber",
        Background = Color3.fromRGB(10, 15, 30),
        Secondary = Color3.fromRGB(20, 25, 40),
        Tertiary = Color3.fromRGB(30, 35, 50),
        Text = Color3.fromRGB(0, 255, 255),
        SubText = Color3.fromRGB(0, 200, 200)
    },
    Sunset = {
        Name = "Sunset",
        Background = Color3.fromRGB(80, 25, 45),
        Secondary = Color3.fromRGB(90, 35, 55),
        Tertiary = Color3.fromRGB(100, 45, 65),
        Text = Color3.fromRGB(255, 255, 200),
        SubText = Color3.fromRGB(255, 200, 150)
    },
    Ocean = {
        Name = "Ocean",
        Background = Color3.fromRGB(20, 40, 60),
        Secondary = Color3.fromRGB(30, 50, 70),
        Tertiary = Color3.fromRGB(40, 60, 80),
        Text = Color3.fromRGB(200, 240, 255),
        SubText = Color3.fromRGB(150, 200, 230)
    },
    Forest = {
        Name = "Forest",
        Background = Color3.fromRGB(20, 40, 25),
        Secondary = Color3.fromRGB(30, 50, 35),
        Tertiary = Color3.fromRGB(40, 60, 45),
        Text = Color3.fromRGB(220, 255, 220),
        SubText = Color3.fromRGB(180, 230, 180)
    },
    Gold = {
        Name = "Gold",
        Background = Color3.fromRGB(60, 50, 20),
        Secondary = Color3.fromRGB(70, 60, 30),
        Tertiary = Color3.fromRGB(80, 70, 40),
        Text = Color3.fromRGB(255, 255, 200),
        SubText = Color3.fromRGB(255, 230, 150)
    },
    Matrix = {
        Name = "Matrix",
        Background = Color3.fromRGB(0, 20, 0),
        Secondary = Color3.fromRGB(0, 30, 0),
        Tertiary = Color3.fromRGB(0, 40, 0),
        Text = Color3.fromRGB(0, 255, 0),
        SubText = Color3.fromRGB(0, 200, 0)
    },
    Blood = {
        Name = "Blood",
        Background = Color3.fromRGB(40, 0, 0),
        Secondary = Color3.fromRGB(60, 0, 0),
        Tertiary = Color3.fromRGB(80, 0, 0),
        Text = Color3.fromRGB(255, 200, 200),
        SubText = Color3.fromRGB(255, 150, 150)
    }
}

local CurrentTheme = Themes.Dark
local ThemeIndex = 1
local ThemeNames = {"Dark", "Light", "Blue", "Purple", "AMOLED", "Rose", "Cyber", "Sunset", "Ocean", "Forest", "Gold", "Matrix", "Blood"}
local AccentColor = Color3.fromRGB(0, 120, 215)

-- Utility Functions
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

local function Tween(Object, Goals, Duration, Style, Direction)
    local TweenInfo = TweenInfo.new(Duration or 0.3, Style or Enum.EasingStyle.Quad, Direction or Enum.EasingDirection.Out)
    local Tween = TweenService:Create(Object, TweenInfo, Goals)
    Tween:Play()
    return Tween
end

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowName = options.Name or "NazuX Library"
    local SubtitleText = options.Subtitle or "Premium Script Hub"
    local Size = options.Size or UDim2.new(0, 600, 0, 450)
    local Position = options.Position or UDim2.new(0.5, -300, 0.5, -225)
    
    local NazuXLibrary = {}
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        ResetOnSpawn = false
    })
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Main Container
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        Position = Position,
        Size = Size,
        Active = true,
        Draggable = true,
        Parent = ScreenGui
    })
    
    local UICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    -- Title Bar
    local TopFrame = Create("Frame", {
        Name = "TopFrame",
        BackgroundColor3 = CurrentTheme.Secondary,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        Parent = MainFrame
    })
    
    local UICornerTop = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = TopFrame
    })
    
    local Title = Create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 5),
        Size = UDim2.new(0, 200, 0, 18),
        Font = Enum.Font.GothamBold,
        Text = WindowName,
        TextColor3 = CurrentTheme.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopFrame
    })
    
    local Subtitle = Create("TextLabel", {
        Name = "Subtitle",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 22),
        Size = UDim2.new(0, 200, 0, 14),
        Font = Enum.Font.Gotham,
        Text = SubtitleText,
        TextColor3 = CurrentTheme.SubText,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopFrame
    })
    
    -- THEME BUTTON (Ở giữa)
    local ThemeButton = Create("TextButton", {
        Name = "ThemeButton",
        BackgroundColor3 = AccentColor,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -50, 0, 10),
        Size = UDim2.new(0, 100, 0, 20),
        Font = Enum.Font.Gotham,
        Text = "Theme: Dark",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 11,
        Parent = TopFrame
    })
    
    local ThemeUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = ThemeButton
    })
    
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        BorderSizePixel = 0,
        Position = UDim2.new(1, -30, 0, 10),
        Size = UDim2.new(0, 20, 0, 20),
        Font = Enum.Font.GothamBold,
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        Parent = TopFrame
    })
    
    local CloseUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = CloseButton
    })
    
    -- Content Area
    local ContentArea = Create("Frame", {
        Name = "ContentArea",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(1, 0, 1, -40),
        Parent = MainFrame
    })
    
    -- Left Sidebar
    local LeftSidebar = Create("Frame", {
        Name = "LeftSidebar",
        BackgroundColor3 = CurrentTheme.Secondary,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 180, 1, 0),
        Parent = ContentArea
    })
    
    local SidebarUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = LeftSidebar
    })
    
    -- Tabs Container
    local TabsContainer = Create("ScrollingFrame", {
        Name = "TabsContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 5, 0, 5),
        Size = UDim2.new(1, -10, 1, -10),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = CurrentTheme.Tertiary,
        Parent = LeftSidebar
    })
    
    local TabsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        Parent = TabsContainer
    })
    
    TabsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabsContainer.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
    end)
    
    -- Main Content Area
    local MainContent = Create("Frame", {
        Name = "MainContent",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 185, 0, 0),
        Size = UDim2.new(1, -185, 1, 0),
        Parent = ContentArea
    })
    
    -- THEME MANAGEMENT FUNCTION
    local function UpdateTheme()
        -- Update all UI elements with new theme colors
        Tween(MainFrame, {BackgroundColor3 = CurrentTheme.Background}, 0.3)
        Tween(TopFrame, {BackgroundColor3 = CurrentTheme.Secondary}, 0.3)
        Tween(LeftSidebar, {BackgroundColor3 = CurrentTheme.Secondary}, 0.3)
        
        Tween(Title, {TextColor3 = CurrentTheme.Text}, 0.3)
        Tween(Subtitle, {TextColor3 = CurrentTheme.SubText}, 0.3)
        
        -- Update Theme Button Text
        ThemeButton.Text = "Theme: " .. CurrentTheme.Name
        
        -- Update Tabs
        for _, tabButton in pairs(TabsContainer:GetChildren()) do
            if tabButton:IsA("TextButton") then
                if tabButton.BackgroundColor3 ~= AccentColor then
                    Tween(tabButton, {BackgroundColor3 = CurrentTheme.Tertiary, TextColor3 = CurrentTheme.SubText}, 0.3)
                end
            end
        end
    end
    
    -- THEME BUTTON EVENT
    ThemeButton.MouseButton1Click:Connect(function()
        -- Cycle through themes
        ThemeIndex = ThemeIndex + 1
        if ThemeIndex > #ThemeNames then
            ThemeIndex = 1
        end
        
        CurrentTheme = Themes[ThemeNames[ThemeIndex]]
        UpdateTheme()
        
        -- Button click effect
        Tween(ThemeButton, {BackgroundColor3 = Color3.fromRGB(0, 100, 200)}, 0.1)
        wait(0.1)
        Tween(ThemeButton, {BackgroundColor3 = AccentColor}, 0.2)
    end)
    
    ThemeButton.MouseEnter:Connect(function()
        Tween(ThemeButton, {BackgroundColor3 = Color3.fromRGB(0, 140, 255)}, 0.2)
    end)
    
    ThemeButton.MouseLeave:Connect(function()
        Tween(ThemeButton, {BackgroundColor3 = AccentColor}, 0.2)
    end)
    
    -- Close Button Event
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(240, 80, 80)}, 0.2)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(220, 60, 60)}, 0.2)
    end)
    
    -- Tab Management
    local CurrentTab = nil
    
    function NazuXLibrary:CreateTab(TabName)
        local TabButton = Create("TextButton", {
            Name = TabName .. "TabButton",
            BackgroundColor3 = CurrentTheme.Tertiary,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 35),
            Font = Enum.Font.Gotham,
            Text = TabName,
            TextColor3 = CurrentTheme.SubText,
            TextSize = 12,
            AutoButtonColor = false,
            Parent = TabsContainer
        })
        
        local TabButtonUICorner = Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = TabButton
        })
        
        local TabContent = Create("ScrollingFrame", {
            Name = TabName .. "Content",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = CurrentTheme.Tertiary,
            Visible = false,
            Parent = MainContent
        })
        
        local TabContentListLayout = Create("UIListLayout", {
            Padding = UDim.new(0, 10),
            Parent = TabContent
        })
        
        TabContentListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentListLayout.AbsoluteContentSize.Y + 10)
        end)
        
        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Visible = false
                for _, btn in pairs(TabsContainer:GetChildren()) do
                    if btn:IsA("TextButton") then
                        Tween(btn, {BackgroundColor3 = CurrentTheme.Tertiary, TextColor3 = CurrentTheme.SubText}, 0.2)
                    end
                end
            end
            
            CurrentTab = TabContent
            TabContent.Visible = true
            Tween(TabButton, {BackgroundColor3 = AccentColor, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
        end)
        
        TabButton.MouseEnter:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, 0.2)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {BackgroundColor3 = CurrentTheme.Tertiary}, 0.2)
            end
        end)
        
        local TabFunctions = {}
        
        function TabFunctions:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            local ButtonName = ButtonConfig.Name or "Button"
            local Callback = ButtonConfig.Callback or function() end
            
            local ButtonContainer = Create("Frame", {
                Name = ButtonName .. "Container",
                BackgroundColor3 = CurrentTheme.Secondary,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -20, 0, 35),
                Parent = TabContent
            })
            
            local ButtonContainerUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = ButtonContainer
            })
            
            local Button = Create("TextButton", {
                Name = ButtonName .. "Button",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ButtonName,
                TextColor3 = CurrentTheme.Text,
                TextSize = 12,
                Parent = ButtonContainer
            })
            
            Button.MouseButton1Click:Connect(function()
                Callback()
                Tween(ButtonContainer, {BackgroundColor3 = AccentColor}, 0.1)
                wait(0.1)
                Tween(ButtonContainer, {BackgroundColor3 = CurrentTheme.Secondary}, 0.1)
            end)
            
            Button.MouseEnter:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = CurrentTheme.Secondary}, 0.2)
            end)
            
            return ButtonContainer
        end
        
        -- Auto-select first tab
        if not CurrentTab then
            CurrentTab = TabContent
            TabContent.Visible = true
            Tween(TabButton, {BackgroundColor3 = AccentColor, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
        end
        
        return TabFunctions
    end
    
    function NazuXLibrary:ToggleUI()
        MainFrame.Visible = not MainFrame.Visible
    end
    
    function NazuXLibrary:SetTheme(themeName)
        if Themes[themeName] then
            CurrentTheme = Themes[themeName]
            for i, name in ipairs(ThemeNames) do
                if name == themeName then
                    ThemeIndex = i
                    break
                end
            end
            UpdateTheme()
        end
    end
    
    return NazuXLibrary
end

return NazuX
