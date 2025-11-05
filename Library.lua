-- NazuX UI Library
-- By: Your Name Here

local NazuX = {}
NazuX.__index = NazuX

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Colors
local BACKGROUND_COLOR = Color3.fromRGB(20, 20, 20)
local ACCENT_COLOR = Color3.fromRGB(0, 120, 215)
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)
local HOVER_COLOR = Color3.fromRGB(40, 40, 40)
local TOGGLE_OFF_COLOR = Color3.fromRGB(60, 60, 60)

-- Tween info
local TWEEN_INFO = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

function NazuX.new(title, subtitle)
	local self = setmetatable({}, NazuX)
	
	self.Visible = true
	self.Minimized = false
	self.Fullscreen = false
	
	-- Create main screen GUI
	self.ScreenGui = Instance.new("ScreenGui")
	self.ScreenGui.Name = "NazuXUI"
	self.ScreenGui.ResetOnSpawn = false
	self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	-- Main container
	self.MainFrame = Instance.new("Frame")
	self.MainFrame.Name = "MainFrame"
	self.MainFrame.Size = UDim2.new(0, 600, 0, 400)
	self.MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
	self.MainFrame.BackgroundColor3 = BACKGROUND_COLOR
	self.MainFrame.BackgroundTransparency = 0.1
	self.MainFrame.BorderSizePixel = 0
	self.MainFrame.ClipsDescendants = true
	self.MainFrame.Parent = self.ScreenGui
	
	-- Corner radius
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = self.MainFrame
	
	-- Drop shadow
	local shadow = Instance.new("ImageLabel")
	shadow.Name = "Shadow"
	shadow.Size = UDim2.new(1, 24, 1, 24)
	shadow.Position = UDim2.new(0, -12, 0, -12)
	shadow.BackgroundTransparency = 1
	shadow.Image = "rbxassetid://1316045217"
	shadow.ImageColor3 = Color3.new(0, 0, 0)
	shadow.ImageTransparency = 0.8
	shadow.ScaleType = Enum.ScaleType.Slice
	shadow.SliceCenter = Rect.new(10, 10, 118, 118)
	shadow.Parent = self.MainFrame
	shadow.ZIndex = -1
	
	-- Title bar
	self.TitleBar = Instance.new("Frame")
	self.TitleBar.Name = "TitleBar"
	self.TitleBar.Size = UDim2.new(1, 0, 0, 32)
	self.TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	self.TitleBar.BackgroundTransparency = 0.1
	self.TitleBar.BorderSizePixel = 0
	self.TitleBar.Parent = self.MainFrame
	
	local titleBarCorner = Instance.new("UICorner")
	titleBarCorner.CornerRadius = UDim.new(0, 8)
	titleBarCorner.Parent = self.TitleBar
	
	-- Title and subtitle
	self.TitleLabel = Instance.new("TextLabel")
	self.TitleLabel.Name = "Title"
	self.TitleLabel.Size = UDim2.new(0, 200, 1, 0)
	self.TitleLabel.Position = UDim2.new(0, 10, 0, 0)
	self.TitleLabel.BackgroundTransparency = 1
	self.TitleLabel.Text = title or "NazuX UI"
	self.TitleLabel.TextColor3 = TEXT_COLOR
	self.TitleLabel.TextSize = 14
	self.TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	self.TitleLabel.Font = Enum.Font.GothamSemibold
	self.TitleLabel.Parent = self.TitleBar
	
	self.SubtitleLabel = Instance.new("TextLabel")
	self.SubtitleLabel.Name = "Subtitle"
	self.SubtitleLabel.Size = UDim2.new(0, 200, 1, 0)
	self.SubtitleLabel.Position = UDim2.new(0, 10, 0, 0)
	self.SubtitleLabel.BackgroundTransparency = 1
	self.SubtitleLabel.Text = subtitle or ""
	self.SubtitleLabel.TextColor3 = TEXT_COLOR
	self.SubtitleLabel.TextTransparency = 0.5
	self.SubtitleLabel.TextSize = 12
	self.SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	self.SubtitleLabel.Font = Enum.Font.Gotham
	self.SubtitleLabel.Parent = self.TitleBar
	
	-- Search bar
	self.SearchBar = Instance.new("TextBox")
	self.SearchBar.Name = "SearchBar"
	self.SearchBar.Size = UDim2.new(0, 200, 0, 24)
	self.SearchBar.Position = UDim2.new(0.5, -100, 0, 4)
	self.SearchBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	self.SearchBar.BackgroundTransparency = 0.1
	self.SearchBar.BorderSizePixel = 0
	self.SearchBar.Text = "Search..."
	self.SearchBar.PlaceholderText = "Search..."
	self.SearchBar.TextColor3 = TEXT_COLOR
	self.SearchBar.TextSize = 12
	self.SearchBar.Font = Enum.Font.Gotham
	self.SearchBar.Parent = self.TitleBar
	
	local searchCorner = Instance.new("UICorner")
	searchCorner.CornerRadius = UDim.new(0, 4)
	searchCorner.Parent = self.SearchBar
	
	local searchPadding = Instance.new("UIPadding")
	searchPadding.PaddingLeft = UDim.new(0, 8)
	searchPadding.PaddingRight = UDim.new(0, 8)
	searchPadding.Parent = self.SearchBar
	
	-- Control buttons
	self.MinimizeButton = self:CreateControlButton("Minimize", UDim2.new(1, -64, 0, 0))
	self.MaximizeButton = self:CreateControlButton("Maximize", UDim2.new(1, -40, 0, 0))
	self.CloseButton = self:CreateControlButton("Close", UDim2.new(1, -16, 0, 0))
	
	self.MinimizeButton.Parent = self.TitleBar
	self.MaximizeButton.Parent = self.TitleBar
	self.CloseButton.Parent = self.TitleBar
	
	-- Tab container
	self.TabContainer = Instance.new("Frame")
	self.TabContainer.Name = "TabContainer"
	self.TabContainer.Size = UDim2.new(0, 120, 1, -32)
	self.TabContainer.Position = UDim2.new(0, 0, 0, 32)
	self.TabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	self.TabContainer.BackgroundTransparency = 0.1
	self.TabContainer.BorderSizePixel = 0
	self.TabContainer.Parent = self.MainFrame
	
	-- Content container
	self.ContentContainer = Instance.new("Frame")
	self.ContentContainer.Name = "ContentContainer"
	self.ContentContainer.Size = UDim2.new(1, -120, 1, -32)
	self.ContentContainer.Position = UDim2.new(0, 120, 0, 32)
	self.ContentContainer.BackgroundTransparency = 1
	self.ContentContainer.BorderSizePixel = 0
	self.ContentContainer.Parent = self.MainFrame
	
	-- Scrolling frame for content
	self.ContentScrolling = Instance.new("ScrollingFrame")
	self.ContentScrolling.Name = "ContentScrolling"
	self.ContentScrolling.Size = UDim2.new(1, 0, 1, 0)
	self.ContentScrolling.BackgroundTransparency = 1
	self.ContentScrolling.BorderSizePixel = 0
	self.ContentScrolling.ScrollBarThickness = 3
	self.ContentScrolling.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
	self.ContentScrolling.Parent = self.ContentContainer
	
	local contentLayout = Instance.new("UIListLayout")
	contentLayout.Name = "ContentLayout"
	contentLayout.Padding = UDim.new(0, 5)
	contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
	contentLayout.Parent = self.ContentScrolling
	
	local contentPadding = Instance.new("UIPadding")
	contentPadding.Name = "ContentPadding"
	contentPadding.PaddingTop = UDim.new(0, 10)
	contentPadding.PaddingLeft = UDim.new(0, 10)
	contentPadding.PaddingRight = UDim.new(0, 10)
	contentPadding.Parent = self.ContentScrolling
	
	-- Tab list
	self.Tabs = {}
	self.CurrentTab = nil
	
	-- Input handling for minimize/show
	UserInputService.InputBegan:Connect(function(input, processed)
		if processed then return end
		
		if input.KeyCode == Enum.KeyCode.LeftControl then
			if self.Minimized then
				self:Show()
			else
				self:Hide()
			end
		end
	end)
	
	-- Make draggable
	self:Draggify(self.TitleBar)
	
	return self
