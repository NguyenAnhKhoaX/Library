--[[
    NazuX Library - FIXED VERSION
    Đã sửa lỗi không hiển thị tab và nút
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Local Variables
local LocalPlayer = Players.LocalPlayer

-- Icon Assets
local Icons = {
    Logo = "rbxassetid://10709761813",
    Search = "rbxassetid://10734943674",
    Fingerprint = "rbxassetid://10723375250",
    Home = "rbxassetid://10723407389",
    Settings = "rbxassetid://10734950309",
    Scripts = "rbxassetid://10734951038",
    Player = "rbxassetid://10747373176",
    Check = "rbxassetid://10709790644",
    Minimize = "rbxassetid://10734895698",
    Close = "rbxassetid://10747384394",
    Game = "rbxassetid://10723395457",
    Visual = "rbxassetid://10723375128",
    Combat = "rbxassetid://10734975692",
    Movement = "rbxassetid://10709775894",
    Teleport = "rbxassetid://10734922971",
}

-- Colors
local Colors = {
    Dark = {
        Background = Color3.fromRGB(30, 30, 30),
        Secondary = Color3.fromRGB(40, 40, 40),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(60, 60, 60)
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

local function Tween(Object, Properties, Duration)
    local TweenInfo = TweenInfo.new(Duration or 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
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
        CurrentTheme = "Dark"
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
        BackgroundColor3 = Colors.Dark.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    Create("UICorner", {Parent = MainFrame, CornerRadius = UDim.new(0, 8)})
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Parent = MainFrame,
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Colors.Dark.Secondary,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {Parent = TitleBar, CornerRadius = UDim.new(0, 8)})
    
    -- Logo
    Create("ImageLabel", {
        Parent = TitleBar,
        Size = UDim2.new(0, 25, 0, 25),
        Position = UDim2.new(0, 10, 0.5, -12.5),
        BackgroundTransparency = 1,
        Image = options.Icon or Icons.Logo,
        ImageColor3 = Colors.Dark.Accent
    })
    
    -- Title
    Create("TextLabel", {
        Parent = TitleBar,
        Size = UDim2.new(1, -100, 1, 0),
        Position = UDim2.new(0, 40, 0, 0),
        BackgroundTransparency = 1,
        Text = options.Title or "NazuX Library",
        TextColor3 = Colors.Dark.Text,
        TextSize = 16,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Center
    })
    
    -- Control Buttons
    local MinimizeButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -70, 0.5, -15),
        BackgroundColor3 = Colors.Dark.Secondary,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("ImageLabel", {
        Parent = MinimizeButton,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0.5, -10, 0.5, -10),
        BackgroundTransparency = 1,
        Image = Icons.Minimize,
        ImageColor3 = Colors.Dark.Text
    })
    
    local CloseButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -30, 0.5, -15),
        BackgroundColor3 = Colors.Dark.Secondary,
        Text = "",
        AutoButtonColor = false
    })
    
    Create("ImageLabel", {
        Parent = CloseButton,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0.5, -10, 0.5, -10),
        BackgroundTransparency = 1,
        Image = Icons.Close,
        ImageColor3 = Colors.Dark.Text
    })
    
    Create("UICorner", {Parent = MinimizeButton, CornerRadius = UDim.new(0, 4)})
    Create("UICorner", {Parent = CloseButton, CornerRadius = UDim.new(0, 4)})
    
    -- Tab Container
    local TabContainer = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(0, 150, 1, -160),
        Position = UDim2.new(0, 10, 0, 160),
        BackgroundTransparency = 1
    })
    
    Create("UIListLayout", {
        Parent = TabContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    -- Content Container
    local ContentContainer = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(1, -180, 1, -170),
        Position = UDim2.new(0, 170, 0, 160),
        BackgroundColor3 = Colors.Dark.Secondary,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    Create("UICorner", {Parent = ContentContainer, CornerRadius = UDim.new(0, 8)})
    
    local ContentScrolling = Create("ScrollingFrame", {
        Parent = ContentContainer,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Colors.Dark.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    Create("UIListLayout", {
        Parent = ContentScrolling,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    })
    
    Create("UIPadding", {
        Parent = ContentScrolling,
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10)
    })
    
    -- Button functionality
    MinimizeButton.MouseButton1Click:Connect(function()
        Window.Minimized = not Window.Minimized
        if Window.Minimized then
            Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 40)}, 0.3)
        else
            Tween(MainFrame, {Size = UDim2.new(0, 600, 0, 400)}, 0.3)
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Make draggable
    local Dragging, DragInput, DragStart, StartPos
    
    local function Update(input)
        local Delta = input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
    
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
            Update(input)
        end
    end)
    
    -- Public Methods
    function Window:AddTab(tabName, iconName)
        local tabIcon = Icons[iconName] or Icons.Scripts
        
        -- Tab Button
        local TabButton = Create("TextButton", {
            Parent = TabContainer,
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundColor3 = Colors.Dark.Secondary,
            Text = "",
            AutoButtonColor = false
        })
        
        Create("UICorner", {Parent = TabButton, CornerRadius = UDim.new(0, 6)})
        
        -- Tab Icon
        Create("ImageLabel", {
            Parent = TabButton,
            Size = UDim2.new(0, 20, 0, 20),
            Position = UDim2.new(0, 10, 0.5, -10),
            BackgroundTransparency = 1,
            Image = tabIcon,
            ImageColor3 = Colors.Dark.Text
        })
        
        -- Tab Label
        Create("TextLabel", {
            Parent = TabButton,
            Size = UDim2.new(1, -40, 1, 0),
            Position = UDim2.new(0, 35, 0, 0),
            BackgroundTransparency = 1,
            Text = tabName,
            TextColor3 = Colors.Dark.Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local TabHighlight = Create("Frame", {
            Parent = TabButton,
            Size = UDim2.new(0, 3, 0.6, 0),
            Position = UDim2.new(0, 5, 0.2, 0),
            BackgroundColor3 = Colors.Dark.Accent,
            Visible = false,
            BorderSizePixel = 0
        })
        
        Create("UICorner", {Parent = TabHighlight, CornerRadius = UDim.new(1, 0)})
        
        -- Tab Content
        local TabContent = Create("ScrollingFrame", {
            Parent = ContentScrolling,
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 0,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false
        })
        
        Create("UIListLayout", {
            Parent = TabContent,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        })
        
        -- Store tab data
        local tabData = {
            Button = TabButton,
            Highlight = TabHighlight,
            Content = TabContent
        }
        
        table.insert(Window.Tabs, tabData)
        
        -- Tab selection function
        local function SelectTab()
            if Window.CurrentTab then
                Window.CurrentTab.Button.BackgroundColor3 = Colors.Dark.Secondary
                Window.CurrentTab.Highlight.Visible = false
                Window.CurrentTab.Content.Visible = false
            end
            
            Window.CurrentTab = tabData
            TabButton.BackgroundColor3 = Color3.fromRGB(
                Colors.Dark.Accent.R * 0.2 + Colors.Dark.Secondary.R * 0.8,
                Colors.Dark.Accent.G * 0.2 + Colors.Dark.Secondary.G * 0.8,
                Colors.Dark.Accent.B * 0.2 + Colors.Dark.Secondary.B * 0.8
            )
            TabHighlight.Visible = true
            TabContent.Visible = true
        end
        
        TabButton.MouseButton1Click:Connect(SelectTab)
        
        -- Auto-select first tab
        if #Window.Tabs == 1 then
            SelectTab()
        end
        
        -- Return tab methods
        local TabMethods = {}
        
        function TabMethods:AddButton(options)
            options = options or {}
            
            local Button = Create("TextButton", {
                Parent = TabContent,
                Size = UDim2.new(1, 0, 0, 35),
                BackgroundColor3 = Colors.Dark.Secondary,
                Text = "",
                AutoButtonColor = false,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            Create("UICorner", {Parent = Button, CornerRadius = UDim.new(0, 6)})
            
            Create("TextLabel", {
                Parent = Button,
                Size = UDim2.new(0.7, 0, 1, 0),
                Position = UDim2.new(0, 10, 0, 0),
                BackgroundTransparency = 1,
                Text = options.Name or "Button",
                TextColor3 = Colors.Dark.Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            Create("ImageLabel", {
                Parent = Button,
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(1, -30, 0.5, -10),
                BackgroundTransparency = 1,
                Image = Icons.Fingerprint,
                ImageColor3 = Colors.Dark.Text
            })
            
            Button.MouseButton1Click:Connect(function()
                if options.Callback then
                    options.Callback()
                end
            end)
            
            return Button
        end
        
        function TabMethods:AddToggle(options)
            options = options or {}
            local Toggle = {Value = options.Default or false}
            
            local ToggleFrame = Create("Frame", {
                Parent = TabContent,
                Size = UDim2.new(1, 0, 0, 35),
                BackgroundTransparency = 1,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            Create("TextLabel", {
                Parent = ToggleFrame,
                Size = UDim2.new(0.7, 0, 1, 0),
                Position = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1,
                Text = options.Name or "Toggle",
                TextColor3 = Colors.Dark.Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            
            local ToggleButton = Create("TextButton", {
                Parent = ToggleFrame,
                Size = UDim2.new(0, 40, 0, 20),
                Position = UDim2.new(1, -40, 0.5, -10),
                BackgroundColor3 = Colors.Dark.Secondary,
                Text = "",
                AutoButtonColor = false,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {Parent = ToggleButton, CornerRadius = UDim.new(1, 0)})
            
            local ToggleIndicator = Create("Frame", {
                Parent = ToggleButton,
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 2, 0.5, -8),
                BackgroundColor3 = Colors.Dark.Text,
                BorderSizePixel = 0
            })
            
            Create("UICorner", {Parent = ToggleIndicator, CornerRadius = UDim.new(1, 0)})
            
            local function UpdateToggle()
                if Toggle.Value then
                    ToggleButton.BackgroundColor3 = Colors.Dark.Accent
                    ToggleIndicator.Position = UDim2.new(1, -18, 0.5, -8)
                    ToggleIndicator.BackgroundColor3 = Color3.new(1, 1, 1)
                else
                    ToggleButton.BackgroundColor3 = Colors.Dark.Secondary
                    ToggleIndicator.Position = UDim2.new(0, 2, 0.5, -8)
                    ToggleIndicator.BackgroundColor3 = Colors.Dark.Text
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
            return Toggle
        end
        
        function TabMethods:AddSection(sectionName)
            local SectionFrame = Create("Frame", {
                Parent = TabContent,
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundTransparency = 1,
                LayoutOrder = #TabContent:GetChildren()
            })
            
            Create("TextLabel", {
                Parent = SectionFrame,
                Size = UDim2.new(1, 0, 0, 20),
                BackgroundTransparency = 1,
                Text = sectionName,
                TextColor3 = Colors.Dark.Text,
                TextSize = 16,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Center
            })
            
            Create("Frame", {
                Parent = SectionFrame,
                Size = UDim2.new(1, 0, 0, 1),
                Position = UDim2.new(0, 0, 1, -10),
                BackgroundColor3 = Colors.Dark.Accent,
                BorderSizePixel = 0
            })
            
            return SectionFrame
        end
        
        return TabMethods
    end
    
    ScreenGui.Parent = game.CoreGui
    
    return Window
end

return NazuX
