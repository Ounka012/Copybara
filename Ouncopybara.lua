--[[

    ░█████╗░░█████╗░██████╗░██╗░░░██╗██████╗░░█████╗░██████╗░░█████╗░
    ██╔══██╗██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗
    ██║░░╚═╝██║░░██║██████╔╝░╚████╔╝░██████╦╝███████║██████╔╝███████║
    ██║░░██╗██║░░██║██╔═══╝░░░╚██╔╝░░██╔══██╗██╔══██║██╔══██╗██╔══██║
    ╚█████╔╝╚█████╔╝██║░░░░░░░░██║░░░██████╦╝██║░░██║██║░░██║██║░░██║
    ░╚════╝░░╚════╝░╚═╝░░░░░░░░╚═╝░░░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝

    Copybara Interface Suite
    Clean Edition | v1.0.0
    Original by Sirius (Rayfield)
    Rebranded and Beautified

--]]

local Copybara = {
    Flags = {},
    Theme = {
        Default = {
            TextFont = "Default",
            TextColor = Color3.fromRGB(240, 240, 240),
            Background = Color3.fromRGB(25, 25, 25),
            Topbar = Color3.fromRGB(34, 34, 34),
            Shadow = Color3.fromRGB(20, 20, 20),
            NotificationBackground = Color3.fromRGB(20, 20, 20),
            NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
            TabBackground = Color3.fromRGB(80, 80, 80),
            TabStroke = Color3.fromRGB(85, 85, 85),
            TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
            TabTextColor = Color3.fromRGB(240, 240, 240),
            SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
            ElementBackground = Color3.fromRGB(35, 35, 35),
            ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
            ElementStroke = Color3.fromRGB(50, 50, 50),
            SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
            SliderBackground = Color3.fromRGB(43, 105, 159),
            SliderProgress = Color3.fromRGB(43, 105, 159),
            SliderStroke = Color3.fromRGB(48, 119, 177),
            ToggleBackground = Color3.fromRGB(30, 30, 30),
            ToggleEnabled = Color3.fromRGB(0, 146, 214),
            ToggleDisabled = Color3.fromRGB(100, 100, 100),
            ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
            ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
            ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
            ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
            InputBackground = Color3.fromRGB(30, 30, 30),
            InputStroke = Color3.fromRGB(65, 65, 65),
            PlaceholderColor = Color3.fromRGB(178, 178, 178)
        },
        Light = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(50, 50, 50),
            Background = Color3.fromRGB(255, 255, 255),
            Topbar = Color3.fromRGB(217, 217, 217),
            Shadow = Color3.fromRGB(223, 223, 223),
            NotificationBackground = Color3.fromRGB(20, 20, 20),
            NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
            TabBackground = Color3.fromRGB(220, 220, 220),
            TabStroke = Color3.fromRGB(112, 112, 112),
            TabBackgroundSelected = Color3.fromRGB(0, 142, 208),
            TabTextColor = Color3.fromRGB(240, 240, 240),
            SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
            ElementBackground = Color3.fromRGB(198, 198, 198),
            ElementBackgroundHover = Color3.fromRGB(230, 230, 230),
            SecondaryElementBackground = Color3.fromRGB(136, 136, 136),
            ElementStroke = Color3.fromRGB(180, 199, 97),
            SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
            SliderBackground = Color3.fromRGB(31, 159, 71),
            SliderProgress = Color3.fromRGB(31, 159, 71),
            SliderStroke = Color3.fromRGB(42, 216, 94),
            ToggleBackground = Color3.fromRGB(170, 203, 60),
            ToggleEnabled = Color3.fromRGB(32, 214, 29),
            ToggleDisabled = Color3.fromRGB(100, 22, 23),
            ToggleEnabledStroke = Color3.fromRGB(17, 255, 0),
            ToggleDisabledStroke = Color3.fromRGB(65, 8, 8),
            ToggleEnabledOuterStroke = Color3.fromRGB(0, 170, 0),
            ToggleDisabledOuterStroke = Color3.fromRGB(170, 0, 0),
            InputBackground = Color3.fromRGB(31, 159, 71),
            InputStroke = Color3.fromRGB(19, 65, 31),
            PlaceholderColor = Color3.fromRGB(178, 178, 178)
        }
    }
}

local Release = "Clean 1.0"
local NotificationDuration = 6.5
local CopybaraFolder = "Copybara"
local ConfigurationFolder = CopybaraFolder .. "/Configurations"
local ConfigurationExtension = ".rfld"

-- Services
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- Interface Objects
local CopybaraGui = game:GetObjects("rbxassetid://10804731440")[1]
CopybaraGui.Name = "Copybara"
CopybaraGui.Enabled = false

if gethui then
    CopybaraGui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(CopybaraGui)
    CopybaraGui.Parent = CoreGui
elseif CoreGui:FindFirstChild("RobloxGui") then
    CopybaraGui.Parent = CoreGui:FindFirstChild("RobloxGui")
else
    CopybaraGui.Parent = CoreGui
end

for _, Interface in ipairs((gethui and gethui() or CoreGui):GetChildren()) do
    if Interface.Name == CopybaraGui.Name and Interface ~= CopybaraGui then
        Interface.Enabled = false
        Interface.Name = "Copybara-Old"
    end
end

local Camera = workspace.CurrentCamera
local Main = CopybaraGui.Main
local Topbar = Main.Topbar
local Elements = Main.Elements
local LoadingFrame = Main.LoadingFrame
local TabList = Main.TabList
local Notifications = CopybaraGui.Notifications

CopybaraGui.DisplayOrder = 100
LoadingFrame.Version.Text = Release

local request = (syn and syn.request) or (http and http.request) or http_request
local CFileName, CEnabled = nil, false
local Minimised, Hidden, Debounce = false, false, false
local SelectedTheme = Copybara.Theme.Default

local function PackColor(Color)
    return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end

local function UnpackColor(Color)
    return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function SaveConfiguration()
    if not CEnabled then return end
    local Data = {}
    for flagName, flag in pairs(Copybara.Flags) do
        if flag.Type == "ColorPicker" then
            Data[flagName] = PackColor(flag.Color)
        else
            Data[flagName] = flag.CurrentValue or flag.CurrentKeybind or flag.CurrentOption or flag.Color
        end
    end
    writefile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension, HttpService:JSONEncode(Data))
end

local function LoadConfiguration(Configuration)
    local Data = HttpService:JSONDecode(Configuration)
    for flagName, flagValue in pairs(Data) do
        if Copybara.Flags[flagName] then
            spawn(function()
                if Copybara.Flags[flagName].Type == "ColorPicker" then
                    Copybara.Flags[flagName]:Set(UnpackColor(flagValue))
                else
                    Copybara.Flags[flagName]:Set(flagValue)
                end
            end)
        else
            Copybara:Notify({Title = "Flag Error", Content = "Flag '" .. flagName .. "' not found."})
        end
    end