end

function NazuX:CreateControlButton(type, position)
	local button = Instance.new("TextButton")
	button.Name = type .. "Button"
	button.Size = UDim2.new(0, 16, 0, 16)
	button.Position = position
	button.BackgroundColor3 = BACKGROUND_COLOR
	button.BackgroundTransparency = 0.1
	button.BorderSizePixel = 0
	button.Text = ""
	button.ZIndex = 2
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = button
	
	local icon = Instance.new("Frame")
	icon.Name = "Icon"
	icon.Size = UDim2.new(0, 6, 0, 6)
	icon.Position = UDim2.new(0.5, -3, 0.5, -3)
	icon.BackgroundColor3 = TEXT_COLOR
	icon.BorderSizePixel = 0
	icon.Parent = button
	
	local iconCorner = Instance.new("UICorner")
	iconCorner.CornerRadius = UDim.new(1, 0)
	iconCorner.Parent = icon
	
	-- Button effects
	button.MouseEnter:Connect(function()
		local tween = TweenService:Create(button, TWEEN_INFO, {BackgroundColor3 = HOVER_COLOR})
		tween:Play()
	end)
	
	button.MouseLeave:Connect(function()
		local tween = TweenService:Create(button, TWEEN_INFO, {BackgroundColor3 = BACKGROUND_COLOR})
		tween:Play()
	end)
	
	button.MouseButton1Down:Connect(function()
		local tween = TweenService:Create(button, TWEEN_INFO, {BackgroundColor3 = ACCENT_COLOR})
		tween:Play()
	end)
	
	button.MouseButton1Up:Connect(function()
		local tween = TweenService:Create(button, TWEEN_INFO, {BackgroundColor3 = HOVER_COLOR})
		tween:Play()
	end)
	
	-- Button functionality
	if type == "Minimize" then
		button.MouseButton1Click:Connect(function()
			self:Minimize()
		end)
	elseif type == "Maximize" then
		button.MouseButton1Click:Connect(function()
			self:ToggleFullscreen()
		end)
	elseif type == "Close" then
		button.MouseButton1Click:Connect(function()
			self:Close()
		end)
	end
	
	return button
