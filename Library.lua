--[[
    ╔═══╗ ╔╗      ╔╗  ╔═══╗ ╔╗ ╔╗
    ║╔═╗║ ║║      ║║  ║╔═╗║ ║║ ║║
    ║║ ║║ ║║ ╔╗ ╔╗║║  ║║ ║║ ║║ ║║
    ║╚═╝║ ║║ ║║ ║║║║  ║║ ║║ ║║ ║║ 
    ║╔═╗║ ║╚═╝║ ║╚╝║  ║╚═╝║ ║╚═╝║
    ║║ ║║ ║╔═╗║ ╚╗╔╝  ║╔═╗║ ╚╗╔╗║
    ╚╝ ╚╝ ╚╝ ╚╝  ╚╝   ╚╝ ╚╝  ╚╝╚╝
    
    NazuX Library - Fixed Drag Issue
]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Utility Functions
local function Create(class, properties)
    local instance = Instance.new(class)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

-- Simple Colors
local Colors = {
    Dark = {
        Background = Color3.fromRGB(30, 30, 30),
        Secondary = Color3.fromRGB(40, 40, 40),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(255, 255, 255)
    }
}

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    
    local Window = {
        Tabs = {},
        CurrentTab = nil
    }
    
    setmetatable(Window, self)
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 999, -- High priority to avoid conflicts
        ResetOnSpawn = false
    })
    
    -- Main Container
    local MainFrame = Create("Frame", {
        Parent = ScreenGui,
        Size = options.Size or UDim2.new(0, 600, 0, 400),
        Position = UDim2.new(0.5, -300, 0.5, -200),
        BackgroundColor3 = Colors.Dark.Background,
        BorderSizePixel = 0,
        Active = true -- Important for input
    })
    
    Create("UICorner", {
        Parent = MainFrame,
        CornerRadius = UDim.new(0, 8)
    })
    
    -- Title Bar với ZIndex cao để tránh bị chặn
    local TitleBar = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Colors.Dark.Secondary,
        BorderSizePixel = 0,
        Active = true,
        ZIndex = 10 -- High ZIndex
    })
    
    Create("UICorner", {
        Parent = TitleBar,
        CornerRadius = UDim.new(0, 8)
    })
    
    -- Title với chữ đặc biệt NazuX
    local Title = Create("TextLabel", {
        Parent = TitleBar,
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 40, 0, 0),
        BackgroundTransparency = 1,
        Text = "🅽 🅰 🆉 🆄 🆇", -- Chữ đặc biệt NazuX
        TextColor3 = Colors.Dark.Accent,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        ZIndex = 11
    })
    
    -- Close Button
    local CloseButton = Create("TextButton", {
        Parent = TitleBar,
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -35, 0.5, -15),
        BackgroundColor3 = Colors.Dark.Secondary,
        Text = "X",
        TextColor3 = Colors.Dark.Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        ZIndex = 11
    })
    
    Create("UICorner", {
        Parent = CloseButton,
        CornerRadius = UDim.new(0, 4)
    })
    
    -- Tab Container
    local TabContainer = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(0, 150, 1, -50),
        Position = UDim2.new(0, 10, 0, 50),
        BackgroundTransparency = 1,
        ZIndex = 5
    })
    
    Create("UIListLayout", {
        Parent = TabContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    })
    
    -- Content Container
    local ContentContainer = Create("Frame", {
        Parent = MainFrame,
        Size = UDim2.new(1, -170, 1, -60),
        Position = UDim2.new(0, 170, 0, 50),
        BackgroundColor3 = Colors.Dark.Secondary,
        BorderSizePixel = 0,
        ZIndex = 5
    })
    
    Create("UICorner", {
        Parent = ContentContainer,
        CornerRadius = UDim.new(0, 8)
    })
    
    local ContentScrolling = Create("ScrollingFrame", {
        Parent = ContentContainer,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Colors.Dark.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 5
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
    
    -- Close Functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- FIXED DRAG SYSTEM - Sử dụng RenderStepped để tránh bị chặn
    local dragging = false
    local dragStart
    local startPos
    
    local function updateDrag()
        if dragging then
            local mouse = UserInputService:GetMouseLocation()
            local delta = Vector2.new(mouse.X, mouse.Y) - dragStart
            local newX = startPos.X.Offset + delta.X
            local newY = startPos.Y.Offset + delta.Y
            
            -- Boundary checking
            newX = math.clamp(newX, 0, workspace.CurrentCamera.ViewportSize.X - MainFrame.AbsoluteSize.X)
            newY = math.clamp(newY, 0, workspace.CurrentCamera.ViewportSize.Y - MainFrame.AbsoluteSize.Y)
            
            MainFrame.Position = UDim2.new(0, newX, 0, newY)
        end
    end
    
    -- Kết nối với RenderStepped thay vì InputChanged
    local dragConnection
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = UserInputService:GetMouseLocation()
            startPos = MainFrame.Position
            
            -- Bắt đầu drag loop
            dragConnection = RunService.RenderStepped:Connect(updateDrag)
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    if dragConnection then
                        dragConnection:Disconnect()
                    end
                end
            end)
        end
    end)
    
    -- Public Methods
    function Window:AddTab(tabName)
        -- Tab Button
        local TabButton = Create("TextButton", {
            Parent = TabContainer,
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundColor3 = Colors.Dark.Secondary,
            Text = tabName,
            TextColor3 = Colors.Dark.Text,
            TextSize = 14,
            Font = Enum.Font.GothamSemibold,
            ZIndex = 6
        })
        
        Create("UICorner", {
            Parent = TabButton,
            CornerRadius = UDim.new(0, 6)
        })
        
        -- Tab Content
        local TabContent = Create("ScrollingFrame", {
            Parent = ContentScrolling,
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 0,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
            ZIndex = 6
        })
        
        Create("UIListLayout", {
            Parent = TabContent,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        })
        
        -- Store tab data
        local tabData = {
            Button = TabButton,
            Content = TabContent
        }
        
        table.insert(Window.Tabs, tabData)
        
        -- Tab Selection - FIXED: Không auto-select ngay lập tức
        TabButton.MouseButton1Click:Connect(function()
            if Window.CurrentTab then
                Window.CurrentTab.Button.BackgroundColor3 = Colors.Dark.Secondary
                Window.CurrentTab.Content.Visible = false
            end
            
            Window.CurrentTab = tabData
            TabButton.BackgroundColor3 = Colors.Dark.Accent
            TabContent.Visible = true
        end)
        
        -- Return tab methods
        local TabMethods = {}
        
        function TabMethods:AddButton(options)
            options = options or {}
            local Button = Create("TextButton", {
                Parent = TabContent,
                Size = UDim2.new(1, 0, 0, 35),
                BackgroundColor3 = Colors.Dark.Secondary,
                Text = options.Name or "Button",
                TextColor3 = Colors.Dark.Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                ZIndex = 7
            })
            
            Create("UICorner", {
                Parent = Button,
                CornerRadius = UDim.new(0, 6)
            })
            
            Button.MouseButton1Click:Connect(function()
                if options.Callback then
                    pcall(options.Callback)
                end
            end)
            
            return Button
        end
        
        function TabMethods:AddToggle(options)
            options = options or {}
            local Toggle = {
                Value = options.Default or false
            }
            
            local ToggleFrame = Create("Frame", {
                Parent = TabContent,
                Size = UDim2.new(1, 0, 0, 35),
                BackgroundTransparency = 1,
                ZIndex = 7
            })
            
            local ToggleLabel = Create("TextLabel", {
                Parent = ToggleFrame,
                Size = UDim2.new(0.7, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = options.Name or "Toggle",
                TextColor3 = Colors.Dark.Text,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 7
            })
            
            local ToggleButton = Create("TextButton", {
                Parent = ToggleFrame,
                Size = UDim2.new(0, 40, 0, 20),
                Position = UDim2.new(1, -40, 0.5, -10),
                BackgroundColor3 = Colors.Dark.Secondary,
                Text = "",
                BorderSizePixel = 0,
                ZIndex = 7
            })
            
            Create("UICorner", {
                Parent = ToggleButton,
                CornerRadius = UDim.new(1, 0)
            })
            
            local function UpdateToggle()
                if Toggle.Value then
                    ToggleButton.BackgroundColor3 = Colors.Dark.Accent
                else
                    ToggleButton.BackgroundColor3 = Colors.Dark.Secondary
                end
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                Toggle.Value = not Toggle.Value
                UpdateToggle()
                if options.Callback then
                    pcall(options.Callback, Toggle.Value)
                end
            end)
            
            UpdateToggle()
            return Toggle
        end
        
        function TabMethods:AddLabel(text)
            local Label = Create("TextLabel", {
                Parent = TabContent,
                Size = UDim2.new(1, 0, 0, 25),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = Colors.Dark.Text,
                TextSize = 14,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 7
            })
            
            return Label
        end
        
        return TabMethods
    end
    
    -- Parent to CoreGui
    ScreenGui.Parent = CoreGui
    
    return Window
end

return NazuX
