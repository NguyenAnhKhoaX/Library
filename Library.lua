--[[
    NazuX Library - Windows 11 Style
    Phiên bản: 2.7
    Kết hợp từ: WindUI, FluentPlus, Syde, Rayfield, Orion
    Tính năng: Giao diện Windows 11 với tab trên cùng và hiệu ứng hiện đại
--]]

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Colors - Windows 11 Mica Theme
local Theme = {
    Background = Color3.fromRGB(32, 32, 32),
    Secondary = Color3.fromRGB(40, 40, 40),
    Accent = Color3.fromRGB(0, 120, 215),
    AccentLight = Color3.fromRGB(96, 205, 255),
    Text = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(200, 200, 200),
    Success = Color3.fromRGB(16, 137, 62),
    Warning = Color3.fromRGB(255, 185, 0),
    Error = Color3.fromRGB(232, 17, 35),
    Card = Color3.fromRGB(45, 45, 45)
}

-- Utility functions
local function Create(class, properties)
    local obj = Instance.new(class)
    for prop, value in pairs(properties) do
        obj[prop] = value
    end
    return obj
end

local function Tween(object, goals, duration, style, direction)
    style = style or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    
    local tweenInfo = TweenInfo.new(duration, style, direction)
    local tween = TweenService:Create(object, tweenInfo, goals)
    tween:Play()
    return tween
end