end

function NazuX:Draggify(frame)
	local dragging = false
	local dragInput, dragStart, startPos
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = self.MainFrame.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			self.MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

function NazuX:AddTab(name)
	local tab = {}
	tab.Name = name
	tab.Buttons = {}
	
	-- Tab button
	tab.Button = Instance.new("TextButton")
	tab.Button.Name = name .. "Tab"
	tab.Button.Size = UDim2.new(1, -10, 0, 30)
	tab.Button.Position = UDim2.new(0, 5, 0, 5 + (#self.Tabs * 35))
	tab.Button.BackgroundColor3 = BACKGROUND_COLOR
	tab.Button.BackgroundTransparency = 0.1
	tab.Button.BorderSizePixel = 0
	tab.Button.Text = name
	tab.Button.TextColor3 = TEXT_COLOR
	tab.Button.TextSize = 12
	tab.Button.Font = Enum.Font.Gotham
	tab.Button.Parent = self.TabContainer
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 4)
	corner.Parent = tab.Button
	
	-- Tab content frame
	tab.Content = Instance.new("Frame")
	tab.Content.Name = name .. "Content"
	tab.Content.Size = UDim2.new(1, 0, 1, 0)
	tab.Content.BackgroundTransparency = 1
	tab.Content.BorderSizePixel = 0
	tab.Content.Visible = false
	tab.Content.Parent = self.ContentScrolling
	
	-- Button effects
	tab.Button.MouseEnter:Connect(function()
		if self.CurrentTab ~= tab then
			local tween = TweenService:Create(tab.Button, TWEEN_INFO, {BackgroundColor3 = HOVER_COLOR})
			tween:Play()
		end
	end)
	
	tab.Button.MouseLeave:Connect(function()
		if self.CurrentTab ~= tab then
			local tween = TweenService:Create(tab.Button, TWEEN_INFO, {BackgroundColor3 = BACKGROUND_COLOR})
			tween:Play()
		end
	end)
	
	tab.Button.MouseButton1Click:Connect(function()
		self:SwitchTab(tab)
	end)
	
	-- Select first tab by default
	if #self.Tabs == 0 then
		self:SwitchTab(tab)
	end
	
	table.insert(self.Tabs, tab)
	return tab
end

function NazuX:SwitchTab(tab)
	-- Deselect current tab
	if self.CurrentTab then
		local tween = TweenService:Create(self.CurrentTab.Button, TWEEN_INFO, {BackgroundColor3 = BACKGROUND_COLOR})
		tween:Play()
		self.CurrentTab.Content.Visible = false
	end
	
	-- Select new tab
	self.CurrentTab = tab
	local tween = TweenService:Create(tab.Button, TWEEN_INFO, {BackgroundColor3 = ACCENT_COLOR})
	tween:Play()
	tab.Content.Visible = true
end

function NazuX:CreateSection(tab, name)
	local section = {}
	
	section.Frame = Instance.new("Frame")
	section.Frame.Name = name .. "Section"
	section.Frame.Size = UDim2.new(1, 0, 0, 30)
	section.Frame.BackgroundTransparency = 1
	section.Frame.BorderSizePixel = 0
	section.Frame.LayoutOrder = #tab.Buttons + 1
	section.Frame.Parent = tab.Content
	
	section.Title = Instance.new("TextLabel")
	section.Title.Name = "Title"
	section.Title.Size = UDim2.new(1, 0, 0, 20)
	section.Title.BackgroundTransparency = 1
	section.Title.Text = name
	section.Title.TextColor3 = TEXT_COLOR
	section.Title.TextSize = 14
	section.Title.TextXAlignment = Enum.TextXAlignment.Center
	section.Title.Font = Enum.Font.GothamSemibold
	section.Title.Parent = section.Frame
	
	section.Container = Instance.new("Frame")
	section.Container.Name = "Container"
	section.Container.Size = UDim2.new(1, 0, 0, 0)
	section.Container.Position = UDim2.new(0, 0, 0, 25)
	section.Container.BackgroundTransparency = 1
	section.Container.BorderSizePixel = 0
	section.Container.Parent = section.Frame
	
	local layout = Instance.new("UIListLayout")
	layout.Name = "Layout"
	layout.Padding = UDim.new(0, 5)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = section.Container
	
	table.insert(tab.Buttons, section)
	return section
end

function NazuX:CreateToggle(section, name, defaultValue, callback)
	local toggle = {}
	toggle.Value = defaultValue or false
	
	toggle.Frame = Instance.new("Frame")
	toggle.Frame.Name = name .. "Toggle"
	toggle.Frame.Size = UDim2.new(1, 0, 0, 30)
	toggle.Frame.BackgroundTransparency = 1
	toggle.Frame.BorderSizePixel = 0
	toggle.Frame.LayoutOrder = #section.Container:GetChildren()
	toggle.Frame.Parent = section.Container
	
	toggle.Title = Instance.new("TextLabel")
	toggle.Title.Name = "Title"
	toggle.Title.Size = UDim2.new(0.7, 0, 1, 0)
	toggle.Title.BackgroundTransparency = 1
	toggle.Title.Text = name
	toggle.Title.TextColor3 = TEXT_COLOR
	toggle.Title.TextSize = 12
	toggle.Title.TextXAlignment = Enum.TextXAlignment.Left
	toggle.Title.Font = Enum.Font.Gotham
	toggle.Title.Parent = toggle.Frame
	
	toggle.Button = Instance.new("TextButton")
	toggle.Button.Name = "ToggleButton"
	toggle.Button.Size = UDim2.new(0, 40, 0, 20)
	toggle.Button.Position = UDim2.new(1, -40, 0.5, -10)
	toggle.Button.BackgroundColor3 = TOGGLE_OFF_COLOR
	toggle.Button.BorderSizePixel = 0
	toggle.Button.Text = ""
	toggle.Button.Parent = toggle.Frame
	
	local buttonCorner = Instance.new("UICorner")
	buttonCorner.CornerRadius = UDim.new(1, 0)
	buttonCorner.Parent = toggle.Button
	
	toggle.Thumb = Instance.new("Frame")
	toggle.Thumb.Name = "Thumb"
	toggle.Thumb.Size = UDim2.new(0, 16, 0, 16)
	toggle.Thumb.Position = UDim2.new(0, 2, 0, 2)
	toggle.Thumb.BackgroundColor3 = TEXT_COLOR
	toggle.Thumb.BorderSizePixel = 0
	toggle.Thumb.Parent = toggle.Button
	
	local thumbCorner = Instance.new("UICorner")
	thumbCorner.CornerRadius = UDim.new(1, 0)
	thumbCorner.Parent = toggle.Thumb
	
	-- Set initial state
	self:UpdateToggle(toggle)
	
	-- Button functionality
	toggle.Button.MouseButton1Click:Connect(function()
		toggle.Value = not toggle.Value
		self:UpdateToggle(toggle)
		if callback then
			callback(toggle.Value)
		end
	end)
	
	-- Button effects
	toggle.Button.MouseEnter:Connect(function()
		local tween = TweenService:Create(toggle.Button, TWEEN_INFO, {BackgroundColor3 = HOVER_COLOR})
		tween:Play()
	end)
	
	toggle.Button.MouseLeave:Connect(function()
		local color = toggle.Value and ACCENT_COLOR or TOGGLE_OFF_COLOR
		local tween = TweenService:Create(toggle.Button, TWEEN_INFO, {BackgroundColor3 = color})
		tween:Play()
	end)
	
	return toggle
end

function NazuX:UpdateToggle(toggle)
	if toggle.Value then
		local tween1 = TweenService:Create(toggle.Button, TWEEN_INFO, {BackgroundColor3 = ACCENT_COLOR})
		local tween2 = TweenService:Create(toggle.Thumb, TWEEN_INFO, {Position = UDim2.new(1, -18, 0, 2)})
		tween1:Play()
		tween2:Play()
	else
		local tween1 = TweenService:Create(toggle.Button, TWEEN_INFO, {BackgroundColor3 = TOGGLE_OFF_COLOR})
		local tween2 = TweenService:Create(toggle.Thumb, TWEEN_INFO, {Position = UDim2.new(0, 2, 0, 2)})
		tween1:Play()
		tween2:Play()
	end
end

function NazuX:CreateButton(section, name, callback)
	local button = {}
	
	button.Frame = Instance.new("TextButton")
	button.Frame.Name = name .. "Button"
	button.Frame.Size = UDim2.new(1, 0, 0, 30)
	button.Frame.BackgroundColor3 = BACKGROUND_COLOR
	button.Frame.BackgroundTransparency = 0.1
	button.Frame.BorderSizePixel = 0
	button.Frame.Text = ""
	button.Frame.LayoutOrder = #section.Container:GetChildren()
	button.Frame.Parent = section.Container
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 4)
	corner.Parent = button.Frame
	
	button.Title = Instance.new("TextLabel")
	button.Title.Name = "Title"
	button.Title.Size = UDim2.new(0.8, 0, 1, 0)
	button.Title.Position = UDim2.new(0, 10, 0, 0)
	button.Title.BackgroundTransparency = 1
	button.Title.Text = name
	button.Title.TextColor3 = TEXT_COLOR
	button.Title.TextSize = 12
	button.Title.TextXAlignment = Enum.TextXAlignment.Left
	button.Title.Font = Enum.Font.Gotham
	button.Title.Parent = button.Frame
	
	-- Fingerprint icon
	button.Icon = Instance.new("ImageLabel")
	button.Icon.Name = "Icon"
	button.Icon.Size = UDim2.new(0, 16, 0, 16)
	button.Icon.Position = UDim2.new(1, -26, 0.5, -8)
	button.Icon.BackgroundTransparency = 1
	button.Icon.Image = "rbxassetid://1111111111" -- Replace with actual fingerprint icon asset ID
	button.Icon.ImageColor3 = TEXT_COLOR
	button.Icon.Parent = button.Frame
	
	-- Button functionality
	button.Frame.MouseButton1Click:Connect(function()
		if callback then
			callback()
		end
	end)
	
	-- Button effects
	button.Frame.MouseEnter:Connect(function()
		local tween = TweenService:Create(button.Frame, TWEEN_INFO, {BackgroundColor3 = HOVER_COLOR})
		tween:Play()
	end)
	
	button.Frame.MouseLeave:Connect(function()
		local tween = TweenService:Create(button.Frame, TWEEN_INFO, {BackgroundColor3 = BACKGROUND_COLOR})
		tween:Play()
	end)
	
	button.Frame.MouseButton1Down:Connect(function()
		local tween = TweenService:Create(button.Frame, TWEEN_INFO, {BackgroundColor3 = ACCENT_COLOR})
		tween:Play()
	end)
	
	button.Frame.MouseButton1Up:Connect(function()
		local tween = TweenService:Create(button.Frame, TWEEN_INFO, {BackgroundColor3 = HOVER_COLOR})
		tween:Play()
	end)
	
	return button
