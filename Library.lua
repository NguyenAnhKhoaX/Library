--[[
    NazuX Library - SIMPLE WORKING VERSION
    Basic UI that will definitely work
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Local player
local player = Players.LocalPlayer

-- Simple theme
local Themes = {
    Dark = {
        Background = Color3.fromRGB(32, 32, 32),
        Secondary = Color3.fromRGB(48, 48, 48),
        Primary = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255),
        Border = Color3.fromRGB(64, 64, 64)
    }
}

-- Utility function
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        if instance[property] ~= nil then
            instance[property] = value
        end
    end
    return instance
end

-- Main Window Function
function NazuX:CreateWindow(options)
    options = options or {}
    local window = setmetatable({}, NazuX)
    
    -- Wait for PlayerGui
    if not player:FindFirstChild("PlayerGui") then
        player:WaitForChild("PlayerGui")
    end
    
    -- Create ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        Parent = player.PlayerGui
    })
    
    -- Main Frame
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = Themes.Dark.Background,
        BorderSizePixel = 1,
        BorderColor3 = Themes.Dark.Border,
        Position = UDim2.new(0.5, -250, 0.5, -200),
        Size = UDim2.new(0, 500, 0, 400),
        ClipsDescendants = true,
        Parent = ScreenGui
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    -- Title Bar
    local TitleBar = Create("Frame", {
        Name = "TitleBar",
        BackgroundColor3 = Themes.Dark.Secondary,
        Size = UDim2.new(1, 0, 0, 40),
        Parent = MainFrame
    })
    
    -- Title Label (Left)
    local TitleLabel = Create("TextLabel", {
        Name = "TitleLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        Font = Enum.Font.Gotham,
        Text = options.Title or "NazuX Library",
        TextColor3 = Themes.Dark.Text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    -- Controls
    local Controls = Create("Frame", {
        Name = "Controls",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -100, 0, 0),
        Size = UDim2.new(0, 100, 1, 0),
        Parent = TitleBar
    })
    
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 66, 0, 0),
        Size = UDim2.new(0, 34, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "×",
        TextColor3 = Themes.Dark.Text,
        TextSize = 18,
        Parent = Controls
    })
    
    -- Tabs Container
    local TabsContainer = Create("Frame", {
        Name = "TabsContainer",
        BackgroundColor3 = Themes.Dark.Secondary,
        BackgroundTransparency = 0.8,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(0, 150, 1, -40),
        Parent = MainFrame
    })
    
    -- Content Container
    local ContentContainer = Create("Frame", {
        Name = "ContentContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 150, 0, 40),
        Size = UDim2.new(1, -150, 1, -40),
        Parent = MainFrame
    })
    
    local ContentScrolling = Create("ScrollingFrame", {
        Name = "ContentScrolling",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Themes.Dark.Primary,
        Parent = ContentContainer
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = ContentScrolling
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 20),
        PaddingRight = UDim.new(0, 20),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
        Parent = ContentScrolling
    })
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Draggable functionality
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Store window data
    window.Tabs = {}
    window.ScreenGui = ScreenGui
    window.MainFrame = MainFrame
    window.TabsContainer = TabsContainer
    window.ContentScrolling = ContentScrolling
    
    return window
end

