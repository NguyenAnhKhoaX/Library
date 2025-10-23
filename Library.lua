--[[
    NazuX Library
    A modern Roblox UI library inspired by Windows 11 settings
    Created with transparency, smooth animations, and customizable themes
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- Local player
local LocalPlayer = Players.LocalPlayer

-- Theme system
local Themes = {
    White = {
        Background = Color3.fromRGB(245, 245, 245),
        Foreground = Color3.fromRGB(28, 28, 28),
        Primary = Color3.fromRGB(0, 120, 215),
        Secondary = Color3.fromRGB(240, 240, 240),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(28, 28, 28),
        TextSecondary = Color3.fromRGB(96, 96, 96)
    },
    Dark = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(200, 200, 200),
        Primary = Color3.fromRGB(0, 120, 215),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(200, 200, 200),
        TextSecondary = Color3.fromRGB(150, 150, 150)
    },
    Darker = {
        Background = Color3.fromRGB(16, 16, 16),
        Foreground = Color3.fromRGB(220, 220, 220),
        Primary = Color3.fromRGB(0, 120, 215),
        Secondary = Color3.fromRGB(32, 32, 32),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(220, 220, 220),
        TextSecondary = Color3.fromRGB(170, 170, 170)
    },
    Red = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(220, 220, 220),
        Primary = Color3.fromRGB(232, 17, 35),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(232, 17, 35),
        Text = Color3.fromRGB(220, 220, 220),
        TextSecondary = Color3.fromRGB(150, 150, 150)
    },
    Yellow = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(220, 220, 220),
        Primary = Color3.fromRGB(255, 185, 0),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(255, 185, 0),
        Text = Color3.fromRGB(220, 220, 220),
        TextSecondary = Color3.fromRGB(150, 150, 150)
    },
    Green = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(220, 220, 220),
        Primary = Color3.fromRGB(16, 137, 62),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(16, 137, 62),
        Text = Color3.fromRGB(220, 220, 220),
        TextSecondary = Color3.fromRGB(150, 150, 150)
    },
    Cam = {
        Background = Color3.fromRGB(32, 32, 32),
        Foreground = Color3.fromRGB(220, 220, 220),
        Primary = Color3.fromRGB(255, 140, 0),
        Secondary = Color3.fromRGB(48, 48, 48),
        Accent = Color3.fromRGB(255, 140, 0),
        Text = Color3.fromRGB(220, 220, 220),
        TextSecondary = Color3.fromRGB(150, 150, 150)
    },
    AMOLED = {
        Background = Color3.fromRGB(0, 0, 0),
        Foreground = Color3.fromRGB(255, 255, 255),
        Primary = Color3.fromRGB(0, 255, 0),
        Secondary = Color3.fromRGB(10, 10, 10),
        Accent = Color3.fromRGB(0, 255, 0),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 200)
    },
    Rose = {
        Background = Color3.fromRGB(25, 23, 36),
        Foreground = Color3.fromRGB(224, 222, 244),
        Primary = Color3.fromRGB(235, 111, 146),
        Secondary = Color3.fromRGB(38, 35, 58),
        Accent = Color3.fromRGB(235, 111, 146),
        Text = Color3.fromRGB(224, 222, 244),
        TextSecondary = Color3.fromRGB(144, 140, 170)
    },
    Github = {
        Background = Color3.fromRGB(13, 17, 23),
        Foreground = Color3.fromRGB(201, 209, 217),
        Primary = Color3.fromRGB(56, 139, 253),
        Secondary = Color3.fromRGB(22, 27, 34),
        Accent = Color3.fromRGB(56, 139, 253),
        Text = Color3.fromRGB(201, 209, 217),
        TextSecondary = Color3.fromRGB(139, 148, 158)
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

-- Main Window Class
function NazuX:CreateWindow(config)
    config = config or {}
    local Window = {
        Title = config.Title or "NazuX Library",
        Size = config.Size or Vector2.new(500, 400),
        Position = config.Position or UDim2.new(0.5, -250, 0.5, -200),
        Theme = config.Theme or "Dark",
        MinimizeKey = config.MinimizeKey or Enum.KeyCode.LeftControl,
        Tabs = {},
        CurrentTab = nil,
        Visible = true
    }
    
    setmetatable(Window, NazuX)
    
    -- Create main screen GUI
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLib",
        DisplayOrder = 10
    })
    
    -- Main container
    local MainFrame = Create("Frame", {
        Parent = ScreenGui,
        Size = UDim2.new(0, Window.Size.X, 0, Window.Size.Y),
        Position = Window.Position,
        BackgroundColor3 = Themes[Window.Theme].Background,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    -- Corner radius
    Create("UICorner", {
        Parent = MainFrame,
        CornerRadius = UDim.new(0, 8)
    })
    
    -- Drop shadow
    local Shadow = Create("ImageLabel", {
        Parent = MainFrame,
        Name = "Shadow",
        Image = "rbxassetid://5554236805",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(23, 23, 277, 277),
        Size = UDim2.new(1, 34, 1, 34),
        Position = UDim2.new(0, -17, 0, -17),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 0
    })
    
    -- Title bar
    local TitleBar = Create("Frame", {
        Parent = MainFrame,
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Themes[Window.Theme].Secondary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = TitleBar,
        CornerRadius = UDim.new(0, 8, 0, 0)
    })
    
    -- Search bar in title bar
    local SearchBox = Create("TextBox", {
        Parent = TitleBar,
        Name = "SearchBox",
        Size = UDim2.new(0.4, 0, 0, 30),
        Position = UDim2.new(0.3, 0, 0.5, -15),
        BackgroundColor3 = Themes[Window.Theme].Background,
        TextColor3 = Themes[Window.Theme].Text,
        PlaceholderColor3 = Themes[Window.Theme].TextSecondary,
        PlaceholderText = "Search...",
        Text = "",
        Font = Enum.Font.Gotham,
        TextSize = 14,
        ClearTextOnFocus = false
    })
    
    Create("UICorner", {
        Parent = SearchBox,
        CornerRadius = UDim.new(0, 6)
    })
    
    Create("UIPadding", {
        Parent = SearchBox,
        PaddingLeft = UDim.new(0, 10)
    })
    
    -- Logo in search box
    local SearchIcon = Create("ImageLabel", {
        Parent = SearchBox,
        Name = "SearchIcon",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(1, -30, 0.5, -10),
        BackgroundTransparency = 1,
        Image = "rbxassetid://3926305904",
        ImageRectOffset = Vector2.new(964, 324),
        ImageRectSize = Vector2.new(36, 36),
        ImageColor3 = Themes[Window.Theme].TextSecondary
    })
    
    -- Window controls (minimize, maximize, close)
    local Controls = Create("Frame", {
        Parent = TitleBar,
        Name = "Controls",
        Size = UDim2.new(0, 90, 1, 0),
        Position = UDim2.new(1, -90, 0, 0),
        BackgroundTransparency = 1
    })
    
    local CloseButton = Create("TextButton", {
        Parent = Controls,
        Name = "Close",
        Size = UDim2.new(0, 30, 1, 0),
        Position = UDim2.new(1, -30, 0, 0),
        BackgroundTransparency = 1,
        Text = "×",
        TextColor3 = Themes[Window.Theme].Text,
        TextSize = 20,
        Font = Enum.Font.GothamBold
    })
    
    local MaximizeButton = Create("TextButton", {
        Parent = Controls,
        Name = "Maximize",
        Size = UDim2.new(0, 30, 1, 0),
        Position = UDim2.new(1, -60, 0, 0),
        BackgroundTransparency = 1,
        Text = "□",
        TextColor3 = Themes[Window.Theme].Text,
        TextSize = 16,
        Font = Enum.Font.Gotham
    })
    
    local MinimizeButton = Create("TextButton", {
        Parent = Controls,
        Name = "Minimize",
        Size = UDim2.new(0, 30, 1, 0),
        Position = UDim2.new(1, -90, 0, 0),
        BackgroundTransparency = 1,
        Text = "-",
        TextColor3 = Themes[Window.Theme].Text,
        TextSize = 20,
        Font = Enum.Font.GothamBold
    })
    
    -- User info section
    local UserInfo = Create("Frame", {
        Parent = MainFrame,
        Name = "UserInfo",
        Size = UDim2.new(1, 0, 0, 60),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1
    })
    
    -- Avatar (circular)
    local Avatar = Create("ImageLabel", {
        Parent = UserInfo,
        Name = "Avatar",
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 15, 0.5, -20),
        BackgroundColor3 = Themes[Window.Theme].Secondary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = Avatar,
        CornerRadius = UDim.new(1, 0)
    })
    
    -- Load avatar
    local userId = LocalPlayer.UserId
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    Avatar.Image = content
    
    -- User info text
    local Username = Create("TextLabel", {
        Parent = UserInfo,
        Name = "Username",
        Size = UDim2.new(0.6, 0, 0, 20),
        Position = UDim2.new(0, 70, 0, 10),
        BackgroundTransparency = 1,
        Text = LocalPlayer.Name,
        TextColor3 = Themes[Window.Theme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local UserId = Create("TextLabel", {
        Parent = UserInfo,
        Name = "UserId",
        Size = UDim2.new(0.6, 0, 0, 16),
        Position = UDim2.new(0, 70, 0, 30),
        BackgroundTransparency = 1,
        Text = "ID: " .. userId,
        TextColor3 = Themes[Window.Theme].TextSecondary,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Main content area
    local ContentArea = Create("Frame", {
        Parent = MainFrame,
        Name = "ContentArea",
        Size = UDim2.new(1, 0, 1, -100),
        Position = UDim2.new(0, 0, 0, 100),
        BackgroundTransparency = 1
    })
    
    -- Tabs container (left side)
    local TabsContainer = Create("ScrollingFrame", {
        Parent = ContentArea,
        Name = "TabsContainer",
        Size = UDim2.new(0, 180, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Themes[Window.Theme].Secondary,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Themes[Window.Theme].Primary,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    Create("UICorner", {
        Parent = TabsContainer,
        CornerRadius = UDim.new(0, 0, 0, 8)
    })
    
    local TabsList = Create("UIListLayout", {
        Parent = TabsContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    -- Tab content area (right side)
    local TabContent = Create("Frame", {
        Parent = ContentArea,
        Name = "TabContent",
        Size = UDim2.new(1, -180, 1, 0),
        Position = UDim2.new(0, 180, 0, 0),
        BackgroundTransparency = 1
    })
    
    -- Current tab title
    local CurrentTabTitle = Create("TextLabel", {
        Parent = TabContent,
        Name = "CurrentTabTitle",
        Size = UDim2.new(1, 0, 0, 40),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = Themes[Window.Theme].Text,
        TextSize = 18,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    Create("UIPadding", {
        Parent = CurrentTabTitle,
        PaddingLeft = UDim.new(0, 20)
    })
    
    -- Tab content container
    local TabContentContainer = Create("ScrollingFrame", {
        Parent = TabContent,
        Name = "TabContentContainer",
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Themes[Window.Theme].Primary,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    local TabContentList = Create("UIListLayout", {
        Parent = TabContentContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    })
    
    Create("UIPadding", {
        Parent = TabContentContainer,
        PaddingLeft = UDim.new(0, 20),
        PaddingTop = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 20)
    })
    
    -- Loading indicator
    local LoadingIndicator = Create("Frame", {
        Parent = ScreenGui,
        Name = "LoadingIndicator",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.3,
        Visible = false,
        ZIndex = 100
    })
    
    local LoadingSpinner = Create("Frame", {
        Parent = LoadingIndicator,
        Size = UDim2.new(0, 60, 0, 60),
        Position = UDim2.new(0.5, -30, 0.5, -30),
        BackgroundColor3 = Themes[Window.Theme].Background,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = LoadingSpinner,
        CornerRadius = UDim.new(0, 8)
    })
    
    local LoadingText = Create("TextLabel", {
        Parent = LoadingSpinner,
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0.5, -10),
        BackgroundTransparency = 1,
        Text = "Loading...",
        TextColor3 = Themes[Window.Theme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham
    })
    
    -- Dragging functionality
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function Update(input)
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
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            Update(input)
        end
    end)
    
    -- Window controls functionality
    MinimizeButton.MouseButton1Click:Connect(function()
        Window:Minimize()
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        Window:Destroy()
    end)
    
    -- Minimize key binding
    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == Window.MinimizeKey then
            Window:Minimize()
        end
    end)
    
    -- Store references
    Window.GUI = ScreenGui
    Window.MainFrame = MainFrame
    Window.TitleBar = TitleBar
    Window.TabsContainer = TabsContainer
    Window.TabContent = TabContent
    Window.TabContentContainer = TabContentContainer
    Window.CurrentTabTitle = CurrentTabTitle
    Window.LoadingIndicator = LoadingIndicator
    
    -- Parent to player GUI
    if gethui then
        ScreenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = game:GetService("CoreGui")
    else
        ScreenGui.Parent = game:GetService("CoreGui")
    end
    
    -- Methods
    function Window:Minimize()
        self.Visible = not self.Visible
        MainFrame.Visible = self.Visible
    end
    
    function Window:Destroy()
        ScreenGui:Destroy()
    end
    
    function Window:ShowLoading(show)
        LoadingIndicator.Visible = show
    end
    
    function Window:ChangeTheme(themeName)
        if Themes[themeName] then
            Window.Theme = themeName
            local theme = Themes[themeName]
            
            -- Update all elements
            MainFrame.BackgroundColor3 = theme.Background
            TitleBar.BackgroundColor3 = theme.Secondary
            SearchBox.BackgroundColor3 = theme.Background
            SearchBox.TextColor3 = theme.Text
            SearchBox.PlaceholderColor3 = theme.TextSecondary
            SearchIcon.ImageColor3 = theme.TextSecondary
            CloseButton.TextColor3 = theme.Text
            MaximizeButton.TextColor3 = theme.Text
            MinimizeButton.TextColor3 = theme.Text
            Avatar.BackgroundColor3 = theme.Secondary
            Username.TextColor3 = theme.Text
            UserId.TextColor3 = theme.TextSecondary
            TabsContainer.BackgroundColor3 = theme.Secondary
            TabsContainer.ScrollBarImageColor3 = theme.Primary
            CurrentTabTitle.TextColor3 = theme.Text
            TabContentContainer.ScrollBarImageColor3 = theme.Primary
            LoadingSpinner.BackgroundColor3 = theme.Background
            LoadingText.TextColor3 = theme.Text
            
            -- Update existing tabs and elements
            for _, tab in pairs(self.Tabs) do
                if tab.Pill then
                    tab.Pill.BackgroundColor3 = theme.Primary
                end
                if tab.Button then
                    tab.Button.TextColor3 = theme.Text
                    tab.Button.BackgroundColor3 = theme.Secondary
                end
                
                -- Update tab elements
                if tab.Elements then
                    for _, element in pairs(tab.Elements) do
                        if element.UpdateTheme then
                            element:UpdateTheme(theme)
                        end
                    end
                end
            end
        end
    end
    
    function Window:Notify(title, content)
        local Notification = Create("Frame", {
            Parent = ScreenGui,
            Name = "Notification",
            Size = UDim2.new(0, 300, 0, 100),
            Position = UDim2.new(1, -320, 1, -120),
            BackgroundColor3 = Themes[Window.Theme].Background,
            BorderSizePixel = 0
        })
        
        Create("UICorner", {
            Parent = Notification,
            CornerRadius = UDim.new(0, 8)
        })
        
        local Shadow = Create("ImageLabel", {
            Parent = Notification,
            Image = "rbxassetid://5554236805",
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(23, 23, 277, 277),
            Size = UDim2.new(1, 34, 1, 34),
            Position = UDim2.new(0, -17, 0, -17),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 0
        })
        
        local Title = Create("TextLabel", {
            Parent = Notification,
            Size = UDim2.new(1, -20, 0, 25),
            Position = UDim2.new(0, 10, 0, 10),
            BackgroundTransparency = 1,
            Text = title,
            TextColor3 = Themes[Window.Theme].Text,
            TextSize = 16,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local Content = Create("TextLabel", {
            Parent = Notification,
            Size = UDim2.new(1, -20, 1, -45),
            Position = UDim2.new(0, 10, 0, 35),
            BackgroundTransparency = 1,
            Text = content,
            TextColor3 = Themes[Window.Theme].TextSecondary,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextWrapped = true
        })
        
        -- Auto remove after 5 seconds
        delay(5, function()
            Tween(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, -320, 1, 100)
            }):Wait()
            Notification:Destroy()
        end)
        
        return Notification
    end
    
    function Window:CreateTab(tabName)
        local Tab = {
            Name = tabName,
            Elements = {}
        }
        
        -- Tab button
        local TabButton = Create("TextButton", {
            Parent = TabsContainer,
            Size = UDim2.new(1, -20, 0, 35),
            BackgroundColor3 = Themes[Window.Theme].Secondary,
            Text = tabName,
            TextColor3 = Themes[Window.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            AutoButtonColor = false,
            BorderSizePixel = 0
        })
        
        Create("UICorner", {
            Parent = TabButton,
            CornerRadius = UDim.new(0, 6)
        })
        
        -- Selection pill
        local Pill = Create("Frame", {
            Parent = TabButton,
            Size = UDim2.new(0, 3, 0, 20),
            Position = UDim2.new(0, 5, 0.5, -10),
            BackgroundColor3 = Themes[Window.Theme].Primary,
            BorderSizePixel = 0,
            Visible = false
        })
        
        Create("UICorner", {
            Parent = Pill,
            CornerRadius = UDim.new(1, 0)
        })
        
        Tab.Button = TabButton
        Tab.Pill = Pill
        table.insert(Window.Tabs, Tab)
        
        -- Tab selection logic
        TabButton.MouseButton1Click:Connect(function()
            Window:SelectTab(Tab)
        end)
        
        -- Select first tab by default
        if #Window.Tabs == 1 then
            Window:SelectTab(Tab)
        end
        
        -- Tab methods
        function Tab:AddButton(config)
            config = config or {}
            local Button = {
                Text = config.Text or "Button",
                Callback = config.Callback or function() end
            }
            
            local ButtonFrame = Create("TextButton", {
                Parent = TabContentContainer,
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundColor3 = Themes[Window.Theme].Secondary,
                Text = "",
                AutoButtonColor = false,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = ButtonFrame,
                CornerRadius = UDim.new(0, 6)
            })
            
            local ButtonText = Create("TextLabel", {
                Parent = ButtonFrame,
                Size = UDim2.new(1, -20, 1, 0),
                Position = UDim2.new(0, 10, 0, 0),
                BackgroundTransparency = 1,
                Text = Button.Text,
                TextColor3 = Themes[Window.Theme].Text,
                TextSize = 14,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local Arrow = Create("ImageLabel", {
                Parent = ButtonFrame,
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(1, -30, 0.5, -10),
                BackgroundTransparency = 1,
                Image = "rbxassetid://3926305904",
                ImageRectOffset = Vector2.new(884, 284),
                ImageRectSize = Vector2.new(36, 36),
                ImageColor3 = Themes[Window.Theme].TextSecondary
            })
            
            -- Hover effects
            ButtonFrame.MouseEnter:Connect(function()
                Tween(ButtonFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = Themes[Window.Theme].Primary
                })
                Tween(ButtonText, TweenInfo.new(0.2), {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
            end)
            
            ButtonFrame.MouseLeave:Connect(function()
                Tween(ButtonFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = Themes[Window.Theme].Secondary
                })
                Tween(ButtonText, TweenInfo.new(0.2), {
                    TextColor3 = Themes[Window.Theme].Text
                })
            end)
            
            ButtonFrame.MouseButton1Click:Connect(function()
                Button.Callback()
            end)
            
            table.insert(Tab.Elements, Button)
            return Button
        end
        
        function Tab:AddToggle(config)
            config = config or {}
            local Toggle = {
                Text = config.Text or "Toggle",
                Default = config.Default or false,
                Callback = config.Callback or function() end,
                Value = config.Default or false
            }
            
            local ToggleFrame = Create("Frame", {
                Parent = TabContentContainer,
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundTransparency = 1
            })
            
            local ToggleText = Create("TextLabel", {
                Parent = ToggleFrame,
                Size = UDim2.new(0.7, 0, 1, 0),
                Position = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1,
                Text = Toggle.Text,
                TextColor3 = Themes[Window.Theme].Text,
                TextSize = 14,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local ToggleButton = Create("TextButton", {
                Parent = ToggleFrame,
                Size = UDim2.new(0, 50, 0, 25),
                Position = UDim2.new(1, -60, 0.5, -12.5),
                BackgroundColor3 = Themes[Window.Theme].Secondary,
                Text = "",
                AutoButtonColor = false,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = ToggleButton,
                CornerRadius = UDim.new(1, 0)
            })
            
            local ToggleKnob = Create("Frame", {
                Parent = ToggleButton,
                Size = UDim2.new(0, 21, 0, 21),
                Position = UDim2.new(0, 2, 0.5, -10.5),
                BackgroundColor3 = Themes[Window.Theme].Text,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = ToggleKnob,
                CornerRadius = UDim.new(1, 0)
            })
            
            local function UpdateToggle()
                if Toggle.Value then
                    Tween(ToggleButton, TweenInfo.new(0.2), {
                        BackgroundColor3 = Themes[Window.Theme].Primary
                    })
                    Tween(ToggleKnob, TweenInfo.new(0.2), {
                        Position = UDim2.new(0, 27, 0.5, -10.5)
                    })
                else
                    Tween(ToggleButton, TweenInfo.new(0.2), {
                        BackgroundColor3 = Themes[Window.Theme].Secondary
                    })
                    Tween(ToggleKnob, TweenInfo.new(0.2), {
                        Position = UDim2.new(0, 2, 0.5, -10.5)
                    })
                end
            end
            
            UpdateToggle()
            
            ToggleButton.MouseButton1Click:Connect(function()
                Toggle.Value = not Toggle.Value
                UpdateToggle()
                Toggle.Callback(Toggle.Value)
            end)
            
            table.insert(Tab.Elements, Toggle)
            
            function Toggle:SetValue(value)
                Toggle.Value = value
                UpdateToggle()
                Toggle.Callback(value)
            end
            
            return Toggle
        end
        
        function Tab:AddSlider(config)
            config = config or {}
            local Slider = {
                Text = config.Text or "Slider",
                Min = config.Min or 0,
                Max = config.Max or 100,
                Default = config.Default or 50,
                Callback = config.Callback or function() end,
                Value = config.Default or 50
            }
            
            local SliderFrame = Create("Frame", {
                Parent = TabContentContainer,
                Size = UDim2.new(1, 0, 0, 60),
                BackgroundTransparency = 1
            })
            
            local SliderText = Create("TextLabel", {
                Parent = SliderFrame,
                Size = UDim2.new(1, 0, 0, 20),
                Position = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1,
                Text = Slider.Text,
                TextColor3 = Themes[Window.Theme].Text,
                TextSize = 14,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local ValueText = Create("TextLabel", {
                Parent = SliderFrame,
                Size = UDim2.new(0, 60, 0, 20),
                Position = UDim2.new(1, -60, 0, 0),
                BackgroundTransparency = 1,
                Text = tostring(Slider.Value),
                TextColor3 = Themes[Window.Theme].TextSecondary,
                TextSize = 14,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Right
            })
            
            local SliderTrack = Create("Frame", {
                Parent = SliderFrame,
                Size = UDim2.new(1, 0, 0, 5),
                Position = UDim2.new(0, 0, 0, 30),
                BackgroundColor3 = Themes[Window.Theme].Secondary,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = SliderTrack,
                CornerRadius = UDim.new(1, 0)
            })
            
            local SliderFill = Create("Frame", {
                Parent = SliderTrack,
                Size = UDim2.new((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0),
                BackgroundColor3 = Themes[Window.Theme].Primary,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {
                Parent = SliderFill,
                CornerRadius = UDim.new(1, 0)
            })
            
            local SliderButton = Create("TextButton", {
                Parent = SliderTrack,
                Size = UDim2.new(0, 15, 0, 15),
                Position = UDim2.new((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), -7.5, 0.5, -7.5),
                BackgroundColor3 = Themes[Window.Theme].Text,
                Text = "",
                AutoButtonColor = false,
                BorderSizePixel = 0,
                ZIndex = 2
            })
            
            Create("UICorner", {
                Parent = SliderButton,
                CornerRadius = UDim.new(1, 0)
            })
            
            local dragging = false
            
            local function UpdateSlider(value)
                local percent = math.clamp((value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1)
                Slider.Value = math.floor(value)
                ValueText.Text = tostring(Slider.Value)
                SliderFill.Size = UDim2.new(percent, 0, 1, 0)
                SliderButton.Position = UDim2.new(percent, -7.5, 0.5, -7.5)
                Slider.Callback(Slider.Value)
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
                    local mousePos = UserInputService:GetMouseLocation()
                    local trackAbsPos = SliderTrack.AbsolutePosition
                    local trackAbsSize = SliderTrack.AbsoluteSize
                    
                    local relativeX = (mousePos.X - trackAbsPos.X) / trackAbsSize.X
                    relativeX = math.clamp(relativeX, 0, 1)
                    
                    local value = Slider.Min + relativeX * (Slider.Max - Slider.Min)
                    UpdateSlider(value)
                end
            end)
            
            table.insert(Tab.Elements, Slider)
            
            function Slider:SetValue(value)
                UpdateSlider(math.clamp(value, Slider.Min, Slider.Max))
            end
            
            return Slider
        end
        
        function Tab:AddSection(sectionName)
            local Section = {
                Name = sectionName,
                Elements = {}
            }
            
            local SectionFrame = Create("Frame", {
                Parent = TabContentContainer,
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundTransparency = 1
            })
            
            local SectionText = Create("TextLabel", {
                Parent = SectionFrame,
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = sectionName,
                TextColor3 = Themes[Window.Theme].Text,
                TextSize = 16,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local SectionLine = Create("Frame", {
                Parent = SectionFrame,
                Size = UDim2.new(1, 0, 0, 1),
                Position = UDim2.new(0, 0, 1, -1),
                BackgroundColor3 = Themes[Window.Theme].Secondary,
                BorderSizePixel = 0
            })
            
            -- Section methods
            function Section:AddButton(config)
                return Tab:AddButton(config)
            end
            
            function Section:AddToggle(config)
                return Tab:AddToggle(config)
            end
            
            function Section:AddSlider(config)
                return Tab:AddSlider(config)
            end
            
            table.insert(Tab.Elements, Section)
            return Section
        end
        
        return Tab
    end
    
    function Window:SelectTab(tab)
        -- Hide all tabs
        for _, otherTab in pairs(Window.Tabs) do
            if otherTab.Content then
                otherTab.Content.Visible = false
            end
            if otherTab.Pill then
                otherTab.Pill.Visible = false
            end
        end
        
        -- Show selected tab
        if not tab.Content then
            -- Create tab content
            local TabContentFrame = Create("ScrollingFrame", {
                Parent = TabContentContainer,
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = Themes[Window.Theme].Primary,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                Visible = true
            })
            
            local TabContentList = Create("UIListLayout", {
                Parent = TabContentFrame,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            })
            
            tab.Content = TabContentFrame
            TabContentContainer:ClearAllChildren()
            TabContentContainer.CurrentTabTitle = CurrentTabTitle
            TabContentContainer.Parent = TabContent
            
            -- Re-add elements to this tab's content
            for _, element in pairs(tab.Elements) do
                if element.Parent then
                    element.Parent = TabContentFrame
                end
            end
        else
            tab.Content.Visible = true
            TabContentContainer:ClearAllChildren()
            tab.Content.Parent = TabContentContainer
        end
        
        -- Update UI
        tab.Pill.Visible = true
        CurrentTabTitle.Text = tab.Name
        Window.CurrentTab = tab
    end
    
    return Window
end

return NazuX