end

function NazuX:CreateSlider(section, name, minValue, maxValue, defaultValue, callback)
	local slider = {}
	slider.Value = defaultValue or minValue
	slider.Min = minValue or 0
	slider.Max = maxValue or 100
	
	slider.Frame = Instance.new("Frame")
	slider.Frame.Name = name .. "Slider"
	slider.Frame.Size = UDim2.new(1, 0, 0, 40)
	slider.Frame.BackgroundTransparency = 1
	slider.Frame.BorderSizePixel = 0
	slider.Frame.LayoutOrder = #section.Container:GetChildren()
	slider.Frame.Parent = section.Container
	
	slider.Title = Instance.new("TextLabel")
	slider.Title.Name = "Title"
	slider.Title.Size = UDim2.new(1, 0, 0, 20)
	slider.Title.BackgroundTransparency = 1
	slider.Title.Text = name .. ": " .. slider.Value
	slider.Title.TextColor3 = TEXT_COLOR
	slider.Title.TextSize = 12
	slider.Title.TextXAlignment = Enum.TextXAlignment.Left
	slider.Title.Font = Enum.Font.Gotham
	slider.Title.Parent = slider.Frame
	
	slider.Track = Instance.new("Frame")
	slider.Track.Name = "Track"
	slider.Track.Size = UDim2.new(1, 0, 0, 4)
	slider.Track.Position = UDim2.new(0, 0, 1, -10)
	slider.Track.BackgroundColor3 = TOGGLE_OFF_COLOR
	slider.Track.BorderSizePixel = 0
	slider.Track.Parent = slider.Frame
	
	local trackCorner = Instance.new("UICorner")
	trackCorner.CornerRadius = UDim.new(1, 0)
	trackCorner.Parent = slider.Track
	
	slider.Progress = Instance.new("Frame")
	slider.Progress.Name = "Progress"
	slider.Progress.Size = UDim2.new((slider.Value - slider.Min) / (slider.Max - slider.Min), 0, 1, 0)
	slider.Progress.BackgroundColor3 = ACCENT_COLOR
	slider.Progress.BorderSizePixel = 0
	slider.Progress.Parent = slider.Track
	
	local progressCorner = Instance.new("UICorner")
	progressCorner.CornerRadius = UDim.new(1, 0)
	progressCorner.Parent = slider.Progress
	
	slider.Thumb = Instance.new("TextButton")
	slider.Thumb.Name = "Thumb"
	slider.Thumb.Size = UDim2.new(0, 16, 0, 16)
	slider.Thumb.Position = UDim2.new(slider.Progress.Size.X.Scale, -8, 0.5, -8)
	slider.Thumb.BackgroundColor3 = TEXT_COLOR
	slider.Thumb.BorderSizePixel = 0
	slider.Thumb.Text = ""
	slider.Thumb.Parent = slider.Track
	
	local thumbCorner = Instance.new("UICorner")
	thumbCorner.CornerRadius = UDim.new(1, 0)
	thumbCorner.Parent = slider.Thumb
	
	-- Slider functionality
	local dragging = false
	
	slider.Thumb.MouseButton1Down:Connect(function()
		dragging = true
	end)
	
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
	
	slider.Thumb.MouseButton1Click:Connect(function()
		dragging = true
	end)
	
	slider.Track.MouseButton1Click:Connect(function(input)
		local relativeX = input.Position.X - slider.Track.AbsolutePosition.X
		local percentage = math.clamp(relativeX / slider.Track.AbsoluteSize.X, 0, 1)
		slider.Value = math.floor(slider.Min + (slider.Max - slider.Min) * percentage)
		slider.Title.Text = name .. ": " .. slider.Value
		slider.Progress.Size = UDim2.new(percentage, 0, 1, 0)
		slider.Thumb.Position = UDim2.new(percentage, -8, 0.5, -8)
		
		if callback then
			callback(slider.Value)
		end
	end)
	
	RunService.Heartbeat:Connect(function()
		if dragging then
			local mouse = UserInputService:GetMouseLocation()
			local relativeX = mouse.X - slider.Track.AbsolutePosition.X
			local percentage = math.clamp(relativeX / slider.Track.AbsoluteSize.X, 0, 1)
			slider.Value = math.floor(slider.Min + (slider.Max - slider.Min) * percentage)
			slider.Title.Text = name .. ": " .. slider.Value
			slider.Progress.Size = UDim2.new(percentage, 0, 1, 0)
			slider.Thumb.Position = UDim2.new(percentage, -8, 0.5, -8)
			
			if callback then
				callback(slider.Value)
			end
		end
	end)
	
	return slider
