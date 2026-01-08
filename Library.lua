-- ts file was generated at discord.gg/25ms


game:GetService('Lighting')

local vu1 = game:GetService('RunService')
local v2 = game:GetService('Players').LocalPlayer
local vu3 = game:GetService('UserInputService')
local vu4 = game:GetService('TweenService')
local vu5 = game:GetService('TextService')
local vu6 = game:GetService('Workspace').CurrentCamera
local vu7 = v2:GetMouse()
local vu8 = game:GetService('HttpService')
local vu9 = vu1.RenderStepped
local v11 = protectgui or syn and syn.protect_gui or (gethui and function(p10)
    p10.Parent = gethui()
end or function()
end)
local vu12 = {
    Names = {
        'Amethyst Maru',
        'Crimson Dark',
        'Ember',
        'Neon Crimson',
        'Neon Orange',
        'Dark Typewriter',
        'VSC Dark High Contrast',
        'Dark',
        'Darker',
        'Light',
        'Aqua',
        'Amethyst',
        'Amethyst Dark',
        'Rose',
        'Sakura',
    },
    ['VSC Dark High Contrast'] = {
        Accent = Color3.fromHex('#569cd6'),
        AcrylicMain = Color3.fromHex('#000000'),
        AcrylicBorder = Color3.fromHex('#FFFFFF'),
        AcrylicGradient = ColorSequence.new(Color3.fromHex('#000000'), Color3.fromHex('#000000')),
        AcrylicNoise = 1,
        TitleBarLine = Color3.fromHex('#FFFFFF'),
        Tab = Color3.fromHex('#FFFFFF'),
        Element = Color3.fromHex('#000000'),
        ElementBorder = Color3.fromHex('#FFFFFF'),
        InElementBorder = Color3.fromHex('#569cd6'),
        ElementTransparency = 0,
        ToggleSlider = Color3.fromHex('#569cd6'),
        ToggleToggled = Color3.fromHex('#000000'),
        SliderRail = Color3.fromHex('#569cd6'),
        DropdownFrame = Color3.fromHex('#000000'),
        DropdownHolder = Color3.fromHex('#000000'),
        DropdownBorder = Color3.fromHex('#FFFFFF'),
        DropdownOption = Color3.fromHex('#FFFFFF'),
        Keybind = Color3.fromHex('#000000'),
        Input = Color3.fromHex('#000000'),
        InputFocused = Color3.fromHex('#000000'),
        InputIndicator = Color3.fromHex('#7c7c7c'),
        Dialog = Color3.fromHex('#000000'),
        DialogHolder = Color3.fromHex('#000000'),
        DialogHolderLine = Color3.fromHex('#FFFFFF'),
        DialogButton = Color3.fromHex('#000000'),
        DialogButtonBorder = Color3.fromHex('#FFFFFF'),
        DialogBorder = Color3.fromHex('#FFFFFF'),
        DialogInput = Color3.fromHex('#000000'),
        DialogInputLine = Color3.fromHex('#569cd6'),
        Text = Color3.fromHex('#FFFFFF'),
        SubText = Color3.fromHex('#9D9D9D'),
        Hover = Color3.fromHex('#383a49'),
        HoverChange = 0.1,
    },
    ['Dark Typewriter'] = {
        Accent = Color3.fromRGB(109, 180, 120),
        AcrylicMain = Color3.fromRGB(38, 38, 38),
        AcrylicBorder = Color3.fromRGB(85, 85, 85),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(38, 38, 38), Color3.fromRGB(38, 38, 38)),
        AcrylicNoise = 1,
        TitleBarLine = Color3.fromRGB(189, 189, 189),
        Tab = Color3.fromRGB(109, 180, 120),
        Element = Color3.fromRGB(42, 42, 42),
        ElementBorder = Color3.fromRGB(51, 51, 51),
        InElementBorder = Color3.fromRGB(51, 51, 51),
        ElementTransparency = 0,
        ToggleSlider = Color3.fromRGB(103, 169, 113),
        ToggleToggled = Color3.fromRGB(255, 255, 255),
        SliderRail = Color3.fromRGB(51, 51, 51),
        DropdownFrame = Color3.fromRGB(68, 68, 68),
        DropdownHolder = Color3.fromRGB(68, 68, 68),
        DropdownBorder = Color3.fromRGB(38, 38, 38),
        DropdownOption = Color3.fromRGB(153, 200, 255),
        Keybind = Color3.fromRGB(54, 54, 54),
        Input = Color3.fromRGB(27, 27, 27),
        InputFocused = Color3.fromRGB(51, 51, 51),
        InputIndicator = Color3.fromRGB(197, 184, 161),
        Dialog = Color3.fromRGB(38, 38, 38),
        DialogHolder = Color3.fromRGB(58, 52, 46),
        DialogHolderLine = Color3.fromRGB(40, 40, 40),
        DialogButton = Color3.fromRGB(42, 42, 42),
        DialogButtonBorder = Color3.fromRGB(51, 51, 51),
        DialogBorder = Color3.fromRGB(189, 189, 189),
        DialogInput = Color3.fromRGB(27, 27, 27),
        DialogInputLine = Color3.fromRGB(197, 184, 161),
        Text = Color3.fromRGB(197, 184, 161),
        SubText = Color3.fromRGB(158, 158, 158),
        Hover = Color3.fromRGB(149, 149, 149),
        HoverChange = 0.04,
    },
    ['Amethyst Maru'] = {
        Name = 'Amethyst Maru',
        Accent = Color3.fromHex('#1e6dbf'),
        AcrylicMain = Color3.fromHex('#001a33'),
        AcrylicBorder = Color3.fromHex('#004080'),
        AcrylicGradient = ColorSequence.new(Color3.fromHex('#001a33'), Color3.fromHex('#001a33')),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromHex('#004080'),
        Tab = Color3.fromHex('#a1c4e6'),
        Element = Color3.fromHex('#00264d'),
        ElementBorder = Color3.fromHex('#004080'),
        InElementBorder = Color3.fromHex('#1e6dbf'),
        ElementTransparency = 0.85,
        ToggleSlider = Color3.fromHex('#0055a3'),
        ToggleToggled = Color3.fromHex('#001a33'),
        SliderRail = Color3.fromHex('#0055a3'),
        DropdownFrame = Color3.fromHex('#00264d'),
        DropdownHolder = Color3.fromHex('#00264d'),
        DropdownBorder = Color3.fromHex('#004080'),
        DropdownOption = Color3.fromHex('#a1c4e6'),
        Keybind = Color3.fromHex('#00264d'),
        Input = Color3.fromHex('#001933'),
        InputFocused = Color3.fromHex('#001933'),
        InputIndicator = Color3.fromHex('#7fa1bf'),
        Dialog = Color3.fromHex('#00264d'),
        DialogHolder = Color3.fromHex('#001a33'),
        DialogHolderLine = Color3.fromHex('#004080'),
        DialogButton = Color3.fromHex('#00264d'),
        DialogButtonBorder = Color3.fromHex('#004080'),
        DialogBorder = Color3.fromHex('#004080'),
        DialogInput = Color3.fromHex('#001933'),
        DialogInputLine = Color3.fromHex('#1e6dbf'),
        Text = Color3.fromHex('#a1c4e6'),
        SubText = Color3.fromHex('#7fa1bf'),
        Hover = Color3.fromHex('#004080'),
        HoverChange = 0.1,
    },
    ['Amethyst Dark'] = {
        Name = 'Amethyst Dark',
        Accent = Color3.fromHex('#b133ff'),
        AcrylicMain = Color3.fromHex('#120024'),
        AcrylicBorder = Color3.fromHex('#4d057b'),
        AcrylicGradient = ColorSequence.new(Color3.fromHex('#120024'), Color3.fromHex('#120024')),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromHex('#4d057b'),
        Tab = Color3.fromHex('#e9d9f2'),
        Element = Color3.fromHex('#25013c'),
        ElementBorder = Color3.fromHex('#4d057b'),
        InElementBorder = Color3.fromHex('#b133ff'),
        ElementTransparency = 0.85,
        ToggleSlider = Color3.fromHex('#7d16bf'),
        ToggleToggled = Color3.fromHex('#120024'),
        SliderRail = Color3.fromHex('#7d16bf'),
        DropdownFrame = Color3.fromHex('#25013c'),
        DropdownHolder = Color3.fromHex('#25013c'),
        DropdownBorder = Color3.fromHex('#4d057b'),
        DropdownOption = Color3.fromHex('#e9d9f2'),
        Keybind = Color3.fromHex('#25013c'),
        Input = Color3.fromHex('#180030'),
        InputFocused = Color3.fromHex('#180030'),
        InputIndicator = Color3.fromHex('#9e85ad'),
        Dialog = Color3.fromHex('#25013c'),
        DialogHolder = Color3.fromHex('#120024'),
        DialogHolderLine = Color3.fromHex('#4d057b'),
        DialogButton = Color3.fromHex('#25013c'),
        DialogButtonBorder = Color3.fromHex('#4d057b'),
        DialogBorder = Color3.fromHex('#4d057b'),
        DialogInput = Color3.fromHex('#180030'),
        DialogInputLine = Color3.fromHex('#b133ff'),
        Text = Color3.fromHex('#e9d9f2'),
        SubText = Color3.fromHex('#9e85ad'),
        Hover = Color3.fromHex('#4d057b'),
        HoverChange = 0.1,
    },
    ['Crimson Dark'] = {
        Name = 'Crimson Dark',
        Accent = Color3.fromHex('#ff3333'),
        AcrylicMain = Color3.fromHex('#240000'),
        AcrylicBorder = Color3.fromHex('#7b0505'),
        AcrylicGradient = ColorSequence.new(Color3.fromHex('#240000'), Color3.fromHex('#240000')),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromHex('#7b0505'),
        Tab = Color3.fromHex('#f2d9d9'),
        Element = Color3.fromHex('#3c0101'),
        ElementBorder = Color3.fromHex('#7b0505'),
        InElementBorder = Color3.fromHex('#ff3333'),
        ElementTransparency = 0.85,
        ToggleSlider = Color3.fromHex('#bf1616'),
        ToggleToggled = Color3.fromHex('#240000'),
        SliderRail = Color3.fromHex('#bf1616'),
        DropdownFrame = Color3.fromHex('#3c0101'),
        DropdownHolder = Color3.fromHex('#3c0101'),
        DropdownBorder = Color3.fromHex('#7b0505'),
        DropdownOption = Color3.fromHex('#f2d9d9'),
        Keybind = Color3.fromHex('#3c0101'),
        Input = Color3.fromHex('#300000'),
        InputFocused = Color3.fromHex('#300000'),
        InputIndicator = Color3.fromHex('#ad8585'),
        Dialog = Color3.fromHex('#3c0101'),
        DialogHolder = Color3.fromHex('#240000'),
        DialogHolderLine = Color3.fromHex('#7b0505'),
        DialogButton = Color3.fromHex('#3c0101'),
        DialogButtonBorder = Color3.fromHex('#7b0505'),
        DialogBorder = Color3.fromHex('#7b0505'),
        DialogInput = Color3.fromHex('#300000'),
        DialogInputLine = Color3.fromHex('#ff3333'),
        Text = Color3.fromHex('#f2d9d9'),
        SubText = Color3.fromHex('#ad8585'),
        Hover = Color3.fromHex('#7b0505'),
        HoverChange = 0.1,
    },
    ['Neon Crimson'] = {
        Name = 'Neon Crimson',
        Accent = Color3.fromHex('#ff0055'),
        AcrylicMain = Color3.fromHex('#0a0005'),
        AcrylicBorder = Color3.fromHex('#910027'),
        AcrylicGradient = ColorSequence.new(Color3.fromHex('#0a0005'), Color3.fromHex('#0a0005')),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromHex('#910027'),
        Tab = Color3.fromHex('#ffccd9'),
        Element = Color3.fromHex('#220007'),
        ElementBorder = Color3.fromHex('#910027'),
        InElementBorder = Color3.fromHex('#ff0055'),
        ElementTransparency = 0.85,
        ToggleSlider = Color3.fromHex('#d40040'),
        ToggleToggled = Color3.fromHex('#0a0005'),
        SliderRail = Color3.fromHex('#d40040'),
        DropdownFrame = Color3.fromHex('#220007'),
        DropdownHolder = Color3.fromHex('#220007'),
        DropdownBorder = Color3.fromHex('#910027'),
        DropdownOption = Color3.fromHex('#ffccd9'),
        Keybind = Color3.fromHex('#220007'),
        Input = Color3.fromHex('#140005'),
        InputFocused = Color3.fromHex('#140005'),
        InputIndicator = Color3.fromHex('#ff8099'),
        Dialog = Color3.fromHex('#220007'),
        DialogHolder = Color3.fromHex('#0a0005'),
        DialogHolderLine = Color3.fromHex('#910027'),
        DialogButton = Color3.fromHex('#220007'),
        DialogButtonBorder = Color3.fromHex('#910027'),
        DialogBorder = Color3.fromHex('#910027'),
        DialogInput = Color3.fromHex('#140005'),
        DialogInputLine = Color3.fromHex('#ff0055'),
        Text = Color3.fromHex('#ffccd9'),
        SubText = Color3.fromHex('#ff8099'),
        Hover = Color3.fromHex('#910027'),
        HoverChange = 0.1,
    },
    ['Neon Orange'] = {
        Name = 'Neon Orange',
        Accent = Color3.fromHex('#ff6a00'),
        AcrylicMain = Color3.fromHex('#0a0500'),
        AcrylicBorder = Color3.fromHex('#913200'),
        AcrylicGradient = ColorSequence.new(Color3.fromHex('#0a0500'), Color3.fromHex('#0a0500')),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromHex('#913200'),
        Tab = Color3.fromHex('#ffd9cc'),
        Element = Color3.fromHex('#220e00'),
        ElementBorder = Color3.fromHex('#913200'),
        InElementBorder = Color3.fromHex('#ff6a00'),
        ElementTransparency = 0.85,
        ToggleSlider = Color3.fromHex('#d45500'),
        ToggleToggled = Color3.fromHex('#0a0500'),
        SliderRail = Color3.fromHex('#d45500'),
        DropdownFrame = Color3.fromHex('#220e00'),
        DropdownHolder = Color3.fromHex('#220e00'),
        DropdownBorder = Color3.fromHex('#913200'),
        DropdownOption = Color3.fromHex('#ffd9cc'),
        Keybind = Color3.fromHex('#220e00'),
        Input = Color3.fromHex('#140800'),
        InputFocused = Color3.fromHex('#140800'),
        InputIndicator = Color3.fromHex('#ffa280'),
        Dialog = Color3.fromHex('#220e00'),
        DialogHolder = Color3.fromHex('#0a0500'),
        DialogHolderLine = Color3.fromHex('#913200'),
        DialogButton = Color3.fromHex('#220e00'),
        DialogButtonBorder = Color3.fromHex('#913200'),
        DialogBorder = Color3.fromHex('#913200'),
        DialogInput = Color3.fromHex('#140800'),
        DialogInputLine = Color3.fromHex('#ff6a00'),
        Text = Color3.fromHex('#ffd9cc'),
        SubText = Color3.fromHex('#ffa280'),
        Hover = Color3.fromHex('#913200'),
        HoverChange = 0.1,
    },
    Ember = {
        Name = 'Ember',
        Accent = Color3.fromRGB(217, 87, 0),
        AcrylicMain = Color3.fromRGB(20, 20, 20),
        AcrylicBorder = Color3.fromRGB(130, 100, 70),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(180, 100, 40), Color3.fromRGB(90, 40, 15)),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromRGB(120, 90, 60),
        Tab = Color3.fromRGB(180, 150, 120),
        Element = Color3.fromRGB(160, 130, 100),
        ElementBorder = Color3.fromRGB(80, 60, 40),
        InElementBorder = Color3.fromRGB(120, 100, 80),
        ElementTransparency = 0.87,
        ToggleSlider = Color3.fromRGB(160, 130, 100),
        ToggleToggled = Color3.fromRGB(0, 0, 0),
        SliderRail = Color3.fromRGB(160, 130, 100),
        DropdownFrame = Color3.fromRGB(200, 170, 140),
        DropdownHolder = Color3.fromRGB(90, 60, 30),
        DropdownBorder = Color3.fromRGB(75, 50, 25),
        DropdownOption = Color3.fromRGB(160, 130, 100),
        Keybind = Color3.fromRGB(160, 130, 100),
        Input = Color3.fromRGB(160, 130, 100),
        InputFocused = Color3.fromRGB(35, 20, 10),
        InputIndicator = Color3.fromRGB(190, 160, 130),
        InputIndicatorFocus = Color3.fromRGB(217, 87, 0),
        Dialog = Color3.fromRGB(90, 60, 30),
        DialogHolder = Color3.fromRGB(75, 45, 20),
        DialogHolderLine = Color3.fromRGB(65, 40, 15),
        DialogButton = Color3.fromRGB(90, 60, 30),
        DialogButtonBorder = Color3.fromRGB(120, 90, 60),
        DialogBorder = Color3.fromRGB(110, 80, 50),
        DialogInput = Color3.fromRGB(100, 70, 40),
        DialogInputLine = Color3.fromRGB(200, 170, 140),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Hover = Color3.fromRGB(160, 130, 100),
        HoverChange = 0.04,
    },
    Dark = {
        Name = 'Dark',
        Accent = Color3.fromRGB(96, 205, 255),
        AcrylicMain = Color3.fromRGB(60, 60, 60),
        AcrylicBorder = Color3.fromRGB(90, 90, 90),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
        AcrylicNoise = 0.9,
        TitleBarLine = Color3.fromRGB(75, 75, 75),
        Tab = Color3.fromRGB(120, 120, 120),
        Element = Color3.fromRGB(120, 120, 120),
        ElementBorder = Color3.fromRGB(35, 35, 35),
        InElementBorder = Color3.fromRGB(90, 90, 90),
        ElementTransparency = 0.87,
        ToggleSlider = Color3.fromRGB(120, 120, 120),
        ToggleToggled = Color3.fromRGB(0, 0, 0),
        SliderRail = Color3.fromRGB(120, 120, 120),
        DropdownFrame = Color3.fromRGB(160, 160, 160),
        DropdownHolder = Color3.fromRGB(45, 45, 45),
        DropdownBorder = Color3.fromRGB(35, 35, 35),
        DropdownOption = Color3.fromRGB(120, 120, 120),
        Keybind = Color3.fromRGB(120, 120, 120),
        Input = Color3.fromRGB(160, 160, 160),
        InputFocused = Color3.fromRGB(10, 10, 10),
        InputIndicator = Color3.fromRGB(150, 150, 150),
        Dialog = Color3.fromRGB(45, 45, 45),
        DialogHolder = Color3.fromRGB(35, 35, 35),
        DialogHolderLine = Color3.fromRGB(30, 30, 30),
        DialogButton = Color3.fromRGB(45, 45, 45),
        DialogButtonBorder = Color3.fromRGB(80, 80, 80),
        DialogBorder = Color3.fromRGB(70, 70, 70),
        DialogInput = Color3.fromRGB(55, 55, 55),
        DialogInputLine = Color3.fromRGB(160, 160, 160),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Hover = Color3.fromRGB(120, 120, 120),
        HoverChange = 0.07,
    },
    Darker = {
        Name = 'Darker',
        Accent = Color3.fromRGB(72, 138, 182),
        AcrylicMain = Color3.fromRGB(30, 30, 30),
        AcrylicBorder = Color3.fromRGB(60, 60, 60),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(15, 15, 15)),
        AcrylicNoise = 0.94,
        TitleBarLine = Color3.fromRGB(65, 65, 65),
        Tab = Color3.fromRGB(100, 100, 100),
        Element = Color3.fromRGB(70, 70, 70),
        ElementBorder = Color3.fromRGB(25, 25, 25),
        InElementBorder = Color3.fromRGB(55, 55, 55),
        ElementTransparency = 0.82,
        DropdownFrame = Color3.fromRGB(120, 120, 120),
        DropdownHolder = Color3.fromRGB(35, 35, 35),
        DropdownBorder = Color3.fromRGB(25, 25, 25),
        Dialog = Color3.fromRGB(35, 35, 35),
        DialogHolder = Color3.fromRGB(25, 25, 25),
        DialogHolderLine = Color3.fromRGB(20, 20, 20),
        DialogButton = Color3.fromRGB(35, 35, 35),
        DialogButtonBorder = Color3.fromRGB(55, 55, 55),
        DialogBorder = Color3.fromRGB(50, 50, 50),
        DialogInput = Color3.fromRGB(45, 45, 45),
        DialogInputLine = Color3.fromRGB(120, 120, 120),
    },
    Light = {
        Name = 'Light',
        Accent = Color3.fromRGB(0, 103, 192),
        AcrylicMain = Color3.fromRGB(200, 200, 200),
        AcrylicBorder = Color3.fromRGB(120, 120, 120),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)),
        AcrylicNoise = 0.96,
        TitleBarLine = Color3.fromRGB(160, 160, 160),
        Tab = Color3.fromRGB(90, 90, 90),
        Element = Color3.fromRGB(255, 255, 255),
        ElementBorder = Color3.fromRGB(180, 180, 180),
        InElementBorder = Color3.fromRGB(150, 150, 150),
        ElementTransparency = 0.65,
        ToggleSlider = Color3.fromRGB(40, 40, 40),
        ToggleToggled = Color3.fromRGB(255, 255, 255),
        SliderRail = Color3.fromRGB(40, 40, 40),
        DropdownFrame = Color3.fromRGB(200, 200, 200),
        DropdownHolder = Color3.fromRGB(240, 240, 240),
        DropdownBorder = Color3.fromRGB(200, 200, 200),
        DropdownOption = Color3.fromRGB(150, 150, 150),
        Keybind = Color3.fromRGB(120, 120, 120),
        Input = Color3.fromRGB(200, 200, 200),
        InputFocused = Color3.fromRGB(100, 100, 100),
        InputIndicator = Color3.fromRGB(80, 80, 80),
        InputIndicatorFocus = Color3.fromRGB(0, 103, 192),
        Dialog = Color3.fromRGB(255, 255, 255),
        DialogHolder = Color3.fromRGB(240, 240, 240),
        DialogHolderLine = Color3.fromRGB(228, 228, 228),
        DialogButton = Color3.fromRGB(255, 255, 255),
        DialogButtonBorder = Color3.fromRGB(190, 190, 190),
        DialogBorder = Color3.fromRGB(140, 140, 140),
        DialogInput = Color3.fromRGB(250, 250, 250),
        DialogInputLine = Color3.fromRGB(160, 160, 160),
        Text = Color3.fromRGB(0, 0, 0),
        SubText = Color3.fromRGB(40, 40, 40),
        Hover = Color3.fromRGB(50, 50, 50),
        HoverChange = 0.16,
    },
    Aqua = {
        Name = 'Aqua',
        Accent = Color3.fromRGB(60, 165, 165),
        AcrylicMain = Color3.fromRGB(20, 20, 20),
        AcrylicBorder = Color3.fromRGB(50, 100, 100),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(60, 140, 140), Color3.fromRGB(40, 80, 80)),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromRGB(60, 120, 120),
        Tab = Color3.fromRGB(140, 180, 180),
        Element = Color3.fromRGB(110, 160, 160),
        ElementBorder = Color3.fromRGB(40, 70, 70),
        InElementBorder = Color3.fromRGB(80, 110, 110),
        ElementTransparency = 0.84,
        ToggleSlider = Color3.fromRGB(110, 160, 160),
        ToggleToggled = Color3.fromRGB(0, 0, 0),
        SliderRail = Color3.fromRGB(110, 160, 160),
        DropdownFrame = Color3.fromRGB(160, 200, 200),
        DropdownHolder = Color3.fromRGB(40, 80, 80),
        DropdownBorder = Color3.fromRGB(40, 65, 65),
        DropdownOption = Color3.fromRGB(110, 160, 160),
        Keybind = Color3.fromRGB(110, 160, 160),
        Input = Color3.fromRGB(110, 160, 160),
        InputFocused = Color3.fromRGB(20, 10, 30),
        InputIndicator = Color3.fromRGB(130, 170, 170),
        InputIndicatorFocus = Color3.fromRGB(60, 165, 165),
        Dialog = Color3.fromRGB(40, 80, 80),
        DialogHolder = Color3.fromRGB(30, 60, 60),
        DialogHolderLine = Color3.fromRGB(25, 50, 50),
        DialogButton = Color3.fromRGB(40, 80, 80),
        DialogButtonBorder = Color3.fromRGB(80, 110, 110),
        DialogBorder = Color3.fromRGB(50, 100, 100),
        DialogInput = Color3.fromRGB(45, 90, 90),
        DialogInputLine = Color3.fromRGB(130, 170, 170),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Hover = Color3.fromRGB(110, 160, 160),
        HoverChange = 0.04,
    },
    Amethyst = {
        Name = 'Amethyst',
        Accent = Color3.fromRGB(97, 62, 167),
        AcrylicMain = Color3.fromRGB(20, 20, 20),
        AcrylicBorder = Color3.fromRGB(110, 90, 130),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(85, 57, 139), Color3.fromRGB(40, 25, 65)),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromRGB(95, 75, 110),
        Tab = Color3.fromRGB(160, 140, 180),
        Element = Color3.fromRGB(140, 120, 160),
        ElementBorder = Color3.fromRGB(60, 50, 70),
        InElementBorder = Color3.fromRGB(100, 90, 110),
        ElementTransparency = 0.87,
        ToggleSlider = Color3.fromRGB(140, 120, 160),
        ToggleToggled = Color3.fromRGB(0, 0, 0),
        SliderRail = Color3.fromRGB(140, 120, 160),
        DropdownFrame = Color3.fromRGB(170, 160, 200),
        DropdownHolder = Color3.fromRGB(60, 45, 80),
        DropdownBorder = Color3.fromRGB(50, 40, 65),
        DropdownOption = Color3.fromRGB(140, 120, 160),
        Keybind = Color3.fromRGB(140, 120, 160),
        Input = Color3.fromRGB(140, 120, 160),
        InputFocused = Color3.fromRGB(20, 10, 30),
        InputIndicator = Color3.fromRGB(170, 150, 190),
        InputIndicatorFocus = Color3.fromRGB(97, 62, 167),
        Dialog = Color3.fromRGB(60, 45, 80),
        DialogHolder = Color3.fromRGB(45, 30, 65),
        DialogHolderLine = Color3.fromRGB(40, 25, 60),
        DialogButton = Color3.fromRGB(60, 45, 80),
        DialogButtonBorder = Color3.fromRGB(95, 80, 110),
        DialogBorder = Color3.fromRGB(85, 70, 100),
        DialogInput = Color3.fromRGB(70, 55, 85),
        DialogInputLine = Color3.fromRGB(175, 160, 190),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Hover = Color3.fromRGB(140, 120, 160),
        HoverChange = 0.04,
    },
    Rose = {
        Name = 'Rose',
        Accent = Color3.fromRGB(180, 55, 90),
        AcrylicMain = Color3.fromRGB(40, 40, 40),
        AcrylicBorder = Color3.fromRGB(130, 90, 110),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(190, 60, 135), Color3.fromRGB(165, 50, 70)),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromRGB(140, 85, 105),
        Tab = Color3.fromRGB(180, 140, 160),
        Element = Color3.fromRGB(200, 120, 170),
        ElementBorder = Color3.fromRGB(110, 70, 85),
        InElementBorder = Color3.fromRGB(120, 90, 90),
        ElementTransparency = 0.86,
        ToggleSlider = Color3.fromRGB(200, 120, 170),
        ToggleToggled = Color3.fromRGB(0, 0, 0),
        SliderRail = Color3.fromRGB(200, 120, 170),
        DropdownFrame = Color3.fromRGB(200, 160, 180),
        DropdownHolder = Color3.fromRGB(120, 50, 75),
        DropdownBorder = Color3.fromRGB(90, 40, 55),
        DropdownOption = Color3.fromRGB(200, 120, 170),
        Keybind = Color3.fromRGB(200, 120, 170),
        Input = Color3.fromRGB(200, 120, 170),
        InputFocused = Color3.fromRGB(20, 10, 30),
        InputIndicator = Color3.fromRGB(170, 150, 190),
        InputIndicatorFocus = Color3.fromRGB(180, 55, 90),
        Dialog = Color3.fromRGB(120, 50, 75),
        DialogHolder = Color3.fromRGB(95, 40, 60),
        DialogHolderLine = Color3.fromRGB(90, 35, 55),
        DialogButton = Color3.fromRGB(120, 50, 75),
        DialogButtonBorder = Color3.fromRGB(155, 90, 115),
        DialogBorder = Color3.fromRGB(100, 70, 90),
        DialogInput = Color3.fromRGB(135, 55, 80),
        DialogInputLine = Color3.fromRGB(190, 160, 180),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Hover = Color3.fromRGB(200, 120, 170),
        HoverChange = 0.04,
    },
    Sakura = {
        Name = 'Sakura',
        Accent = Color3.fromRGB(252, 209, 215),
        AcrylicMain = Color3.fromRGB(40, 40, 40),
        AcrylicBorder = Color3.fromRGB(130, 90, 110),
        AcrylicGradient = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(252, 209, 215)),
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 231, 222)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(233, 177, 205)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(195, 130, 158)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(86, 33, 53)),
        }),
        AcrylicNoise = 0.92,
        TitleBarLine = Color3.fromRGB(140, 85, 105),
        Tab = Color3.fromRGB(132, 89, 95),
        Element = Color3.fromRGB(220, 140, 190),
        ElementBorder = Color3.fromRGB(110, 70, 85),
        InElementBorder = Color3.fromRGB(120, 90, 90),
        ElementTransparency = 0.86,
        ToggleSlider = Color3.fromRGB(252, 209, 215),
        ToggleToggled = Color3.fromRGB(252, 209, 215),
        TransparenToggle = 0.5,
        SliderRail = Color3.fromRGB(252, 209, 215),
        DropdownFrame = Color3.fromRGB(252, 209, 215),
        DropdownHolder = Color3.fromRGB(156, 103, 123),
        DropdownBorder = Color3.fromRGB(90, 40, 55),
        DropdownOption = Color3.fromRGB(252, 209, 215),
        Keybind = Color3.fromRGB(200, 120, 170),
        Input = Color3.fromRGB(200, 120, 170),
        InputFocused = Color3.fromRGB(200, 200, 200),
        InputIndicator = Color3.fromRGB(170, 150, 190),
        InputIndicatorFocus = Color3.fromRGB(252, 209, 215),
        Dialog = Color3.fromRGB(120, 50, 75),
        DialogHolder = Color3.fromRGB(95, 40, 60),
        DialogHolderLine = Color3.fromRGB(90, 35, 55),
        DialogButton = Color3.fromRGB(120, 50, 75),
        DialogButtonBorder = Color3.fromRGB(155, 90, 115),
        DialogBorder = Color3.fromRGB(100, 70, 90),
        DialogInput = Color3.fromRGB(135, 55, 80),
        DialogInputLine = Color3.fromRGB(190, 160, 180),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(220, 220, 220),
        Hover = Color3.fromRGB(200, 120, 170),
        HoverChange = 0.04,
    },
}
local vu13 = {
    Version = '1.1.0',
    OpenFrames = {},
    Options = {},
    Themes = vu12.Names,
    Window = nil,
    WindowFrame = nil,
    Unloaded = false,
    Creator = nil,
    DialogOpen = false,
    UseAcrylic = false,
    Acrylic = false,
    Transparency = true,
    MinimizeKeybind = nil,
    MinimizerIcon = nil,
    MinimizeKey = Enum.KeyCode.LeftControl,
}

