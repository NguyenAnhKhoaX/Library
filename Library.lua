--[[
    NazuX Library
    Created by NazuX
    Version: 1.2
--]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- Local variables
local localPlayer = Players.LocalPlayer
local mouse = localPlayer:GetMouse()

-- Color themes với độ trong suốt
local Themes = {
    Dark = {
        Main = Color3.fromRGB(32, 34, 37),
        Secondary = Color3.fromRGB(47, 49, 54),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(88, 101, 242),
        Transparency = 0.1
    },
    Light = {
        Main = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(0, 122, 255),
        Transparency = 0.1
    },
    Red = {
        Main = Color3.fromRGB(54, 23, 23),
        Secondary = Color3.fromRGB(82, 32, 32),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(220, 53, 69),
        Transparency = 0.1
    },
    Yellow = {
        Main = Color3.fromRGB(54, 47, 23),
        Secondary = Color3.fromRGB(82, 71, 32),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 193, 7),
        Transparency = 0.1
    },
    AMOLED = {
        Main = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(10, 10, 10),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 255, 255),
        Transparency = 0.15
    },
    Rose = {
        Main = Color3.fromRGB(40, 20, 29),
        Secondary = Color3.fromRGB(60, 30, 44),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(235, 150, 178),
        Transparency = 0.1
    }
}

-- Utility functions
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

local function Tween(Object, Info, Properties)
    local Tween = TweenService:Create(Object, Info, Properties)
    Tween:Play()
    return Tween