-- Ripple effect
local function CreateRippleEffect(button)
    local Ripple = Create("Frame", {
        Name = "Ripple",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.8,
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Parent = button,
        ZIndex = 10
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = Ripple
    })
    
    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
    local pos = button.AbsolutePosition
    local size = button.AbsoluteSize
    
    Ripple.Position = UDim2.new(0, mouse.X - pos.X, 0, mouse.Y - pos.Y)
    
    Tween(Ripple, {
        Size = UDim2.new(0, size.X * 2, 0, size.X * 2),
        BackgroundTransparency = 1
    }, 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    game:GetService("Debris"):AddItem(Ripple, 0.5)
end

-- Loading Screen với Logo đơn giản
local function CreateLoadingScreen(parent, title, subtitle)
    local LoadingScreen = Create("Frame", {
        Name = "LoadingScreen",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Theme.Background,
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Parent = parent,
        ZIndex = 100
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = LoadingScreen
    })
    
    -- Logo Container
    local LogoContainer = Create("Frame", {
        Name = "LogoContainer",
        Size = UDim2.new(0, 120, 0, 120),
        Position = UDim2.new(0.5, -60, 0.4, -60),
        BackgroundTransparency = 1,
        Parent = LoadingScreen
    })
    
    -- Logo chính
    local Logo = Create("TextLabel", {
        Name = "Logo",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "N",
        TextColor3 = Theme.Accent,
        TextSize = 48,
        Font = Enum.Font.GothamBold,
        Parent = LogoContainer
    })
    
    -- Loading Text
    local LoadingTitle = Create("TextLabel", {
        Name = "LoadingTitle",
        Size = UDim2.new(1, 0, 0, 40),
        Position = UDim2.new(0, 0, 0.7, 0),
        BackgroundTransparency = 1,
        Text = title or "NazuX Library",
        TextColor3 = Theme.Text,
        TextSize = 24,
        Font = Enum.Font.GothamBold,
        Parent = LogoContainer
    })
    
    local LoadingSubtitle = Create("TextLabel", {
        Name = "LoadingSubtitle",
        Size = UDim2.new(1, 0, 0, 25),
        Position = UDim2.new(0, 0, 0.85, 0),
        BackgroundTransparency = 1,
        Text = subtitle or "Loading...",
        TextColor3 = Theme.TextSecondary,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        Parent = LogoContainer
    })
    
    -- Loading Dots Animation đơn giản
    local dots = "."
    local dotConnection
    local function StartDotAnimation()
        dotConnection = RunService.Heartbeat:Connect(function()
            dots = dots == "..." and "." or dots .. "."
            LoadingSubtitle.Text = (subtitle or "Loading") .. dots
        end)
    end
    
    local function StopDotAnimation()
        if dotConnection then
            dotConnection:Disconnect()
            dotConnection = nil
        end
    end
    
    -- Progress functions
    local loading = {}
    
    function loading:SetProgress(progress)
        -- Không cần progress bar
    end
    
    function loading:SetText(text)
        LoadingSubtitle.Text = text
    end
    
    function loading:Complete()
        StopDotAnimation()
        Tween(LoadingScreen, {BackgroundTransparency = 1}, 0.3)
        Tween(LogoContainer, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        wait(0.3)
        LoadingScreen:Destroy()
    end
    
    function loading:Destroy()
        StopDotAnimation()
        LoadingScreen:Destroy()
    end
    
    -- Start animation
    StartDotAnimation()
    
    return loading
end

-- Main Library Function - TAB TRÊN CÙNG
function NazuX:CreateWindow(options)
    options = options or {}
    local windowTitle = options.Title or "NazuX Library"
    local subtitle = options.Subtitle or "Powered by NazuX"
    local toggleKey = options.ToggleKey or Enum.KeyCode.RightShift
    local size = options.Size or UDim2.new(0, 550, 0, 450)
    local showLoading = options.ShowLoading ~= false
    
    -- Main ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name = "NazuXLibrary",
        DisplayOrder = 10,
        Parent = game.CoreGui or LocalPlayer:WaitForChild("PlayerGui")
    })
    
    -- Background Blur
    local Blur = Create("BlurEffect", {
        Name = "BackgroundBlur",
        Size = 0,
        Parent = ScreenGui
    })
    
    -- Loading Screen với Logo
    local LoadingScreen
    if showLoading then
        LoadingScreen = CreateLoadingScreen(ScreenGui, windowTitle, "Initializing")
    end
    
    -- Main Frame - HIỂN THỊ LUÔN
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        Size = size,
        Position = UDim2.new(0.5, -size.X.Offset/2, 0.5, -size.Y.Offset/2),
        BackgroundColor3 = Theme.Background,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = ScreenGui
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = MainFrame
    })
    
    Create("UIStroke", {
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 0.9,
        Thickness = 1,
        Parent = MainFrame
    })
    
    -- Top Bar với Title
    local TopBar = Create("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 50), -- Cao hơn để chứa title
        BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        Parent = MainFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = TopBar
    })
    
    -- Title và Subtitle trong TopBar
    local TitleContainer = Create("Frame", {
        Name = "TitleContainer",
        Size = UDim2.new(0.6, 0, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Parent = TopBar
    })
    
    local Title = Create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(1, 0, 0, 25),
        Position = UDim2.new(0, 0, 0, 5),
        BackgroundTransparency = 1,
        Text = windowTitle,
        TextColor3 = Theme.Text,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold,
        Parent = TitleContainer
    })
    
    local Subtitle = Create("TextLabel", {
        Name = "Subtitle",
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 25),
        BackgroundTransparency = 1,
        Text = subtitle,
        TextColor3 = Theme.TextSecondary,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = TitleContainer
    })
    
    -- Window Controls
    local Controls = Create("Frame", {
        Name = "Controls",
        Size = UDim2.new(0, 120, 1, 0),
        Position = UDim2.new(1, -120, 0, 0),
        BackgroundTransparency = 1,
        Parent = TopBar
    })
    
    local MinimizeButton = Create("TextButton", {
        Name = "MinimizeButton",
        Size = UDim2.new(0, 40, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Text = "_",
        TextColor3 = Theme.Text,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        Parent = Controls
    })
    
    local CloseButton = Create("TextButton", {
        Name = "CloseButton",
        Size = UDim2.new(0, 40, 1, 0),
        Position = UDim2.new(1, -40, 0, 0),
        BackgroundTransparency = 1,
        Text = "×",
        TextColor3 = Theme.Text,
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        Parent = Controls
    })
    
    -- Tab Container NẰM TRÊN CÙNG - DƯỚI TOPBAR
    local TabContainer = Create("Frame", {
        Name = "TabContainer",
        Size = UDim2.new(1, 0, 0, 40), -- Chiều cao tab
        Position = UDim2.new(0, 0, 0, 50), -- Dưới TopBar
        BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Parent = MainFrame
    })
    
    local TabListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        HorizontalAlignment = Enum.HorizontalAlignment.Left, -- Căn trái
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = TabContainer
    })
    
    Create("UIPadding", {
        PaddingTop = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        Parent = TabContainer
    })
    
    -- Content Container - CHIẾM TOÀN BỘ KHÔNG GIAN CÒN LẠI
    local ContentContainer = Create("ScrollingFrame", {
        Name = "ContentContainer",
        Size = UDim2.new(1, 0, 1, -90), -- Trừ đi TopBar và TabContainer
        Position = UDim2.new(0, 0, 0, 90), -- Dưới TabContainer
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = MainFrame
    })
    
    local ContentListLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = ContentContainer
    })
    
    Create("UIPadding", {
        PaddingTop = UDim.new(0, 15),
        PaddingLeft = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15),
        Parent = ContentContainer
    })
    
    -- Variables
    local tabs = {}
    local currentTab = nil
    local minimized = false
    
    -- Function hiển thị UI sau loading
    local function ShowMainUI()
        -- Ẩn loading screen
        if showLoading and LoadingScreen then
            LoadingScreen:Complete()
        end
        
        -- Hiển thị blur effect
        Tween(Blur, {Size = 5}, 0.5)
    end
    
    -- Close functionality
    CloseButton.MouseButton1Click:Connect(function()
        Tween(Blur, {Size = 0}, 0.3)
        Tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        wait(0.3)
        ScreenGui:Destroy()
    end)
    
    -- Minimize functionality
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Tween(MainFrame, {Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, 50)}, 0.3)
        else
            Tween(MainFrame, {Size = size}, 0.3)
        end
    end)
    
    -- Dragging functionality
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function Update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            Update(input)
        end
    end)
    
    -- Toggle visibility với hiệu ứng
    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == toggleKey then
            if MainFrame.Visible then
                Tween(Blur, {Size = 0}, 0.3)
                Tween(MainFrame, {BackgroundTransparency = 1}, 0.2)
                wait(0.2)
                MainFrame.Visible = false
            else
                MainFrame.Visible = true
                Tween(MainFrame, {BackgroundTransparency = 0.15}, 0.2)
                Tween(Blur, {Size = 5}, 0.3)
            end
        end
    end)
    
    -- Tab functions - TAB NẰM NGANG
    local function CreateTab(options)
        local tabOptions = typeof(options) == "table" and options or {Title = tostring(options)}
        local name = tabOptions.Title or "Tab"
        local icon = tabOptions.Icon or ""
        
        local tabButton = Create("TextButton", {
            Name = name .. "Tab",
            Size = UDim2.new(0, 120, 0, 30), -- Tab nằm ngang
            BackgroundColor3 = Theme.Card,
            BackgroundTransparency = 0.5,
            Text = icon ~= "" and (icon .. " " .. name) or name,
            TextColor3 = Theme.TextSecondary,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Center,
            Font = Enum.Font.Gotham,
            Parent = TabContainer,
            LayoutOrder = #tabs + 1
        })
        
        Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = tabButton
        })
        
        Create("UIStroke", {
            Color = Theme.Accent,
            Transparency = 0.8,
            Thickness = 1,
            Parent = tabButton
        })
        
        local tabContent = Create("Frame", {
            Name = name .. "Content",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Visible = false,
            Parent = ContentContainer
        })
        
        local tabContentLayout = Create("UIListLayout", {
            Padding = UDim.new(0, 10),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = tabContent
        })
        
        Create("UIPadding", {
            PaddingTop = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5),
            Parent = tabContent
        })
        
        local tab = {
            Button = tabButton,
            Content = tabContent,
            Name = name,
            Icon = icon
        }
        
        table.insert(tabs, tab)
        
        -- Hover effects
        tabButton.MouseEnter:Connect(function()
            if currentTab ~= tab then
                Tween(tabButton, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}, 0.2)
            end
        end)
        
        tabButton.MouseLeave:Connect(function()
            if currentTab ~= tab then
                Tween(tabButton, {BackgroundColor3 = Theme.Card}, 0.2)
            end
        end)
        
        tabButton.MouseButton1Click:Connect(function()
            CreateRippleEffect(tabButton)
            
            if currentTab then
                currentTab.Content.Visible = false
                Tween(currentTab.Button, {
                    BackgroundColor3 = Theme.Card,
                    TextColor3 = Theme.TextSecondary
                }, 0.2)
            end
            
            currentTab = tab
            tab.Content.Visible = true
            Tween(tab.Button, {
                BackgroundColor3 = Theme.Accent,
                TextColor3 = Theme.Text
            }, 0.2)
        end)
        
        -- Tự động chọn tab đầu tiên
        if #tabs == 1 then
            currentTab = tab
            tab.Content.Visible = true
            Tween(tab.Button, {
                BackgroundColor3 = Theme.Accent,
                TextColor3 = Theme.Text
            }, 0.2)
        end
        
        return tab
    end
    
    -- Update ContentContainer size
    local function UpdateContentSize()
        local content = currentTab and currentTab.Content
        if content then
            local layout = content:FindFirstChildOfClass("UIListLayout")
            if layout then
                local absoluteContentSize = layout.AbsoluteContentSize
                ContentContainer.CanvasSize = UDim2.new(0, 0, 0, absoluteContentSize.Y + 30)
            end
        end
    end
    
    -- Kết nối sự kiện update kích thước
    RunService.Heartbeat:Connect(UpdateContentSize)
    
    -- Return window functions
    local window = {}
    
    function window:AddTab(options)
        return CreateTab(options)
    end
    
    function window:Destroy()
        ScreenGui:Destroy()
    end
    
    function window:Minimize()
        minimized = true
        Tween(MainFrame, {Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, 50)}, 0.3)
    end
    
    function window:Maximize()
        minimized = false
        Tween(MainFrame, {Size = size}, 0.3)
    end
    
    function window:Show()
        ShowMainUI()
    end
    
    function window:CreateLoading(title, subtitle)
        return CreateLoadingScreen(ScreenGui, title, subtitle)
    end
    
    -- TỰ ĐỘNG HIỂN THỊ BLUR SAU 1 GIÂY
    delay(1, function()
        ShowMainUI()
    end)
    
    return window