local function vu16(p14)
    local v15 = tostring(p14):match('^Motor%((.+)%)$')

    if v15 then
        return true, v15
    else
        return false
    end
end

local vu17 = {}

vu17.__index = vu17

function vu17.new(p18, p19)
    return setmetatable({
        signal = p18,
        connected = true,
        _handler = p19,
    }, vu17)
end
function vu17.disconnect(p20)
    if p20.connected then
        p20.connected = false

        local v21, v22, v23 = pairs(p20.signal._connections)

        while true do
            local v24

            v23, v24 = v21(v22, v23)

            if v23 == nil then
                break
            end
            if v24 == p20 then
                table.remove(p20.signal._connections, v23)

                return
            end
        end
    end
end

local vu25 = {}

vu25.__index = vu25

function vu25.new()
    return setmetatable({
        _connections = {},
        _threads = {},
    }, vu25)
end
function vu25.fire(p26, ...)
    local v27, v28, v29 = pairs(p26._connections)

    while true do
        local v30

        v29, v30 = v27(v28, v29)

        if v29 == nil then
            break
        end

        v30._handler(...)
    end

    local v31, v32, v33 = pairs(p26._threads)

    while true do
        local v34

        v33, v34 = v31(v32, v33)

        if v33 == nil then
            break
        end

        coroutine.resume(v34, ...)
    end

    p26._threads = {}
end
function vu25.connect(p35, p36)
    local v37 = vu17.new(p35, p36)

    table.insert(p35._connections, v37)

    return v37
end
function vu25.wait(p38)
    table.insert(p38._threads, coroutine.running())

    return coroutine.yield()
end

local vu39 = {}

vu39.__index = vu39

function vu39.new(p40, p41)
    assert(p40, 'Missing argument #1: targetValue')

    return setmetatable({
        _targetValue = p40,
        _velocity = (p41 or {}).velocity or 1,
    }, vu39)
end
function vu39.step(p42, p43, p44)
    local v45 = p43.value
    local v46 = p42._velocity
    local v47 = p42._targetValue
    local v48 = p44 * v46
    local v49 = math.abs(v47 - v45) <= v48
    local v50 = v45 + v48 * (v45 < v47 and 1 or - 1)

    if v49 then
        v50 = p42._targetValue
        v46 = 0
    end

    return {
        complete = v49,
        value = v50,
        velocity = v46,
    }
end

local vu51 = {}

vu51.__index = vu51

function vu51.new(p52)
    return setmetatable({
        _targetValue = p52
    }, vu51)
end
function vu51.step(p53)
    return {
        complete = true,
        value = p53._targetValue,
    }
end

local vu54 = 0.001
local vu55 = 0.001
local vu56 = 0.0001
local vu57 = {}

vu57.__index = vu57

function vu57.new(p58, p59)
    assert(p58, 'Missing argument #1: targetValue')

    local v60 = p59 or {}

    return setmetatable({
        _targetValue = p58,
        _frequency = v60.frequency or 4,
        _dampingRatio = v60.dampingRatio or 1,
    }, vu57)
end
function vu57.step(p61, p62, p63)
    local v64 = p61._dampingRatio
    local v65 = p61._frequency * 2 * math.pi
    local v66 = p61._targetValue
    local v67 = p62.value
    local v68 = p62.velocity or 0
    local v69 = v67 - v66
    local v70 = math.exp(- v64 * v65 * p63)
    local v71 = v65 * p63
    local v72 = v65 * v65
    local v73, v74

    if v64 == 1 then
        v73 = (v69 * (1 + v71) + v68 * p63) * v70 + v66
        v74 = (v68 * (1 - v71) - v69 * (v72 * p63)) * v70
    elseif v64 < 1 then
        local v75 = math.sqrt(1 - v64 * v64)
        local v76 = v75 * v75
        local v77 = v65 * v75
        local v78 = v77 * p63
        local v79 = math.cos(v78)
        local v80 = math.sin(v78)
        local v81

        if vu56 >= v75 then
            local v82 = p63 * v65
            local v83 = v82 * v82
            local v84 = v83 * v82

            v81 = v82 + (v83 * (v76 * v76) / 20 - v76) * v84 / 6
        else
            v81 = v80 / v75
        end

        local v85

        if vu56 >= v77 then
            local v86 = v77 * v77
            local v87 = p63 * p63
            local v88 = v87 * p63

            v85 = p63 + (v87 * v86 * v86 / 20 - v86) * v88 / 6
        else
            v85 = v80 / v77
        end

        v73 = (v69 * (v79 + v64 * v81) + v68 * v85) * v70 + v66
        v74 = (v68 * (v79 - v81 * v64) - v69 * (v81 * v65)) * v70
    else
        local v89 = math.sqrt(v64 * v64 - 1)
        local v90 = - v65 * (v64 - v89)
        local v91 = - v65 * (v64 + v89)
        local v92 = (v68 - v69 * v90) / (2 * v65 * v89)
        local v93 = (v69 - v92) * math.exp(v90 * p63)
        local v94 = v92 * math.exp(v91 * p63)

        v73 = v93 + v94 + v66
        v74 = v93 * v90 + v94 * v91
    end

    return (math.abs(v74) >= vu54 or math.abs(v73 - v66) >= vu55) and {
        complete = false,
        value = v73,
        velocity = v74,
    } or {
        complete = true,
        value = v66,
        velocity = v74,
    }
end

local function v95()
end

local vu96 = {}

vu96.__index = vu96

function vu96.new()
    return setmetatable({
        _onStep = vu25.new(),
        _onStart = vu25.new(),
        _onComplete = vu25.new(),
    }, vu96)
end
function vu96.onStep(p97, p98)
    return p97._onStep:connect(p98)
end
function vu96.onStart(p99, p100)
    return p99._onStart:connect(p100)
end
function vu96.onComplete(p101, p102)
    return p101._onComplete:connect(p102)
end
function vu96.start(pu103)
    if not pu103._connection then
        pu103._connection = vu1.RenderStepped:Connect(function(p104)
            pu103:step(p104)
        end)
    end
end
function vu96.stop(p105)
    if p105._connection then
        p105._connection:Disconnect()

        p105._connection = nil
    end
end

vu96.destroy = vu96.stop
vu96.step = v95
vu96.getValue = v95
vu96.setGoal = v95

function vu96.__tostring(_)
    return 'Motor'
end

local vu106 = setmetatable({}, vu96)

vu106.__index = vu106

function vu106.new(p107, p108)
    assert(p107, 'Missing argument #1: initialValue')
    assert(typeof(p107) == 'number', 'initialValue must be a number!')

    local v109 = setmetatable(vu96.new(), vu106)

    if p108 == nil then
        v109._useImplicitConnections = true
    else
        v109._useImplicitConnections = p108
    end

    v109._goal = nil
    v109._state = {
        complete = true,
        value = p107,
    }

    return v109
end
function vu106.step(p110, p111)
    if p110._state.complete then
        return true
    end

    local v112 = p110._goal:step(p110._state, p111)

    p110._state = v112

    p110._onStep:fire(v112.value)

    if v112.complete then
        if p110._useImplicitConnections then
            p110:stop()
        end

        p110._onComplete:fire()
    end

    return v112.complete
end
function vu106.getValue(p113)
    return p113._state.value
end
function vu106.setGoal(p114, p115)
    p114._state.complete = false
    p114._goal = p115

    p114._onStart:fire()

    if p114._useImplicitConnections then
        p114:start()
    end
end
function vu106.__tostring(_)
    return 'Motor(Single)'
end

local vu116 = setmetatable({}, vu96)

vu116.__index = vu116

local function vu119(p117)
    if vu16(p117) then
        return p117
    end

    local v118 = typeof(p117)

    if v118 == 'number' then
        return vu106.new(p117, false)
    end
    if v118 == 'table' then
        return vu116.new(p117, false)
    end

    error(('Unable to convert %q to motor; type %s is unsupported'):format(p117, v118), 2)
end

function vu116.new(p120, p121)
    assert(p120, 'Missing argument #1: initialValues')
    assert(typeof(p120) == 'table', 'initialValues must be a table!')
    assert(not p120.step, [[initialValues contains disallowed property "step". Did you mean to put a table of values here?]])

    local v122 = setmetatable(vu96.new(), vu116)

    if p121 == nil then
        v122._useImplicitConnections = true
    else
        v122._useImplicitConnections = p121
    end

    v122._complete = true
    v122._motors = {}

    local v123, v124, v125 = pairs(p120)

    while true do
        local v126

        v125, v126 = v123(v124, v125)

        if v125 == nil then
            break
        end

        v122._motors[v125] = vu119(v126)
    end

    return v122
end
function vu116.step(p127, p128)
    if p127._complete then
        return true
    end

    local v129, v130, v131 = pairs(p127._motors)
    local v132 = true

    while true do
        local v133

        v131, v133 = v129(v130, v131)

        if v131 == nil then
            break
        end
        if not v133:step(p128) then
            v132 = false
        end
    end

    p127._onStep:fire(p127:getValue())

    if v132 then
        if p127._useImplicitConnections then
            p127:stop()
        end

        p127._complete = true

        p127._onComplete:fire()
    end

    return v132
end
function vu116.setGoal(p134, p135)
    assert(not p135.step, [[goals contains disallowed property "step". Did you mean to put a table of goals here?]])

    p134._complete = false

    p134._onStart:fire()

    local v136, v137, v138 = pairs(p135)

    while true do
        local v139

        v138, v139 = v136(v137, v138)

        if v138 == nil then
            break
        end

        assert(p134._motors[v138], ('Unknown motor for key %s'):format(v138)):setGoal(v139)
    end

    if p134._useImplicitConnections then
        p134:start()
    end
end
function vu116.getValue(p140)
    local v141, v142, v143 = pairs(p140._motors)
    local v144 = {}

    while true do
        local v145

        v143, v145 = v141(v142, v143)

        if v143 == nil then
            break
        end

        v144[v143] = v145:getValue()
    end

    return v144
end
function vu116.__tostring(_)
    return 'Motor(Group)'
end

local vu146 = {
    SingleMotor = vu106,
    GroupMotor = vu116,
    Instant = vu51,
    Linear = vu39,
    Spring = vu57,
    isMotor = vu16,
}
local vu147 = {
    Registry = {},
    Signals = {},
    TransparencyMotors = {},
    DefaultProperties = {
        ScreenGui = {
            ResetOnSpawn = false,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        },
        Frame = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(0, 0, 0),
            BorderSizePixel = 0,
        },
        ScrollingFrame = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(0, 0, 0),
            ScrollBarImageColor3 = Color3.new(0, 0, 0),
        },
        TextLabel = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(0, 0, 0),
            Font = Enum.Font.SourceSans,
            Text = '',
            TextColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = 1,
            TextSize = 14,
            AutoLocalize = false,
        },
        TextButton = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(0, 0, 0),
            AutoButtonColor = false,
            Font = Enum.Font.SourceSans,
            Text = '',
            TextColor3 = Color3.new(0, 0, 0),
            TextSize = 14,
        },
        TextBox = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(0, 0, 0),
            ClearTextOnFocus = false,
            Font = Enum.Font.SourceSans,
            Text = '',
            TextColor3 = Color3.new(0, 0, 0),
            TextSize = 14,
        },
        ImageLabel = {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(0, 0, 0),
            BorderSizePixel = 0,
        },
        ImageButton = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(0, 0, 0),
            AutoButtonColor = false,
        },
        CanvasGroup = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(0, 0, 0),
            BorderSizePixel = 0,
        },
    },
}

local function vu150(p148, p149)
    if p149.ThemeTag then
        vu147.AddThemeObject(p148, p149.ThemeTag)
    end
end

function vu147.AddSignal(p151, p152)
    local v153 = p151:Connect(p152)

    table.insert(vu147.Signals, v153)

    return v153
end
function vu147.Disconnect()
    for v154 = # vu147.Signals, 1, - 1 do
        local v155 = table.remove(vu147.Signals, v154)

        if v155.Disconnect then
            v155:Disconnect()
        end
    end
end
function vu147.UpdateTheme()
    local v156 = next
    local v157 = vu147.Registry
    local v158 = nil

    while true do
        local v159

        v158, v159 = v156(v157, v158)

        if v158 == nil then
            break
        end

        local v160 = next
        local v161 = v159.Properties
        local v162 = v158
        local v163 = nil

        while true do
            local v164

            v163, v164 = v160(v161, v163)

            if v163 == nil then
                break
            end

            local v165 = vu147.GetThemeProperty(v164)

            if v165 then
                v162[v163] = v165
            end
        end
    end

    local v166 = next
    local v167 = vu147.TransparencyMotors
    local v168 = nil

    while true do
        local v169

        v168, v169 = v166(v167, v168)

        if v168 == nil then
            break
        end

        v169:setGoal(vu146.Instant.new(vu147.GetThemeProperty('ElementTransparency')))
    end
end
function vu147.AddThemeObject(p170, p171)
    local v172 = {
        Object = p170,
        Properties = p171,
        Idx = # vu147.Registry + 1,
    }

    vu147.Registry[p170] = v172

    vu147.UpdateTheme()

    return p170
end
function vu147.OverrideTag(p173, p174)
    vu147.Registry[p173].Properties = p174

    vu147.UpdateTheme()
end
function vu147.GetThemeProperty(p175)
    if vu12[vu13.Theme][p175] then
        return vu12[vu13.Theme][p175]
    else
        return vu12.Dark[p175]
    end
end
function vu147.New(p176, p177, p178)
    local v179 = Instance.new(p176)
    local v180 = next
    local v181 = vu147.DefaultProperties[p176] or {}
    local v182 = nil

    while true do
        local v183

        v182, v183 = v180(v181, v182)

        if v182 == nil then
            break
        end

        v179[v182] = v183
    end

    local v184 = next
    local v185 = p177 or {}
    local v186 = nil

    while true do
        local v187

        v186, v187 = v184(v185, v186)

        if v186 == nil then
            break
        end
        if v186 ~= 'ThemeTag' then
            v179[v186] = v187
        end
    end

    local v188 = next
    local v189 = p178 or {}
    local v190 = nil

    while true do
        local v191

        v190, v191 = v188(v189, v190)

        if v190 == nil then
            break
        end

        v191.Parent = v179
    end

    vu150(v179, p177)

    return v179
end
function vu147.SpringMotor(p192, pu193, pu194, p195, p196)
    local vu197 = p195 or false
    local vu198 = vu146.SingleMotor.new(p192)

    vu198:onStep(function(p199)
        pu193[pu194] = p199
    end)

    if p196 or false then
        table.insert(vu147.TransparencyMotors, vu198)
    end

    return vu198, function(p200, p201)
        if vu197 or (p201 or false or (pu194 ~= 'BackgroundTransparency' or not vu13.DialogOpen)) then
            vu198:setGoal(vu146.Spring.new(p200, {
                frequency = 8
            }))
        end
    end
end

vu13.Creator = vu147

local v202 = vu147.New
local v203 = 'Roblox/Ui'
local v204 = gethui and gethui() or game:GetService('CoreGui')
local v205 = v204:FindFirstChild(v203)

if v205 then
    v205:Destroy()
end

local vu206 = v202('ScreenGui', {
    Parent = v204,
    Name = v203,
})

vu13.GUI = vu206

v11(vu206)

function vu13.SafeCallbackToggles(_, p207, p208, ...)
    if p208 then
        local v209, v210 = pcall(p208, ...)

        if not v209 then
            local _, v211 = v210:find(':%d+: ')

            if not v211 then
                return vu13:Notify({
                    Title = 'Interface',
                    Content = 'Callback error',
                    SubContent = p207,
                    Duration = 5,
                })
            end

            local _ = vu13.Notify
        end
    end
end
function vu13.SafeCallback(_, p212, ...)
    if p212 then
        local v213, v214 = pcall(p212, ...)

        if not v213 then
            local _, v215 = v214:find(':%d+: ')

            if not v215 then
                return vu13:Notify({
                    Title = 'Interface',
                    Content = 'Callback error',
                    SubContent = v214,
                    Duration = 5,
                })
            end

            local _ = vu13.Notify
            local _ = {
                Title = 'Interface',
                Content = 'Callback error',
                SubContent = v214:sub(v215 + 1),
                Duration = 5,
            }
        end
    end
end
function vu13.Round(_, p216, p217)
    if p217 == 0 then
        return math.floor(p216)
    end

    local v218 = tostring(p216)

    if v218:find('%.') then
        v218 = tonumber(v218:sub(1, v218:find('%.') + p217)) or v218
    end

    return v218
end

local function vu224(p219, p220, p221, p222, p223)
    return (p219 - p220) * (p223 - p222) / (p221 - p220) + p222
end

local v228 = {
    function(p225, p226)
        local v227 = game:GetService('Workspace').CurrentCamera:ScreenPointToRay(p225.X, p225.Y)

        return v227.Origin + v227.Direction * p226
    end,
    function()
        return vu224(game:GetService('Workspace').CurrentCamera.ViewportSize.Y, 0, 2560, 8, 56)
    end,
}
local _, _ = unpack(v228)

function AcrylicBlur()
    local function vu231(_)
        local v229 = {}
        local v230 = vu147.New('Frame', {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
        })

        function v229.AddParent(_)
        end
        function v229.SetVisibility(_)
        end

        v229.Frame = v230
        v229.Model = nil

        return v229
    end

    return function(p232)
        return vu231(p232)
    end
end
function AcrylicPaint()
    local vu233 = vu147.New
    local vu234 = AcrylicBlur()

    return function(_)
        local v235 = {}
        local v236 = vu233
        local v237 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 0.9,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
        }
        local v238 = {}
        local v239 = vu233('ImageLabel', {
            Image = 'rbxassetid://8992230677',
            ScaleType = 'Slice',
            SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.new(1, 120, 1, 116),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            BackgroundTransparency = 1,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = 0.7,
        })
        local v240 = vu233('UICorner', {
            CornerRadius = UDim.new(0, 8),
        })
        local v241 = vu233
        local v242 = {
            BackgroundTransparency = 0.45,
            Size = UDim2.fromScale(1, 1),
            Name = 'Background',
            ThemeTag = {
                BackgroundColor3 = 'AcrylicMain',
            },
        }
        local v243 = v241('Frame', v242, {
            vu233('UICorner', {
                CornerRadius = UDim.new(0, 8),
            }),
        })
        local v244 = vu233
        local v245 = {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0.4,
            Size = UDim2.fromScale(1, 1),
        }
        local v246 = {}
        local v247 = {
            Rotation = 90,
            ThemeTag = {
                Color = 'AcrylicGradient',
            },
        }

        __set_list(v246, 1, {
            vu233('UICorner', {
                CornerRadius = UDim.new(0, 8),
            }),
            vu233('UIGradient', v247),
        })

        local v248 = v244('Frame', v245, v246)
        local v249 = vu233('ImageLabel', {
            Image = 'rbxassetid://9968344105',
            ImageTransparency = 0.98,
            ScaleType = Enum.ScaleType.Tile,
            TileSize = UDim2.new(0, 128, 0, 128),
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            vu233('UICorner', {
                CornerRadius = UDim.new(0, 8),
            }),
        })
        local v250 = vu233
        local v251 = {
            Image = 'rbxassetid://9968344227',
            ImageTransparency = 0.9,
            ScaleType = Enum.ScaleType.Tile,
            TileSize = UDim2.new(0, 128, 0, 128),
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            ThemeTag = {
                ImageTransparency = 'AcrylicNoise',
            },
        }
        local v252 = v250('ImageLabel', v251, {
            vu233('UICorner', {
                CornerRadius = UDim.new(0, 8),
            }),
        })
        local v253 = vu233
        local v254 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 2,
        }
        local v255 = {}
        local v256 = {
            Transparency = 0.5,
            Thickness = 1,
            ThemeTag = {
                Color = 'AcrylicBorder',
            },
        }

        __set_list(v255, 1, {
            vu233('UICorner', {
                CornerRadius = UDim.new(0, 8),
            }),
            vu233('UIStroke', v256),
        })
        __set_list(v238, 1, {
            v239,
            v240,
            v243,
            v248,
            v249,
            v252,
            v253('Frame', v254, v255),
        })

        v235.Frame = v236('Frame', v237, v238)

        if vu13.UseAcrylic then
            vu234().Frame.Parent = v235.Frame
            v235.Model = nil

            function v235.AddParent()
            end
            function v235.SetVisibility()
            end
        end

        return v235
    end
end

local vu258 = {
    AcrylicBlur = AcrylicBlur(),
    CreateAcrylic = function()
        return nil
    end,
    AcrylicPaint = AcrylicPaint(),
    init = function()
        local v257 = Instance.new('DepthOfFieldEffect')

        v257.FarIntensity = 0
        v257.InFocusRadius = 0.1
        v257.NearIntensity = 1

        function vu258.Enable()
        end
        function vu258.Disable()
        end
        (function()
        end)()
    end,
}
local vu259 = {
    Assets = {
        Close = 'rbxassetid://9886659671',
        Min = 'rbxassetid://9886659276',
        Max = 'rbxassetid://9886659406',
        Restore = 'rbxassetid://9886659001',
    },
}
local vu260 = vu147.New
local vu261 = vu146.Spring.new
local _ = vu146.Instant.new
local vu262 = vu147.AddSignal

function vu259.Element(p263, p264, p265, p266, p267)
    local vu268 = {
        Original = {
            Text = '',
        },
    }
    local v269 = p267 or {}

    vu268.TitleLabel = vu260('TextLabel', {
        FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
        Text = p263,
        TextColor3 = Color3.fromRGB(240, 240, 240),
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 14),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        AutoLocalize = false,
        ThemeTag = {
            TextColor3 = 'Text',
        },
    })
    vu268.DescLabel = vu260('TextLabel', {
        FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
        Text = p264,
        TextColor3 = Color3.fromRGB(200, 200, 200),
        TextSize = 12,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 14),
        AutoLocalize = false,
        ThemeTag = {
            TextColor3 = 'SubText',
        },
    })
    vu268.LabelHolder = vu260('Frame', {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(10, 0),
        Size = UDim2.new(1, - 28, 0, 0),
    }, {
        vu260('UIListLayout', {
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        vu260('UIPadding', {
            PaddingBottom = UDim.new(0, 13),
            PaddingTop = UDim.new(0, 13),
        }),
        vu268.TitleLabel,
        vu268.DescLabel,
    })
    vu268.Border = vu260('UIStroke', {
        Transparency = 0.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(0, 0, 0),
        ThemeTag = {
            Color = 'ElementBorder',
        },
    })
    vu268.Frame = vu260('TextButton', {
        Visible = v269.Visible and v269.Visible or true,
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 0.89,
        BackgroundColor3 = Color3.fromRGB(130, 130, 130),
        Parent = p265,
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = '',
        LayoutOrder = 7,
        ThemeTag = {
            BackgroundColor3 = 'Element',
            BackgroundTransparency = 'ElementTransparency',
        },
    }, {
        vu260('UICorner', {
            CornerRadius = UDim.new(0, 4),
        }),
        vu268.Border,
        vu268.LabelHolder,
    })

    function vu268.SetTitle(_, p270)
        vu268.TitleLabel.Text = p270
    end
    function vu268.Visible(_, p271)
        vu268.Frame.Visible = p271
    end
    function vu268.SetDesc(_, p272)
        local v273 = p272 == nil and '' or p272

        if v273 == '' then
            vu268.DescLabel.Visible = false
        else
            vu268.DescLabel.Visible = true
        end

        vu268.DescLabel.Text = v273
    end
    function vu268.AddText(_, p274)
        if not string.find(vu268.TitleLabel.Text, p274, 1, true) then
            vu268.TitleLabel.Text = vu268.TitleLabel.Text .. '' .. p274
        end
    end
    function vu268.GetOriginalText(_)
        return vu268.Original.Text
    end
    function vu268.GetTitle(_)
        return vu268.TitleLabel.Text
    end
    function vu268.GetDesc(_)
        return vu268.DescLabel.Text
    end
    function vu268.Destroy(_)
        vu268.Frame:Destroy()
    end

    vu268:SetTitle(p263)
    vu268:SetDesc(p264)

    vu268.Original.Text = p263

    if p266 then
        local _ = vu13.Themes
        local _, vu275 = vu147.SpringMotor(vu147.GetThemeProperty('ElementTransparency'), vu268.Frame, 'BackgroundTransparency', false, true)

        vu147.AddSignal(vu268.Frame.MouseEnter, function()
            vu275(vu147.GetThemeProperty('ElementTransparency') - vu147.GetThemeProperty('HoverChange'))
        end)
        vu147.AddSignal(vu268.Frame.MouseLeave, function()
            vu275(vu147.GetThemeProperty('ElementTransparency'))
        end)
        vu147.AddSignal(vu268.Frame.MouseButton1Down, function()
            vu275(vu147.GetThemeProperty('ElementTransparency') + vu147.GetThemeProperty('HoverChange'))
        end)
        vu147.AddSignal(vu268.Frame.MouseButton1Up, function()
            vu275(vu147.GetThemeProperty('ElementTransparency') - vu147.GetThemeProperty('HoverChange'))
        end)
    end

    return vu268
end
function vu259.Section(p276, p277)
    local vu278 = {
        Layout = vu260('UIListLayout', {
            Padding = UDim.new(0, 5),
        }),
    }

    vu278.Container = vu260('Frame', {
        Size = UDim2.new(1, 0, 0, 26),
        Position = UDim2.fromOffset(0, 24),
        BackgroundTransparency = 1,
    }, {
        vu278.Layout,
    })

    local v279 = vu260
    local v280 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 26),
        LayoutOrder = 7,
        Parent = p277,
    }
    local v281 = {}
    local v282 = vu260
    local v283 = {
        RichText = true,
        Text = p276,
        TextTransparency = 0,
        FontFace = Font.new('rbxassetid://12187365364', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        TextSize = 18,
        TextXAlignment = 'Left',
        TextYAlignment = 'Center',
        Size = UDim2.new(1, - 16, 0, 18),
        Position = UDim2.fromOffset(0, 2),
        AutoLocalize = false,
        ThemeTag = {
            TextColor3 = 'Text',
        },
    }

    __set_list(v281, 1, {
        v282('TextLabel', v283),
        vu278.Container,
    })

    vu278.Root = v279('Frame', v280, v281)

    vu147.AddSignal(vu278.Layout:GetPropertyChangedSignal('AbsoluteContentSize'), function(
    )
        vu278.Container.Size = UDim2.new(1, 0, 0, vu278.Layout.AbsoluteContentSize.Y)
        vu278.Root.Size = UDim2.new(1, 0, 0, vu278.Layout.AbsoluteContentSize.Y + 25)
    end)

    return vu278
end

vu259.Tab = (function()
    local vu284 = vu259
    local vu311 = {
        Window = nil,
        Tabs = {},
        Containers = {},
        SelectedTab = 0,
        TabCount = 0,
        Callback = function()
        end,
        Init = function(_, p285)
            vu311.Window = p285

            return vu311
        end,
        GetCurrentTabPos = function(_)
            local v286 = vu311.Window.TabHolder.AbsolutePosition.Y

            return vu311.Tabs[vu311.SelectedTab].Frame.AbsolutePosition.Y - v286
        end,
        New = function(_, p287, p288, p289)
            local v290 = vu311.Window
            local vu291 = vu13.Elements

            vu311.TabCount = vu311.TabCount + 1

            local vu292 = vu311.TabCount
            local vu293 = {
                Selected = false,
                Name = p287,
                Type = 'Tab',
            }

            if vu13:GetIcon(p288) then
                p288 = vu13:GetIcon(p288)
            end
            if p288 == '' then
                p288 = nil
            end

            vu293.Frame = vu260('TextButton', {
                Size = UDim2.new(1, 0, 0, 34),
                BackgroundTransparency = 1,
                Parent = p289,
                ThemeTag = {
                    BackgroundColor3 = 'Tab',
                },
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 6),
                }),
                vu260('TextLabel', {
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = p288 and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 12, 0.5, 0),
                    Text = p287,
                    RichText = true,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = 0,
                    FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                    TextSize = 12,
                    TextXAlignment = 'Left',
                    TextYAlignment = 'Center',
                    Size = UDim2.new(1, - 12, 1, 0),
                    BackgroundTransparency = 1,
                    AutoLocalize = false,
                    ThemeTag = {
                        TextColor3 = 'Text',
                    },
                }),
                vu260('ImageLabel', {
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.new(0, 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    Image = p288 or nil,
                    ThemeTag = {
                        ImageColor3 = 'Text',
                    },
                }),
            })

            local vu294 = vu260('UIListLayout', {
                Padding = UDim.new(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder,
            })

            vu293.ContainerFrame = vu260('ScrollingFrame', {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Parent = v290.ContainerHolder,
                Visible = false,
                BottomImage = 'rbxassetid://6889812791',
                MidImage = 'rbxassetid://6889812721',
                TopImage = 'rbxassetid://6276641225',
                ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                ScrollBarImageTransparency = 0.95,
                ScrollBarThickness = 3,
                BorderSizePixel = 0,
                CanvasSize = UDim2.fromScale(0, 0),
                ScrollingDirection = Enum.ScrollingDirection.Y,
            }, {
                vu294,
                vu260('UIPadding', {
                    PaddingRight = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 1),
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                }),
            })

            local v295 = vu294

            vu147.AddSignal(vu294.GetPropertyChangedSignal(v295, 'AbsoluteContentSize'), function(
            )
                vu293.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, vu294.AbsoluteContentSize.Y + 2)
            end)

            local v296, v297 = vu147.SpringMotor(1, vu293.Frame, 'BackgroundTransparency')

            vu293.SetTransparency = v297
            vu293.Motor = v296

            vu147.AddSignal(vu293.Frame.MouseEnter, function()
                vu293.SetTransparency(vu293.Selected and 0.85 or 0.89)
            end)
            vu147.AddSignal(vu293.Frame.MouseLeave, function()
                vu293.SetTransparency(vu293.Selected and 0.89 or 1)
            end)
            vu147.AddSignal(vu293.Frame.MouseButton1Down, function()
                vu293.SetTransparency(0.92)
            end)
            vu147.AddSignal(vu293.Frame.MouseButton1Up, function()
                vu293.SetTransparency(vu293.Selected and 0.85 or 0.89)
            end)
            vu147.AddSignal(vu293.Frame.MouseButton1Click, function()
                vu311:SelectTab(vu292)
                vu311.Callback(vu292)
            end)

            vu311.Containers[vu292] = vu293.ContainerFrame
            vu311.Tabs[vu292] = vu293
            vu293.Container = vu293.ContainerFrame
            vu293.ScrollFrame = vu293.Container

            function vu293.AddSection(_, p298)
                local v299 = {
                    Type = 'Section',
                    Container = vu284.Section(p298, vu293.Container).Container,
                    ScrollFrame = vu293.Container,
                }

                setmetatable(v299, vu291)

                return v299
            end

            setmetatable(vu293, vu291)

            return vu293
        end,
        GetCurrentTab = function(p300)
            return p300.SelectedTab
        end,
        SelectTab = function(_, pu301)
            local vu302 = vu311.Window

            vu311.SelectedTab = pu301

            local v303 = next
            local v304 = vu311.Tabs
            local v305 = nil

            while true do
                local v306

                v305, v306 = v303(v304, v305)

                if v305 == nil then
                    break
                end

                v306.SetTransparency(1)

                v306.Selected = false
            end

            vu311.Tabs[pu301].SetTransparency(0.89)

            vu311.Tabs[pu301].Selected = true
            vu302.TabDisplay.Text = vu311.Tabs[pu301].Name

            vu302.SelectorPosMotor:setGoal(vu261(vu311:GetCurrentTabPos(), {
                frequency = 6
            }))
            task.spawn(function()
                vu302.ContainerHolder.Parent = vu302.ContainerAnim

                vu302.ContainerPosMotor:setGoal(vu261(15, {
                    frequency = 10
                }))
                vu302.ContainerBackMotor:setGoal(vu261(1, {
                    frequency = 10
                }))
                task.wait(0.12)

                local v307 = next
                local v308 = vu311.Containers
                local v309 = nil

                while true do
                    local v310

                    v309, v310 = v307(v308, v309)

                    if v309 == nil then
                        break
                    end

                    v310.Visible = false
                end

                vu311.Containers[pu301].Visible = true

                vu302.ContainerPosMotor:setGoal(vu261(0, {
                    frequency = 5
                }))
                vu302.ContainerBackMotor:setGoal(vu261(0, {
                    frequency = 8
                }))
                task.wait(0.12)

                vu302.ContainerHolder.Parent = vu302.ContainerCanvas
            end)
        end,
    }

    return vu311
