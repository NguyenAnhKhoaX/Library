--[[
    NazuX Library
    Created for Roblox
    Version 1.0
--]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Player
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Colors
local Colors = {
    Dark = {
        Background = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(42, 42, 42),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(0, 0, 0)
    },
    Red = {
        Background = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(42, 42, 42),
        Accent = Color3.fromRGB(255, 0, 0),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Yellow = {
        Background = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(42, 42, 42),
        Accent = Color3.fromRGB(255, 255, 0),
        Text = Color3.fromRGB(255, 255, 255)
    },
    AMOLED = {
        Background = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(10, 10, 10),
        Accent = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Rose = {
        Background = Color3.fromRGB(25, 23, 26),
        Secondary = Color3.fromRGB(35, 33, 36),
        Accent = Color3.fromRGB(255, 105, 180),
        Text = Color3.fromRGB(255, 255, 255)
    }
}

-- Utility Functions
local function Tween(Object, Properties, Duration, Style, Direction)
    local TweenInfo = TweenInfo.new(Duration or 0.3, Style or Enum.EasingStyle.Quad, Direction or Enum.EasingDirection.Out)
    local Tween = TweenService:Create(Object, TweenInfo, Properties)
    Tween:Play()
    return Tween
end

local function CreateRoundedFrame(Parent, Size, Position, CornerRadius)
    local Frame = Instance.new("Frame")
    Frame.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame.Size = Size or UDim2.new(0, 100, 0, 100)
    Frame.Position = Position or UDim2.new(0, 0, 0, 0)
    Frame.BorderSizePixel = 0
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, CornerRadius or 8)
    UICorner.Parent = Frame
    
    Frame.Parent = Parent
    return Frame
end

local function CreateStroke(Object, Color, Thickness)
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color or Color3.new(1, 1, 1)
    Stroke.Thickness = Thickness or 1
    Stroke.Parent = Object
    return Stroke
end

-- Loading Screen
local function CreateLoadingScreen(Parent, Size)
    local LoadingFrame = Instance.new("Frame")
    LoadingFrame.Size = Size
    LoadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    LoadingFrame.BorderSizePixel = 0
    LoadingFrame.ZIndex = 100
    LoadingFrame.Parent = Parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = LoadingFrame
    
    local FlameContainer = Instance.new("Frame")
    FlameContainer.Size = UDim2.new(1, 0, 1, 0)
    FlameContainer.BackgroundTransparency = 1
    FlameContainer.Parent = LoadingFrame
    
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 200, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 0))
    })
    UIGradient.Rotation = 45
    UIGradient.Parent = FlameContainer
    
    local LoadingText = Instance.new("TextLabel")
    LoadingText.Size = UDim2.new(1, 0, 0, 30)
    LoadingText.Position = UDim2.new(0, 0, 0.5, -15)
    LoadingText.BackgroundTransparency = 1
    LoadingText.Text = "Loading NazuX..."
    LoadingText.TextColor3 = Color3.new(1, 1, 1)
    LoadingText.TextSize = 18
    LoadingText.Font = Enum.Font.Gotham
    LoadingText.Parent = LoadingFrame
    
    -- Flame animation
    local Connection
    Connection = RunService.Heartbeat:Connect(function()
        UIGradient.Rotation = UIGradient.Rotation + 2
    end)
    
    local function Destroy()
        Connection:Disconnect()
        LoadingFrame:Destroy()
    end
    
    return LoadingFrame, Destroy
end

function NazuX:CreateWindow(Config)
    Config = Config or {}
    local Window = setmetatable({}, NazuX)
    
    -- Window properties
    Window.Title = Config.Title or "NazuX Library"
    Window.OwnerImage = Config.OwnerImage or "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Window.Theme = Config.Theme or "Dark"
    Window.Size = Config.Size or UDim2.new(0, 600, 0, 400)
    Window.Position = Config.Position or UDim2.new(0.5, -300, 0.5, -200)
    
    -- Create main screen GUI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NazuXLibrary"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = PlayerGui
    
    -- Create loading screen
    local LoadingScreen, DestroyLoading = CreateLoadingScreen(ScreenGui, Window.Size)
    
    -- Delay to show loading
    task.spawn(function()
        task.wait(2) -- Simulate loading time
        DestroyLoading()
        Window:InitializeUI(ScreenGui)
    end)
    
    Window.ScreenGui = ScreenGui
    Window.Tabs = {}
    Window.CurrentTab = nil
    Window.Minimized = false
    
    return Window