end

-- Control functions (giữ nguyên)
function NazuX:AddButton(tab, options)
    options = options or {}
    local name = options.Name or "Button"
    local callback = options.Callback or function() end
    
    local Button = Create("TextButton", {
        Name = name .. "Button",
        Size = UDim2.new(1, -10, 0, 40),
        BackgroundColor3 = Theme.Card,
        BackgroundTransparency = 0.3,
        Text = name,
        TextColor3 = Theme.Text,
        TextSize = 14,
        Font = Enum.Font.GothamSemibold,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = Button
    })
    
    Create("UIStroke", {
        Color = Theme.Accent,
        Transparency = 0.7,
        Thickness = 1,
        Parent = Button
    })
    
    Button.MouseEnter:Connect(function()
        Tween(Button, {
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            BackgroundTransparency = 0.1
        }, 0.2)
    end)
    
    Button.MouseLeave:Connect(function()
        Tween(Button, {
            BackgroundColor3 = Theme.Card,
            BackgroundTransparency = 0.3
        }, 0.2)
    end)
    
    Button.MouseButton1Click:Connect(function()
        CreateRippleEffect(Button)
        Tween(Button, {BackgroundColor3 = Theme.Accent}, 0.1)
        Tween(Button, {BackgroundColor3 = Theme.Card}, 0.1)
        callback()
    end)
    
    return Button