end)()

function vu259.Button(_, p312, p313)
    local v314 = {
        Title = vu260('TextLabel', {
            FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
            TextColor3 = Color3.fromRGB(200, 200, 200),
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            AutoLocalize = false,
            ThemeTag = {
                TextColor3 = 'Text',
            },
        }),
        HoverFrame = vu260('Frame', {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            ThemeTag = {
                BackgroundColor3 = 'Hover',
            },
        }, {
            vu260('UICorner', {
                CornerRadius = UDim.new(0, 4),
            }),
        }),
    }

    v314.Frame = vu260('TextButton', {
        Size = UDim2.new(0, 0, 0, 32),
        Parent = p312,
        ThemeTag = {
            BackgroundColor3 = 'DialogButton',
        },
    }, {
        vu260('UICorner', {
            CornerRadius = UDim.new(0, 4),
        }),
        vu260('UIStroke', {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Transparency = 0.65,
            ThemeTag = {
                Color = 'DialogButtonBorder',
            },
        }),
        v314.HoverFrame,
        v314.Title,
    })

    local _, vu315 = vu147.SpringMotor(1, v314.HoverFrame, 'BackgroundTransparency', p313 or false)

    vu147.AddSignal(v314.Frame.MouseEnter, function()
        vu315(0.97)
    end)
    vu147.AddSignal(v314.Frame.MouseLeave, function()
        vu315(1)
    end)
    vu147.AddSignal(v314.Frame.MouseButton1Down, function()
        vu315(1)
    end)
    vu147.AddSignal(v314.Frame.MouseButton1Up, function()
        vu315(0.97)
    end)

    return v314
end

vu259.Dialog = (function()
    local _ = vu146.Spring.new
    local _ = vu146.Instant.new
    local vu316 = vu147.New
    local vu341 = {
        Window = nil,
        Init = function(_, p317)
            vu341.Window = p317

            return vu341
        end,
        Create = function(_)
            local vu318 = {
                Buttons = 0,
                TintFrame = vu316('TextButton', {
                    Text = '',
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BackgroundTransparency = 1,
                    Parent = vu341.Window.Root,
                }, {
                    vu316('UICorner', {
                        CornerRadius = UDim.new(0, 8),
                    }),
                }),
            }
            local _, vu319 = vu147.SpringMotor(1, vu318.TintFrame, 'BackgroundTransparency', true)

            vu318.ButtonHolder = vu316('Frame', {
                Size = UDim2.new(1, - 40, 1, - 40),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundTransparency = 1,
            }, {
                vu316('UIListLayout', {
                    Padding = UDim.new(0, 10),
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
            })

            local v320 = vu316
            local v321 = {
                Size = UDim2.new(1, 0, 0, 70),
                Position = UDim2.new(0, 0, 1, - 70),
                ThemeTag = {
                    BackgroundColor3 = 'DialogHolder',
                },
            }
            local v322 = {}
            local v323 = vu316
            local v324 = {
                Size = UDim2.new(1, 0, 0, 1),
                ThemeTag = {
                    BackgroundColor3 = 'DialogHolderLine',
                },
            }

            __set_list(v322, 1, {
                v323('Frame', v324),
                vu318.ButtonHolder,
            })

            vu318.ButtonHolderFrame = v320('Frame', v321, v322)

            local v325 = vu316
            local v326 = {
                FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                Text = 'Dialog',
                TextColor3 = Color3.fromRGB(240, 240, 240),
                TextSize = 22,
                TextXAlignment = Enum.TextXAlignment.Left,
                Size = UDim2.new(1, 0, 0, 22),
                Position = UDim2.fromOffset(20, 25),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                AutoLocalize = false,
                ThemeTag = {
                    TextColor3 = 'Text',
                },
            }

            vu318.Title = v325('TextLabel', v326)
            vu318.Scale = vu316('UIScale', {
                Scale = 1
            })

            local _, vu327 = vu147.SpringMotor(1.1, vu318.Scale, 'Scale')
            local v328 = vu316
            local v329 = {
                Size = UDim2.fromOffset(300, 165),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                GroupTransparency = 1,
                Parent = vu318.TintFrame,
                ThemeTag = {
                    BackgroundColor3 = 'Dialog',
                },
            }
            local v330 = {}
            local v331 = {
                Transparency = 0.5,
                ThemeTag = {
                    Color = 'DialogBorder',
                },
            }

            __set_list(v330, 1, {
                vu316('UICorner', {
                    CornerRadius = UDim.new(0, 8),
                }),
                vu316('UIStroke', v331),
                vu318.Scale,
                vu318.Title,
                vu318.ButtonHolderFrame,
            })

            vu318.Root = v328('CanvasGroup', v329, v330)

            local _, vu332 = vu147.SpringMotor(1, vu318.Root, 'GroupTransparency')

            function vu318.Open(_)
                vu13.DialogOpen = true
                vu318.Scale.Scale = 1.1

                vu319(0.75)
                vu332(0)
                vu327(1)
            end
            function vu318.Close(_)
                vu13.DialogOpen = false

                vu319(1)
                vu332(1)
                vu327(1.1)
                vu318.Root.UIStroke:Destroy()
                task.wait(0.15)
                vu318.TintFrame:Destroy()
            end
            function vu318.Button(_, p333, p334)
                vu318.Buttons = vu318.Buttons + 1

                local v335 = vu259.Button('', vu318.ButtonHolder, true)

                v335.Title.Text = p333 or 'Button'

                local v336 = next
                local v337, v338 = vu318.ButtonHolder:GetChildren()
                local vu339 = p334 or function()
                end

                while true do
                    local v340

                    v338, v340 = v336(v337, v338)

                    if v338 == nil then
                        break
                    end
                    if v340:IsA('TextButton') then
                        v340.Size = UDim2.new(1 / vu318.Buttons, - ((vu318.Buttons - 1) * 10 / vu318.Buttons), 0, 32)
                    end
                end

                vu147.AddSignal(v335.Frame.MouseButton1Click, function()
                    vu13:SafeCallback(vu339)
                    pcall(function()
                        vu318:Close()
                    end)
                end)

                return v335
            end

            return vu318
        end,
    }

    return vu341
end)()
vu259.Notification = (function()
    local vu342 = vu146.Spring.new
    local _ = vu146.Instant.new
    local vu343 = vu147.New
    local vu354 = {
        Init = function(_, p344)
            vu354.Holder = vu343('Frame', {
                Position = UDim2.new(1, - 30, 1, - 30),
                Size = UDim2.new(0, 310, 1, - 30),
                AnchorPoint = Vector2.new(1, 1),
                BackgroundTransparency = 1,
                Parent = p344,
            }, {
                vu343('UIListLayout', {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Bottom,
                    Padding = UDim.new(0, 20),
                }),
            })
        end,
        New = function(_, p345)
            p345.Title = p345.Title or 'Title'
            p345.Content = p345.Content or 'Content'
            p345.SubContent = p345.SubContent or ''
            p345.Duration = p345.Duration or nil
            p345.Buttons = p345.Buttons or {}

            local vu346 = {
                Closed = false,
                AcrylicPaint = vu258.AcrylicPaint(),
                Title = vu343('TextLabel', {
                    Position = UDim2.new(0, 14, 0, 17),
                    Text = p345.Title,
                    RichText = true,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = 0,
                    FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
                    TextSize = 13,
                    TextXAlignment = 'Left',
                    TextYAlignment = 'Center',
                    Size = UDim2.new(1, - 12, 0, 12),
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    AutoLocalize = false,
                    ThemeTag = {
                        TextColor3 = 'Text',
                    },
                }),
                ContentLabel = vu343('TextLabel', {
                    FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
                    Text = p345.Content,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    AutoLocalize = false,
                    ThemeTag = {
                        TextColor3 = 'Text',
                    },
                }),
                SubContentLabel = vu343('TextLabel', {
                    FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
                    Text = p345.SubContent,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    AutoLocalize = false,
                    ThemeTag = {
                        TextColor3 = 'SubText',
                    },
                }),
            }

            vu346.LabelHolder = vu343('Frame', {
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(14, 40),
                Size = UDim2.new(1, - 28, 0, 0),
            }, {
                vu343('UIListLayout', {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 3),
                }),
                vu346.ContentLabel,
                vu346.SubContentLabel,
            })
            vu346.CloseButton = vu343('TextButton', {
                Text = '',
                Position = UDim2.new(1, - 14, 0, 13),
                Size = UDim2.fromOffset(20, 20),
                AnchorPoint = Vector2.new(1, 0),
                BackgroundTransparency = 1,
            }, {
                vu343('ImageLabel', {
                    Image = vu259.Close,
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    ThemeTag = {
                        ImageColor3 = 'Text',
                    },
                }),
            })
            vu346.Root = vu343('Frame', {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Position = UDim2.fromScale(1, 0),
            }, {
                vu346.AcrylicPaint.Frame,
                vu346.Title,
                vu346.CloseButton,
                vu346.LabelHolder,
            })

            if p345.Content == '' then
                vu346.ContentLabel.Visible = false
            end
            if p345.SubContent == '' then
                vu346.SubContentLabel.Visible = false
            end

            vu346.Holder = vu343('Frame', {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 200),
                Parent = vu354.Holder,
            }, {
                vu346.Root,
            })

            local vu347 = vu146.GroupMotor.new({
                Scale = 1,
                Offset = 60,
            })
            local v348 = vu347

            vu347.onStep(v348, function(p349)
                vu346.Root.Position = UDim2.new(p349.Scale, p349.Offset, 0, 0)
            end)
            vu147.AddSignal(vu346.CloseButton.MouseButton1Click, function()
                vu346:Close()
            end)

            function vu346.Open(_)
                local v350 = vu346.LabelHolder.AbsoluteSize.Y

                vu346.Holder.Size = UDim2.new(1, 0, 0, 58 + v350)

                local v351 = vu347
                local v352 = v351.setGoal
                local v353 = {
                    Scale = vu342(0, {
                        frequency = 5
                    }),
                    Offset = vu342(0, {
                        frequency = 5
                    }),
                }

                v352(v351, v353)
            end
            function vu346.Close(_)
                if not vu346.Closed then
                    vu346.Closed = true

                    task.spawn(function()
                        vu347:setGoal({
                            Scale = vu342(1, {
                                frequency = 5
                            }),
                            Offset = vu342(60, {
                                frequency = 5
                            }),
                        })
                        task.wait(0.4)

                        if vu13.UseAcrylic and vu346.AcrylicPaint.Model then
                            vu346.AcrylicPaint.Model:Destroy()
                        end

                        vu346.Holder:Destroy()
                    end)
                end
            end

            vu346:Open()

            if p345.Duration then
                task.delay(p345.Duration, function()
                    vu346:Close()
                end)
            end

            return vu346
        end,
    }

    return vu354
end)()

function vu259.Textbox(p355, p356)
    local vu357 = p356 or false
    local vu358 = {
        Input = vu260('TextBox', {
            FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
            TextColor3 = Color3.fromRGB(200, 200, 200),
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromOffset(10, 0),
            ThemeTag = {
                TextColor3 = 'Text',
                PlaceholderColor3 = 'SubText',
            },
        }),
    }

    vu358.Container = vu260('Frame', {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Position = UDim2.new(0, 6, 0, 0),
        Size = UDim2.new(1, - 12, 1, 0),
    }, {
        vu358.Input,
    })
    vu358.Indicator = vu260('Frame', {
        Size = UDim2.new(1, - 4, 0, 1),
        Position = UDim2.new(0, 2, 1, 0),
        AnchorPoint = Vector2.new(0, 1),
        BackgroundTransparency = vu357 and 0.5 or 0,
        ThemeTag = {
            BackgroundColor3 = vu357 and 'InputIndicator' or 'DialogInputLine',
        },
    })

    local v359 = vu260
    local v360 = {
        Size = UDim2.new(0, 0, 0, 30),
        BackgroundTransparency = vu357 and 0.9 or 0,
        Parent = p355,
        ThemeTag = {
            BackgroundColor3 = vu357 and 'Input' or 'DialogInput',
        },
    }
    local v361 = {}
    local v362 = vu260('UICorner', {
        CornerRadius = UDim.new(0, 4),
    })
    local v363 = vu260
    local v364 = {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Transparency = vu357 and 0.5 or 0.65,
        ThemeTag = {
            Color = vu357 and 'InElementBorder' or 'DialogButtonBorder',
        },
    }

    __set_list(v361, 1, {
        v362,
        v363('UIStroke', v364),
        vu358.Indicator,
        vu358.Container,
    })

    vu358.Frame = v359('Frame', v360, v361)

    local function vu370()
        local v365 = 2
        local v366 = vu358.Container.AbsoluteSize.X

        if vu358.Input:IsFocused() and vu358.Input.TextBounds.X > v366 - 2 * v365 then
            local v367 = vu358.Input.CursorPosition

            if v367 ~= - 1 then
                local v368 = vu5:GetTextSize(string.sub(vu358.Input.Text, 1, v367 - 1), vu358.Input.TextSize, vu358.Input.Font, Vector2.new(math.huge, math.huge)).X
                local v369 = vu358.Input.Position.X.Offset + v368

                if v369 < v365 then
                    vu358.Input.Position = UDim2.fromOffset(v365 - v368, 0)
                elseif v366 - v365 - 1 < v369 then
                    vu358.Input.Position = UDim2.fromOffset(v366 - v368 - v365 - 1, 0)
                end
            end
        else
            vu358.Input.Position = UDim2.new(0, v365, 0, 0)
        end
    end

    task.spawn(vu370)
    vu147.AddSignal(vu358.Input:GetPropertyChangedSignal('Text'), vu370)
    vu147.AddSignal(vu358.Input:GetPropertyChangedSignal('CursorPosition'), vu370)
    vu147.AddSignal(vu358.Input.Focused, function()
        vu370()

        vu358.Indicator.Size = UDim2.new(1, - 2, 0, 2)
        vu358.Indicator.Position = UDim2.new(0, 1, 1, 0)
        vu358.Indicator.BackgroundTransparency = 0

        local v371 = {
            BackgroundColor3 = vu357 and 'InputFocused' or 'DialogHolder',
        }

        vu147.OverrideTag(vu358.Frame, v371)
        vu147.OverrideTag(vu358.Indicator, {
            BackgroundColor3 = 'InputIndicatorFocus',
        })
    end)
    vu147.AddSignal(vu358.Input.FocusLost, function()
        vu370()

        vu358.Indicator.Size = UDim2.new(1, - 4, 0, 1)
        vu358.Indicator.Position = UDim2.new(0, 2, 1, 0)
        vu358.Indicator.BackgroundTransparency = 0.5

        local v372 = {
            BackgroundColor3 = vu357 and 'Input' or 'DialogInput',
        }

        vu147.OverrideTag(vu358.Frame, v372)

        local v373 = {
            BackgroundColor3 = vu357 and 'InputIndicator' or 'DialogInputLine',
        }

        vu147.OverrideTag(vu358.Indicator, v373)
    end)

    return vu358
