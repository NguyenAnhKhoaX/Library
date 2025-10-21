-- NazuX Library - Enhanced Search Features
local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

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
    local Size = options.Size or UDim2.new(0, 600, 0, 450)
    local Position = options.Position or UDim2.new(0.5, -300, 0.5, -225)
    
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
        Size = UDim2.new(1, 0, 0, 45),
        Parent = MainFrame
    })
    
    local UICornerTop = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = TopFrame
    })
    
    local Title = Create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 20, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        Font = Enum.Font.GothamBold,
        Text = WindowName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopFrame
    })
    
    -- Search Bar với icon
    local SearchContainer = Create("Frame", {
        Name = "SearchContainer",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BackgroundTransparency = 0.2,
        Position = UDim2.new(0.3, 0, 0.5, -15),
        Size = UDim2.new(0.4, 0, 0, 30),
        Parent = TopFrame
    })
    
    local SearchCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = SearchContainer
    })
    
    local SearchIcon = Create("TextLabel", {
        Name = "SearchIcon",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 8, 0, 0),
        Size = UDim2.new(0, 20, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "🔍",
        TextColor3 = Color3.fromRGB(150, 150, 150),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SearchContainer
    })
    
    local SearchBox = Create("TextBox", {
        Name = "SearchBox",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 30, 0, 0),
        Size = UDim2.new(1, -35, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "",
        PlaceholderText = "Search features...",
        PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = SearchContainer
    })
    
    local ClearSearchButton = Create("TextButton", {
        Name = "ClearSearchButton",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -25, 0, 0),
        Size = UDim2.new(0, 20, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "×",
        TextColor3 = Color3.fromRGB(150, 150, 150),
        TextSize = 16,
        Visible = false,
        Parent = SearchContainer
    })
    
    -- Close Button
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -35, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = Enum.Font.GothamBold,
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Parent = TopFrame
    })
    
    local CloseUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = CloseButton
    })
    
    -- Tabs Container
    local TabsContainer = Create("Frame", {
        Name = "TabsContainer",
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 45),
        Size = UDim2.new(1, 0, 0, 50),
        Parent = MainFrame
    })
    
    local TabsScrolling = Create("ScrollingFrame", {
        Name = "TabsScrolling",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 10),
        Size = UDim2.new(1, -30, 1, -20),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        Parent = TabsContainer
    })
    
    local TabsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        FillDirection = Enum.FillDirection.Horizontal,
        Parent = TabsScrolling
    })
    
    TabsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabsScrolling.CanvasSize = UDim2.new(0, TabsListLayout.AbsoluteContentSize.X, 0, 0)
    end)
    
    -- Content Area
    local ContentArea = Create("Frame", {
        Name = "ContentArea",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 95),
        Size = UDim2.new(1, 0, 1, -95),
        Parent = MainFrame
    })
    
    -- Search Results Panel
    local SearchResults = Create("ScrollingFrame", {
        Name = "SearchResults",
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 10),
        Size = UDim2.new(1, -20, 1, -20),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
        Visible = false,
        Parent = ContentArea
    })
    
    local SearchResultsLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        Parent = SearchResults
    })
    
    local SearchResultsPadding = Create("UIPadding", {
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        Parent = SearchResults
    })
    
    SearchResultsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        SearchResults.CanvasSize = UDim2.new(0, 0, 0, SearchResultsLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Search Box Animations
    SearchBox.Focused:Connect(function()
        Tween(SearchContainer, {
            BackgroundTransparency = 0.1,
            Size = UDim2.new(0.45, 0, 0, 30)
        }, 0.3)
        SearchIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    SearchBox.FocusLost:Connect(function()
        Tween(SearchContainer, {
            BackgroundTransparency = 0.2,
            Size = UDim2.new(0.4, 0, 0, 30)
        }, 0.3)
        SearchIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
    end)
    
    -- Clear Search Button
    ClearSearchButton.MouseButton1Click:Connect(function()
        SearchBox.Text = ""
        ClearSearchButton.Visible = false
        NazuXLibrary:ClearSearch()
    end)
    
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        ClearSearchButton.Visible = SearchBox.Text ~= ""
        if SearchBox.Text ~= "" then
            NazuXLibrary:PerformSearch(SearchBox.Text)
        else
            NazuXLibrary:ClearSearch()
        end
    end)
    
    -- Close Button Animations
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, {
            BackgroundColor3 = Color3.fromRGB(240, 80, 80),
            Rotation = 90,
            Size = UDim2.new(0, 26, 0, 26)
        }, 0.2)
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, {
            BackgroundColor3 = Color3.fromRGB(220, 60, 60),
            Rotation = 0,
            Size = UDim2.new(0, 24, 0, 24)
        }, 0.2)
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        Tween(MainFrame, {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }, 0.4):Wait()
        ScreenGui:Destroy()
    end)
    
    -- Tab Management
    local CurrentTab = nil
    local TabContents = {}
    local TabButtons = {}
    local AllElements = {} -- Lưu tất cả elements để search
    
    function NazuXLibrary:CreateTab(TabName)
        local TabFunctions = {}
        
        -- Tạo tab button
        local TabButton = Create("TextButton", {
            Name = TabName .. "TabButton",
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 100, 0, 35),
            Font = Enum.Font.GothamSemibold,
            Text = TabName,
            TextColor3 = Color3.fromRGB(200, 200, 200),
            TextSize = 13,
            AutoButtonColor = false,
            Parent = TabsScrolling
        })
        
        local TabButtonUICorner = Create("UICorner", {
            CornerRadius = UDim.new(0, 8),
            Parent = TabButton
        })
        
        local TabButtonStroke = Create("UIStroke", {
            Color = Color3.fromRGB(80, 80, 80),
            Thickness = 1,
            Parent = TabButton
        })
        
        -- Tạo content cho tab
        local TabContent = Create("ScrollingFrame", {
            Name = TabName .. "Content",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
            Visible = false,
            Parent = ContentArea
        })
        
        local TabContentListLayout = Create("UIListLayout", {
            Padding = UDim.new(0, 12),
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
        
        -- Tab Button Animations
        TabButton.MouseEnter:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {
                    BackgroundColor3 = Color3.fromRGB(70, 70, 70),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.new(0, 105, 0, 37)
                }, 0.2)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if CurrentTab ~= TabContent then
                Tween(TabButton, {
                    BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    Size = UDim2.new(0, 100, 0, 35)
                }, 0.2)
            end
        end)
        
        -- Tab Click Functionality
        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Visible = false
                
                for _, btn in pairs(TabButtons) do
                    Tween(btn, {
                        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                        TextColor3 = Color3.fromRGB(200, 200, 200),
                        Size = UDim2.new(0, 100, 0, 35)
                    }, 0.2)
                end
            end
            
            CurrentTab = TabContent
            TabContent.Visible = true
            SearchResults.Visible = false
            
            Tween(TabButton, {
                BackgroundColor3 = Color3.fromRGB(0, 120, 215),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.new(0, 105, 0, 37)
            }, 0.2)
        end)
        
        -- BUTTON FUNCTION
        function TabFunctions:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            local ButtonName = ButtonConfig.Name or "Button"
            local Callback = ButtonConfig.Callback or function() end
            
            local ButtonContainer = Create("Frame", {
                Name = ButtonName .. "Container",
                BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 45),
                Parent = TabContent
            })
            
            local ButtonContainerCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 10),
                Parent = ButtonContainer
            })
            
            local ButtonContainerStroke = Create("UIStroke", {
                Color = Color3.fromRGB(70, 70, 70),
                Thickness = 1,
                Parent = ButtonContainer
            })
            
            local Button = Create("TextButton", {
                Name = ButtonName .. "Button",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ButtonName,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 13,
                Parent = ButtonContainer
            })
            
            -- Lưu element để search
            local elementData = {
                Type = "Button",
                Name = ButtonName,
                Container = ButtonContainer,
                Tab = TabName,
                Callback = Callback
            }
            table.insert(AllElements, elementData)
            
            -- Button Animations
            Button.MouseEnter:Connect(function()
                Tween(ButtonContainer, {
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45),
                    BackgroundTransparency = 0.1
                }, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(ButtonContainer, {
                    BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                    BackgroundTransparency = 0.2
                }, 0.2)
            end)
            
            Button.MouseButton1Click:Connect(function()
                Tween(ButtonContainer, {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                }, 0.1)
                wait(0.1)
                Tween(ButtonContainer, {
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                }, 0.1)
                
                Callback()
            end)
            
            return ButtonContainer
        end
        
        -- TOGGLE FUNCTION
        function TabFunctions:AddToggle(ToggleConfig)
            ToggleConfig = ToggleConfig or {}
            local ToggleName = ToggleConfig.Name or "Toggle"
            local Default = ToggleConfig.Default or false
            local Callback = ToggleConfig.Callback or function() end
            
            local ToggleContainer = Create("Frame", {
                Name = ToggleName .. "Container",
                BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 45),
                Parent = TabContent
            })
            
            local ToggleContainerCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 10),
                Parent = ToggleContainer
            })
            
            local ToggleContainerStroke = Create("UIStroke", {
                Color = Color3.fromRGB(70, 70, 70),
                Thickness = 1,
                Parent = ToggleContainer
            })
            
            local ToggleLabel = Create("TextLabel", {
                Name = "ToggleLabel",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 15, 0, 0),
                Size = UDim2.new(0.7, -15, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ToggleName,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ToggleContainer
            })
            
            local ToggleButton = Create("Frame", {
                Name = "ToggleButton",
                BackgroundColor3 = Default and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(80, 80, 80),
                Position = UDim2.new(0.85, -25, 0.5, -12),
                Size = UDim2.new(0, 50, 0, 24),
                Parent = ToggleContainer
            })
            
            local ToggleButtonCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 12),
                Parent = ToggleButton
            })
            
            local ToggleKnob = Create("Frame", {
                Name = "ToggleKnob",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = Default and UDim2.new(0.5, 0, 0.5, -8) or UDim2.new(0, 4, 0.5, -8),
                Size = UDim2.new(0, 16, 0, 16),
                Parent = ToggleButton
            })
            
            local ToggleKnobCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = ToggleKnob
            })
            
            local ToggleClickArea = Create("TextButton", {
                Name = "ToggleClickArea",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Text = "",
                Parent = ToggleContainer
            })
            
            local ToggleState = Default
            
            local function UpdateToggle()
                if ToggleState then
                    Tween(ToggleButton, {
                        BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                    }, 0.2)
                    Tween(ToggleKnob, {
                        Position = UDim2.new(0.5, 0, 0.5, -8)
                    }, 0.2)
                else
                    Tween(ToggleButton, {
                        BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    }, 0.2)
                    Tween(ToggleKnob, {
                        Position = UDim2.new(0, 4, 0.5, -8)
                    }, 0.2)
                end
                Callback(ToggleState)
            end
            
            ToggleClickArea.MouseButton1Click:Connect(function()
                ToggleState = not ToggleState
                UpdateToggle()
            end)
            
            -- Lưu element để search
            local elementData = {
                Type = "Toggle",
                Name = ToggleName,
                Container = ToggleContainer,
                Tab = TabName,
                GetState = function() return ToggleState end,
                SetState = function(value) ToggleState = value UpdateToggle() end
            }
            table.insert(AllElements, elementData)
            
            -- Toggle Container Animations
            ToggleClickArea.MouseEnter:Connect(function()
                Tween(ToggleContainer, {
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45),
                    BackgroundTransparency = 0.1
                }, 0.2)
            end)
            
            ToggleClickArea.MouseLeave:Connect(function()
                Tween(ToggleContainer, {
                    BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                    BackgroundTransparency = 0.2
                }, 0.2)
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
        
        -- LABEL FUNCTION
        function TabFunctions:AddLabel(LabelConfig)
            LabelConfig = LabelConfig or {}
            local LabelText = LabelConfig.Text or "Label"
            local TextColor = LabelConfig.TextColor or Color3.fromRGB(255, 255, 255)
            
            local LabelContainer = Create("Frame", {
                Name = "LabelContainer",
                BackgroundColor3 = Color3.fromRGB(40, 40, 40),
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 35),
                Parent = TabContent
            })
            
            local LabelContainerCorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = LabelContainer
            })
            
            local Label = Create("TextLabel", {
                Name = "Label",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.Gotham,
                Text = LabelText,
                TextColor3 = TextColor,
                TextSize = 12,
                Parent = LabelContainer
            })
            
            -- Lưu element để search
            local elementData = {
                Type = "Label",
                Name = LabelText,
                Container = LabelContainer,
                Tab = TabName
            }
            table.insert(AllElements, elementData)
            
            return LabelContainer
        end
        
        return TabFunctions
    end
    
    -- SEARCH FUNCTIONS
    function NazuXLibrary:PerformSearch(searchText)
        local searchLower = string.lower(searchText)
        local foundResults = false
        
        -- Ẩn tất cả tab contents
        for _, tabContent in pairs(TabContents) do
            tabContent.Visible = false
        end
        
        -- Hiển thị search results
        SearchResults.Visible = true
        
        -- Xóa kết quả cũ
        for _, child in pairs(SearchResults:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        
        -- Tìm kiếm và hiển thị kết quả
        for _, element in pairs(AllElements) do
            if string.find(string.lower(element.Name), searchLower) then
                foundResults = true
                
                local ResultItem = Create("TextButton", {
                    Name = element.Name .. "Result",
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45),
                    BackgroundTransparency = 0.2,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 50),
                    Font = Enum.Font.Gotham,
                    Text = "",
                    Parent = SearchResults
                })
                
                local ResultCorner = Create("UICorner", {
                    CornerRadius = UDim.new(0, 8),
                    Parent = ResultItem
                })
                
                local ResultStroke = Create("UIStroke", {
                    Color = Color3.fromRGB(80, 80, 80),
                    Thickness = 1,
                    Parent = ResultItem
                })
                
                local Icon = Create("TextLabel", {
                    Name = "Icon",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 15, 0, 0),
                    Size = UDim2.new(0, 30, 1, 0),
                    Font = Enum.Font.Gotham,
                    Text = element.Type == "Button" and "🔘" or element.Type == "Toggle" and "⚡" or "🏷️",
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    TextSize = 16,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = ResultItem
                })
                
                local NameLabel = Create("TextLabel", {
                    Name = "NameLabel",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 50, 0, 8),
                    Size = UDim2.new(0.6, -50, 0, 20),
                    Font = Enum.Font.GothamSemibold,
                    Text = element.Name,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = ResultItem
                })
                
                local TypeLabel = Create("TextLabel", {
                    Name = "TypeLabel",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 50, 0, 28),
                    Size = UDim2.new(0.6, -50, 0, 14),
                    Font = Enum.Font.Gotham,
                    Text = element.Type .. " • " .. element.Tab,
                    TextColor3 = Color3.fromRGB(150, 150, 150),
                    TextSize = 11,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = ResultItem
                })
                
                local ActionButton = Create("TextButton", {
                    Name = "ActionButton",
                    BackgroundColor3 = Color3.fromRGB(0, 120, 215),
                    BackgroundTransparency = 0.2,
                    Position = UDim2.new(0.8, 10, 0.5, -15),
                    Size = UDim2.new(0.2, -20, 0, 30),
                    Font = Enum.Font.Gotham,
                    Text = element.Type == "Button" and "RUN" or element.Type == "Toggle" and "TOGGLE" or "VIEW",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 12,
                    Parent = ResultItem
                })
                
                local ActionCorner = Create("UICorner", {
                    CornerRadius = UDim.new(0, 6),
                    Parent = ActionButton
                })
                
                -- Action khi click
                ActionButton.MouseButton1Click:Connect(function()
                    if element.Type == "Button" and element.Callback then
                        element.Callback()
                    elseif element.Type == "Toggle" and element.SetState then
                        local currentState = element.GetState()
                        element.SetState(not currentState)
                        ActionButton.Text = element.GetState() and "ON" or "OFF"
                    end
                    
                    -- Highlight kết quả
                    Tween(ResultItem, {
                        BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                    }, 0.3)
                end)
                
                -- Hover effects
                ResultItem.MouseEnter:Connect(function()
                    Tween(ResultItem, {
                        BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                    }, 0.2)
                end)
                
                ResultItem.MouseLeave:Connect(function()
                    Tween(ResultItem, {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    }, 0.2)
                end)
            end
        end
        
        -- Hiển thị thông báo nếu không tìm thấy kết quả
        if not foundResults then
            local NoResults = Create("TextLabel", {
                Name = "NoResults",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 100),
                Font = Enum.Font.Gotham,
                Text = "No results found for: \"" .. searchText .. "\"",
                TextColor3 = Color3.fromRGB(150, 150, 150),
                TextSize = 14,
                Parent = SearchResults
            })
        end
    end
    
    function NazuXLibrary:ClearSearch()
        SearchResults.Visible = false
        if CurrentTab then
            CurrentTab.Visible = true
        end
    end
    
    function NazuXLibrary:GetSearchResults()
        return AllElements
    end
    
    -- Toggle UI Function
    function NazuXLibrary:ToggleUI()
        MainFrame.Visible = not MainFrame.Visible
    end
    
    return NazuXLibrary
end

return NazuX
