-- NazuX Library - Clean Version
local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Local variables
local localPlayer = Players.LocalPlayer

-- Icons
local Icons = {
    search = "http://www.roblox.com/asset/?id=6031154871",
    home = "http://www.roblox.com/asset/?id=6026568195",
    settings = "http://www.roblox.com/asset/?id=6031280882",
    fullscreen = "http://www.roblox.com/asset/?id=6031094681",
    fullscreen_exit = "http://www.roblox.com/asset/?id=6031094691",
    fingerprint = "http://www.roblox.com/asset/?id=6023565895",
    check = "http://www.roblox.com/asset/?id=6031094667",
    expand_more = "http://www.roblox.com/asset/?id=6031094687"
}

-- Themes
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

-- Utility functions
local function Create(class, properties)
    local obj = Instance.new(class)
    for prop, value in pairs(properties) do
        obj[prop] = value
    end
    return obj
end

local function Tween(Object, Properties, Duration)
    local TweenInfo = TweenInfo.new(Duration or 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local Tween = TweenService:Create(Object, TweenInfo, Properties)
    Tween:Play()
    return Tween
end

-- Main Window
function NazuX:CreateWindow(options)
    options = options or {}
    local Window = {
        Tabs = {},
        CurrentTab = nil,
        Minimized = false,
        FullScreen = false,
        CurrentTheme = options.Theme or "Dark"
    }
    setmetatable(Window, self)
    
    -- Screen GUI
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        Parent = game:GetService("CoreGui")
    })
    
    -- Loading Screen
    local LoadingFrame = Create("Frame", {
        Parent = ScreenGui,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Themes[Window.CurrentTheme].Main
    })
    
    local LoadingLabel = Create("TextLabel", {
        Parent = LoadingFrame,
        Size = UDim2.new(0, 200, 0, 40),
        Position = UDim2.new(0.5, -100, 0.5, -20),
        BackgroundTransparency = 1,
        Text = "NazuX UI Loading...",
        TextColor3 = Themes[Window.CurrentTheme].Text,
        TextSize = 18,
        Font = Enum.Font.Gotham
    })
    
    spawn(function()
        for i = 1, 10 do
            LoadingLabel.Text = "NazuX UI Loading" .. string.rep(".", i % 4)
            wait(0.1)
        end
        Tween(LoadingFrame, {BackgroundTransparency = 1}, 0.5)
        wait(0.5)
        LoadingFrame:Destroy()
    end)
    
    -- Main Frame
    local MainFrame = Create("Frame", {
        Parent = ScreenGui,
        Size = UDim2.new(0, 600, 0, 400),
        Position = UDim2.new(0.5, -300, 0.5, -200),
        BackgroundColor3 = Themes[Window.CurrentTheme].Main,
        BorderColor3 = Themes[Window.CurrentTheme].Border
    })
    
    Create("UICorner", {Parent = MainFrame, CornerRadius = UDim.new(0, 8)})
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Themes[Window.CurrentTheme].Secondary
    })
    
    -- Title (Left side)
    local Title = Create("TextLabel", {
        Parent = TitleBar,
        Size = UDim2.new(0, 200, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = options.Title or "NazuX Library",
        TextColor3 = Themes[Window.CurrentTheme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Search Bar
    local SearchFrame = Create("Frame", {
        Parent = TitleBar,
        Size = UDim2.new(0, 200, 0, 30),
        Position = UDim2.new(0.5, -100, 0.5, -15),
        BackgroundColor3 = Themes[Window.CurrentTheme].Main
    })
    
    Create("UICorner", {Parent = SearchFrame, CornerRadius = UDim.new(0, 6)})
    
    local SearchBox = Create("TextBox", {
        Parent = SearchFrame,
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = "Search...",
        PlaceholderText = "Search...",
        TextColor3 = Themes[Window.CurrentTheme].Text,
        PlaceholderColor3 = Themes[Window.CurrentTheme].TextSecondary,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local SearchIcon = Create("ImageLabel", {
        Parent = SearchFrame,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(1, -30, 0.5, -10),
        BackgroundTransparency = 1,
        Image = Icons.search,
        ImageColor3 = Themes[Window.CurrentTheme].TextSecondary
    })
    
    -- Control Buttons
    local FullScreenButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -110, 0.5, -15),
        BackgroundColor3 = Themes[Window.CurrentTheme].Secondary,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("UICorner", {Parent = FullScreenButton, CornerRadius = UDim.new(0, 6)})
    
    local FullScreenIcon = Create("ImageLabel", {
        Parent = FullScreenButton,
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(0.5, -9, 0.5, -9),
        BackgroundTransparency = 1,
        Image = Icons.fullscreen,
        ImageColor3 = Themes[Window.CurrentTheme].Text
    })
    
    local MinimizeButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -70, 0.5, -15),
        BackgroundColor3 = Themes[Window.CurrentTheme].Secondary,
        Text = "-",
        TextColor3 = Themes[Window.CurrentTheme].Text,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false
    })
    
    Create("UICorner", {Parent = MinimizeButton, CornerRadius = UDim.new(0, 6)})
    
    local CloseButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -30, 0.5, -15),
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false
    })
    
    Create("UICorner", {Parent = CloseButton, CornerRadius = UDim.new(0, 6)})
    
    -- User Info
    local UserInfoFrame = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(0, 200, 0, 80),
        Position = UDim2.new(0, 10, 0, 50),
        BackgroundColor3 = Themes[Window.CurrentTheme].Secondary
    })
    
    Create("UICorner", {Parent = UserInfoFrame, CornerRadius = UDim.new(0, 8)})
    
    local Avatar = Create("ImageLabel", {
        Parent = UserInfoFrame,
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.new(0, 10, 0.5, -25),
        BackgroundColor3 = Themes[Window.CurrentTheme].Main,
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..localPlayer.UserId.."&width=150&height=150&format=png"
    })
    
    Create("UICorner", {Parent = Avatar, CornerRadius = UDim.new(1, 0)})
    
    local UserName = Create("TextLabel", {
        Parent = UserInfoFrame,
        Size = UDim2.new(0, 120, 0, 20),
        Position = UDim2.new(0, 70, 0, 15),
        BackgroundTransparency = 1,
        Text = localPlayer.Name,
        TextColor3 = Themes[Window.CurrentTheme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local UserId = Create("TextLabel", {
        Parent = UserInfoFrame,
        Size = UDim2.new(0, 120, 0, 16),
        Position = UDim2.new(0, 70, 0, 35),
        BackgroundTransparency = 1,
        Text = "ID: "..localPlayer.UserId,
        TextColor3 = Themes[Window.CurrentTheme].TextSecondary,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Tabs Container
    local TabsContainer = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(0, 180, 0, 260),
        Position = UDim2.new(0, 10, 0, 140),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.8
    })
    
    Create("UICorner", {Parent = TabsContainer, CornerRadius = UDim.new(0, 8)})
    
    local TabsScrolling = Create("ScrollingFrame", {
        Parent = TabsContainer,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        CanvasSize = UDim2.new(0, 0, 0, 0)
    })
    
    local UIListLayout = Create("UIListLayout", {
        Parent = TabsScrolling,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    -- Content Container
    local ContentContainer = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(0, 380, 0, 300),
        Position = UDim2.new(0, 200, 0, 90),
        BackgroundTransparency = 1,
        ClipsDescendants = true
    })
    
    -- Tab Highlight
    local TabHighlight = Create("Frame", {
        Parent = TabsContainer,
        Size = UDim2.new(1, -10, 0, 35),
        BackgroundColor3 = Themes[Window.CurrentTheme].Accent,
        BackgroundTransparency = 0.3,
        Visible = false
    })
    
    Create("UICorner", {Parent = TabHighlight, CornerRadius = UDim.new(0, 6)})
    
    -- Dragging Functionality
    local Dragging, DragInput, DragStart, StartPos
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = input.Position
            StartPos = MainFrame.Position
        end
    end)
    
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local delta = input.Position - DragStart
            MainFrame.Position = UDim2.new(
                StartPos.X.Scale, StartPos.X.Offset + delta.X,
                StartPos.Y.Scale, StartPos.Y.Offset + delta.Y
            )
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = false
        end
    end)
    
    -- Button Events
    MinimizeButton.MouseButton1Click:Connect(function()
        Window.Minimized = not Window.Minimized
        if Window.Minimized then
            Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 40)}, 0.3)
            Tween(UserInfoFrame, {BackgroundTransparency = 1}, 0.3)
            Tween(TabsContainer, {BackgroundTransparency = 1}, 0.3)
            Tween(ContentContainer, {BackgroundTransparency = 1}, 0.3)
        else
            Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 400)}, 0.3)
            Tween(UserInfoFrame, {BackgroundTransparency = 0}, 0.3)
            Tween(TabsContainer, {BackgroundTransparency = 0.2}, 0.3)
            Tween(ContentContainer, {BackgroundTransparency = 0}, 0.3)
        end
    end)
    
    FullScreenButton.MouseButton1Click:Connect(function()
        Window.FullScreen = not Window.FullScreen
        if Window.FullScreen then
            Tween(MainFrame, {Size = UDim2.new(1, -20, 1, -20), Position = UDim2.new(0, 10, 0, 10)}, 0.3)
            FullScreenIcon.Image = Icons.fullscreen_exit
        else
            Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 400), Position = UDim2.new(0.5, -300, 0.5, -200)}, 0.3)
            FullScreenIcon.Image = Icons.fullscreen
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        Tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        wait(0.3)
        ScreenGui:Destroy()
    end)
    
    -- Search Functionality
    SearchBox.Focused:Connect(function()
        if SearchBox.Text == "Search..." then
            SearchBox.Text = ""
        end
    end)
    
    SearchBox.FocusLost:Connect(function()
        if SearchBox.Text == "" then
            SearchBox.Text = "Search..."
        end
    end)
    
    -- Store References
    Window.ScreenGui = ScreenGui
    Window.MainFrame = MainFrame
    Window.TabsContainer = TabsScrolling
    Window.ContentContainer = ContentContainer
    Window.TabHighlight = TabHighlight
    Window.UIListLayout = UIListLayout
    
    return Window