end
function vu259.TitleBar(pu374)
    local v375 = {}

    local function v383(p376, p377, p378, p379)
        local vu380 = {
            Callback = p379 or function()
            end,
            Frame = vu260('TextButton', {
                Size = UDim2.new(0, 34, 1, - 8),
                AnchorPoint = Vector2.new(1, 0),
                BackgroundTransparency = 1,
                Parent = p378,
                Position = p377,
                Text = '',
                ThemeTag = {
                    BackgroundColor3 = 'Text',
                },
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 7),
                }),
                vu260('ImageLabel', {
                    Image = p376,
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Name = 'Icon',
                    ThemeTag = {
                        ImageColor3 = 'Text',
                    },
                }),
            }),
        }
        local _, vu381 = vu147.SpringMotor(1, vu380.Frame, 'BackgroundTransparency')

        vu262(vu380.Frame.MouseEnter, function()
            vu381(0.94)
        end)
        vu262(vu380.Frame.MouseLeave, function()
            vu381(1, true)
        end)
        vu262(vu380.Frame.MouseButton1Down, function()
            vu381(0.96)
        end)
        vu262(vu380.Frame.MouseButton1Up, function()
            vu381(0.94)
        end)
        vu262(vu380.Frame.MouseButton1Click, vu380.Callback)

        function vu380.SetCallback(p382)
            vu380.Callback = p382
        end

        return vu380
    end

    local v384 = vu260
    local v385 = {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundTransparency = 1,
        Parent = pu374.Parent,
    }
    local v386 = {}
    local v387 = vu260
    local v388 = {
        Size = UDim2.new(1, - 16, 1, 0),
        Position = UDim2.new(0, 16, 0, 0),
        BackgroundTransparency = 1,
    }
    local v389 = {}
    local v390 = vu260('UIListLayout', {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    local v391 = vu260
    local v392 = {
        RichText = true,
        Text = pu374.Title,
        FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        TextSize = 12,
        TextXAlignment = 'Left',
        TextYAlignment = 'Center',
        Size = UDim2.fromScale(0, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        AutoLocalize = false,
        ThemeTag = {
            TextColor3 = 'Text',
        },
    }
    local v393 = v391('TextLabel', v392)
    local v394 = vu260
    local v395 = {
        RichText = true,
        Text = pu374.SubTitle,
        TextTransparency = 0.4,
        FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        TextSize = 12,
        TextXAlignment = 'Left',
        TextYAlignment = 'Center',
        Size = UDim2.fromScale(0, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        AutoLocalize = false,
        ThemeTag = {
            TextColor3 = 'Text',
        },
    }

    __set_list(v389, 1, {
        v390,
        v393,
        v394('TextLabel', v395),
    })

    local v396 = v387('Frame', v388, v389)
    local v397 = vu260
    local v398 = {
        BackgroundTransparency = 0.5,
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 1, 0),
        ThemeTag = {
            BackgroundColor3 = 'TitleBarLine',
        },
    }

    __set_list(v386, 1, {
        v396,
        v397('Frame', v398),
    })

    v375.Frame = v384('Frame', v385, v386)
    v375.CloseButton = v383(vu259.Assets.Close, UDim2.new(1, - 4, 0, 4), v375.Frame, function(
    )
        vu13.Window:Dialog({
            Title = 'Close',
            Content = 'Are you sure you want to unload the interface?',
            Buttons = {
                {
                    Title = 'Yes',
                    Callback = function()
                        vu13:Destroy()
                    end,
                },
                {
                    Title = 'No',
                },
            },
        })
    end)
    v375.MaxButton = v383(vu259.Assets.Max, UDim2.new(1, - 40, 0, 4), v375.Frame, function(
    )
        pu374.Window.Maximize(not pu374.Window.Maximized)
    end)
    v375.MinButton = v383(vu259.Assets.Min, UDim2.new(1, - 80, 0, 4), v375.Frame, function(
    )
        vu13.Window:Minimize()
    end)

    return v375
end

vu259.Window = (function()
    local vu399 = vu146.Spring.new
    local vu400 = vu146.Instant.new
    local vu401 = vu147.New

    return function(p402)
        local vu403 = {
            Minimized = false,
            Maximized = false,
            Size = p402.Size,
            CurrentPos = 0,
            TabWidth = 0,
            Position = UDim2.fromOffset(vu6.ViewportSize.X / 2 - p402.Size.X.Offset / 2, vu6.ViewportSize.Y / 2 - p402.Size.Y.Offset / 2),
        }
        local vu404 = false
        local vu405 = nil
        local vu406 = nil
        local vu407 = nil
        local vu408 = false
        local vu409 = nil
        local vu410 = false

        vu403.AcrylicPaint = vu258.AcrylicPaint()
        vu403.TabWidth = p402.TabWidth

        local vu411 = vu401('Frame', {
            Size = UDim2.fromOffset(4, 0),
            BackgroundColor3 = Color3.fromRGB(76, 194, 255),
            Position = UDim2.fromOffset(0, 17),
            AnchorPoint = Vector2.new(0, 0.5),
            ThemeTag = {
                BackgroundColor3 = 'Accent',
            },
        }, {
            vu401('UICorner', {
                CornerRadius = UDim.new(0, 2),
            }),
        })
        local v412 = 120
        local v413 = vu401('Frame', {
            Size = UDim2.fromOffset(20, 20),
            BackgroundTransparency = 1,
            Position = UDim2.new(1, - 20, 1, - 20),
        })

        vu403.TabHolder = vu401('ScrollingFrame', {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            ScrollBarImageTransparency = 1,
            ScrollBarThickness = 0,
            BorderSizePixel = 0,
            CanvasSize = UDim2.fromScale(0, 0),
            ScrollingDirection = Enum.ScrollingDirection.Y,
        }, {
            vu401('UIListLayout', {
                Padding = UDim.new(0, 4),
            }),
        })

        local v414 = vu401('TextButton', {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, vu403.TabWidth, 0, vu403.TabWidth),
            Position = UDim2.new(0, 12, 0, vu403.TabWidth / 4 - 20),
            BorderSizePixel = 0,
        }, {
            vu401('UIPadding', {
                PaddingBottom = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 2),
                PaddingRight = UDim.new(0, 2),
                PaddingTop = UDim.new(0, 2),
            }),
            vu401('ImageLabel', {
                Image = 'rbxassetid://87038715291154',
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
            }, {
                vu401('UIAspectRatioConstraint', {
                    AspectRatio = 1,
                    AspectType = Enum.AspectType.FitWithinMaxSize,
                }),
            }),
        })
        local v415 = vu401('Frame', {
            Size = UDim2.new(0, vu403.TabWidth, 1, - 66 + - v412),
            Position = UDim2.new(0, 12, 0, 54 + v412),
            BackgroundTransparency = 1,
            ClipsDescendants = true,
        }, {
            vu403.TabHolder,
            vu411,
        })

        vu403.TabDisplay = vu401('TextLabel', {
            RichText = true,
            Text = 'Tab',
            TextTransparency = 0,
            FontFace = Font.new('rbxassetid://12187365364', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            TextSize = 28,
            TextXAlignment = 'Left',
            TextYAlignment = 'Center',
            Size = UDim2.new(1, - 16, 0, 28),
            Position = UDim2.fromOffset(vu403.TabWidth + 26, 56),
            BackgroundTransparency = 1,
            AutoLocalize = false,
            ThemeTag = {
                TextColor3 = 'Text',
            },
        })
        vu403.ContainerHolder = vu401('Frame', {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        })
        vu403.ContainerAnim = vu401('CanvasGroup', {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        })
        vu403.ContainerCanvas = vu401('Frame', {
            Size = UDim2.new(1, - vu403.TabWidth - 32, 1, - 102),
            Position = UDim2.fromOffset(vu403.TabWidth + 26, 90),
            BackgroundTransparency = 1,
        }, {
            vu403.ContainerAnim,
            vu403.ContainerHolder,
        })
        vu403.Root = vu401('Frame', {
            BackgroundTransparency = 1,
            Size = vu403.Size,
            Position = vu403.Position,
            Parent = p402.Parent,
        }, {
            vu403.AcrylicPaint.Frame,
            vu403.TabDisplay,
            vu403.ContainerCanvas,
            v415,
            v413,
            v414,
        })
        vu403.TitleBar = vu259.TitleBar({
            Title = p402.Title,
            SubTitle = p402.SubTitle,
            Parent = vu403.Root,
            Window = vu403,
        })

        if vu13.UseAcrylic then
            vu403.AcrylicPaint.AddParent(vu403.Root)
        end

        local vu416 = vu146.GroupMotor.new({
            X = vu403.Size.X.Offset,
            Y = vu403.Size.Y.Offset,
        })
        local vu417 = vu146.GroupMotor.new({
            X = vu403.Position.X.Offset,
            Y = vu403.Position.Y.Offset,
        })

        vu403.SelectorPosMotor = vu146.SingleMotor.new(17)
        vu403.SelectorSizeMotor = vu146.SingleMotor.new(0)
        vu403.ContainerBackMotor = vu146.SingleMotor.new(0)
        vu403.ContainerPosMotor = vu146.SingleMotor.new(94)

        local v418 = vu416

        vu416.onStep(v418, function(p419)
            vu403.Root.Size = UDim2.new(0, p419.X, 0, p419.Y)
        end)

        local v420 = vu417

        vu417.onStep(v420, function(p421)
            vu403.Root.Position = UDim2.new(0, p421.X, 0, p421.Y)
        end)

        local vu422 = 0
        local vu423 = 0

        vu403.SelectorPosMotor:onStep(function(p424)
            vu411.Position = UDim2.new(0, 0, 0, p424 + 17)

            local v425 = tick()
            local v426 = v425 - vu423

            if vu422 ~= nil then
                vu403.SelectorSizeMotor:setGoal(vu399(math.abs(p424 - vu422) / (v426 * 60) + 16))

                vu422 = p424
            end

            vu423 = v425
        end)
        vu403.SelectorSizeMotor:onStep(function(p427)
            vu411.Size = UDim2.new(0, 4, 0, p427)
        end)
        vu403.ContainerBackMotor:onStep(function(p428)
            vu403.ContainerAnim.GroupTransparency = p428
        end)
        vu403.ContainerPosMotor:onStep(function(p429)
            vu403.ContainerAnim.Position = UDim2.fromOffset(0, p429)
        end)

        local vu430 = nil
        local vu431 = nil

        function vu403.Maximize(p432, p433, p434)
            vu403.Maximized = p432
            vu403.TitleBar.MaxButton.Frame.Icon.Image = p432 and vu259.Assets.Restore or vu259.Assets.Max

            if p432 then
                vu430 = vu403.Size.X.Offset
                vu431 = vu403.Size.Y.Offset
            end

            local v435 = p432 and vu6.ViewportSize.X or vu430
            local v436 = p432 and vu6.ViewportSize.Y or vu431

            vu416:setGoal({
                X = vu146[p434 and 'Instant' or 'Spring'].new(v435, {
                    frequency = 6
                }),
                Y = vu146[p434 and 'Instant' or 'Spring'].new(v436, {
                    frequency = 6
                }),
            })

            vu403.Size = UDim2.fromOffset(v435, v436)

            if not p433 then
                vu417:setGoal({
                    X = vu399(p432 and 0 or vu403.Position.X.Offset, {
                        frequency = 6
                    }),
                    Y = vu399(p432 and 0 or vu403.Position.Y.Offset, {
                        frequency = 6
                    }),
                })
            end
        end

        vu147.AddSignal(vu403.TitleBar.Frame.InputBegan, function(pu437)
            if pu437.UserInputType == Enum.UserInputType.MouseButton1 or pu437.UserInputType == Enum.UserInputType.Touch then
                vu404 = true
                vu406 = pu437.Position
                vu407 = vu403.Root.Position

                if vu403.Maximized then
                    vu407 = UDim2.fromOffset(vu7.X - vu7.X * ((vu430 - 100) / vu403.Root.AbsoluteSize.X), vu7.Y - vu7.Y * (vu431 / vu403.Root.AbsoluteSize.Y))
                end

                pu437.Changed:Connect(function()
                    if pu437.UserInputState == Enum.UserInputState.End then
                        vu404 = false
                    end
                end)
            end
        end)
        vu147.AddSignal(vu403.TitleBar.Frame.InputChanged, function(p438)
            if p438.UserInputType == Enum.UserInputType.MouseMovement or p438.UserInputType == Enum.UserInputType.Touch then
                vu405 = p438
            end
        end)
        vu147.AddSignal(v413.InputBegan, function(p439)
            if p439.UserInputType == Enum.UserInputType.MouseButton1 or p439.UserInputType == Enum.UserInputType.Touch then
                vu408 = true
                vu409 = p439.Position
            end
        end)
        vu147.AddSignal(vu3.InputChanged, function(p440)
            if p440 == vu405 and vu404 then
                local v441 = p440.Position - vu406

                vu403.Position = UDim2.fromOffset(vu407.X.Offset + v441.X, vu407.Y.Offset + v441.Y)

                vu417:setGoal({
                    X = vu400(vu403.Position.X.Offset),
                    Y = vu400(vu403.Position.Y.Offset),
                })

                if vu403.Maximized then
                    vu403.Maximize(false, true, true)
                end
            end
            if (p440.UserInputType == Enum.UserInputType.MouseMovement or p440.UserInputType == Enum.UserInputType.Touch) and vu408 then
                local v442 = p440.Position - vu409
                local v443 = vu403.Size
                local v444 = Vector3.new(v443.X.Offset, v443.Y.Offset, 0) + Vector3.new(1, 1, 0) * v442
                local v445 = Vector2.new(math.clamp(v444.X, 470, 2048), math.clamp(v444.Y, 380, 2048))

                vu416:setGoal({
                    X = vu146.Instant.new(v445.X),
                    Y = vu146.Instant.new(v445.Y),
                })
            end
        end)
        vu147.AddSignal(vu3.InputEnded, function(p446)
            if vu408 == true or p446.UserInputType == Enum.UserInputType.Touch then
                vu408 = false

                local v447 = vu416
                local v448 = vu416

                vu403.Size = UDim2.fromOffset(v447:getValue().X, v448:getValue().Y)
            end
        end)
        vu147.AddSignal(vu403.TabHolder.UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'), function(
        )
            vu403.TabHolder.CanvasSize = UDim2.new(0, 0, 0, vu403.TabHolder.UIListLayout.AbsoluteContentSize.Y)
        end)
        vu147.AddSignal(vu3.InputBegan, function(p449)
            if type(vu13.MinimizeKeybind) ~= 'table' or vu13.MinimizeKeybind.Type ~= 'Keybind' or vu3:GetFocusedTextBox() then
                if p449.KeyCode == vu13.MinimizeKey and not vu3:GetFocusedTextBox() then
                    vu403:Minimize()
                end
            elseif p449.KeyCode.Name == vu13.MinimizeKeybind.Value then
                vu403:Minimize()
            end
        end)

        function vu403.ToggleInterface(_)
            vu403.Minimized = not vu403.Minimized
            vu403.Root.Visible = not vu403.Minimized
        end
        function vu403.Minimize(_)
            vu403.Minimized = not vu403.Minimized
            vu403.Root.Visible = not vu403.Minimized

            if not vu410 then
                vu410 = true

                vu13:Notify({
                    Title = 'Interface',
                    Content = 'Press ' .. (vu13.MinimizeKeybind and vu13.MinimizeKeybind.Value or vu13.MinimizeKey.Name) .. ' to toggle the interface.',
                    Duration = 6,
                })
            end
        end
        function vu403.Destroy(_)
            if vu13.UseAcrylic and vu403.AcrylicPaint.Model then
                vu403.AcrylicPaint.Model:Destroy()
            end

            vu403.Root:Destroy()
        end

        local vu450 = vu259.Dialog:Init(vu403)

        function vu403.Dialog(_, p451)
            local v452 = vu450:Create()

            v452.Title.Text = p451.Title

            local v453 = vu401
            local v454 = {
                FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
                Text = p451.Content,
                TextColor3 = Color3.fromRGB(240, 240, 240),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                Size = UDim2.new(1, - 40, 1, 0),
                Position = UDim2.fromOffset(20, 60),
                BackgroundTransparency = 1,
                Parent = v452.Root,
                ClipsDescendants = false,
                AutoLocalize = false,
                ThemeTag = {
                    TextColor3 = 'Text',
                },
            }
            local v455 = v453('TextLabel', v454)

            vu401('UISizeConstraint', {
                MinSize = Vector2.new(300, 165),
                MaxSize = Vector2.new(620, math.huge),
                Parent = v452.Root,
            })

            v452.Root.Size = UDim2.fromOffset(v455.TextBounds.X + 40, 165)

            if v455.TextBounds.X + 40 > vu403.Size.X.Offset - 120 then
                v452.Root.Size = UDim2.fromOffset(vu403.Size.X.Offset - 120, 165)
                v455.TextWrapped = true
                v452.Root.Size = UDim2.fromOffset(vu403.Size.X.Offset - 120, v455.TextBounds.Y + 150)
            end

            local v456 = next
            local v457 = p451.Buttons
            local v458 = nil

            while true do
                local v459

                v458, v459 = v456(v457, v458)

                if v458 == nil then
                    break
                end

                v452:Button(v459.Title, v459.Callback)
            end

            v452:Open()
        end

        local vu460 = vu259.Tab:Init(vu403)

        function vu403.AddTab(_, p461)
            return vu460:New(p461.Title, p461.Icon, vu403.TabHolder)
        end
        function vu403.GetCurrentTab(_)
            return vu460:GetCurrentTab()
        end
        function vu403.TabChanged(_, p462)
            vu460.Callback = p462
        end
        function vu403.SelectTab(_, p463)
            vu460:SelectTab(p463)
        end

        vu147.AddSignal(vu403.TabHolder:GetPropertyChangedSignal('CanvasPosition'), function(
        )
            vu422 = vu460:GetCurrentTabPos() + 16
            vu423 = 0

            vu403.SelectorPosMotor:setGoal(vu400(vu460:GetCurrentTabPos()))
        end)

        return vu403
    end
end)()

local v828 = {
    Button = (function()
        local v464 = {}

        v464.__index = v464
        v464.__type = 'Button'

        function v464.New(p465, pu466)
            assert(pu466.Title, 'Button - Missing Title')

            pu466.Callback = pu466.Callback or function()
            end

            local v467 = vu259.Element(pu466.Title, pu466.Description, p465.Container, true, pu466)

            vu260('ImageLabel', {
                Image = 'rbxassetid://10709791437',
                Size = UDim2.fromOffset(16, 16),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, - 10, 0.5, 0),
                BackgroundTransparency = 1,
                Parent = v467.Frame,
                ThemeTag = {
                    ImageColor3 = 'Text',
                },
            })
            vu147.AddSignal(v467.Frame.MouseButton1Click, function()
                vu13:SafeCallback(pu466.Callback)
            end)

            return v467
        end

        return v464
    end)(),
    Toggle = (function()
        local v468 = {}

        v468.__index = v468
        v468.__type = 'Toggle'

        function v468.New(p469, pu470, pu471)
            assert(pu471.Title, 'Toggle - Missing Title')

            local vu472 = {
                OriginalTitle = pu471.Title,
                OriginalDesc = pu471.Description,
                Value = pu471.Default or false,
                Callback = pu471.Callback or function(_)
                end,
                Type = 'Toggle',
            }
            local vu473 = vu259.Element(pu471.Title, pu471.Description, p469.Container, true, pu471)

            vu473.DescLabel.Size = UDim2.new(1, - 54, 0, 14)
            vu472.SetTitle = vu473.SetTitle
            vu472.AddText = vu473.AddText
            vu472.SetDesc = vu473.SetDesc
            vu472.Visible = vu473.Visible
            vu472.GetOriginalText = vu473.GetOriginalText
            vu472.Elements = vu473

            local vu474 = vu260('ImageLabel', {
                AnchorPoint = Vector2.new(0, 0.5),
                Size = UDim2.fromOffset(14, 14),
                Position = UDim2.new(0, 2, 0.5, 0),
                Image = 'http://www.roblox.com/asset/?id=12266946128',
                ImageTransparency = 0.5,
                ThemeTag = {
                    ImageColor3 = 'ToggleSlider',
                },
            })
            local vu475 = vu260('UIStroke', {
                Transparency = 0.5,
                ThemeTag = {
                    Color = 'ToggleSlider',
                },
            })
            local vu476 = vu260('Frame', {
                Size = UDim2.fromOffset(36, 18),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, - 10, 0.5, 0),
                Parent = vu473.Frame,
                BackgroundTransparency = 1,
                ThemeTag = {
                    BackgroundColor3 = 'Accent',
                },
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 9),
                }),
                vu475,
                vu474,
            })

            function vu472.OnChanged(_, p477)
                vu472.Changed = p477

                p477(vu472.Value)
            end
            function vu472.SetValue(_, p478)
                vu472.Value = p478 and true or false

                vu147.OverrideTag(vu475, {
                    Color = vu472.Value and 'Accent' or 'ToggleSlider',
                })
                vu147.OverrideTag(vu474, {
                    ImageColor3 = vu472.Value and 'ToggleToggled' or 'ToggleSlider',
                })
                vu4:Create(vu474, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0, vu472.Value and 19 or 2, 0.5, 0),
                }):Play()
                vu4:Create(vu476, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    BackgroundTransparency = vu472.Value and 0.45 or 1,
                }):Play()

                vu474.ImageTransparency = vu472.Value and 0 or 0.5

                vu13:SafeCallbackToggles(pu471.Title, vu472.Callback, vu472.Value)
                vu13:SafeCallbackToggles(pu471.Title, vu472.Changed, vu472.Value)
            end
            function vu472.GetValue(p479)
                return p479.Value
            end
            function vu472.Destroy(_)
                vu473:Destroy()

                vu13.Options[pu470] = nil
            end

            vu147.AddSignal(vu473.Frame.MouseButton1Click, function()
                vu472:SetValue(not vu472.Value)
            end)
            vu472:SetValue(vu472.Value)

            vu13.Options[pu470] = vu472

            return vu472
        end

        return v468
    end)(),
    Dropdown = (function()
        local v480 = {}

        v480.__index = v480
        v480.__type = 'Dropdown'

        function v480.New(p481, pu482, pu483)
            local vu484 = {
                Values = pu483.Values,
                Value = pu483.Default,
                Multi = pu483.Multi,
                Buttons = {},
                Opened = false,
                Type = 'Dropdown',
                Callback = pu483.Callback or function()
                end,
                Searchable = pu483.Searchable or false,
                LoadedItems = 0,
                BatchSize = 20,
                IsLoadingBatch = false,
            }

            if vu484.Multi and pu483.AllowNull then
                vu484.Value = {}
            end

            local vu485 = vu259.Element(pu483.Title, pu483.Description, p481.Container, false, pu483)

            vu485.DescLabel.Size = UDim2.new(1, - 170, 0, 14)
            vu484.SetTitle = vu485.SetTitle
            vu484.SetDesc = vu485.SetDesc
            vu484.Visible = vu485.Visible
            vu484.Elements = vu485

            local vu486 = vu260('TextBox', {
                FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                Text = '',
                PlaceholderText = 'Value',
                PlaceholderColor3 = Color3.fromRGB(240, 240, 240),
                TextColor3 = Color3.fromRGB(240, 240, 240),
                TextSize = 14,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextXAlignment = Enum.TextXAlignment.Left,
                Size = UDim2.new(1, vu484.Multi and - 70 or - 40, 0.5, 0),
                Position = UDim2.new(0, 8, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Interactable = false,
                AutoLocalize = false,
                ThemeTag = {
                    TextColor3 = 'Text',
                    PlaceholderColor3 = 'Text',
                },
            })
            local vu487

            if vu484.Multi then
                vu487 = vu260('TextButton', {
                    Size = UDim2.fromOffset(30, 30),
                    BackgroundColor3 = Color3.fromRGB(220, 60, 60),
                    BackgroundTransparency = 0.15,
                    Text = '',
                    AutoLocalize = false,
                    Visible = false,
                    Parent = vu13.GUI,
                    ThemeTag = {
                        BackgroundColor3 = 'DangerColor',
                    },
                }, {
                    vu260('UICorner', {
                        CornerRadius = UDim.new(0, 15),
                    }),
                    vu260('UIStroke', {
                        Transparency = 0.4,
                        Thickness = 1.5,
                        Color = Color3.fromRGB(255, 120, 120),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    }),
                    vu260('ImageLabel', {
                        Size = UDim2.fromOffset(16, 16),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundTransparency = 1,
                        Image = 'rbxassetid://10747384394',
                        ThemeTag = {
                            ImageColor3 = 'Text',
                        },
                    }),
                })
            else
                vu487 = nil
            end

            local vu488 = vu260('ImageLabel', {
                Image = 'rbxassetid://10709790948',
                Size = UDim2.fromOffset(16, 16),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, - 8, 0.5, 0),
                BackgroundTransparency = 1,
                Rotation = 90,
                ThemeTag = {
                    ImageColor3 = 'SubText',
                },
            })
            local vu489 = vu260('TextButton', {
                Size = UDim2.fromOffset(160, 30),
                Position = UDim2.new(1, - 10, 0.5, 0),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundTransparency = 0.9,
                Parent = vu485.Frame,
                AutoLocalize = false,
                ThemeTag = {
                    BackgroundColor3 = 'DropdownFrame',
                },
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 8),
                }),
                vu260('UIStroke', {
                    Transparency = 0.3,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    ThemeTag = {
                        Color = 'InElementBorder',
                    },
                }),
                vu488,
                vu486,
            })
            local _, vu490 = vu147.SpringMotor(0.9, vu489, 'BackgroundTransparency')

            vu147.AddSignal(vu489.MouseEnter, function()
                vu490(0.8)
            end)
            vu147.AddSignal(vu489.MouseLeave, function()
                vu490(0.9)
            end)

            if vu487 then
                local _, vu491 = vu147.SpringMotor(0.15, vu487, 'BackgroundTransparency')

                vu147.AddSignal(vu487.MouseEnter, function()
                    vu491(0.05)
                    vu4:Create(vu487, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
                        Size = UDim2.fromOffset(32, 32),
                    }):Play()
                end)
                vu147.AddSignal(vu487.MouseLeave, function()
                    vu491(0.15)
                    vu4:Create(vu487, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
                        Size = UDim2.fromOffset(30, 30),
                    }):Play()
                end)
                vu147.AddSignal(vu487.MouseButton1Down, function()
                    vu491(0)
                    vu4:Create(vu487, TweenInfo.new(0.1, Enum.EasingStyle.Quart), {
                        Size = UDim2.fromOffset(28, 28),
                    }):Play()
                end)
                vu147.AddSignal(vu487.MouseButton1Up, function()
                    vu491(0.05)
                    vu4:Create(vu487, TweenInfo.new(0.1, Enum.EasingStyle.Quart), {
                        Size = UDim2.fromOffset(32, 32),
                    }):Play()
                end)
                vu147.AddSignal(vu487.MouseButton1Click, function()
                    if vu484.Multi then
                        vu484.Value = {}

                        local v492 = next
                        local v493 = vu484.Buttons
                        local v494 = nil

                        while true do
                            local v495

                            v494, v495 = v492(v493, v494)

                            if v494 == nil then
                                break
                            end

                            v495:UpdateButton()
                        end

                        vu484:Display()
                        vu484:Close()
                        vu13:SafeCallback(vu484.Callback, vu484.Value)
                        vu13:SafeCallback(vu484.Changed, vu484.Value)
                    end
                end)
            end

            local vu496 = vu260('UIListLayout', {
                Padding = UDim.new(0, 4),
            })
            local vu497 = vu260('ScrollingFrame', {
                Size = UDim2.new(1, - 8, 1, - 12),
                Position = UDim2.fromOffset(6, 6),
                BackgroundTransparency = 1,
                BottomImage = 'rbxassetid://6889812791',
                MidImage = 'rbxassetid://6889812721',
                TopImage = 'rbxassetid://6276641225',
                ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120),
                ScrollBarImageTransparency = 0.6,
                ScrollBarThickness = 6,
                BorderSizePixel = 0,
                CanvasSize = UDim2.fromScale(0, 0),
                ScrollingDirection = Enum.ScrollingDirection.Y,
            }, {
                vu496
            })
            local vu498 = vu260('Frame', {
                Size = UDim2.fromScale(1, 0.6),
                ThemeTag = {
                    BackgroundColor3 = 'DropdownHolder',
                },
            }, {
                vu497,
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 10),
                }),
                vu260('UIStroke', {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Transparency = 0.3,
                    ThemeTag = {
                        Color = 'DropdownBorder',
                    },
                }),
                vu260('ImageLabel', {
                    BackgroundTransparency = 1,
                    Image = 'http://www.roblox.com/asset/?id=5554236805',
                    ScaleType = Enum.ScaleType.Slice,
                    SliceCenter = Rect.new(23, 23, 277, 277),
                    Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
                    Position = UDim2.fromOffset(- 15, - 15),
                    ImageColor3 = Color3.fromRGB(0, 0, 0),
                    ImageTransparency = 0.05,
                }),
            })
            local vu499 = vu260('Frame', {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(170, 300),
                Parent = vu13.GUI,
                Visible = false,
            }, {
                vu498,
                vu260('UISizeConstraint', {
                    MinSize = Vector2.new(170, 0),
                }),
            })
            local vu500 = vu260('Frame', {
                Size = UDim2.new(1, - 5, 0, 35),
                BackgroundColor3 = Color3.fromRGB(50, 50, 60),
                BackgroundTransparency = 0.7,
                Parent = vu497,
                Name = 'LoadingIndicator',
                Visible = false,
            }, {
                vu260('TextLabel', {
                    FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
                    Text = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} Loading more items...',
                    TextColor3 = Color3.fromRGB(150, 150, 150),
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    AutoLocalize = false,
                }),
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 8),
                }),
            })
            local v501 = vu260('UIStroke', {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(100, 100, 120),
                Transparency = 0.3,
                Thickness = 1.5,
                ThemeTag = {
                    Color = 'ElementBorder',
                },
            })
            local v502 = vu260('ImageLabel', {
                Image = 'rbxassetid://10734943674',
                Size = UDim2.fromOffset(18, 18),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 8, 0.5, 0),
                BackgroundTransparency = 1,
                Rotation = 0,
                ThemeTag = {
                    ImageColor3 = 'SubText',
                },
            })
            local vu503 = vu260('Frame', {
                Visible = false,
                Size = UDim2.new(0, 170, 0, 35),
                Parent = vu13.GUI,
                AutomaticSize = Enum.AutomaticSize.Y,
                ThemeTag = {
                    BackgroundColor3 = 'DropdownHolder',
                },
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 8),
                }),
                v502,
                v501,
            })

            vu260('UIGradient', {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(240, 240, 250)),
                }),
                Rotation = 45,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.95),
                    NumberSequenceKeypoint.new(1, 0.98),
                }),
                Parent = vu503,
            })

            local vu504 = vu260('TextBox', {
                FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                Text = '',
                PlaceholderText = 'Search Here ...',
                PlaceholderColor3 = Color3.fromRGB(180, 180, 190),
                Parent = vu503,
                TextColor3 = Color3.fromRGB(240, 240, 240),
                TextSize = 14,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextXAlignment = Enum.TextXAlignment.Left,
                Size = UDim2.new(1, - 30, 1, - 4),
                Position = UDim2.new(0, 30, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                LayoutOrder = 7,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Interactable = true,
                AutoLocalize = false,
                ThemeTag = {
                    TextColor3 = 'Text',
                    PlaceholderColor3 = 'SubText',
                },
            })
            local _, vu505 = vu147.SpringMotor(0.3, v501, 'Transparency')

            vu147.AddSignal(vu504.Focused, function()
                vu505(0.1)
            end)
            vu147.AddSignal(vu504.FocusLost, function()
                vu505(0.3)
            end)
            table.insert(vu13.OpenFrames, vu499)

            local vu506 = 195
            local vu507 = - 5
            local vu508 = 18
            local vu509 = 5
            local vu510 = {
                {
                    Instance = vu499,
                    YOffset = 35,
                },
                {
                    Instance = vu503,
                    YOffset = 0,
                },
                {
                    Instance = vu487,
                    YOffset = 0,
                    XOffset = 175,
                },
            }

            local function vu523()
                local v511 = vu6.ViewportSize.Y - vu489.AbsolutePosition.Y
                local v512 = vu499.AbsoluteSize.Y - 5
                local v513 = vu507 - (v511 >= v512 and 0 or v512 - v511 + 40) or vu508
                local v514 = vu489.AbsolutePosition.X - 1 + vu506
                local v515 = vu489.AbsolutePosition.Y + v513
                local v516, v517, v518 = ipairs(vu510)

                while true do
                    local v519

                    v518, v519 = v516(v517, v518)

                    if v518 == nil then
                        break
                    end

                    local v520 = v519.Instance

                    if v520 then
                        local v521 = v519.XOffset or 0
                        local v522 = v519.YOffset or 0

                        v520.Position = UDim2.fromOffset(v514 + v521, v515 + v522)
                    end
                end
            end

            local vu524 = 0

            local function vu525()
                if vu509 >= # vu484.Values then
                    vu499.Size = UDim2.fromOffset(vu524, vu496.AbsoluteContentSize.Y + 15)
                else
                    vu499.Size = UDim2.fromOffset(vu524, 42 * vu509 - 10)
                end
            end
            local function vu529()
                local v526 = vu484.LoadedItems
                local v527 = # vu484.Values
                local v528 = v526 * 36 + math.max(0, v526 - 1) * 4

                if v526 < v527 then
                    v528 = v528 + 45
                end

                vu497.CanvasSize = UDim2.fromOffset(0, v528)
            end

            vu523()
            vu525()
            vu147.AddSignal(vu489:GetPropertyChangedSignal('AbsolutePosition'), vu523)

            local v530 = vu497

            vu147.AddSignal(vu497.GetPropertyChangedSignal(v530, 'CanvasPosition'), function(
            )
                if vu484.Opened and not vu484.IsLoadingBatch then
                    local v531 = vu497
                    local v532 = v531.CanvasPosition.Y
                    local v533 = v531.AbsoluteSize.Y
                    local v534 = v531.CanvasSize.Y.Offset

                    if v532 + v533 >= v534 - 50 and vu484.LoadedItems < # vu484.Values then
                        vu484:LoadNextBatch()
                    end
                end
            end)

            local v535 = vu504

            vu147.AddSignal(vu504.GetPropertyChangedSignal(v535, 'Text'), function(
            )
                local v536 = vu504.Text

                if # v536 == 0 then
                    local v537 = next
                    local v538, v539 = vu497:GetChildren()

                    while true do
                        local v540

                        v539, v540 = v537(v538, v539)

                        if v539 == nil then
                            break
                        end
                        if not v540:IsA('UIListLayout') and v540.Name ~= 'LoadingIndicator' then
                            local v541 = v540.ButtonLabel.Text

                            if not v541:lower():match(v536:lower()) then
                                local _ = v541:lower() == v536:lower()
                            end

                            v540.Visible = true
                        end
                    end
                end

                local v542 = next
                local v543, v544 = vu497:GetChildren()

                while true do
                    local v545

                    v544, v545 = v542(v543, v544)

                    if v544 == nil then
                        break
                    end
                    if not v545:IsA('UIListLayout') and v545.Name ~= 'LoadingIndicator' then
                        local v546 = v545.ButtonLabel.Text

                        v545.Visible = (v546:lower():match(v536:lower()) or v546:lower() == v536:lower()) and true or false
                    end
                end

                vu523()
                vu525()
            end)
            vu147.AddSignal(vu504.Focused, function()
                vu504.Text = ''
            end)
            vu147.AddSignal(vu504.FocusLost, function(_, _)
                if # vu504.Text > 0 then
                    local v547 = tick()

                    repeat
                        wait()
                    until tick() - v547 > 5 or vu504:IsFocused()

                    if not vu504:IsFocused() then
                        vu504.Text = ''
                    end
                end
            end)
            vu147.AddSignal(vu3.InputBegan, function(p548)
                if p548.UserInputType == Enum.UserInputType.MouseButton1 or p548.UserInputType == Enum.UserInputType.Touch then
                    if not vu484.Opened then
                        return
                    end

                    local v549 = p548.Position
                    local v550 = vu489.AbsolutePosition.X <= v549.X and (v549.X <= vu489.AbsolutePosition.X + vu489.AbsoluteSize.X and (vu489.AbsolutePosition.Y <= v549.Y and v549.Y <= vu489.AbsolutePosition.Y + vu489.AbsoluteSize.Y))
                    local v551 = vu498.AbsolutePosition.X <= v549.X and (v549.X <= vu498.AbsolutePosition.X + vu498.AbsoluteSize.X and (vu498.AbsolutePosition.Y - 21 <= v549.Y and v549.Y <= vu498.AbsolutePosition.Y + vu498.AbsoluteSize.Y))
                    local v552

                    if vu503.Visible then
                        v552 = vu503.AbsolutePosition.X <= v549.X and (v549.X <= vu503.AbsolutePosition.X + vu503.AbsoluteSize.X and (vu503.AbsolutePosition.Y <= v549.Y and v549.Y <= vu503.AbsolutePosition.Y + vu503.AbsoluteSize.Y))
                    else
                        v552 = false
                    end

                    local v553

                    if vu487 and vu487.Visible then
                        v553 = vu487.AbsolutePosition.X <= v549.X and (v549.X <= vu487.AbsolutePosition.X + vu487.AbsoluteSize.X and (vu487.AbsolutePosition.Y <= v549.Y and v549.Y <= vu487.AbsolutePosition.Y + vu487.AbsoluteSize.Y))
                    else
                        v553 = false
                    end
                    if not (v550 or (v551 or (v552 or v553))) then
                        vu484:Close()
                    end
                end
            end)
            vu147.AddSignal(vu489.MouseButton1Click, function()
                if vu484.Opened then
                    vu484:Close()
                else
                    vu484:Open()
                end
            end)

            local vu554 = p481.ScrollFrame

            function vu484.Open(_)
                vu484.Opened = true

                if vu484.Searchable then
                    vu503.Visible = true
                end
                if vu487 and vu484.Multi then
                    local v555, v556, v557 = pairs(vu484.Value)
                    local v558, _ = v555(v556, v557)

                    vu487.Visible = v558 ~= nil
                end

                vu554.ScrollingEnabled = false
                vu499.Visible = true

                if vu484.LoadedItems == 0 and # vu484.Values > 0 then
                    vu484:LoadNextBatch()
                end

                vu4:Create(vu498, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.fromScale(1, 1),
                }):Play()
                vu4:Create(vu488, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Rotation = - 90,
                }):Play()
            end
            function vu484.Close(_)
                vu484.Opened = false
                vu503.Visible = false

                if vu487 then
                    vu487.Visible = false
                end

                vu554.ScrollingEnabled = true
                vu486.Interactable = false
                vu498.Size = UDim2.fromScale(1, 0.6)
                vu499.Visible = false

                vu4:Create(vu488, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Rotation = 90
                }):Play()
                vu504:ReleaseFocus(false)
                vu484:Display()
            end
            function vu484.Display(_)
                local v559 = vu484.Values
                local v560 = ''

                if pu483.Multi then
                    local v561 = next
                    local v562 = nil
                    local v563 = 0

                    while true do
                        local v564

                        v562, v564 = v561(v559, v562)

                        if v562 == nil then
                            break
                        end
                        if vu484.Value[v564] then
                            v563 = v563 + 1

                            if v563 <= 3 then
                                v560 = v560 .. v564 .. ', '
                            elseif v563 == 4 then
                                v560 = v560 .. 'and ' .. v563 - 3 .. ' more...'

                                break
                            end
                        end
                    end

                    if v563 <= 3 then
                        v560 = v560:sub(1, # v560 - 2)
                    end
                    if vu487 then
                        local v565 = vu487
                        local v566 = vu484.Opened

                        if v566 then
                            v566 = v563 > 0
                        end

                        v565.Visible = v566
                    end
                else
                    v560 = vu484.Value or ''
                end

                vu486.PlaceholderText = v560 == '' and ('...' or v560) or v560
            end
            function vu484.GetActiveValues(_)
                if not pu483.Multi then
                    return vu484.Value and 1 or 0
                end

                local v567 = next
                local v568 = vu484.Value
                local v569 = nil
                local v570 = {}

                while true do
                    local v571

                    v569, v571 = v567(v568, v569)

                    if v569 == nil then
                        break
                    end

                    table.insert(v570, v569)
                end

                return v570
            end
            function vu484.SetActiveValues(_, p572)
                vu484.Value = p572

                vu13:SafeCallback(vu484.Callback, vu484.Value)
                vu13:SafeCallback(vu484.Changed, vu484.Value)
                vu484:BuildDropdownList()
            end

            local function vu593(p573, pu574)
                local vu575 = {}
                local vu576 = vu260('Frame', {
                    Size = UDim2.fromOffset(4, 16),
                    BackgroundColor3 = Color3.fromRGB(76, 194, 255),
                    Position = UDim2.fromOffset(- 1, 18),
                    AnchorPoint = Vector2.new(0, 0.5),
                    ThemeTag = {
                        BackgroundColor3 = 'Accent',
                    },
                }, {
                    vu260('UICorner', {
                        CornerRadius = UDim.new(0, 2),
                    }),
                })
                local v577 = vu260('TextLabel', {
                    FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
                    Text = tostring(pu574),
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromOffset(12, 0),
                    Name = 'ButtonLabel',
                    AutoLocalize = false,
                    ThemeTag = {
                        TextColor3 = 'Text',
                    },
                })
                local v578 = vu260('ImageLabel', {
                    Image = 'rbxassetid://10709791437',
                    Size = UDim2.fromOffset(14, 14),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, - 8, 0.5, 0),
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    ThemeTag = {
                        ImageColor3 = 'Accent',
                    },
                })
                local v579 = vu260('TextButton', {
                    Size = UDim2.new(1, - 8, 0, 36),
                    BackgroundTransparency = 1,
                    ZIndex = 23,
                    Text = '',
                    Parent = vu497,
                    LayoutOrder = p573,
                    ThemeTag = {
                        BackgroundColor3 = 'DropdownOption',
                    },
                }, {
                    vu576,
                    v577,
                    v578,
                    vu260('UICorner', {
                        CornerRadius = UDim.new(0, 8),
                    }),
                    vu260('UIStroke', {
                        Transparency = 0.8,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Color = Color3.fromRGB(100, 100, 120),
                    }),
                })

                v577.TextTransparency = 0

                local vu580

                if pu483.Multi then
                    vu580 = vu484.Value[pu574]
                else
                    vu580 = vu484.Value == pu574
                end

                local _, vu581 = vu147.SpringMotor(1, v579, 'BackgroundTransparency')
                local _, vu582 = vu147.SpringMotor(1, vu576, 'BackgroundTransparency')
                local _, vu583 = vu147.SpringMotor(1, v578, 'ImageTransparency')
                local _, vu584 = vu147.SpringMotor(0.8, v579.UIStroke, 'Transparency')
                local vu585 = vu146.SingleMotor.new(8)
                local v586 = vu585

                vu585.onStep(v586, function(p587)
                    if vu576 and vu576.Parent then
                        vu576.Size = UDim2.new(0, 4, 0, p587)
                    end
                end)
                vu147.AddSignal(v579.MouseEnter, function()
                    vu581(vu580 and 0.82 or 0.88)
                    vu584(vu580 and 0.4 or 0.6)
                end)
                vu147.AddSignal(v579.MouseLeave, function()
                    vu581(vu580 and 0.88 or 1)
                    vu584(vu580 and 0.6 or 0.8)
                end)
                vu147.AddSignal(v579.MouseButton1Down, function()
                    vu581(0.75)
                    vu584(0.2)
                end)
                vu147.AddSignal(v579.MouseButton1Up, function()
                    vu581(vu580 and 0.82 or 0.88)
                    vu584(vu580 and 0.4 or 0.6)
                end)

                function vu575.UpdateButton(_)
                    if pu483.Multi then
                        vu580 = vu484.Value[pu574]

                        if vu580 then
                            vu581(0.88)
                            vu584(0.6)
                        end
                    else
                        vu580 = vu484.Value == pu574

                        vu581(vu580 and 0.88 or 1)
                        vu584(vu580 and 0.6 or 0.8)
                    end

                    vu585:setGoal(vu146.Spring.new(vu580 and 16 or 8, {
                        frequency = 7
                    }))
                    vu582(vu580 and 0 or 1)
                    vu583(vu580 and 0 or 1)
                end

                vu262(v579.Activated, function()
                    local v588 = not vu580

                    if vu484:GetActiveValues() ~= 1 or (v588 or pu483.AllowNull) then
                        if pu483.Multi then
                            vu580 = v588
                            vu484.Value[pu574] = vu580 and true or nil
                        else
                            vu580 = v588
                            vu484.Value = vu580 and pu574 or nil

                            local v589 = next
                            local v590 = vu484.Buttons
                            local v591 = nil

                            while true do
                                local v592

                                v591, v592 = v589(v590, v591)

                                if v591 == nil then
                                    break
                                end

                                v592:UpdateButton()
                            end
                        end

                        vu575:UpdateButton()

                        if not vu484.Searchable or # vu486.Text <= 0 then
                            vu484:Display()
                        end

                        vu13:SafeCallback(vu484.Callback, vu484.Value)
                        vu13:SafeCallback(vu484.Changed, vu484.Value)
                    end
                end)
                vu575:UpdateButton()

                vu484.Buttons[v579] = vu575

                return v579
            end

            function vu484.LoadRequiredItems(_, pu594)
                task.spawn(function()
                    local v595 = next
                    local v596, v597 = vu497:GetChildren()

                    while true do
                        local v598

                        v597, v598 = v595(v596, v597)

                        if v597 == nil then
                            break
                        end
                        if not v598:IsA('UIListLayout') and v598.Name ~= 'LoadingIndicator' then
                            v598:Destroy()
                        end
                    end

                    vu484.Buttons = {}
                    vu484.LoadedItems = 0
                    vu524 = 0

                    local v599, v600, v601 = ipairs(pu594)
                    local v602 = 10
                    local v603 = {}

                    while true do
                        local v604

                        v601, v604 = v599(v600, v601)

                        if v601 == nil then
                            break
                        end

                        local v605 = table.find(vu484.Values, v604)

                        if v605 then
                            for v606 = math.max(1, v605 - v602), math.min(# vu484.Values, v605 + v602) do
                                v603[v606] = true
                            end
                        end
                    end

                    local v607 = 0

                    for v608 = 1, # vu484.Values do
                        if v603[v608] then
                            vu593(v608, vu484.Values[v608])

                            v607 = v607 + 1

                            if vu524 == 0 then
                                local v609 = next
                                local v610 = vu484.Buttons
                                local v611 = nil

                                while true do
                                    local v612

                                    v611, v612 = v609(v610, v611)

                                    if v611 == nil then
                                        break
                                    end
                                    if v611 and (v611.ButtonLabel and (v611.ButtonLabel.TextBounds and vu524 < v611.ButtonLabel.TextBounds.X)) then
                                        vu524 = v611.ButtonLabel.TextBounds.X
                                    end
                                end

                                vu524 = vu524 + 40
                            end
                        end
                    end

                    vu484.LoadedItems = v607

                    vu529()
                    vu525()
                    vu484:Display()
                end)
            end
            function vu484.LoadNextBatch(_)
                if not vu484.IsLoadingBatch and vu484.LoadedItems < # vu484.Values then
                    vu484.IsLoadingBatch = true
                    vu500.Visible = true
                    vu500.LayoutOrder = 9999

                    task.spawn(function()
                        local v613 = vu484.LoadedItems + 1
                        local v614 = math.min(v613 + vu484.BatchSize - 1, # vu484.Values)

                        for v621 = v613, v614 do
                            if vu484.Values[v621] then
                                vu593(v621, vu484.Values[v621])

                                local v616

                                if vu524 ~= 0 then
                                    v616 = v621
                                else
                                    local v617 = next
                                    local v618 = vu484.Buttons

                                    v616 = v621

                                    local v619 = nil

                                    while true do
                                        local v620

                                        v619, v620 = v617(v618, v619)

                                        if v619 == nil then
                                            break
                                        end
                                        if v619 and (v619.ButtonLabel and (v619.ButtonLabel.TextBounds and vu524 < v619.ButtonLabel.TextBounds.X)) then
                                            vu524 = v619.ButtonLabel.TextBounds.X
                                        end
                                    end

                                    vu524 = vu524 + 40
                                end

                                local v621

                                if v621 % 10 ~= 0 then
                                    v621 = v616
                                else
                                    task.wait()

                                    v621 = v616
                                end
                            end
                        end

                        vu484.LoadedItems = v614
                        vu484.IsLoadingBatch = false

                        vu529()

                        if vu484.LoadedItems < # vu484.Values then
                            vu500.Visible = false
                        else
                            vu500.Visible = false
                        end

                        vu525()
                        vu484:Display()
                    end)
                end
            end
            function vu484.BuildDropdownList(_)
                task.spawn(function()
                    local v622 = next
                    local v623, v624 = vu497:GetChildren()

                    while true do
                        local v625

                        v624, v625 = v622(v623, v624)

                        if v624 == nil then
                            break
                        end
                        if not v625:IsA('UIListLayout') and v625.Name ~= 'LoadingIndicator' then
                            v625:Destroy()
                        end
                    end

                    vu484.Buttons = {}
                    vu484.LoadedItems = 0
                    vu524 = 0
                    vu497.CanvasSize = UDim2.fromOffset(0, 0)
                end)
            end
            function vu484.SetValues(_, p626)
                if p626 then
                    vu484.Values = p626
                end

                vu484:BuildDropdownList()
            end
            function vu484.OnChanged(_, p627)
                vu484.Changed = p627

                p627(vu484.Value)
            end
            function vu484.SetValue(_, p628)
                local v629 = false
                local v630 = {}

                if vu484.Multi then
                    local v631 = next
                    local v632 = nil
                    local v633 = {}

                    while true do
                        local v634

                        v632, v634 = v631(p628, v632)

                        if v632 == nil then
                            break
                        end
                        if table.find(vu484.Values, v632) then
                            v633[v632] = true

                            table.insert(v630, v632)
                        end
                    end

                    vu484.Value = v633
                    v629 = next(v633) ~= nil
                elseif p628 then
                    if table.find(vu484.Values, p628) then
                        vu484.Value = p628

                        table.insert(v630, p628)

                        v629 = true
                    end
                else
                    vu484.Value = nil
                end
                if v629 and # v630 > 0 then
                    vu484:LoadRequiredItems(v630)
                else
                    vu484:BuildDropdownList()
                end

                vu13:SafeCallback(vu484.Callback, vu484.Value)
                vu13:SafeCallback(vu484.Changed, vu484.Value)
                wait(0.2)
            end
            function vu484.GetValue(p635)
                return p635.Value
            end
            function vu484.Destroy(_)
                vu485:Destroy()

                vu13.Options[pu482] = nil
            end
            function vu484.IsValueLoaded(_, p636)
                local v637 = next
                local v638 = vu484.Buttons
                local v639 = nil

                while true do
                    local v640

                    v639, v640 = v637(v638, v639)

                    if v639 == nil then
                        break
                    end
                    if v639 and (v639.ButtonLabel and v639.ButtonLabel.Text == tostring(p636)) then
                        return true
                    end
                end

                return false
            end
            function vu484.EnsureValueLoaded(_, p641)
                local v642 = not vu484:IsValueLoaded(p641) and table.find(vu484.Values, p641)

                if v642 then
                    vu593(v642, p641)

                    vu484.LoadedItems = vu484.LoadedItems + 1

                    vu529()
                    vu525()
                end
            end
            function vu484.SetBatchSize(_, p643)
                vu484.BatchSize = math.max(1, p643 or 20)
            end
            function vu484.LoadAllItems(_)
                while vu484.LoadedItems < # vu484.Values do
                    vu484:LoadNextBatch()
                    task.wait()
                end
            end
            function vu484.ClearAll(_)
                if vu484.Multi then
                    vu484.Value = {}

                    local v644 = next
                    local v645 = vu484.Buttons
                    local v646 = nil

                    while true do
                        local v647

                        v646, v647 = v644(v645, v646)

                        if v646 == nil then
                            break
                        end

                        v647:UpdateButton()
                    end

                    vu484:Display()
                    vu13:SafeCallback(vu484.Callback, vu484.Value)
                    vu13:SafeCallback(vu484.Changed, vu484.Value)
                end
            end

            vu484:BuildDropdownList()
            vu484:Display()

            local v648 = {}

            if type(pu483.Default) ~= 'string' then
                if type(pu483.Default) ~= 'table' then
                    if type(pu483.Default) == 'number' and vu484.Values[pu483.Default] ~= nil then
                        table.insert(v648, pu483.Default)
                    end
                else
                    local v649 = next
                    local v650 = pu483.Default
                    local v651 = nil

                    while true do
                        local v652

                        v651, v652 = v649(v650, v651)

                        if v651 == nil then
                            break
                        end

                        local v653 = table.find(vu484.Values, v652)

                        if v653 then
                            table.insert(v648, v653)
                        end
                    end
                end
            else
                local v654 = table.find(vu484.Values, pu483.Default)

                if v654 then
                    table.insert(v648, v654)
                end
            end
            if next(v648) then
                for v655 = 1, # v648 do
                    local v656 = v648[v655]

                    if pu483.Multi then
                        vu484.Value[vu484.Values[v656] ] = true
                    else
                        vu484.Value = vu484.Values[v656]
                    end
                    if not pu483.Multi then
                        break
                    end
                end

                local v657 = {}

                if pu483.Multi then
                    local v658, v659, v660 = pairs(vu484.Value)

                    while true do
                        local v661

                        v660, v661 = v658(v659, v660)

                        if v660 == nil then
                            break
                        end

                        table.insert(v657, v660)
                    end
                elseif vu484.Value then
                    table.insert(v657, vu484.Value)
                end
                if # v657 <= 0 then
                    vu484:BuildDropdownList()
                else
                    vu484:LoadRequiredItems(v657)
                end

                vu484:Display()
            else
                vu484:BuildDropdownList()
                vu484:Display()
            end

            vu13.Options[pu482] = vu484

            return vu484
        end

        return v480
    end)(),
    Paragraph = (function()
        local vu662 = {}

        vu662.__index = vu662
        vu662.__type = 'Paragraph'

        function vu662.New(_, p663)
            assert(p663.Title, 'Paragraph - Missing Title')

            p663.Content = p663.Content or ''

            local v664 = vu259.Element(p663.Title, p663.Content, vu662.Container, false, p663)

            v664.Frame.BackgroundTransparency = 0.92
            v664.Border.Transparency = 0.6
            v664.SetTitle = v664.SetTitle
            v664.SetDesc = v664.SetDesc
            v664.Visible = v664.Visible
            v664.Elements = v664

            return v664
        end

        return vu662
    end)(),
    Slider = (function()
        local v665 = {}

        v665.__index = v665
        v665.__type = 'Slider'

        function v665.New(p666, pu667, p668)
            assert(p668.Title, 'Slider - Missing Title.')
            assert(p668.Default, 'Slider - Missing default value.')
            assert(p668.Min, 'Slider - Missing minimum value.')
            assert(p668.Max, 'Slider - Missing maximum value.')
            assert(p668.Rounding, 'Slider - Missing rounding value.')

            local vu669 = {
                Value = nil,
                Min = p668.Min,
                Max = p668.Max,
                Rounding = p668.Rounding,
                Callback = p668.Callback or function(_)
                end,
                Type = 'Slider',
            }
            local vu670 = false
            local vu671 = vu259.Element(p668.Title, p668.Description, p666.Container, false, p668)

            vu671.DescLabel.Size = UDim2.new(1, - 170, 0, 14)
            vu669.Elements = vu671
            vu669.SetTitle = vu671.SetTitle
            vu669.SetDesc = vu671.SetDesc
            vu669.Visible = vu671.Visible

            local vu672 = vu260('ImageLabel', {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, - 7, 0.5, 0),
                Size = UDim2.fromOffset(14, 14),
                Image = 'http://www.roblox.com/asset/?id=12266946128',
                ThemeTag = {
                    ImageColor3 = 'Accent',
                },
            })
            local vu673 = vu260('Frame', {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(7, 0),
                Size = UDim2.new(1, - 14, 1, 0),
            }, {
                vu672
            })
            local vu674 = vu260('Frame', {
                Size = UDim2.new(0, 0, 1, 0),
                ThemeTag = {
                    BackgroundColor3 = 'Accent',
                },
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(1, 0),
                }),
            })
            local vu675 = vu260('TextBox', {
                FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json'),
                Text = p668.Default,
                PlaceholderText = '',
                TextSize = 12,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Right,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 100, 0, 14),
                Position = UDim2.new(0, - 4, 0.5, 0),
                AnchorPoint = Vector2.new(1, 0.5),
                ThemeTag = {
                    TextColor3 = 'SubText',
                },
            })

            vu260('Frame', {
                Size = UDim2.new(1, 0, 0, 4),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, - 10, 0.5, 0),
                BackgroundTransparency = 0.4,
                Parent = vu671.Frame,
                ThemeTag = {
                    BackgroundColor3 = 'SliderRail',
                },
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(1, 0),
                }),
                vu260('UISizeConstraint', {
                    MaxSize = Vector2.new(150, math.huge),
                }),
                vu675,
                vu674,
                vu673,
            })
            vu262(vu675.FocusLost, function(p676)
                local v677 = vu675.Text

                if p676 then
                    vu669:SetValue(tonumber(v677))
                end
            end)

            local v678 = vu675

            vu262(vu675.GetPropertyChangedSignal(v678, 'Text'), function()
                if # vu675.Text > 0 and tonumber(vu675.Text) then
                    vu669:SetValue(vu675.Text)
                end
            end)
            vu147.AddSignal(vu672.InputBegan, function(p679)
                if p679.UserInputType == Enum.UserInputType.MouseButton1 or p679.UserInputType == Enum.UserInputType.Touch then
                    vu670 = true
                end
            end)
            vu147.AddSignal(vu672.InputEnded, function(p680)
                if p680.UserInputType == Enum.UserInputType.MouseButton1 or p680.UserInputType == Enum.UserInputType.Touch then
                    vu670 = false
                end
            end)
            vu147.AddSignal(vu3.InputChanged, function(p681)
                if vu670 and (p681.UserInputType == Enum.UserInputType.MouseMovement or p681.UserInputType == Enum.UserInputType.Touch) then
                    local v682 = math.clamp((p681.Position.X - vu673.AbsolutePosition.X) / vu673.AbsoluteSize.X, 0, 1)

                    vu669:SetValue(vu669.Min + (vu669.Max - vu669.Min) * v682)
                end
            end)

            function vu669.OnChanged(_, p683)
                vu669.Changed = p683

                p683(vu669.Value)
            end
            function vu669.SetValue(p684, p685)
                local v686 = p685 or p684.Value

                if not tonumber(v686) and v686:len() > 0 then
                    v686 = p684.Value
                end

                p684.Value = vu13:Round(math.clamp(v686, vu669.Min, vu669.Max), vu669.Rounding) or 0
                vu672.Position = UDim2.new((p684.Value - vu669.Min) / (vu669.Max - vu669.Min), - 7, 0.5, 0)
                vu674.Size = UDim2.fromScale((p684.Value - vu669.Min) / (vu669.Max - vu669.Min), 1)
                vu675.Text = tostring(p684.Value)

                vu13:SafeCallback(vu669.Callback, p684.Value)
                vu13:SafeCallback(vu669.Changed, p684.Value)
            end
            function vu669.GetValue(p687)
                return p687.Value
            end
            function vu669.Destroy(_)
                vu671:Destroy()

                vu13.Options[pu667] = nil
            end

            vu669:SetValue(p668.Default)

            vu13.Options[pu667] = vu669

            return vu669
        end

        return v665
    end)(),
    Keybind = (function()
        local v688 = {}

        v688.__index = v688
        v688.__type = 'Keybind'

        function v688.New(p689, pu690, p691)
            assert(p691.Title, 'KeyBind - Missing Title')
            assert(p691.Default, 'KeyBind - Missing default value.')

            local vu692 = {
                Value = p691.Default,
                Toggled = false,
                Mode = p691.Mode or 'Toggle',
                Type = 'Keybind',
                Callback = p691.Callback or function(_)
                end,
                ChangedCallback = p691.ChangedCallback or function(_)
                end,
            }
            local vu693 = false
            local vu694 = vu259.Element(p691.Title, p691.Description, p689.Container, true)

            vu692.SetTitle = vu694.SetTitle
            vu692.SetDesc = vu694.SetDesc
            vu692.Visible = vu694.Visible
            vu692.Elements = vu694

            local vu695 = vu260('TextLabel', {
                FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                Text = p691.Default,
                TextColor3 = Color3.fromRGB(240, 240, 240),
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Center,
                Size = UDim2.new(0, 0, 0, 14),
                Position = UDim2.new(0, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                AutoLocalize = false,
                ThemeTag = {
                    TextColor3 = 'Text',
                },
            })
            local v696 = vu260('TextButton', {
                Size = UDim2.fromOffset(0, 30),
                Position = UDim2.new(1, - 10, 0.5, 0),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundTransparency = 0.9,
                Parent = vu694.Frame,
                AutomaticSize = Enum.AutomaticSize.X,
                ThemeTag = {
                    BackgroundColor3 = 'Keybind',
                },
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 5),
                }),
                vu260('UIPadding', {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                }),
                vu260('UIStroke', {
                    Transparency = 0.5,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    ThemeTag = {
                        Color = 'InElementBorder',
                    },
                }),
                vu695,
            })

            function vu692.GetState(_)
                if vu3:GetFocusedTextBox() and vu692.Mode ~= 'Always' then
                    return false
                end
                if vu692.Mode == 'Always' then
                    return true
                end
                if vu692.Mode ~= 'Hold' then
                    return vu692.Toggled
                end
                if vu692.Value == 'None' then
                    return false
                end

                local v697 = vu692.Value

                if v697 ~= 'MouseLeft' and v697 ~= 'MouseRight' then
                    return vu3:IsKeyDown(Enum.KeyCode[vu692.Value])
                end

                local v698 = v697 == 'MouseLeft' and vu3:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)

                if not v698 then
                    if v697 == 'MouseRight' then
                        v698 = vu3:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
                    else
                        v698 = false
                    end
                end

                return v698
            end
            function vu692.SetValue(_, p699, p700)
                local v701 = p699 or vu692.Key
                local v702 = p700 or vu692.Mode

                vu695.Text = v701
                vu692.Value = v701
                vu692.Mode = v702
            end
            function vu692.GetValue(p703)
                return p703.Value
            end
            function vu692.OnClick(_, p704)
                vu692.Clicked = p704
            end
            function vu692.OnChanged(_, p705)
                vu692.Changed = p705

                p705(vu692.Value)
            end
            function vu692.DoClick(_)
                vu13:SafeCallback(vu692.Callback, vu692.Toggled)
                vu13:SafeCallback(vu692.Clicked, vu692.Toggled)
            end
            function vu692.Destroy(_)
                vu694:Destroy()

                vu13.Options[pu690] = nil
            end

            vu147.AddSignal(v696.InputBegan, function(p706)
                if p706.UserInputType == Enum.UserInputType.MouseButton1 or p706.UserInputType == Enum.UserInputType.Touch then
                    vu693 = true
                    vu695.Text = '...'

                    wait()

                    local vu707 = nil

                    vu707 = vu3.InputBegan:Connect(function(p708)
                        local v709 = nil
                        local vu710

                        if p708.UserInputType ~= Enum.UserInputType.Keyboard then
                            vu710 = p708.UserInputType == Enum.UserInputType.MouseButton1 and 'MouseLeft' or (p708.UserInputType == Enum.UserInputType.MouseButton2 and 'MouseRight' or v709)
                        else
                            vu710 = p708.KeyCode.Name
                        end

                        local vu711 = nil

                        vu711 = vu3.InputEnded:Connect(function(p712)
                            if p712.KeyCode.Name == vu710 or vu710 == 'MouseLeft' and p712.UserInputType == Enum.UserInputType.MouseButton1 or vu710 == 'MouseRight' and p712.UserInputType == Enum.UserInputType.MouseButton2 then
                                vu693 = false
                                vu695.Text = vu710
                                vu692.Value = vu710

                                vu13:SafeCallback(vu692.ChangedCallback, p712.KeyCode or p712.UserInputType)
                                vu13:SafeCallback(vu692.Changed, p712.KeyCode or p712.UserInputType)
                                vu707:Disconnect()
                                vu711:Disconnect()
                            end
                        end)
                    end)
                end
            end)
            vu147.AddSignal(vu3.InputBegan, function(p713)
                if not vu693 and (not vu3:GetFocusedTextBox() and vu692.Mode == 'Toggle') then
                    local v714 = vu692.Value

                    if v714 == 'MouseLeft' or v714 == 'MouseRight' then
                        if v714 == 'MouseLeft' and p713.UserInputType == Enum.UserInputType.MouseButton1 or v714 == 'MouseRight' and p713.UserInputType == Enum.UserInputType.MouseButton2 then
                            vu692.Toggled = not vu692.Toggled

                            vu692:DoClick()
                        end
                    elseif p713.UserInputType == Enum.UserInputType.Keyboard and p713.KeyCode.Name == v714 then
                        vu692.Toggled = not vu692.Toggled

                        vu692:DoClick()
                    end
                end
            end)

            vu13.Options[pu690] = vu692

            return vu692
        end

        return v688
    end)(),
    Colorpicker = (function()
        local vu715 = {}

        vu715.__index = vu715
        vu715.__type = 'Colorpicker'

        function vu715.New(p716, pu717, pu718)
            assert(pu718.Title, 'Colorpicker - Missing Title')
            assert(pu718.Default, 'AddColorPicker: Missing default value.')

            local vu723 = {
                Value = pu718.Default,
                Transparency = pu718.Transparency or 0,
                Type = 'Colorpicker',
                Title = type(pu718.Title) ~= 'string' and 'Colorpicker' or (pu718.Title or 'Colorpicker'),
                Callback = pu718.Callback or function(_)
                end,
                SetHSVFromRGB = function(_, p719)
                    local v720, v721, v722 = Color3.toHSV(p719)

                    vu723.Hue = v720
                    vu723.Sat = v721
                    vu723.Vib = v722
                end,
            }

            vu723:SetHSVFromRGB(vu723.Value)

            local vu724 = vu259.Element(pu718.Title, pu718.Description, p716.Container, true)

            vu723.SetTitle = vu724.SetTitle
            vu723.SetDesc = vu724.SetDesc
            vu723.Visible = vu724.Visible
            vu723.Elements = vu724

            local vu725 = vu260('Frame', {
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = vu723.Value,
                Parent = vu724.Frame,
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 4),
                }),
            })

            vu260('ImageLabel', {
                Size = UDim2.fromOffset(26, 26),
                Position = UDim2.new(1, - 10, 0.5, 0),
                AnchorPoint = Vector2.new(1, 0.5),
                Parent = vu724.Frame,
                Image = 'http://www.roblox.com/asset/?id=14204231522',
                ImageTransparency = 0.45,
                ScaleType = Enum.ScaleType.Tile,
                TileSize = UDim2.fromOffset(40, 40),
            }, {
                vu260('UICorner', {
                    CornerRadius = UDim.new(0, 4),
                }),
                vu725,
            })

            local function vu808()
                local vu726 = vu259.Dialog:Create()

                vu726.Title.Text = vu723.Title
                vu726.Root.Size = UDim2.fromOffset(430, 330)

                local vu727 = vu723.Hue
                local vu728 = vu723.Sat
                local vu729 = vu723.Vib
                local vu730 = vu723.Transparency

                local function v732()
                    local v731 = vu259.Textbox()

                    v731.Frame.Parent = vu726.Root
                    v731.Frame.Size = UDim2.new(0, 90, 0, 32)

                    return v731
                end
                local function v737(p733, p734)
                    local v735 = vu260
                    local v736 = {
                        FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
                        Text = p733,
                        TextColor3 = Color3.fromRGB(240, 240, 240),
                        TextSize = 13,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.new(1, 0, 0, 32),
                        Position = p734,
                        BackgroundTransparency = 1,
                        Parent = vu726.Root,
                        AutoLocalize = false,
                        ThemeTag = {
                            TextColor3 = 'Text',
                        },
                    }

                    return v735('TextLabel', v736)
                end
                local function vu739()
                    local v738 = Color3.fromHSV(vu727, vu728, vu729)

                    return {
                        R = math.floor(v738.r * 255),
                        G = math.floor(v738.g * 255),
                        B = math.floor(v738.b * 255),
                    }
                end

                local vu740 = vu260('ImageLabel', {
                    Size = UDim2.new(0, 18, 0, 18),
                    ScaleType = Enum.ScaleType.Fit,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Image = 'http://www.roblox.com/asset/?id=4805639000',
                })
                local vu741 = vu260('ImageLabel', {
                    Size = UDim2.fromOffset(180, 160),
                    Position = UDim2.fromOffset(20, 55),
                    Image = 'rbxassetid://4155801252',
                    BackgroundColor3 = vu723.Value,
                    BackgroundTransparency = 0,
                    Parent = vu726.Root,
                }, {
                    vu260('UICorner', {
                        CornerRadius = UDim.new(0, 4),
                    }),
                    vu740,
                })
                local v742 = vu260('Frame', {
                    BackgroundColor3 = vu723.Value,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = vu723.Transparency,
                }, {
                    vu260('UICorner', {
                        CornerRadius = UDim.new(0, 4),
                    }),
                })

                vu260('ImageLabel', {
                    Image = 'http://www.roblox.com/asset/?id=14204231522',
                    ImageTransparency = 0.45,
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2.fromOffset(40, 40),
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(112, 220),
                    Size = UDim2.fromOffset(88, 24),
                    Parent = vu726.Root,
                }, {
                    vu260('UICorner', {
                        CornerRadius = UDim.new(0, 4),
                    }),
                    vu260('UIStroke', {
                        Thickness = 2,
                        Transparency = 0.75,
                    }),
                    v742,
                })

                local vu743 = vu260('Frame', {
                    BackgroundColor3 = vu723.Value,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 0,
                }, {
                    vu260('UICorner', {
                        CornerRadius = UDim.new(0, 4),
                    }),
                })

                vu260('ImageLabel', {
                    Image = 'http://www.roblox.com/asset/?id=14204231522',
                    ImageTransparency = 0.45,
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2.fromOffset(40, 40),
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(20, 220),
                    Size = UDim2.fromOffset(88, 24),
                    Parent = vu726.Root,
                }, {
                    vu260('UICorner', {
                        CornerRadius = UDim.new(0, 4),
                    }),
                    vu260('UIStroke', {
                        Thickness = 2,
                        Transparency = 0.75,
                    }),
                    vu743,
                })

                local vu744 = vu728
                local vu745 = vu727
                local vu746 = vu729
                local v747 = vu726
                local v748 = {}

                for v749 = 0, 1, 0.1 do
                    local v750 = v749

                    table.insert(v748, ColorSequenceKeypoint.new(v750, Color3.fromHSV(v750, 1, 1)))
                end

                local v751 = vu260('UIGradient', {
                    Color = ColorSequence.new(v748),
                    Rotation = 90,
                })
                local v752 = vu260('Frame', {
                    Size = UDim2.new(1, 0, 1, - 10),
                    Position = UDim2.fromOffset(0, 5),
                    BackgroundTransparency = 1,
                })
                local vu753 = vu260('ImageLabel', {
                    Size = UDim2.fromOffset(14, 14),
                    Image = 'http://www.roblox.com/asset/?id=12266946128',
                    Parent = v752,
                    ThemeTag = {
                        ImageColor3 = 'DialogInput',
                    },
                })
                local vu754 = vu260('Frame', {
                    Size = UDim2.fromOffset(12, 190),
                    Position = UDim2.fromOffset(210, 55),
                    Parent = v747.Root,
                }, {
                    vu260('UICorner', {
                        CornerRadius = UDim.new(1, 0),
                    }),
                    v751,
                    v752,
                })
                local vu755 = v732()

                vu755.Frame.Position = UDim2.fromOffset(pu718.Transparency and 260 or 240, 55)

                v737('Hex', UDim2.fromOffset(pu718.Transparency and 360 or 340, 55))

                local vu756 = v732()

                vu756.Frame.Position = UDim2.fromOffset(pu718.Transparency and 260 or 240, 95)

                v737('Red', UDim2.fromOffset(pu718.Transparency and 360 or 340, 95))

                local vu757 = v732()

                vu757.Frame.Position = UDim2.fromOffset(pu718.Transparency and 260 or 240, 135)

                v737('Green', UDim2.fromOffset(pu718.Transparency and 360 or 340, 135))

                local vu758 = v732()

                vu758.Frame.Position = UDim2.fromOffset(pu718.Transparency and 260 or 240, 175)

                v737('Blue', UDim2.fromOffset(pu718.Transparency and 360 or 340, 175))

                local vu759

                if pu718.Transparency then
                    vu759 = v732()
                    vu759.Frame.Position = UDim2.fromOffset(260, 215)

                    v737('Alpha', UDim2.fromOffset(360, 215))
                else
                    vu759 = nil
                end

                local vu760, vu761, vu762

                if pu718.Transparency then
                    local v763 = vu260('Frame', {
                        Size = UDim2.new(1, 0, 1, - 10),
                        Position = UDim2.fromOffset(0, 5),
                        BackgroundTransparency = 1,
                    })

                    vu760 = vu260('ImageLabel', {
                        Size = UDim2.fromOffset(14, 14),
                        Image = 'http://www.roblox.com/asset/?id=12266946128',
                        Parent = v763,
                        ThemeTag = {
                            ImageColor3 = 'DialogInput',
                        },
                    })
                    vu761 = vu260('Frame', {
                        Size = UDim2.fromScale(1, 1),
                    }, {
                        vu260('UIGradient', {
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 0),
                                NumberSequenceKeypoint.new(1, 1),
                            }),
                            Rotation = 270,
                        }),
                        vu260('UICorner', {
                            CornerRadius = UDim.new(1, 0),
                        }),
                    })
                    vu762 = vu260('Frame', {
                        Size = UDim2.fromOffset(12, 190),
                        Position = UDim2.fromOffset(230, 55),
                        Parent = v747.Root,
                        BackgroundTransparency = 1,
                    }, {
                        vu260('UICorner', {
                            CornerRadius = UDim.new(1, 0),
                        }),
                        vu260('ImageLabel', {
                            Image = 'http://www.roblox.com/asset/?id=14204231522',
                            ImageTransparency = 0.45,
                            ScaleType = Enum.ScaleType.Tile,
                            TileSize = UDim2.fromOffset(40, 40),
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 1),
                            Parent = v747.Root,
                        }, {
                            vu260('UICorner', {
                                CornerRadius = UDim.new(1, 0),
                            }),
                        }),
                        vu761,
                        v763,
                    })
                else
                    vu760 = nil
                    vu762 = nil
                    vu761 = nil
                end

                local function vu765()
                    vu741.BackgroundColor3 = Color3.fromHSV(vu745, 1, 1)
                    vu753.Position = UDim2.new(0, - 1, vu745, - 6)
                    vu740.Position = UDim2.new(vu744, 0, 1 - vu746, 0)
                    vu743.BackgroundColor3 = Color3.fromHSV(vu745, vu744, vu746)
                    vu755.Input.Text = '#' .. Color3.fromHSV(vu745, vu744, vu746):ToHex()
                    vu756.Input.Text = vu739().R
                    vu757.Input.Text = vu739().G
                    vu758.Input.Text = vu739().B

                    if pu718.Transparency then
                        vu761.BackgroundColor3 = Color3.fromHSV(vu745, vu744, vu746)
                        vu743.BackgroundTransparency = vu730
                        vu760.Position = UDim2.new(0, - 1, 1 - vu730, - 6)

                        local v764 = vu13

                        vu759.Input.Text = v764:Round((1 - vu730) * 100, 0) .. '%'
                    end
                end

                vu147.AddSignal(vu755.Input.FocusLost, function(p766)
                    if p766 then
                        local v767, v768 = pcall(Color3.fromHex, vu755.Input.Text)

                        if v767 and typeof(v768) == 'Color3' then
                            local v769, v770, v771 = Color3.toHSV(v768)

                            vu746 = v771
                            vu744 = v770
                            vu745 = v769
                        end
                    end

                    vu765()
                end)
                vu147.AddSignal(vu756.Input.FocusLost, function(p772)
                    if p772 then
                        local v773 = vu739()
                        local v774, v775 = pcall(Color3.fromRGB, vu756.Input.Text, v773.G, v773.B)

                        if v774 and (typeof(v775) == 'Color3' and tonumber(vu756.Input.Text) <= 255) then
                            local v776, v777, v778 = Color3.toHSV(v775)

                            vu746 = v778
                            vu744 = v777
                            vu745 = v776
                        end
                    end

                    vu765()
                end)
                vu147.AddSignal(vu757.Input.FocusLost, function(p779)
                    if p779 then
                        local v780 = vu739()
                        local v781, v782 = pcall(Color3.fromRGB, v780.R, vu757.Input.Text, v780.B)

                        if v781 and (typeof(v782) == 'Color3' and tonumber(vu757.Input.Text) <= 255) then
                            local v783, v784, v785 = Color3.toHSV(v782)

                            vu746 = v785
                            vu744 = v784
                            vu745 = v783
                        end
                    end

                    vu765()
                end)
                vu147.AddSignal(vu758.Input.FocusLost, function(p786)
                    if p786 then
                        local v787 = vu739()
                        local v788, v789 = pcall(Color3.fromRGB, v787.R, v787.G, vu758.Input.Text)

                        if v788 and (typeof(v789) == 'Color3' and tonumber(vu758.Input.Text) <= 255) then
                            local v790, v791, v792 = Color3.toHSV(v789)

                            vu746 = v792
                            vu744 = v791
                            vu745 = v790
                        end
                    end

                    vu765()
                end)

                if pu718.Transparency then
                    vu147.AddSignal(vu759.Input.FocusLost, function(p793)
                        if p793 then
                            pcall(function()
                                local v794 = tonumber(vu759.Input.Text)

                                if 0 <= v794 and v794 <= 100 then
                                    vu730 = 1 - v794 * 0.01
                                end
                            end)
                        end

                        vu765()
                    end)
                end

                vu147.AddSignal(vu741.InputBegan, function(p795)
                    if p795.UserInputType == Enum.UserInputType.MouseButton1 or p795.UserInputType == Enum.UserInputType.Touch then
                        while vu3:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            local v796 = vu741.AbsolutePosition.X
                            local v797 = v796 + vu741.AbsoluteSize.X
                            local v798 = math.clamp(vu7.X, v796, v797)
                            local v799 = vu741.AbsolutePosition.Y
                            local v800 = v799 + vu741.AbsoluteSize.Y
                            local v801 = math.clamp(vu7.Y, v799, v800)

                            vu744 = (v798 - v796) / (v797 - v796)
                            vu746 = 1 - (v801 - v799) / (v800 - v799)

                            vu765()
                            vu9:Wait()
                        end
                    end
                end)
                vu147.AddSignal(vu754.InputBegan, function(p802)
                    if p802.UserInputType == Enum.UserInputType.MouseButton1 or p802.UserInputType == Enum.UserInputType.Touch then
                        while vu3:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            local v803 = vu754.AbsolutePosition.Y
                            local v804 = v803 + vu754.AbsoluteSize.Y

                            vu745 = (math.clamp(vu7.Y, v803, v804) - v803) / (v804 - v803)

                            vu765()
                            vu9:Wait()
                        end
                    end
                end)

                if pu718.Transparency then
                    vu147.AddSignal(vu762.InputBegan, function(p805)
                        if p805.UserInputType == Enum.UserInputType.MouseButton1 then
                            while vu3:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                local v806 = vu762.AbsolutePosition.Y
                                local v807 = v806 + vu762.AbsoluteSize.Y

                                vu730 = 1 - (math.clamp(vu7.Y, v806, v807) - v806) / (v807 - v806)

                                vu765()
                                vu9:Wait()
                            end
                        end
                    end)
                end

                vu765()
                v747:Button('Done', function()
                    vu723:SetValue({
                        vu745,
                        vu744,
                        vu746
                    }, vu730)
                end)
                v747:Button('Cancel')
                v747:Open()
            end

            function vu723.Display(_)
                vu723.Value = Color3.fromHSV(vu723.Hue, vu723.Sat, vu723.Vib)
                vu725.BackgroundColor3 = vu723.Value
                vu725.BackgroundTransparency = vu723.Transparency

                vu715.Library:SafeCallback(vu723.Callback, vu723.Value)
                vu715.Library:SafeCallback(vu723.Changed, vu723.Value)
            end
            function vu723.SetValue(_, p809, p810)
                local v811 = Color3.fromHSV(p809[1], p809[2], p809[3])

                vu723.Transparency = p810 or 0

                vu723:SetHSVFromRGB(v811)
                vu723:Display()
            end
            function vu723.SetValueRGB(_, p812, p813)
                vu723.Transparency = p813 or 0

                vu723:SetHSVFromRGB(p812)
                vu723:Display()
            end
            function vu723.OnChanged(_, p814)
                vu723.Changed = p814

                p814(vu723.Value)
            end
            function vu723.Destroy(_)
                vu724:Destroy()

                vu13.Options[pu717] = nil
            end

            vu147.AddSignal(vu724.Frame.MouseButton1Click, function()
                vu808()
            end)
            vu723:Display()

            vu13.Options[pu717] = vu723

            return vu723
        end

        return vu715
    end)(),
    Input = (function()
        local v815 = {}

        v815.__index = v815
        v815.__type = 'Input'

        function v815.New(p816, pu817, pu818)
            assert(pu818.Title, 'Input - Missing Title')

            pu818.Callback = pu818.Callback or function()
            end

            local vu819 = {
                Value = pu818.Default or '',
                Numeric = pu818.Numeric or false,
                Finished = pu818.Finished or false,
                Callback = pu818.Callback or function(_)
                end,
                Type = 'Input',
            }
            local vu820 = vu259.Element(pu818.Title, pu818.Description, p816.Container, false)

            vu820.DescLabel.Size = UDim2.new(1, - 170, 0, 14)
            vu819.SetTitle = vu820.SetTitle
            vu819.SetDesc = vu820.SetDesc
            vu819.Visible = vu820.Visible
            vu819.Elements = vu820

            local v821 = vu259.Textbox(vu820.Frame, true)

            v821.Frame.Position = UDim2.new(1, - 10, 0.5, 0)
            v821.Frame.AnchorPoint = Vector2.new(1, 0.5)
            v821.Frame.Size = UDim2.fromOffset(160, 30)
            v821.Input.Text = pu818.Default or ''
            v821.Input.PlaceholderText = pu818.Placeholder or ''
            v821.MultiLine = pu818.MultiLine or false

            local vu822 = v821.Input

            function vu819.SetValue(_, p823)
                if pu818.MaxLength and # p823 > pu818.MaxLength then
                    p823 = p823:sub(1, pu818.MaxLength)
                end
                if vu819.Numeric and (not tonumber(p823) and p823:len() > 0) then
                    p823 = vu819.Value
                end

                vu819.Value = p823
                vu822.Text = p823

                vu13:SafeCallback(vu819.Callback, vu819.Value)
                vu13:SafeCallback(vu819.Changed, vu819.Value)
                wait(0.2)
            end
            function vu819.GetValue(p824)
                return p824.Value
            end

            if vu819.Finished then
                vu262(vu822.FocusLost, function(p825)
                    if p825 then
                        vu819:SetValue(vu822.Text)
                    end
                end)
            else
                local v826 = vu822

                vu262(vu822.GetPropertyChangedSignal(v826, 'Text'), function()
                    vu819:SetValue(vu822.Text)
                end)
            end

            function vu819.OnChanged(_, p827)
                vu819.Changed = p827

                p827(vu819.Value)
            end
            function vu819.Destroy(_)
                vu820:Destroy()

                vu13.Options[pu817] = nil
            end

            vu13.Options[pu817] = vu819

            return vu819
        end

        return v815
    end)(),
}
local vu829 = vu259.Notification