end

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowTitle = options.Title or "NazuX Library"
    local Theme = options.Theme or "Dark"
    
    -- Create main screen gui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        ResetOnSpawn = false
    })
    
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
    end
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Main container - Trong suốt hoàn toàn
    local MainFrame = Create("Frame", {
        Parent = ScreenGui,
        Size = UDim2.new(0, 550, 0, 400),
        Position = UDim2.new(0.5, -275, 0.5, -200),
        BackgroundColor3 = Themes[Theme].Main,
        BackgroundTransparency = Themes[Theme].Transparency, -- Trong suốt
        ClipsDescendants = true,
        Active = true,
        Draggable = false -- Đặt false để chỉ kéo qua titlebar
    })
    
    -- Corner radius
    Create("UICorner", {Parent = MainFrame, CornerRadius = UDim.new(0, 12)})
    
    -- Title bar - Trong suốt và có thể kéo
    local TitleBar = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- Trong suốt
        BorderSizePixel = 0,
        Active = true
    })
    
    Create("UICorner", {Parent = TitleBar, CornerRadius = UDim.new(0, 12)})
    
    -- Thêm drag functionality cho titlebar
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    -- Title text
    local TitleLabel = Create("TextLabel", {
        Parent = TitleBar,
        Size = UDim2.new(0, 200, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = WindowTitle,
        TextColor3 = Themes[Theme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Control buttons
    local MinimizeButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -70, 0.5, -15),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency,
        Text = "-",
        TextColor3 = Themes[Theme].Text,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false
    })
    
    Create("UICorner", {Parent = MinimizeButton, CornerRadius = UDim.new(0, 6)})
    
    local CloseButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -35, 0.5, -15),
        BackgroundColor3 = Color3.fromRGB(232, 72, 72),
        BackgroundTransparency = 0.3,
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false
    })
    
    Create("UICorner", {Parent = CloseButton, CornerRadius = UDim.new(0, 6)})
    
    -- Color change buttons in title bar (Win11 style)
    local ThemeButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -105, 0.5, -15),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency,
        Text = "🎨",
        TextColor3 = Themes[Theme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false
    })
    
    Create("UICorner", {Parent = ThemeButton, CornerRadius = UDim.new(0, 6)})
    
    local SpecialThemeButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -140, 0.5, -15),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency,
        Text = "🌟",
        TextColor3 = Themes[Theme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false
    })
    
    Create("UICorner", {Parent = SpecialThemeButton, CornerRadius = UDim.new(0, 6)})
    
    -- Content area
    local ContentArea = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1
    })
    
    -- Left sidebar (trong suốt)
    local LeftSidebar = Create("Frame", {
        Parent = ContentArea,
        Size = UDim2.new(0, 180, 1, 0),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- Trong suốt
        BorderSizePixel = 0
    })
    
    Create("UICorner", {Parent = LeftSidebar, CornerRadius = UDim.new(0, 8)})
    
    -- User info section
    local UserInfoFrame = Create("Frame", {
        Parent = LeftSidebar,
        Size = UDim2.new(1, -10, 0, 80),
        Position = UDim2.new(0, 5, 0, 5),
        BackgroundTransparency = 1
    })
    
    -- Avatar (rounded)
    local Avatar = Create("ImageLabel", {
        Parent = UserInfoFrame,
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.new(0, 5, 0, 5),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency,
        BorderSizePixel = 0,
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. localPlayer.UserId .. "&width=150&height=150&format=png"
    })
    
    Create("UICorner", {Parent = Avatar, CornerRadius = UDim.new(1, 0)})
    
    -- Username
    local UsernameLabel = Create("TextLabel", {
        Parent = UserInfoFrame,
        Size = UDim2.new(1, -65, 0, 20),
        Position = UDim2.new(0, 60, 0, 15),
        BackgroundTransparency = 1,
        Text = localPlayer.Name,
        TextColor3 = Themes[Theme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd
    })
    
    -- Display name
    local DisplayNameLabel = Create("TextLabel", {
        Parent = UserInfoFrame,
        Size = UDim2.new(1, -65, 0, 18),
        Position = UDim2.new(0, 60, 0, 35),
        BackgroundTransparency = 1,
        Text = "@" .. localPlayer.DisplayName,
        TextColor3 = Themes[Theme].Text,
        TextTransparency = 0.5,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd
    })
    
    -- Search bar
    local SearchContainer = Create("Frame", {
        Parent = LeftSidebar,
        Size = UDim2.new(1, -10, 0, 35),
        Position = UDim2.new(0, 5, 0, 90),
        BackgroundColor3 = Themes[Theme].Main,
        BackgroundTransparency = Themes[Theme].Transparency, -- Trong suốt
        BorderSizePixel = 0
    })
    
    Create("UICorner", {Parent = SearchContainer, CornerRadius = UDim.new(0, 6)})
    
    local SearchBox = Create("TextBox", {
        Parent = SearchContainer,
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 35, 0, 0),
        BackgroundTransparency = 1,
        Text = "Search...",
        PlaceholderText = "Search...",
        TextColor3 = Themes[Theme].Text,
        PlaceholderColor3 = Themes[Theme].Text,
        TextTransparency = 0.3,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false
    })
    
    local SearchIcon = Create("ImageLabel", {
        Parent = SearchContainer,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 8, 0.5, -10),
        BackgroundTransparency = 1,
        Image = "rbxassetid://3926305904",
        ImageRectOffset = Vector2.new(964, 324),
        ImageRectSize = Vector2.new(36, 36),
        ImageColor3 = Themes[Theme].Text,
        ImageTransparency = 0.3
    })
    
    -- Tabs container
    local TabsContainer = Create("ScrollingFrame", {
        Parent = LeftSidebar,
        Size = UDim2.new(1, -10, 1, -135),
        Position = UDim2.new(0, 5, 0, 130),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Themes[Theme].Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    Create("UIListLayout", {
        Parent = TabsContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    -- Right content area (trong suốt)
    local RightContent = Create("Frame", {
        Parent = ContentArea,
        Size = UDim2.new(1, -185, 1, -10),
        Position = UDim2.new(0, 185, 0, 5),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- Trong suốt
        BorderSizePixel = 0
    })
    
    Create("UICorner", {Parent = RightContent, CornerRadius = UDim.new(0, 8)})
    
    -- Window state
    local IsMinimized = false
    local OriginalSize = MainFrame.Size
    local OriginalPosition = MainFrame.Position
    
    -- Minimize functionality
    MinimizeButton.MouseButton1Click:Connect(function()
        if IsMinimized then
            -- Restore
            Tween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = OriginalSize})
            ContentArea.Visible = true
            IsMinimized = false
        else
            -- Minimize
            OriginalSize = MainFrame.Size
            OriginalPosition = MainFrame.Position
            Tween(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 550, 0, 40)})
            ContentArea.Visible = false
            IsMinimized = true
        end
    end)
    
    -- Close functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Theme changing functionality
    local function ApplyTheme(themeName)
        local theme = Themes[themeName]
        if not theme then return end
        
        -- Apply theme to all elements
        MainFrame.BackgroundColor3 = theme.Main
        MainFrame.BackgroundTransparency = theme.Transparency
        TitleBar.BackgroundColor3 = theme.Secondary
        TitleBar.BackgroundTransparency = theme.Transparency
        TitleLabel.TextColor3 = theme.Text
        MinimizeButton.BackgroundColor3 = theme.Secondary
        MinimizeButton.BackgroundTransparency = theme.Transparency
        MinimizeButton.TextColor3 = theme.Text
        ThemeButton.BackgroundColor3 = theme.Secondary
        ThemeButton.BackgroundTransparency = theme.Transparency
        ThemeButton.TextColor3 = theme.Text
        SpecialThemeButton.BackgroundColor3 = theme.Secondary
        SpecialThemeButton.BackgroundTransparency = theme.Transparency
        SpecialThemeButton.TextColor3 = theme.Text
        LeftSidebar.BackgroundColor3 = theme.Secondary
        LeftSidebar.BackgroundTransparency = theme.Transparency
        UsernameLabel.TextColor3 = theme.Text
        DisplayNameLabel.TextColor3 = theme.Text
        SearchContainer.BackgroundColor3 = theme.Main
        SearchContainer.BackgroundTransparency = theme.Transparency
        SearchBox.TextColor3 = theme.Text
        SearchBox.PlaceholderColor3 = theme.Text
        SearchIcon.ImageColor3 = theme.Text
        RightContent.BackgroundColor3 = theme.Secondary
        RightContent.BackgroundTransparency = theme.Transparency
        TabsContainer.ScrollBarImageColor3 = theme.Accent
        Avatar.BackgroundColor3 = theme.Secondary
        Avatar.BackgroundTransparency = theme.Transparency
    end
    
    -- Theme selection popup với màu sắc thực tế
    local function ShowThemeSelector(isSpecial)
        local ThemePopup = Create("Frame", {
            Parent = ScreenGui,
            Size = UDim2.new(0, 250, 0, 300),
            Position = UDim2.new(0.5, -125, 0.5, -150),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency,
            ZIndex = 30
        })
        
        Create("UICorner", {Parent = ThemePopup, CornerRadius = UDim.new(0, 8)})
        
        -- Title bar cho popup
        local PopupTitleBar = Create("Frame", {
            Parent = ThemePopup,
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Themes[Theme].Secondary,
            BackgroundTransparency = Themes[Theme].Transparency,
            BorderSizePixel = 0
        })
        
        Create("UICorner", {Parent = PopupTitleBar, CornerRadius = UDim.new(0, 8)})
        
        local PopupTitle = Create("TextLabel", {
            Parent = PopupTitleBar,
            Size = UDim2.new(1, -40, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            Text = isSpecial and "Special Themes" or "Color Themes",
            TextColor3 = Themes[Theme].Text,
            TextSize = 16,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 31
        })
        
        -- Close button cho popup
        local PopupCloseButton = Create("TextButton", {
            Parent = PopupTitleBar,
            Size = UDim2.new(0, 30, 0, 30),
            Position = UDim2.new(1, -35, 0.5, -15),
            BackgroundColor3 = Color3.fromRGB(232, 72, 72),
            BackgroundTransparency = 0.3,
            Text = "X",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 14,
            Font = Enum.Font.GothamBold,
            ZIndex = 31
        })
        
        Create("UICorner", {Parent = PopupCloseButton, CornerRadius = UDim.new(0, 4)})
        
        local ThemeList = Create("ScrollingFrame", {
            Parent = ThemePopup,
            Size = UDim2.new(1, -10, 1, -50),
            Position = UDim2.new(0, 5, 0, 45),
            BackgroundTransparency = 1,
            ScrollBarThickness = 3,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ZIndex = 31
        })
        
        Create("UIListLayout", {
            Parent = ThemeList,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        })
        
        local themesToShow = isSpecial and {
            AMOLED = {Name = "AMOLED", Color = Themes.AMOLED.Main},
            Rose = {Name = "Rose", Color = Themes.Rose.Accent}
        } or {
            Dark = {Name = "Dark", Color = Themes.Dark.Main},
            Light = {Name = "Light", Color = Themes.Light.Main},
            Red = {Name = "Red", Color = Themes.Red.Accent},
            Yellow = {Name = "Yellow", Color = Themes.Yellow.Accent}
        }
        
        for themeName, themeData in pairs(themesToShow) do
            local ThemeItem = Create("Frame", {
                Parent = ThemeList,
                Size = UDim2.new(1, 0, 0, 50),
                BackgroundColor3 = Themes[Theme].Secondary,
                BackgroundTransparency = Themes[Theme].Transparency,
                LayoutOrder = #ThemeList:GetChildren(),
                ZIndex = 31
            })
            
            Create("UICorner", {Parent = ThemeItem, CornerRadius = UDim.new(0, 6)})
            
            -- Color preview
            local ColorPreview = Create("Frame", {
                Parent = ThemeItem,
                Size = UDim2.new(0, 30, 0, 30),
                Position = UDim2.new(0, 10, 0.5, -15),
                BackgroundColor3 = themeData.Color,
                ZIndex = 32
            })
            
            Create("UICorner", {Parent = ColorPreview, CornerRadius = UDim.new(0, 4)})
            
            -- Theme name
            local ThemeNameLabel = Create("TextLabel", {
                Parent = ThemeItem,
                Size = UDim2.new(1, -50, 1, 0),
                Position = UDim2.new(0, 50, 0, 0),
                BackgroundTransparency = 1,
                Text = themeData.Name,
                TextColor3 = Themes[Theme].Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 32
            })
            
            -- Select button
            local SelectButton = Create("TextButton", {
                Parent = ThemeItem,
                Size = UDim2.new(0, 60, 0, 25),
                Position = UDim2.new(1, -70, 0.5, -12.5),
                BackgroundColor3 = Themes[Theme].Accent,
                BackgroundTransparency = 0.3,
                Text = "Apply",
                TextColor3 = Themes[Theme].Text,
                TextSize = 12,
                Font = Enum.Font.Gotham,
                AutoButtonColor = false,
                ZIndex = 32
            })
            
            Create("UICorner", {Parent = SelectButton, CornerRadius = UDim.new(0, 4)})
            
            SelectButton.MouseButton1Click:Connect(function()
                ApplyTheme(themeName)
                Theme = themeName
                ThemePopup:Destroy()
                if BackgroundOverlay then
                    BackgroundOverlay:Destroy()
                end
            end)
        end
        
        -- Close functionality
        local function ClosePopup()
            ThemePopup:Destroy()
            if BackgroundOverlay then
                BackgroundOverlay:Destroy()
            end
        end
        
        PopupCloseButton.MouseButton1Click:Connect(ClosePopup)
        
        -- Close when clicking outside
        local BackgroundOverlay = Create("TextButton", {
            Parent = ScreenGui,
            Size = UDim2.new(1, 0, 1, 0),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 0.5,
            BackgroundColor3 = Color3.new(0, 0, 0),
            Text = "",
            ZIndex = 25
        })
        
        BackgroundOverlay.MouseButton1Click:Connect(ClosePopup)
    end
    
    ThemeButton.MouseButton1Click:Connect(function()
        ShowThemeSelector(false)
    end)
    
    SpecialThemeButton.MouseButton1Click:Connect(function()
        ShowThemeSelector(true)
    end)
    
    -- Tab management
    local Tabs = {}
    local CurrentTab = nil
    
    local Window = {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        TabsContainer = TabsContainer,
        RightContent = RightContent,
        CurrentTheme = Theme
    }
    
    function Window:CreateTab(name)
        local TabButton = Create("TextButton", {
            Parent = TabsContainer,
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency,
            Text = name,
            TextColor3 = Themes[Theme].Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            AutoButtonColor = false
        })
        
        Create("UICorner", {Parent = TabButton, CornerRadius = UDim.new(0, 6)})
        
        local TabContent = Create("ScrollingFrame", {
            Parent = RightContent,
            Size = UDim2.new(1, -10, 1, -10),
            Position = UDim2.new(0, 5, 0, 5),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = Themes[Theme].Accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false
        })
        
        Create("UIListLayout", {
            Parent = TabContent,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        })
        
        local Tab = {
            Name = name,
            Button = TabButton,
            Content = TabContent,
            Elements = {}
        }
        
        table.insert(Tabs, Tab)
        
        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Content.Visible = false
                Tween(CurrentTab.Button, TweenInfo.new(0.2), {BackgroundColor3 = Themes[Theme].Main, BackgroundTransparency = Themes[Theme].Transparency})
            end
            
            CurrentTab = Tab
            TabContent.Visible = true
            Tween(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Themes[Theme].Accent, BackgroundTransparency = 0.3})
        end)
        
        -- Select first tab by default
        if #Tabs == 1 then
            TabButton:MouseButton1Click()
        end
        
        -- Search functionality
        SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
            local searchText = string.lower(SearchBox.Text)
            
            for _, element in pairs(Tab.Elements) do
                if element.Name then
                    local elementName = string.lower(element.Name)
                    if searchText == "" or string.find(elementName, searchText, 1, true) then
                        element.Visible = true
                    else
                        element.Visible = false
                    end
                end
            end
        end)
        
        return Tab
    end
    
    function Window:AddButton(tab, options)
        options = options or {}
        local name = options.Name or "Button"
        local callback = options.Callback or function() end
        
        local Button = Create("TextButton", {
            Parent = tab.Content,
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency,
            Text = name,
            TextColor3 = Themes[Theme].Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            AutoButtonColor = false,
            LayoutOrder = #tab.Elements + 1
        })
        
        Button.Name = name
        
        Create("UICorner", {Parent = Button, CornerRadius = UDim.new(0, 6)})
        
        Button.MouseEnter:Connect(function()
            Tween(Button, TweenInfo.new(0.2), {BackgroundColor3 = Themes[Theme].Accent, BackgroundTransparency = 0.3})
        end)
        
        Button.MouseLeave:Connect(function()
            Tween(Button, TweenInfo.new(0.2), {BackgroundColor3 = Themes[Theme].Main, BackgroundTransparency = Themes[Theme].Transparency})
        end)
        
        Button.MouseButton1Click:Connect(function()
            callback()
        end)
        
        table.insert(tab.Elements, Button)
        
        return Button
    end
    
    function Window:AddToggle(tab, options)
        options = options or {}
        local name = options.Name or "Toggle"
        local default = options.Default or false
        local callback = options.Callback or function() end
        
        local ToggleFrame = Create("Frame", {
            Parent = tab.Content,
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            LayoutOrder = #tab.Elements + 1
        })
        
        ToggleFrame.Name = name
        
        local ToggleLabel = Create("TextLabel", {
            Parent = ToggleFrame,
            Size = UDim2.new(0.7, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = name,
            TextColor3 = Themes[Theme].Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local ToggleButton = Create("TextButton", {
            Parent = ToggleFrame,
            Size = UDim2.new(0, 50, 0, 25),
            Position = UDim2.new(1, -55, 0.5, -12.5),
            BackgroundColor3 = default and Themes[Theme].Accent or Themes[Theme].Main,
            BackgroundTransparency = default and 0.3 or Themes[Theme].Transparency,
            Text = "",
            AutoButtonColor = false
        })
        
        Create("UICorner", {Parent = ToggleButton, CornerRadius = UDim.new(1, 0)})
        
        local ToggleKnob = Create("Frame", {
            Parent = ToggleButton,
            Size = UDim2.new(0, 19, 0, 19),
            Position = UDim2.new(0, default and 27 or 3, 0.5, -9.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0, 0.5)
        })
        
        Create("UICorner", {Parent = ToggleKnob, CornerRadius = UDim.new(1, 0)})
        
        local isToggled = default
        
        ToggleButton.MouseButton1Click:Connect(function()
            isToggled = not isToggled
            
            if isToggled then
                Tween(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Themes[Theme].Accent, BackgroundTransparency = 0.3})
                Tween(ToggleKnob, TweenInfo.new(0.2), {Position = UDim2.new(0, 27, 0.5, -9.5)})
            else
                Tween(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Themes[Theme].Main, BackgroundTransparency = Themes[Theme].Transparency})
                Tween(ToggleKnob, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -9.5)})
            end
            
            callback(isToggled)
        end)
        
        table.insert(tab.Elements, ToggleFrame)
        
        return {
            Set = function(value)
                isToggled = value
                if isToggled then
                    ToggleButton.BackgroundColor3 = Themes[Theme].Accent
                    ToggleButton.BackgroundTransparency = 0.3
                    ToggleKnob.Position = UDim2.new(0, 27, 0.5, -9.5)
                else
                    ToggleButton.BackgroundColor3 = Themes[Theme].Main
                    ToggleButton.BackgroundTransparency = Themes[Theme].Transparency
                    ToggleKnob.Position = UDim2.new(0, 3, 0.5, -9.5)
                end
            end,
            Get = function()
                return isToggled
            end
        }
    end
    
    function Window:AddSlider(tab, options)
        options = options or {}
        local name = options.Name or "Slider"
        local min = options.Min or 0
        local max = options.Max or 100
        local default = options.Default or min
        local callback = options.Callback or function() end
        
        local SliderFrame = Create("Frame", {
            Parent = tab.Content,
            Size = UDim2.new(1, 0, 0, 60),
            BackgroundTransparency = 1,
            LayoutOrder = #tab.Elements + 1
        })
        
        SliderFrame.Name = name
        
        local SliderLabel = Create("TextLabel", {
            Parent = SliderFrame,
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundTransparency = 1,
            Text = name,
            TextColor3 = Themes[Theme].Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local ValueLabel = Create("TextLabel", {
            Parent = SliderFrame,
            Size = UDim2.new(0, 50, 0, 20),
            Position = UDim2.new(1, -50, 0, 0),
            BackgroundTransparency = 1,
            Text = tostring(default),
            TextColor3 = Themes[Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Right
        })
        
        local SliderTrack = Create("Frame", {
            Parent = SliderFrame,
            Size = UDim2.new(1, 0, 0, 5),
            Position = UDim2.new(0, 0, 0, 35),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency
        })
        
        Create("UICorner", {Parent = SliderTrack, CornerRadius = UDim.new(1, 0)})
        
        local SliderFill = Create("Frame", {
            Parent = SliderTrack,
            Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
            BackgroundColor3 = Themes[Theme].Accent,
            BackgroundTransparency = 0.3
        })
        
        Create("UICorner", {Parent = SliderFill, CornerRadius = UDim.new(1, 0)})
        
        local SliderButton = Create("TextButton", {
            Parent = SliderTrack,
            Size = UDim2.new(0, 15, 0, 15),
            Position = UDim2.new((default - min) / (max - min), -7.5, 0.5, -7.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Text = "",
            AutoButtonColor = false,
            ZIndex = 2
        })
        
        Create("UICorner", {Parent = SliderButton, CornerRadius = UDim.new(1, 0)})
        
        local isDragging = false
        
        local function UpdateSlider(value)
            local percentage = math.clamp((value - min) / (max - min), 0, 1)
            SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            SliderButton.Position = UDim2.new(percentage, -7.5, 0.5, -7.5)
            ValueLabel.Text = tostring(math.floor(value))
            callback(value)
        end
        
        SliderButton.MouseButton1Down:Connect(function()
            isDragging = true
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                isDragging = false
            end
        end)
        
        SliderTrack.MouseButton1Down:Connect(function(x, y)
            local percentage = math.clamp((x - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
            local value = min + (max - min) * percentage
            UpdateSlider(value)
        end)
        
        mouse.Move:Connect(function()
            if isDragging then
                local percentage = math.clamp((mouse.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
                local value = min + (max - min) * percentage
                UpdateSlider(value)
            end
        end)
        
        table.insert(tab.Elements, SliderFrame)
        
        return {
            Set = function(value)
                UpdateSlider(math.clamp(value, min, max))
            end,
            Get = function()
                return tonumber(ValueLabel.Text)
            end
        }
    end
    
    function Window:AddLabel(tab, options)
        options = options or {}
        local text = options.Text or "Label"
        
        local Label = Create("TextLabel", {
            Parent = tab.Content,
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = Themes[Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = #tab.Elements + 1
        })
        
        Label.Name = text
        
        table.insert(tab.Elements, Label)
        
        return Label
    end
    
    function Window:AddDropdown(tab, options)
        options = options or {}
        local name = options.Name or "Dropdown"
        local list = options.List or {}
        local default = options.Default or list[1]
        local callback = options.Callback or function() end
        
        local DropdownFrame = Create("Frame", {
            Parent = tab.Content,
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            LayoutOrder = #tab.Elements + 1
        })
        
        DropdownFrame.Name = name
        
        local DropdownLabel = Create("TextLabel", {
            Parent = DropdownFrame,
            Size = UDim2.new(1, -60, 1, 0),
            BackgroundTransparency = 1,
            Text = name,
            TextColor3 = Themes[Theme].Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local DropdownButton = Create("TextButton", {
            Parent = DropdownFrame,
            Size = UDim2.new(0, 120, 0, 30),
            Position = UDim2.new(1, -120, 0.5, -15),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency,
            Text = default or "Select...",
            TextColor3 = Themes[Theme].Text,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            AutoButtonColor = false
        })
        
        Create("UICorner", {Parent = DropdownButton, CornerRadius = UDim.new(0, 6)})
        
        local DropdownArrow = Create("ImageLabel", {
            Parent = DropdownButton,
            Size = UDim2.new(0, 15, 0, 15),
            Position = UDim2.new(1, -20, 0.5, -7.5),
            BackgroundTransparency = 1,
            Image = "rbxassetid://3926305904",
            ImageRectOffset = Vector2.new(964, 324),
            ImageRectSize = Vector2.new(36, 36),
            ImageColor3 = Themes[Theme].Text
        })
        
        local DropdownList = Create("ScrollingFrame", {
            Parent = DropdownFrame,
            Size = UDim2.new(0, 120, 0, 100),
            Position = UDim2.new(1, -120, 1, 5),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
            ZIndex = 10
        })
        
        Create("UICorner", {Parent = DropdownList, CornerRadius = UDim.new(0, 6)})
        Create("UIListLayout", {Parent = DropdownList, SortOrder = Enum.SortOrder.LayoutOrder})
        
        local isOpen = false
        local selected = default
        
        local function UpdateDropdown()
            DropdownButton.Text = selected or "Select..."
            callback(selected)
        end
        
        local function ToggleDropdown()
            isOpen = not isOpen
            DropdownList.Visible = isOpen
            
            if isOpen then
                -- Populate dropdown
                DropdownList:ClearAllChildren()
                
                for _, item in pairs(list) do
                    local OptionButton = Create("TextButton", {
                        Parent = DropdownList,
                        Size = UDim2.new(1, -10, 0, 25),
                        Position = UDim2.new(0, 5, 0, 0),
                        BackgroundColor3 = Themes[Theme].Secondary,
                        BackgroundTransparency = Themes[Theme].Transparency,
                        Text = item,
                        TextColor3 = Themes[Theme].Text,
                        TextSize = 12,
                        Font = Enum.Font.Gotham,
                        AutoButtonColor = false,
                        LayoutOrder = #DropdownList:GetChildren()
                    })
                    
                    Create("UICorner", {Parent = OptionButton, CornerRadius = UDim.new(0, 4)})
                    
                    OptionButton.MouseButton1Click:Connect(function()
                        selected = item
                        UpdateDropdown()
                        isOpen = false
                        DropdownList.Visible = false
                    end)
                end
            end
        end
        
        DropdownButton.MouseButton1Click:Connect(ToggleDropdown)
        
        -- Close dropdown when clicking outside
        UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and isOpen then
                if not (DropdownButton:IsDescendantOf(mouse.Target) or DropdownList:IsDescendantOf(mouse.Target)) then
                    isOpen = false
                    DropdownList.Visible = false
                end
            end
        end)
        
        table.insert(tab.Elements, DropdownFrame)
        
        return {
            Set = function(value)
                if table.find(list, value) then
                    selected = value
                    UpdateDropdown()
                end
            end,
            Get = function()
                return selected
            end,
            Refresh = function(newList)
                list = newList or list
                if not table.find(list, selected) then
                    selected = list[1]
                    UpdateDropdown()
                end
            end
        }
    end
    
    return Window
end

return NazuX