-- Tab function
function NazuX:CreateTab(name)
    local tab = {}
    tab.Name = name
    tab.Buttons = {}
    
    -- Tab button
    local TabButton = Create("TextButton", {
        Name = name .. "Tab",
        BackgroundColor3 = Themes.Dark.Secondary,
        BackgroundTransparency = 0.9,
        Size = UDim2.new(1, -10, 0, 40),
        Position = UDim2.new(0, 5, 0, (#self.Tabs * 45) + 5),
        Font = Enum.Font.Gotham,
        Text = name,
        TextColor3 = Themes.Dark.Text,
        TextSize = 14,
        Parent = self.TabsContainer
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = TabButton
    })
    
    -- Content frame
    local TabContent = Create("ScrollingFrame", {
        Name = name .. "Content",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        Visible = false,
        Parent = self.ContentScrolling
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = TabContent
    })
    
    tab.Button = TabButton
    tab.Content = TabContent
    
    -- Tab selection
    TabButton.MouseButton1Click:Connect(function()
        for _, otherTab in pairs(self.Tabs) do
            otherTab.Content.Visible = false
            otherTab.Button.BackgroundTransparency = 0.9
        end
        tab.Content.Visible = true
        tab.Button.BackgroundTransparency = 0.7
    end)
    
    table.insert(self.Tabs, tab)
    
    -- Select first tab
    if #self.Tabs == 1 then
        tab.Content.Visible = true
        tab.Button.BackgroundTransparency = 0.7
    end
    
    -- Tab methods
    function tab:AddButton(options)
        options = options or {}
        
        local ButtonFrame = Create("Frame", {
            Name = "ButtonFrame",
            BackgroundColor3 = Themes.Dark.Secondary,
            BackgroundTransparency = 0.8,
            Size = UDim2.new(1, 0, 0, 40),
            LayoutOrder = #self.Buttons + 1,
            Parent = self.Content
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = ButtonFrame
        })
        
        local Button = Create("TextButton", {
            Name = "Button",
            BackgroundColor3 = Themes.Dark.Primary,
            BackgroundTransparency = 0.2,
            Position = UDim2.new(0, 5, 0, 5),
            Size = UDim2.new(1, -10, 1, -10),
            Font = Enum.Font.Gotham,
            Text = options.Name or "Button",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 14,
            Parent = ButtonFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 4),
            Parent = Button
        })
        
        if options.Callback then
            Button.MouseButton1Click:Connect(function()
                options.Callback()
            end)
        end
        
        self.Content.CanvasSize = UDim2.new(0, 0, 0, (#self.Buttons + 1) * 50)
        table.insert(self.Buttons, ButtonFrame)
        
        return {
            SetText = function(self, text)
                Button.Text = text
            end
        }
    end
    
    function tab:AddToggle(options)
        options = options or {}
        local toggle = {Value = options.Default or false}
        
        local ToggleFrame = Create("Frame", {
            Name = "ToggleFrame",
            BackgroundColor3 = Themes.Dark.Secondary,
            BackgroundTransparency = 0.8,
            Size = UDim2.new(1, 0, 0, 40),
            LayoutOrder = #self.Buttons + 1,
            Parent = self.Content
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = ToggleFrame
        })
        
        local ToggleLabel = Create("TextLabel", {
            Name = "ToggleLabel",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 10, 0, 0),
            Size = UDim2.new(0.7, -10, 1, 0),
            Font = Enum.Font.Gotham,
            Text = options.Name or "Toggle",
            TextColor3 = Themes.Dark.Text,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = ToggleFrame
        })
        
        local ToggleButton = Create("TextButton", {
            Name = "ToggleButton",
            BackgroundColor3 = Color3.fromRGB(80, 80, 80),
            BorderSizePixel = 0,
            Position = UDim2.new(1, -50, 0.5, -10),
            Size = UDim2.new(0, 40, 0, 20),
            Font = Enum.Font.Gotham,
            Text = "",
            Parent = ToggleFrame
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = ToggleButton
        })
        
        local ToggleKnob = Create("Frame", {
            Name = "ToggleKnob",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
            Position = UDim2.new(0, 2, 0.5, -8),
            Size = UDim2.new(0, 16, 0, 16),
            Parent = ToggleButton
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = ToggleKnob
        })
        
        local function updateToggle()
            if toggle.Value then
                ToggleButton.BackgroundColor3 = Themes.Dark.Primary
                ToggleKnob.Position = UDim2.new(0, 22, 0.5, -8)
            else
                ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                ToggleKnob.Position = UDim2.new(0, 2, 0.5, -8)
            end
        end
        
        ToggleButton.MouseButton1Click:Connect(function()
            toggle.Value = not toggle.Value
            updateToggle()
            if options.Callback then
                options.Callback(toggle.Value)
            end
        end)
        
        updateToggle()
        
        self.Content.CanvasSize = UDim2.new(0, 0, 0, (#self.Buttons + 1) * 50)
        table.insert(self.Buttons, ToggleFrame)
        
        return toggle
    end
    
    function tab:AddSection(name)
        local section = {}
        
        local SectionFrame = Create("Frame", {
            Name = "SectionFrame",
            BackgroundColor3 = Themes.Dark.Secondary,
            BackgroundTransparency = 0.9,
            Size = UDim2.new(1, 0, 0, 40),
            LayoutOrder = #self.Buttons + 1,
            Parent = self.Content
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = SectionFrame
        })
        
        local SectionLabel = Create("TextLabel", {
            Name = "SectionLabel",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Font = Enum.Font.GothamSemibold,
            Text = name,
            TextColor3 = Themes.Dark.Text,
            TextSize = 16,
            Parent = SectionFrame
        })
        
        self.Content.CanvasSize = UDim2.new(0, 0, 0, (#self.Buttons + 1) * 50)
        table.insert(self.Buttons, SectionFrame)
        
        return section
    end
    
    return tab
end

-- Simple notification function
function NazuX:Notify(title, content, duration)
    duration = duration or 3
    
    local Notification = Create("Frame", {
        Name = "Notification",
        BackgroundColor3 = Themes.Dark.Background,
        BorderColor3 = Themes.Dark.Border,
        Position = UDim2.new(1, -310, 1, -150),
        Size = UDim2.new(0, 300, 0, 100),
        Parent = self.ScreenGui
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = Notification
    })
    
    local Title = Create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 10),
        Size = UDim2.new(1, -30, 0, 20),
        Font = Enum.Font.GothamSemibold,
        Text = title,
        TextColor3 = Themes.Dark.Text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Notification
    })
    
    local Content = Create("TextLabel", {
        Name = "Content",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 35),
        Size = UDim2.new(1, -30, 1, -45),
        Font = Enum.Font.Gotham,
        Text = content,
        TextColor3 = Themes.Dark.Text,
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Parent = Notification
    })
    
    wait(duration)
    Notification:Destroy()
end

return NazuX