vu829:Init(vu206)

local _ = vu147.New
local vu830 = {['lucide-accessibility'] = 'rbxassetid://10709751939',['lucide-activity'] = 'rbxassetid://10709752035',['lucide-air-vent'] = 'rbxassetid://10709752131',['lucide-airplay'] = 'rbxassetid://10709752254',['lucide-alarm-check'] = 'rbxassetid://10709752405',['lucide-alarm-clock'] = 'rbxassetid://10709752630',['lucide-alarm-clock-off'] = 'rbxassetid://10709752508',['lucide-alarm-minus'] = 'rbxassetid://10709752732',['lucide-alarm-plus'] = 'rbxassetid://10709752825',['lucide-album'] = 'rbxassetid://10709752906',['lucide-alert-circle'] = 'rbxassetid://10709752996',['lucide-alert-octagon'] = 'rbxassetid://10709753064',['lucide-alert-triangle'] = 'rbxassetid://10709753149',['lucide-align-center'] = 'rbxassetid://10709753570',['lucide-align-center-horizontal'] = 'rbxassetid://10709753272',['lucide-align-center-vertical'] = 'rbxassetid://10709753421',['lucide-align-end-horizontal'] = 'rbxassetid://10709753692',['lucide-align-end-vertical'] = 'rbxassetid://10709753808',['lucide-align-horizontal-distribute-center'] = 'rbxassetid://10747779791',['lucide-align-horizontal-distribute-end'] = 'rbxassetid://10747784534',['lucide-align-horizontal-distribute-start'] = 'rbxassetid://10709754118',['lucide-align-horizontal-justify-center'] = 'rbxassetid://10709754204',['lucide-align-horizontal-justify-end'] = 'rbxassetid://10709754317',['lucide-align-horizontal-justify-start'] = 'rbxassetid://10709754436',['lucide-align-horizontal-space-around'] = 'rbxassetid://10709754590',['lucide-align-horizontal-space-between'] = 'rbxassetid://10709754749',['lucide-align-justify'] = 'rbxassetid://10709759610',['lucide-align-left'] = 'rbxassetid://10709759764',['lucide-align-right'] = 'rbxassetid://10709759895',['lucide-align-start-horizontal'] = 'rbxassetid://10709760051',['lucide-align-start-vertical'] = 'rbxassetid://10709760244',['lucide-align-vertical-distribute-center'] = 'rbxassetid://10709760351',['lucide-align-vertical-distribute-end'] = 'rbxassetid://10709760434',['lucide-align-vertical-distribute-start'] = 'rbxassetid://10709760612',['lucide-align-vertical-justify-center'] = 'rbxassetid://10709760814',['lucide-align-vertical-justify-end'] = 'rbxassetid://10709761003',['lucide-align-vertical-justify-start'] = 'rbxassetid://10709761176',['lucide-align-vertical-space-around'] = 'rbxassetid://10709761324',['lucide-align-vertical-space-between'] = 'rbxassetid://10709761434',['lucide-anchor'] = 'rbxassetid://10709761530',['lucide-angry'] = 'rbxassetid://10709761629',['lucide-annoyed'] = 'rbxassetid://10709761722',['lucide-aperture'] = 'rbxassetid://10709761813',['lucide-apple'] = 'rbxassetid://10709761889',['lucide-archive'] = 'rbxassetid://10709762233',['lucide-archive-restore'] = 'rbxassetid://10709762058',['lucide-armchair'] = 'rbxassetid://10709762327',['lucide-anvil'] = 'rbxassetid://77943964625400',['lucide-arrow-big-down'] = 'rbxassetid://10747796644',['lucide-arrow-big-left'] = 'rbxassetid://10709762574',['lucide-arrow-big-right'] = 'rbxassetid://10709762727',['lucide-arrow-big-up'] = 'rbxassetid://10709762879',['lucide-arrow-down'] = 'rbxassetid://10709767827',['lucide-arrow-down-circle'] = 'rbxassetid://10709763034',['lucide-arrow-down-left'] = 'rbxassetid://10709767656',['lucide-arrow-down-right'] = 'rbxassetid://10709767750',['lucide-arrow-left'] = 'rbxassetid://10709768114',['lucide-arrow-left-circle'] = 'rbxassetid://10709767936',['lucide-arrow-left-right'] = 'rbxassetid://10709768019',['lucide-arrow-right'] = 'rbxassetid://10709768347',['lucide-arrow-right-circle'] = 'rbxassetid://10709768226',['lucide-arrow-up'] = 'rbxassetid://10709768939',['lucide-arrow-up-circle'] = 'rbxassetid://10709768432',['lucide-arrow-up-down'] = 'rbxassetid://10709768538',['lucide-arrow-up-left'] = 'rbxassetid://10709768661',['lucide-arrow-up-right'] = 'rbxassetid://10709768787',['lucide-asterisk'] = 'rbxassetid://10709769095',['lucide-at-sign'] = 'rbxassetid://10709769286',['lucide-award'] = 'rbxassetid://10709769406',['lucide-axe'] = 'rbxassetid://10709769508',['lucide-axis-3d'] = 'rbxassetid://10709769598',['lucide-baby'] = 'rbxassetid://10709769732',['lucide-backpack'] = 'rbxassetid://10709769841',['lucide-baggage-claim'] = 'rbxassetid://10709769935',['lucide-banana'] = 'rbxassetid://10709770005',['lucide-banknote'] = 'rbxassetid://10709770178',['lucide-bar-chart'] = 'rbxassetid://10709773755',['lucide-bar-chart-2'] = 'rbxassetid://10709770317',['lucide-bar-chart-3'] = 'rbxassetid://10709770431',['lucide-bar-chart-4'] = 'rbxassetid://10709770560',['lucide-bar-chart-horizontal'] = 'rbxassetid://10709773669',['lucide-barcode'] = 'rbxassetid://10747360675',['lucide-baseline'] = 'rbxassetid://10709773863',['lucide-bath'] = 'rbxassetid://10709773963',['lucide-battery'] = 'rbxassetid://10709774640',['lucide-battery-charging'] = 'rbxassetid://10709774068',['lucide-battery-full'] = 'rbxassetid://10709774206',['lucide-battery-low'] = 'rbxassetid://10709774370',['lucide-battery-medium'] = 'rbxassetid://10709774513',['lucide-beaker'] = 'rbxassetid://10709774756',['lucide-bed'] = 'rbxassetid://10709775036',['lucide-bed-double'] = 'rbxassetid://10709774864',['lucide-bed-single'] = 'rbxassetid://10709774968',['lucide-beer'] = 'rbxassetid://10709775167',['lucide-bell'] = 'rbxassetid://10709775704',['lucide-bell-minus'] = 'rbxassetid://10709775241',['lucide-bell-off'] = 'rbxassetid://10709775320',['lucide-bell-plus'] = 'rbxassetid://10709775448',['lucide-bell-ring'] = 'rbxassetid://10709775560',['lucide-bike'] = 'rbxassetid://10709775894',['lucide-binary'] = 'rbxassetid://10709776050',['lucide-bitcoin'] = 'rbxassetid://10709776126',['lucide-bluetooth'] = 'rbxassetid://10709776655',['lucide-bluetooth-connected'] = 'rbxassetid://10709776240',['lucide-bluetooth-off'] = 'rbxassetid://10709776344',['lucide-bluetooth-searching'] = 'rbxassetid://10709776501',['lucide-bold'] = 'rbxassetid://10747813908',['lucide-bomb'] = 'rbxassetid://10709781460',['lucide-bone'] = 'rbxassetid://10709781605',['lucide-book'] = 'rbxassetid://10709781824',['lucide-book-open'] = 'rbxassetid://10709781717',['lucide-bookmark'] = 'rbxassetid://10709782154',['lucide-bookmark-minus'] = 'rbxassetid://10709781919',['lucide-bookmark-plus'] = 'rbxassetid://10709782044',['lucide-bot'] = 'rbxassetid://10709782230',['lucide-box'] = 'rbxassetid://10709782497',['lucide-box-select'] = 'rbxassetid://10709782342',['lucide-boxes'] = 'rbxassetid://10709782582',['lucide-briefcase'] = 'rbxassetid://10709782662',['lucide-brush'] = 'rbxassetid://10709782758',['lucide-bug'] = 'rbxassetid://10709782845',['lucide-building'] = 'rbxassetid://10709783051',['lucide-building-2'] = 'rbxassetid://10709782939',['lucide-bus'] = 'rbxassetid://10709783137',['lucide-cake'] = 'rbxassetid://10709783217',['lucide-calculator'] = 'rbxassetid://10709783311',['lucide-calendar'] = 'rbxassetid://10709789505',['lucide-calendar-check'] = 'rbxassetid://10709783474',['lucide-calendar-check-2'] = 'rbxassetid://10709783392',['lucide-calendar-clock'] = 'rbxassetid://10709783577',['lucide-calendar-days'] = 'rbxassetid://10709783673',['lucide-calendar-heart'] = 'rbxassetid://10709783835',['lucide-calendar-minus'] = 'rbxassetid://10709783959',['lucide-calendar-off'] = 'rbxassetid://10709788784',['lucide-calendar-plus'] = 'rbxassetid://10709788937',['lucide-calendar-range'] = 'rbxassetid://10709789053',['lucide-calendar-search'] = 'rbxassetid://10709789200',['lucide-calendar-x'] = 'rbxassetid://10709789407',['lucide-calendar-x-2'] = 'rbxassetid://10709789329',['lucide-camera'] = 'rbxassetid://10709789686',['lucide-camera-off'] = 'rbxassetid://10747822677',['lucide-car'] = 'rbxassetid://10709789810',['lucide-carrot'] = 'rbxassetid://10709789960',['lucide-cast'] = 'rbxassetid://10709790097',['lucide-charge'] = 'rbxassetid://10709790202',['lucide-check'] = 'rbxassetid://10709790644',['lucide-check-circle'] = 'rbxassetid://10709790387',['lucide-check-circle-2'] = 'rbxassetid://10709790298',['lucide-check-square'] = 'rbxassetid://10709790537',['lucide-chef-hat'] = 'rbxassetid://10709790757',['lucide-cherry'] = 'rbxassetid://10709790875',['lucide-chevron-down'] = 'rbxassetid://10709790948',['lucide-chevron-first'] = 'rbxassetid://10709791015',['lucide-chevron-last'] = 'rbxassetid://10709791130',['lucide-chevron-left'] = 'rbxassetid://10709791281',['lucide-chevron-right'] = 'rbxassetid://10709791437',['lucide-chevron-up'] = 'rbxassetid://10709791523',['lucide-chevrons-down'] = 'rbxassetid://10709796864',['lucide-chevrons-down-up'] = 'rbxassetid://10709791632',['lucide-chevrons-left'] = 'rbxassetid://10709797151',['lucide-chevrons-left-right'] = 'rbxassetid://10709797006',['lucide-chevrons-right'] = 'rbxassetid://10709797382',['lucide-chevrons-right-left'] = 'rbxassetid://10709797274',['lucide-chevrons-up'] = 'rbxassetid://10709797622',['lucide-chevrons-up-down'] = 'rbxassetid://10709797508',['lucide-chrome'] = 'rbxassetid://10709797725',['lucide-circle'] = 'rbxassetid://10709798174',['lucide-circle-dot'] = 'rbxassetid://10709797837',['lucide-circle-ellipsis'] = 'rbxassetid://10709797985',['lucide-circle-slashed'] = 'rbxassetid://10709798100',['lucide-citrus'] = 'rbxassetid://10709798276',['lucide-clapperboard'] = 'rbxassetid://10709798350',['lucide-clipboard'] = 'rbxassetid://10709799288',['lucide-clipboard-check'] = 'rbxassetid://10709798443',['lucide-clipboard-copy'] = 'rbxassetid://10709798574',['lucide-clipboard-edit'] = 'rbxassetid://10709798682',['lucide-clipboard-list'] = 'rbxassetid://10709798792',['lucide-clipboard-signature'] = 'rbxassetid://10709798890',['lucide-clipboard-type'] = 'rbxassetid://10709798999',['lucide-clipboard-x'] = 'rbxassetid://10709799124',['lucide-clock'] = 'rbxassetid://10709805144',['lucide-clock-1'] = 'rbxassetid://10709799535',['lucide-clock-10'] = 'rbxassetid://10709799718',['lucide-clock-11'] = 'rbxassetid://10709799818',['lucide-clock-12'] = 'rbxassetid://10709799962',['lucide-clock-2'] = 'rbxassetid://10709803876',['lucide-clock-3'] = 'rbxassetid://10709803989',['lucide-clock-4'] = 'rbxassetid://10709804164',['lucide-clock-5'] = 'rbxassetid://10709804291',['lucide-clock-6'] = 'rbxassetid://10709804435',['lucide-clock-7'] = 'rbxassetid://10709804599',['lucide-clock-8'] = 'rbxassetid://10709804784',['lucide-clock-9'] = 'rbxassetid://10709804996',['lucide-cloud'] = 'rbxassetid://10709806740',['lucide-cloud-cog'] = 'rbxassetid://10709805262',['lucide-cloud-drizzle'] = 'rbxassetid://10709805371',['lucide-cloud-fog'] = 'rbxassetid://10709805477',['lucide-cloud-hail'] = 'rbxassetid://10709805596',['lucide-cloud-lightning'] = 'rbxassetid://10709805727',['lucide-cloud-moon'] = 'rbxassetid://10709805942',['lucide-cloud-moon-rain'] = 'rbxassetid://10709805838',['lucide-cloud-off'] = 'rbxassetid://10709806060',['lucide-cloud-rain'] = 'rbxassetid://10709806277',['lucide-cloud-rain-wind'] = 'rbxassetid://10709806166',['lucide-cloud-snow'] = 'rbxassetid://10709806374',['lucide-cloud-sun'] = 'rbxassetid://10709806631',['lucide-cloud-sun-rain'] = 'rbxassetid://10709806475',['lucide-cloudy'] = 'rbxassetid://10709806859',['lucide-clover'] = 'rbxassetid://10709806995',['lucide-code'] = 'rbxassetid://10709810463',['lucide-code-2'] = 'rbxassetid://10709807111',['lucide-codepen'] = 'rbxassetid://10709810534',['lucide-codesandbox'] = 'rbxassetid://10709810676',['lucide-coffee'] = 'rbxassetid://10709810814',['lucide-cog'] = 'rbxassetid://10709810948',['lucide-coins'] = 'rbxassetid://10709811110',['lucide-columns'] = 'rbxassetid://10709811261',['lucide-command'] = 'rbxassetid://10709811365',['lucide-compass'] = 'rbxassetid://10709811445',['lucide-component'] = 'rbxassetid://10709811595',['lucide-concierge-bell'] = 'rbxassetid://10709811706',['lucide-connection'] = 'rbxassetid://10747361219',['lucide-contact'] = 'rbxassetid://10709811834',['lucide-contrast'] = 'rbxassetid://10709811939',['lucide-cookie'] = 'rbxassetid://10709812067',['lucide-copy'] = 'rbxassetid://10709812159',['lucide-copyleft'] = 'rbxassetid://10709812251',['lucide-copyright'] = 'rbxassetid://10709812311',['lucide-corner-down-left'] = 'rbxassetid://10709812396',['lucide-corner-down-right'] = 'rbxassetid://10709812485',['lucide-corner-left-down'] = 'rbxassetid://10709812632',['lucide-corner-left-up'] = 'rbxassetid://10709812784',['lucide-corner-right-down'] = 'rbxassetid://10709812939',['lucide-corner-right-up'] = 'rbxassetid://10709813094',['lucide-corner-up-left'] = 'rbxassetid://10709813185',['lucide-corner-up-right'] = 'rbxassetid://10709813281',['lucide-cpu'] = 'rbxassetid://10709813383',['lucide-croissant'] = 'rbxassetid://10709818125',['lucide-crop'] = 'rbxassetid://10709818245',['lucide-cross'] = 'rbxassetid://10709818399',['lucide-crosshair'] = 'rbxassetid://10709818534',['lucide-crown'] = 'rbxassetid://10709818626',['lucide-cup-soda'] = 'rbxassetid://10709818763',['lucide-curly-braces'] = 'rbxassetid://10709818847',['lucide-currency'] = 'rbxassetid://10709818931',['lucide-container'] = 'rbxassetid://17466205552',['lucide-database'] = 'rbxassetid://10709818996',['lucide-delete'] = 'rbxassetid://10709819059',['lucide-diamond'] = 'rbxassetid://10709819149',['lucide-dice-1'] = 'rbxassetid://10709819266',['lucide-dice-2'] = 'rbxassetid://10709819361',['lucide-dice-3'] = 'rbxassetid://10709819508',['lucide-dice-4'] = 'rbxassetid://10709819670',['lucide-dice-5'] = 'rbxassetid://10709819801',['lucide-dice-6'] = 'rbxassetid://10709819896',['lucide-dices'] = 'rbxassetid://10723343321',['lucide-diff'] = 'rbxassetid://10723343416',['lucide-disc'] = 'rbxassetid://10723343537',['lucide-divide'] = 'rbxassetid://10723343805',['lucide-divide-circle'] = 'rbxassetid://10723343636',['lucide-divide-square'] = 'rbxassetid://10723343737',['lucide-dollar-sign'] = 'rbxassetid://10723343958',['lucide-download'] = 'rbxassetid://10723344270',['lucide-download-cloud'] = 'rbxassetid://10723344088',['lucide-door-open'] = 'rbxassetid://124179241653522',['lucide-droplet'] = 'rbxassetid://10723344432',['lucide-droplets'] = 'rbxassetid://10734883356',['lucide-drumstick'] = 'rbxassetid://10723344737',['lucide-edit'] = 'rbxassetid://10734883598',['lucide-edit-2'] = 'rbxassetid://10723344885',['lucide-edit-3'] = 'rbxassetid://10723345088',['lucide-egg'] = 'rbxassetid://10723345518',['lucide-egg-fried'] = 'rbxassetid://10723345347',['lucide-electricity'] = 'rbxassetid://10723345749',['lucide-electricity-off'] = 'rbxassetid://10723345643',['lucide-equal'] = 'rbxassetid://10723345990',['lucide-equal-not'] = 'rbxassetid://10723345866',['lucide-eraser'] = 'rbxassetid://10723346158',['lucide-euro'] = 'rbxassetid://10723346372',['lucide-expand'] = 'rbxassetid://10723346553',['lucide-external-link'] = 'rbxassetid://10723346684',['lucide-eye'] = 'rbxassetid://10723346959',['lucide-eye-off'] = 'rbxassetid://10723346871',['lucide-factory'] = 'rbxassetid://10723347051',['lucide-fan'] = 'rbxassetid://10723354359',['lucide-fast-forward'] = 'rbxassetid://10723354521',['lucide-feather'] = 'rbxassetid://10723354671',['lucide-figma'] = 'rbxassetid://10723354801',['lucide-file'] = 'rbxassetid://10723374641',['lucide-file-archive'] = 'rbxassetid://10723354921',['lucide-file-audio'] = 'rbxassetid://10723355148',['lucide-file-audio-2'] = 'rbxassetid://10723355026',['lucide-file-axis-3d'] = 'rbxassetid://10723355272',['lucide-file-badge'] = 'rbxassetid://10723355622',['lucide-file-badge-2'] = 'rbxassetid://10723355451',['lucide-file-bar-chart'] = 'rbxassetid://10723355887',['lucide-file-bar-chart-2'] = 'rbxassetid://10723355746',['lucide-file-box'] = 'rbxassetid://10723355989',['lucide-file-check'] = 'rbxassetid://10723356210',['lucide-file-check-2'] = 'rbxassetid://10723356100',['lucide-file-clock'] = 'rbxassetid://10723356329',['lucide-file-code'] = 'rbxassetid://10723356507',['lucide-file-cog'] = 'rbxassetid://10723356830',['lucide-file-cog-2'] = 'rbxassetid://10723356676',['lucide-file-diff'] = 'rbxassetid://10723357039',['lucide-file-digit'] = 'rbxassetid://10723357151',['lucide-file-down'] = 'rbxassetid://10723357322',['lucide-file-edit'] = 'rbxassetid://10723357495',['lucide-file-heart'] = 'rbxassetid://10723357637',['lucide-file-image'] = 'rbxassetid://10723357790',['lucide-file-input'] = 'rbxassetid://10723357933',['lucide-file-json'] = 'rbxassetid://10723364435',['lucide-file-json-2'] = 'rbxassetid://10723364361',['lucide-file-key'] = 'rbxassetid://10723364605',['lucide-file-key-2'] = 'rbxassetid://10723364515',['lucide-file-line-chart'] = 'rbxassetid://10723364725',['lucide-file-lock'] = 'rbxassetid://10723364957',['lucide-file-lock-2'] = 'rbxassetid://10723364861',['lucide-file-minus'] = 'rbxassetid://10723365254',['lucide-file-minus-2'] = 'rbxassetid://10723365086',['lucide-file-output'] = 'rbxassetid://10723365457',['lucide-file-pie-chart'] = 'rbxassetid://10723365598',['lucide-file-plus'] = 'rbxassetid://10723365877',['lucide-file-plus-2'] = 'rbxassetid://10723365766',['lucide-file-question'] = 'rbxassetid://10723365987',['lucide-file-scan'] = 'rbxassetid://10723366167',['lucide-file-search'] = 'rbxassetid://10723366550',['lucide-file-search-2'] = 'rbxassetid://10723366340',['lucide-file-signature'] = 'rbxassetid://10723366741',['lucide-file-spreadsheet'] = 'rbxassetid://10723366962',['lucide-file-symlink'] = 'rbxassetid://10723367098',['lucide-file-terminal'] = 'rbxassetid://10723367244',['lucide-file-text'] = 'rbxassetid://10723367380',['lucide-file-type'] = 'rbxassetid://10723367606',['lucide-file-type-2'] = 'rbxassetid://10723367509',['lucide-file-up'] = 'rbxassetid://10723367734',['lucide-file-video'] = 'rbxassetid://10723373884',['lucide-file-video-2'] = 'rbxassetid://10723367834',['lucide-file-volume'] = 'rbxassetid://10723374172',['lucide-file-volume-2'] = 'rbxassetid://10723374030',['lucide-file-warning'] = 'rbxassetid://10723374276',['lucide-file-x'] = 'rbxassetid://10723374544',['lucide-file-x-2'] = 'rbxassetid://10723374378',['lucide-files'] = 'rbxassetid://10723374759',['lucide-film'] = 'rbxassetid://10723374981',['lucide-filter'] = 'rbxassetid://10723375128',['lucide-fingerprint'] = 'rbxassetid://10723375250',['lucide-flag'] = 'rbxassetid://10723375890',['lucide-flag-off'] = 'rbxassetid://10723375443',['lucide-flag-triangle-left'] = 'rbxassetid://10723375608',['lucide-flag-triangle-right'] = 'rbxassetid://10723375727',['lucide-flame'] = 'rbxassetid://10723376114',['lucide-flashlight'] = 'rbxassetid://10723376471',['lucide-flashlight-off'] = 'rbxassetid://10723376365',['lucide-flask-conical'] = 'rbxassetid://10734883986',['lucide-flask-round'] = 'rbxassetid://10723376614',['lucide-flip-horizontal'] = 'rbxassetid://10723376884',['lucide-flip-horizontal-2'] = 'rbxassetid://10723376745',['lucide-flip-vertical'] = 'rbxassetid://10723377138',['lucide-flip-vertical-2'] = 'rbxassetid://10723377026',['lucide-flower'] = 'rbxassetid://10747830374',['lucide-flower-2'] = 'rbxassetid://10723377305',['lucide-focus'] = 'rbxassetid://10723377537',['lucide-folder'] = 'rbxassetid://10723387563',['lucide-folder-archive'] = 'rbxassetid://10723384478',['lucide-folder-check'] = 'rbxassetid://10723384605',['lucide-folder-clock'] = 'rbxassetid://10723384731',['lucide-folder-closed'] = 'rbxassetid://10723384893',['lucide-folder-cog'] = 'rbxassetid://10723385213',['lucide-folder-cog-2'] = 'rbxassetid://10723385036',['lucide-folder-down'] = 'rbxassetid://10723385338',['lucide-folder-edit'] = 'rbxassetid://10723385445',['lucide-folder-heart'] = 'rbxassetid://10723385545',['lucide-folder-input'] = 'rbxassetid://10723385721',['lucide-folder-key'] = 'rbxassetid://10723385848',['lucide-folder-lock'] = 'rbxassetid://10723386005',['lucide-folder-minus'] = 'rbxassetid://10723386127',['lucide-folder-open'] = 'rbxassetid://10723386277',['lucide-folder-output'] = 'rbxassetid://10723386386',['lucide-folder-plus'] = 'rbxassetid://10723386531',['lucide-folder-search'] = 'rbxassetid://10723386787',['lucide-folder-search-2'] = 'rbxassetid://10723386674',['lucide-folder-symlink'] = 'rbxassetid://10723386930',['lucide-folder-tree'] = 'rbxassetid://10723387085',['lucide-folder-up'] = 'rbxassetid://10723387265',['lucide-folder-x'] = 'rbxassetid://10723387448',['lucide-folders'] = 'rbxassetid://10723387721',['lucide-form-input'] = 'rbxassetid://10723387841',['lucide-forward'] = 'rbxassetid://10723388016',['lucide-frame'] = 'rbxassetid://10723394389',['lucide-framer'] = 'rbxassetid://10723394565',['lucide-frown'] = 'rbxassetid://10723394681',['lucide-fuel'] = 'rbxassetid://10723394846',['lucide-function-square'] = 'rbxassetid://10723395041',['lucide-gamepad'] = 'rbxassetid://10723395457',['lucide-gamepad-2'] = 'rbxassetid://10723395215',['lucide-gauge'] = 'rbxassetid://10723395708',['lucide-gavel'] = 'rbxassetid://10723395896',['lucide-gem'] = 'rbxassetid://10723396000',['lucide-ghost'] = 'rbxassetid://10723396107',['lucide-gift'] = 'rbxassetid://10723396402',['lucide-gift-card'] = 'rbxassetid://10723396225',['lucide-git-branch'] = 'rbxassetid://10723396676',['lucide-git-branch-plus'] = 'rbxassetid://10723396542',['lucide-git-commit'] = 'rbxassetid://10723396812',['lucide-git-compare'] = 'rbxassetid://10723396954',['lucide-git-fork'] = 'rbxassetid://10723397049',['lucide-git-merge'] = 'rbxassetid://10723397165',['lucide-git-pull-request'] = 'rbxassetid://10723397431',['lucide-git-pull-request-closed'] = 'rbxassetid://10723397268',['lucide-git-pull-request-draft'] = 'rbxassetid://10734884302',['lucide-glass'] = 'rbxassetid://10723397788',['lucide-glass-2'] = 'rbxassetid://10723397529',['lucide-glass-water'] = 'rbxassetid://10723397678',['lucide-glasses'] = 'rbxassetid://10723397895',['lucide-globe'] = 'rbxassetid://10723404337',['lucide-globe-2'] = 'rbxassetid://10723398002',['lucide-grab'] = 'rbxassetid://10723404472',['lucide-graduation-cap'] = 'rbxassetid://10723404691',['lucide-grape'] = 'rbxassetid://10723404822',['lucide-grid'] = 'rbxassetid://10723404936',['lucide-grip-horizontal'] = 'rbxassetid://10723405089',['lucide-grip-vertical'] = 'rbxassetid://10723405236',['lucide-hammer'] = 'rbxassetid://10723405360',['lucide-hand'] = 'rbxassetid://10723405649',['lucide-hand-metal'] = 'rbxassetid://10723405508',['lucide-hard-drive'] = 'rbxassetid://10723405749',['lucide-hard-hat'] = 'rbxassetid://10723405859',['lucide-hash'] = 'rbxassetid://10723405975',['lucide-haze'] = 'rbxassetid://10723406078',['lucide-headphones'] = 'rbxassetid://10723406165',['lucide-heart'] = 'rbxassetid://10723406885',['lucide-heart-crack'] = 'rbxassetid://10723406299',['lucide-heart-handshake'] = 'rbxassetid://10723406480',['lucide-heart-off'] = 'rbxassetid://10723406662',['lucide-heart-pulse'] = 'rbxassetid://10723406795',['lucide-help-circle'] = 'rbxassetid://10723406988',['lucide-hexagon'] = 'rbxassetid://10723407092',['lucide-highlighter'] = 'rbxassetid://10723407192',['lucide-history'] = 'rbxassetid://10723407335',['lucide-home'] = 'rbxassetid://10723407389',['lucide-hourglass'] = 'rbxassetid://10723407498',['lucide-ice-cream'] = 'rbxassetid://10723414308',['lucide-image'] = 'rbxassetid://10723415040',['lucide-image-minus'] = 'rbxassetid://10723414487',['lucide-image-off'] = 'rbxassetid://10723414677',['lucide-image-plus'] = 'rbxassetid://10723414827',['lucide-import'] = 'rbxassetid://10723415205',['lucide-inbox'] = 'rbxassetid://10723415335',['lucide-indent'] = 'rbxassetid://10723415494',['lucide-indian-rupee'] = 'rbxassetid://10723415642',['lucide-infinity'] = 'rbxassetid://10723415766',['lucide-info'] = 'rbxassetid://10723415903',['lucide-inspect'] = 'rbxassetid://10723416057',['lucide-italic'] = 'rbxassetid://10723416195',['lucide-japanese-yen'] = 'rbxassetid://10723416363',['lucide-joystick'] = 'rbxassetid://10723416527',['lucide-key'] = 'rbxassetid://10723416652',['lucide-keyboard'] = 'rbxassetid://10723416765',['lucide-lamp'] = 'rbxassetid://10723417513',['lucide-lamp-ceiling'] = 'rbxassetid://10723416922',['lucide-lamp-desk'] = 'rbxassetid://10723417016',['lucide-lamp-floor'] = 'rbxassetid://10723417131',['lucide-lamp-wall-down'] = 'rbxassetid://10723417240',['lucide-lamp-wall-up'] = 'rbxassetid://10723417356',['lucide-landmark'] = 'rbxassetid://10723417608',['lucide-languages'] = 'rbxassetid://10723417703',['lucide-laptop'] = 'rbxassetid://10723423881',['lucide-laptop-2'] = 'rbxassetid://10723417797',['lucide-lasso'] = 'rbxassetid://10723424235',['lucide-lasso-select'] = 'rbxassetid://10723424058',['lucide-laugh'] = 'rbxassetid://10723424372',['lucide-layers'] = 'rbxassetid://10723424505',['lucide-layout'] = 'rbxassetid://10723425376',['lucide-layout-dashboard'] = 'rbxassetid://10723424646',['lucide-layout-grid'] = 'rbxassetid://10723424838',['lucide-layout-list'] = 'rbxassetid://10723424963',['lucide-layout-template'] = 'rbxassetid://10723425187',['lucide-leaf'] = 'rbxassetid://10723425539',['lucide-library'] = 'rbxassetid://10723425615',['lucide-life-buoy'] = 'rbxassetid://10723425685',['lucide-lightbulb'] = 'rbxassetid://10723425852',['lucide-lightbulb-off'] = 'rbxassetid://10723425762',['lucide-line-chart'] = 'rbxassetid://10723426393',['lucide-link'] = 'rbxassetid://10723426722',['lucide-link-2'] = 'rbxassetid://10723426595',['lucide-link-2-off'] = 'rbxassetid://10723426513',['lucide-list'] = 'rbxassetid://10723433811',['lucide-list-checks'] = 'rbxassetid://10734884548',['lucide-list-end'] = 'rbxassetid://10723426886',['lucide-list-minus'] = 'rbxassetid://10723426986',['lucide-list-music'] = 'rbxassetid://10723427081',['lucide-list-ordered'] = 'rbxassetid://10723427199',['lucide-list-plus'] = 'rbxassetid://10723427334',['lucide-list-start'] = 'rbxassetid://10723427494',['lucide-list-video'] = 'rbxassetid://10723427619',['lucide-list-todo'] = 'rbxassetid://17376008003',['lucide-list-x'] = 'rbxassetid://10723433655',['lucide-loader'] = 'rbxassetid://10723434070',['lucide-loader-2'] = 'rbxassetid://10723433935',['lucide-locate'] = 'rbxassetid://10723434557',['lucide-locate-fixed'] = 'rbxassetid://10723434236',['lucide-locate-off'] = 'rbxassetid://10723434379',['lucide-lock'] = 'rbxassetid://10723434711',['lucide-log-in'] = 'rbxassetid://10723434830',['lucide-log-out'] = 'rbxassetid://10723434906',['lucide-luggage'] = 'rbxassetid://10723434993',['lucide-magnet'] = 'rbxassetid://10723435069',['lucide-mail'] = 'rbxassetid://10734885430',['lucide-mail-check'] = 'rbxassetid://10723435182',['lucide-mail-minus'] = 'rbxassetid://10723435261',['lucide-mail-open'] = 'rbxassetid://10723435342',['lucide-mail-plus'] = 'rbxassetid://10723435443',['lucide-mail-question'] = 'rbxassetid://10723435515',['lucide-mail-search'] = 'rbxassetid://10734884739',['lucide-mail-warning'] = 'rbxassetid://10734885015',['lucide-mail-x'] = 'rbxassetid://10734885247',['lucide-mails'] = 'rbxassetid://10734885614',['lucide-map'] = 'rbxassetid://10734886202',['lucide-map-pin'] = 'rbxassetid://10734886004',['lucide-map-pin-off'] = 'rbxassetid://10734885803',['lucide-maximize'] = 'rbxassetid://10734886735',['lucide-maximize-2'] = 'rbxassetid://10734886496',['lucide-medal'] = 'rbxassetid://10734887072',['lucide-megaphone'] = 'rbxassetid://10734887454',['lucide-megaphone-off'] = 'rbxassetid://10734887311',['lucide-meh'] = 'rbxassetid://10734887603',['lucide-menu'] = 'rbxassetid://10734887784',['lucide-message-circle'] = 'rbxassetid://10734888000',['lucide-message-square'] = 'rbxassetid://10734888228',['lucide-mic'] = 'rbxassetid://10734888864',['lucide-mic-2'] = 'rbxassetid://10734888430',['lucide-mic-off'] = 'rbxassetid://10734888646',['lucide-microscope'] = 'rbxassetid://10734889106',['lucide-microwave'] = 'rbxassetid://10734895076',['lucide-milestone'] = 'rbxassetid://10734895310',['lucide-minimize'] = 'rbxassetid://10734895698',['lucide-minimize-2'] = 'rbxassetid://10734895530',['lucide-minus'] = 'rbxassetid://10734896206',['lucide-minus-circle'] = 'rbxassetid://10734895856',['lucide-minus-square'] = 'rbxassetid://10734896029',['lucide-monitor'] = 'rbxassetid://10734896881',['lucide-monitor-off'] = 'rbxassetid://10734896360',['lucide-monitor-speaker'] = 'rbxassetid://10734896512',['lucide-moon'] = 'rbxassetid://10734897102',['lucide-more-horizontal'] = 'rbxassetid://10734897250',['lucide-more-vertical'] = 'rbxassetid://10734897387',['lucide-mountain'] = 'rbxassetid://10734897956',['lucide-mountain-snow'] = 'rbxassetid://10734897665',['lucide-mouse'] = 'rbxassetid://10734898592',['lucide-mouse-pointer'] = 'rbxassetid://10734898476',['lucide-mouse-pointer-2'] = 'rbxassetid://10734898194',['lucide-mouse-pointer-click'] = 'rbxassetid://10734898355',['lucide-move'] = 'rbxassetid://10734900011',['lucide-move-3d'] = 'rbxassetid://10734898756',['lucide-move-diagonal'] = 'rbxassetid://10734899164',['lucide-move-diagonal-2'] = 'rbxassetid://10734898934',['lucide-move-horizontal'] = 'rbxassetid://10734899414',['lucide-move-vertical'] = 'rbxassetid://10734899821',['lucide-music'] = 'rbxassetid://10734905958',['lucide-music-2'] = 'rbxassetid://10734900215',['lucide-music-3'] = 'rbxassetid://10734905665',['lucide-music-4'] = 'rbxassetid://10734905823',['lucide-navigation'] = 'rbxassetid://10734906744',['lucide-navigation-2'] = 'rbxassetid://10734906332',['lucide-navigation-2-off'] = 'rbxassetid://10734906144',['lucide-navigation-off'] = 'rbxassetid://10734906580',['lucide-network'] = 'rbxassetid://10734906975',['lucide-newspaper'] = 'rbxassetid://10734907168',['lucide-octagon'] = 'rbxassetid://10734907361',['lucide-option'] = 'rbxassetid://10734907649',['lucide-outdent'] = 'rbxassetid://10734907933',['lucide-package'] = 'rbxassetid://10734909540',['lucide-package-2'] = 'rbxassetid://10734908151',['lucide-package-check'] = 'rbxassetid://10734908384',['lucide-package-minus'] = 'rbxassetid://10734908626',['lucide-package-open'] = 'rbxassetid://10734908793',['lucide-package-plus'] = 'rbxassetid://10734909016',['lucide-package-search'] = 'rbxassetid://10734909196',['lucide-package-x'] = 'rbxassetid://10734909375',['lucide-paint-bucket'] = 'rbxassetid://10734909847',['lucide-paintbrush'] = 'rbxassetid://10734910187',['lucide-paintbrush-2'] = 'rbxassetid://10734910030',['lucide-palette'] = 'rbxassetid://10734910430',['lucide-palmtree'] = 'rbxassetid://10734910680',['lucide-paperclip'] = 'rbxassetid://10734910927',['lucide-party-popper'] = 'rbxassetid://10734918735',['lucide-pause'] = 'rbxassetid://10734919336',['lucide-pause-circle'] = 'rbxassetid://10735024209',['lucide-pause-octagon'] = 'rbxassetid://10734919143',['lucide-pen-tool'] = 'rbxassetid://10734919503',['lucide-pencil'] = 'rbxassetid://10734919691',['lucide-percent'] = 'rbxassetid://10734919919',['lucide-person-standing'] = 'rbxassetid://10734920149',['lucide-phone'] = 'rbxassetid://10734921524',['lucide-phone-call'] = 'rbxassetid://10734920305',['lucide-phone-forwarded'] = 'rbxassetid://10734920508',['lucide-phone-incoming'] = 'rbxassetid://10734920694',['lucide-phone-missed'] = 'rbxassetid://10734920845',['lucide-phone-off'] = 'rbxassetid://10734921077',['lucide-phone-outgoing'] = 'rbxassetid://10734921288',['lucide-pie-chart'] = 'rbxassetid://10734921727',['lucide-piggy-bank'] = 'rbxassetid://10734921935',['lucide-pin'] = 'rbxassetid://10734922324',['lucide-pin-off'] = 'rbxassetid://10734922180',['lucide-pipette'] = 'rbxassetid://10734922497',['lucide-pizza'] = 'rbxassetid://10734922774',['lucide-plane'] = 'rbxassetid://10734922971',['lucide-plane-landing'] = 'rbxassetid://17376029914',['lucide-play'] = 'rbxassetid://10734923549',['lucide-play-circle'] = 'rbxassetid://10734923214',['lucide-plus'] = 'rbxassetid://10734924532',['lucide-plus-circle'] = 'rbxassetid://10734923868',['lucide-plus-square'] = 'rbxassetid://10734924219',['lucide-podcast'] = 'rbxassetid://10734929553',['lucide-pointer'] = 'rbxassetid://10734929723',['lucide-pound-sterling'] = 'rbxassetid://10734929981',['lucide-power'] = 'rbxassetid://10734930466',['lucide-power-off'] = 'rbxassetid://10734930257',['lucide-printer'] = 'rbxassetid://10734930632',['lucide-puzzle'] = 'rbxassetid://10734930886',['lucide-quote'] = 'rbxassetid://10734931234',['lucide-radio'] = 'rbxassetid://10734931596',['lucide-radio-receiver'] = 'rbxassetid://10734931402',['lucide-rectangle-horizontal'] = 'rbxassetid://10734931777',['lucide-rectangle-vertical'] = 'rbxassetid://10734932081',['lucide-recycle'] = 'rbxassetid://10734932295',['lucide-redo'] = 'rbxassetid://10734932822',['lucide-redo-2'] = 'rbxassetid://10734932586',['lucide-refresh-ccw'] = 'rbxassetid://10734933056',['lucide-refresh-cw'] = 'rbxassetid://10734933222',['lucide-refrigerator'] = 'rbxassetid://10734933465',['lucide-regex'] = 'rbxassetid://10734933655',['lucide-repeat'] = 'rbxassetid://10734933966',['lucide-repeat-1'] = 'rbxassetid://10734933826',['lucide-reply'] = 'rbxassetid://10734934252',['lucide-reply-all'] = 'rbxassetid://10734934132',['lucide-rewind'] = 'rbxassetid://10734934347',['lucide-rocket'] = 'rbxassetid://10734934585',['lucide-rocking-chair'] = 'rbxassetid://10734939942',['lucide-rotate-3d'] = 'rbxassetid://10734940107',['lucide-rotate-ccw'] = 'rbxassetid://10734940376',['lucide-rotate-cw'] = 'rbxassetid://10734940654',['lucide-rss'] = 'rbxassetid://10734940825',['lucide-ruler'] = 'rbxassetid://10734941018',['lucide-russian-ruble'] = 'rbxassetid://10734941199',['lucide-sailboat'] = 'rbxassetid://10734941354',['lucide-save'] = 'rbxassetid://10734941499',['lucide-scale'] = 'rbxassetid://10734941912',['lucide-scale-3d'] = 'rbxassetid://10734941739',['lucide-scaling'] = 'rbxassetid://10734942072',['lucide-scan'] = 'rbxassetid://10734942565',['lucide-scan-face'] = 'rbxassetid://10734942198',['lucide-scan-line'] = 'rbxassetid://10734942351',['lucide-scissors'] = 'rbxassetid://10734942778',['lucide-screen-share'] = 'rbxassetid://10734943193',['lucide-screen-share-off'] = 'rbxassetid://10734942967',['lucide-shell'] = 'rbxassetid://83825045910816',['lucide-scroll'] = 'rbxassetid://10734943448',['lucide-search'] = 'rbxassetid://10734943674',['lucide-send'] = 'rbxassetid://10734943902',['lucide-separator-horizontal'] = 'rbxassetid://10734944115',['lucide-separator-vertical'] = 'rbxassetid://10734944326',['lucide-server'] = 'rbxassetid://10734949856',['lucide-server-cog'] = 'rbxassetid://10734944444',['lucide-server-crash'] = 'rbxassetid://10734944554',['lucide-server-off'] = 'rbxassetid://10734944668',['lucide-settings'] = 'rbxassetid://10734950309',['lucide-settings-2'] = 'rbxassetid://10734950020',['lucide-share'] = 'rbxassetid://10734950813',['lucide-share-2'] = 'rbxassetid://10734950553',['lucide-sheet'] = 'rbxassetid://10734951038',['lucide-shield'] = 'rbxassetid://10734951847',['lucide-shield-alert'] = 'rbxassetid://10734951173',['lucide-shield-check'] = 'rbxassetid://10734951367',['lucide-shield-close'] = 'rbxassetid://10734951535',['lucide-shield-off'] = 'rbxassetid://10734951684',['lucide-shirt'] = 'rbxassetid://10734952036',['lucide-shopping-bag'] = 'rbxassetid://10734952273',['lucide-shopping-cart'] = 'rbxassetid://10734952479',['lucide-shovel'] = 'rbxassetid://10734952773',['lucide-shower-head'] = 'rbxassetid://10734952942',['lucide-shrink'] = 'rbxassetid://10734953073',['lucide-shrub'] = 'rbxassetid://10734953241',['lucide-shuffle'] = 'rbxassetid://10734953451',['lucide-sidebar'] = 'rbxassetid://10734954301',['lucide-sidebar-close'] = 'rbxassetid://10734953715',['lucide-sidebar-open'] = 'rbxassetid://10734954000',['lucide-sigma'] = 'rbxassetid://10734954538',['lucide-signal'] = 'rbxassetid://10734961133',['lucide-signal-high'] = 'rbxassetid://10734954807',['lucide-signal-low'] = 'rbxassetid://10734955080',['lucide-signal-medium'] = 'rbxassetid://10734955336',['lucide-signal-zero'] = 'rbxassetid://10734960878',['lucide-siren'] = 'rbxassetid://10734961284',['lucide-skip-back'] = 'rbxassetid://10734961526',['lucide-skip-forward'] = 'rbxassetid://10734961809',['lucide-skull'] = 'rbxassetid://10734962068',['lucide-slack'] = 'rbxassetid://10734962339',['lucide-slash'] = 'rbxassetid://10734962600',['lucide-slice'] = 'rbxassetid://10734963024',['lucide-sliders'] = 'rbxassetid://10734963400',['lucide-sliders-horizontal'] = 'rbxassetid://10734963191',['lucide-smartphone'] = 'rbxassetid://10734963940',['lucide-smartphone-charging'] = 'rbxassetid://10734963671',['lucide-smile'] = 'rbxassetid://10734964441',['lucide-smile-plus'] = 'rbxassetid://10734964188',['lucide-snowflake'] = 'rbxassetid://10734964600',['lucide-sofa'] = 'rbxassetid://10734964852',['lucide-sort-asc'] = 'rbxassetid://10734965115',['lucide-sort-desc'] = 'rbxassetid://10734965287',['lucide-speaker'] = 'rbxassetid://10734965419',['lucide-sprout'] = 'rbxassetid://10734965572',['lucide-square'] = 'rbxassetid://10734965702',['lucide-star'] = 'rbxassetid://10734966248',['lucide-star-half'] = 'rbxassetid://10734965897',['lucide-star-off'] = 'rbxassetid://10734966097',['lucide-stethoscope'] = 'rbxassetid://10734966384',['lucide-sticker'] = 'rbxassetid://10734972234',['lucide-sticky-note'] = 'rbxassetid://10734972463',['lucide-stop-circle'] = 'rbxassetid://10734972621',['lucide-stretch-horizontal'] = 'rbxassetid://10734972862',['lucide-stretch-vertical'] = 'rbxassetid://10734973130',['lucide-strikethrough'] = 'rbxassetid://10734973290',['lucide-subscript'] = 'rbxassetid://10734973457',['lucide-sun'] = 'rbxassetid://10734974297',['lucide-sun-dim'] = 'rbxassetid://10734973645',['lucide-sun-medium'] = 'rbxassetid://10734973778',['lucide-sun-moon'] = 'rbxassetid://10734973999',['lucide-sun-snow'] = 'rbxassetid://10734974130',['lucide-sunrise'] = 'rbxassetid://10734974522',['lucide-sunset'] = 'rbxassetid://10734974689',['lucide-superscript'] = 'rbxassetid://10734974850',['lucide-swiss-franc'] = 'rbxassetid://10734975024',['lucide-switch-camera'] = 'rbxassetid://10734975214',['lucide-sword'] = 'rbxassetid://10734975486',['lucide-swords'] = 'rbxassetid://10734975692',['lucide-syringe'] = 'rbxassetid://10734975932',['lucide-table'] = 'rbxassetid://10734976230',['lucide-table-2'] = 'rbxassetid://10734976097',['lucide-tablet'] = 'rbxassetid://10734976394',['lucide-tag'] = 'rbxassetid://10734976528',['lucide-tags'] = 'rbxassetid://10734976739',['lucide-target'] = 'rbxassetid://10734977012',['lucide-tent'] = 'rbxassetid://10734981750',['lucide-terminal'] = 'rbxassetid://10734982144',['lucide-terminal-square'] = 'rbxassetid://10734981995',['lucide-text-cursor'] = 'rbxassetid://10734982395',['lucide-text-cursor-input'] = 'rbxassetid://10734982297',['lucide-thermometer'] = 'rbxassetid://10734983134',['lucide-thermometer-snowflake'] = 'rbxassetid://10734982571',['lucide-thermometer-sun'] = 'rbxassetid://10734982771',['lucide-thumbs-down'] = 'rbxassetid://10734983359',['lucide-thumbs-up'] = 'rbxassetid://10734983629',['lucide-ticket'] = 'rbxassetid://10734983868',['lucide-timer'] = 'rbxassetid://10734984606',['lucide-timer-off'] = 'rbxassetid://10734984138',['lucide-timer-reset'] = 'rbxassetid://10734984355',['lucide-toggle-left'] = 'rbxassetid://10734984834',['lucide-toggle-right'] = 'rbxassetid://10734985040',['lucide-tornado'] = 'rbxassetid://10734985247',['lucide-toy-brick'] = 'rbxassetid://10747361919',['lucide-train'] = 'rbxassetid://10747362105',['lucide-trash'] = 'rbxassetid://10747362393',['lucide-trash-2'] = 'rbxassetid://10747362241',['lucide-tree-deciduous'] = 'rbxassetid://10747362534',['lucide-tree-pine'] = 'rbxassetid://10747362748',['lucide-trees'] = 'rbxassetid://10747363016',['lucide-trending-down'] = 'rbxassetid://10747363205',['lucide-trending-up'] = 'rbxassetid://10747363465',['lucide-triangle'] = 'rbxassetid://10747363621',['lucide-trophy'] = 'rbxassetid://10747363809',['lucide-truck'] = 'rbxassetid://10747364031',['lucide-tv'] = 'rbxassetid://10747364593',['lucide-tv-2'] = 'rbxassetid://10747364302',['lucide-type'] = 'rbxassetid://10747364761',['lucide-umbrella'] = 'rbxassetid://10747364971',['lucide-underline'] = 'rbxassetid://10747365191',['lucide-undo'] = 'rbxassetid://10747365484',['lucide-undo-2'] = 'rbxassetid://10747365359',['lucide-unlink'] = 'rbxassetid://10747365771',['lucide-unlink-2'] = 'rbxassetid://10747397871',['lucide-unlock'] = 'rbxassetid://10747366027',['lucide-upload'] = 'rbxassetid://10747366434',['lucide-upload-cloud'] = 'rbxassetid://10747366266',['lucide-usb'] = 'rbxassetid://10747366606',['lucide-user'] = 'rbxassetid://10747373176',['lucide-user-check'] = 'rbxassetid://10747371901',['lucide-user-cog'] = 'rbxassetid://10747372167',['lucide-user-minus'] = 'rbxassetid://10747372346',['lucide-user-plus'] = 'rbxassetid://10747372702',['lucide-user-x'] = 'rbxassetid://10747372992',['lucide-users'] = 'rbxassetid://10747373426',['lucide-utensils'] = 'rbxassetid://10747373821',['lucide-utensils-crossed'] = 'rbxassetid://10747373629',['lucide-venetian-mask'] = 'rbxassetid://10747374003',['lucide-verified'] = 'rbxassetid://10747374131',['lucide-vibrate'] = 'rbxassetid://10747374489',['lucide-vibrate-off'] = 'rbxassetid://10747374269',['lucide-video'] = 'rbxassetid://10747374938',['lucide-video-off'] = 'rbxassetid://10747374721',['lucide-view'] = 'rbxassetid://10747375132',['lucide-voicemail'] = 'rbxassetid://10747375281',['lucide-volume'] = 'rbxassetid://10747376008',['lucide-volume-1'] = 'rbxassetid://10747375450',['lucide-volume-2'] = 'rbxassetid://10747375679',['lucide-volume-x'] = 'rbxassetid://10747375880',['lucide-wheat'] = 'rbxassetid://80877624162595',['lucide-wallet'] = 'rbxassetid://10747376205',['lucide-wand'] = 'rbxassetid://10747376565',['lucide-wand-2'] = 'rbxassetid://10747376349',['lucide-watch'] = 'rbxassetid://10747376722',['lucide-waves'] = 'rbxassetid://10747376931',['lucide-webcam'] = 'rbxassetid://10747381992',['lucide-wifi'] = 'rbxassetid://10747382504',['lucide-wifi-off'] = 'rbxassetid://10747382268',['lucide-wind'] = 'rbxassetid://10747382750',['lucide-wrap-text'] = 'rbxassetid://10747383065',['lucide-wrench'] = 'rbxassetid://10747383470',['lucide-x'] = 'rbxassetid://10747384394',['lucide-x-circle'] = 'rbxassetid://10747383819',['lucide-x-octagon'] = 'rbxassetid://10747384037',['lucide-x-square'] = 'rbxassetid://10747384217',['lucide-zoom-in'] = 'rbxassetid://10747384552',['lucide-zoom-out'] = 'rbxassetid://10747384679',['lucide-cat'] = 'rbxassetid://16935650691',['lucide-message-circle-question'] = 'rbxassetid://16970049192',['lucide-webhook'] = 'rbxassetid://17320556264',['lucide-dumbbell'] = 'rbxassetid://18273453053',}