end

function Copybara:LoadConfiguration()
    if CEnabled and isfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension) then
        LoadConfiguration(readfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension))
        self:Notify({Title = "Configuration Loaded", Content = "Previous session restored."})
    end
end

-- Neon blur module (simplified)
local neon = (function()
    local module = {}
    local RootParent = Camera
    if getgenv().SecureMode then RootParent = nil end
    local binds = {}
    local root = Instance.new('Folder', RootParent)
    root.Name = 'neon'

    local GenUid; do
        local id = 0
        function GenUid() id = id + 1; return 'neon::' .. id end
    end

    local DrawQuad; do
        local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
        local sz = 0.2

        function DrawTriangle(v1, v2, v3, p0, p1)
            local s1 = (v1 - v2).magnitude
            local s2 = (v2 - v3).magnitude
            local s3 = (v3 - v1).magnitude
            local smax = max(s1, s2, s3)
            local A, B, C
            if s1 == smax then A, B, C = v1, v2, v3
            elseif s2 == smax then A, B, C = v2, v3, v1
            else A, B, C = v3, v1, v2 end

            local para = ((B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z) / (A-B).magnitude
            local perp = sqrt((C-A).magnitude^2 - para*para)
            local dif_para = (A - B).magnitude - para

            local st = CFrame.new(B, A)
            local za = CFrame.Angles(pi/2,0,0)
            local cf0 = st
            local Top_Look = (cf0 * za).lookVector
            local Mid_Point = A + CFrame.new(A, B).LookVector * para
            local Needed_Look = CFrame.new(Mid_Point, C).LookVector
            local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z
            local ac = CFrame.Angles(0, 0, acos(dot))

            cf0 = cf0 * ac
            if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
                cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
            end
            cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))

            local cf1 = st * ac * CFrame.Angles(0, pi, 0)
            if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
                cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
            end
            cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)

            if not p0 then
                p0 = Instance.new('Part')
                p0.FormFactor = 'Custom'
                p0.TopSurface, p0.BottomSurface = 0, 0
                p0.Anchored, p0.CanCollide = true, false
                p0.Material = 'Glass'
                p0.Size = Vector3.new(sz, sz, sz)
                local mesh = Instance.new('SpecialMesh', p0)
                mesh.MeshType = 2
                mesh.Name = 'WedgeMesh'
            end
            p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
            p0.CFrame = cf0

            if not p1 then p1 = p0:clone() end
            p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif_para/sz)
            p1.CFrame = cf1
            return p0, p1
        end

        function DrawQuad(v1, v2, v3, v4, parts)
            parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
            parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
        end
    end

    function module:BindFrame(frame, properties)
        if RootParent == nil then return end
        if binds[frame] then return binds[frame].parts end
        local uid = GenUid()
        local parts = {}
        local folder = Instance.new('Folder', root)
        folder.Name = frame.Name

        local parents = {}
        do
            local function add(child)
                if child:IsA('GuiObject') then
                    parents[#parents + 1] = child
                    add(child.Parent)
                end
            end
            add(frame)
        end

        local function UpdateOrientation(fetchProps)
            local zIndex = 1 - 0.05 * frame.ZIndex
            local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
            local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
            local rot = 0
            for _, v in ipairs(parents) do rot = rot + v.Rotation end
            if rot ~= 0 and rot % 180 ~= 0 then
                local mid = tl:lerp(br, 0.5)
                local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
                local function rotate(vec)
                    return Vector2.new(
                        c*(vec.x - mid.x) - s*(vec.y - mid.y),
                        s*(vec.x - mid.x) + c*(vec.y - mid.y)
                    ) + mid
                end
                tl, tr, bl, br = rotate(tl), rotate(tr), rotate(bl), rotate(br)
            end
            DrawQuad(
                Camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin,
                Camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin,
                Camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin,
                Camera:ScreenPointToRay(br.x, br.y, zIndex).Origin,
                parts
            )
            if fetchProps then
                for _, pt in pairs(parts) do pt.Parent = folder end
                for propName, propValue in pairs(properties) do
                    for _, pt in pairs(parts) do pt[propName] = propValue end
                end
            end
        end

        UpdateOrientation(true)
        RunService:BindToRenderStep(uid, 2000, UpdateOrientation)
        binds[frame] = {uid = uid, parts = parts}
        return parts
    end

    function module:Modify(frame, properties)
        local parts = module:GetBoundParts(frame)
        if parts then
            for propName, propValue in pairs(properties) do
                for _, pt in pairs(parts) do pt[propName] = propValue end
            end
        end
    end

    function module:UnbindFrame(frame)
        if RootParent == nil then return end
        local cb = binds[frame]
        if cb then
            RunService:UnbindFromRenderStep(cb.uid)
            for _, v in pairs(cb.parts) do v:Destroy() end
            binds[frame] = nil
        end
    end

    function module:HasBinding(frame)
        return binds[frame] ~= nil
    end

    function module:GetBoundParts(frame)
        return binds[frame] and binds[frame].parts
    end

    return module
end)()

function ChangeTheme(ThemeName)
    SelectedTheme = Copybara.Theme[ThemeName]
    for _, obj in ipairs(CopybaraGui:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextBox") or obj:IsA("TextButton") then
            if SelectedTheme.TextFont ~= "Default" then
                obj.TextColor3 = SelectedTheme.TextColor
                obj.Font = SelectedTheme.TextFont
            end
        end
    end
    Main.BackgroundColor3 = SelectedTheme.Background
    Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
    Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
    Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow
    for _, TopbarButton in ipairs(Topbar:GetChildren()) do
        if TopbarButton:IsA("ImageButton") then
            TopbarButton.ImageColor3 = SelectedTheme.TextColor
        end
    end
    for _, TabPage in ipairs(Elements:GetChildren()) do
        for _, Element in ipairs(TabPage:GetChildren()) do
            if Element:IsA("Frame") and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= "SectionTitle" then
                Element.BackgroundColor3 = SelectedTheme.ElementBackground
                if Element:FindFirstChild("UIStroke") then
                    Element.UIStroke.Color = SelectedTheme.ElementStroke
                end
            end
        end
    end
end

local function AddDraggingFunctionality(DragPoint, Main)
    pcall(function()
        local Dragging, DragInput, MousePos, FramePos = false, nil, nil, nil
        DragPoint.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = true
                MousePos = Input.Position
                FramePos = Main.Position
                Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)
        DragPoint.InputChanged:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseMovement then
                DragInput = Input
            end
        end)
        UserInputService.InputChanged:Connect(function(Input)
            if Input == DragInput and Dragging then
                local Delta = Input.Position - MousePos
                local newPos = UDim2.new(
                    FramePos.X.Scale, FramePos.X.Offset + Delta.X,
                    FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y
                )
                TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = newPos}):Play()
            end
        end)
    end)
