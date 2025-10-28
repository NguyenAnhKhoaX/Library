-- NazuX Library - Fixed All Errors Version
local NazuX = {}
NazuX.__index = NazuX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Local variables
local LocalPlayer = Players.LocalPlayer

-- Theme colors
NazuX.Themes = {
    Dark = {
        Main = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(25, 25, 25),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(0, 120, 215)
    },
    White = {
        Main = Color3.fromRGB(245, 245, 245),
        Secondary = Color3.fromRGB(230, 230, 230),
        Text = Color3.fromRGB(0, 0, 0),
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
    Green = {
        Main = Color3.fromRGB(20, 40, 20),
        Secondary = Color3.fromRGB(15, 30, 15),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(60, 255, 60)
    },
    Blue = {
        Main = Color3.fromRGB(20, 20, 40),
        Secondary = Color3.fromRGB(15, 15, 30),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(60, 120, 255)
    },
    Purple = {
        Main = Color3.fromRGB(30, 20, 40),
        Secondary = Color3.fromRGB(22, 15, 30),
        Text = Color3.fromRGB(255, 255, 255),
        Accent = Color3.fromRGB(180, 60, 255)
    }
}

-- Create rounded corner function
local function RoundedCorner(radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

-- Create stroke function
local function CreateStroke(thickness, color, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness
    stroke.Color = color
    stroke.Transparency = transparency or 0
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return stroke
end

-- Simple draggable function
local function MakeDraggable(frame, handle)
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    if connection then
                        connection:Disconnect()
                    end
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- Create new window
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowName = options.Name or "NazuX Window"
    
    -- Create main GUI
    local NazuXLib = {}
    
    -- Main ScreenGui
    NazuXLib.MainScreenGui = Instance.new("ScreenGui")
    NazuXLib.MainScreenGui.Name = "NazuXLib"
    NazuXLib.MainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    NazuXLib.MainScreenGui.ResetOnSpawn = false
    
    if game:GetService("RunService"):IsStudio() then
        NazuXLib.MainScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    else
        NazuXLib.MainScreenGui.Parent = game.CoreGui
    end

    -- Main Frame
    NazuXLib.MainFrame = Instance.new("Frame")
    NazuXLib.MainFrame.Name = "MainFrame"
    NazuXLib.MainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    NazuXLib.MainFrame.BorderSizePixel = 0
    NazuXLib.MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    NazuXLib.MainFrame.Size = UDim2.new(0, 550, 0, 350)
    NazuXLib.MainFrame.Parent = NazuXLib.MainScreenGui

    -- Corner
    local MainCorner = RoundedCorner(8)
    MainCorner.Parent = NazuXLib.MainFrame

    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.Parent = NazuXLib.MainFrame

    local TitleBarCorner = RoundedCorner(8)
    TitleBarCorner.Parent = TitleBar

    -- Make draggable
    MakeDraggable(NazuXLib.MainFrame, TitleBar)

    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0.5, 0, 1, 0)
    Title.Position = UDim2.new(0.25, 0, 0, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = WindowName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.Parent = TitleBar

    -- Control Buttons
    local ControlButtons = Instance.new("Frame")
    ControlButtons.Name = "ControlButtons"
    ControlButtons.BackgroundTransparency = 1
    ControlButtons.Size = UDim2.new(0, 60, 1, 0)
    ControlButtons.Position = UDim2.new(1, -65, 0, 0)
    ControlButtons.Parent = TitleBar

    -- Minimize Button
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Name = "MinimizeBtn"
    MinimizeBtn.BackgroundTransparency = 1
    MinimizeBtn.Size = UDim2.new(0, 20, 1, 0)
    MinimizeBtn.Position = UDim2.new(0, 0, 0, 0)
    MinimizeBtn.Font = Enum.Font.GothamBold
    MinimizeBtn.Text = "-"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.TextSize = 14
    MinimizeBtn.Parent = ControlButtons

    -- Close Button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Name = "CloseBtn"
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Size = UDim2.new(0, 20, 1, 0)
    CloseBtn.Position = UDim2.new(0, 40, 0, 0)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    CloseBtn.TextSize = 16
    CloseBtn.Parent = ControlButtons

    -- Main Content Area
    local MainContent = Instance.new("Frame")
    MainContent.Name = "MainContent"
    MainContent.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainContent.BorderSizePixel = 0
    MainContent.Size = UDim2.new(1, 0, 1, -30)
    MainContent.Position = UDim2.new(0, 0, 0, 30)
    MainContent.Parent = NazuXLib.MainFrame

    local MainContentCorner = RoundedCorner(8)
    MainContentCorner.Parent = MainContent

    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabContainer.BorderSizePixel = 0
    TabContainer.Size = UDim2.new(0, 120, 1, 0)
    TabContainer.Parent = MainContent

    local TabContainerCorner = RoundedCorner(8)
    TabContainerCorner.Parent = TabContainer

    -- Tab Layout
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Name = "TabLayout"
    TabLayout.Padding = UDim.new(0, 5)
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabLayout.Parent = TabContainer

    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Size = UDim2.new(1, -125, 1, -10)
    ContentContainer.Position = UDim2.new(0, 125, 0, 5)
    ContentContainer.Parent = MainContent

    local ContentContainerCorner = RoundedCorner(6)
    ContentContainerCorner.Parent = ContentContainer

    -- Content Scrolling Frame
    local ContentScrolling = Instance.new("ScrollingFrame")
    ContentScrolling.Name = "ContentScrolling"
    ContentScrolling.BackgroundTransparency = 1
    ContentScrolling.BorderSizePixel = 0
    ContentScrolling.Size = UDim2.new(1, -10, 1, -10)
    ContentScrolling.Position = UDim2.new(0, 5, 0, 5)
    ContentScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentScrolling.ScrollBarThickness = 3
    ContentScrolling.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
    ContentScrolling.Parent = ContentContainer

    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Name = "ContentLayout"
    ContentLayout.Padding = UDim.new(0, 8)
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Parent = ContentScrolling

    -- Update scrolling frame size
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentScrolling.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
    end)

    -- Variables
    NazuXLib.Tabs = {}
    NazuXLib.CurrentTab = nil

    -- Control button functions
    MinimizeBtn.MouseButton1Click:Connect(function()
        NazuXLib.MainFrame.Visible = false
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        NazuXLib.MainScreenGui:Destroy()
    end)

    -- Minimize key
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.LeftControl then
            NazuXLib.MainFrame.Visible = not NazuXLib.MainFrame.Visible
        end
    end)

    -- Create tab function
    function NazuXLib:CreateTab(tabName)
        local Tab = {}
        Tab.Name = tabName
        Tab.Elements = {}

        -- Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "Tab"
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(1, -10, 0, 30)
        TabButton.Position = UDim2.new(0, 5, 0, 5 + ((#NazuXLib.Tabs) * 35))
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 12
        TabButton.Parent = TabContainer

        local TabButtonCorner = RoundedCorner(6)
        TabButtonCorner.Parent = TabButton

        -- Pill indicator
        local Pill = Instance.new("Frame")
        Pill.Name = "Pill"
        Pill.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        Pill.BorderSizePixel = 0
        Pill.Size = UDim2.new(0, 3, 0.6, 0)
        Pill.Position = UDim2.new(0, 3, 0.2, 0)
        Pill.Visible = false
        Pill.Parent = TabButton

        local PillCorner = RoundedCorner(2)
        PillCorner.Parent = Pill

        -- Tab Content
        local TabContent = Instance.new("Frame")
        TabContent.Name = tabName .. "Content"
        TabContent.BackgroundTransparency = 1
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Visible = false
        TabContent.Parent = ContentScrolling

        local TabContentLayout = Instance.new("UIListLayout")
        TabContentLayout.Name = "Layout"
        TabContentLayout.Padding = UDim.new(0, 8)
        TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentLayout.Parent = TabContent

        Tab.Content = TabContent
        Tab.Button = TabButton
        Tab.Pill = Pill

        -- Tab button click event
        TabButton.MouseButton1Click:Connect(function()
            -- Hide all tab contents
            for _, otherTab in pairs(NazuXLib.Tabs) do
                otherTab.Content.Visible = false
                otherTab.Pill.Visible = false
                otherTab.Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end
            
            -- Show this tab content
            TabContent.Visible = true
            Pill.Visible = true
            TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            
            NazuXLib.CurrentTab = Tab
        end)

        -- Add to tabs
        table.insert(NazuXLib.Tabs, Tab)

        -- Select first tab
        if #NazuXLib.Tabs == 1 then
            TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            TabContent.Visible = true
            Pill.Visible = true
            NazuXLib.CurrentTab = Tab
        end

        -- Tab methods
        function Tab:AddButton(options)
            options = options or {}
            local btnName = options.Name or "Button"
            local callback = options.Callback or function() end

            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Name = btnName .. "Frame"
            ButtonFrame.BackgroundTransparency = 1
            ButtonFrame.Size = UDim2.new(1, 0, 0, 35)
            ButtonFrame.Parent = TabContent

            local Button = Instance.new("TextButton")
            Button.Name = btnName
            Button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.Font = Enum.Font.Gotham
            Button.Text = btnName
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14
            Button.Parent = ButtonFrame

            local ButtonCorner = RoundedCorner(6)
            ButtonCorner.Parent = Button

            Button.MouseButton1Click:Connect(function()
                callback()
            end)

            table.insert(Tab.Elements, Button)
            return Button
        end

        function Tab:AddToggle(options)
            options = options or {}
            local toggleName = options.Name or "Toggle"
            local default = options.Default or false
            local callback = options.Callback or function() end

            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = toggleName .. "Frame"
            ToggleFrame.BackgroundTransparency = 1
            ToggleFrame.Size = UDim2.new(1, 0, 0, 30)
            ToggleFrame.Parent = TabContent

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "Label"
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = toggleName
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextSize = 14
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Parent = ToggleFrame

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "Toggle"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Size = UDim2.new(0, 40, 0, 20)
            ToggleButton.Position = UDim2.new(1, -40, 0.5, -10)
            ToggleButton.Font = Enum.Font.Gotham
            ToggleButton.Text = ""
            ToggleButton.Parent = ToggleFrame

            local ToggleCorner = RoundedCorner(10)
            ToggleCorner.Parent = ToggleButton

            local ToggleDot = Instance.new("Frame")
            ToggleDot.Name = "Dot"
            ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDot.BorderSizePixel = 0
            ToggleDot.Size = UDim2.new(0, 16, 0, 16)
            ToggleDot.Position = UDim2.new(0, 2, 0.5, -8)
            ToggleDot.Parent = ToggleButton

            local ToggleDotCorner = RoundedCorner(8)
            ToggleDotCorner.Parent = ToggleDot

            local isToggled = default

            local function UpdateToggle()
                if isToggled then
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
                    ToggleDot.Position = UDim2.new(1, -18, 0.5, -8)
                else
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    ToggleDot.Position = UDim2.new(0, 2, 0.5, -8)
                end
                callback(isToggled)
            end

            ToggleButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                UpdateToggle()
            end)

            UpdateToggle()

            table.insert(Tab.Elements, ToggleFrame)
            
            local ToggleObject = {}
            function ToggleObject:Set(value)
                isToggled = value
                UpdateToggle()
            end
            function ToggleObject:Get()
                return isToggled
            end
            
            return ToggleObject
        end

        function Tab:AddSection(sectionName)
            local SectionFrame = Instance.new("Frame")
            SectionFrame.Name = sectionName .. "Section"
            SectionFrame.BackgroundTransparency = 1
            SectionFrame.Size = UDim2.new(1, 0, 0, 40)
            SectionFrame.Parent = TabContent

            local SectionLabel = Instance.new("TextLabel")
            SectionLabel.Name = "Label"
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Size = UDim2.new(1, 0, 0, 20)
            SectionLabel.Font = Enum.Font.GothamBold
            SectionLabel.Text = sectionName
            SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SectionLabel.TextSize = 16
            SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            SectionLabel.Parent = SectionFrame

            local SectionLine = Instance.new("Frame")
            SectionLine.Name = "Line"
            SectionLine.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
            SectionLine.BorderSizePixel = 0
            SectionLine.Size = UDim2.new(1, 0, 0, 2)
            SectionLine.Position = UDim2.new(0, 0, 1, -2)
            SectionLine.Parent = SectionFrame

            table.insert(Tab.Elements, SectionFrame)
            
            local Section = {}
            function Section:AddButton(options)
                return Tab:AddButton(options)
            end
            function Section:AddToggle(options)
                return Tab:AddToggle(options)
            end
            
            return Section
        end

        return Tab
    end

    -- Notification function
    function NazuXLib:Notify(title, content)
        print("[NazuX] " .. title .. ": " .. content)
    end

    -- Theme changer function
    function NazuXLib:ChangeTheme(themeName)
        local theme = NazuX.Themes[themeName]
        if theme then
            NazuXLib.MainFrame.BackgroundColor3 = theme.Main
            TitleBar.BackgroundColor3 = theme.Secondary
            -- Add more theme application as needed
        end
    end

    return NazuXLib
end

return NazuX