end

function NazuX:InitializeUI(Parent)
    -- Main Container
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = self.Size
    MainFrame.Position = self.Position
    MainFrame.BackgroundColor3 = Colors[self.Theme].Background
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = Parent
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    local MainStroke = CreateStroke(MainFrame, Colors[self.Theme].Accent, 2)
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.BackgroundColor3 = Colors[self.Theme].Secondary
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleBarCorner = Instance.new("UICorner")
    TitleBarCorner.CornerRadius = UDim.new(0, 12)
    TitleBarCorner.Parent = TitleBar
    
    -- Logo
    local Logo = Instance.new("ImageLabel")
    Logo.Size = UDim2.new(0, 24, 0, 24)
    Logo.Position = UDim2.new(0, 10, 0, 8)
    Logo.BackgroundTransparency = 1
    Logo.Image = "rbxassetid://10734948220" -- Example logo
    Logo.Parent = TitleBar
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 40, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = self.Title
    Title.TextColor3 = Colors[self.Theme].Text
    Title.TextSize = 16
    Title.Font = Enum.Font.GothamSemibold
    Title.TextXAlignment = Enum.TextXAlignment.Center
    Title.Parent = TitleBar
    
    -- Control Buttons
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
    MinimizeButton.BackgroundColor3 = Colors[self.Theme].Secondary
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Colors[self.Theme].Text
    MinimizeButton.TextSize = 18
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = TitleBar
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 6)
    MinimizeCorner.Parent = MinimizeButton
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(232, 17, 35)
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.new(1, 1, 1)
    CloseButton.TextSize = 14
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = TitleBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton
    
    -- Content Area
    local ContentArea = Instance.new("Frame")
    ContentArea.Size = UDim2.new(1, 0, 1, -40)
    ContentArea.Position = UDim2.new(0, 0, 0, 40)
    ContentArea.BackgroundTransparency = 1
    ContentArea.Parent = MainFrame
    
    -- Left Sidebar
    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 200, 1, 0)
    Sidebar.BackgroundColor3 = Colors[self.Theme].Secondary
    Sidebar.BackgroundTransparency = 0.1
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = ContentArea
    
    local SidebarCorner = Instance.new("UICorner")
    SidebarCorner.CornerRadius = UDim.new(0, 12)
    SidebarCorner.Parent = Sidebar
    
    -- Owner Info
    local OwnerInfo = Instance.new("Frame")
    OwnerInfo.Size = UDim2.new(1, -20, 0, 80)
    OwnerInfo.Position = UDim2.new(0, 10, 0, 10)
    OwnerInfo.BackgroundColor3 = Colors[self.Theme].Background
    OwnerInfo.BorderSizePixel = 0
    OwnerInfo.Parent = Sidebar
    
    local OwnerCorner = Instance.new("UICorner")
    OwnerCorner.CornerRadius = UDim.new(0, 12)
    OwnerCorner.Parent = OwnerInfo
    
    local OwnerImage = Instance.new("ImageLabel")
    OwnerImage.Size = UDim2.new(0, 50, 0, 50)
    OwnerImage.Position = UDim2.new(0, 10, 0, 15)
    OwnerImage.BackgroundColor3 = Color3.new(1, 1, 1)
    OwnerImage.Image = self.OwnerImage
    OwnerImage.Parent = OwnerInfo
    
    local ImageCorner = Instance.new("UICorner")
    ImageCorner.CornerRadius = UDim.new(0, 25)
    ImageCorner.Parent = OwnerImage
    
    local OwnerName = Instance.new("TextLabel")
    OwnerName.Size = UDim2.new(0, 120, 0, 20)
    OwnerName.Position = UDim2.new(0, 70, 0, 20)
    OwnerName.BackgroundTransparency = 1
    OwnerName.Text = LocalPlayer.Name
    OwnerName.TextColor3 = Colors[self.Theme].Text
    OwnerName.TextSize = 14
    OwnerName.Font = Enum.Font.GothamSemibold
    OwnerName.TextXAlignment = Enum.TextXAlignment.Left
    OwnerName.Parent = OwnerInfo
    
    local OwnerId = Instance.new("TextLabel")
    OwnerId.Size = UDim2.new(0, 120, 0, 15)
    OwnerId.Position = UDim2.new(0, 70, 0, 40)
    OwnerId.BackgroundTransparency = 1
    OwnerId.Text = "ID: " .. LocalPlayer.UserId
    OwnerId.TextColor3 = Colors[self.Theme].Text
    OwnerId.TextSize = 12
    OwnerId.Font = Enum.Font.Gotham
    OwnerId.TextXAlignment = Enum.TextXAlignment.Left
    OwnerId.Parent = OwnerInfo
    
    -- Search Bar
    local SearchContainer = Instance.new("Frame")
    SearchContainer.Size = UDim2.new(1, -20, 0, 40)
    SearchContainer.Position = UDim2.new(0, 10, 0, 100)
    SearchContainer.BackgroundColor3 = Colors[self.Theme].Background
    SearchContainer.BorderSizePixel = 0
    SearchContainer.Parent = Sidebar
    
    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 8)
    SearchCorner.Parent = SearchContainer
    
    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(1, -50, 1, -10)
    SearchBox.Position = UDim2.new(0, 10, 0, 5)
    SearchBox.BackgroundTransparency = 1
    SearchBox.PlaceholderText = "Search..."
    SearchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    SearchBox.Text = ""
    SearchBox.TextColor3 = Colors[self.Theme].Text
    SearchBox.TextSize = 14
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    SearchBox.Parent = SearchContainer
    
    local SearchIcon = Instance.new("ImageLabel")
    SearchIcon.Size = UDim2.new(0, 20, 0, 20)
    SearchIcon.Position = UDim2.new(1, -30, 0, 10)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Image = "rbxassetid://10734948220"
    SearchIcon.Parent = SearchContainer
    
    -- Tabs Container
    local TabsContainer = Instance.new("ScrollingFrame")
    TabsContainer.Size = UDim2.new(1, -20, 1, -160)
    TabsContainer.Position = UDim2.new(0, 10, 0, 150)
    TabsContainer.BackgroundTransparency = 1
    TabsContainer.BorderSizePixel = 0
    TabsContainer.ScrollBarThickness = 3
    TabsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    TabsContainer.Parent = Sidebar
    
    local TabsLayout = Instance.new("UIListLayout")
    TabsLayout.Padding = UDim.new(0, 5)
    TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabsLayout.Parent = TabsContainer
    
    -- Right Content Area
    local RightContent = Instance.new("Frame")
    RightContent.Size = UDim2.new(1, -210, 1, -20)
    RightContent.Position = UDim2.new(0, 210, 0, 10)
    RightContent.BackgroundTransparency = 1
    RightContent.Parent = ContentArea
    
    -- Tab Content Container
    local TabContent = Instance.new("Frame")
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.BackgroundTransparency = 1
    TabContent.Visible = false
    TabContent.Parent = RightContent
    
    -- Store references
    self.MainFrame = MainFrame
    self.TitleBar = TitleBar
    self.Sidebar = Sidebar
    self.TabsContainer = TabsContainer
    self.TabContent = TabContent
    self.MinimizeButton = MinimizeButton
    self.CloseButton = CloseButton
    self.SearchBox = SearchBox
    
    -- Connect events
    self:SetupEvents()
