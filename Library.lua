-- NazuX Library - Windows 11 Style UI
-- Normal Button with Fingerprint Logo

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Colors
local AccentColor = Color3.fromRGB(0, 120, 215)

-- Themes và các phần khác giữ nguyên...

-- Main Library Function
function NazuX:CreateWindow(options)
    -- Các phần trước giữ nguyên...
    
    -- Tab Management
    local CurrentTab = nil
    
    function NazuXLibrary:CreateTab(TabName)
        -- Tạo tab button và content giữ nguyên...
        
        local TabFunctions = {}
        
        -- AddButton Function với logo vân tay
        function TabFunctions:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            local ButtonName = ButtonConfig.Name or "Button"
            local Callback = ButtonConfig.Callback or function() end
            
            local ButtonContainer = Create("Frame", {
                Name = ButtonName .. "Container",
                BackgroundColor3 = CurrentTheme.Secondary,
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -20, 0, 35),
                Parent = TabContent
            })
        
            local ButtonContainerUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = ButtonContainer
            })
            
            -- Button Label (Bên trái)
            local ButtonLabel = Create("TextLabel", {
                Name = ButtonName .. "Label",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 15, 0, 0),
                Size = UDim2.new(0.7, -15, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ButtonName,
                TextColor3 = CurrentTheme.Text,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ButtonContainer
            })
            
            -- Fingerprint Logo (Bên phải)
            local ButtonFingerprint = Create("ImageLabel", {
                Name = ButtonName .. "Fingerprint",
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -30, 0.5, -8),
                Size = UDim2.new(0, 16, 0, 16),
                Image = "rbxassetid://3926305904",
                ImageColor3 = CurrentTheme.SubText,
                ImageRectOffset = Vector2.new(884, 284), -- Fingerprint icon
                ImageRectSize = Vector2.new(36, 36),
                Parent = ButtonContainer
            })
            
            -- Invisible Button (Cover toàn bộ container)
            local Button = Create("TextButton", {
                Name = ButtonName .. "Button",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Text = "",
                Parent = ButtonContainer
            })
            
            Button.MouseButton1Click:Connect(function()
                Callback()
                -- Hiệu ứng click
                Tween(ButtonContainer, {BackgroundColor3 = AccentColor}, 0.1)
                Tween(ButtonFingerprint, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, 0.1)
                wait(0.1)
                Tween(ButtonContainer, {BackgroundColor3 = CurrentTheme.Secondary}, 0.1)
                Tween(ButtonFingerprint, {ImageColor3 = CurrentTheme.SubText}, 0.1)
            end)
            
            Button.MouseEnter:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}, 0.2)
                Tween(ButtonFingerprint, {Size = UDim2.new(0, 18, 0, 18)}, 0.2)
            end)
            
            Button.MouseLeave:Connect(function()
                Tween(ButtonContainer, {BackgroundColor3 = CurrentTheme.Secondary}, 0.2)
                Tween(ButtonFingerprint, {Size = UDim2.new(0, 16, 0, 16)}, 0.2)
            end)
            
            return ButtonContainer
        end
        
        -- AddToggle Function với logo vân tay
        function TabFunctions:AddToggle(ToggleConfig)
            ToggleConfig = ToggleConfig or {}
            local ToggleName = ToggleConfig.Name or "Toggle"
            local Default = ToggleConfig.Default or false
            local Callback = ToggleConfig.Callback or function() end
            
            local ToggleState = Default
            
            local ToggleContainer = Create("Frame", {
                Name = ToggleName .. "Container",
                BackgroundColor3 = CurrentTheme.Secondary,
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -20, 0, 35),
                Parent = TabContent
            })
            
            local ToggleContainerUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = ToggleContainer
            })
            
            -- Toggle Label (Bên trái)
            local ToggleLabel = Create("TextLabel", {
                Name = ToggleName .. "Label",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 15, 0, 0),
                Size = UDim2.new(0.6, -15, 1, 0),
                Font = Enum.Font.Gotham,
                Text = ToggleName,
                TextColor3 = CurrentTheme.Text,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ToggleContainer
            })
            
            -- Fingerprint Logo (Bên phải)
            local ToggleFingerprint = Create("ImageLabel", {
                Name = ToggleName .. "Fingerprint",
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -30, 0.5, -8),
                Size = UDim2.new(0, 16, 0, 16),
                Image = "rbxassetid://3926305904",
                ImageColor3 = CurrentTheme.SubText,
                ImageRectOffset = Vector2.new(884, 284),
                ImageRectSize = Vector2.new(36, 36),
                Parent = ToggleContainer
            })
            
            -- Toggle Switch (Giữa)
            local ToggleButton = Create("TextButton", {
                Name = ToggleName .. "Button",
                BackgroundTransparency = 1,
                Position = UDim2.new(0.6, 0, 0, 0),
                Size = UDim2.new(0.3, 0, 1, 0),
                Text = "",
                AutoButtonColor = false,
                Parent = ToggleContainer
            })
            
            local ToggleBackground = Create("Frame", {
                Name = ToggleName .. "Background",
                BackgroundColor3 = Default and AccentColor or Color3.fromRGB(80, 80, 80),
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, -20, 0.5, -10),
                Size = UDim2.new(0, 40, 0, 20),
                Parent = ToggleButton
            })
            
            local ToggleBackgroundUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 10),
                Parent = ToggleBackground
            })
            
            local ToggleKnob = Create("Frame", {
                Name = ToggleName .. "Knob",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Position = UDim2.new(0, Default and 22 or 2, 0, 2),
                Size = UDim2.new(0, 16, 0, 16),
                Parent = ToggleBackground
            })
            
            local ToggleKnobUICorner = Create("UICorner", {
                CornerRadius = UDim.new(0, 8),
                Parent = ToggleKnob
            })
            
            local function UpdateToggle()
                Tween(ToggleBackground, {BackgroundColor3 = ToggleState and AccentColor or Color3.fromRGB(80, 80, 80)}, 0.2)
                Tween(ToggleKnob, {Position = UDim2.new(0, ToggleState and 22 or 2, 0, 2)}, 0.2)
                Tween(ToggleFingerprint, {ImageColor3 = ToggleState and AccentColor or CurrentTheme.SubText}, 0.2)
                Callback(ToggleState)
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                ToggleState = not ToggleState
                UpdateToggle()
            end)
            
            ToggleButton.MouseEnter:Connect(function()
                Tween(ToggleBackground, {BackgroundColor3 = ToggleState and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(100, 100, 100)}, 0.2)
                Tween(ToggleFingerprint, {Size = UDim2.new(0, 18, 0, 18)}, 0.2)
            end)
            
            ToggleButton.MouseLeave:Connect(function()
                Tween(ToggleBackground, {BackgroundColor3 = ToggleState and AccentColor or Color3.fromRGB(80, 80, 80)}, 0.2)
                Tween(ToggleFingerprint, {Size = UDim2.new(0, 16, 0, 16)}, 0.2)
            end)
            
            UpdateToggle()
            
            return {
                Set = function(self, state)
                    ToggleState = state
                    UpdateToggle()
                end,
                Get = function(self)
                    return ToggleState
                end
            }
        end

        -- Auto-select first tab
        if not CurrentTab then
            CurrentTab = TabContent
            TabContent.Visible = true
            Tween(TabButton, {BackgroundColor3 = AccentColor, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
        end
        
        return TabFunctions
    end
    
    return NazuXLibrary
end

return NazuX