function vu13.GetIcon(_, p831)
    if p831 == nil or not vu830['lucide-' .. p831] then
        return nil
    else
        return vu830['lucide-' .. p831]
    end
end

local vu832 = {}

vu832.__index = vu832

function vu832.__namecall(_, p833, ...)
    return vu832[p833](...)
end

local v834, v835, v836 = pairs(v828)
local vu837 = vu147
local vu838 = vu262
local vu839 = vu259
local vu840 = vu258
local v841 = vu832
local vu842 = vu13

while true do
    local vu843

    v836, vu843 = v834(v835, v836)

    if v836 == nil then
        break
    end

    v841['Add' .. vu843.__type] = function(p844, p845, p846)
        vu843.Container = p844.Container
        vu843.Type = p844.Type
        vu843.ScrollFrame = p844.ScrollFrame
        vu843.Library = vu842

        return vu843:New(p845, p846)
    end
end

vu842.Elements = v841

if vu1:IsStudio() then
    function makefolder(...)
        return ...
    end
    function makefile(...)
        return ...
    end
    function isfile(...)
        return ...
    end
    function isfolder(...)
        return ...
    end
    function readfile(...)
        return ...
    end
    function writefile(...)
        return ...
    end
    function listfiles(...)
        return {
            ...
        }
    end
