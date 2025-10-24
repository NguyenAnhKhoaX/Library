--[[
    NazuX Library
    Created with advanced UI features
--]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Local variables
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Theme colors
NazuX.Themes = {
    White = {
        Main = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(220, 220, 220),
        Text = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    Dark = {
        Main = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(25, 25, 25),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    Darker = {
        Main = Color3.fromRGB(20, 20, 20),
        Secondary = Color3.fromRGB(15, 15, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    Red = {
        Main = Color3.fromRGB(40, 20, 20),
        Secondary = Color3.fromRGB(30, 15, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 60, 60)
    },
    Yellow = {
        Main = Color3.fromRGB(40, 40, 20),
        Secondary = Color3.fromRGB(30, 30, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 255, 60)
    },
    Green = {
        Main = Color3.fromRGB(20, 40, 20),
        Secondary = Color3.fromRGB(15, 30, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(60, 255, 60)
    },
    Cam = {
        Main = Color3.fromRGB(40, 30, 20),
        Secondary = Color3.fromRGB(30, 22, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 165, 0)
    },
    AMOLED = {
        Main = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(0, 0, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 255, 255)
    },
    Rose = {
        Main = Color3.fromRGB(40, 20, 30),
        Secondary = Color3.fromRGB(30, 15, 22),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(255, 182, 193)
    },
    Github = {
        Main = Color3.fromRGB(36, 41, 46),
        Secondary = Color3.fromRGB(28, 33, 38),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(88, 166, 255)
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

local function Tween(Object, Goals, Duration, Style, Direction)
    Style = Style or Enum.EasingStyle.Quad
    Direction = Direction or Enum.EasingDirection.Out
    
    local tweenInfo = TweenInfo.new(Duration, Style, Direction)
    local tween = TweenService:Create(Object, tweenInfo, Goals)
    tween:Play()
    return tween
end

-- Loading screen
local function CreateLoadingScreen()
    local LoadingScreen = Create("ScreenGui", {
        Name = "NazuXLoading",
        DisplayOrder = 999,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Global
    })
    
    local Background = Create("Frame", {
        Parent = LoadingScreen,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        BorderSizePixel = 0
    })
    
    local Container = Create("Frame", {
        Parent = Background,
        Size = UDim2.new(0, 300, 0, 150),
        Position = UDim2.new(0.5, -150, 0.5, -75),
        BackgroundColor3 = Color3.fromRGB(32, 32, 32),
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    local Corner = Create("UICorner", {
        Parent = Container,
        CornerRadius = UDim.new(0, 8)
    })
    
    local Stroke = Create("UIStroke", {
        Parent = Container,
        Color = Color3.fromRGB(60, 60, 60),
        Thickness = 2
    })
    
    local Logo = Create("TextLabel", {
        Parent = Container,
        Size = UDim2.new(1, 0, 0, 60),
        Position = UDim2.new(0, 0, 0, 20),
        BackgroundTransparency = 1,
        Text = "NazuX",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 32,
        Font = Enum.Font.GothamBold
    })
    
    local LoadingBar = Create("Frame", {
        Parent = Container,
        Size = UDim2.new(0, 260, 0, 4),
        Position = UDim2.new(0, 20, 0, 100),
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        BorderSizePixel = 0
    })
    
    local LoadingBarCorner = Create("UICorner", {
        Parent = LoadingBar,
        CornerRadius = UDim.new(1, 0)
    })
    
    local Progress = Create("Frame", {
        Parent = LoadingBar,
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 120, 215),
        BorderSizePixel = 0
    })
    
    local ProgressCorner = Create("UICorner", {
        Parent = Progress,
        CornerRadius = UDim.new(1, 0)
    })
    
    local LoadingText = Create("TextLabel", {
        Parent = Container,
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 110),
        BackgroundTransparency = 1,
        Text = "Loading... 0%",
        TextColor3 = Color3.fromRGB(200, 200, 200),
        TextSize = 14,
        Font = Enum.Font.Gotham
    })
    
    LoadingScreen.Parent = game.CoreGui
    
    return LoadingScreen, Progress, LoadingText
end

-- Main NazuX function
function NazuX:CreateWindow(options)
    options = options or {}
    local Window = setmetatable({}, NazuX)
    
    Window.Title = options.Title or "NazuX Library"
    Window.Theme = options.Theme or "Dark"
    Window.MinimizeKey = options.MinimizeKey or Enum.KeyCode.LeftControl
    Window.Size = options.Size or UDim2.new(0, 600, 0, 400)
    Window.Position = options.Position or UDim2.new(0.5, -300, 0.5, -200)
    
    -- Create loading screen
    local LoadingScreen, ProgressBar, LoadingText = CreateLoadingScreen()
    
    -- Simulate loading
    local loadSteps = 10
    for i = 1, loadSteps do
        ProgressBar.Size = UDim2.new(i/loadSteps, 0, 1, 0)
        LoadingText.Text = "Loading... " .. math.floor((i/loadSteps) * 100) .. "%"
        wait(0.1)
    end
    
    -- Remove loading screen
    LoadingScreen:Destroy()
    
    -- Create main UI
    Window:CreateUI()
    
    return Window
end

function NazuX:CreateUI()
    -- Main ScreenGui
    self.ScreenGui = Create("ScreenGui", {
        Name = "NazuXUI",
        DisplayOrder = 10,
        ZIndexBehavior = Enum.ZIndexBehavior.Global
    })
    
    -- Main container
    self.MainFrame = Create("Frame", {
        Parent = self.ScreenGui,
        Size = self.Size,
        Position = self.Position,
        BackgroundColor3 = self.Themes[self.Theme].Main,
        BorderSizePixel = 0,
        ClipsDescendants = true
    })
    
    -- Corner and stroke
    Create("UICorner", {
        Parent = self.MainFrame,
        CornerRadius = UDim.new(0, 8)
    })
    
    Create("UIStroke", {
        Parent = self.MainFrame,
        Color = Color3.fromRGB(60, 60, 60),
        Thickness = 1
    })
    
    -- Title bar
    self.TitleBar = Create("Frame", {
        Parent = self.MainFrame,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        BorderSizePixel = 0
    })
    
    -- Logo
    self.Logo = Create("ImageLabel", {
        Parent = self.TitleBar,
        Size = UDim2.new(0, 24, 0, 24),
        Position = UDim2.new(0, 10, 0.5, -12),
        BackgroundTransparency = 1,
        Image = "rbxassetid://0", -- Placeholder
        Visible = false
    })
    
    -- Search bar in title
    self.SearchBox = Create("TextBox", {
        Parent = self.TitleBar,
        Size = UDim2.new(0, 200, 0, 25),
        Position = UDim2.new(0.5, -100, 0.5, -12),
        BackgroundColor3 = self.Themes[self.Theme].Main,
        TextColor3 = self.Themes[self.Theme].Text,
        PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
        PlaceholderText = "Search...",
        Text = "",
        TextSize = 14,
        Font = Enum.Font.Gotham,
        ClearTextOnFocus = false
    })
    
    Create("UICorner", {
        Parent = self.SearchBox,
        CornerRadius = UDim.new(0, 4)
    })
    
    -- Window controls
    self.Controls = Create("Frame", {
        Parent = self.TitleBar,
        Size = UDim2.new(0, 90, 1, 0),
        Position = UDim2.new(1, -90, 0, 0),
        BackgroundTransparency = 1
    })
    
    -- Minimize button
    self.MinimizeButton = Create("TextButton", {
        Parent = self.Controls,
        Size = UDim2.new(0, 30, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Text = "_",
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 16,
        Font = Enum.Font.GothamBold
    })
    
    -- Maximize button (placeholder)
    self.MaximizeButton = Create("TextButton", {
        Parent = self.Controls,
        Size = UDim2.new(0, 30, 1, 0),
        Position = UDim2.new(0, 30, 0, 0),
        BackgroundTransparency = 1,
        Text = "□",
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 14,
        Font = Enum.Font.Gotham
    })
    
    -- Close button
    self.CloseButton = Create("TextButton", {
        Parent = self.Controls,
        Size = UDim2.new(0, 30, 1, 0),
        Position = UDim2.new(0, 60, 0, 0),
        BackgroundTransparency = 1,
        Text = "×",
        TextColor3 = Color3.fromRGB(255, 100, 100),
        TextSize = 18,
        Font = Enum.Font.GothamBold
    })
    
    -- User info (top left)
    self.UserInfo = Create("Frame", {
        Parent = self.MainFrame,
        Size = UDim2.new(0, 200, 0, 60),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1
    })
    
    -- Avatar (circular)
    self.Avatar = Create("ImageLabel", {
        Parent = self.UserInfo,
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 10, 0.5, -20),
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = self.Avatar,
        CornerRadius = UDim.new(1, 0)
    })
    
    -- Username
    self.Username = Create("TextLabel", {
        Parent = self.UserInfo,
        Size = UDim2.new(0, 140, 0, 20),
        Position = UDim2.new(0, 60, 0, 10),
        BackgroundTransparency = 1,
        Text = LocalPlayer.Name,
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- User ID
    self.UserId = Create("TextLabel", {
        Parent = self.UserInfo,
        Size = UDim2.new(0, 140, 0, 15),
        Position = UDim2.new(0, 60, 0, 30),
        BackgroundTransparency = 1,
        Text = "ID: " .. LocalPlayer.UserId,
        TextColor3 = Color3.fromRGB(150, 150, 150),
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Tabs container (left side)
    self.TabsContainer = Create("Frame", {
        Parent = self.MainFrame,
        Size = UDim2.new(0, 200, 0, 300),
        Position = UDim2.new(0, 0, 0, 100),
        BackgroundTransparency = 1
    })
    
    -- Content container (right side)
    self.ContentContainer = Create("Frame", {
        Parent = self.MainFrame,
        Size = UDim2.new(0, 400, 0, 300),
        Position = UDim2.new(0, 200, 0, 100),
        BackgroundTransparency = 1,
        ClipsDescendants = true
    })
    
    -- Tab content title
    self.TabTitle = Create("TextLabel", {
        Parent = self.ContentContainer,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 18,
        Font = Enum.Font.GothamBold
    })
    
    -- Elements container
    self.ElementsContainer = Create("ScrollingFrame", {
        Parent = self.ContentContainer,
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = self.Themes[self.Theme].Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    -- UIListLayout for elements
    Create("UIListLayout", {
        Parent = self.ElementsContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    -- Tabs storage
    self.Tabs = {}
    self.CurrentTab = nil
    
    -- Dragging functionality
    self:Draggable(self.TitleBar)
    
    -- Button events
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    self.CloseButton.MouseButton1Click:Connect(function()
        self:Destroy()
    end)
    
    -- Minimize key
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == self.MinimizeKey then
            self:ToggleMinimize()
        end
    end)
    
    -- Set avatar (placeholder)
    self:SetAvatar()
    
    self.ScreenGui.Parent = game.CoreGui
    
    return self
end

function NazuX:Draggable(Frame)
    local dragging = false
    local dragInput, dragStart, startPos
    
    Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

function NazuX:ToggleMinimize()
    if self.MainFrame.Size.Y.Offset == 0 then
        -- Restore
        Tween(self.MainFrame, {Size = self.Size}, 0.3)
    else
        -- Minimize
        Tween(self.MainFrame, {Size = UDim2.new(self.Size.X.Scale, self.Size.X.Offset, 0, 0)}, 0.3)
    end
end

function NazuX:SetAvatar()
    -- Placeholder for avatar loading
    -- In practice, you would use ThumbnailService to get the avatar
    self.Avatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
end

function NazuX:CreateTab(Name)
    local Tab = {}
    
    -- Tab button
    Tab.Button = Create("TextButton", {
        Parent = self.TabsContainer,
        Size = UDim2.new(1, -20, 0, 35),
        Position = UDim2.new(0, 10, 0, #self.Tabs * 40),
        BackgroundColor3 = self.Themes[self.Theme].Secondary,
        TextColor3 = self.Themes[self.Theme].Text,
        Text = Name,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        AutoButtonColor = false
    })
    
    Create("UICorner", {
        Parent = Tab.Button,
        CornerRadius = UDim.new(0, 4)
    })
    
    -- Pill indicator
    Tab.Pill = Create("Frame", {
        Parent = Tab.Button,
        Size = UDim2.new(0, 3, 0, 20),
        Position = UDim2.new(0, 5, 0.5, -10),
        BackgroundColor3 = self.Themes[self.Theme].Accent,
        Visible = false
    })
    
    Create("UICorner", {
        Parent = Tab.Pill,
        CornerRadius = UDim.new(1, 0)
    })
    
    -- Tab content frame
    Tab.Content = Create("Frame", {
        Parent = self.ElementsContainer,
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        Visible = false
    })
    
    Create("UIListLayout", {
        Parent = Tab.Content,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    })
    
    -- Button click event
    Tab.Button.MouseButton1Click:Connect(function()
        self:SwitchTab(Tab, Name)
    end)
    
    -- Methods
    function Tab:AddButton(Config)
        Config = Config or {}
        local Button = {}
        
        local ButtonFrame = Create("Frame", {
            Parent = self.Content,
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundColor3 = self.Themes[self.Theme].Secondary,
            LayoutOrder = #self.Content:GetChildren()
        })
        
        Create("UICorner", {
            Parent = ButtonFrame,
            CornerRadius = UDim.new(0, 4)
        })
        
        Create("UIStroke", {
            Parent = ButtonFrame,
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1
        })
        
        local ButtonText = Create("TextLabel", {
            Parent = ButtonFrame,
            Size = UDim2.new(1, -20, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            Text = Config.Text or "Button",
            TextColor3 = self.Themes[self.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local ButtonButton = Create("TextButton", {
            Parent = ButtonFrame,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            ZIndex = 2
        })
        
        ButtonButton.MouseEnter:Connect(function()
            Tween(ButtonFrame, {BackgroundColor3 = Color3.fromRGB(
                math.clamp(self.Themes[self.Theme].Secondary.R * 255 + 10, 0, 255),
                math.clamp(self.Themes[self.Theme].Secondary.G * 255 + 10, 0, 255),
                math.clamp(self.Themes[self.Theme].Secondary.B * 255 + 10, 0, 255)
            )}, 0.2)
        end)
        
        ButtonButton.MouseLeave:Connect(function()
            Tween(ButtonFrame, {BackgroundColor3 = self.Themes[self.Theme].Secondary}, 0.2)
        end)
        
        ButtonButton.MouseButton1Click:Connect(function()
            if Config.Callback then
                Config.Callback()
            end
        end)
        
        function Button:SetText(NewText)
            ButtonText.Text = NewText
        end
        
        return Button
    end
    
    function Tab:AddToggle(Config)
        Config = Config or {}
        local Toggle = {}
        Toggle.Value = Config.Default or false
        
        local ToggleFrame = Create("Frame", {
            Parent = self.Content,
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundColor3 = self.Themes[self.Theme].Secondary,
            LayoutOrder = #self.Content:GetChildren()
        })
        
        Create("UICorner", {
            Parent = ToggleFrame,
            CornerRadius = UDim.new(0, 4)
        })
        
        Create("UIStroke", {
            Parent = ToggleFrame,
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1
        })
        
        local ToggleText = Create("TextLabel", {
            Parent = ToggleFrame,
            Size = UDim2.new(1, -60, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            Text = Config.Text or "Toggle",
            TextColor3 = self.Themes[self.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local ToggleButton = Create("TextButton", {
            Parent = ToggleFrame,
            Size = UDim2.new(0, 40, 0, 20),
            Position = UDim2.new(1, -50, 0.5, -10),
            BackgroundColor3 = Color3.fromRGB(80, 80, 80),
            AutoButtonColor = false
        })
        
        Create("UICorner", {
            Parent = ToggleButton,
            CornerRadius = UDim.new(1, 0)
        })
        
        local ToggleDot = Create("Frame", {
            Parent = ToggleButton,
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0, 2, 0.5, -8),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0
        })
        
        Create("UICorner", {
            Parent = ToggleDot,
            CornerRadius = UDim.new(1, 0)
        })
        
        local function UpdateToggle()
            if Toggle.Value then
                Tween(ToggleButton, {BackgroundColor3 = self.Themes[self.Theme].Accent}, 0.2)
                Tween(ToggleDot, {Position = UDim2.new(0, 22, 0.5, -8)}, 0.2)
            else
                Tween(ToggleButton, {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}, 0.2)
                Tween(ToggleDot, {Position = UDim2.new(0, 2, 0.5, -8)}, 0.2)
            end
        end
        
        UpdateToggle()
        
        ToggleButton.MouseButton1Click:Connect(function()
            Toggle.Value = not Toggle.Value
            UpdateToggle()
            if Config.Callback then
                Config.Callback(Toggle.Value)
            end
        end)
        
        function Toggle:SetValue(NewValue)
            Toggle.Value = NewValue
            UpdateToggle()
        end
        
        return Toggle
    end
    
    function Tab:AddSlider(Config)
        Config = Config or {}
        local Slider = {}
        Slider.Value = Config.Default or Config.Min or 0
        
        local SliderFrame = Create("Frame", {
            Parent = self.Content,
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundColor3 = self.Themes[self.Theme].Secondary,
            LayoutOrder = #self.Content:GetChildren()
        })
        
        Create("UICorner", {
            Parent = SliderFrame,
            CornerRadius = UDim.new(0, 4)
        })
        
        Create("UIStroke", {
            Parent = SliderFrame,
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1
        })
        
        local SliderText = Create("TextLabel", {
            Parent = SliderFrame,
            Size = UDim2.new(1, -20, 0, 20),
            Position = UDim2.new(0, 10, 0, 5),
            BackgroundTransparency = 1,
            Text = Config.Text or "Slider",
            TextColor3 = self.Themes[self.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local ValueText = Create("TextLabel", {
            Parent = SliderFrame,
            Size = UDim2.new(0, 60, 0, 20),
            Position = UDim2.new(1, -70, 0, 5),
            BackgroundTransparency = 1,
            Text = tostring(Slider.Value),
            TextColor3 = self.Themes[self.Theme].Text,
            TextSize = 14,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Right
        })
        
        local SliderTrack = Create("Frame", {
            Parent = SliderFrame,
            Size = UDim2.new(1, -20, 0, 4),
            Position = UDim2.new(0, 10, 1, -15),
            BackgroundColor3 = Color3.fromRGB(60, 60, 60),
            BorderSizePixel = 0
        })
        
        Create("UICorner", {
            Parent = SliderTrack,
            CornerRadius = UDim.new(1, 0)
        })
        
        local SliderFill = Create("Frame", {
            Parent = SliderTrack,
            Size = UDim2.new(0, 0, 1, 0),
            BackgroundColor3 = self.Themes[self.Theme].Accent,
            BorderSizePixel = 0
        })
        
        Create("UICorner", {
            Parent = SliderFill,
            CornerRadius = UDim.new(1, 0)
        })
        
        local SliderButton = Create("TextButton", {
            Parent = SliderTrack,
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0, -8, 0.5, -8),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Text = "",
            ZIndex = 2
        })
        
        Create("UICorner", {
            Parent = SliderButton,
            CornerRadius = UDim.new(1, 0)
        })
        
        local Min = Config.Min or 0
        local Max = Config.Max or 100
        local dragging = false
        
        local function UpdateSlider(value)
            local percent = (value - Min) / (Max - Min)
            SliderFill.Size = UDim2.new(percent, 0, 1, 0)
            SliderButton.Position = UDim2.new(percent, -8, 0.5, -8)
            ValueText.Text = tostring(math.floor(value))
            Slider.Value = value
        end
        
        UpdateSlider(Slider.Value)
        
        local function Slide(input)
            local pos = UDim2.new(
                math.clamp((input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1),
                0, 0.5, -8
            )
            local percent = math.clamp((input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
            local value = math.floor(Min + (Max - Min) * percent)
            
            UpdateSlider(value)
            
            if Config.Callback then
                Config.Callback(value)
            end
        end
        
        SliderButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
            end
        end)
        
        SliderButton.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                Slide(input)
            end
        end)
        
        function Slider:SetValue(NewValue)
            local value = math.clamp(NewValue, Min, Max)
            UpdateSlider(value)
        end
        
        return Slider
    end
    
    function Tab:AddSection(Name)
        local Section = {}
        
        local SectionFrame = Create("Frame", {
            Parent = self.Content,
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundTransparency = 1,
            LayoutOrder = #self.Content:GetChildren()
        })
        
        local SectionText = Create("TextLabel", {
            Parent = SectionFrame,
            Size = UDim2.new(1, -20, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            Text = Name,
            TextColor3 = self.Themes[self.Theme].Text,
            TextSize = 16,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left
        })
        
        local SectionLine = Create("Frame", {
            Parent = SectionFrame,
            Size = UDim2.new(1, -20, 0, 1),
            Position = UDim2.new(0, 10, 1, -1),
            BackgroundColor3 = self.Themes[self.Theme].Accent,
            BorderSizePixel = 0
        })
        
        function Section:AddButton(Config)
            return Tab:AddButton(Config)
        end
        
        function Section:AddToggle(Config)
            return Tab:AddToggle(Config)
        end
        
        function Section:AddSlider(Config)
            return Tab:AddSlider(Config)
        end
        
        return Section
    end
    
    table.insert(self.Tabs, Tab)
    
    -- Switch to this tab if it's the first one
    if #self.Tabs == 1 then
        self:SwitchTab(Tab, Name)
    end
    
    return Tab
end

function NazuX:SwitchTab(Tab, Name)
    -- Hide all tabs
    for _, otherTab in pairs(self.Tabs) do
        otherTab.Content.Visible = false
        otherTab.Pill.Visible = false
        Tween(otherTab.Button, {BackgroundColor3 = self.Themes[self.Theme].Secondary}, 0.2)
    end
    
    -- Show selected tab
    Tab.Content.Visible = true
    Tab.Pill.Visible = true
    Tween(Tab.Button, {BackgroundColor3 = Color3.fromRGB(
        math.clamp(self.Themes[self.Theme].Secondary.R * 255 + 20, 0, 255),
        math.clamp(self.Themes[self.Theme].Secondary.G * 255 + 20, 0, 255),
        math.clamp(self.Themes[self.Theme].Secondary.B * 255 + 20, 0, 255)
    )}, 0.2)
    
    -- Update tab title
    self.TabTitle.Text = Name
    
    self.CurrentTab = Tab
end

function NazuX:Notify(Title, Content)
    local NotifyGui = Create("ScreenGui", {
        Name = "NazuXNotify",
        DisplayOrder = 999,
        ZIndexBehavior = Enum.ZIndexBehavior.Global
    })
    
    local Background = Create("Frame", {
        Parent = NotifyGui,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0
    })
    
    local Notification = Create("Frame", {
        Parent = Background,
        Size = UDim2.new(0, 300, 0, 150),
        Position = UDim2.new(0.5, -150, 0.5, -75),
        BackgroundColor3 = self.Themes[self.Theme].Main,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = Notification,
        CornerRadius = UDim.new(0, 8)
    })
    
    Create("UIStroke", {
        Parent = Notification,
        Color = Color3.fromRGB(60, 60, 60),
        Thickness = 2
    })
    
    local TitleBar = Create("Frame", {
        Parent = Notification,
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = self.Themes[self.Theme].Accent,
        BorderSizePixel = 0
    })
    
    Create("UICorner", {
        Parent = TitleBar,
        CornerRadius = UDim.new(0, 8, 0, 0)
    })
    
    local TitleText = Create("TextLabel", {
        Parent = TitleBar,
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = Title or "Notification",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local ContentText = Create("TextLabel", {
        Parent = Notification,
        Size = UDim2.new(1, -20, 1, -50),
        Position = UDim2.new(0, 10, 0, 40),
        BackgroundTransparency = 1,
        Text = Content or "Content",
        TextColor3 = self.Themes[self.Theme].Text,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top
    })
    
    local CloseButton = Create("TextButton", {
        Parent = Notification,
        Size = UDim2.new(0, 80, 0, 25),
        Position = UDim2.new(0.5, -40, 1, -35),
        BackgroundColor3 = self.Themes[self.Theme].Accent,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Text = "OK",
        TextSize = 14,
        Font = Enum.Font.Gotham
    })
    
    Create("UICorner", {
        Parent = CloseButton,
        CornerRadius = UDim.new(0, 4)
    })
    
    CloseButton.MouseButton1Click:Connect(function()
        NotifyGui:Destroy()
    end)
    
    Background.MouseButton1Click:Connect(function()
        NotifyGui:Destroy()
    end)
    
    NotifyGui.Parent = game.CoreGui
    
    -- Auto remove after 5 seconds
    delay(5, function()
        if NotifyGui and NotifyGui.Parent then
            NotifyGui:Destroy()
        end
    end)
end

function NazuX:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
end

-- Make library globally available
getgenv().NazuX = NazuX

return NazuX
