-- NazuX Library - Transparent & Draggable
local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")

-- Utility Functions
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
    local WindowName = options.Name or "NazuX Hub"
    
    local NazuXLibrary = {}
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        ResetOnSpawn = false
    })
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Main Container - Trong suốt và có thể kéo
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        BackgroundTransparency = 0.2, -- Trong suốt
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -300, 0.5, -200),
        Size = UDim2.new(0, 600, 0, 400),
        Active = true,
        Draggable = true, -- Có thể kéo
        Parent = ScreenGui
    })
    
    local UICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    -- Title Bar - Cũng trong suốt
    local TopFrame = Create("Frame", {
        Name = "TopFrame",
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        Parent = MainFrame
    })
    
    local UICornerTop = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
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
    
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -30, 0.5, -10),
        Size = UDim2.new(0, 20, 0, 20),
        Font = Enum.Font.GothamBold,
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        Parent = TopFrame
    })
    
    local CloseUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 4),
        Parent = CloseButton
    })
    
    -- Content Area - Trong suốt
    local ContentArea = Create("Frame", {
        Name = "ContentArea",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(1, 0, 1, -40),
        Parent = MainFrame
    })
    
    -- Tabs Container - Có thể scroll
    local TabsContainer = Create("ScrollingFrame", {
        Name = "TabsContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 10),
        Size = UDim2.new(1, -20, 1, -20),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100),
        Parent = ContentArea
    })
    
    local TabsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        Parent = TabsContainer
    })
    
    TabsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabsContainer.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
    end)
    
    -- Close Button Event
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    function NazuXLibrary:CreateTab(TabName)
        local TabFunctions = {}
        
        -- Tạo nút tab
        local TabButton = Create("TextButton", {
            Name = TabName .. "TabButton",
            BackgroundColor3 = Color3.fromRGB(40, 40, 40),
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 40),
            Font = Enum.Font.Gotham,
            Text = TabName,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 12,
            Parent = TabsContainer
        })
        
        local TabButtonUICorner = Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = TabButton
        })
        
        -- BUTTON FUNCTION - KHÔNG THÊM FRAME
        function TabFunctions:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            local ButtonName = ButtonConfig.Name or "Button"
            local Callback = ButtonConfig.Callback or function() end
            
            -- Tạo nút trực tiếp
            local Button = Create("TextButton", {
                Name = ButtonName .. "Button",
                BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 35),
                Font = Enum.Font.Gotham,
                Text = ButtonName,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 12,
                Parent = TabsContainer
            })
            
            local ButtonUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = Button
            })
            
            Button.MouseButton1Click:Connect(function()
                Callback()
            end)
            
            Button.MouseEnter:Connect(function()
                Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end)
            
            Button.MouseLeave:Connect(function()
                Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end)
            
            return Button
        end
        
        -- TOGGLE FUNCTION
        function TabFunctions:AddToggle(ToggleConfig)
            ToggleConfig = ToggleConfig or {}
            local ToggleName = ToggleConfig.Name or "Toggle"
            local Default = ToggleConfig.Default or false
            local Callback = ToggleConfig.Callback or function() end
            
            local ToggleContainer = Create("Frame", {
                Name = ToggleName .. "Container",
                BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 35),
                Parent = TabsContainer
            })
            
            local ToggleUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = ToggleContainer
            })
            
            local ToggleLabel = Create("TextLabel", {
                Name = "ToggleLabel",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 10, 0, 0),
                Size = UDim2.new(0.7, -10, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ToggleName,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ToggleContainer
            })
            
            local ToggleState = Default
            
            local ToggleButton = Create("TextButton", {
                Name = "ToggleButton",
                BackgroundColor3 = Default and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(80, 80, 80),
                Position = UDim2.new(0.8, 0, 0.5, -10),
                Size = UDim2.new(0, 40, 0, 20),
                Text = "",
                Parent = ToggleContainer
            })
            
            local ToggleButtonCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 10),
                Parent = ToggleButton
            })
            
            local function UpdateToggle()
                if ToggleState then
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                else
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                end
                Callback(ToggleState)
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                ToggleState = not ToggleState
                UpdateToggle()
            end)
            
            UpdateToggle()
            
            local ToggleFunctions = {}
            function ToggleFunctions:SetValue(Value)
                ToggleState = Value
                UpdateToggle()
            end
            function ToggleFunctions:GetValue()
                return ToggleState
            end
            
            return ToggleFunctions
        end
        
        return TabFunctions
    end
    
    function NazuXLibrary:ToggleUI()
        MainFrame.Visible = not MainFrame.Visible
    end
    
    return NazuXLibrary
end

return NazuX