end

function NazuX:CreateDropdown(section, name, options, defaultValue, callback)
	local dropdown = {}
	dropdown.Value = defaultValue or options[1]
	dropdown.Open = false
	dropdown.Options = options
	
	dropdown.Frame = Instance.new("Frame")
	dropdown.Frame.Name = name .. "Dropdown"
	dropdown.Frame.Size = UDim2.new(1, 0, 0, 30)
	dropdown.Frame.BackgroundTransparency = 1
	dropdown.Frame.BorderSizePixel = 0
	dropdown.Frame.LayoutOrder = #section.Container:GetChildren()
	dropdown.Frame.Parent = section.Container
	
	dropdown.Title = Instance.new("TextLabel")
	dropdown.Title.Name = "Title"
	dropdown.Title.Size = UDim2.new(0.5, 0, 1, 0)
	dropdown.Title.BackgroundTransparency = 1
	dropdown.Title.Text = name
	dropdown.Title.TextColor3 = TEXT_COLOR
	dropdown.Title.TextSize = 12
	dropdown.Title.TextXAlignment = Enum.TextXAlignment.Left
	dropdown.Title.Font = Enum.Font.Gotham
	dropdown.Title.Parent = dropdown.Frame
	
	dropdown.Button = Instance.new("TextButton")
	dropdown.Button.Name = "DropdownButton"
	dropdown.Button.Size = UDim2.new(0.45, 0, 1, 0)
	dropdown.Button.Position = UDim2.new(0.55, 0, 0, 0)
	dropdown.Button.BackgroundColor3 = BACKGROUND_COLOR
	dropdown.Button.BackgroundTransparency = 0.1
	dropdown.Button.BorderSizePixel = 0
	dropdown.Button.Text = dropdown.Value
	dropdown.Button.TextColor3 = TEXT_COLOR
	dropdown.Button.TextSize = 12
	dropdown.Button.Font = Enum.Font.Gotham
	dropdown.Button.Parent = dropdown.Frame
	
	local buttonCorner = Instance.new("UICorner")
	buttonCorner.CornerRadius = UDim.new(0, 4)
	buttonCorner.Parent = dropdown.Button
	
	dropdown.OptionsFrame = Instance.new("Frame")
	dropdown.OptionsFrame.Name = "OptionsFrame"
	dropdown.OptionsFrame.Size = UDim2.new(0.45, 0, 0, 0)
	dropdown.OptionsFrame.Position = UDim2.new(0.55, 0, 1, 5)
	dropdown.OptionsFrame.BackgroundColor3 = BACKGROUND_COLOR
	dropdown.OptionsFrame.BackgroundTransparency = 0.1
	dropdown.OptionsFrame.BorderSizePixel = 0
	dropdown.OptionsFrame.ClipsDescendants = true
	dropdown.OptionsFrame.Visible = false
	dropdown.OptionsFrame.Parent = dropdown.Frame
	
	local optionsCorner = Instance.new("UICorner")
	optionsCorner.CornerRadius = UDim.new(0, 4)
	optionsCorner.Parent = dropdown.OptionsFrame
	
	local optionsLayout = Instance.new("UIListLayout")
	optionsLayout.Name = "OptionsLayout"
	optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
	optionsLayout.Parent = dropdown.OptionsFrame
	
	-- Create option buttons
	for i, option in ipairs(options) do
		local optionButton = Instance.new("TextButton")
		optionButton.Name = option .. "Option"
		optionButton.Size = UDim2.new(1, 0, 0, 25)
		optionButton.BackgroundColor3 = BACKGROUND_COLOR
		optionButton.BackgroundTransparency = 0.1
		optionButton.BorderSizePixel = 0
		optionButton.Text = option
		optionButton.TextColor3 = TEXT_COLOR
		optionButton.TextSize = 12
		optionButton.Font = Enum.Font.Gotham
		optionButton.Parent = dropdown.OptionsFrame
		
		optionButton.MouseButton1Click:Connect(function()
			dropdown.Value = option
			dropdown.Button.Text = option
			dropdown.Open = false
			dropdown.OptionsFrame.Visible = false
			
			if callback then
				callback(option)
			end
		end)
		
		-- Button effects
		optionButton.MouseEnter:Connect(function()
			local tween = TweenService:Create(optionButton, TWEEN_INFO, {BackgroundColor3 = HOVER_COLOR})
			tween:Play()
		end)
		
		optionButton.MouseLeave:Connect(function()
			local tween = TweenService:Create(optionButton, TWEEN_INFO, {BackgroundColor3 = BACKGROUND_COLOR})
			tween:Play()
		end)
	end
	
	-- Dropdown functionality
	dropdown.Button.MouseButton1Click:Connect(function()
		dropdown.Open = not dropdown.Open
		if dropdown.Open then
			dropdown.OptionsFrame.Visible = true
			local tween = TweenService:Create(dropdown.OptionsFrame, TWEEN_INFO, {Size = UDim2.new(0.45, 0, 0, #options * 25)})
			tween:Play()
		else
			local tween = TweenService:Create(dropdown.OptionsFrame, TWEEN_INFO, {Size = UDim2.new(0.45, 0, 0, 0)})
			tween:Play()
			tween.Completed:Connect(function()
				dropdown.OptionsFrame.Visible = false
			end)
		end
	end)
	
	-- Button effects
	dropdown.Button.MouseEnter:Connect(function()
		local tween = TweenService:Create(dropdown.Button, TWEEN_INFO, {BackgroundColor3 = HOVER_COLOR})
		tween:Play()
	end)
	
	dropdown.Button.MouseLeave:Connect(function()
		local tween = TweenService:Create(dropdown.Button, TWEEN_INFO, {BackgroundColor3 = BACKGROUND_COLOR})
		tween:Play()
	end)
	
	return dropdown
end

-- UI Control Methods
function NazuX:Show()
	self.ScreenGui.Enabled = true
	self.Minimized = false
	local tween = TweenService:Create(self.MainFrame, TWEEN_INFO, {Size = UDim2.new(0, 600, 0, 400)})
	tween:Play()
end

function NazuX:Hide()
	self.Minimized = true
	local tween = TweenService:Create(self.MainFrame, TWEEN_INFO, {Size = UDim2.new(0, 0, 0, 0)})
	tween:Play()
	tween.Completed:Connect(function()
		self.ScreenGui.Enabled = false
	end)
end

function NazuX:Minimize()
	self:Hide()
end

function NazuX:ToggleFullscreen()
	self.Fullscreen = not self.Fullscreen
	if self.Fullscreen then
		self.MainFrame.Size = UDim2.new(1, 0, 1, 0)
		self.MainFrame.Position = UDim2.new(0, 0, 0, 0)
	else
		self.MainFrame.Size = UDim2.new(0, 600, 0, 400)
		self.MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
	end
end

function NazuX:Close()
	self.ScreenGui:Destroy()
end

function NazuX:Enable()
	self.ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end

function NazuX:Disable()
	self.ScreenGui.Parent = nil
end

return NazuX
