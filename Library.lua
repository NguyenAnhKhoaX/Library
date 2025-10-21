-- NazuX Library - With Real Avatar
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

-- Main Library Function
function NazuX:CreateWindow(options)
    options = options or {}
    local WindowName = options.Name or "NazuX Hub"
    local Size = options.Size or UDim2.new(0, 700, 0, 500)
    local Position = options.Position or UDim2.new(0.5, -350, 0.5, -250)
    local MinimizeKey = options.MinimizeKey or Enum.KeyCode.RightControl
    
    local NazuXLibrary = {}
    local LocalPlayer = Players.LocalPlayer
    
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
    
    -- Minimize Button
    local MinimizeButton = Create("TextButton", {
        Name = "MinimizeButton",
        BackgroundColor3 = Color3.fromRGB(255, 180, 0),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Position = UDim2.new(1, -65, 0.5, -12),
        Size = UDim2.new(0, 24, 0, 24),
        Font = Enum.Font.GothamBold,
        Text = "_",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        AutoButtonColor = false,
        Parent = TopFrame
    })
    
    local MinimizeUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = MinimizeButton
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
        AutoButtonColor = false,
        Parent = TopFrame
    })
    
    local CloseUICorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = CloseButton
    })
    
    -- Search Bar
    local SearchContainer = Create("Frame", {
        Name = "SearchContainer",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BackgroundTransparency = 0.2,
        Position = UDim2.new(0.25, 0, 0.5, -15),
        Size = UDim2.new(0.35, 0, 0, 30),
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
        AutoButtonColor = false,
        Parent = SearchContainer
    })
    
    -- Left Sidebar với User Info
    local LeftSidebar = Create("Frame", {
        Name = "LeftSidebar",
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 45),
        Size = UDim2.new(0, 180, 1, -45),
        Parent = MainFrame
    })
    
    local SidebarCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = LeftSidebar
    })
    
    -- User Info Frame
    local UserInfoFrame = Create("Frame", {
        Name = "UserInfoFrame",
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 10, 0, 10),
        Size = UDim2.new(1, -20, 0, 80),
        Parent = LeftSidebar
    })
    
    local UserInfoCorner = Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = UserInfoFrame
    })
    
    local UserInfoStroke = Create("UIStroke", {
        Color = Color3.fromRGB(70, 70, 70),
        Thickness = 1,
        Parent = UserInfoFrame
    })
    
    -- AVATAR THẬT từ Roblox
    local UserAvatar = Create("ImageLabel", {
        Name = "UserAvatar",
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        Position = UDim2.new(0.5, -20, 0, 10),
        Size = UDim2.new(0, 40, 0, 40),
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=150&height=150&format=png",
        Parent = UserInfoFrame
    })
    
    local AvatarCorner = Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = UserAvatar
    })
    
    local AvatarStroke = Create("UIStroke", {
        Color = Color3.fromRGB(100, 100, 100),
        Thickness = 2,
        Parent = UserAvatar
    })
    
    -- User Info Text
    local UsernameLabel = Create("TextLabel", {
        Name = "UsernameLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 55),
        Size = UDim2.new(1, 0, 0, 16),
        Font = Enum.Font.GothamSemibold,
        Text = "@" .. LocalPlayer.Name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = UserInfoFrame
    })
    
    local UserIdLabel = Create("TextLabel", {
        Name = "UserIdLabel",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 70),
        Size = UDim2.new(1, 0, 0, 12),
        Font = Enum.Font.Gotham,
        Text = "ID: " .. LocalPlayer.UserId,
        TextColor3 = Color3.fromRGB(150, 150, 150),
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = UserInfoFrame
    })
    
    -- Tabs Container
    local TabsContainer = Create("ScrollingFrame", {
        Name = "TabsContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 100),
        Size = UDim2.new(1, -20, 1, -110),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
        Parent = LeftSidebar
    })
    
    local TabsListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        Parent = TabsContainer
    })
    
    TabsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabsContainer.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
    end)
    
    -- Content Area
    local ContentArea = Create("Frame", {
        Name = "ContentArea",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 185, 0, 45),
        Size = UDim2.new(1, -185, 1, -45),
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
    
    -- Minimize Key Functionality
    local IsMinimized = false
    local OriginalSize = Size
    local OriginalPosition = Position
    
    local function ToggleMinimize()
        if IsMinimized then
            -- Hiện lại UI
            MainFrame.Visible = true
            Tween(MainFrame, {
                Size = OriginalSize,
                Position = OriginalPosition,
                BackgroundTransparency = 0.1
            }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        else
            -- Ẩn UI
            Tween(MainFrame, {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1
            }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            wait(0.3)
            MainFrame.Visible = false
        end
        IsMinimized = not IsMinimized
    end
    
    -- Minimize Key Binding
    local MinimizeConnection
    if MinimizeKey then
        MinimizeConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode == MinimizeKey then
                ToggleMinimize()
            end
        end)
    end
    
    -- Minimize Button
    MinimizeButton.MouseEnter:Connect(function()
        Tween(MinimizeButton, {
            BackgroundColor3 = Color3.fromRGB(255, 200, 50),
            Size = UDim2.new(0, 26, 0, 26),
            Position = UDim2.new(1, -66, 0.5, -13)
        }, 0.2)
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        Tween(MinimizeButton, {
            BackgroundColor3 = Color3.fromRGB(255, 180, 0),
            Size = UDim2.new(0, 24, 0, 24),
            Position = UDim2.new(1, -65, 0.5, -12)
        }, 0.2)
    end)
    
    MinimizeButton.MouseButton1Click:Connect(function()
        ToggleMinimize()
    end)
    
    -- Search Box Animations
    SearchBox.Focused:Connect(function()
        Tween(SearchContainer, {
            BackgroundTransparency = 0.1,
            Size = UDim2.new(0.4, 0, 0, 30)
        }, 0.3)
        SearchIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    SearchBox.FocusLost:Connect(function()
        Tween(SearchContainer, {
            BackgroundTransparency = 0.2,
            Size = UDim2.new(0.35, 0, 0, 30)
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
    
    -- Close Button
    local closeDebounce = false
    
    CloseButton.MouseEnter:Connect(function()
        if not closeDebounce then
            Tween(CloseButton, {
                BackgroundColor3 = Color3.fromRGB(240, 80, 80),
                Rotation = 90,
                Size = UDim2.new(0, 26, 0, 26),
                Position = UDim2.new(1, -36, 0.5, -13)
            }, 0.2)
        end
    end)
    
    CloseButton.MouseLeave:Connect(function()
        if not closeDebounce then
            Tween(CloseButton, {
                BackgroundColor3 = Color3.fromRGB(220, 60, 60),
                Rotation = 0,
                Size = UDim2.new(0, 24, 0, 24),
                Position = UDim2.new(1, -35, 0.5, -12)
            }, 0.2)
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        if not closeDebounce then
            closeDebounce = true
            
            Tween(CloseButton, {
                BackgroundColor3 = Color3.fromRGB(255, 100, 100),
                Size = UDim2.new(0, 28, 0, 28),
                Position = UDim2.new(1, -37, 0.5, -14),
                Rotation = 180
            }, 0.2)
            
            wait(0.2)
            
            -- Hủy kết nối phím tắt trước khi đóng
            if MinimizeConnection then
                MinimizeConnection:Disconnect()
            end
            
            Tween(MainFrame, {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1
            }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            
            wait(0.4)
            
            ScreenGui:Destroy()
        end
    end)
    
    -- Tab Management
    local CurrentTab = nil
    local TabContents = {}
    local TabButtons = {}
    local AllElements = {}
    
    function NazuXLibrary:CreateTab(TabName)
        local TabFunctions = {}
        
        -- Tạo tab button thẳng đứng
        local TabButton = Create("TextButton", {
            Name = TabName .. "TabButton",
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 45),
            Font = Enum.Font.GothamSemibold,
            Text = TabName,
            TextColor3 = Color3.fromRGB(200, 200, 200),
            TextSize = 13,
            AutoButtonColor = false,
            Parent = TabsContainer
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
        
        -- Tab Click Functionality
        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Visible = false
                
                for _, btn in pairs(TabButtons) do
                    Tween(btn, {
                        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                        TextColor3 = Color3.fromRGB(200, 200, 200)
                    }, 0.2)
                end
            end
            
            CurrentTab = TabContent
            TabContent.Visible = true
            SearchResults.Visible = false
            
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
                AutoButtonColor = false,
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
            local buttonDebounce = false
            
            Button.MouseEnter:Connect(function()
                if not buttonDebounce then
                    Tween(ButtonContainer, {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
                        BackgroundTransparency = 0.1
                    }, 0.2)
                end
            end)
            
            Button.MouseLeave:Connect(function()
                if not buttonDebounce then
                    Tween(ButtonContainer, {
                        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                        BackgroundTransparency = 0.2
                    }, 0.2)
                end
            end)
            
            Button.MouseButton1Click:Connect(function()
                if not buttonDebounce then
                    buttonDebounce = true
                    
                    Tween(ButtonContainer, {
                        BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    }, 0.1)
                    
                    wait(0.1)
                    
                    Tween(ButtonContainer, {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    }, 0.1)
                    
                    Callback()
                    
                    wait(0.2)
                    buttonDebounce = false
                end
            end)
            
            return ButtonContainer
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
                    AutoButtonColor = false,
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
                    AutoButtonColor = false,
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
                    end
                    
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
                
                ActionButton.MouseEnter:Connect(function()
                    Tween(ActionButton, {
                        BackgroundColor3 = Color3.fromRGB(0, 140, 255)
                    }, 0.2)
                end)
                
                ActionButton.MouseLeave:Connect(function()
                    Tween(ActionButton, {
                        BackgroundColor3 = Color3.fromRGB(0, 120, 215)
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
    
    -- Toggle UI Function
    function NazuXLibrary:ToggleUI()
        ToggleMinimize()
    end
    
    -- Destroy Function
    function NazuXLibrary:Destroy()
        if MinimizeConnection then
            MinimizeConnection:Disconnect()
        end
        ScreenGui:Destroy()
    end
    
    return NazuXLibrary
end

return NazuX
