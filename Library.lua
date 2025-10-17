--[[
    ███╗   ██╗ █████╗ ███████╗██╗   ██╗██╗  ██╗
    ████╗  ██║██╔══██╗╚══███╔╝██║   ██║╚██╗██╔╝
    ██╔██╗ ██║███████║  ███╔╝ ██║   ██║ ╚███╔╝ 
    ██║╚██╗██║██╔══██║ ███╔╝  ██║   ██║ ██╔██╗ 
    ██║ ╚████║██║  ██║███████╗╚██████╔╝██╔╝ ██╗
    ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
    
    NazuX Library - Complete Advanced UI Library
    Version: 2.0.0 | Created with ❤️ for Roblox Developers
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

-- Local Variables
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Advanced Icon System (Lucide Icons)
local Icons = {
    -- Main Icons
    Logo = "rbxassetid://10709761813",
    Search = "rbxassetid://10734943674",
    Fingerprint = "rbxassetid://10723375250",
    Home = "rbxassetid://10723407389",
    Settings = "rbxassetid://10734950309",
    Scripts = "rbxassetid://10734951038",
    Player = "rbxassetid://10747373176",
    Check = "rbxassetid://10709790644",
    Dropdown = "rbxassetid://10709791281",
    Theme = "rbxassetid://10734910430",
    Minimize = "rbxassetid://10734895698",
    Close = "rbxassetid://10747384394",
    
    -- Category Icons
    Game = "rbxassetid://10723395457",
    Visual = "rbxassetid://10723375128",
    Combat = "rbxassetid://10734975692",
    Movement = "rbxassetid://10709775894",
    Teleport = "rbxassetid://10734922971",
    Money = "rbxassetid://10709811110",
    Server = "rbxassetid://10734949856",
    Info = "rbxassetid://10723415903",
    
    -- Theme Icons
    Star = "rbxassetid://10734966248",
    Moon = "rbxassetid://10734897102",
    Sun = "rbxassetid://10734974297",
    Amoled = "rbxassetid://10734962068",
    Rose = "rbxassetid://10747830374",
    Light = "rbxassetid://10734974297",
    Dark = "rbxassetid://10734897102",
    Red = "rbxassetid://10723376114",
    Yellow = "rbxassetid://10734966248",
    
    -- Feature Icons
    Shield = "rbxassetid://10734975692",
    Zap = "rbxassetid://10709761813",
    Eye = "rbxassetid://10723375128",
    Rocket = "rbxassetid://10734922971",
    Crown = "rbxassetid://10734966248",
    Key = "rbxassetid://10723375250",
    Bell = "rbxassetid://10734950309",
    Heart = "rbxassetid://10747830374"
}

-- Advanced Color System with 12 Themes
local Colors = {
    Dark = {
        Background = Color3.fromRGB(25, 25, 25),
        Secondary = Color3.fromRGB(35, 35, 35),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(50, 50, 50),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    Light = {
        Background = Color3.fromRGB(245, 245, 245),
        Secondary = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(0, 0, 0),
        Border = Color3.fromRGB(220, 220, 220),
        Success = Color3.fromRGB(56, 142, 60),
        Warning = Color3.fromRGB(245, 124, 0),
        Error = Color3.fromRGB(211, 47, 47)
    },
    Red = {
        Background = Color3.fromRGB(35, 15, 15),
        Secondary = Color3.fromRGB(55, 25, 25),
        Accent = Color3.fromRGB(255, 60, 60),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(75, 35, 35),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    Yellow = {
        Background = Color3.fromRGB(35, 35, 15),
        Secondary = Color3.fromRGB(55, 55, 25),
        Accent = Color3.fromRGB(255, 255, 60),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(75, 75, 35),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    AMOLED = {
        Background = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(5, 5, 5),
        Accent = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(15, 15, 15),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    Rose = {
        Background = Color3.fromRGB(25, 15, 20),
        Secondary = Color3.fromRGB(40, 25, 33),
        Accent = Color3.fromRGB(255, 105, 180),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(55, 35, 45),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    Ocean = {
        Background = Color3.fromRGB(15, 25, 35),
        Secondary = Color3.fromRGB(25, 40, 55),
        Accent = Color3.fromRGB(0, 150, 255),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(35, 55, 75),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    Forest = {
        Background = Color3.fromRGB(15, 30, 20),
        Secondary = Color3.fromRGB(25, 45, 30),
        Accent = Color3.fromRGB(76, 175, 80),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(35, 60, 40),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    Purple = {
        Background = Color3.fromRGB(30, 20, 40),
        Secondary = Color3.fromRGB(45, 30, 60),
        Accent = Color3.fromRGB(147, 112, 219),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(60, 40, 80),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    Orange = {
        Background = Color3.fromRGB(40, 25, 15),
        Secondary = Color3.fromRGB(60, 35, 20),
        Accent = Color3.fromRGB(255, 165, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(80, 50, 30),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    Pink = {
        Background = Color3.fromRGB(40, 20, 35),
        Secondary = Color3.fromRGB(60, 30, 50),
        Accent = Color3.fromRGB(255, 105, 180),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(80, 40, 65),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    },
    Cyan = {
        Background = Color3.fromRGB(15, 30, 35),
        Secondary = Color3.fromRGB(25, 45, 55),
        Accent = Color3.fromRGB(0, 255, 255),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(35, 60, 75),
        Success = Color3.fromRGB(76, 175, 80),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(244, 67, 54)
    }
}

-- Advanced Utility Functions
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        if property == "Parent" then
            -- Delay parent assignment to avoid issues
            task.spawn(function()
                instance.Parent = value
            end)
        else
            instance[property] = value
        end
    end
    return instance
end

local function Tween(Object, Properties, Duration, Style, Direction)
    local TweenInfo = TweenInfo.new(Duration or 0.3, Style or Enum.EasingStyle.Quad, Direction or Enum.EasingDirection.Out)
    local Tween = TweenService:Create(Object, TweenInfo, Properties)
    Tween:Play()
    return Tween
end

local function CreateShadow(parent, sizeOffset, positionOffset)
    local Shadow = Create("ImageLabel", {
        Parent = parent,
        Name = "Shadow",
        Size = UDim2.new(1, sizeOffset, 1, sizeOffset),
        Position = UDim2.new(0, positionOffset, 0, positionOffset),
        BackgroundTransparency = 1,
        Image = "rbxassetid://1316045217",
        ImageColor3 = Color3.new(0, 0, 0),
        ImageTransparency = 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
        ZIndex = -1
    })
    return Shadow
end

local function RippleEffect(button, mouse)
    local Ripple = Create("Frame", {
        Parent = button,
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 0.7,
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0, mouse.X - button.AbsolutePosition.X, 0, mouse.Y - button.AbsolutePosition.Y),
        ZIndex = 10
    })
    
    Create("UICorner", {
        Parent = Ripple,
        CornerRadius = UDim.new(1, 0)
    })
    
    Tween(Ripple, {Size = UDim2.new(0, 100, 0, 100), Position = UDim2.new(0, mouse.X - button.AbsolutePosition.X - 50, 0, mouse.Y - button.AbsolutePosition.Y - 50), BackgroundTransparency = 1}, 0.6)
    
    task.delay(0.6, function()
        Ripple:Destroy()
    end)
end

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    
    -- Default values with validation
    local windowSize = options.Size or UDim2.new(0, 650, 0, 450)
    local windowTitle = options.Title or "NazuX Library"
    local windowIcon = options.Icon or Icons.Logo
    local windowTheme = options.Theme or "Dark"
    local enableBlur = options.Blur or false
    local enableSounds = options.Sounds or false
    
    -- Validate theme
    if not Colors[windowTheme] then
        windowTheme = "Dark"
        warn("Invalid theme specified. Using Dark theme instead.")
    end
    
    local Window = {
        Tabs = {},
        CurrentTab = nil,
        Minimized = false,
        CurrentTheme = windowTheme,
        Elements = {},
        Config = {
            Blur = enableBlur,
            Sounds = enableSounds,
            Version = "2.0.0"
        }
    }
    
    setmetatable(Window, self)
    
    -- Generate unique ID for multiple instances
    local libraryId = HttpService:GenerateGUID(false):sub(1, 8)
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary_" .. libraryId,
        DisplayOrder = options.DisplayOrder or 10,
        ResetOnSpawn = false
    })
    
    -- Blur Effect (Optional)
    if enableBlur then
        local BlurEffect = Create("BlurEffect", {
            Parent = ScreenGui,
            Name = "BackgroundBlur",
            Size = UDim2.new(1, 0, 1, 0),
            BlurSize = 8
        })
    end
    
    -- Main Container
    local MainFrame = Create("Frame", {
        Parent = ScreenGui,
        Size = windowSize,
        Position = UDim2.new(0.5, -windowSize.X.Offset/2, 0.5, -windowSize.Y.Offset/2),
        BackgroundColor3 = Colors[Window.CurrentTheme].Background,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    Create("UICorner", {
        Parent = MainFrame,
        CornerRadius = UDim.new(0, 12)
    })
    
    -- Advanced Shadow Effect
    local MainShadow = CreateShadow(ScreenGui, 20, -10)
    MainShadow.Size = UDim2.new(0, windowSize.X.Offset + 20, 0, windowSize.Y.Offset + 20)
    MainShadow.Position = UDim2.new(0.5, -(windowSize.X.Offset + 20)/2, 0.5, -(windowSize.Y.Offset + 20)/2)
    
    -- Title Bar with Advanced Design
    local TitleBar = Create("Frame", {
        Parent = MainFrame,
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = TitleBar,
        CornerRadius = UDim.new(0, 12)
    })
    
    -- Gradient Effect for Title Bar
    local TitleGradient = Create("UIGradient", {
        Parent = TitleBar,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Colors[Window.CurrentTheme].Secondary),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(
                Colors[Window.CurrentTheme].Secondary.R * 0.9,
                Colors[Window.CurrentTheme].Secondary.G * 0.9,
                Colors[Window.CurrentTheme].Secondary.B * 0.9
            ))
        }),
        Rotation = 90
    })
    
    -- Icon with Hover Effect
    local LogoContainer = Create("Frame", {
        Parent = TitleBar,
        Name = "LogoContainer",
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(0, 8, 0.5, -17.5),
        BackgroundTransparency = 1
    })
    
    local Logo = Create("ImageLabel", {
        Parent = LogoContainer,
        Name = "Logo",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Image = windowIcon,
        ImageColor3 = Colors[Window.CurrentTheme].Accent,
        ScaleType = Enum.ScaleType.Fit
    })
    
    -- Animated Logo
    task.spawn(function()
        while Logo and Logo.Parent do
            Tween(Logo, {Rotation = 5}, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(2)
            Tween(Logo, {Rotation = -5}, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(2)
            Tween(Logo, {Rotation = 0}, 1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(2)
        end
    end)
    
    -- Title with Glow Effect
    local TitleContainer = Create("Frame", {
        Parent = TitleBar,
        Name = "TitleContainer",
        Size = UDim2.new(1, -160, 1, 0),
        Position = UDim2.new(0, 50, 0, 0),
        BackgroundTransparency = 1
    })
    
    local Title = Create("TextLabel", {
        Parent = TitleContainer,
        Name = "Title",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = windowTitle,
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center
    })
    
    -- Title Glow Effect
    local TitleGlow = Create("TextLabel", {
        Parent = TitleContainer,
        Name = "TitleGlow",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = windowTitle,
        TextColor3 = Colors[Window.CurrentTheme].Accent,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextTransparency = 0.8,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = -1
    })
    
    -- Control Buttons Container
    local ControlButtons = Create("Frame", {
        Parent = TitleBar,
        Name = "ControlButtons",
        Size = UDim2.new(0, 80, 1, 0),
        Position = UDim2.new(1, -85, 0, 0),
        BackgroundTransparency = 1
    })
    
    -- Minimize Button with Icon
    local MinimizeButton = Create("TextButton", {
        Parent = ControlButtons,
        Name = "MinimizeButton",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 5, 0.5, -15),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("UICorner", {
        Parent = MinimizeButton,
        CornerRadius = UDim.new(0, 6)
    })
    
    local MinimizeIcon = Create("ImageLabel", {
        Parent = MinimizeButton,
        Name = "MinimizeIcon",
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(0.5, -9, 0.5, -9),
        BackgroundTransparency = 1,
        Image = Icons.Minimize,
        ImageColor3 = Colors[Window.CurrentTheme].Text
    })
    
    -- Close Button with Icon
    local CloseButton = Create("TextButton", {
        Parent = ControlButtons,
        Name = "CloseButton",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 45, 0.5, -15),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("UICorner", {
        Parent = CloseButton,
        CornerRadius = UDim.new(0, 6)
    })
    
    local CloseIcon = Create("ImageLabel", {
        Parent = CloseButton,
        Name = "CloseIcon",
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(0.5, -9, 0.5, -9),
        BackgroundTransparency = 1,
        Image = Icons.Close,
        ImageColor3 = Colors[Window.CurrentTheme].Text
    })
    
    -- User Info Section (Optional)
    local UserInfoFrame = Create("Frame", {
        Parent = MainFrame,
        Name = "UserInfo",
        Size = UDim2.new(1, -20, 0, 70),
        Position = UDim2.new(0, 10, 0, 55),
        BackgroundTransparency = 1
    })
    
    -- User Avatar with Border
    local AvatarContainer = Create("Frame", {
        Parent = UserInfoFrame,
        Name = "AvatarContainer",
        Size = UDim2.new(0, 55, 0, 55),
        BackgroundTransparency = 1
    })
    
    local Avatar = Create("ImageLabel", {
        Parent = AvatarContainer,
        Name = "Avatar",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Colors[Window.CurrentTheme].Border,
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=150&height=150&format=png",
        ScaleType = Enum.ScaleType.Crop
    })
    
    Create("UICorner", {
        Parent = Avatar,
        CornerRadius = UDim.new(1, 0)
    })
    
    -- Animated Avatar Border
    local AvatarBorder = Create("Frame", {
        Parent = AvatarContainer,
        Name = "AvatarBorder",
        Size = UDim2.new(1, 4, 1, 4),
        Position = UDim2.new(0, -2, 0, -2),
        BackgroundColor3 = Colors[Window.CurrentTheme].Accent,
        BackgroundTransparency = 0.3,
        ZIndex = -1
    })
    
    Create("UICorner", {
        Parent = AvatarBorder,
        CornerRadius = UDim.new(1, 0)
    })
    
    -- User Info Text
    local UserInfoText = Create("Frame", {
        Parent = UserInfoFrame,
        Name = "UserInfoText",
        Size = UDim2.new(1, -65, 1, 0),
        Position = UDim2.new(0, 65, 0, 0),
        BackgroundTransparency = 1
    })
    
    local UserName = Create("TextLabel", {
        Parent = UserInfoText,
        Name = "UserName",
        Size = UDim2.new(1, 0, 0, 25),
        BackgroundTransparency = 1,
        Text = LocalPlayer.DisplayName or LocalPlayer.Name,
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom
    })
    
    local UserId = Create("TextLabel", {
        Parent = UserInfoText,
        Name = "UserId",
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 25),
        BackgroundTransparency = 1,
        Text = "@" .. LocalPlayer.Name .. " • ID: " .. LocalPlayer.UserId,
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextTransparency = 0.5,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top
    })
    
    -- Search Bar with Advanced Features
    local SearchContainer = Create("Frame", {
        Parent = MainFrame,
        Name = "SearchContainer",
        Size = UDim2.new(1, -20, 0, 40),
        Position = UDim2.new(0, 10, 0, 135),
        BackgroundTransparency = 1
    })
    
    local SearchFrame = Create("Frame", {
        Parent = SearchContainer,
        Name = "SearchFrame",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = SearchFrame,
        CornerRadius = UDim.new(0, 8)
    })
    
    local SearchIcon = Create("ImageLabel", {
        Parent = SearchFrame,
        Name = "SearchIcon",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 12, 0.5, -10),
        BackgroundTransparency = 1,
        Image = Icons.Search,
        ImageColor3 = Colors[Window.CurrentTheme].Text
    })
    
    local SearchBox = Create("TextBox", {
        Parent = SearchFrame,
        Name = "SearchBox",
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.new(0, 40, 0, 0),
        BackgroundTransparency = 1,
        PlaceholderText = "Tìm kiếm tính năng...",
        PlaceholderColor3 = Colors[Window.CurrentTheme].Text,
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false
    })
    
    local SearchClear = Create("TextButton", {
        Parent = SearchFrame,
        Name = "SearchClear",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(1, -30, 0.5, -10),
        BackgroundTransparency = 1,
        Text = "×",
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        Visible = false
    })
    
    -- Main Content Area
    local MainContent = Create("Frame", {
        Parent = MainFrame,
        Name = "MainContent",
        Size = UDim2.new(1, -20, 1, -185),
        Position = UDim2.new(0, 10, 0, 185),
        BackgroundTransparency = 1
    })
    
    -- Tab Navigation with Advanced Design
    local TabNavigation = Create("Frame", {
        Parent = MainContent,
        Name = "TabNavigation",
        Size = UDim2.new(0, 160, 1, -50), -- Space for theme button
        BackgroundTransparency = 1
    })
    
    local TabContainer = Create("ScrollingFrame", {
        Parent = TabNavigation,
        Name = "TabContainer",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Colors[Window.CurrentTheme].Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    local TabListLayout = Create("UIListLayout", {
        Parent = TabContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8)
    })
    
    Create("UIPadding", {
        Parent = TabContainer,
        PaddingTop = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5)
    })
    
    -- Content Area
    local ContentArea = Create("Frame", {
        Parent = MainContent,
        Name = "ContentArea",
        Size = UDim2.new(1, -170, 1, 0),
        Position = UDim2.new(0, 170, 0, 0),
        BackgroundTransparency = 1
    })
    
    local ContentContainer = Create("Frame", {
        Parent = ContentArea,
        Name = "ContentContainer",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    Create("UICorner", {
        Parent = ContentContainer,
        CornerRadius = UDim.new(0, 12)
    })
    
    local ContentScrolling = Create("ScrollingFrame", {
        Parent = ContentContainer,
        Name = "ContentScrolling",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 5,
        ScrollBarImageColor3 = Colors[Window.CurrentTheme].Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    local ContentLayout = Create("UIListLayout", {
        Parent = ContentScrolling,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 12)
    })
    
    local ContentPadding = Create("UIPadding", {
        Parent = ContentScrolling,
        PaddingTop = UDim.new(0, 15),
        PaddingLeft = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15),
        PaddingBottom = UDim.new(0, 15)
    })
    
    -- Advanced Theme Switcher at Bottom
    local ThemeSection = Create("Frame", {
        Parent = MainContent,
        Name = "ThemeSection",
        Size = UDim2.new(0, 160, 0, 45),
        Position = UDim2.new(0, 0, 1, -45),
        BackgroundTransparency = 1
    })
    
    local ThemeButton = Create("TextButton", {
        Parent = ThemeSection,
        Name = "ThemeButton",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("UICorner", {
        Parent = ThemeButton,
        CornerRadius = UDim.new(0, 8)
    })
    
    local ThemeIcon = Create("ImageLabel", {
        Parent = ThemeButton,
        Name = "ThemeIcon",
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(0, 12, 0.5, -11),
        BackgroundTransparency = 1,
        Image = Icons.Theme,
        ImageColor3 = Colors[Window.CurrentTheme].Text
    })
    
    local ThemeLabel = Create("TextLabel", {
        Parent = ThemeButton,
        Name = "ThemeLabel",
        Size = UDim2.new(1, -45, 1, 0),
        Position = UDim2.new(0, 40, 0, 0),
        BackgroundTransparency = 1,
        Text = "Đổi Theme",
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local ThemeValue = Create("TextLabel", {
        Parent = ThemeButton,
        Name = "ThemeValue",
        Size = UDim2.new(0, 60, 0, 14),
        Position = UDim2.new(1, -65, 0.5, -7),
        BackgroundTransparency = 1,
        Text = Window.CurrentTheme,
        TextColor3 = Colors[Window.CurrentTheme].Accent,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right
    })
    
    -- Loading Screen with Advanced Animation
    local LoadingScreen = Create("Frame", {
        Parent = ScreenGui,
        Name = "LoadingScreen",
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Colors[Window.CurrentTheme].Background,
        Visible = true,
        ZIndex = 100
    })
    
    local LoadingContainer = Create("Frame", {
        Parent = LoadingScreen,
        Name = "LoadingContainer",
        Size = UDim2.new(0, 200, 0, 120),
        Position = UDim2.new(0.5, -100, 0.5, -60),
        BackgroundTransparency = 1
    })
    
    -- Animated Loading Spinner
    local LoadingSpinner = Create("Frame", {
        Parent = LoadingContainer,
        Name = "LoadingSpinner",
        Size = UDim2.new(0, 60, 0, 60),
        Position = UDim2.new(0.5, -30, 0, 0),
        BackgroundColor3 = Colors[Window.CurrentTheme].Accent,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = LoadingSpinner,
        CornerRadius = UDim.new(1, 0)
    })
    
    local LoadingText = Create("TextLabel", {
        Parent = LoadingContainer,
        Name = "LoadingText",
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 1, -30),
        BackgroundTransparency = 1,
        Text = "Đang tải NazuX Library...",
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Center
    })
    
    -- Loading Animation
    local LoadingRotation = 0
    local LoadingConnection = RunService.RenderStepped:Connect(function(delta)
        LoadingRotation = (LoadingRotation + 180 * delta) % 360
        LoadingSpinner.Rotation = LoadingRotation
    end)
    
    -- Simulate loading process
    task.spawn(function()
        local steps = {"Khởi tạo...", "Tải giao diện...", "Thiết lập hệ thống...", "Hoàn tất!"}
        for i, step in ipairs(steps) do
            LoadingText.Text = step
            task.wait(0.5)
        end
        task.wait(0.5)
        LoadingScreen.Visible = false
        LoadingConnection:Disconnect()
    end)
    
    -- Advanced Button Hover Effects System
    local function SetupAdvancedButtonHover(button, config)
        config = config or {}
        local icon = config.Icon
        local label = config.Label
        
        button.MouseEnter:Connect(function()
            RippleEffect(button, Mouse)
            Tween(button, {BackgroundColor3 = Colors[Window.CurrentTheme].Accent}, 0.2)
            if icon then
                Tween(icon, {ImageColor3 = Color3.new(1, 1, 1)}, 0.2)
            end
            if label then
                Tween(label, {TextColor3 = Color3.new(1, 1, 1)}, 0.2)
            end
        end)
        
        button.MouseLeave:Connect(function()
            Tween(button, {BackgroundColor3 = Colors[Window.CurrentTheme].Secondary}, 0.2)
            if icon then
                Tween(icon, {ImageColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
            end
            if label then
                Tween(label, {TextColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
            end
        end)
    end
    
    -- Setup control buttons
    SetupAdvancedButtonHover(MinimizeButton, {Icon = MinimizeIcon})
    SetupAdvancedButtonHover(CloseButton, {Icon = CloseIcon})
    SetupAdvancedButtonHover(ThemeButton, {Icon = ThemeIcon, Label = ThemeLabel})
    
    -- Window Control Functions
    MinimizeButton.MouseButton1Click:Connect(function()
        Window.Minimized = not Window.Minimized
        if Window.Minimized then
            Tween(MainFrame, {Size = UDim2.new(0, windowSize.X.Offset, 0, 45)}, 0.3)
            Tween(MainShadow, {Size = UDim2.new(0, windowSize.X.Offset + 20, 0, 65)}, 0.3)
        else
            Tween(MainFrame, {Size = windowSize}, 0.3)
            Tween(MainShadow, {Size = UDim2.new(0, windowSize.X.Offset + 20, 0, windowSize.Y.Offset + 20)}, 0.3)
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        -- Close animation
        Tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        Tween(MainShadow, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        Tween(MainFrame, {BackgroundTransparency = 1}, 0.3)
        task.wait(0.3)
        ScreenGui:Destroy()
    end)
    
    -- Advanced Search Functionality
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = SearchBox.Text:lower()
        SearchClear.Visible = #searchText > 0
        
        -- Search through all elements
        for _, tabData in pairs(Window.Tabs) do
            local hasVisibleElements = false
            for _, element in pairs(tabData.Elements) do
                if element:IsA("TextLabel") or element:IsA("TextButton") then
                    local elementText = element.Text:lower()
                    if elementText:find(searchText, 1, true) then
                        element.Visible = true
                        Tween(element, {TextTransparency = 0}, 0.2)
                        hasVisibleElements = true
                    else
                        Tween(element, {TextTransparency = 0.7}, 0.2)
                        element.Visible = false
                    end
                end
            end
            -- Hide empty tabs
            tabData.Content.Visible = hasVisibleElements and Window.CurrentTab == tabData
        end
    end)
    
    SearchClear.MouseButton1Click:Connect(function()
        SearchBox.Text = ""
        SearchClear.Visible = false
    end)
    
    -- Advanced Window Dragging System
    local Dragging, DragInput, DragStart, StartPos
    
    local function Update(input)
        local Delta = input.Position - DragStart
        local newX = StartPos.X.Offset + Delta.X
        local newY = StartPos.Y.Offset + Delta.Y
        
        -- Boundary checking
        newX = math.clamp(newX, 0, workspace.CurrentCamera.ViewportSize.X - windowSize.X.Offset)
        newY = math.clamp(newY, 0, workspace.CurrentCamera.ViewportSize.Y - windowSize.Y.Offset)
        
        MainFrame.Position = UDim2.new(0, newX, 0, newY)
        MainShadow.Position = UDim2.new(0, newX - 10, 0, newY - 10)
    end
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = input.Position
            StartPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            Update(input)
        end
    end)
    
    -- Advanced Theme System
    local themeIndex = 1
    local themeNames = {"Dark", "Light", "Red", "Yellow", "AMOLED", "Rose", "Ocean", "Forest", "Purple", "Orange", "Pink", "Cyan"}
    
    -- Find current theme position
    for i, name in ipairs(themeNames) do
        if name == Window.CurrentTheme then
            themeIndex = i
            break
        end
    end
    
    ThemeButton.MouseButton1Click:Connect(function()
        themeIndex = themeIndex + 1
        if themeIndex > #themeNames then
            themeIndex = 1
        end
        
        local newTheme = themeNames[themeIndex]
        ThemeValue.Text = newTheme
        Window:ChangeTheme(newTheme)
    end)
    
    -- Public Methods
    function Window:ChangeTheme(themeName)
        if Colors[themeName] then
            Window.CurrentTheme = themeName
            local theme = Colors[themeName]
            
            -- Update all UI elements with theme
            Tween(MainFrame, {BackgroundColor3 = theme.Background}, 0.3)
            Tween(TitleBar, {BackgroundColor3 = theme.Secondary}, 0.3)
            Tween(ContentContainer, {BackgroundColor3 = theme.Secondary}, 0.3)
            Tween(SearchFrame, {BackgroundColor3 = theme.Secondary}, 0.3)
            
            -- Update control buttons
            Tween(MinimizeButton, {BackgroundColor3 = theme.Secondary}, 0.3)
            Tween(CloseButton, {BackgroundColor3 = theme.Secondary}, 0.3)
            Tween(ThemeButton, {BackgroundColor3 = theme.Secondary}, 0.3)
            
            -- Update text colors
            Title.TextColor3 = theme.Text
            TitleGlow.TextColor3 = theme.Accent
            UserName.TextColor3 = theme.Text
            UserId.TextColor3 = theme.Text
            SearchBox.TextColor3 = theme.Text
            SearchBox.PlaceholderColor3 = theme.Text
            ThemeLabel.TextColor3 = theme.Text
            ThemeValue.TextColor3 = theme.Accent
            
            -- Update icon colors
            Logo.ImageColor3 = theme.Accent
            SearchIcon.ImageColor3 = theme.Text
            MinimizeIcon.ImageColor3 = theme.Text
            CloseIcon.ImageColor3 = theme.Text
            ThemeIcon.ImageColor3 = theme.Text
            
            -- Update accent colors
            ContentScrolling.ScrollBarImageColor3 = theme.Accent
            TabContainer.ScrollBarImageColor3 = theme.Accent
            AvatarBorder.BackgroundColor3 = theme.Accent
            
            -- Update gradient
            TitleGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, theme.Secondary),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(
                    theme.Secondary.R * 0.9,
                    theme.Secondary.G * 0.9,
                    theme.Secondary.B * 0.9
                ))
            })
            
            -- Update all tab buttons
            for _, tabData in pairs(Window.Tabs) do
                if Window.CurrentTab and Window.CurrentTab.Button == tabData.Button then
                    Tween(tabData.Button, {BackgroundColor3 = Color3.fromRGB(
                        math.floor(theme.Accent.R * 0.2 + theme.Secondary.R * 0.8),
                        math.floor(theme.Accent.G * 0.2 + theme.Secondary.G * 0.8),
                        math.floor(theme.Accent.B * 0.2 + theme.Secondary.B * 0.8)
                    )}, 0.3)
                    Tween(tabData.Label, {TextColor3 = theme.Accent}, 0.3)
                    Tween(tabData.Icon, {ImageColor3 = theme.Accent}, 0.3)
                else
                    Tween(tabData.Button, {BackgroundColor3 = theme.Secondary}, 0.3)
                    Tween(tabData.Label, {TextColor3 = theme.Text}, 0.3)
                    Tween(tabData.Icon, {ImageColor3 = theme.Text}, 0.3)
                end
                tabData.Highlight.BackgroundColor3 = theme.Accent
            end
            
            -- Update all elements in tabs
            for _, tabData in pairs(Window.Tabs) do
                for _, element in pairs(tabData.Elements) do
                    if element:IsA("TextLabel") then
                        Tween(element, {TextColor3 = theme.Text}, 0.3)
                    end
                end
            end
        end
    end
    
    function Window:AddTab(tabName, tabIcon)
        local tabIconImage = tabIcon or Icons.Scripts
        
        -- Tab Button with Advanced Design
        local TabButton = Create("TextButton", {
            Parent = TabContainer,
            Name = tabName.."Tab",
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = #Window.Tabs + 1
        })
        
        Create("UICorner", {
            Parent = TabButton,
            CornerRadius = UDim.new(0, 8)
        })
        
        -- Tab Icon
        local TabIcon = Create("ImageLabel", {
            Parent = TabButton,
            Name = "TabIcon",
            Size = UDim2.new(0, 22, 0, 22),
            Position = UDim2.new(0, 12, 0.5, -11),
            BackgroundTransparency = 1,
            Image = tabIconImage,
            ImageColor3 = Colors[Window.CurrentTheme].Text
        })
        
        -- Tab Label
        local TabLabel = Create("TextLabel", {
            Parent = TabButton,
            Name = "TabLabel",
            Size = UDim2.new(1, -45, 1, 0),
            Position = UDim2.new(0, 40, 0, 0),
            BackgroundTransparency = 1,
            Text = tabName,
            TextColor3 = Colors[Window.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        -- Tab Highlight
        local TabHighlight = Create("Frame", {
            Parent = TabButton,
            Name = "TabHighlight",
            Size = UDim2.new(0, 3, 0.7, 0),
            Position = UDim2.new(0, 6, 0.15, 0),
            BackgroundColor3 = Colors[Window.CurrentTheme].Accent,
            Visible = false,
            BorderSizePixel = 0
        })
        
        Create("UICorner", {
            Parent = TabHighlight,
            CornerRadius = UDim.new(1, 0)
        })
        
        -- Tab Content
        local TabContent = Create("ScrollingFrame", {
            Parent = ContentScrolling,
            Name = tabName.."Content",
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 0,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false
        })
        
        local TabContentLayout = Create("UIListLayout", {
            Parent = TabContent,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        })
        
        TabContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentLayout.AbsoluteContentSize.Y)
        end)
        
        -- Store tab data
        local tabData = {
            Button = TabButton,
            Highlight = TabHighlight,
            Label = TabLabel,
            Icon = TabIcon,
            Content = TabContent,
            Elements = {}
        }
        
        table.insert(Window.Tabs, tabData)
        
        -- Advanced Tab Selection System
        TabButton.MouseButton1Click:Connect(function()
            if Window.CurrentTab then
                -- Deselect current tab
                Tween(Window.CurrentTab.Button, {BackgroundColor3 = Colors[Window.CurrentTheme].Secondary}, 0.3)
                Window.CurrentTab.Highlight.Visible = false
                Window.CurrentTab.Content.Visible = false
                Tween(Window.CurrentTab.Label, {TextColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
                Tween(Window.CurrentTab.Icon, {ImageColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
            end
            
            -- Select new tab
            Window.CurrentTab = tabData
            
            Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(
                math.floor(Colors[Window.CurrentTheme].Accent.R * 0.2 + Colors[Window.CurrentTheme].Secondary.R * 0.8),
                math.floor(Colors[Window.CurrentTheme].Accent.G * 0.2 + Colors[Window.CurrentTheme].Secondary.G * 0.8),
                math.floor(Colors[Window.CurrentTheme].Accent.B * 0.2 + Colors[Window.CurrentTheme].Secondary.B * 0.8)
            )}, 0.3)
            
            TabHighlight.Visible = true
            TabContent.Visible = true
            Tween(TabLabel, {TextColor3 = Colors[Window.CurrentTheme].Accent}, 0.2)
            Tween(TabIcon, {ImageColor3 = Colors[Window.CurrentTheme].Accent}, 0.2)
            
            -- Animation effects
            TabLabel.Rotation = 2
            TabIcon.Rotation = 2
            Tween(TabLabel, {Rotation = 0}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            Tween(TabIcon, {Rotation = 0}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        end)
        
        -- Hover effects
        SetupAdvancedButtonHover(TabButton, {Icon = TabIcon, Label = TabLabel})
        
        -- Return advanced tab methods
        local TabMethods = {}
        
        function TabMethods:AddButton(options)
            options = options or {}
            local Button = Create("TextButton", {
                Parent = TabContent,
                Name = options.Name or "Button",
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                Text = "",
                AutoButtonColor = false,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            Create("UICorner", {
                Parent = Button,
                CornerRadius = UDim.new(0, 8)
            })
            
            local ButtonLabel = Create("TextLabel", {
                Parent = Button,
                Name = "ButtonLabel",
                Size = UDim2.new(0.7, 0, 1, 0),
                Position = UDim2.new(0, 15, 0, 0),
                BackgroundTransparency = 1,
                Text = options.Name or "Button",
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local ButtonIcon = Create("ImageLabel", {
                Parent = Button,
                Name = "ButtonIcon",
                Size = UDim2.new(0, 22, 0, 22),
                Position = UDim2.new(1, -35, 0.5, -11),
                BackgroundTransparency = 1,
                Image = options.Icon or Icons.Fingerprint,
                ImageColor3 = Colors[Window.CurrentTheme].Text
            })
            
            -- Advanced hover effects with ripple
            Button.MouseEnter:Connect(function()
                RippleEffect(Button, Mouse)
                Tween(Button, {BackgroundColor3 = Colors[Window.CurrentTheme].Accent}, 0.2)
                Tween(ButtonIcon, {ImageColor3 = Color3.new(1, 1, 1)}, 0.2)
                Tween(ButtonLabel, {TextColor3 = Color3.new(1, 1, 1)}, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(Button, {BackgroundColor3 = Colors[Window.CurrentTheme].Secondary}, 0.2)
                Tween(ButtonIcon, {ImageColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
                Tween(ButtonLabel, {TextColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
            end)
            
            Button.MouseButton1Click:Connect(function()
                RippleEffect(Button, Mouse)
                if options.Callback then
                    pcall(options.Callback)
                end
            end)
            
            table.insert(tabData.Elements, ButtonLabel)
            table.insert(Window.Elements, ButtonLabel)
            return Button
        end
        
        function TabMethods:AddToggle(options)
            options = options or {}
            local Toggle = {
                Value = options.Default or false
            }
            
            local ToggleFrame = Create("Frame", {
                Parent = TabContent,
                Name = options.Name or "Toggle",
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundTransparency = 1,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            local ToggleLabel = Create("TextLabel", {
                Parent = ToggleFrame,
                Name = "ToggleLabel",
                Size = UDim2.new(0.7, 0, 1, 0),
                Position = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1,
                Text = options.Name or "Toggle",
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local ToggleButton = Create("TextButton", {
                Parent = ToggleFrame,
                Name = "ToggleButton",
                Size = UDim2.new(0, 45, 0, 24),
                Position = UDim2.new(1, -45, 0.5, -12),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                Text = "",
                AutoButtonColor = false,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = ToggleButton,
                CornerRadius = UDim.new(1, 0)
            })
            
            local ToggleIndicator = Create("Frame", {
                Parent = ToggleButton,
                Name = "ToggleIndicator",
                Size = UDim2.new(0, 18, 0, 18),
                Position = UDim2.new(0, 3, 0.5, -9),
                BackgroundColor3 = Colors[Window.CurrentTheme].Text,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = ToggleIndicator,
                CornerRadius = UDim.new(1, 0)
            })
            
            local function UpdateToggle()
                if Toggle.Value then
                    Tween(ToggleButton, {BackgroundColor3 = Colors[Window.CurrentTheme].Accent}, 0.2)
                    Tween(ToggleIndicator, {Position = UDim2.new(1, -21, 0.5, -9)}, 0.2)
                    ToggleIndicator.BackgroundColor3 = Color3.new(1, 1, 1)
                else
                    Tween(ToggleButton, {BackgroundColor3 = Colors[Window.CurrentTheme].Secondary}, 0.2)
                    Tween(ToggleIndicator, {Position = UDim2.new(0, 3, 0.5, -9)}, 0.2)
                    ToggleIndicator.BackgroundColor3 = Colors[Window.CurrentTheme].Text
                end
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                RippleEffect(ToggleButton, Mouse)
                Toggle.Value = not Toggle.Value
                UpdateToggle()
                if options.Callback then
                    pcall(options.Callback, Toggle.Value)
                end
            end)
            
            UpdateToggle()
            table.insert(tabData.Elements, ToggleLabel)
            table.insert(Window.Elements, ToggleLabel)
            return Toggle
        end
        
        function TabMethods:AddSlider(options)
            options = options or {}
            local Slider = {
                Value = options.Default or options.Min or 0
            }
            
            local SliderFrame = Create("Frame", {
                Parent = TabContent,
                Name = options.Name or "Slider",
                Size = UDim2.new(1, 0, 0, 55),
                BackgroundTransparency = 1,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            local SliderHeader = Create("Frame", {
                Parent = SliderFrame,
                Name = "SliderHeader",
                Size = UDim2.new(1, 0, 0, 20),
                BackgroundTransparency = 1
            })
            
            local SliderLabel = Create("TextLabel", {
                Parent = SliderHeader,
                Name = "SliderLabel",
                Size = UDim2.new(0.7, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = options.Name or "Slider",
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local SliderValue = Create("TextLabel", {
                Parent = SliderHeader,
                Name = "SliderValue",
                Size = UDim2.new(0, 60, 1, 0),
                Position = UDim2.new(1, -60, 0, 0),
                BackgroundTransparency = 1,
                Text = tostring(Slider.Value),
                TextColor3 = Colors[Window.CurrentTheme].Accent,
                TextSize = 12,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Right
            })
            
            local SliderTrack = Create("Frame", {
                Parent = SliderFrame,
                Name = "SliderTrack",
                Size = UDim2.new(1, 0, 0, 6),
                Position = UDim2.new(0, 0, 1, -15),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = SliderTrack,
                CornerRadius = UDim.new(1, 0)
            })
            
            local SliderFill = Create("Frame", {
                Parent = SliderTrack,
                Name = "SliderFill",
                Size = UDim2.new(0, 0, 1, 0),
                BackgroundColor3 = Colors[Window.CurrentTheme].Accent,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = SliderFill,
                CornerRadius = UDim.new(1, 0)
            })
            
            local SliderButton = Create("TextButton", {
                Parent = SliderTrack,
                Name = "SliderButton",
                Size = UDim2.new(0, 18, 0, 18),
                Position = UDim2.new(0, 0, 0.5, -9),
                BackgroundColor3 = Color3.new(1, 1, 1),
                Text = "",
                AutoButtonColor = false,
                ZIndex = 2
            })
            
            Create("UICorner", {
                Parent = SliderButton,
                CornerRadius = UDim.new(1, 0)
            })
            
            local min = options.Min or 0
            local max = options.Max or 100
            local dragging = false
            
            local function UpdateSlider(value)
                local percentage = (value - min) / (max - min)
                SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
                SliderButton.Position = UDim2.new(percentage, -9, 0.5, -9)
                SliderValue.Text = tostring(math.floor(value))
                Slider.Value = value
            end
            
            SliderButton.MouseButton1Down:Connect(function()
                dragging = true
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local relativeX = math.clamp(Mouse.X - SliderTrack.AbsolutePosition.X, 0, SliderTrack.AbsoluteSize.X)
                    local percentage = relativeX / SliderTrack.AbsoluteSize.X
                    local value = min + (max - min) * percentage
                    value = math.floor(value)
                    UpdateSlider(value)
                    if options.Callback then
                        pcall(options.Callback, value)
                    end
                end
            end)
            
            UpdateSlider(Slider.Value)
            table.insert(tabData.Elements, SliderLabel)
            table.insert(Window.Elements, SliderLabel)
            return Slider
        end
        
        function TabMethods:AddDropdown(options)
            options = options or {}
            local Dropdown = {
                Value = options.Default or "",
                Open = false,
                Options = options.Options or {}
            }
            
            local DropdownFrame = Create("Frame", {
                Parent = TabContent,
                Name = options.Name or "Dropdown",
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundTransparency = 1,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            local DropdownLabel = Create("TextLabel", {
                Parent = DropdownFrame,
                Name = "DropdownLabel",
                Size = UDim2.new(0.7, 0, 1, 0),
                Position = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1,
                Text = options.Name or "Dropdown",
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local DropdownButton = Create("TextButton", {
                Parent = DropdownFrame,
                Name = "DropdownButton",
                Size = UDim2.new(0, 140, 0, 32),
                Position = UDim2.new(1, -140, 0.5, -16),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                Text = Dropdown.Value or "Chọn...",
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 12,
                Font = Enum.Font.Gotham,
                AutoButtonColor = false
            })
            
            Create("UICorner", {
                Parent = DropdownButton,
                CornerRadius = UDim.new(0, 6)
            })
            
            local DropdownIcon = Create("ImageLabel", {
                Parent = DropdownButton,
                Name = "DropdownIcon",
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(1, -20, 0.5, -8),
                BackgroundTransparency = 1,
                Image = Icons.Dropdown,
                ImageColor3 = Colors[Window.CurrentTheme].Text
            })
            
            local DropdownList = Create("ScrollingFrame", {
                Parent = DropdownFrame,
                Name = "DropdownList",
                Size = UDim2.new(0, 140, 0, 0),
                Position = UDim2.new(1, -140, 1, 5),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                BorderSizePixel = 0,
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = Colors[Window.CurrentTheme].Accent,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                Visible = false,
                ClipsDescendants = true
            })
            
            Create("UICorner", {
                Parent = DropdownList,
                CornerRadius = UDim.new(0, 6)
            })
            
            local ListLayout = Create("UIListLayout", {
                Parent = DropdownList,
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            local function UpdateDropdown()
                if Dropdown.Open then
                    local contentHeight = math.min(#Dropdown.Options * 35, 175)
                    Tween(DropdownList, {Size = UDim2.new(0, 140, 0, contentHeight)}, 0.3)
                    Tween(DropdownIcon, {Rotation = 90}, 0.3)
                    DropdownList.Visible = true
                else
                    Tween(DropdownList, {Size = UDim2.new(0, 140, 0, 0)}, 0.3)
                    Tween(DropdownIcon, {Rotation = 0}, 0.3)
                    task.wait(0.3)
                    DropdownList.Visible = false
                end
            end
            
            SetupAdvancedButtonHover(DropdownButton, {})
            
            DropdownButton.MouseButton1Click:Connect(function()
                RippleEffect(DropdownButton, Mouse)
                Dropdown.Open = not Dropdown.Open
                UpdateDropdown()
            end)
            
            -- Close dropdown when clicking outside
            local dropdownConnection
            dropdownConnection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Open then
                    local mousePos = UserInputService:GetMouseLocation()
                    local dropdownAbsPos = DropdownList.AbsolutePosition
                    local dropdownAbsSize = DropdownList.AbsoluteSize
                    
                    if not (mousePos.X >= dropdownAbsPos.X and mousePos.X <= dropdownAbsPos.X + dropdownAbsSize.X and
                           mousePos.Y >= dropdownAbsPos.Y and mousePos.Y <= dropdownAbsPos.Y + dropdownAbsSize.Y) then
                        Dropdown.Open = false
                        UpdateDropdown()
                    end
                end
            end)
            
            for _, option in pairs(Dropdown.Options) do
                local OptionButton = Create("TextButton", {
                    Parent = DropdownList,
                    Name = option,
                    Size = UDim2.new(1, 0, 0, 32),
                    BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                    Text = option,
                    TextColor3 = Colors[Window.CurrentTheme].Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    AutoButtonColor = false
                })
                
                OptionButton.MouseButton1Click:Connect(function()
                    RippleEffect(OptionButton, Mouse)
                    Dropdown.Value = option
                    DropdownButton.Text = option
                    Dropdown.Open = false
                    UpdateDropdown()
                    if options.Callback then
                        pcall(options.Callback, option)
                    end
                end)
                
                SetupAdvancedButtonHover(OptionButton, {})
            end
            
            table.insert(tabData.Elements, DropdownLabel)
            table.insert(Window.Elements, DropdownLabel)
            return Dropdown
        end
        
        function TabMethods:AddSection(sectionName)
            local SectionFrame = Create("Frame", {
                Parent = TabContent,
                Name = sectionName.."Section",
                Size = UDim2.new(1, 0, 0, 45),
                BackgroundTransparency = 1,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            local SectionLabel = Create("TextLabel", {
                Parent = SectionFrame,
                Name = "SectionLabel",
                Size = UDim2.new(1, 0, 0, 25),
                BackgroundTransparency = 1,
                Text = sectionName,
                TextColor3 = Colors[Window.CurrentTheme].Accent,
                TextSize = 16,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Center
            })
            
            local SectionLine = Create("Frame", {
                Parent = SectionFrame,
                Name = "SectionLine",
                Size = UDim2.new(1, 0, 0, 1),
                Position = UDim2.new(0, 0, 1, -15),
                BackgroundColor3 = Colors[Window.CurrentTheme].Accent,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = SectionLine,
                CornerRadius = UDim.new(1, 0)
            })
            
            table.insert(tabData.Elements, SectionLabel)
            table.insert(Window.Elements, SectionLabel)
            return SectionFrame
        end
        
        function TabMethods:AddLabel(text)
            local Label = Create("TextLabel", {
                Parent = TabContent,
                Name = "Label",
                Size = UDim2.new(1, 0, 0, 30),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 14,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            table.insert(tabData.Elements, Label)
            table.insert(Window.Elements, Label)
            return Label
        end
        
        -- Auto-select first tab
        if #Window.Tabs == 1 then
            task.spawn(function()
                wait(0.1)
                TabButton.MouseButton1Click()
            end)
        end
        
        return TabMethods
    end
    
    -- Final setup
    ScreenGui.Parent = CoreGui
    
    return Window
end

return NazuX