end

function Copybara:Notify(NotificationSettings)
    spawn(function()
        local ActionCompleted = true
        local Notification = Notifications.Template:Clone()
        Notification.Parent = Notifications
        Notification.Name = NotificationSettings.Title or "Unknown Title"
        Notification.Visible = true

        local blurlight = nil
        if not getgenv().SecureMode then
            blurlight = Instance.new("DepthOfFieldEffect", game:GetService("Lighting"))
            blurlight.Enabled = true
            blurlight.FarIntensity = 0
            blurlight.FocusDistance = 51.6
            blurlight.InFocusRadius = 50
            blurlight.NearIntensity = 1
            game:GetService("Debris"):AddItem(script, 0)
        end

        Notification.Actions.Template.Visible = false

        if NotificationSettings.Actions then
            for _, Action in pairs(NotificationSettings.Actions) do
                ActionCompleted = false
                local NewAction = Notification.Actions.Template:Clone()
                NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
                if SelectedTheme ~= Copybara.Theme.Default then
                    NewAction.TextColor3 = SelectedTheme.TextColor
                end
                NewAction.Name = Action.Name
                NewAction.Visible = true
                NewAction.Parent = Notification.Actions
                NewAction.Text = Action.Name
                NewAction.BackgroundTransparency = 1
                NewAction.TextTransparency = 1
                NewAction.Size = UDim2.new(0, NewAction.TextBounds.X + 27, 0, 36)

                NewAction.MouseButton1Click:Connect(function()
                    local Success, Response = pcall(Action.Callback)
                    if not Success then
                        print("Copybara | Action: " .. Action.Name .. " Callback Error " .. tostring(Response))
                    end
                    ActionCompleted = true
                end)
            end
        end

        Notification.BackgroundColor3 = SelectedTheme.Background
        Notification.Title.Text = NotificationSettings.Title or "Unknown"
        Notification.Title.TextTransparency = 1
        Notification.Title.TextColor3 = SelectedTheme.TextColor
        Notification.Description.Text = NotificationSettings.Content or "Unknown"
        Notification.Description.TextTransparency = 1
        Notification.Description.TextColor3 = SelectedTheme.TextColor
        Notification.Icon.ImageColor3 = SelectedTheme.TextColor
        Notification.Icon.Image = "rbxassetid://" .. (NotificationSettings.Image and tostring(NotificationSettings.Image) or "3944680095")
        Notification.Icon.ImageTransparency = 1

        Notification.Size = UDim2.new(0, 260, 0, 80)
        Notification.BackgroundTransparency = 1

        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 91)}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
        Notification:TweenPosition(UDim2.new(0.5, 0, 0.915, 0), 'Out', 'Quint', 0.8, true)

        wait(0.3)
        TweenService:Create(Notification.Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
        TweenService:Create(Notification.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
        wait(0.2)

        if getgenv().SecureMode == nil then
            TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
        else
            if not getgenv().SecureMode then
                TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
            else
                TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            end
        end

        if CopybaraGui.Name == "Copybara" then
            neon:BindFrame(Notification.BlurModule, {
                Transparency = 0.98,
                BrickColor = BrickColor.new("Institutional white")
            })
        end

        if not NotificationSettings.Actions then
            wait(NotificationSettings.Duration or NotificationDuration - 0.5)
        else
            wait(0.8)
            TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 132)}):Play()
            wait(0.3)
            for _, Action in ipairs(Notification.Actions:GetChildren()) do
                if Action:IsA("TextButton") and Action.Name ~= "Template" then
                    TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
                    TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    wait(0.05)
                end
            end
        end

        repeat wait(0.001) until ActionCompleted

        for _, Action in ipairs(Notification.Actions:GetChildren()) do
            if Action:IsA("TextButton") and Action.Name ~= "Template" then
                TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            end
        end

        TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.47, 0, 0.234, 0)}):Play()
        TweenService:Create(Notification.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0.528, 0, 0.637, 0)}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 280, 0, 83)}):Play()
        TweenService:Create(Notification.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.6}):Play()

        wait(0.3)
        TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.4}):Play()
        TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.5}):Play()
        wait(0.4)
        TweenService:Create(Notification, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 260, 0, 0)}):Play()
        TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
        TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
        wait(0.2)
        if not getgenv().SecureMode then
            neon:UnbindFrame(Notification.BlurModule)
            blurlight:Destroy()
        end
        wait(0.9)
        Notification:Destroy()
    end)
end