end

function NazuX:AddToggle(tab, options)
    options = options or {}
    local name = options.Name or "Toggle"
    local default = options.Default or false
    local callback = options.Callback or function() end
    
    local ToggleFrame = Create("Frame", {
        Name = name .. "Toggle",
        Size = UDim2.new(1, -10, 0, 40),
        BackgroundColor3 = Theme.Card,
        BackgroundTransparency = 0.3,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = ToggleFrame
    })
    
    Create("UIStroke", {
        Color = Theme.Accent,
        Transparency = 0.7,
        Thickness = 1,
        Parent = ToggleFrame
    })
    
    local Label = Create("TextLabel", {
        Name = "Label",
        Size = UDim2.new(0.7, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = Theme.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = ToggleFrame
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 15),
        Parent = Label
    })
    
    local ToggleButton = Create("TextButton", {
        Name = "ToggleButton",
        Size = UDim2.new(0, 50, 0, 25),
        Position = UDim2.new(1, -65, 0.5, -12.5),
        BackgroundColor3 = default and Theme.Success or Theme.Secondary,
        Text = "",
        Parent = ToggleFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = ToggleButton
    })
    
    local ToggleKnob = Create("Frame", {
        Name = "ToggleKnob",
        Size = UDim2.new(0, 21, 0, 21),
        Position = default and UDim2.new(1, -23, 0.5, -10.5) or UDim2.new(0, 2, 0.5, -10.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Parent = ToggleButton
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = ToggleKnob
    })
    
    local ToggleState = default
    
    local function UpdateToggle()
        if ToggleState then
            Tween(ToggleButton, {BackgroundColor3 = Theme.Success}, 0.2)
            Tween(ToggleKnob, {Position = UDim2.new(1, -23, 0.5, -10.5)}, 0.2)
        else
            Tween(ToggleButton, {BackgroundColor3 = Theme.Secondary}, 0.2)
            Tween(ToggleKnob, {Position = UDim2.new(0, 2, 0.5, -10.5)}, 0.2)
        end
        callback(ToggleState)
    end
    
    ToggleButton.MouseButton1Click:Connect(function()
        CreateRippleEffect(ToggleButton)
        ToggleState = not ToggleState
        UpdateToggle()
    end)
    
    UpdateToggle()
    
    local toggle = {}
    
    function toggle:Set(value)
        ToggleState = value
        UpdateToggle()
    end
    
    function toggle:Get()
        return ToggleState
    end
    
    return toggle
end

function NazuX:AddSlider(tab, options)
    options = options or {}
    local name = options.Name or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.Default or min
    local callback = options.Callback or function() end
    local precise = options.Precise or false
    local suffix = options.Suffix or ""
    
    local SliderFrame = Create("Frame", {
        Name = name .. "Slider",
        Size = UDim2.new(1, -10, 0, 70),
        BackgroundColor3 = Theme.Card,
        BackgroundTransparency = 0.3,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = SliderFrame
    })
    
    Create("UIStroke", {
        Color = Theme.Accent,
        Transparency = 0.7,
        Thickness = 1,
        Parent = SliderFrame
    })
    
    local Label = Create("TextLabel", {
        Name = "Label",
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.new(0, 10, 0, 5),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = Theme.Text,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = SliderFrame
    })
    
    local ValueLabel = Create("TextLabel", {
        Name = "ValueLabel",
        Size = UDim2.new(0, 80, 0, 20),
        Position = UDim2.new(1, -90, 0, 5),
        BackgroundTransparency = 1,
        Text = tostring(default) .. suffix,
        TextColor3 = Theme.TextSecondary,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Right,
        Font = Enum.Font.Gotham,
        Parent = SliderFrame
    })
    
    local SliderBackground = Create("Frame", {
        Name = "SliderBackground",
        Size = UDim2.new(1, -20, 0, 6),
        Position = UDim2.new(0, 10, 1, -30),
        BackgroundColor3 = Theme.Secondary,
        Parent = SliderFrame
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = SliderBackground
    })
    
    local SliderFill = Create("Frame", {
        Name = "SliderFill",
        Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = Theme.Accent,
        Parent = SliderBackground
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = SliderFill
    })
    
    local SliderButton = Create("TextButton", {
        Name = "SliderButton",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new((default - min) / (max - min), -10, 0.5, -10),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Text = "",
        Parent = SliderBackground
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = SliderButton
    })
    
    local dragging = false
    local currentValue = default
    
    local function UpdateSlider(value)
        value = math.clamp(value, min, max)
        currentValue = precise and value or math.floor(value)
        local percentage = (value - min) / (max - min)
        
        Tween(SliderFill, {Size = UDim2.new(percentage, 0, 1, 0)}, 0.1)
        Tween(SliderButton, {Position = UDim2.new(percentage, -10, 0.5, -10)}, 0.1)
        ValueLabel.Text = tostring(currentValue) .. suffix
        callback(currentValue)
    end
    
    -- Slider dragging functionality
    local function onInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            
            local function updateSliderPosition()
                while dragging do
                    local mouse = UserInputService:GetMouseLocation()
                    local sliderAbsPos = SliderBackground.AbsolutePosition
                    local sliderAbsSize = SliderBackground.AbsoluteSize
                    
                    local relativeX = (mouse.X - sliderAbsPos.X) / sliderAbsSize.X
                    relativeX = math.clamp(relativeX, 0, 1)
                    
                    local value = min + (max - min) * relativeX
                    UpdateSlider(value)
                    
                    RunService.RenderStepped:Wait()
                end
            end
            
            spawn(updateSliderPosition)
        end
    end
    
    local function onInputEnded(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end
    
    -- Connect events
    SliderBackground.InputBegan:Connect(onInputBegan)
    SliderBackground.InputEnded:Connect(onInputEnded)
    SliderButton.InputBegan:Connect(onInputBegan)
    SliderButton.InputEnded:Connect(onInputEnded)
    
    -- Click to set value
    SliderBackground.MouseButton1Down:Connect(function()
        local mouse = UserInputService:GetMouseLocation()
        local sliderAbsPos = SliderBackground.AbsolutePosition
        local sliderAbsSize = SliderBackground.AbsoluteSize
        
        local relativeX = (mouse.X - sliderAbsPos.X) / sliderAbsSize.X
        relativeX = math.clamp(relativeX, 0, 1)
        
        local value = min + (max - min) * relativeX
        UpdateSlider(value)
    end)
    
    UpdateSlider(default)
    
    local slider = {}
    
    function slider:Set(value)
        UpdateSlider(value)
    end
    
    function slider:Get()
        return currentValue
    end
    
    return slider
end

function NazuX:AddLabel(tab, options)
    options = options or {}
    local text = options.Text or "Label"
    local centered = options.Center or false
    
    local Label = Create("TextLabel", {
        Name = "Label",
        Size = UDim2.new(1, -10, 0, 25),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = Theme.Text,
        TextSize = 14,
        TextXAlignment = centered and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    return Label
end

function NazuX:AddSeparator(tab, options)
    options = options or {}
    local text = options.Text or ""
    
    local SeparatorFrame = Create("Frame", {
        Name = "Separator",
        Size = UDim2.new(1, -10, 0, 20),
        BackgroundTransparency = 1,
        Parent = tab.Content,
        LayoutOrder = #tab.Content:GetChildren()
    })
    
    local Line = Create("Frame", {
        Name = "Line",
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = Theme.Secondary,
        BackgroundTransparency = 0.5,
        Parent = SeparatorFrame
    })
    
    if text ~= "" then
        Line.Size = UDim2.new(0.4, 0, 0, 1)
        
        local RightLine = Create("Frame", {
            Name = "RightLine",
            Size = UDim2.new(0.4, 0, 0, 1),
            Position = UDim2.new(0.6, 0, 0.5, 0),
            BackgroundColor3 = Theme.Secondary,
            BackgroundTransparency = 0.5,
            Parent = SeparatorFrame
        })
        
        local TextLabel = Create("TextLabel", {
            Name = "TextLabel",
            Size = UDim2.new(0.2, 0, 1, 0),
            Position = UDim2.new(0.4, 0, 0, 0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = Theme.TextSecondary,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            Parent = SeparatorFrame
        })
    end
    
    return SeparatorFrame
end

return NazuX