end

function NazuX:SetupEvents()
    -- Minimize functionality
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    -- Close functionality
    self.CloseButton.MouseButton1Click:Connect(function()
        self:Close()
    end)
    
    -- Search functionality
    self.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        self:SearchElements(self.SearchBox.Text)
    end)
end

function NazuX:ToggleMinimize()
    self.Minimized = not self.Minimized
    
    if self.Minimized then
        Tween(self.MainFrame, {Size = UDim2.new(0, self.Size.X.Offset, 0, 40)}, 0.3)
        Tween(self.TitleBar, {BackgroundTransparency = 0}, 0.3)
    else
        Tween(self.MainFrame, {Size = self.Size}, 0.3)
    end
end

function NazuX:Close()
    Tween(self.MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
    task.wait(0.3)
    self.ScreenGui:Destroy()
end

function NazuX:SearchElements(Query)
    for _, Tab in pairs(self.Tabs) do
        for _, Element in pairs(Tab.Elements) do
            if Element:IsA("TextLabel") or Element:IsA("TextButton") then
                if string.find(string.lower(Element.Text), string.lower(Query)) then
                    Element.Visible = true
                    Tween(Element, {TextTransparency = 0}, 0.2)
                else
                    Tween(Element, {TextTransparency = 0.5}, 0.2)
                end
            end
        end
    end
end

function NazuX:AddTab(TabName)
    local Tab = {}
    Tab.Name = TabName
    Tab.Elements = {}
    
    -- Tab Button
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.BackgroundColor3 = Colors[self.Theme].Secondary
    TabButton.BackgroundTransparency = 0.5
    TabButton.BorderSizePixel = 0
    TabButton.Text = TabName
    TabButton.TextColor3 = Colors[self.Theme].Text
    TabButton.TextSize = 14
    TabButton.Font = Enum.Font.Gotham
    TabButton.Parent = self.TabsContainer
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = TabButton
    
    -- Tab Content Frame
    local TabFrame = Instance.new("ScrollingFrame")
    TabFrame.Size = UDim2.new(1, 0, 1, 0)
    TabFrame.BackgroundTransparency = 1
    TabFrame.BorderSizePixel = 0
    TabFrame.ScrollBarThickness = 3
    TabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    TabFrame.Visible = false
    TabFrame.Parent = self.TabContent
    
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Padding = UDim.new(0, 10)
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabLayout.Parent = TabFrame
    
    -- Tab Title
    local TabTitle = Instance.new("TextLabel")
    TabTitle.Size = UDim2.new(1, 0, 0, 40)
    TabTitle.BackgroundTransparency = 1
    TabTitle.Text = TabName
    TabTitle.TextColor3 = Colors[self.Theme].Text
    TabTitle.TextSize = 24
    TabTitle.Font = Enum.Font.GothamBold
    TabTitle.TextXAlignment = Enum.TextXAlignment.Center
    TabTitle.Parent = TabFrame
    
    -- Reflection Effect
    local Reflection = Instance.new("Frame")
    Reflection.Size = UDim2.new(0, 100, 0, 2)
    Reflection.Position = UDim2.new(0.5, -50, 0, 45)
    Reflection.BackgroundColor3 = Colors[self.Theme].Accent
    Reflection.BorderSizePixel = 0
    Reflection.Parent = TabFrame
    
    local ReflectionCorner = Instance.new("UICorner")
    ReflectionCorner.CornerRadius = UDim.new(0, 4)
    ReflectionCorner.Parent = Reflection
    
    Tab.Button = TabButton
    Tab.Frame = TabFrame
    Tab.Reflection = Reflection
    
    -- Tab selection
    TabButton.MouseButton1Click:Connect(function()
        self:SelectTab(Tab)
    end)
    
    table.insert(self.Tabs, Tab)
    
    -- Select first tab automatically
    if #self.Tabs == 1 then
        self:SelectTab(Tab)
    end
    
    return Tab
end

function NazuX:SelectTab(Tab)
    if self.CurrentTab then
        self.CurrentTab.Frame.Visible = false
        Tween(self.CurrentTab.Button, {BackgroundTransparency = 0.5}, 0.2)
        Tween(self.CurrentTab.Reflection, {Size = UDim2.new(0, 100, 0, 2)}, 0.2)
    end
    
    self.CurrentTab = Tab
    Tab.Frame.Visible = true
    Tween(Tab.Button, {BackgroundTransparency = 0}, 0.2)
    Tween(Tab.Reflection, {Size = UDim2.new(0, 150, 0, 3)}, 0.2)
    
    -- Rotation effect
    Tween(Tab.Button, {Rotation = 5}, 0.1)
    Tween(Tab.Button, {Rotation = 0}, 0.1)
end

function NazuX:AddSection(Tab, SectionName)
    local Section = {}
    
    local SectionFrame = Instance.new("Frame")
    SectionFrame.Size = UDim2.new(1, -20, 0, 40)
    SectionFrame.BackgroundColor3 = Colors[self.Theme].Secondary
    SectionFrame.BackgroundTransparency = 0.8
    SectionFrame.BorderSizePixel = 0
    SectionFrame.Parent = Tab.Frame
    
    local SectionCorner = Instance.new("UICorner")
    SectionCorner.CornerRadius = UDim.new(0, 8)
    SectionCorner.Parent = SectionFrame
    
    local SectionLabel = Instance.new("TextLabel")
    SectionLabel.Size = UDim2.new(1, 0, 1, 0)
    SectionLabel.BackgroundTransparency = 1
    SectionLabel.Text = SectionName
    SectionLabel.TextColor3 = Colors[self.Theme].Text
    SectionLabel.TextSize = 16
    SectionLabel.Font = Enum.Font.GothamSemibold
    SectionLabel.TextXAlignment = Enum.TextXAlignment.Center
    SectionLabel.Parent = SectionFrame
    
    Section.Frame = SectionFrame
    table.insert(Tab.Elements, SectionLabel)
    
    return Section
end

function NazuX:AddButton(Tab, ButtonName, Callback)
    local Button = {}
    
    local ButtonFrame = Instance.new("TextButton")
    ButtonFrame.Size = UDim2.new(1, -20, 0, 40)
    ButtonFrame.BackgroundColor3 = Colors[self.Theme].Secondary
    ButtonFrame.BorderSizePixel = 0
    ButtonFrame.Text = ""
    ButtonFrame.AutoButtonColor = false
    ButtonFrame.Parent = Tab.Frame
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = ButtonFrame
    
    local ButtonLabel = Instance.new("TextLabel")
    ButtonLabel.Size = UDim2.new(0.7, 0, 1, 0)
    ButtonLabel.Position = UDim2.new(0, 10, 0, 0)
    ButtonLabel.BackgroundTransparency = 1
    ButtonLabel.Text = ButtonName
    ButtonLabel.TextColor3 = Colors[self.Theme].Text
    ButtonLabel.TextSize = 14
    ButtonLabel.Font = Enum.Font.Gotham
    ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
    ButtonLabel.Parent = ButtonFrame
    
    local Fingerprint = Instance.new("ImageLabel")
    Fingerprint.Size = UDim2.new(0, 20, 0, 20)
    Fingerprint.Position = UDim2.new(1, -30, 0, 10)
    Fingerprint.BackgroundTransparency = 1
    Fingerprint.Image = "rbxassetid://10734948220" -- Fingerprint icon
    Fingerprint.Parent = ButtonFrame
    
    -- Hover effects
    ButtonFrame.MouseEnter:Connect(function()
        Tween(ButtonFrame, {BackgroundColor3 = Color3.new(1, 1, 1)}, 0.2)
        Tween(ButtonLabel, {TextColor3 = Color3.new(0, 0, 0)}, 0.2)
    end)
    
    ButtonFrame.MouseLeave:Connect(function()
        Tween(ButtonFrame, {BackgroundColor3 = Colors[self.Theme].Secondary}, 0.2)
        Tween(ButtonLabel, {TextColor3 = Colors[self.Theme].Text}, 0.2)
    end)
    
    ButtonFrame.MouseButton1Click:Connect(function()
        if Callback then
            Callback()
        end
    end)
    
    Button.Frame = ButtonFrame
    table.insert(Tab.Elements, ButtonLabel)
    
    return Button
end

function NazuX:AddToggle(Tab, ToggleName, Default, Callback)
    local Toggle = {}
    Toggle.Value = Default or false
    
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, -20, 0, 40)
    ToggleFrame.BackgroundColor3 = Colors[self.Theme].Secondary
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = Tab.Frame
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    ToggleCorner.Parent = ToggleFrame
    
    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Text = ToggleName
    ToggleLabel.TextColor3 = Colors[self.Theme].Text
    ToggleLabel.TextSize = 14
    ToggleLabel.Font = Enum.Font.Gotham
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    ToggleLabel.Parent = ToggleFrame
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 30, 0, 30)
    ToggleButton.Position = UDim2.new(1, -40, 0, 5)
    ToggleButton.BackgroundColor3 = Colors[self.Theme].Secondary
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Text = ""
    ToggleButton.AutoButtonColor = false
    ToggleButton.Parent = ToggleFrame
    
    local ToggleButtonCorner = Instance.new("UICorner")
    ToggleButtonCorner.CornerRadius = UDim.new(0, 6)
    ToggleButtonCorner.Parent = ToggleButton
    
    local ToggleStroke = CreateStroke(ToggleButton, Colors[self.Theme].Accent, 2)
    
    local ToggleCheck = Instance.new("TextLabel")
    ToggleCheck.Size = UDim2.new(1, 0, 1, 0)
    ToggleCheck.BackgroundTransparency = 1
    ToggleCheck.Text = "✓"
    ToggleCheck.TextColor3 = Colors[self.Theme].Accent
    ToggleCheck.TextSize = 18
    ToggleCheck.Font = Enum.Font.GothamBold
    ToggleCheck.Visible = Toggle.Value
    ToggleCheck.Parent = ToggleButton
    
    -- Update toggle appearance
    local function UpdateToggle()
        if Toggle.Value then
            ToggleCheck.Visible = true
            Tween(ToggleButton, {BackgroundColor3 = Colors[self.Theme].Accent}, 0.2)
        else
            ToggleCheck.Visible = false
            Tween(ToggleButton, {BackgroundColor3 = Colors[self.Theme].Secondary}, 0.2)
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(function()
        Toggle.Value = not Toggle.Value
        UpdateToggle()
        if Callback then
            Callback(Toggle.Value)
        end
    end)
    
    UpdateToggle()
    
    Toggle.Frame = ToggleFrame
    table.insert(Tab.Elements, ToggleLabel)
    
    return Toggle
