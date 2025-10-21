-- NazuX Library - No Auto Select
local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

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
    
    -- Main Container
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, -300, 0.5, -200),
        Size = UDim2.new(0, 600, 0, 400),
        Active = true,
        Draggable = true,
        Parent = ScreenGui
    })
    
    local UICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    -- Title Bar
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
        Size = UDim2.new(0, 120, 1, 0),
        Font = Enum.Font.GothamBold,
        Text = WindowName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopFrame
    })
    
    -- Search Bar
    local SearchBox = Create("TextBox", {
        Name = "SearchBox",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BackgroundTransparency = 0.3,
        Position = UDim2.new(0.3, 0, 0.5, -12),
        Size = UDim2.new(0.4, 0, 0, 24),
        Font = Enum.Font.Gotham,
        Text = "Search...",
        PlaceholderText = "Search features...",
        TextColor3 = Color3.fromRGB(200, 200, 200),
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopFrame
    })
    
    local SearchCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = SearchBox
    })
    
    local SearchPadding = Create("UIPadding", {
        PaddingLeft = UDim.new(0, 8),
        Parent = SearchBox
    })
    
    -- Close Button
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
    
    -- Tabs Container
    local TabsContainer = Create("Frame", {
        Name = "TabsContainer",
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(1, 0, 0, 40),
        Parent = MainFrame
    })
    
    local TabsScrolling = Create("ScrollingFrame", {
        Name = "TabsScrolling",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 5),
        Size = UDim2.new(1, -20, 1, -10),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        Parent = TabsContainer
    })
    
    local TabsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        Parent = TabsScrolling
    })
    
    -- Content Area
    local ContentArea = Create("Frame", {
        Name = "ContentArea",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 80),
        Size = UDim2.new(1, 0, 1, -80),
        Parent = MainFrame
    })
    
    -- ANIMATION: Search Box focus
    SearchBox.Focused:Connect(function()
        Tween(SearchBox, {
            BackgroundTransparency = 0.1,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }, 0.2)
        
        if SearchBox.Text == "Search..." then
            SearchBox.Text = ""
        end
    end)
    
    SearchBox.FocusLost:Connect(function()
        if SearchBox.Text == "" then
            SearchBox.Text = "Search..."
            Tween(SearchBox, {
                BackgroundTransparency = 0.3,
                TextColor3 = Color3.fromRGB(200, 200, 200)
            }, 0.2)
        end
    end)
    
    -- ANIMATION: Close Button
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {
            BackgroundColor3 = Color3.fromRGB(240, 80, 80),
            Rotation = 5
        }, 0.2)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {
            BackgroundColor3 = Color3.fromRGB(220, 60, 60),
            Rotation = 0
        }, 0.2)
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Tab Management
    local CurrentTab = nil
    local TabContents = {}
    
    function NazuXLibrary:CreateTab(TabName)
        local TabFunctions = {}
        
        -- Tạo tab button
        local TabButton = Create("TextButton", {
            Name = TabName .. "TabButton",
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 80, 0, 30),
            Font = Enum.Font.Gotham,
            Text = TabName,
            TextColor3 = Color3.fromRGB(200, 200, 200),
            TextSize = 11,
            Parent = TabsScrolling
        })
        
        local TabButtonUICorner = Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = TabButton
        })
        
        -- Tạo content cho tab
        local TabContent = Create("ScrollingFrame", {
            Name = TabName .. "Content",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100),
            Visible = false, -- KHÔNG AUTO SELECT
            Parent = ContentArea
        })
        
        local TabContentListLayout = Create("UIListLayout", {
            Padding = UDim.new(0, 10),
            Parent = TabContent
        })
        
        TabContentListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentListLayout.AbsoluteContentSize.Y + 10)
        end)
        
        TabContents[TabName] = TabContent
        
        -- ANIMATION: Tab button hover
        TabButton.MouseEnter:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {
                    BackgroundColor3 = Color3.fromRGB(70, 70, 70),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, 0.2)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {
                    BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                    TextColor3 = Color3.fromRGB(200, 200, 200)
                }, 0.2)
            end
        end)
        
        -- ANIMATION: Tab click
        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                -- Ẩn tab cũ
                CurrentTab.Visible = false
                
                -- Reset tab button cũ
                for _, btn in pairs(TabsScrolling:GetChildren()) do
                    if btn:IsA("TextButton") then
                        Tween(btn, {
                            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                            TextColor3 = Color3.fromRGB(200, 200, 200)
                        }, 0.2)
                    end
                end
            end
            
            -- Hiển thị tab mới
            CurrentTab = TabContent
            TabContent.Visible = true
            
            -- Highlight tab button mới
            Tween(TabButton, {
                BackgroundColor3 = Color3.fromRGB(0, 120, 215),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, 0.2)
        end)
        
        -- BUTTON FUNCTION
        function TabFunctions:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            local ButtonName = ButtonConfig.Name or "Button"
            local Callback = ButtonConfig.Callback or function() end
            
            local Button = Create("TextButton", {
                Name = ButtonName .. "Button",
                BackgroundColor3 = Color3.fromRGB(60, 60, 60),
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -20, 0, 40),
                Font = Enum.Font.Gotham,
                Text = ButtonName,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 12,
                Parent = TabContent
            })
            
            local ButtonUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = Button
            })
            
            -- ANIMATION: Button hover
            Button.MouseEnter:Connect(function()
                Tween(Button, {
                    BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                }, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(Button, {
                    BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                }, 0.2)
            end)
            
            -- ANIMATION: Button click
            Button.MouseButton1Click:Connect(function()
                Tween(Button, {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                }, 0.1)
                wait(0.1)
                Tween(Button, {
                    BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                }, 0.1)
                
                Callback()
            end)
            
            return Button
        end
        
        -- KHÔNG AUTO SELECT TAB ĐẦU TIÊN
        return TabFunctions
    end
    
    -- Toggle UI function
    function NazuXLibrary:ToggleUI()
        MainFrame.Visible = not MainFrame.Visible
    end
    
    -- Search functionality
    function NazuXLibrary:SearchFeatures(searchText)
        for tabName, tabContent in pairs(TabContents) do
            for _, element in pairs(tabContent:GetChildren()) do
                if element:IsA("TextButton") and string.find(string.lower(element.Text), string.lower(searchText)) then
                    Tween(element, {
                        BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                    }, 0.3)
                end
            end
        end
    end
    
    SearchBox.FocusLost:Connect(function(enterPressed)
        if enterPressed and SearchBox.Text ~= "Search..." then
            NazuXLibrary:SearchFeatures(SearchBox.Text)
        end
    end)
    
    return NazuXLibrary
end

return NazuX