end

-- Tab Functions
function NazuX:AddTab(name, icon)
    local Tab = {
        Name = name,
        Buttons = {},
        Toggles = {},
        Dropdowns = {},
        Sections = {}
    }
    
    -- Tab Button
    local TabButton = Create("TextButton", {
        Parent = self.TabsContainer,
        Size = UDim2.new(1, -10, 0, 35),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false
    })
    
    local TabButtonFrame = Create("Frame", {
        Parent = TabButton,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Themes[self.CurrentTheme].Secondary,
        BackgroundTransparency = 0.5
    })
    
    Create("UICorner", {Parent = TabButtonFrame, CornerRadius = UDim.new(0, 6)})
    
    local TabIcon = Create("ImageLabel", {
        Parent = TabButtonFrame,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 10, 0.5, -10),
        BackgroundTransparency = 1,
        Image = Icons[icon] or Icons.home,
        ImageColor3 = Themes[self.CurrentTheme].Text
    })
    
    local TabLabel = Create("TextLabel", {
        Parent = TabButtonFrame,
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 40, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = Themes[self.CurrentTheme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Tab Content
    local TabContent = Create("ScrollingFrame", {
        Parent = self.ContentContainer,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Visible = false
    })
    
    local ContentLayout = Create("UIListLayout", {
        Parent = TabContent,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    })
    
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
    end)
    
    -- Tab Click Event
    TabButton.MouseButton1Click:Connect(function()
        self:SwitchTab(Tab)
    end)
    
    -- Store References
    Tab.Button = TabButton
    Tab.Content = TabContent
    Tab.ButtonFrame = TabButtonFrame
    Tab.Label = TabLabel
    Tab.Icon = TabIcon
    
    table.insert(self.Tabs, Tab)
    self.TabsContainer.CanvasSize = UDim2.new(0, 0, 0, self.UIListLayout.AbsoluteContentSize.Y)
    
    return Tab
end

function NazuX:SwitchTab(tab)
    if self.CurrentTab then
        self.CurrentTab.Content.Visible = false
        Tween(self.CurrentTab.ButtonFrame, {BackgroundColor3 = Themes[self.CurrentTheme].Secondary}, 0.2)
        Tween(self.CurrentTab.Icon, {ImageColor3 = Themes[self.CurrentTheme].Text}, 0.2)
        Tween(self.CurrentTab.Label, {TextColor3 = Themes[self.CurrentTheme].Text}, 0.2)
    end
    
    self.CurrentTab = tab
    tab.Content.Visible = true
    
    -- Show and Move Highlight
    self.TabHighlight.Visible = true
    Tween(self.TabHighlight, {Position = tab.Button.Position}, 0.3)
    
    -- Change Button Appearance
    Tween(tab.ButtonFrame, {BackgroundColor3 = Themes[self.CurrentTheme].Accent}, 0.2)
    Tween(tab.Icon, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
    Tween(tab.Label, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
    
    -- Rotate Icon Animation
    Tween(tab.Icon, {Rotation = 360}, 0.5)
    wait(0.5)
    tab.Icon.Rotation = 0
end

-- UI Elements
function NazuX:AddButton(tab, options)
    options = options or {}
    local Button = {
        Name = options.Name or "Button",
        Callback = options.Callback or function() end
    }
    
    local ButtonFrame = Create("Frame", {
        Parent = tab.Content,
        Size = UDim2.new(1, -20, 0, 40),
        BackgroundColor3 = Themes[self.CurrentTheme].Secondary,
        LayoutOrder = #tab.Buttons + 1
    })
    
    Create("UICorner", {Parent = ButtonFrame, CornerRadius = UDim.new(0, 6)})
    
    local ButtonLabel = Create("TextLabel", {
        Parent = ButtonFrame,
        Size = UDim2.new(0.7, 0, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = Button.Name,
        TextColor3 = Themes[self.CurrentTheme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local FingerprintIcon = Create("ImageLabel", {
        Parent = ButtonFrame,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(1, -30, 0.5, -10),
        BackgroundTransparency = 1,
        Image = Icons.fingerprint,
        ImageColor3 = Themes[self.CurrentTheme].TextSecondary
    })
    
    -- Button Interactions
    ButtonFrame.MouseEnter:Connect(function()
        Tween(ButtonFrame, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
        Tween(ButtonLabel, {TextColor3 = Color3.fromRGB(0, 0, 0)}, 0.2)
    end)
    
    ButtonFrame.MouseLeave:Connect(function()
        Tween(ButtonFrame, {BackgroundColor3 = Themes[self.CurrentTheme].Secondary}, 0.2)
        Tween(ButtonLabel, {TextColor3 = Themes[self.CurrentTheme].Text}, 0.2)
    end)
    
    ButtonFrame.MouseButton1Click:Connect(function()
        Button.Callback()
        Tween(ButtonFrame, {Size = UDim2.new(1, -25, 0, 35)}, 0.1)
        wait(0.1)
        Tween(ButtonFrame, {Size = UDim2.new(1, -20, 0, 40)}, 0.1)
    end)
    
    table.insert(tab.Buttons, Button)
    return Button
end

function NazuX:AddToggle(tab, options)
    options = options or {}
    local Toggle = {
        Name = options.Name or "Toggle",
        Default = options.Default or false,
        Callback = options.Callback or function() end,
        Value = options.Default or false
    }
    
    local ToggleFrame = Create("Frame", {
        Parent = tab.Content,
        Size = UDim2.new(1, -20, 0, 40),
        BackgroundColor3 = Themes[self.CurrentTheme].Secondary,
        LayoutOrder = #tab.Toggles + 1
    })
    
    Create("UICorner", {Parent = ToggleFrame, CornerRadius = UDim.new(0, 6)})
    
    local ToggleLabel = Create("TextLabel", {
        Parent = ToggleFrame,
        Size = UDim2.new(0.7, 0, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = Toggle.Name,
        TextColor3 = Themes[self.CurrentTheme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local ToggleButton = Create("Frame", {
        Parent = ToggleFrame,
        Size = UDim2.new(0, 40, 0, 20),
        Position = UDim2.new(1, -50, 0.5, -10),
        BackgroundColor3 = Themes[self.CurrentTheme].Main,
        BorderColor3 = Themes[self.CurrentTheme].Border
    })
    
    Create("UICorner", {Parent = ToggleButton, CornerRadius = UDim.new(1, 0)})
    
    local ToggleKnob = Create("Frame", {
        Parent = ToggleButton,
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = Toggle.Value and Themes[self.CurrentTheme].Accent or Themes[self.CurrentTheme].TextSecondary
    })
    
    Create("UICorner", {Parent = ToggleKnob, CornerRadius = UDim.new(1, 0)})
    
    local CheckIcon = Create("ImageLabel", {
        Parent = ToggleKnob,
        Size = UDim2.new(0, 12, 0, 12),
        Position = UDim2.new(0.5, -6, 0.5, -6),
        BackgroundTransparency = 1,
        Image = Icons.check,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        Visible = Toggle.Value
    })
    
    local function UpdateToggle()
        if Toggle.Value then
            Tween(ToggleKnob, {Position = UDim2.new(0, 22, 0.5, -8), BackgroundColor3 = Themes[self.CurrentTheme].Accent}, 0.2)
            CheckIcon.Visible = true
        else
            Tween(ToggleKnob, {Position = UDim2.new(0, 2, 0.5, -8), BackgroundColor3 = Themes[self.CurrentTheme].TextSecondary}, 0.2)
            CheckIcon.Visible = false
        end
        Toggle.Callback(Toggle.Value)
    end
    
    ToggleFrame.MouseButton1Click:Connect(function()
        Toggle.Value = not Toggle.Value
        UpdateToggle()
    end)
    
    UpdateToggle()
    table.insert(tab.Toggles, Toggle)
    return Toggle
end

function NazuX:AddSection(tab, name)
    local SectionFrame = Create("Frame", {
        Parent = tab.Content,
        Size = UDim2.new(1, -20, 0, 30),
        BackgroundTransparency = 1,
        LayoutOrder = #tab.Sections + 1
    })
    
    local SectionLabel = Create("TextLabel", {
        Parent = SectionFrame,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = Themes[self.CurrentTheme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Center
    })
    
    local SectionLine = Create("Frame", {
        Parent = SectionFrame,
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 1, -1),
        BackgroundColor3 = Themes[self.CurrentTheme].Border
    })
    
    return {Name = name}
end

-- Theme Functions
function NazuX:ChangeTheme(themeName)
    if Themes[themeName] then
        self.CurrentTheme = themeName
        -- Theme change logic here
    end
end

return NazuX
