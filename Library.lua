--[[
    NazuX Library
    Advanced Roblox UI Library with Modern Design
    Created with ❤️ for Roblox Developers
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- Local Variables
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Icon Assets (Lucide Icons - Selected ones for UI)
local Icons = {
    Logo = "rbxassetid://10709761813", -- lucide-aperture
    Search = "rbxassetid://10734943674", -- lucide-search
    Fingerprint = "rbxassetid://10723375250", -- lucide-fingerprint
    Home = "rbxassetid://10723407389", -- lucide-home
    Settings = "rbxassetid://10734950309", -- lucide-settings
    Scripts = "rbxassetid://10734951038", -- lucide-sheet
    Player = "rbxassetid://10747373176", -- lucide-user
    Check = "rbxassetid://10709790644", -- lucide-check
    Dropdown = "rbxassetid://10709791281", -- lucide-chevron-left (rotated)
    Theme = "rbxassetid://10734910430", -- lucide-palette
    Minimize = "rbxassetid://10734895698", -- lucide-minimize
    Close = "rbxassetid://10747384394", -- lucide-x
    Game = "rbxassetid://10723395457", -- lucide-gamepad-2
    Visual = "rbxassetid://10723375128", -- lucide-filter
    Combat = "rbxassetid://10734975692", -- lucide-swords
    Movement = "rbxassetid://10709775894", -- lucide-bike
    Teleport = "rbxassetid://10734922971", -- lucide-plane
    Money = "rbxassetid://10709811110", -- lucide-coins
    Server = "rbxassetid://10734949856", -- lucide-server
    Info = "rbxassetid://10723415903", -- lucide-info
    Star = "rbxassetid://10734966248", -- lucide-star
    Heart = "rbxassetid://10723406885", -- lucide-heart
    Shield = "rbxassetid://10734951847", -- lucide-shield
    Zap = "rbxassetid://10723345749", -- lucide-electricity
    Crown = "rbxassetid://10709818626", -- lucide-crown
    Bot = "rbxassetid://10709782230", -- lucide-bot
    Code = "rbxassetid://10709810463", -- lucide-code
    Database = "rbxassetid://10709818996", -- lucide-database
    Network = "rbxassetid://10734906975", -- lucide-network
    Security = "rbxassetid://10734951847", -- lucide-shield
    Performance = "rbxassetid://10723395708", -- lucide-gauge
    Audio = "rbxassetid://10734965419", -- lucide-speaker
    Video = "rbxassetid://10747374938", -- lucide-video
    Image = "rbxassetid://10723415040", -- lucide-image
    File = "rbxassetid://10723374641", -- lucide-file
    Folder = "rbxassetid://10723387563", -- lucide-folder
    Download = "rbxassetid://10723344270", -- lucide-download
    Upload = "rbxassetid://10747366434", -- lucide-upload
    Refresh = "rbxassetid://10734933056", -- lucide-refresh-ccw
    Trash = "rbxassetid://10747362393", -- lucide-trash
    Edit = "rbxassetid://10734883598", -- lucide-edit
    Copy = "rbxassetid://10709812159", -- lucide-copy
    Paste = "rbxassetid://10747362393", -- lucide-paste
    Save = "rbxassetid://10734941499", -- lucide-save
    Lock = "rbxassetid://10723434711", -- lucide-lock
    Unlock = "rbxassetid://10747366027", -- lucide-unlock
    Eye = "rbxassetid://10723346959", -- lucide-eye
    EyeOff = "rbxassetid://10723346871", -- lucide-eye-off
    Bell = "rbxassetid://10709775704", -- lucide-bell
    Mail = "rbxassetid://10734885430", -- lucide-mail
    Message = "rbxassetid://10734888000", -- lucide-message-circle
    Users = "rbxassetid://10747373426", -- lucide-users
    UserPlus = "rbxassetid://10747372702", -- lucide-user-plus
    UserMinus = "rbxassetid://10747372346", -- lucide-user-minus
    UserX = "rbxassetid://10747372992", -- lucide-user-x
    UserCheck = "rbxassetid://10747371901", -- lucide-user-check
    Camera = "rbxassetid://10709789686", -- lucide-camera
    Mic = "rbxassetid://10734888864", -- lucide-mic
    Phone = "rbxassetid://10734921524", -- lucide-phone
    Map = "rbxassetid://10734886202", -- lucide-map
    Navigation = "rbxassetid://10734906744", -- lucide-navigation
    Compass = "rbxassetid://10709811445", -- lucide-compass
    Clock = "rbxassetid://10709805144", -- lucide-clock
    Calendar = "rbxassetid://10709789505", -- lucide-calendar
    Sun = "rbxassetid://10734974297", -- lucide-sun
    Moon = "rbxassetid://10734897102", -- lucide-moon
    Cloud = "rbxassetid://10709806740", -- lucide-cloud
    CloudRain = "rbxassetid://10709806277", -- lucide-cloud-rain
    CloudSnow = "rbxassetid://10709806374", -- lucide-cloud-snow
    CloudLightning = "rbxassetid://10709805727", -- lucide-cloud-lightning
    Wind = "rbxassetid://10747382750", -- lucide-wind
    Umbrella = "rbxassetid://10747364971", -- lucide-umbrella
    Flame = "rbxassetid://10723376114", -- lucide-flame
    Droplet = "rbxassetid://10723344432", -- lucide-droplet
    Tree = "rbxassetid://10747362534", -- lucide-tree-deciduous
    Flower = "rbxassetid://10747830374", -- lucide-flower
    Leaf = "rbxassetid://10723425539", -- lucide-leaf
    Mountain = "rbxassetid://10734897956", -- lucide-mountain
    Trophy = "rbxassetid://10747363809", -- lucide-trophy
    Award = "rbxassetid://10709769406", -- lucide-award
    Medal = "rbxassetid://10734887072", -- lucide-medal
    Gift = "rbxassetid://10723396402", -- lucide-gift
    ShoppingCart = "rbxassetid://10734952479", -- lucide-shopping-cart
    CreditCard = "rbxassetid://10747362393", -- lucide-credit-card
    Coin = "rbxassetid://10709811110", -- lucide-coins
    Banknote = "rbxassetid://10709770178", -- lucide-banknote
    Bitcoin = "rbxassetid://10709776126", -- lucide-bitcoin
    TrendingUp = "rbxassetid://10747363465", -- lucide-trending-up
    TrendingDown = "rbxassetid://10747363205", -- lucide-trending-down",
    BarChart = "rbxassetid://10709773755", -- lucide-bar-chart
    PieChart = "rbxassetid://10734921727", -- lucide-pie-chart
    LineChart = "rbxassetid://10723426393", -- lucide-line-chart
    Cpu = "rbxassetid://10709813383", -- lucide-cpu
    Memory = "rbxassetid://10723405749", -- lucide-hard-drive
    Wifi = "rbxassetid://10747382504", -- lucide-wifi
    Bluetooth = "rbxassetid://10709776655", -- lucide-bluetooth
    Signal = "rbxassetid://10734961133", -- lucide-signal
    Battery = "rbxassetid://10709774640", -- lucide-battery
    BatteryCharging = "rbxassetid://10709774068", -- lucide-battery-charging
    Power = "rbxassetid://10734930466", -- lucide-power
    Plug = "rbxassetid://10747362393", -- lucide-plug
    Tool = "rbxassetid://10734919503", -- lucide-pen-tool
    Scissors = "rbxassetid://10734942778", -- lucide-scissors
    Box = "rbxassetid://10709782497", -- lucide-box
    Package = "rbxassetid://10734909540", -- lucide-package
    Truck = "rbxassetid://10747364031", -- lucide-truck
    Car = "rbxassetid://10709789810", -- lucide-car
    Bike = "rbxassetid://10709775894", -- lucide-bike
    Train = "rbxassetid://10747362105", -- lucide-train
    Plane = "rbxassetid://10734922971", -- lucide-plane
    Ship = "rbxassetid://10734941354", -- lucide-sailboat
    Rocket = "rbxassetid://10734934585", -- lucide-rocket
    Building = "rbxassetid://10709783051", -- lucide-building
    Home = "rbxassetid://10723407389", -- lucide-home
    Hotel = "rbxassetid://10747362393", -- lucide-hotel
    Store = "rbxassetid://10734952273", -- lucide-shopping-bag
    Factory = "rbxassetid://10723347051", -- lucide-factory
    Hospital = "rbxassetid://10747362393", -- lucide-hospital
    School = "rbxassetid://10723404691", -- lucide-graduation-cap
    Book = "rbxassetid://10709781824", -- lucide-book
    BookOpen = "rbxassetid://10709781717", -- lucide-book-open
    Newspaper = "rbxassetid://10734907168", -- lucide-newspaper
    Pen = "rbxassetid://10734919691", -- lucide-pencil
    Brush = "rbxassetid://10709782758", -- lucide-brush
    Palette = "rbxassetid://10734910430", -- lucide-palette
    Music = "rbxassetid://10734905958", -- lucide-music
    Video = "rbxassetid://10747374938", -- lucide-video
    Film = "rbxassetid://10723374981", -- lucide-film
    Camera = "rbxassetid://10709789686", -- lucide-camera
    Headphones = "rbxassetid://10723406165", -- lucide-headphones
    Tv = "rbxassetid://10747364593", -- lucide-tv
    Monitor = "rbxassetid://10734896881", -- lucide-monitor
    Smartphone = "rbxassetid://10734963940", -- lucide-smartphone
    Tablet = "rbxassetid://10734976394", -- lucide-tablet
    Watch = "rbxassetid://10747376722", -- lucide-watch
    Laptop = "rbxassetid://10723423881", -- lucide-laptop
    Printer = "rbxassetid://10734930632", -- lucide-printer
    Keyboard = "rbxassetid://10723416765", -- lucide-keyboard
    Mouse = "rbxassetid://10734898592", -- lucide-mouse
    Gamepad = "rbxassetid://10723395457", -- lucide-gamepad-2
    VirtualReality = "rbxassetid://10747362393" -- lucide-vr
}

-- Colors
local Colors = {
    Dark = {
        Background = Color3.fromRGB(30, 30, 30),
        Secondary = Color3.fromRGB(40, 40, 40),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(60, 60, 60)
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(0, 0, 0),
        Border = Color3.fromRGB(200, 200, 200)
    },
    Red = {
        Background = Color3.fromRGB(40, 20, 20),
        Secondary = Color3.fromRGB(60, 30, 30),
        Accent = Color3.fromRGB(255, 60, 60),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(80, 40, 40)
    },
    Yellow = {
        Background = Color3.fromRGB(40, 40, 20),
        Secondary = Color3.fromRGB(60, 60, 30),
        Accent = Color3.fromRGB(255, 255, 60),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(80, 80, 40)
    },
    AMOLED = {
        Background = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(10, 10, 10),
        Accent = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(20, 20, 20)
    },
    Rose = {
        Background = Color3.fromRGB(30, 20, 25),
        Secondary = Color3.fromRGB(45, 30, 38),
        Accent = Color3.fromRGB(255, 105, 180),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(60, 40, 50)
    }
}

-- Utility Functions
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

local function Tween(Object, Properties, Duration, Style, Direction)
    local TweenInfo = TweenInfo.new(Duration or 0.3, Style or Enum.EasingStyle.Quad, Direction or Enum.EasingDirection.Out)
    local Tween = TweenService:Create(Object, TweenInfo, Properties)
    Tween:Play()
    return Tween
end

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    local Window = {
        Tabs = {},
        CurrentTab = nil,
        Minimized = false,
        CurrentTheme = options.Theme or "Dark"
    }
    setmetatable(Window, self)
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        ResetOnSpawn = false
    })
    
    -- Main Container
    local MainFrame = Create("Frame", {
        Parent = ScreenGui,
        Size = UDim2.new(0, 600, 0, 400),
        Position = UDim2.new(0.5, -300, 0.5, -200),
        BackgroundColor3 = Colors[Window.CurrentTheme].Background,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    -- Corner Radius
    local MainCorner = Create("UICorner", {
        Parent = MainFrame,
        CornerRadius = UDim.new(0, 8)
    })
    
    -- Drop Shadow
    local Shadow = Create("ImageLabel", {
        Parent = MainFrame,
        Name = "Shadow",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        Image = "rbxassetid://1316045217",
        ImageColor3 = Color3.new(0, 0, 0),
        ImageTransparency = 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
        ZIndex = 0
    })
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Parent = MainFrame,
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        BorderSizePixel = 0
    })
    
    local TitleBarCorner = Create("UICorner", {
        Parent = TitleBar,
        CornerRadius = UDim.new(0, 8)
    })
    
    -- Logo (Left)
    local Logo = Create("ImageLabel", {
        Parent = TitleBar,
        Name = "Logo",
        Size = UDim2.new(0, 25, 0, 25),
        Position = UDim2.new(0, 10, 0.5, -12.5),
        BackgroundTransparency = 1,
        Image = Icons.Logo,
        ImageColor3 = Colors[Window.CurrentTheme].Accent
    })
    
    -- Title (Center)
    local Title = Create("TextLabel", {
        Parent = TitleBar,
        Name = "Title",
        Size = UDim2.new(1, -120, 1, 0),
        Position = UDim2.new(0, 40, 0, 0),
        BackgroundTransparency = 1,
        Text = options.Title or "NazuX Library",
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Center
    })
    
    -- Control Buttons (Right)
    local MinimizeButton = Create("TextButton", {
        Parent = TitleBar,
        Name = "MinimizeButton",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -70, 0.5, -15),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        Text = "",
        AutoButtonColor = false
    })
    
    local MinimizeIcon = Create("ImageLabel", {
        Parent = MinimizeButton,
        Name = "MinimizeIcon",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0.5, -10, 0.5, -10),
        BackgroundTransparency = 1,
        Image = Icons.Minimize,
        ImageColor3 = Colors[Window.CurrentTheme].Text
    })
    
    local CloseButton = Create("TextButton", {
        Parent = TitleBar,
        Name = "CloseButton",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -30, 0.5, -15),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        Text = "",
        AutoButtonColor = false
    })
    
    local CloseIcon = Create("ImageLabel", {
        Parent = CloseButton,
        Name = "CloseIcon",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0.5, -10, 0.5, -10),
        BackgroundTransparency = 1,
        Image = Icons.Close,
        ImageColor3 = Colors[Window.CurrentTheme].Text
    })
    
    local ButtonCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = MinimizeButton
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = CloseButton
    })
    
    -- User Info Section
    local UserInfoFrame = Create("Frame", {
        Parent = MainFrame,
        Name = "UserInfo",
        Size = UDim2.new(1, -20, 0, 60),
        Position = UDim2.new(0, 10, 0, 50),
        BackgroundTransparency = 1
    })
    
    -- Avatar (Circular)
    local Avatar = Create("ImageLabel", {
        Parent = UserInfoFrame,
        Name = "Avatar",
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Colors[Window.CurrentTheme].Border,
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=150&height=150&format=png"
    })
    
    local AvatarCorner = Create("UICorner", {
        Parent = Avatar,
        CornerRadius = UDim.new(1, 0)
    })
    
    local AvatarStroke = Create("UIStroke", {
        Parent = Avatar,
        Color = Colors[Window.CurrentTheme].Accent,
        Thickness = 2
    })
    
    -- User Info Text
    local UserName = Create("TextLabel", {
        Parent = UserInfoFrame,
        Name = "UserName",
        Size = UDim2.new(1, -60, 0.5, 0),
        Position = UDim2.new(0, 60, 0, 0),
        BackgroundTransparency = 1,
        Text = LocalPlayer.Name,
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local UserId = Create("TextLabel", {
        Parent = UserInfoFrame,
        Name = "UserId",
        Size = UDim2.new(1, -60, 0.5, 0),
        Position = UDim2.new(0, 60, 0.5, 0),
        BackgroundTransparency = 1,
        Text = "ID: "..LocalPlayer.UserId,
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextTransparency = 0.3,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Search Bar
    local SearchFrame = Create("Frame", {
        Parent = MainFrame,
        Name = "SearchFrame",
        Size = UDim2.new(1, -20, 0, 35),
        Position = UDim2.new(0, 10, 0, 120),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        BorderSizePixel = 0
    })
    
    local SearchCorner = Create("UICorner", {
        Parent = SearchFrame,
        CornerRadius = UDim.new(0, 6)
    })
    
    local SearchBox = Create("TextBox", {
        Parent = SearchFrame,
        Name = "SearchBox",
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        PlaceholderText = "Search...",
        PlaceholderColor3 = Colors[Window.CurrentTheme].Text,
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local SearchIcon = Create("ImageLabel", {
        Parent = SearchFrame,
        Name = "SearchIcon",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(1, -30, 0.5, -10),
        BackgroundTransparency = 1,
        Image = Icons.Search,
        ImageColor3 = Colors[Window.CurrentTheme].Text
    })
    
    -- Tab Container
    local TabContainer = Create("Frame", {
        Parent = MainFrame,
        Name = "TabContainer",
        Size = UDim2.new(0, 150, 1, -160),
        Position = UDim2.new(0, 10, 0, 160),
        BackgroundTransparency = 1
    })
    
    local TabListLayout = Create("UIListLayout", {
        Parent = TabContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    -- Content Container
    local ContentContainer = Create("Frame", {
        Parent = MainFrame,
        Name = "ContentContainer",
        Size = UDim2.new(1, -180, 1, -170),
        Position = UDim2.new(0, 170, 0, 160),
        BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    local ContentCorner = Create("UICorner", {
        Parent = ContentContainer,
        CornerRadius = UDim.new(0, 8)
    })
    
    local ContentScrolling = Create("ScrollingFrame", {
        Parent = ContentContainer,
        Name = "ContentScrolling",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Colors[Window.CurrentTheme].Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    local ContentLayout = Create("UIListLayout", {
        Parent = ContentScrolling,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    })
    
    local ContentPadding = Create("UIPadding", {
        Parent = ContentScrolling,
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10)
    })
    
    -- Loading Screen
    local LoadingScreen = Create("Frame", {
        Parent = ScreenGui,
        Name = "LoadingScreen",
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Colors[Window.CurrentTheme].Background,
        Visible = true,
        ZIndex = 100
    })
    
    local LoadingSpinner = Create("Frame", {
        Parent = LoadingScreen,
        Name = "LoadingSpinner",
        Size = UDim2.new(0, 60, 0, 60),
        Position = UDim2.new(0.5, -30, 0.5, -30),
        BackgroundColor3 = Colors[Window.CurrentTheme].Accent,
        BorderSizePixel = 0
    })
    
    local LoadingCorner = Create("UICorner", {
        Parent = LoadingSpinner,
        CornerRadius = UDim.new(1, 0)
    })
    
    local LoadingText = Create("TextLabel", {
        Parent = LoadingScreen,
        Name = "LoadingText",
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0.5, 40),
        BackgroundTransparency = 1,
        Text = "Loading NazuX Library...",
        TextColor3 = Colors[Window.CurrentTheme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Center
    })
    
    -- Loading Animation
    local LoadingRotation = 0
    local LoadingConnection = RunService.RenderStepped:Connect(function(delta)
        LoadingRotation = (LoadingRotation + 360 * delta) % 360
        LoadingSpinner.Rotation = LoadingRotation
    end)
    
    -- Simulate loading
    task.wait(2)
    LoadingScreen.Visible = false
    LoadingConnection:Disconnect()
    
    -- Button Hover Effects
    local function SetupButtonHover(button, icon)
        button.MouseEnter:Connect(function()
            Tween(button, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
            if icon then
                Tween(icon, {ImageColor3 = Colors[Window.CurrentTheme].Background}, 0.2)
            end
        end)
        
        button.MouseLeave:Connect(function()
            Tween(button, {BackgroundColor3 = Colors[Window.CurrentTheme].Secondary}, 0.2)
            if icon then
                Tween(icon, {ImageColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
            end
        end)
    end
    
    SetupButtonHover(MinimizeButton, MinimizeIcon)
    SetupButtonHover(CloseButton, CloseIcon)
    
    -- Minimize Functionality
    MinimizeButton.MouseButton1Click:Connect(function()
        Window.Minimized = not Window.Minimized
        if Window.Minimized then
            Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 40)}, 0.3)
            Tween(TitleBarCorner, {CornerRadius = UDim.new(0, 8)}, 0.3)
        else
            Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 400)}, 0.3)
            Tween(TitleBarCorner, {CornerRadius = UDim.new(0, 8)}, 0.3)
        end
    end)
    
    -- Close Functionality
    CloseButton.MouseButton1Click:Connect(function()
        Tween(ScreenGui, {BackgroundTransparency = 1}, 0.3)
        for _, child in ipairs(ScreenGui:GetChildren()) do
            Tween(child, {BackgroundTransparency = 1}, 0.3)
        end
        task.wait(0.3)
        ScreenGui:Destroy()
    end)
    
    -- Search Functionality
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = string.lower(SearchBox.Text)
        for _, tab in pairs(Window.Tabs) do
            for _, element in pairs(tab.Elements) do
                if element:IsA("TextLabel") or element:IsA("TextButton") then
                    local elementText = string.lower(element.Text)
                    if string.find(elementText, searchText) then
                        element.Visible = true
                        Tween(element, {TextTransparency = 0}, 0.2)
                    else
                        Tween(element, {TextTransparency = 0.7}, 0.2)
                        element.Visible = searchText == ""
                    end
                end
            end
        end
    end)
    
    -- Make Window Draggable
    local Dragging, DragInput, DragStart, StartPos
    
    local function Update(input)
        local Delta = input.Position - DragStart
        Tween(MainFrame, {Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)}, 0.1)
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
    
    -- Public Methods
    function Window:ChangeTheme(themeName)
        if Colors[themeName] then
            Window.CurrentTheme = themeName
            local theme = Colors[themeName]
            
            Tween(MainFrame, {BackgroundColor3 = theme.Background}, 0.3)
            Tween(TitleBar, {BackgroundColor3 = theme.Secondary}, 0.3)
            Tween(ContentContainer, {BackgroundColor3 = theme.Secondary}, 0.3)
            Tween(SearchFrame, {BackgroundColor3 = theme.Secondary}, 0.3)
            
            -- Update text colors
            Title.TextColor3 = theme.Text
            UserName.TextColor3 = theme.Text
            UserId.TextColor3 = theme.Text
            SearchBox.TextColor3 = theme.Text
            SearchBox.PlaceholderColor3 = theme.Text
            SearchIcon.ImageColor3 = theme.Text
            MinimizeIcon.ImageColor3 = theme.Text
            CloseIcon.ImageColor3 = theme.Text
            
            -- Update accent colors
            AvatarStroke.Color = theme.Accent
            ContentScrolling.ScrollBarImageColor3 = theme.Accent
            Logo.ImageColor3 = theme.Accent
        end
    end
    
    function Window:AddTab(tabName, iconName)
        local Tab = {
            Name = tabName,
            Elements = {}
        }
        
        -- Get icon for tab
        local tabIcon = Icons[iconName] or Icons.Code
        
        -- Tab Button
        local TabButton = Create("TextButton", {
            Parent = TabContainer,
            Name = tabName.."Tab",
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
            Text = "",
            AutoButtonColor = false
        })
        
        local TabButtonCorner = Create("UICorner", {
            Parent = TabButton,
            CornerRadius = UDim.new(0, 6)
        })
        
        -- Tab Icon
        local TabIcon = Create("ImageLabel", {
            Parent = TabButton,
            Name = "TabIcon",
            Size = UDim2.new(0, 20, 0, 20),
            Position = UDim2.new(0, 10, 0.5, -10),
            BackgroundTransparency = 1,
            Image = tabIcon,
            ImageColor3 = Colors[Window.CurrentTheme].Text
        })
        
        -- Tab Label
        local TabLabel = Create("TextLabel", {
            Parent = TabButton,
            Name = "TabLabel",
            Size = UDim2.new(1, -40, 1, 0),
            Position = UDim2.new(0, 35, 0, 0),
            BackgroundTransparency = 1,
            Text = tabName,
            TextColor3 = Colors[Window.CurrentTheme].Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local TabHighlight = Create("Frame", {
            Parent = TabButton,
            Name = "TabHighlight",
            Size = UDim2.new(0, 3, 0.6, 0),
            Position = UDim2.new(0, 5, 0.2, 0),
            BackgroundColor3 = Colors[Window.CurrentTheme].Accent,
            Visible = false,
            BorderSizePixel = 0
        })
        
        local HighlightCorner = Create("UICorner", {
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
        
        -- Tab Selection
        TabButton.MouseButton1Click:Connect(function()
            if Window.CurrentTab then
                Window.CurrentTab.Button.BackgroundColor3 = Colors[Window.CurrentTheme].Secondary
                Window.CurrentTab.Highlight.Visible = false
                Window.CurrentTab.Content.Visible = false
                Tween(Window.CurrentTab.Label, {TextColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
                Tween(Window.CurrentTab.Icon, {ImageColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
            end
            
            Window.CurrentTab = {
                Button = TabButton,
                Highlight = TabHighlight,
                Label = TabLabel,
                Icon = TabIcon,
                Content = TabContent
            }
            
            Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(
                Colors[Window.CurrentTheme].Accent.R * 0.2 + Colors[Window.CurrentTheme].Secondary.R * 0.8,
                Colors[Window.CurrentTheme].Accent.G * 0.2 + Colors[Window.CurrentTheme].Secondary.G * 0.8,
                Colors[Window.CurrentTheme].Accent.B * 0.2 + Colors[Window.CurrentTheme].Secondary.B * 0.8
            )}, 0.3)
            
            TabHighlight.Visible = true
            TabContent.Visible = true
            Tween(TabLabel, {TextColor3 = Colors[Window.CurrentTheme].Accent}, 0.2)
            Tween(TabIcon, {ImageColor3 = Colors[Window.CurrentTheme].Accent}, 0.2)
            
            -- Rotation effect
            TabLabel.Rotation = 5
            TabIcon.Rotation = 5
            Tween(TabLabel, {Rotation = 0}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            Tween(TabIcon, {Rotation = 0}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        end)
        
        -- Hover effects
        TabButton.MouseEnter:Connect(function()
            if Window.CurrentTab and Window.CurrentTab.Button ~= TabButton then
                Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(
                    Colors[Window.CurrentTheme].Secondary.R * 0.9,
                    Colors[Window.CurrentTheme].Secondary.G * 0.9,
                    Colors[Window.CurrentTheme].Secondary.B * 0.9
                )}, 0.2)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if Window.CurrentTab and Window.CurrentTab.Button ~= TabButton then
                Tween(TabButton, {BackgroundColor3 = Colors[Window.CurrentTheme].Secondary}, 0.2)
            end
        end)
        
        table.insert(Window.Tabs, Tab)
        
        -- Return tab methods
        local TabMethods = {}
        
        function TabMethods:AddButton(options)
            options = options or {}
            local Button = Create("TextButton", {
                Parent = TabContent,
                Name = options.Name or "Button",
                Size = UDim2.new(1, 0, 0, 35),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                Text = "",
                AutoButtonColor = false,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            local ButtonCorner = Create("UICorner", {
                Parent = Button,
                CornerRadius = UDim.new(0, 6)
            })
            
            local ButtonLabel = Create("TextLabel", {
                Parent = Button,
                Name = "ButtonLabel",
                Size = UDim2.new(0.7, 0, 1, 0),
                Position = UDim2.new(0, 10, 0, 0),
                BackgroundTransparency = 1,
                Text = options.Name or "Button",
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local FingerprintIcon = Create("ImageLabel", {
                Parent = Button,
                Name = "FingerprintIcon",
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(1, -30, 0.5, -10),
                BackgroundTransparency = 1,
                Image = Icons.Fingerprint,
                ImageColor3 = Colors[Window.CurrentTheme].Text
            })
            
            -- Hover effects
            Button.MouseEnter:Connect(function()
                Tween(Button, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
                Tween(ButtonLabel, {TextColor3 = Colors[Window.CurrentTheme].Background}, 0.2)
                Tween(FingerprintIcon, {ImageColor3 = Colors[Window.CurrentTheme].Background}, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(Button, {BackgroundColor3 = Colors[Window.CurrentTheme].Secondary}, 0.2)
                Tween(ButtonLabel, {TextColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
                Tween(FingerprintIcon, {ImageColor3 = Colors[Window.CurrentTheme].Text}, 0.2)
            end)
            
            Button.MouseButton1Click:Connect(function()
                if options.Callback then
                    options.Callback()
                end
            end)
            
            table.insert(Tab.Elements, ButtonLabel)
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
                Size = UDim2.new(1, 0, 0, 35),
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
                Size = UDim2.new(0, 40, 0, 20),
                Position = UDim2.new(1, -40, 0.5, -10),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                Text = "",
                AutoButtonColor = false,
                BorderSizePixel = 0
            })
            
            local ToggleCorner = Create("UICorner", {
                Parent = ToggleButton,
                CornerRadius = UDim.new(1, 0)
            })
            
            local ToggleIndicator = Create("Frame", {
                Parent = ToggleButton,
                Name = "ToggleIndicator",
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 2, 0.5, -8),
                BackgroundColor3 = Colors[Window.CurrentTheme].Text,
                BorderSizePixel = 0
            })
            
            local IndicatorCorner = Create("UICorner", {
                Parent = ToggleIndicator,
                CornerRadius = UDim.new(1, 0)
            })
            
            local function UpdateToggle()
                if Toggle.Value then
                    Tween(ToggleButton, {BackgroundColor3 = Colors[Window.CurrentTheme].Accent}, 0.2)
                    Tween(ToggleIndicator, {Position = UDim2.new(1, -18, 0.5, -8)}, 0.2)
                    ToggleIndicator.BackgroundColor3 = Color3.new(1, 1, 1)
                else
                    Tween(ToggleButton, {BackgroundColor3 = Colors[Window.CurrentTheme].Secondary}, 0.2)
                    Tween(ToggleIndicator, {Position = UDim2.new(0, 2, 0.5, -8)}, 0.2)
                    ToggleIndicator.BackgroundColor3 = Colors[Window.CurrentTheme].Text
                end
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                Toggle.Value = not Toggle.Value
                UpdateToggle()
                if options.Callback then
                    options.Callback(Toggle.Value)
                end
            end)
            
            UpdateToggle()
            table.insert(Tab.Elements, ToggleLabel)
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
                Size = UDim2.new(1, 0, 0, 50),
                BackgroundTransparency = 1,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            local SliderLabel = Create("TextLabel", {
                Parent = SliderFrame,
                Name = "SliderLabel",
                Size = UDim2.new(1, 0, 0, 20),
                BackgroundTransparency = 1,
                Text = options.Name or "Slider",
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local SliderValue = Create("TextLabel", {
                Parent = SliderFrame,
                Name = "SliderValue",
                Size = UDim2.new(0, 50, 0, 20),
                Position = UDim2.new(1, -50, 0, 0),
                BackgroundTransparency = 1,
                Text = tostring(Slider.Value),
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 12,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Right
            })
            
            local SliderTrack = Create("Frame", {
                Parent = SliderFrame,
                Name = "SliderTrack",
                Size = UDim2.new(1, 0, 0, 5),
                Position = UDim2.new(0, 0, 1, -15),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                BorderSizePixel = 0
            })
            
            local TrackCorner = Create("UICorner", {
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
            
            local FillCorner = Create("UICorner", {
                Parent = SliderFill,
                CornerRadius = UDim.new(1, 0)
            })
            
            local SliderButton = Create("TextButton", {
                Parent = SliderTrack,
                Name = "SliderButton",
                Size = UDim2.new(0, 15, 0, 15),
                Position = UDim2.new(0, 0, 0.5, -7.5),
                BackgroundColor3 = Color3.new(1, 1, 1),
                Text = "",
                AutoButtonColor = false,
                ZIndex = 2
            })
            
            local ButtonCorner = Create("UICorner", {
                Parent = SliderButton,
                CornerRadius = UDim.new(1, 0)
            })
            
            local min = options.Min or 0
            local max = options.Max or 100
            local dragging = false
            
            local function UpdateSlider(value)
                local percentage = (value - min) / (max - min)
                SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
                SliderButton.Position = UDim2.new(percentage, -7.5, 0.5, -7.5)
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
            
            Mouse.Move:Connect(function()
                if dragging then
                    local relativeX = math.clamp(Mouse.X - SliderTrack.AbsolutePosition.X, 0, SliderTrack.AbsoluteSize.X)
                    local percentage = relativeX / SliderTrack.AbsoluteSize.X
                    local value = min + (max - min) * percentage
                    value = math.floor(value)
                    UpdateSlider(value)
                    if options.Callback then
                        options.Callback(value)
                    end
                end
            end)
            
            UpdateSlider(Slider.Value)
            table.insert(Tab.Elements, SliderLabel)
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
                Size = UDim2.new(1, 0, 0, 35),
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
                Size = UDim2.new(0, 120, 0, 30),
                Position = UDim2.new(1, -120, 0.5, -15),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                Text = Dropdown.Value or "Select...",
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 12,
                Font = Enum.Font.Gotham,
                AutoButtonColor = false
            })
            
            local DropdownCorner = Create("UICorner", {
                Parent = DropdownButton,
                CornerRadius = UDim.new(0, 6)
            })
            
            local DropdownList = Create("ScrollingFrame", {
                Parent = DropdownFrame,
                Name = "DropdownList",
                Size = UDim2.new(0, 120, 0, 0),
                Position = UDim2.new(1, -120, 1, 5),
                BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                BorderSizePixel = 0,
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = Colors[Window.CurrentTheme].Accent,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                Visible = false,
                ClipsDescendants = true
            })
            
            local ListLayout = Create("UIListLayout", {
                Parent = DropdownList,
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            local function UpdateDropdown()
                if Dropdown.Open then
                    Tween(DropdownList, {Size = UDim2.new(0, 120, 0, math.min(#Dropdown.Options * 30, 150))}, 0.3)
                    DropdownList.Visible = true
                else
                    Tween(DropdownList, {Size = UDim2.new(0, 120, 0, 0)}, 0.3)
                    task.wait(0.3)
                    DropdownList.Visible = false
                end
            end
            
            DropdownButton.MouseButton1Click:Connect(function()
                Dropdown.Open = not Dropdown.Open
                UpdateDropdown()
            end)
            
            for _, option in pairs(Dropdown.Options) do
                local OptionButton = Create("TextButton", {
                    Parent = DropdownList,
                    Name = option,
                    Size = UDim2.new(1, 0, 0, 30),
                    BackgroundColor3 = Colors[Window.CurrentTheme].Secondary,
                    Text = option,
                    TextColor3 = Colors[Window.CurrentTheme].Text,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    AutoButtonColor = false
                })
                
                OptionButton.MouseButton1Click:Connect(function()
                    Dropdown.Value = option
                    DropdownButton.Text = option
                    Dropdown.Open = false
                    UpdateDropdown()
                    if options.Callback then
                        options.Callback(option)
                    end
                end)
                
                OptionButton.MouseEnter:Connect(function()
                    Tween(OptionButton, {BackgroundColor3 = Color3.fromRGB(
                        Colors[Window.CurrentTheme].Secondary.R * 0.8,
                        Colors[Window.CurrentTheme].Secondary.G * 0.8,
                        Colors[Window.CurrentTheme].Secondary.B * 0.8
                    )}, 0.2)
                end)
                
                OptionButton.MouseLeave:Connect(function()
                    Tween(OptionButton, {BackgroundColor3 = Colors[Window.CurrentTheme].Secondary}, 0.2)
                end)
            end
            
            table.insert(Tab.Elements, DropdownLabel)
            return Dropdown
        end
        
        function TabMethods:AddSection(sectionName)
            local SectionFrame = Create("Frame", {
                Parent = TabContent,
                Name = sectionName.."Section",
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundTransparency = 1,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            local SectionLabel = Create("TextLabel", {
                Parent = SectionFrame,
                Name = "SectionLabel",
                Size = UDim2.new(1, 0, 0, 20),
                BackgroundTransparency = 1,
                Text = sectionName,
                TextColor3 = Colors[Window.CurrentTheme].Text,
                TextSize = 16,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Center
            })
            
            local SectionLine = Create("Frame", {
                Parent = SectionFrame,
                Name = "SectionLine",
                Size = UDim2.new(1, 0, 0, 1),
                Position = UDim2.new(0, 0, 1, -10),
                BackgroundColor3 = Colors[Window.CurrentTheme].Accent,
                BorderSizePixel = 0
            })
            
            table.insert(Tab.Elements, SectionLabel)
            return SectionFrame
        end
        
        -- Auto-select first tab
        if #Window.Tabs == 1 then
            TabButton.MouseButton1Click:Fire()
        end
        
        return TabMethods
    end
    
    -- Theme Changer Button
    function Window:AddThemeChanger()
        local ThemeDropdown = Window.Tabs[1]:AddDropdown({
            Name = "Change Theme",
            Options = {"Dark", "Light", "Red", "Yellow", "AMOLED", "Rose"},
            Default = Window.CurrentTheme,
            Callback = function(theme)
                Window:ChangeTheme(theme)
            end
        })
    end
    
    ScreenGui.Parent = game.CoreGui
    
    return Window
end

return NazuX