end

function NazuX:AddDropdown(Tab, DropdownName, Options, Default, Callback)
    local Dropdown = {}
    Dropdown.Options = Options or {}
    Dropdown.Value = Default or Options[1]
    Dropdown.Open = false
    
    local DropdownFrame = Instance.new("Frame")
    DropdownFrame.Size = UDim2.new(1, -20, 0, 40)
    DropdownFrame.BackgroundColor3 = Colors[self.Theme].Secondary
    DropdownFrame.BorderSizePixel = 0
    DropdownFrame.ClipsDescendants = true
    DropdownFrame.Parent = Tab.Frame
    
    local DropdownCorner = Instance.new("UICorner")
    DropdownCorner.CornerRadius = UDim.new(0, 8)
    DropdownCorner.Parent = DropdownFrame
    
    local DropdownLabel = Instance.new("TextLabel")
    DropdownLabel.Size = UDim2.new(0.7, 0, 0, 40)
    DropdownLabel.Position = UDim2.new(0, 10, 0, 0)
    DropdownLabel.BackgroundTransparency = 1
    DropdownLabel.Text = DropdownName
    DropdownLabel.TextColor3 = Colors[self.Theme].Text
    DropdownLabel.TextSize = 14
    DropdownLabel.Font = Enum.Font.Gotham
    DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
    DropdownLabel.Parent = DropdownFrame
    
    local DropdownButton = Instance.new("TextButton")
    DropdownButton.Size = UDim2.new(0, 80, 0, 30)
    DropdownButton.Position = UDim2.new(1, -90, 0, 5)
    DropdownButton.BackgroundColor3 = Colors[self.Theme].Accent
    DropdownButton.BorderSizePixel = 0
    DropdownButton.Text = Dropdown.Value or "Select"
    DropdownButton.TextColor3 = Color3.new(1, 1, 1)
    DropdownButton.TextSize = 12
    DropdownButton.Font = Enum.Font.Gotham
    DropdownButton.Parent = DropdownFrame
    
    local DropdownButtonCorner = Instance.new("UICorner")
    DropdownButtonCorner.CornerRadius = UDim.new(0, 6)
    DropdownButtonCorner.Parent = DropdownButton
    
    local DropdownList = Instance.new("Frame")
    DropdownList.Size = UDim2.new(1, -10, 0, 0)
    DropdownList.Position = UDim2.new(0, 5, 0, 45)
    DropdownList.BackgroundColor3 = Colors[self.Theme].Background
    DropdownList.BorderSizePixel = 0
    DropdownList.Visible = false
    DropdownList.Parent = DropdownFrame
    
    local DropdownListCorner = Instance.new("UICorner")
    DropdownListCorner.CornerRadius = UDim.new(0, 6)
    DropdownListCorner.Parent = DropdownList
    
    local DropdownLayout = Instance.new("UIListLayout")
    DropdownLayout.Padding = UDim.new(0, 2)
    DropdownLayout.SortOrder = Enum.SortOrder.LayoutOrder
    DropdownLayout.Parent = DropdownList
    
    -- Create option buttons
    for _, Option in pairs(Dropdown.Options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Size = UDim2.new(1, 0, 0, 30)
        OptionButton.BackgroundColor3 = Colors[self.Theme].Secondary
        OptionButton.BorderSizePixel = 0
        OptionButton.Text = Option
        OptionButton.TextColor3 = Colors[self.Theme].Text
        OptionButton.TextSize = 12
        OptionButton.Font = Enum.Font.Gotham
        OptionButton.Parent = DropdownList
        
        local OptionCorner = Instance.new("UICorner")
        OptionCorner.CornerRadius = UDim.new(0, 4)
        OptionCorner.Parent = OptionButton
        
        OptionButton.MouseButton1Click:Connect(function()
            Dropdown.Value = Option
            DropdownButton.Text = Option
            Dropdown.Open = false
            DropdownList.Visible = false
            Tween(DropdownFrame, {Size = UDim2.new(1, -20, 0, 40)}, 0.2)
            
            if Callback then
                Callback(Option)
            end
        end)
    end
    
    DropdownButton.MouseButton1Click:Connect(function()
        Dropdown.Open = not Dropdown.Open
        
        if Dropdown.Open then
            DropdownList.Visible = true
            local ListSize = math.min(#Dropdown.Options * 32, 160)
            Tween(DropdownFrame, {Size = UDim2.new(1, -20, 0, 45 + ListSize)}, 0.2)
            Tween(DropdownList, {Size = UDim2.new(1, -10, 0, ListSize)}, 0.2)
        else
            Tween(DropdownFrame, {Size = UDim2.new(1, -20, 0, 40)}, 0.2)
            DropdownList.Visible = false
        end
    end)
    
    Dropdown.Frame = DropdownFrame
    table.insert(Tab.Elements, DropdownLabel)
    
    return Dropdown
end

function NazuX:AddSlider(Tab, SliderName, Min, Max, Default, Callback)
    local Slider = {}
    Slider.Value = Default or Min
    Slider.Min = Min or 0
    Slider.Max = Max or 100
    
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, -20, 0, 60)
    SliderFrame.BackgroundColor3 = Colors[self.Theme].Secondary
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = Tab.Frame
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 8)
    SliderCorner.Parent = SliderFrame
    
    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Size = UDim2.new(1, -20, 0, 20)
    SliderLabel.Position = UDim2.new(0, 10, 0, 5)
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Text = SliderName
    SliderLabel.TextColor3 = Colors[self.Theme].Text
    SliderLabel.TextSize = 14
    SliderLabel.Font = Enum.Font.Gotham
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    SliderLabel.Parent = SliderFrame
    
    local SliderValue = Instance.new("TextLabel")
    SliderValue.Size = UDim2.new(0, 50, 0, 20)
    SliderValue.Position = UDim2.new(1, -60, 0, 5)
    SliderValue.BackgroundTransparency = 1
    SliderValue.Text = tostring(Slider.Value)
    SliderValue.TextColor3 = Colors[self.Theme].Text
    SliderValue.TextSize = 14
    SliderValue.Font = Enum.Font.Gotham
    SliderValue.TextXAlignment = Enum.TextXAlignment.Right
    SliderValue.Parent = SliderFrame
    
    local SliderTrack = Instance.new("Frame")
    SliderTrack.Size = UDim2.new(1, -20, 0, 10)
    SliderTrack.Position = UDim2.new(0, 10, 0, 35)
    SliderTrack.BackgroundColor3 = Colors[self.Theme].Background
    SliderTrack.BorderSizePixel = 0
    SliderTrack.Parent = SliderFrame
    
    local TrackCorner = Instance.new("UICorner")
    TrackCorner.CornerRadius = UDim.new(0, 5)
    TrackCorner.Parent = SliderTrack
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0)
    SliderFill.BackgroundColor3 = Colors[self.Theme].Accent
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderTrack
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(0, 5)
    FillCorner.Parent = SliderFill
    
    local SliderButton = Instance.new("TextButton")
    SliderButton.Size = UDim2.new(0, 20, 0, 20)
    SliderButton.Position = UDim2.new((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), -10, 0, -5)
    SliderButton.BackgroundColor3 = Color3.new(1, 1, 1)
    SliderButton.BorderSizePixel = 0
    SliderButton.Text = ""
    SliderButton.AutoButtonColor = false
    SliderButton.Parent = SliderTrack
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = SliderButton
    
    local Dragging = false
    
    local function UpdateSlider(Value)
        local Percent = math.clamp((Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1)
        Slider.Value = math.floor(Value)
        SliderValue.Text = tostring(Slider.Value)
        SliderFill.Size = UDim2.new(Percent, 0, 1, 0)
        SliderButton.Position = UDim2.new(Percent, -10, 0, -5)
        
        if Callback then
            Callback(Slider.Value)
        end
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        Dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(Input)
        if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
            local MousePos = UserInputService:GetMouseLocation()
            local TrackAbsPos = SliderTrack.AbsolutePosition
            local TrackAbsSize = SliderTrack.AbsoluteSize
            
            local RelativeX = (MousePos.X - TrackAbsPos.X) / TrackAbsSize.X
            local Value = Slider.Min + (RelativeX * (Slider.Max - Slider.Min))
            
            UpdateSlider(math.clamp(Value, Slider.Min, Slider.Max))
        end
    end)
    
    Slider.Frame = SliderFrame
    table.insert(Tab.Elements, SliderLabel)
    
    return Slider
