-- NazuX Library - Enhanced with Search Bar & UI Controls
local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

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

-- Icons Library
local Icons = {
    ["home"] = "rbxassetid://6026568195",
    ["settings"] = "rbxassetid://6031280882",
    ["search"] = "rbxassetid://6031286427",
    ["folder"] = "rbxassetid://6031287517",
    ["code"] = "rbxassetid://6031304517",
    ["person"] = "rbxassetid://6031215982",
    ["star"] = "rbxassetid://6031302931",
    ["shield"] = "rbxassetid://6031301084"
}

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowName = options.Name or "NazuX Hub"
    local Size = options.Size or UDim2.new(0, 650, 0, 450)
    local Position = options.Position or UDim2.new(0.5, -325, 0.5, -225)
    local ToggleKey = options.ToggleKey or Enum.KeyCode.LeftControl
    
    local NazuXLibrary = {}
    local LocalPlayer = Players.LocalPlayer
    
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
    
    -- Main Container
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = Position,
        Size = Size,
        Active = true,
        Draggable = true,
        Parent = ScreenGui
    })
    
    local UICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = MainFrame
    })
    
    local UIStroke = Create("UIStroke", {
        Color = Color3.fromRGB(60, 60, 60),
        Thickness = 2,
        Parent = MainFrame
    })
    
    -- Title Bar
    local TopFrame = Create("Frame", {
        Name = "TopFrame",
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 35),
        Parent = MainFrame
    })
    
    local UICornerTop = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = TopFrame
    })
    
    local Title = Create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        Font = Enum.Font.GothamBold,
        Text = WindowName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopFrame
    })
    
    -- Window Controls
    local ControlsFrame = Create("Frame", {
        Name = "ControlsFrame",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -90, 0, 0),
        Size = UDim2.new(0, 90, 1, 0),
        Parent = TopFrame
    })
    
    -- Minimize Button (-)
    local MinimizeButton = Create("TextButton", {
        Name = "MinimizeButton",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0.5, -8),
        Size = UDim2.new(0, 25, 0, 16),
        Font = Enum.Font.GothamBold,
        Text = "-",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        AutoButtonColor = false,
        Parent = ControlsFrame
    })
    
    -- Maximize Button (□)
    local MaximizeButton = Create("TextButton", {
        Name = "MaximizeButton",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 30, 0.5, -8),
        Size = UDim2.new(0, 25, 0, 16),
        Font = Enum.Font.Gotham,
        Text = "□",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        AutoButtonColor = false,
        Parent = ControlsFrame
    })
    
    -- Close Button (X) - No Background
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 60, 0.5, -8),
        Size = UDim2.new(0, 25, 0, 16),
        Font = Enum.Font.GothamBold,
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        AutoButtonColor = false,
        Parent = ControlsFrame
    })
    
    -- Search Bar (Between TitleBar and User Info)
    local SearchContainer = Create("Frame", {
        Name = "SearchContainer",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BackgroundTransparency = 0.2,
        Position = UDim2.new(0, 15, 0, 45),
        Size = UDim2.new(1, -30, 0, 35),
        Parent = MainFrame
    })
    
    local SearchCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = SearchContainer
    })
    
    local SearchIcon = Create("ImageLabel", {
        Name = "SearchIcon",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -8),
        Size = UDim2.new(0, 16, 0, 16),
        Image = Icons["search"],
        Parent = SearchContainer
    })
    
    local SearchBox = Create("TextBox", {
        Name = "SearchBox",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 35, 0, 0),
        Size = UDim2.new(1, -40, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "",
        PlaceholderText = "Search features...",
        PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SearchContainer
    })
    
    -- User Info (Above Tabs)
    local UserInfoFrame = Create("Frame", {
        Name = "UserInfoFrame",
        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 15, 0, 90),
        Size = UDim2.new(0, 170, 0, 60),
        Parent = MainFrame
    })
    
    local UserInfoCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = UserInfoFrame
    })
    
    -- Roblox Avatar
    local UserAvatar = Create("ImageLabel", {
        Name = "UserAvatar",
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        Position = UDim2.new(0, 10, 0.5, -20),
        Size = UDim2.new(0, 40, 0, 40),
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=150&height=150&format=png",
        Parent = UserInfoFrame
    })
    
    local AvatarCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = UserAvatar
    })
    
    -- User Name (Right side of avatar)
    local UserName = Create("TextLabel", {
        Name = "UserName",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 60, 0, 10),
        Size = UDim2.new(1, -65, 0, 20),
        Font = Enum.Font.GothamSemibold,
        Text = LocalPlayer.Name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = UserInfoFrame
    })
    
    local UserId = Create("TextLabel", {
        Name = "UserId",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 60, 0, 30),
        Size = UDim2.new(1, -65, 0, 15),
        Font = Enum.Font.Gotham,
        Text = "ID: " .. LocalPlayer.UserId,
        TextColor3 = Color3.fromRGB(150, 150, 150),
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = UserInfoFrame
    })
    
    -- Tabs Container (Below User Info)
    local TabsContainer = Create("ScrollingFrame", {
        Name = "TabsContainer",
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 15, 0, 160),
        Size = UDim2.new(0, 170, 1, -175),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
        Parent = MainFrame
    })
    
    local TabsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        Parent = TabsContainer
    })
    
    local TabsPadding = Create("UIPadding", {
        PaddingTop = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        Parent = TabsContainer
    })
    
    TabsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabsContainer.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y + 10)
    end)
    
    -- Content Area
    local ContentArea = Create("Frame", {
        Name = "ContentArea",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 200, 0, 45),
        Size = UDim2.new(1, -210, 1, -50),
        Parent = MainFrame
    })
    
    -- Tab Management
    local CurrentTab = nil
    local TabContents = {}
    local TabButtons = {}
    local OriginalSize = Size
    local OriginalPosition = Position
    local IsMaximized = false
    local IsMinimized = false
    
    function NazuXLibrary:CreateTab(TabName, IconName)
        local TabFunctions = {}
        
        -- Tab Button với icon bên trái, title ở giữa
        local TabButton = Create("TextButton", {
            Name = TabName .. "TabButton",
            BackgroundColor3 = Color3.fromRGB(40, 40, 40),
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 40),
            Font = Enum.Font.Gotham,
            Text = "",
            AutoButtonColor = false,
            Parent = TabsContainer
        })
        
        local TabButtonUICorner = Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = TabButton
        })
        
        local TabIcon = Create("ImageLabel", {
            Name = "TabIcon",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 10, 0.5, -10),
            Size = UDim2.new(0, 20, 0, 20),
            Image = Icons[IconName] or Icons["folder"],
            Parent = TabButton
        })
        
        local TabLabel = Create("TextLabel", {
            Name = "TabLabel",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 40, 0, 0),
            Size = UDim2.new(1, -50, 1, 0),
            Font = Enum.Font.GothamSemibold,
            Text = TabName,
            TextColor3 = Color3.fromRGB(200, 200, 200),
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Center,
            Parent = TabButton
        })
        
        -- Tab Content
        local TabContent = Create("ScrollingFrame", {
            Name = TabName .. "Content",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
            Visible = false,
            Parent = ContentArea
        })
        
        local TabContentListLayout = Create("UIListLayout", {
            Padding = UDim.new(0, 8),
            Parent = TabContent
        })
        
        local TabContentPadding = Create("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            Parent = TabContent
        })
        
        TabContentListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentListLayout.AbsoluteContentSize.Y + 20)
        end)
        
        TabContents[TabName] = TabContent
        TabButtons[TabName] = TabButton
        
        -- Tab Selection Function
        local function SelectTab()
            if CurrentTab then
                CurrentTab.Visible = false
                -- Reset previous tab buttons
                for name, btn in pairs(TabButtons) do
                    if name ~= TabName then
                        Tween(btn, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, 0.2)
                        Tween(btn.TabLabel, {TextColor3 = Color3.fromRGB(200, 200, 200)}, 0.2)
                    end
                end
            end
            
            CurrentTab = TabContent
            TabContent.Visible = true
            
            -- Highlight selected tab
            Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(0, 120, 215)}, 0.2)
            Tween(TabLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
        end
        
        TabButton.MouseButton1Click:Connect(SelectTab)
        
        -- Hover Effects
        TabButton.MouseEnter:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, 0.2)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, 0.2)
            end
        end)
        
        -- Button Function
        function TabFunctions:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            local ButtonName = ButtonConfig.Name or "Button"
            local Callback = ButtonConfig.Callback or function() end
            
            local ButtonContainer = Create("Frame", {
                Name = ButtonName .. "Container",
                BackgroundColor3 = Color3.fromRGB(45, 45, 45),
                BackgroundTransparency = 0.1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 40),
                Parent = TabContent
            })
            
            local ButtonCorner = Create("UICorner", {
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
                AutoButtonColor = false,
                Parent = ButtonContainer
            })
            
            -- Button Animations
            Button.MouseEnter:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}, 0.2)
            end)
            
            Button.MouseButton1Click:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(0, 100, 200)}, 0.1)
                wait(0.1)
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}, 0.1)
                Callback()
            end)
            
            return Button
        end
        
        -- Auto-select first tab
        if not CurrentTab then
            SelectTab()
        end
        
        return TabFunctions
    end
    
    -- Window Controls Functionality
    local function ToggleMinimize()
        if IsMinimized then
            -- Show UI
            MainFrame.Visible = true
            Tween(MainFrame, {
                Size = IsMaximized and UDim2.new(1, -40, 1, -40) or OriginalSize,
                Position = IsMaximized and UDim2.new(0, 20, 0, 20) or OriginalPosition,
                BackgroundTransparency = 0.1
            }, 0.3)
        else
            -- Hide UI
            Tween(MainFrame, {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1
            }, 0.3)
            wait(0.3)
            MainFrame.Visible = false
        end
        IsMinimized = not IsMinimized
    end
    
    local function ToggleMaximize()
        if IsMaximized then
            -- Restore original size
            Tween(MainFrame, {
                Size = OriginalSize,
                Position = OriginalPosition
            }, 0.3)
            MaximizeButton.Text = "□"
        else
            -- Maximize to screen
            Tween(MainFrame, {
                Size = UDim2.new(1, -40, 1, -40),
                Position = UDim2.new(0, 20, 0, 20)
            }, 0.3)
            MaximizeButton.Text = "❐"
        end
        IsMaximized = not IsMaximized
    end
    
    -- Control Button Animations
    MinimizeButton.MouseEnter:Connect(function()
        Tween(MinimizeButton, {TextColor3 = Color3.fromRGB(200, 200, 100)}, 0.2)
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        Tween(MinimizeButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
    end)
    
    MaximizeButton.MouseEnter:Connect(function()
        Tween(MaximizeButton, {TextColor3 = Color3.fromRGB(100, 200, 255)}, 0.2)
    end)
    
    MaximizeButton.MouseLeave:Connect(function()
        Tween(MaximizeButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
    end)
    
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {TextColor3 = Color3.fromRGB(255, 100, 100)}, 0.2)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
    end)
    
    -- Control Button Clicks
    MinimizeButton.MouseButton1Click:Connect(ToggleMinimize)
    MaximizeButton.MouseButton1Click:Connect(ToggleMaximize)
    
    CloseButton.MouseButton1Click:Connect(function()
        Tween(MainFrame, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }, 0.3)
        wait(0.3)
        ScreenGui:Destroy()
    end)
    
    -- Search Box Functionality
    SearchBox.Focused:Connect(function()
        Tween(SearchContainer, {
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            BackgroundTransparency = 0.1
        }, 0.2)
    end)
    
    SearchBox.FocusLost:Connect(function()
        Tween(SearchContainer, {
            BackgroundColor3 = Color3.fromRGB(40, 40, 40),
            BackgroundTransparency = 0.2
        }, 0.2)
    end)
    
    -- Toggle Key (LeftControl)
    local ToggleConnection
    if ToggleKey then
        ToggleConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode == ToggleKey then
                ToggleMinimize()
            end
        end)
    end
    
    -- Destroy Function
    function NazuXLibrary:Destroy()
        if ToggleConnection then
            ToggleConnection:Disconnect()
        end
        ScreenGui:Destroy()
    end
    
    -- Toggle UI Function
    function NazuXLibrary:ToggleUI()
        ToggleMinimize()
    end
    
    return NazuXLibrary
end

return NazuX