function Hide()
    Debounce = true
    Copybara:Notify({Title = "Interface Hidden", Content = "Press K to unhide", Duration = 7})
    TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 400)}):Play()
    TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 45)}):Play()
    TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
    TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
    for _, btn in ipairs(Topbar:GetChildren()) do if btn:IsA("ImageButton") then TweenService:Create(btn, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play() end end
    for _, tabbtn in ipairs(TabList:GetChildren()) do
        if tabbtn:IsA("Frame") and tabbtn.Name ~= "Placeholder" then
            TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
            TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
            TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
            TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
        end
    end
    for _, tab in ipairs(Elements:GetChildren()) do
        if tab.Name ~= "Template" and tab:IsA("ScrollingFrame") and tab.Name ~= "Placeholder" then
            for _, el in ipairs(tab:GetChildren()) do
                if el:IsA("Frame") and el.Name ~= "SectionSpacing" and el.Name ~= "Placeholder" then
                    if el.Name == "SectionTitle" then
                        TweenService:Create(el.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    else
                        TweenService:Create(el, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(el.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                        TweenService:Create(el.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                    for _, child in ipairs(el:GetChildren()) do
                        if child:IsA("Frame") or child:IsA("TextLabel") or child:IsA("TextBox") or child:IsA("ImageButton") or child:IsA("ImageLabel") then
                            child.Visible = false
                        end
                    end
                end
            end
        end
    end
    wait(0.5)
    Main.Visible = false
    Debounce = false
end

function Unhide()
    Debounce = true
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Visible = true
    TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
    TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 45)}):Play()
    TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
    TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    if Minimised then spawn(Maximise) end
    for _, btn in ipairs(Topbar:GetChildren()) do if btn:IsA("ImageButton") then TweenService:Create(btn, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play() end end
    for _, tabbtn in ipairs(TabList:GetChildren()) do
        if tabbtn:IsA("Frame") and tabbtn.Name ~= "Placeholder" then
            if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
                TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
                TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            else
                TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
                TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
                TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
                TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
                TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            end
        end
    end
    for _, tab in ipairs(Elements:GetChildren()) do
        if tab.Name ~= "Template" and tab:IsA("ScrollingFrame") and tab.Name ~= "Placeholder" then
            for _, el in ipairs(tab:GetChildren()) do
                if el:IsA("Frame") and el.Name ~= "SectionSpacing" and el.Name ~= "Placeholder" then
                    if el.Name == "SectionTitle" then
                        TweenService:Create(el.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    else
                        TweenService:Create(el, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                        TweenService:Create(el.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                        TweenService:Create(el.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    end
                    for _, child in ipairs(el:GetChildren()) do
                        if child:IsA("Frame") or child:IsA("TextLabel") or child:IsA("TextBox") or child:IsA("ImageButton") or child:IsA("ImageLabel") then
                            child.Visible = true
                        end
                    end
                end
            end
        end
    end
    wait(0.5)
    Minimised = false
    Debounce = false
end

function Maximise()
    Debounce = true
    Topbar.ChangeSize.Image = "rbxassetid://10137941941"
    TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
    TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
    TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
    TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 45)}):Play()
    TabList.Visible = true
    wait(0.2)
    Elements.Visible = true
    for _, tab in ipairs(Elements:GetChildren()) do
        if tab.Name ~= "Template" and tab:IsA("ScrollingFrame") and tab.Name ~= "Placeholder" then
            for _, el in ipairs(tab:GetChildren()) do
                if el:IsA("Frame") and el.Name ~= "SectionSpacing" and el.Name ~= "Placeholder" then
                    if el.Name == "SectionTitle" then
                        TweenService:Create(el.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    else
                        TweenService:Create(el, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                        TweenService:Create(el.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                        TweenService:Create(el.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                    end
                    for _, child in ipairs(el:GetChildren()) do
                        if child:IsA("Frame") or child:IsA("TextLabel") or child:IsA("TextBox") or child:IsA("ImageButton") or child:IsA("ImageLabel") then
                            child.Visible = true
                        end
                    end
                end
            end
        end
    end
    wait(0.1)
    for _, tabbtn in ipairs(TabList:GetChildren()) do
        if tabbtn:IsA("Frame") and tabbtn.Name ~= "Placeholder" then
            if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
                TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
                TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
            else
                TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
                TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
                TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
                TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
                TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            end
        end
    end
    wait(0.5)
    Debounce = false
end

function Minimise()
    Debounce = true
    Topbar.ChangeSize.Image = "rbxassetid://11036884234"
    for _, tabbtn in ipairs(TabList:GetChildren()) do
        if tabbtn:IsA("Frame") and tabbtn.Name ~= "Placeholder" then
            TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
            TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
            TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
            TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
            TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
        end
    end
    for _, tab in ipairs(Elements:GetChildren()) do
        if tab.Name ~= "Template" and tab:IsA("ScrollingFrame") and tab.Name ~= "Placeholder" then
            for _, el in ipairs(tab:GetChildren()) do
                if el:IsA("Frame") and el.Name ~= "SectionSpacing" and el.Name ~= "Placeholder" then
                    if el.Name == "SectionTitle" then
                        TweenService:Create(el.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    else
                        TweenService:Create(el, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(el.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                        TweenService:Create(el.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    end
                    for _, child in ipairs(el:GetChildren()) do
                        if child:IsA("Frame") or child:IsA("TextLabel") or child:IsA("TextBox") or child:IsA("ImageButton") or child:IsA("ImageLabel") then
                            child.Visible = false
                        end
                    end
                end
            end
        end
    end
    TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
    TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
    TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()
    TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()
    wait(0.3)
    Elements.Visible = false
    TabList.Visible = false
    wait(0.2)
    Debounce = false
end

function Copybara:CreateWindow(Settings)
    local Passthrough = false
    Topbar.Title.Text = Settings.Name
    Main.Size = UDim2.new(0, 450, 0, 260)
    Main.Visible = true
    Main.BackgroundTransparency = 1
    LoadingFrame.Title.TextTransparency = 1
    LoadingFrame.Subtitle.TextTransparency = 1
    Main.Shadow.Image.ImageTransparency = 1
    LoadingFrame.Version.TextTransparency = 1
    LoadingFrame.Title.Text = Settings.LoadingTitle or "Copybara Interface Suite"
    LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "by Sirius"
    if Settings.LoadingTitle ~= "Copybara Interface Suite" then
        LoadingFrame.Version.Text = "Copybara UI"
    end
    Topbar.Visible = false
    Elements.Visible = false
    LoadingFrame.Visible = true

    pcall(function()
        Settings.ConfigurationSaving = Settings.ConfigurationSaving or {}
        if not Settings.ConfigurationSaving.FileName then
            Settings.ConfigurationSaving.FileName = tostring(game.PlaceId)
        end
        CFileName = Settings.ConfigurationSaving.FileName
        ConfigurationFolder = Settings.ConfigurationSaving.FolderName or ConfigurationFolder
        CEnabled = Settings.ConfigurationSaving.Enabled or false
        if CEnabled and not isfolder(ConfigurationFolder) then
            makefolder(ConfigurationFolder)
        end
    end)

    AddDraggingFunctionality(Topbar, Main)

    for _, TabButton in ipairs(TabList:GetChildren()) do
        if TabButton:IsA("Frame") and TabButton.Name ~= "Placeholder" then
            TabButton.BackgroundTransparency = 1
            TabButton.Title.TextTransparency = 1
            TabButton.Shadow.ImageTransparency = 1
            TabButton.Image.ImageTransparency = 1
            TabButton.UIStroke.Transparency = 1
        end
    end

    if Settings.Discord then
        if not isfolder(CopybaraFolder .. "/Discord Invites") then
            makefolder(CopybaraFolder .. "/Discord Invites")
        end
        if not isfile(CopybaraFolder .. "/Discord Invites/" .. Settings.Discord.Invite .. ConfigurationExtension) then
            if request then
                request({
                    Url = 'http://127.0.0.1:6463/rpc?v=1',
                    Method = 'POST',
                    Headers = {
                        ['Content-Type'] = 'application/json',
                        Origin = 'https://discord.com'
                    },
                    Body = HttpService:JSONEncode({
                        cmd = 'INVITE_BROWSER',
                        nonce = HttpService:GenerateGUID(false),
                        args = {code = Settings.Discord.Invite}
                    })
                })
            end
            if Settings.Discord.RememberJoins then
                writefile(CopybaraFolder .. "/Discord Invites/" .. Settings.Discord.Invite .. ConfigurationExtension, "Copybara RememberJoins is true")
            end
        end
    end

    if Settings.KeySystem then
        if not Settings.KeySettings then
            Passthrough = true
        else
            if not isfolder(CopybaraFolder .. "/Key System") then
                makefolder(CopybaraFolder .. "/Key System")
            end
            if typeof(Settings.KeySettings.Key) == "string" then
                Settings.KeySettings.Key = {Settings.KeySettings.Key}
            end
            if Settings.KeySettings.GrabKeyFromSite then
                for i, Key in ipairs(Settings.KeySettings.Key) do
                    pcall(function()
                        Settings.KeySettings.Key[i] = tostring(game:HttpGet(Key):gsub("[\n\r]", " ")):gsub(" ", "")
                    end)
                end
            end
            Settings.KeySettings.FileName = Settings.KeySettings.FileName or "No file specified"
            if isfile(CopybaraFolder .. "/Key System/" .. Settings.KeySettings.FileName .. ConfigurationExtension) then
                local fileContent = readfile(CopybaraFolder .. "/Key System/" .. Settings.KeySettings.FileName .. ConfigurationExtension)
                for _, key in ipairs(Settings.KeySettings.Key) do
                    if string.find(fileContent, key) then Passthrough = true end
                end
            end
            if not Passthrough then
                local AttemptsRemaining = math.random(2, 6)
                CopybaraGui.Enabled = false
                local KeyUI = game:GetObjects("rbxassetid://11380036235")[1]
                if gethui then KeyUI.Parent = gethui() elseif syn and syn.protect_gui then syn.protect_gui(KeyUI); KeyUI.Parent = CoreGui else KeyUI.Parent = CoreGui end
                local KeyMain = KeyUI.Main
                KeyMain.Title.Text = Settings.KeySettings.Title or Settings.Name
                KeyMain.Subtitle.Text = Settings.KeySettings.Subtitle or "Key System"
                KeyMain.NoteMessage.Text = Settings.KeySettings.Note or "No instructions"

                KeyMain.Size = UDim2.new(0, 467, 0, 175)
                KeyMain.BackgroundTransparency = 1
                KeyMain.Shadow.Image.ImageTransparency = 1
                KeyMain.Title.TextTransparency = 1
                KeyMain.Subtitle.TextTransparency = 1
                KeyMain.KeyNote.TextTransparency = 1
                KeyMain.Input.BackgroundTransparency = 1
                KeyMain.Input.UIStroke.Transparency = 1
                KeyMain.Input.InputBox.TextTransparency = 1
                KeyMain.NoteTitle.TextTransparency = 1
                KeyMain.NoteMessage.TextTransparency = 1
                KeyMain.Hide.ImageTransparency = 1

                TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
                TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
                wait(0.05)
                TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                wait(0.05)
                TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
                TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                wait(0.05)
                TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
                wait(0.15)
                TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()

                KeyMain.Input.InputBox.FocusLost:Connect(function()
                    if #KeyMain.Input.InputBox.Text == 0 then return end
                    local KeyFound = false
                    local FoundKey = ''
                    for _, MKey in ipairs(Settings.KeySettings.Key) do
                        if string.find(KeyMain.Input.InputBox.Text, MKey) then
                            KeyFound = true
                            FoundKey = MKey
                        end
                    end
                    if KeyFound then
                        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
                        TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                        TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                        TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                        TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                        wait(0.51)
                        Passthrough = true
                        if Settings.KeySettings.SaveKey and writefile then
                            writefile(CopybaraFolder .. "/Key System/" .. Settings.KeySettings.FileName .. ConfigurationExtension, FoundKey)
                            Copybara:Notify({Title = "Key System", Content = "Key saved successfully."})
                        end
                    else
                        if AttemptsRemaining == 0 then
                            TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                            TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
                            TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                            TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                            TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                            TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                            TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                            TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                            TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                            TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                            TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                            wait(0.45)
                            game.Players.LocalPlayer:Kick("No Attempts Remaining")
                            game:Shutdown()
                        end
                        KeyMain.Input.InputBox.Text = ""
                        AttemptsRemaining = AttemptsRemaining - 1
                        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
                        TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.495, 0, 0.5, 0)}):Play()
                        wait(0.1)
                        TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.505, 0, 0.5, 0)}):Play()
                        wait(0.1)
                        TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
                        TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
                    end
                end)

                KeyMain.Hide.MouseButton1Click:Connect(function()
                    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
                    TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
                    wait(0.51)
                    Copybara:Destroy()
                    KeyUI:Destroy()
                end)
            else
                Passthrough = true
            end
        end
        repeat wait() until Passthrough
    end

    Notifications.Template.Visible = false
    Notifications.Visible = true
    CopybaraGui.Enabled = true
    wait(0.5)
    TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.55}):Play()
    wait(0.1)
    TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    wait(0.05)
    TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    wait(0.05)
    TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

    Elements.Template.LayoutOrder = 100000
    Elements.Template.Visible = false
    Elements.UIPageLayout.FillDirection = Enum.FillDirection.Horizontal
    TabList.Template.Visible = false

    local FirstTab = false
    local Window = {}

    function Window:CreateTab(Name, Image)
        local SDone = false
        local TabButton = TabList.Template:Clone()
        TabButton.Name = Name
        TabButton.Title.Text = Name
        TabButton.Parent = TabList
        TabButton.Title.TextWrapped = false
        TabButton.Size = UDim2.new(0, TabButton.Title.TextBounds.X + 30, 0, 30)
        if Image then
            TabButton.Title.AnchorPoint = Vector2.new(0, 0.5)
            TabButton.Title.Position = UDim2.new(0, 37, 0.5, 0)
            TabButton.Image.Image = "rbxassetid://" .. Image
            TabButton.Image.Visible = true
            TabButton.Title.TextXAlignment = Enum.TextXAlignment.Left
            TabButton.Size = UDim2.new(0, TabButton.Title.TextBounds.X + 46, 0, 30)
        end
        TabButton.BackgroundTransparency = 1
        TabButton.Title.TextTransparency = 1
        TabButton.Shadow.ImageTransparency = 1
        TabButton.Image.ImageTransparency = 1
        TabButton.UIStroke.Transparency = 1
        TabButton.Visible = true

        local TabPage = Elements.Template:Clone()
        TabPage.Name = Name
        TabPage.Visible = true
        TabPage.LayoutOrder = #Elements:GetChildren()
        for _, el in ipairs(TabPage:GetChildren()) do
            if el:IsA("Frame") and el.Name ~= "Placeholder" then el:Destroy() end
        end
        TabPage.Parent = Elements

        if not FirstTab then
            Elements.UIPageLayout.Animated = false
            Elements.UIPageLayout:JumpTo(TabPage)
            Elements.UIPageLayout.Animated = true
        end

        if SelectedTheme ~= Copybara.Theme.Default then TabButton.Shadow.Visible = false end
        TabButton.UIStroke.Color = SelectedTheme.TabStroke

        wait(0.1)
        if FirstTab then
            TabButton.BackgroundColor3 = SelectedTheme.TabBackground
            TabButton.Image.ImageColor3 = SelectedTheme.TabTextColor
            TabButton.Title.TextColor3 = SelectedTheme.TabTextColor
            TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
            TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
            TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
            TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(TabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
        else
            FirstTab = Name
            TabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
            TabButton.Image.ImageColor3 = SelectedTheme.SelectedTabTextColor
            TabButton.Title.TextColor3 = SelectedTheme.SelectedTabTextColor
            TweenService:Create(TabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
            TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
            TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        end

        TabButton.Interact.MouseButton1Click:Connect(function()
            if Minimised then return end
            TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
            TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
            TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackgroundSelected}):Play()
            TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.SelectedTabTextColor}):Play()
            TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme.SelectedTabTextColor}):Play()
            TweenService:Create(TabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()

            for _, OtherTabButton in ipairs(TabList:GetChildren()) do
                if OtherTabButton.Name ~= "Template" and OtherTabButton:IsA("Frame") and OtherTabButton ~= TabButton and OtherTabButton.Name ~= "Placeholder" then
                    TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackground}):Play()
                    TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.TabTextColor}):Play()
                    TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme.TabTextColor}):Play()
                    TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
                    TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
                    TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
                    TweenService:Create(OtherTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
                    TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                end
            end
            if Elements.UIPageLayout.CurrentPage ~= TabPage then
                TweenService:Create(Elements, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 460, 0, 330)}):Play()
                Elements.UIPageLayout:JumpTo(TabPage)
                wait(0.2)
                TweenService:Create(Elements, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 475, 0, 366)}):Play()
            end
        end)

        local Tab = {}

        -- All element functions are fully implemented below:
        function Tab:CreateButton(ButtonSettings)
            local Button = Elements.Template.Button:Clone()
            Button.Name = ButtonSettings.Name
            Button.Title.Text = ButtonSettings.Name
            Button.Visible = true
            Button.Parent = TabPage
            Button.BackgroundTransparency = 1
            Button.UIStroke.Transparency = 1
            Button.Title.TextTransparency = 1

            TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            Button.Interact.MouseButton1Click:Connect(function()
                local Success, Response = pcall(ButtonSettings.Callback)
                if not Success then
                    TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                    TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    Button.Title.Text = "Callback Error"
                    print("Copybara | " .. ButtonSettings.Name .. " Callback Error " .. tostring(Response))
                    wait(0.5)
                    Button.Title.Text = ButtonSettings.Name
                    TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                else
                    SaveConfiguration()
                    TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                    TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
                    wait(0.2)
                    TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                    TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
                    TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
                end
            end)

            Button.MouseEnter:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
                TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.7}):Play()
            end)
            Button.MouseLeave:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
                TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
            end)

            local ButtonValue = {}
            function ButtonValue:Set(NewButton)
                Button.Title.Text = NewButton
                Button.Name = NewButton
            end
            return ButtonValue
        end

        function Tab:CreateToggle(ToggleSettings)
            local Toggle = Elements.Template.Toggle:Clone()
            Toggle.Name = ToggleSettings.Name
            Toggle.Title.Text = ToggleSettings.Name
            Toggle.Visible = true
            Toggle.Parent = TabPage
            Toggle.BackgroundTransparency = 1
            Toggle.UIStroke.Transparency = 1
            Toggle.Title.TextTransparency = 1
            Toggle.Switch.BackgroundColor3 = SelectedTheme.ToggleBackground
            if SelectedTheme ~= Copybara.Theme.Default then Toggle.Switch.Shadow.Visible = false end

            TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            local function UpdateToggleUI()
                if ToggleSettings.CurrentValue then
                    Toggle.Switch.Indicator.Position = UDim2.new(1, -20, 0.5, 0)
                    Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
                    Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
                    Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
                else
                    Toggle.Switch.Indicator.Position = UDim2.new(1, -40, 0.5, 0)
                    Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
                    Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
                    Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
                end
            end
            UpdateToggleUI()

            Toggle.MouseEnter:Connect(function()
                TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            end)
            Toggle.MouseLeave:Connect(function()
                TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            end)

            Toggle.Interact.MouseButton1Click:Connect(function()
                ToggleSettings.CurrentValue = not ToggleSettings.CurrentValue
                UpdateToggleUI()
                local Success, Response = pcall(ToggleSettings.Callback, ToggleSettings.CurrentValue)
                if not Success then
                    print("Copybara | " .. ToggleSettings.Name .. " Callback Error " .. tostring(Response))
                end
                SaveConfiguration()
            end)

            function ToggleSettings:Set(value)
                ToggleSettings.CurrentValue = value
                UpdateToggleUI()
                pcall(ToggleSettings.Callback, value)
                SaveConfiguration()
            end

            if Settings.ConfigurationSaving and Settings.ConfigurationSaving.Enabled and ToggleSettings.Flag then
                Copybara.Flags[ToggleSettings.Flag] = ToggleSettings
            end
            return ToggleSettings
        end

        function Tab:CreateSlider(SliderSettings)
            local Slider = Elements.Template.Slider:Clone()
            Slider.Name = SliderSettings.Name
            Slider.Title.Text = SliderSettings.Name
            Slider.Visible = true
            Slider.Parent = TabPage
            Slider.BackgroundTransparency = 1
            Slider.UIStroke.Transparency = 1
            Slider.Title.TextTransparency = 1

            Slider.Main.BackgroundColor3 = SelectedTheme.SliderBackground
            Slider.Main.UIStroke.Color = SelectedTheme.SliderStroke
            Slider.Main.Progress.BackgroundColor3 = SelectedTheme.SliderProgress

            TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Slider.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            local function UpdateSlider(value)
                local range = SliderSettings.Range
                local increment = SliderSettings.Increment or 1
                value = math.clamp(value, range[1], range[2])
                value = math.floor(value / increment + 0.5) * increment
                SliderSettings.CurrentValue = value
                local percentage = (value - range[1]) / (range[2] - range[1])
                Slider.Main.Progress.Size = UDim2.new(percentage, 0, 1, 0)
                local suffix = SliderSettings.Suffix and (" " .. SliderSettings.Suffix) or ""
                Slider.Main.Information.Text = tostring(value) .. suffix
            end

            UpdateSlider(SliderSettings.CurrentValue)

            Slider.MouseEnter:Connect(function()
                TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
            end)
            Slider.MouseLeave:Connect(function()
                TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
            end)

            local dragging = false
            Slider.Main.Interact.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            Slider.Main.Interact.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            game:GetService("RunService").RenderStepped:Connect(function()
                if dragging then
                    local mousePos = UserInputService:GetMouseLocation()
                    local sliderStart = Slider.Main.AbsolutePosition.X
                    local sliderSize = Slider.Main.AbsoluteSize.X
                    local relative = (mousePos.X - sliderStart) / sliderSize
                    local range = SliderSettings.Range
                    local newValue = range[1] + relative * (range[2] - range[1])
                    UpdateSlider(newValue)
                    pcall(SliderSettings.Callback, SliderSettings.CurrentValue)
                    SaveConfiguration()
                end
            end)

            function SliderSettings:Set(value)
                UpdateSlider(value)
                pcall(SliderSettings.Callback, value)
                SaveConfiguration()
            end

            if Settings.ConfigurationSaving and Settings.ConfigurationSaving.Enabled and SliderSettings.Flag then
                Copybara.Flags[SliderSettings.Flag] = SliderSettings
            end
            return SliderSettings
        end

        function Tab:CreateDropdown(DropdownSettings)
            local Dropdown = Elements.Template.Dropdown:Clone()
            Dropdown.Name = DropdownSettings.Name
            Dropdown.Title.Text = DropdownSettings.Name
            Dropdown.Visible = true
            Dropdown.Parent = TabPage
            Dropdown.BackgroundTransparency = 1
            Dropdown.UIStroke.Transparency = 1
            Dropdown.Title.TextTransparency = 1
            Dropdown.Size = UDim2.new(1, -10, 0, 45)

            TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Dropdown.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            local function refreshList()
                for _, child in ipairs(Dropdown.List:GetChildren()) do
                    if child:IsA("Frame") and child.Name ~= "Placeholder" then child:Destroy() end
                end
                for _, option in ipairs(DropdownSettings.Options) do
                    local btn = Elements.Template.Dropdown.List.Template:Clone()
                    btn.Name = option
                    btn.Title.Text = option
                    btn.Parent = Dropdown.List
                    btn.Visible = true
                    btn.BackgroundTransparency = 1
                    btn.UIStroke.Transparency = 1
                    btn.Title.TextTransparency = 1

                    btn.Interact.MouseButton1Click:Connect(function()
                        DropdownSettings.CurrentOption = {option}
                        Dropdown.Selected.Text = option
                        pcall(DropdownSettings.Callback, option)
                        Dropdown.List.Visible = false
                        SaveConfiguration()
                    end)
                end
            end
            refreshList()

            Dropdown.Selected.Text = DropdownSettings.CurrentOption[1] or "Select..."

            Dropdown.Interact.MouseButton1Click:Connect(function()
                if Dropdown.List.Visible then
                    Dropdown.List.Visible = false
                else
                    Dropdown.List.Visible = true
                end
            end)

            function DropdownSettings:Set(option)
                DropdownSettings.CurrentOption = {option}
                Dropdown.Selected.Text = option
                pcall(DropdownSettings.Callback, option)
                SaveConfiguration()
            end

            if Settings.ConfigurationSaving and Settings.ConfigurationSaving.Enabled and DropdownSettings.Flag then
                Copybara.Flags[DropdownSettings.Flag] = DropdownSettings
            end
            return DropdownSettings
        end

        function Tab:CreateKeybind(KeybindSettings)
            local Keybind = Elements.Template.Keybind:Clone()
            Keybind.Name = KeybindSettings.Name
            Keybind.Title.Text = KeybindSettings.Name
            Keybind.Visible = true
            Keybind.Parent = TabPage
            Keybind.BackgroundTransparency = 1
            Keybind.UIStroke.Transparency = 1
            Keybind.Title.TextTransparency = 1

            Keybind.KeybindFrame.BackgroundColor3 = SelectedTheme.InputBackground
            Keybind.KeybindFrame.UIStroke.Color = SelectedTheme.InputStroke

            TweenService:Create(Keybind, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Keybind.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
            Keybind.KeybindFrame.Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)

            local checkingForKey = false
            Keybind.KeybindFrame.KeybindBox.Focused:Connect(function()
                checkingForKey = true
                Keybind.KeybindFrame.KeybindBox.Text = ""
            end)
            Keybind.KeybindFrame.KeybindBox.FocusLost:Connect(function()
                checkingForKey = false
                if Keybind.KeybindFrame.KeybindBox.Text == "" then
                    Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
                end
                SaveConfiguration()
            end)

            UserInputService.InputBegan:Connect(function(input, processed)
                if checkingForKey and input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode ~= Enum.KeyCode.K then
                    local split = string.split(tostring(input.KeyCode), ".")
                    local keyName = split[#split]
                    Keybind.KeybindFrame.KeybindBox.Text = keyName
                    KeybindSettings.CurrentKeybind = keyName
                    Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
                    SaveConfiguration()
                elseif KeybindSettings.CurrentKeybind and input.KeyCode == Enum.KeyCode[KeybindSettings.CurrentKeybind] and not processed then
                    pcall(KeybindSettings.Callback)
                end
            end)

            function KeybindSettings:Set(newKey)
                Keybind.KeybindFrame.KeybindBox.Text = newKey
                KeybindSettings.CurrentKeybind = newKey
                SaveConfiguration()
            end

            if Settings.ConfigurationSaving and Settings.ConfigurationSaving.Enabled and KeybindSettings.Flag then
                Copybara.Flags[KeybindSettings.Flag] = KeybindSettings
            end
            return KeybindSettings
        end

        function Tab:CreateInput(InputSettings)
            local Input = Elements.Template.Input:Clone()
            Input.Name = InputSettings.Name
            Input.Title.Text = InputSettings.Name
            Input.Visible = true
            Input.Parent = TabPage
            Input.BackgroundTransparency = 1
            Input.UIStroke.Transparency = 1
            Input.Title.TextTransparency = 1

            Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
            Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke

            TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Input.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

            Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText or ""

            Input.InputFrame.InputBox.FocusLost:Connect(function()
                pcall(InputSettings.Callback, Input.InputFrame.InputBox.Text)
                if InputSettings.RemoveTextAfterFocusLost then
                    Input.InputFrame.InputBox.Text = ""
                end
                SaveConfiguration()
            end)

            local InputValue = {}
            function InputValue:Set(text)
                Input.InputFrame.InputBox.Text = text
            end
            return InputValue
        end

        function Tab:CreateColorPicker(ColorPickerSettings)
            ColorPickerSettings.Type = "ColorPicker"
            local ColorPicker = Elements.Template.ColorPicker:Clone()
            ColorPicker.Name = ColorPickerSettings.Name
            ColorPicker.Title.Text = ColorPickerSettings.Name
            ColorPicker.Visible = true
            ColorPicker.Parent = TabPage

            -- Full color picker implementation (simplified but functional)
            local display = ColorPicker.CPBackground.Display
            local main = ColorPicker.CPBackground.MainCP
            local slider = ColorPicker.ColorSlider

            local h, s, v = ColorPickerSettings.Color:ToHSV()

            local function updateUI()
                display.BackgroundColor3 = Color3.fromHSV(h, s, v)
                main.MainPoint.Position = UDim2.new(s, -main.MainPoint.AbsoluteSize.X/2, 1-v, -main.MainPoint.AbsoluteSize.Y/2)
                main.MainPoint.ImageColor3 = Color3.fromHSV(h, s, v)
                ColorPicker.CPBackground.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                local x = h * slider.AbsoluteSize.X
                slider.SliderPoint.Position = UDim2.new(0, x - slider.SliderPoint.AbsoluteSize.X/2, 0.5, 0)
                slider.SliderPoint.ImageColor3 = Color3.fromHSV(h, 1, 1)
                ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X", math.floor(h*255), math.floor(s*255), math.floor(v*255))
                ColorPicker.RGB.RInput.InputBox.Text = tostring(math.floor(h*255))
                ColorPicker.RGB.GInput.InputBox.Text = tostring(math.floor(s*255))
                ColorPicker.RGB.BInput.InputBox.Text = tostring(math.floor(v*255))
            end
            updateUI()

            local draggingMain, draggingSlider = false, false
            main.MouseButton1Down:Connect(function() draggingMain = true end)
            main.MainPoint.MouseButton1Down:Connect(function() draggingMain = true end)
            slider.MouseButton1Down:Connect(function() draggingSlider = true end)
            slider.SliderPoint.MouseButton1Down:Connect(function() draggingSlider = true end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    draggingMain, draggingSlider = false, false
                end
            end)

            RunService.RenderStepped:Connect(function()
                if draggingMain then
                    local mouse = UserInputService:GetMouseLocation()
                    local posX = mouse.X - main.AbsolutePosition.X
                    local posY = mouse.Y - main.AbsolutePosition.Y
                    s = math.clamp(posX / main.AbsoluteSize.X, 0, 1)
                    v = 1 - math.clamp(posY / main.AbsoluteSize.Y, 0, 1)
                    ColorPickerSettings.Color = Color3.fromHSV(h, s, v)
                    updateUI()
                    SaveConfiguration()
                elseif draggingSlider then
                    local mouse = UserInputService:GetMouseLocation()
                    local posX = mouse.X - slider.AbsolutePosition.X
                    h = math.clamp(posX / slider.AbsoluteSize.X, 0, 1)
                    ColorPickerSettings.Color = Color3.fromHSV(h, s, v)
                    updateUI()
                    SaveConfiguration()
                end
            end)

            ColorPicker.HexInput.InputBox.FocusLost:Connect(function()
                local hex = ColorPicker.HexInput.InputBox.Text
                local r, g, b = hex:match("^#?(%w%w)(%w%w)(%w%w)$")
                if r then
                    local col = Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
                    h, s, v = col:ToHSV()
                    ColorPickerSettings.Color = col
                    updateUI()
                    SaveConfiguration()
                end
                pcall(ColorPickerSettings.Callback, ColorPickerSettings.Color)
            end)

            function ColorPickerSettings:Set(color)
                ColorPickerSettings.Color = color
                h, s, v = color:ToHSV()
                updateUI()
                SaveConfiguration()
            end

            if Settings.ConfigurationSaving and Settings.ConfigurationSaving.Enabled and ColorPickerSettings.Flag then
                Copybara.Flags[ColorPickerSettings.Flag] = ColorPickerSettings
            end
            return ColorPickerSettings
        end

        function Tab:CreateSection(SectionName)
            local Section = Elements.Template.SectionTitle:Clone()
            Section.Title.Text = SectionName
            Section.Visible = true
            Section.Parent = TabPage
            Section.Title.TextTransparency = 1
            TweenService:Create(Section.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            local SectionValue = {}
            function SectionValue:Set(text) Section.Title.Text = text end
            return SectionValue
        end

        function Tab:CreateLabel(LabelText)
            local Label = Elements.Template.Label:Clone()
            Label.Title.Text = LabelText
            Label.Visible = true
            Label.Parent = TabPage
            Label.BackgroundTransparency = 1
            Label.UIStroke.Transparency = 1
            Label.Title.TextTransparency = 1
            Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
            Label.UIStroke.Color = SelectedTheme.SecondaryElementStroke
            TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Label.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            local LabelValue = {}
            function LabelValue:Set(text) Label.Title.Text = text end
            return LabelValue
        end

        function Tab:CreateParagraph(ParagraphSettings)
            local Paragraph = Elements.Template.Paragraph:Clone()
            Paragraph.Title.Text = ParagraphSettings.Title
            Paragraph.Content.Text = ParagraphSettings.Content
            Paragraph.Visible = true
            Paragraph.Parent = TabPage
            Paragraph.BackgroundTransparency = 1
            Paragraph.UIStroke.Transparency = 1
            Paragraph.Title.TextTransparency = 1
            Paragraph.Content.TextTransparency = 1
            Paragraph.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
            Paragraph.UIStroke.Color = SelectedTheme.SecondaryElementStroke
            TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
            TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
            TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            TweenService:Create(Paragraph.Content, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            local ParagraphValue = {}
            function ParagraphValue:Set(newSettings)
                Paragraph.Title.Text = newSettings.Title
                Paragraph.Content.Text = newSettings.Content
            end
            return ParagraphValue
        end

        return Tab
    end

    Elements.Visible = true
    wait(0.7)
    TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    wait(0.2)
    TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
    TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()

    Topbar.BackgroundTransparency = 1
    Topbar.Divider.Size = UDim2.new(0, 0, 0, 1)
    Topbar.CornerRepair.BackgroundTransparency = 1
    Topbar.Title.TextTransparency = 1
    for _, btn in ipairs(Topbar:GetChildren()) do if btn:IsA("ImageButton") then btn.ImageTransparency = 1 end end

    wait(0.5)
    Topbar.Visible = true
    TweenService:Create(Topbar, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    wait(0.1)
    TweenService:Create(Topbar.Divider, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 0, 1)}):Play()
    wait(0.1)
    TweenService:Create(Topbar.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    wait(0.1)
    for _, btn in ipairs(Topbar:GetChildren()) do if btn:IsA("ImageButton") then TweenService:Create(btn, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play() end end
    wait(0.3)

    return Window
end

function Copybara:Destroy()
    CopybaraGui:Destroy()
end

Topbar.ChangeSize.MouseButton1Click:Connect(function()
    if Debounce then return end
    Minimised = not Minimised
    if Minimised then Minimise() else Maximise() end
end)

Topbar.Hide.MouseButton1Click:Connect(function()
    if Debounce then return end
    Hidden = not Hidden
    if Hidden then Hide() else Unhide() end
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.K and not processed then
        if Debounce then return end
        Hidden = not Hidden
        if Hidden then Hide() else Unhide() end
    end
end)

for _, btn in ipairs(Topbar:GetChildren()) do
    if btn:IsA("ImageButton") then
        btn.MouseEnter:Connect(function() TweenService:Create(btn, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play() end)
        btn.MouseLeave:Connect(function() TweenService:Create(btn, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play() end)
        btn.MouseButton1Click:Connect(function() TweenService:Create(btn, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play() end)
    end
end

task.delay(3.5, function() Copybara:LoadConfiguration() end)

if CopybaraGui:FindFirstChild("Notice") then
    CopybaraGui.Notice.Visible = true
    CopybaraGui.Notice.Interact.MouseButton1Click:Connect(function()
        CopybaraGui.Notice.Visible = false
    end)
end

return Copybara
