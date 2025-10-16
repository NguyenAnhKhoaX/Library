--[[
    NazuX Library - Transparent UI Only
    Created by NazuX
    Version: 1.6
--]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Local variables
local localPlayer = Players.LocalPlayer

-- Color themes - CHỈ UI TRONG SUỐT, CÁC PHẦN KHÁC KHÔNG TRONG SUỐT
local Themes = {
    Dark = {
        Main = Color3.fromRGB(32, 34, 37),
        Secondary = Color3.fromRGB(47, 49, 54),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(88, 101, 242),
        Transparency = 0.95  -- CHỈ UI BACKGROUND TRONG SUỐT
    },
    Light = {
        Main = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(0, 122, 255),
        Transparency = 0.95
    },
    Red = {
        Main = Color3.fromRGB(54, 23, 23),
        Secondary = Color3.fromRGB(82, 32, 32),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(220, 53, 69),
        Transparency = 0.95
    },
    Yellow = {
        Main = Color3.fromRGB(54, 47, 23),
        Secondary = Color3.fromRGB(82, 71, 32),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 193, 7),
        Transparency = 0.95
    },
    AMOLED = {
        Main = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(10, 10, 10),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 255, 255),
        Transparency = 0.92
    },
    Rose = {
        Main = Color3.fromRGB(40, 20, 29),
        Secondary = Color3.fromRGB(60, 30, 44),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(235, 150, 178),
        Transparency = 0.95
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
    
    -- Main container - CHỈ BACKGROUND TRONG SUỐT
    local MainFrame = Create("Frame", {
        Parent = ScreenGui,
        Size = UDim2.new(0, 550, 0, 400),
        Position = UDim2.new(0.5, -275, 0.5, -200),
        BackgroundColor3 = Themes[Theme].Main,
        BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        ClipsDescendants = true
    })
    
    Create("UICorner", {Parent = MainFrame, CornerRadius = UDim.new(0, 12)})
    
    -- Title bar - CHỈ BACKGROUND TRONG SUỐT
    local TitleBar = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        BorderSizePixel = 0
    })
    
    Create("UICorner", {Parent = TitleBar, CornerRadius = UDim.new(0, 12)})
    
    -- Drag functionality
    local dragging = false
    local dragStart, startPos

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    -- Title text - KHÔNG TRONG SUỐT
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
    
    -- Control buttons - CHỈ BACKGROUND TRONG SUỐT
    local MinimizeButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -70, 0.5, -15),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        Text = "-",
        TextColor3 = Themes[Theme].Text,
        TextSize = 18,
        Font = Enum.Font.GothamBold
    })
    
    Create("UICorner", {Parent = MinimizeButton, CornerRadius = UDim.new(0, 6)})
    
    local CloseButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -35, 0.5, -15),
        BackgroundColor3 = Color3.fromRGB(232, 72, 72),
        BackgroundTransparency = 0, -- NÚT ĐÓNG KHÔNG TRONG SUỐT
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold
    })
    
    Create("UICorner", {Parent = CloseButton, CornerRadius = UDim.new(0, 6)})
    
    -- Theme buttons - CHỈ BACKGROUND TRONG SUỐT
    local ThemeButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -105, 0.5, -15),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        Text = "🎨",
        TextColor3 = Themes[Theme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold
    })
    
    Create("UICorner", {Parent = ThemeButton, CornerRadius = UDim.new(0, 6)})
    
    local SpecialThemeButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -140, 0.5, -15),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        Text = "🌟",
        TextColor3 = Themes[Theme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold
    })
    
    Create("UICorner", {Parent = SpecialThemeButton, CornerRadius = UDim.new(0, 6)})
    
    -- Content area - KHÔNG TRONG SUỐT
    local ContentArea = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1
    })
    
    -- Left sidebar - CHỈ BACKGROUND TRONG SUỐT
    local LeftSidebar = Create("Frame", {
        Parent = ContentArea,
        Size = UDim2.new(0, 180, 1, 0),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        BorderSizePixel = 0
    })
    
    Create("UICorner", {Parent = LeftSidebar, CornerRadius = UDim.new(0, 8)})
    
    -- User info section - KHÔNG TRONG SUỐT
    local UserInfoFrame = Create("Frame", {
        Parent = LeftSidebar,
        Size = UDim2.new(1, -10, 0, 80),
        Position = UDim2.new(0, 5, 0, 5),
        BackgroundTransparency = 1
    })
    
    -- Avatar - CHỈ BACKGROUND TRONG SUỐT
    local Avatar = Create("ImageLabel", {
        Parent = UserInfoFrame,
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.new(0, 5, 0, 5),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        BorderSizePixel = 0,
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. localPlayer.UserId .. "&width=150&height=150&format=png"
    })
    
    Create("UICorner", {Parent = Avatar, CornerRadius = UDim.new(1, 0)})
    
    -- Username - KHÔNG TRONG SUỐT
    local UsernameLabel = Create("TextLabel", {
        Parent = UserInfoFrame,
        Size = UDim2.new(1, -65, 0, 20),
        Position = UDim2.new(0, 60, 0, 15),
        BackgroundTransparency = 1,
        Text = localPlayer.Name,
        TextColor3 = Themes[Theme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Display name - KHÔNG TRONG SUỐT
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
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Search bar - CHỈ BACKGROUND TRONG SUỐT
    local SearchContainer = Create("Frame", {
        Parent = LeftSidebar,
        Size = UDim2.new(1, -10, 0, 35),
        Position = UDim2.new(0, 5, 0, 90),
        BackgroundColor3 = Themes[Theme].Main,
        BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        BorderSizePixel = 0
    })
    
    Create("UICorner", {Parent = SearchContainer, CornerRadius = UDim.new(0, 6)})
    
    -- Search box - KHÔNG TRONG SUỐT
    local SearchBox = Create("TextBox", {
        Parent = SearchContainer,
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 35, 0, 0),
        BackgroundTransparency = 1,
        Text = "Search...",
        PlaceholderText = "Search...",
        TextColor3 = Themes[Theme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Tabs container - KHÔNG TRONG SUỐT
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
    
    -- Right content area - CHỈ BACKGROUND TRONG SUỐT
    local RightContent = Create("Frame", {
        Parent = ContentArea,
        Size = UDim2.new(1, -185, 1, -10),
        Position = UDim2.new(0, 185, 0, 5),
        BackgroundColor3 = Themes[Theme].Secondary,
        BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        BorderSizePixel = 0
    })
    
    Create("UICorner", {Parent = RightContent, CornerRadius = UDim.new(0, 8)})
    
    -- Window state
    local IsMinimized = false
    local OriginalSize = MainFrame.Size
    
    -- Minimize functionality
    MinimizeButton.MouseButton1Click:Connect(function()
        if IsMinimized then
            -- Restore
            MainFrame.Size = OriginalSize
            ContentArea.Visible = true
            IsMinimized = false
        else
            -- Minimize
            OriginalSize = MainFrame.Size
            MainFrame.Size = UDim2.new(0, 550, 0, 40)
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
        
        -- CHỈ ÁP DỤNG TRONG SUỐT CHO BACKGROUND CÁC FRAME
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
        RightContent.BackgroundColor3 = theme.Secondary
        RightContent.BackgroundTransparency = theme.Transparency
        TabsContainer.ScrollBarImageColor3 = theme.Accent
        Avatar.BackgroundColor3 = theme.Secondary
        Avatar.BackgroundTransparency = theme.Transparency
    end
    
    -- Theme selection popup - CHỈ BACKGROUND TRONG SUỐT
    local function ShowThemeSelector(isSpecial)
        local ThemePopup = Create("Frame", {
            Parent = ScreenGui,
            Size = UDim2.new(0, 200, 0, 200),
            Position = UDim2.new(0.5, -100, 0.5, -100),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
            ZIndex = 30
        })
        
        Create("UICorner", {Parent = ThemePopup, CornerRadius = UDim.new(0, 8)})
        
        local ThemeList = Create("ScrollingFrame", {
            Parent = ThemePopup,
            Size = UDim2.new(1, -10, 1, -10),
            Position = UDim2.new(0, 5, 0, 5),
            BackgroundTransparency = 1, -- KHÔNG TRONG SUỐT
            ScrollBarThickness = 3,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ZIndex = 31
        })
        
        Create("UIListLayout", {
            Parent = ThemeList,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 5)
        })
        
        local themesToShow = isSpecial and {"AMOLED", "Rose"} or {"Dark", "Light", "Red", "Yellow"}
        
        for _, themeName in ipairs(themesToShow) do
            local ThemeButton = Create("TextButton", {
                Parent = ThemeList,
                Size = UDim2.new(1, 0, 0, 35),
                BackgroundColor3 = Themes[Theme].Secondary,
                BackgroundTransparency = 0, -- NÚT KHÔNG TRONG SUỐT
                Text = themeName,
                TextColor3 = Themes[Theme].Text,
                TextSize = 14,
                Font = Enum.Font.Gotham,
                LayoutOrder = #ThemeList:GetChildren(),
                ZIndex = 32
            })
            
            Create("UICorner", {Parent = ThemeButton, CornerRadius = UDim.new(0, 6)})
            
            ThemeButton.MouseButton1Click:Connect(function()
                ApplyTheme(themeName)
                Theme = themeName
                ThemePopup:Destroy()
                if BackgroundOverlay then
                    BackgroundOverlay:Destroy()
                end
            end)
        end
        
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
        
        BackgroundOverlay.MouseButton1Click:Connect(function()
            ThemePopup:Destroy()
            BackgroundOverlay:Destroy()
        end)
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
        -- Tab button - CHỈ BACKGROUND TRONG SUỐT
        local TabButton = Create("TextButton", {
            Parent = TabsContainer,
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
            Text = name,
            TextColor3 = Themes[Theme].Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold
        })
        
        Create("UICorner", {Parent = TabButton, CornerRadius = UDim.new(0, 6)})
        
        local TabContent = Create("ScrollingFrame", {
            Parent = RightContent,
            Size = UDim2.new(1, -10, 1, -10),
            Position = UDim2.new(0, 5, 0, 5),
            BackgroundTransparency = 1, -- KHÔNG TRONG SUỐT
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
            Padding = UDim.new(0, 8)
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
                CurrentTab.Button.BackgroundColor3 = Themes[Theme].Main
                CurrentTab.Button.BackgroundTransparency = Themes[Theme].Transparency
            end
            
            CurrentTab = Tab
            TabContent.Visible = true
            TabButton.BackgroundColor3 = Themes[Theme].Accent
            TabButton.BackgroundTransparency = 0 -- TAB ACTIVE KHÔNG TRONG SUỐT
        end)
        
        if #Tabs == 1 then
            TabButton:MouseButton1Click()
        end
        
        -- Search functionality
        SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
            local searchText = string.lower(SearchBox.Text)
            for _, element in pairs(Tab.Elements) do
                if element.Name then
                    local visible = searchText == "" or string.find(string.lower(element.Name), searchText, 1, true)
                    element.Visible = visible
                end
            end
        end)
        
        return Tab
    end
    
    function Window:AddButton(tab, options)
        options = options or {}
        local name = options.Name or "Button"
        local callback = options.Callback or function() end
        
        -- Button - CHỈ BACKGROUND TRONG SUỐT
        local Button = Create("TextButton", {
            Parent = tab.Content,
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
            Text = name,
            TextColor3 = Themes[Theme].Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            LayoutOrder = #tab.Elements + 1
        })
        
        Button.Name = name
        
        Create("UICorner", {Parent = Button, CornerRadius = UDim.new(0, 6)})
        
        Button.MouseButton1Click:Connect(callback)
        
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
            BackgroundTransparency = 1, -- KHÔNG TRONG SUỐT
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
        
        -- Toggle button - CHỈ BACKGROUND TRONG SUỐT
        local ToggleButton = Create("TextButton", {
            Parent = ToggleFrame,
            Size = UDim2.new(0, 50, 0, 25),
            Position = UDim2.new(1, -55, 0.5, -12.5),
            BackgroundColor3 = default and Themes[Theme].Accent or Themes[Theme].Main,
            BackgroundTransparency = default and 0 : Themes[Theme].Transparency, -- UI TRONG SUỐT
            Text = "",
            AutoButtonColor = false
        })
        
        Create("UICorner", {Parent = ToggleButton, CornerRadius = UDim.new(1, 0)})
        
        -- Toggle knob - KHÔNG TRONG SUỐT
        local ToggleKnob = Create("Frame", {
            Parent = ToggleButton,
            Size = UDim2.new(0, 19, 0, 19),
            Position = UDim2.new(0, default and 27 or 3, 0.5, -9.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0 -- KHÔNG TRONG SUỐT
        })
        
        Create("UICorner", {Parent = ToggleKnob, CornerRadius = UDim.new(1, 0)})
        
        local isToggled = default
        
        ToggleButton.MouseButton1Click:Connect(function()
            isToggled = not isToggled
            ToggleButton.BackgroundColor3 = isToggled and Themes[Theme].Accent or Themes[Theme].Main
            ToggleButton.BackgroundTransparency = isToggled and 0 : Themes[Theme].Transparency
            ToggleKnob.Position = UDim2.new(0, isToggled and 27 or 3, 0.5, -9.5)
            callback(isToggled)
        end)
        
        table.insert(tab.Elements, ToggleFrame)
        
        return {
            Set = function(value)
                isToggled = value
                ToggleButton.BackgroundColor3 = isToggled and Themes[Theme].Accent or Themes[Theme].Main
                ToggleButton.BackgroundTransparency = isToggled and 0 : Themes[Theme].Transparency
                ToggleKnob.Position = UDim2.new(0, isToggled and 27 or 3, 0.5, -9.5)
            end,
            Get = function() return isToggled end
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
            BackgroundTransparency = 1, -- KHÔNG TRONG SUỐT
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
        
        -- Slider track - CHỈ BACKGROUND TRONG SUỐT
        local SliderTrack = Create("Frame", {
            Parent = SliderFrame,
            Size = UDim2.new(1, 0, 0, 5),
            Position = UDim2.new(0, 0, 0, 35),
            BackgroundColor3 = Themes[Theme].Main,
            BackgroundTransparency = Themes[Theme].Transparency, -- UI TRONG SUỐT
        })
        
        Create("UICorner", {Parent = SliderTrack, CornerRadius = UDim.new(1, 0)})
        
        -- Slider fill - KHÔNG TRONG SUỐT
        local SliderFill = Create("Frame", {
            Parent = SliderTrack,
            Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
            BackgroundColor3 = Themes[Theme].Accent,
            BackgroundTransparency = 0 -- KHÔNG TRONG SUỐT
        })
        
        Create("UICorner", {Parent = SliderFill, CornerRadius = UDim.new(1, 0)})
        
        -- Slider button - KHÔNG TRONG SUỐT
        local SliderButton = Create("TextButton", {
            Parent = SliderTrack,
            Size = UDim2.new(0, 15, 0, 15),
            Position = UDim2.new((default - min) / (max - min), -7.5, 0.5, -7.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0, -- KHÔNG TRONG SUỐT
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
        
        UserInputService.InputChanged:Connect(function(input)
            if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local percentage = math.clamp((input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
                local value = min + (max - min) * percentage
                UpdateSlider(value)
            end
        end)
        
        table.insert(tab.Elements, SliderFrame)
        
        return {
            Set = function(value) UpdateSlider(math.clamp(value, min, max)) end,
            Get = function() return tonumber(ValueLabel.Text) end
        }
    end
    
    function Window:AddLabel(tab, options)
        options = options or {}
        local text = options.Text or "Label"
        
        local Label = Create("TextLabel", {
            Parent = tab.Content,
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundTransparency = 1, -- KHÔNG TRONG SUỐT
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
    
    return Window
end

return NazuX
