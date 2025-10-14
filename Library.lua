-- NazuX Library - Enhanced with Subtitle, Size, Logo, Keybind, Flame Loading
local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Colors
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
    local Keybind = options.Keybind or Enum.KeyCode.RightControl
    local Logo = options.Logo or "rbxassetid://7733960981" -- Default logo
    
    local NazuXLibrary = {}
    local UIEnabled = true
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        ResetOnSpawn = false
    })
    
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
    end
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Flame Loading Screen
    local LoadingScreen = Create("Frame", {
        Name = "LoadingScreen",
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        BackgroundTransparency = 0.1,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 20,
        Parent = ScreenGui
    })
    
    local LoadingContainer = Create("Frame", {
        Name = "LoadingContainer",
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 150, 0, 150),
        ZIndex = 21,
        Parent = LoadingScreen
    })
    
    local LoadingUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 20),
        Parent = LoadingContainer
    })
    
    -- Flame Loading Animation
    local FlameParticles = Create("Frame", {
        Name = "FlameParticles",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 80, 0, 80),
        ZIndex = 22,
        Parent = LoadingContainer
    })
    
    -- Create multiple flame particles
    local flameColors = {
        Color3.fromRGB(255, 100, 0),
        Color3.fromRGB(255, 150, 0),
        Color3.fromRGB(255, 200, 0),
        Color3.fromRGB(255, 255, 100)
    }
    
    local flames = {}
    for i = 1, 8 do
        local flame = Create("Frame", {
            Name = "Flame"..i,
            BackgroundColor3 = flameColors[math.random(1, #flameColors)],
            BorderSizePixel = 0,
            Size = UDim2.new(0, math.random(8, 15), 0, math.random(8, 15)),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            ZIndex = 23,
            Parent = FlameParticles
        })
        
        local flameCorner = Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = flame
        })
        
        table.insert(flames, flame)
    end
    
    local LoadingText = Create("TextLabel", {
        Name = "LoadingText",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.8, 0),
        Size = UDim2.new(0.8, 0, 0, 20),
        Font = Enum.Font.GothamSemibold,
        Text = "Loading NazuX...",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        ZIndex = 22,
        Parent = LoadingContainer
    })
    
    -- Main Container (Hidden initially)
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BorderSizePixel = 0,
        Position = Position,
        Size = Size,
        Active = true,
        Draggable = true,
        Visible = false, -- Hidden until loading completes
        Parent = ScreenGui
    })
    
    local UICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    -- Title Bar with Logo
    local TopFrame = Create("Frame", {
        Name = "TopFrame",
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 50), -- Increased height for logo
        Parent = MainFrame
    })
    
    local UICornerTop = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = TopFrame
    })
    
    -- Rectangular Logo (Left side)
    local LogoImage = Create("ImageLabel", {
        Name = "LogoImage",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 5),
        Size = UDim2.new(0, 40, 0, 40), -- Rectangular size
        Image = Logo,
        Parent = TopFrame
    })
    
    local LogoUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6), -- Slightly rounded corners for rectangle
        Parent = LogoImage
    })
    
    -- Title and Subtitle (Next to logo)
    local Title = Create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 60, 0, 8),
        Size = UDim2.new(0, 200, 0, 20),
        Font = Enum.Font.GothamBold,
        Text = WindowName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopFrame
    })
    
    local Subtitle = Create("TextLabel", {
        Name = "Subtitle",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 60, 0, 28),
        Size = UDim2.new(0, 200, 0, 15),
        Font = Enum.Font.Gotham,
        Text = SubtitleText,
        TextColor3 = Color3.fromRGB(200, 200, 200),
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopFrame
    })
    
    -- Keybind Display
    local KeybindLabel = Create("TextLabel", {
        Name = "KeybindLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, -50, 0, 15),
        Size = UDim2.new(0, 100, 0, 20),
        Font = Enum.Font.Gotham,
        Text = "Keybind: " .. tostring(Keybind):gsub("Enum.KeyCode.", ""),
        TextColor3 = Color3.fromRGB(150, 150, 150),
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = TopFrame
    })
    
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        BorderSizePixel = 0,
        Position = UDim2.new(1, -30, 0, 15),
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
        Position = UDim2.new(0, 0, 0, 50), -- Adjusted for taller titlebar
        Size = UDim2.new(1, 0, 1, -50),
        Parent = MainFrame
    })
    
    -- Left Sidebar
    local LeftSidebar = Create("Frame", {
        Name = "LeftSidebar",
        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 180, 1, 0),
        Parent = ContentArea
    })
    
    local SidebarUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = LeftSidebar
    })
    
    -- User Info
    local UserInfoFrame = Create("Frame", {
        Name = "UserInfoFrame",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BorderSizePixel = 0,
        Size = UDim2.new(1, -10, 0, 80),
        Position = UDim2.new(0, 5, 0, 5),
        Parent = LeftSidebar
    })
    
    local UserInfoUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = UserInfoFrame
    })
    
    local Avatar = Create("ImageLabel", {
        Name = "Avatar",
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 10),
        Size = UDim2.new(0, 40, 0, 40),
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=150&height=150&format=png",
        Parent = UserInfoFrame
    })
    
    local AvatarUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 20),
        Parent = Avatar
    })
    
    local UsernameLabel = Create("TextLabel", {
        Name = "UsernameLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 60, 0, 15),
        Size = UDim2.new(1, -65, 0, 20),
        Font = Enum.Font.GothamSemibold,
        Text = LocalPlayer.Name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = UserInfoFrame
    })
    
    local UserIdLabel = Create("TextLabel", {
        Name = "UserIdLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 60, 0, 35),
        Size = UDim2.new(1, -65, 0, 15),
        Font = Enum.Font.Gotham,
        Text = "ID: "..LocalPlayer.UserId,
        TextColor3 = Color3.fromRGB(200, 200, 200),
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = UserInfoFrame
    })
    
    -- Search Bar
    local SearchContainer = Create("Frame", {
        Name = "SearchContainer",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BorderSizePixel = 0,
        Size = UDim2.new(1, -10, 0, 35),
        Position = UDim2.new(0, 5, 0, 90),
        Parent = LeftSidebar
    })
    
    local SearchUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = SearchContainer
    })
    
    local SearchBox = Create("TextBox", {
        Name = "SearchBox",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(1, -40, 1, 0),
        Font = Enum.Font.Gotham,
        PlaceholderText = "Search tabs...",
        PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
        Text = "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SearchContainer
    })
    
    -- Tabs Container
    local TabsContainer = Create("ScrollingFrame", {
        Name = "TabsContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 5, 0, 130),
        Size = UDim2.new(1, -10, 1, -135),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60),
        Parent = LeftSidebar
    })
    
    local TabsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        Parent = TabsContainer
    })
    
    -- Main Content Area
    local MainContent = Create("Frame", {
        Name = "MainContent",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 185, 0, 0),
        Size = UDim2.new(1, -185, 1, 0),
        Parent = ContentArea
    })
    
    -- Flame Loading Animation
    local flameConnections = {}
    local function StartFlameAnimation()
        for i, flame in ipairs(flames) do
            local connection = RunService.Heartbeat:Connect(function(delta)
                local time = tick() + (i * 0.2)
                local x = math.cos(time * 2) * 20
                local y = math.sin(time * 3) * 25 - 10
                local scale = 0.8 + math.sin(time * 4) * 0.3
                local transparency = 0.3 + math.sin(time * 5) * 0.3
                
                flame.Position = UDim2.new(0.5, x, 0.5, y)
                flame.Size = UDim2.new(0, 10 * scale, 0, 10 * scale)
                flame.BackgroundTransparency = transparency
            end)
            table.insert(flameConnections, connection)
        end
    end
    
    local function StopFlameAnimation()
        for _, connection in ipairs(flameConnections) do
            connection:Disconnect()
        end
        flameConnections = {}
    end
    
    -- Keybind Functionality
    local keybindConnection
    local function SetupKeybind()
        if keybindConnection then
            keybindConnection:Disconnect()
        end
        
        keybindConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Keybind then
                NazuXLibrary:ToggleUI()
            end
        end)
    end
    
    -- Button Events
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        StopFlameAnimation()
        if keybindConnection then
            keybindConnection:Disconnect()
        end
    end)
    
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(240, 80, 80)}, 0.2)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(220, 60, 60)}, 0.2)
    end)
    
    -- Search Functionality
    local function FilterTabs(searchText)
        for _, tabButton in pairs(TabsContainer:GetChildren()) do
            if tabButton:IsA("TextButton") then
                local tabName = tabButton.Name:gsub("TabButton", "")
                if string.find(string.lower(tabName), string.lower(searchText)) or searchText == "" then
                    tabButton.Visible = true
                else
                    tabButton.Visible = false
                end
            end
        end
    end
    
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        FilterTabs(SearchBox.Text)
    end)
    
    -- Tab Management
    local CurrentTab = nil
    
    function NazuXLibrary:CreateTab(TabName)
        local TabButton = Create("TextButton", {
            Name = TabName .. "TabButton",
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 35),
            Font = Enum.Font.Gotham,
            Text = TabName,
            TextColor3 = Color3.fromRGB(200, 200, 200),
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
            ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60),
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
                        Tween(btn, {BackgroundColor3 = Color3.fromRGB(50, 50, 50), TextColor3 = Color3.fromRGB(200, 200, 200)}, 0.2)
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
                Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}, 0.2)
            end
        end)
        
        local TabFunctions = {}
        
        function TabFunctions:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            local ButtonName = ButtonConfig.Name or "Button"
            local Callback = ButtonConfig.Callback or function() end
            
            local ButtonContainer = Create("Frame", {
                Name = ButtonName .. "Container",
                BackgroundColor3 = Color3.fromRGB(45, 45, 45),
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
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 12,
                Parent = ButtonContainer
            })
            
            Button.MouseButton1Click:Connect(function()
                Callback()
                Tween(ButtonContainer, {BackgroundColor3 = AccentColor}, 0.1)
                wait(0.1)
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}, 0.1)
            end)
            
            Button.MouseEnter:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}, 0.2)
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
    
    -- Library Functions
    function NazuXLibrary:ToggleUI()
        UIEnabled = not UIEnabled
        MainFrame.Visible = UIEnabled
    end
    
    function NazuXLibrary:SetKeybind(newKeybind)
        Keybind = newKeybind
        KeybindLabel.Text = "Keybind: " .. tostring(Keybind):gsub("Enum.KeyCode.", "")
        SetupKeybind()
    end
    
    -- Start Loading Animation
    StartFlameAnimation()
    
    -- Auto-hide loading after 1 second
    delay(1, function()
        StopFlameAnimation()
        Tween(LoadingScreen, {BackgroundTransparency = 1}, 0.5)
        wait(0.5)
        LoadingScreen.Visible = false
        MainFrame.Visible = true
    end)
    
    -- Setup Keybind
    SetupKeybind()
    
    return NazuXLibrary
end

return NazuX