end

function NazuX:ChangeTheme(ThemeName)
    if Colors[ThemeName] then
        self.Theme = ThemeName
        
        -- Update all UI elements with new theme colors
        if self.MainFrame then
            self.MainFrame.BackgroundColor3 = Colors[ThemeName].Background
            self.TitleBar.BackgroundColor3 = Colors[ThemeName].Secondary
            
            -- Update title bar stroke
            if self.MainFrame:FindFirstChild("UIStroke") then
                self.MainFrame.UIStroke.Color = Colors[ThemeName].Accent
            end
            
            -- Update title text
            if self.TitleBar:FindFirstChildWhichIsA("TextLabel") then
                self.TitleBar:FindFirstChildWhichIsA("TextLabel").TextColor3 = Colors[ThemeName].Text
            end
        end
    end
end

function NazuX:AddColorChangeButton(Tab, ButtonName)
    return self:AddButton(Tab, ButtonName, function()
        -- Create color selection popup
        local ColorPopup = Instance.new("Frame")
        ColorPopup.Size = UDim2.new(0, 200, 0, 250)
        ColorPopup.Position = UDim2.new(0.5, -100, 0.5, -125)
        ColorPopup.BackgroundColor3 = Colors[self.Theme].Background
        ColorPopup.BorderSizePixel = 0
        ColorPopup.ZIndex = 100
        ColorPopup.Parent = self.MainFrame
        
        local PopupCorner = Instance.new("UICorner")
        PopupCorner.CornerRadius = UDim.new(0, 12)
        PopupCorner.Parent = ColorPopup
        
        local PopupStroke = CreateStroke(ColorPopup, Colors[self.Theme].Accent, 2)
        
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, 0, 0, 40)
        Title.BackgroundTransparency = 1
        Title.Text = "Change Theme"
        Title.TextColor3 = Colors[self.Theme].Text
        Title.TextSize = 16
        Title.Font = Enum.Font.GothamBold
        Title.Parent = ColorPopup
        
        local ColorList = Instance.new("ScrollingFrame")
        ColorList.Size = UDim2.new(1, -10, 1, -50)
        ColorList.Position = UDim2.new(0, 5, 0, 40)
        ColorList.BackgroundTransparency = 1
        ColorList.ScrollBarThickness = 3
        ColorList.AutomaticCanvasSize = Enum.AutomaticSize.Y
        ColorList.Parent = ColorPopup
        
        local ColorLayout = Instance.new("UIListLayout")
        ColorLayout.Padding = UDim.new(0, 5)
        ColorLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ColorLayout.Parent = ColorList
        
        -- Add color options
        for ThemeName, ColorData in pairs(Colors) do
            local ColorButton = Instance.new("TextButton")
            ColorButton.Size = UDim2.new(1, 0, 0, 40)
            ColorButton.BackgroundColor3 = ColorData.Accent
            ColorButton.BorderSizePixel = 0
            ColorButton.Text = ThemeName
            ColorButton.TextColor3 = Color3.new(1, 1, 1)
            ColorButton.TextSize = 14
            ColorButton.Font = Enum.Font.Gotham
            ColorButton.Parent = ColorList
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 6)
            ButtonCorner.Parent = ColorButton
            
            ColorButton.MouseButton1Click:Connect(function()
                self:ChangeTheme(ThemeName)
                ColorPopup:Destroy()
            end)
        end
        
        -- Close when clicking outside
        local CloseConnection
        CloseConnection = UserInputService.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                local MousePos = UserInputService:GetMouseLocation()
                local AbsPos = ColorPopup.AbsolutePosition
                local AbsSize = ColorPopup.AbsoluteSize
                
                if MousePos.X < AbsPos.X or MousePos.X > AbsPos.X + AbsSize.X or
                   MousePos.Y < AbsPos.Y or MousePos.Y > AbsPos.Y + AbsSize.Y then
                    ColorPopup:Destroy()
                    CloseConnection:Disconnect()
                end
            end
        end)
    end)
end

return NazuX