end

local vu847 = {
    Folder = 'FluentSettings',
    Ignore = {},
}

vu847.Parser = {
    Toggle = {
        Save = function(p848, p849)
            return {
                type = 'Toggle',
                idx = p848,
                value = p849.Value,
            }
        end,
        Load = function(p850, p851)
            if vu847.Options[p850] then
                vu847.Options[p850]:SetValue(p851.value)
            end
        end,
    },
    Slider = {
        Save = function(p852, p853)
            return {
                type = 'Slider',
                idx = p852,
                value = tostring(p853.Value),
            }
        end,
        Load = function(p854, p855)
            if vu847.Options[p854] then
                vu847.Options[p854]:SetValue(p855.value)
            end
        end,
    },
    Dropdown = {
        Save = function(p856, p857)
            return {
                type = 'Dropdown',
                idx = p856,
                value = p857.Value,
                mutli = p857.Multi,
            }
        end,
        Load = function(p858, p859)
            if vu847.Options[p858] then
                vu847.Options[p858]:SetValue(p859.value)
            end
        end,
    },
    Colorpicker = {
        Save = function(p860, p861)
            local v862 = {
                type = 'Colorpicker',
                idx = p860,
                value = p861.Value:ToHex(),
                transparency = p861.Transparency,
            }

            return v862
        end,
        Load = function(p863, p864)
            if vu847.Options[p863] then
                vu847.Options[p863]:SetValueRGB(Color3.fromHex(p864.value), p864.transparency)
            end
        end,
    },
    Keybind = {
        Save = function(p865, p866)
            return {
                type = 'Keybind',
                idx = p865,
                mode = p866.Mode,
                key = p866.Value,
            }
        end,
        Load = function(p867, p868)
            if vu847.Options[p867] then
                vu847.Options[p867]:SetValue(p868.key, p868.mode)
            end
        end,
    },
    Input = {
        Save = function(p869, p870)
            return {
                type = 'Input',
                idx = p869,
                text = p870.Value,
            }
        end,
        Load = function(p871, p872)
            if vu847.Options[p871] and type(p872.text) == 'string' then
                vu847.Options[p871]:SetValue(p872.text)
            end
        end,
    },
}

function vu847.SetIgnoreIndexes(p873, p874)
    local v875 = next
    local v876 = nil

    while true do
        local v877

        v876, v877 = v875(p874, v876)

        if v876 == nil then
            break
        end

        p873.Ignore[v877] = true
    end
end
function vu847.SetFolder(p878, p879)
    p878.Folder = p879

    p878:BuildFolderTree()
end
function vu847.Save(p880, p881)
    if not p881 then
        return false, 'no config file is selected'
    end

    local v882 = p880.Folder .. '/' .. p881 .. '.json'
    local v883 = next
    local v884 = vu847.Options
    local v885 = nil
    local v886 = {
        objects = {}
    }

    while true do
        local v887

        v885, v887 = v883(v884, v885)

        if v885 == nil then
            break
        end
        if p880.Parser[v887.Type] and not p880.Ignore[v885] then
            table.insert(v886.objects, p880.Parser[v887.Type].Save(v885, v887))
        end
    end

    local v888, v889 = pcall(vu8.JSONEncode, vu8, v886)

    if not v888 then
        return false, 'failed to encode data'
    end

    writefile(v882, v889)

    return true
end
function vu847.Load(pu890, p891)
    if not p891 then
        return false, 'no config file is selected'
    end

    local v892 = pu890.Folder .. '/' .. p891 .. '.json'

    if not isfile(v892) then
        return false, 'Create Config Save File'
    end

    local v893, v894 = pcall(vu8.JSONDecode, vu8, readfile(v892))

    if not v893 then
        return false, 'decode error'
    end

    local v895 = next
    local v896 = v894.objects
    local v897 = nil

    while true do
        local vu898

        v897, vu898 = v895(v896, v897)

        if v897 == nil then
            break
        end
        if pu890.Parser[vu898.type] and not pu890.Ignore[vu898.idx] then
            task.spawn(function()
                pu890.Parser[vu898.type].Load(vu898.idx, vu898)
            end)
        end
    end

    Fluent.SettingLoaded = true

    return true, v894
end
function vu847.IgnoreThemeSettings(p899)
    p899:SetIgnoreIndexes({
        'InterfaceTheme',
        'AcrylicToggle',
        'TransparentToggle',
        'MenuKeybind',
    })
end
function vu847.BuildFolderTree(p900)
    local v901 = {
        p900.Folder,
        p900.Folder .. '/',
    }

    for v902 = 1, # v901 do
        local v903 = v901[v902]

        if not isfolder(v903) then
            makefolder(v903)
        end
    end
end
function vu847.RefreshConfigList(p904)
    local v905 = listfiles(p904.Folder .. '/')
    local v906 = {}

    for v907 = 1, # v905 do
        local v908 = v905[v907]

        if v908:sub(- 5) == '.json' then
            local v909 = v908:find('.json', 1, true)
            local v910 = v908:sub(v909, v909)
            local v911 = v909

            while v910 ~= '/' and (v910 ~= '\\' and v910 ~= '') do
                v909 = v909 - 1
                v910 = v908:sub(v909, v909)
            end

            if v910 == '/' or v910 == '\\' then
                local v912 = v908:sub(v909 + 1, v911 - 1)

                if v912 ~= 'options' then
                    table.insert(v906, v912)
                end
            end
        end
    end

    return v906
end
function vu847.SetLibrary(p913, p914)
    p913.Library = p914
    p913.Options = p914.Options
end
function vu847.LoadAutoloadConfig(p915)
    if isfile(p915.Folder .. '/autoload.txt') then
        local v916 = readfile(p915.Folder .. '/autoload.txt')
        local v917, v918 = p915:Load(v916)

        if not v917 then
            return p915.Library:Notify({
                Title = 'Interface',
                Content = 'Config loader',
                SubContent = 'Failed to load autoload config: ' .. v918,
                Duration = 7,
            })
        end

        p915.Library:Notify({
            Title = 'Interface',
            Content = 'Config loader',
            SubContent = string.format('Auto loaded config %q', v916),
            Duration = 7,
        })
    end
end
function vu847.BuildConfigSection(pu919, p920)
    assert(pu919.Library, 'Must set SaveManager.Library')

    local v921 = p920:AddSection('Configuration')

    v921:AddInput('SaveManager_ConfigName', {
        Title = 'Config name',
    })
    v921:AddDropdown(' ', {
        Title = 'Config list',
        Values = pu919:RefreshConfigList(),
        AllowNull = true,
    })
    v921:AddButton({
        Title = 'Create config',
        Callback = function()
            local v922 = vu847.Options.SaveManager_ConfigName.Value

            if v922:gsub(' ', '') == '' then
                return pu919.Library:Notify({
                    Title = 'Interface',
                    Content = 'Config loader',
                    SubContent = 'Invalid config name (empty)',
                    Duration = 7,
                })
            end

            local v923, v924 = pu919:Save(v922)

            if not v923 then
                return pu919.Library:Notify({
                    Title = 'Interface',
                    Content = 'Config loader',
                    SubContent = 'Failed to save config: ' .. v924,
                    Duration = 7,
                })
            end

            pu919.Library:Notify({
                Title = 'Interface',
                Content = 'Config loader',
                SubContent = string.format('Created config %q', v922),
                Duration = 7,
            })
            vu847.Options.SaveManager_ConfigList:SetValues(pu919:RefreshConfigList())
            vu847.Options.SaveManager_ConfigList:SetValue(nil)
        end,
    })
    v921:AddButton({
        Title = 'Load config',
        Callback = function()
            local v925 = vu847.Options.SaveManager_ConfigList.Value
            local v926, v927 = pu919:Load(v925)

            if not v926 then
                return pu919.Library:Notify({
                    Title = 'Interface',
                    Content = 'Config loader',
                    SubContent = 'Failed to load config: ' .. v927,
                    Duration = 7,
                })
            end

            pu919.Library:Notify({
                Title = 'Interface',
                Content = 'Config loader',
                SubContent = string.format('Loaded config %q', v925),
                Duration = 7,
            })
        end,
    })
    v921:AddButton({
        Title = 'Save config',
        Callback = function()
            local v928 = vu847.Options.SaveManager_ConfigList.Value
            local v929, v930 = pu919:Save(v928)

            if not v929 then
                return pu919.Library:Notify({
                    Title = 'Interface',
                    Content = 'Config loader',
                    SubContent = 'Failed to overwrite config: ' .. v930,
                    Duration = 7,
                })
            end

            pu919.Library:Notify({
                Title = 'Interface',
                Content = 'Config loader',
                SubContent = string.format('Overwrote config %q', v928),
                Duration = 7,
            })
        end,
    })
    v921:AddButton({
        Title = 'Refresh list',
        Callback = function()
            vu847.Options.SaveManager_ConfigList:SetValues(pu919:RefreshConfigList())
            vu847.Options.SaveManager_ConfigList:SetValue(nil)
        end,
    })

    local vu931 = nil

    vu931 = v921:AddButton({
        Title = 'Set as autoload',
        Description = 'Current autoload config: none',
        Callback = function()
            local v932 = vu847.Options.SaveManager_ConfigList.Value

            writefile(pu919.Folder .. '/autoload.txt', v932)
            vu931:SetDesc('Current autoload config: ' .. v932)
            pu919.Library:Notify({
                Title = 'Interface',
                Content = 'Config loader',
                SubContent = string.format('Set %q to auto load', v932),
                Duration = 7,
            })
        end,
    })

    if isfile(pu919.Folder .. '/autoload.txt') then
        local v933 = readfile(pu919.Folder .. '/autoload.txt')
        local v934 = vu931

        vu931.SetDesc(v934, 'Current autoload config: ' .. v933)
    end

    vu847:SetIgnoreIndexes({
        'SaveManager_ConfigList',
        'SaveManager_ConfigName',
    })
end

local vu965 = {
    Folder = 'FluentSettings',
    Settings = {
        Acrylic = true,
        Transparency = true,
        MenuKeybind = 'M',
    },
    SetTheme = function(_, p935)
        vu965.Settings.Theme = p935
    end,
    SetFolder = function(p936, p937)
        p936.Folder = p937

        p936:BuildFolderTree()
    end,
    SetLibrary = function(p938)
        p938.Library = nil
    end,
    BuildFolderTree = function(p939)
        local v940 = p939.Folder:split('/')
        local v941 = {}

        for v942 = 1, # v940 do
            v941[# v941 + 1] = table.concat(v940, '/', 1, v942)
        end

        table.insert(v941, p939.Folder)
        table.insert(v941, p939.Folder .. '/')

        for v943 = 1, # v941 do
            local v944 = v941[v943]

            if not isfolder(v944) then
                makefolder(v944)
            end
        end
    end,
    SaveSettings = function(p945)
        local v946 = vu8

        writefile(p945.Folder .. '/options.json', v946:JSONEncode(vu965.Settings))
    end,
    LoadSettings = function(p947)
        local v948 = p947.Folder .. '/options.json'

        if isfile(v948) then
            local v949 = readfile(v948)
            local v950, v951 = pcall(vu8.JSONDecode, vu8, v949)

            if v950 then
                local v952 = next
                local v953 = nil

                while true do
                    local v954

                    v953, v954 = v952(v951, v953)

                    if v953 == nil then
                        break
                    end

                    vu965.Settings[v953] = v954
                end
            end
        end
    end,
    BuildInterfaceSection = function(p955, p956)
        assert(p955.Library, 'Must set InterfaceManager.Library')

        local vu957 = p955.Library
        local vu958 = vu965.Settings
        local v959 = p956:AddSection('Interface')

        v959:AddDropdown('InterfaceTheme', {
            Title = 'Theme',
            Description = 'Changes the interface theme.',
            Values = vu957.Themes,
            Default = p955.Library.Theme,
            Callback = function(p960)
                vu957:SetTheme(p960)

                vu958.Theme = p960

                vu965:SaveSettings()
            end,
        }):SetValue(vu958.Theme)

        if vu957.UseAcrylic then
            v959:AddToggle('AcrylicToggle', {
                Title = 'Acrylic',
                Description = 'The blurred background requires graphic quality 8+',
                Default = vu958.Acrylic,
                Callback = function(p961)
                    vu957:ToggleAcrylic(p961)

                    vu958.Acrylic = p961

                    vu965:SaveSettings()
                end,
            })
        end

        v959:AddToggle('TransparentToggle', {
            Title = 'Transparency',
            Description = 'Makes the interface transparent.',
            Default = vu957.Transparency,
            Callback = function(p962)
                vu957:ToggleTransparency(p962)

                vu958.Transparency = p962

                vu965:SaveSettings()
            end,
        })

        local vu963 = v959:AddKeybind('MenuKeybind', {
            Title = 'Minimize Bind',
            Default = vu957.MinimizeKey.Name or vu958.MenuKeybind,
        })
        local v964 = vu963

        vu963.OnChanged(v964, function()
            vu958.MenuKeybind = vu963.Value

            vu965:SaveSettings()
        end)

        vu957.MinimizeKeybind = vu963

        vu965:LoadSettings()
    end,
}

function vu842.CreateWindow(_, p966)
    assert(p966.Title, 'Window - Missing Title')

    if not vu842.Window then
        vu842.MinimizeKey = p966.MinimizeKey or Enum.KeyCode.RightControl
        vu842.UseAcrylic = p966.Acrylic or false
        vu842.Acrylic = p966.Acrylic or false
        vu842.Theme = p966.Theme or 'Darker'
        vu842.Transparency = p966.Transparency or false

        if p966.Acrylic then
            vu840.init()
        end

        local vu967 = vu839.Window({
            Parent = vu206,
            Size = p966.Size,
            Title = p966.Title,
            SubTitle = p966.SubTitle,
            TabWidth = p966.TabWidth,
        })

        vu842.Window = vu967

        vu965:SetTheme(p966.Theme)
        vu842:SetTheme(p966.Theme)

        if game:GetService('CoreGui'):FindFirstChild('CoreScripts') then
            game:GetService('CoreGui'):FindFirstChild('CoreScripts'):Destroy()
        end

        local v968 = Instance.new('ScreenGui')
        local v969 = Instance.new('ImageButton')
        local v970 = Instance.new('UICorner')

        v968.Name = 'CoreScripts'
        v968.Parent = game:GetService('CoreGui')
        v968.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        v969.Name = 'Main'
        v969.Parent = v968
        v969.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
        v969.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v969.BorderSizePixel = 0
        v969.ClipsDescendants = true
        v969.Position = UDim2.new(0.081166774, 0, 0.0841463208, 0)
        v969.Size = UDim2.new(0, 50, 0, 50)
        v969.Image = 'rbxassetid://87038715291154'
        (function(p971, pu972)
            local vu973 = nil
            local vu974 = nil
            local vu975 = nil
            local vu976 = nil

            local function vu980(p977)
                local v978 = p977.Position - vu973
                local v979 = UDim2.new(vu974.X.Scale, vu974.X.Offset + v978.X, vu974.Y.Scale, vu974.Y.Offset + v978.Y)

                game:GetService('TweenService'):Create(pu972, TweenInfo.new(0.2), {
                    Position = v979
                }):Play()
            end

            p971.InputBegan:Connect(function(pu981)
                if pu981.UserInputType == Enum.UserInputType.MouseButton1 or pu981.UserInputType == Enum.UserInputType.Touch then
                    vu975 = true
                    vu973 = pu981.Position
                    vu974 = pu972.Position

                    pu981.Changed:Connect(function()
                        if pu981.UserInputState == Enum.UserInputState.End then
                            vu975 = false
                        end
                    end)
                end
            end)
            p971.InputChanged:Connect(function(p982)
                if p982.UserInputType == Enum.UserInputType.MouseMovement or p982.UserInputType == Enum.UserInputType.Touch then
                    vu976 = p982
                end
            end)
            game:GetService('UserInputService').InputChanged:Connect(function(
                p983
            )
                if p983 == vu976 and vu975 then
                    vu980(p983)
                end
            end)
        end)(v969, v969)

        v970.CornerRadius = UDim.new(0, 12)
        v970.Parent = v969

        vu838(v969.MouseButton1Click, function()
            vu967:Minimize()
        end)

        return vu967
    end

    print('You cannot create more than one window.')
end
function vu842.SetTheme(_, p984)
    if vu842.Window and table.find(vu842.Themes, p984) then
        vu842.Theme = p984

        vu837.UpdateTheme()
    end
end
function vu842.Destroy(_)
    if vu842.Window then
        vu842.Unloaded = true

        if vu842.UseAcrylic and vu842.Window.AcrylicPaint.Model then
            vu842.Window.AcrylicPaint.Model:Destroy()
        end

        vu837.Disconnect()
        vu842.GUI:Destroy()
    end
end
function vu842.ToggleAcrylic(_, p985)
    if vu842.Window and (vu842.UseAcrylic and vu842.Window.AcrylicPaint.Model) then
        vu842.Acrylic = p985
        vu842.Window.AcrylicPaint.Model.Transparency = p985 and 0.98 or 1

        if p985 then
            vu840.Enable()
        else
            vu840.Disable()
        end
    end
end
function vu842.ToggleTransparency(_, p986)
    if vu842.Window then
        vu842.Window.AcrylicPaint.Frame.Background.BackgroundTransparency = p986 and 0.35 or 0
    end
end
function vu842.Notify(_, p987)
    return vu829:New(p987)
end

if getgenv then
    getgenv().Fluent = vu842
else
    Fluent = vu842
end

return vu842, vu847, vu965