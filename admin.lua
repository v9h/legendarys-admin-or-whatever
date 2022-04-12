repeat wait(1 / 60) until game:IsLoaded()

local invite = "https://discord.gg/kvgaCNBHHd"
local http = game:GetService('HttpService')
local req = (syn and syn.request) or (http and http.request) or http_request
    if req then
        req({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                Origin = 'https://discord.com'
            },
            Body = http:JSONEncode({
                cmd = 'INVITE_BROWSER',
                nonce = http:GenerateGUID(false),
                args = {code = invite}
            })
        })
end
if not isfile("legendary0001.lua") then
	writefile("legendary0001.lua", ".")
end
if game.PlaceId == 417267366 then
	coroutine.wrap(function()
		wait(.5)
		game.Players.LocalPlayer.PlayerGui.ScreenGui:Destroy()
	end)()
end
local success, response = pcall(function()
local Admin = {
	Prefix = readfile("legendary0001.lua"),
	Name = "legendary's admin",
	Version = "v1.0.1 -- new commands, improved fling"
}

function DeltaWait(n)
    local now = tick()
    n = n or 0
    repeat game:GetService("RunService").Heartbeat:Wait()
    until tick()-now >= n
    return tick()-now
end

function tablefind(tab,el)
    for index, value in pairs(tab) do
        if value == el then
            return index
        end
    end
end

function createWatermark(watermarkText)
	local date_table = os.date("*t")


	local monthTable = {
		"January",
		"February",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December"

	}
    local ScreenSize = workspace.Camera.ViewportSize
    local main = Instance.new("ScreenGui")
    local mainFrame = Instance.new("Frame")
    local gradient = Instance.new("UIGradient")
	local watermark = Instance.new("TextLabel")

    main.Parent = game.CoreGui
    main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main.IgnoreGuiInset = true

    mainFrame.Name = "mainFrame"
    mainFrame.Parent = main
    mainFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
    mainFrame.BorderSizePixel = 1
    mainFrame.BorderColor3 = Color3.fromRGB(0.0,0)
    mainFrame.ClipsDescendants = false
    mainFrame.Size = UDim2.new(1,0,.006,0)
    mainFrame.Position = UDim2.new(0,0,0,0)

    gradient.Parent = mainFrame
    gradient.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(.5, 0),
        NumberSequenceKeypoint.new(1, 0)
    }
    local stage1 = Color3.fromRGB(55,177,218) 
    local stage2 = Color3.fromRGB(201,72,205) 
    local stage3 = Color3.fromRGB(204,227,53)

    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, stage1),
        ColorSequenceKeypoint.new(0.5, stage2),
        ColorSequenceKeypoint.new(1, stage3)
    }

	watermark['Name'] = "watermark"
	watermark['Parent'] = mainFrame
	watermark['BackgroundColor3'] = Color3.fromRGB(255,255,255)
	watermark['BackgroundTransparency'] = 1.000
	watermark['BorderSizePixel'] = 0
	watermark['Position'] = UDim2.new(0,0,3,0)
	watermark['Size'] = UDim2.new(1,1,1,1)
	watermark['Font'] = Enum['Font'].Code
	watermark.Text = Admin.Name.." "..Admin.Version .. ""..game.Players.LocalPlayer.DisplayName.. "  "..monthTable[date_table.month].." "..date_table.day..", "..date_table.year
	watermark.TextColor3 = Color3.fromRGB(255,255,255)
	watermark.TextSize = 15.000
	watermark.TextXAlignment = Enum.TextXAlignment.Center
	watermark.TextWrapped = true
    watermark.TextStrokeTransparency = 0
    watermark.TextStrokeColor3 = Color3.fromRGB(0,0,0)
end

local coreGui = game.CoreGui
local slideFrame = Instance.new("Frame")
local slideGui = Instance.new("ScreenGui")
local uil = Instance.new('UIListLayout')

slideGui.Parent = coreGui
slideGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

slideFrame.Parent = slideGui
slideFrame.BackgroundTransparency = 1
slideFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
slideFrame.BorderSizePixel = 0
slideFrame.ClipsDescendants = false
slideFrame.Size = UDim2.new(.5,0,.5,0)
slideFrame.Position = UDim2.new(0.008,0,0.48,0)
slideFrame.ClipsDescendants = true

uil.Parent = slideFrame
uil.VerticalAlignment = "Bottom"

function Tween(obj, dist, time)
    local tween = game:GetService("TweenService")
    local ti = TweenInfo.new(time, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local tw = tween:Create(obj, ti, dist)
    tw:Play()
end

function Notify(Text,messageType)
    local notifText = Instance.new("TextLabel")
    local notifText2 = Instance.new("TextLabel")

    notifText.Parent = slideFrame
    notifText.BackgroundColor3 = Color3.fromRGB(255,255,255)
    notifText.BackgroundTransparency = 1
    notifText.BorderSizePixel = 0
    notifText.Position = UDim2.new(0,0,0,0)
    notifText.Size = UDim2.new(1,0,0.1,0)
    notifText.Font = Enum.Font.Code
    notifText.TextTransparency = 0
    if messageType == 'error' then
        notifText.Text = "[error]: "..Text
        notifText.TextColor3 = Color3.fromRGB(255, 50, 50)
    else
        notifText.Text = "[noti]: "..Text
        notifText.TextColor3 = Color3.fromRGB(255,255,255)
    end
    notifText.TextSize = 15.000
    notifText.TextXAlignment = Enum.TextXAlignment.Left
    notifText.TextWrapped = true
    notifText.TextStrokeTransparency = 0
    notifText.TextStrokeColor3 = Color3.fromRGB(0,0,0)
coroutine.wrap(function()
    wait(15)
    local Info = TweenInfo.new(1)
    local Tween = game:GetService("TweenService"):Create(notifText,Info,{TextTransparency=1})
    Tween:Play()
    local Info = TweenInfo.new(1)
    local Tween = game:GetService("TweenService"):Create(notifText,Info,{TextStrokeTransparency=1})
    Tween:Play()
    wait(1)
    notifText:Destroy()
end)()
end
Notify("loaded ver: " ..Admin.Version)

local ScreenSize = workspace.Camera.ViewportSize
Be = Instance.new('BlurEffect')
Be.Parent = game.Lighting
Be.Enabled = false
gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false
gui.Name = "Command Bar"
Main = Instance.new("Frame", gui)
Main.BackgroundTransparency = 1
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5,0,0.8,0)
Main.Position = UDim2.new(0.5,0,0.8,0)
Main.Size = UDim2.new(0, 0, 0, ScreenSize.Y/16)
Exec = Instance.new("TextBox", Main)
Exec.BackgroundTransparency = 0.4
Exec.BorderSizePixel = 0
Exec.BackgroundColor3 = Color3.new(0, 0, 0)
Exec.BorderColor3 = Color3.new(0, 0, 127)
Exec.Name = "Execute"
Exec.AnchorPoint = Vector2.new(0.5,0,0.8,0)
Exec.Size = UDim2.new(0, 0, 0, ScreenSize.Y/16)
Exec.Font = "Legacy"
Exec.TextSize = 14
Exec.Text = ""
Exec.TextColor3 = Color3.new(255, 255, 255)
Exec.TextStrokeColor3 = Color3.new(0, 0, 127)
Exec.TextStrokeTransparency = 1
Exec.TextWrapped = true
Exec.FocusLost:connect(function(enterPressed)
	Exec.Text = ""
	Exec:TweenSize(UDim2.new(0, 0, 0, ScreenSize.Y/16), Enum.EasingDirection.In, Enum.EasingStyle.Linear, .05)
	wait(.05)
	Be.Enabled = false
end)
function onKeyPress(actionName, userInputState, inputObject)
	Exec:TweenSize(UDim2.new(0, ScreenSize.X/8, 0, ScreenSize.Y/16), Enum.EasingDirection.In, Enum.EasingStyle.Linear, .05)
	wait(.05)
	Be.Enabled = true
	Exec.Text = ""
	Exec:CaptureFocus()
end
game.ContextActionService:BindAction("keyPress", onKeyPress, false, Enum.KeyCode.Semicolon)

function Chat(Message)
    wait(.2)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Message,"All")
end

function DeltaWait(n)
    local now = tick()
    n = n or 0
    repeat game:GetService("RunService").Heartbeat:Wait()
    until tick()-now >= n
    return tick()-now
end

function findplr(args)
	if args == "me" then
		return LocalPlayer
	elseif args == "random" then 
		return game:GetService("Players"):GetPlayers()[math.random(1, #game:GetService("Players"):GetPlayers())]
	elseif args == "new" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.AccountAge < 30 and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "old" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.AccountAge > 30 and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "bacon" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Character:FindFirstChild("Pal Hair") or v.Character:FindFirstChild("Kate Hair") and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "friend" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v:IsFriendsWith(LocalPlayer.UserId) and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "notfriend" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if not v:IsFriendsWith(LocalPlayer.UserId) and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "ally" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Team == LocalPlayer.Team and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "enemy" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Team ~= LocalPlayer.Team then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "near" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= LocalPlayer then
				local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
				if math < 30 then
					vAges[#vAges + 1] = v
				end
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "far" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= LocalPlayer then
				local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
				if math > 30 then
					vAges[#vAges + 1] = v
				end
			end
		end
		return vAges[math.random(1, #vAges)]
	else 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if string.find(string.lower(v.Name), string.lower(args)) then
				return 
			end
		end
	end
end

local mt = getrawmetatable(game)
local LocalPlayer = game.Players.LocalPlayer
local Character = game.Players.LocalPlayer.Character
local Workspace = game:GetService("Workspace")


local hum = game.Players.LocalPlayer.Character
local p = game:GetService("Players").LocalPlayer


--// functions

local speed = 100 -- not my fly script

local c
local h
local bv
local bav
local cam
local flying
local p = game.Players.LocalPlayer
local buttons = {
	W = false,
	S = false,
	A = false,
	D = false,
	Moving = false
}

local yesfly = function () 
	if not p.Character or not p.Character.Head or flying then
		return
	end
	
	c = p.Character
	h = c.Humanoid
	h.PlatformStand = true
	cam = workspace:WaitForChild('Camera')
	bv = Instance.new("BodyVelocity")
	bav = Instance.new("BodyAngularVelocity")
	bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
	bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
	bv.Parent = c.Head
	bav.Parent = c.Head
	flying = true
	h.Died:connect(function()
		flying = false
	end)
end

local nofly = function () -- stop flying
	if not p.Character or not flying then
		return
	end
	h.PlatformStand = false
	bv:Destroy()
	bav:Destroy()
	flying = false
end

game:GetService("UserInputService").InputBegan:connect(function (input, GPE)
	if GPE then
		return
	end
	for i, e in pairs(buttons) do
		if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
			buttons[i] = true
			buttons.Moving = true
		end
	end
end)

function Encode(eid)

	local player = LocalPlayer['Name']
	local normalid = eid
	local reid = normalid
	
	local char_to_hex = function(c)
	return string.format("%%%02X", string.byte(c))
	end
	
	local function urlencode(url)
	if url == nil then
		return
	end 
	url = url:gsub("\n", "\r\n")
	url = url:gsub(".", char_to_hex)
	url = url:gsub(" ", "+")
	return url
	end
	function FixId(id)
		local dab = game:HttpGet("https://www.roblox.com/studio/plugins/info?assetId="..id)
		if string.find(dab, 'value="') then
			local epic = string.find(dab, 'value="')
			local almost = string.sub(dab, epic + 7, epic + 18)
			local filter1 = string.gsub(almost, " ", "")
			local filter2 = string.gsub(filter1, "/", "")
			local filter3 = string.gsub(filter2, ">", "")
			local filter4 = string.gsub(filter3, '"', "")
			local versionid = string.gsub(filter4, "<", "")
			return versionid
		end
	end
	local avidStr = "&assetversionid="
	local encid = FixId(reid)
	_G.song =avidStr .. encid


end

game:GetService("UserInputService").InputEnded:connect(function (input, GPE)
	if GPE then
		return
	end
	local a = false
	for i, e in pairs(buttons) do
		if i ~= "Moving" then
			if input.KeyCode == Enum.KeyCode[i] then
				buttons[i] = false
			end
			if buttons[i] then
				a = true
			end
		end
	end
	buttons.Moving = a
end)

local setVec = function (vec)
	return vec * (speed / vec.Magnitude)
end

game:GetService("RunService").Heartbeat:connect(function (step) -- fly function calling every frame
	if flying and c and c.PrimaryPart then
		local p = c.PrimaryPart.Position
		local cf = cam.CFrame
		local ax, ay, az = cf:toEulerAnglesXYZ()
		c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
		if buttons.Moving then
			local t = Vector3.new()
			if buttons.W then
				t = t + (setVec(cf.lookVector))
			end
			if buttons.S then
				t = t - (setVec(cf.lookVector))
			end
			if buttons.A then
				t = t - (setVec(cf.rightVector))
			end
			if buttons.D then
				t = t + (setVec(cf.rightVector))
			end
			c:TranslateBy(t * step)
		end
	end
end)


local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Toggled = false
local Keybind = "x"

Mouse.KeyDown:Connect(function(Key)
	if Key == Keybind then
		if Toggled then
			Toggled = false
			nofly()
		else
			Toggled = true
			yesfly()
		end
	end
end)

function GetPlayer(target)
	local plrs = game:GetService("Players"):GetPlayers()
	if target:lower() == "all" then
		return plrs
	elseif target:lower() == "others" then
		for index, plr in pairs(plrs) do
			if plr == game:GetService("Players").LocalPlayer then
				table.remove(plrs, index)
				return plrs
			end
		end
	elseif target:lower() == "me" then
		return {
			game:GetService("Players").LocalPlayer
		}
	else
		local plrTargets = {}
		for index, plr in pairs(plrs) do
			if plr.Name:sub(1, #target):lower() == target:lower() or plr.DisplayName:sub(1, #target):lower() == target:lower() then
				table.insert(plrTargets, plr)
			end
		end
		return plrTargets
	end
end
local Commands = {}
function AddCommand(CmdName, func)
	Commands[CmdName] = CmdName
	LocalPlayer.Chatted:Connect(function(msg)
		msg = msg:lower()
		args = msg:split(' ')
		if args[1] == Admin.Prefix..CmdName then
			
			task.wait()
			local success, err = pcall(function()
				coroutine.wrap(function()
					func()
				end)()
			end)
			if success then
				if args[2] then
					Notify("executed: "..CmdName.." "..args[2])
				else
					Notify("executed: "..CmdName)
				end
			end
			if err then
				Notify(err,'error')
			end
		end

	end)
	Exec.FocusLost:Connect(function(text)
		if text then
			text = Exec.Text:lower()
			args = text:split(' ')
			if args[1] == Commands[CmdName] then

				task.wait()
				local success, err = pcall(function()
					coroutine.wrap(function()
						func()
					end)()
				end)
				if success then
					if args[2] then
						Notify("executed: "..CmdName.." "..args[2])
					else
						Notify("executed: "..CmdName)
					end
				end
				if err then
					Notify(err,'error')
				end
			end
		end
	end)
end
function sync(Time)
	local Objects = game.Players.LocalPlayer.Character:GetDescendants()
	for I = 1, #Objects do
		local Object = Objects[I]
		if game.IsA(Object, 'Sound') then
			Object.TimePosition = Object.TimePosition + 0.00000000000001
		end
	end    
end
AddCommand("resync", function(Time)
	for _, Target in pairs(GetPlayer(args[2])) do
		local Objects = Target.Character:GetDescendants()
		for I = 1, #Objects do
			local Object = Objects[I]
			if game.IsA(Object, 'Sound') then
				Object.TimePosition = 0
			end
		end
	end
end)
local laggingnl = false
AddCommand("netlag", function()

local Target = args[2]

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local function GetPlayer(Name)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    Name = Name:lower():gsub(" ","")
    for _,x in next, Players:GetPlayers() do
        if x ~= LocalPlayer then
            if x.Name:lower():match("^"..Name) then
                return x
            elseif x.DisplayName:lower():match("^"..Name) then
                return x
            end
        end
    end
end

if not GetPlayer(Target) then
    return Message("Error:","Target not valid.")
elseif GetPlayer(Target).Name == Player.Name then
    return Message("Error:","Target is equal to Player.")
end

local TargetMetaVars = {}

TargetMetaVars["TPlayer"] = GetPlayer(Target)
TargetMetaVars["TCharacter"] = TargetMetaVars["TPlayer"].Character or false

local ErrorCheck = false

for _,x in next, TargetMetaVars do
    if not x then
        ErrorCheck = true
    end
end

if ErrorCheck then return end

local Set_Hidden = sethiddenproperty

while RunService.Stepped:wait() do
    for _,x in next, TargetMetaVars.TCharacter:GetDescendants() do
        if x:IsA("BasePart") then
            Set_Hidden(x, "NetworkIsSleeping", true)
        end
    end
end

end)

AddCommand("unnetlag", function()
local Target = args[2]

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local function GetPlayer(Name)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    Name = Name:lower():gsub(" ","")
    for _,x in next, Players:GetPlayers() do
        if x ~= LocalPlayer then
            if x.Name:lower():match("^"..Name) then
                return x
            elseif x.DisplayName:lower():match("^"..Name) then
                return x
            end
        end
    end
end

if not GetPlayer(Target) then
    return Message("Error:","Target not valid.")
elseif GetPlayer(Target).Name == Player.Name then
    return Message("Error:","Target is equal to Player.")
end

local TargetMetaVars = {}

TargetMetaVars["TPlayer"] = GetPlayer(Target)
TargetMetaVars["TCharacter"] = TargetMetaVars["TPlayer"].Character or false

local ErrorCheck = false

for _,x in next, TargetMetaVars do
    if not x then
        ErrorCheck = true
    end
end

if ErrorCheck then return end

local Set_Hidden = sethiddenproperty

while RunService.Stepped:wait() do
    for _,x in next, TargetMetaVars.TCharacter:GetDescendants() do
        if x:IsA("BasePart") then
            Set_Hidden(x, "NetworkIsSleeping", false)
        end
    end
end

end)

--sync function

AddCommand("sync",function(Time)
	local Objects = LocalPlayer.Character:GetDescendants()
	for I = 1, #Objects do
		local Object = Objects[I]
		if game.IsA(Object, 'Sound') then
			Object.TimePosition = Object.TimePosition + 0.00000000000001
		end
	end
end)

AddCommand("desync",function(Time)
	for _, Target in pairs(GetPlayer(args[2])) do
		local Objects = Target.Character:GetDescendants()
		for I = 1, #Objects do
			local Object = Objects[I]
			if game.IsA(Object, 'Sound') then
				Object.TimePosition = math.random(1,100)
			end
		end
		local Objects = Target.Backpack:GetDescendants()
		for I = 1, #Objects do
			local Object = Objects[I]
			if game.IsA(Object, 'Sound') then
				Object.TimePosition = math.random(1,100)
			end
		end
	end
end)

AddCommand("view", function()
	for _, Target in pairs(GetPlayer(args[2])) do
		Workspace.CurrentCamera.CameraSubject = Target.Character
	end
end)

AddCommand("unview", function()
		Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
end)

AddCommand("time", function()
	if string.lower(args[2]) == 'night' then
		game.Lighting.TimeOfDay = "20:00"
	elseif string.lower(args[2]) == 'day' then
		game.Lighting.TimeOfDay = "12:00"
	else
		game.Lighting.TimeOfDay = tostring(args[2])
	end
end)

AddCommand("lowhold",function()
	for i, v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(string.lower(v.Name), 'boomb') then
			v.Grip = CFrame.new(-0.0109999999, 0.633000016, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
			v.Parent = game.Players.LocalPlayer.Backpack
            v.Parent = game.Players.LocalPlayer.Character
			v.Handle.Massless = true

		end

	end
end)

AddCommand("backpack",function()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(string.lower(v.Name), 'boomb') then
			v.Grip = CFrame.new(-1.43400002, -0.996999979, 2.11500001, -0.672917426, -0.736945152, 0.0639854819, -0.733912885, 0.675949693, 0.0668134838, -0.0924888402, -0.00199981011, -0.995711744)
			v.GripForward = Vector3.new(-0.0639855, -0.0668135, 0.995712)
			v.GripPos = Vector3.new(-1.434, -0.997, 2.115)
			v.GripRight = Vector3.new(-0.672917, -0.733913, -0.0924888)
			v.GripUp = Vector3.new(-0.736945, 0.67595, -0.00199985)
			v.Parent = game.Players.LocalPlayer.Backpack
            v.Parent = game.Players.LocalPlayer.Character
			v.Handle.Massless = true
		end

	end
end)
local desyncing = false
AddCommand("loopdesync",function()
	desyncing = true
	while desyncing == true do
		wait(1)
		for _, Target in pairs(GetPlayer(args[2])) do
			local Objects = Target.Character:GetDescendants()
			for I = 1, #Objects do
				local Object = Objects[I]
				if game.IsA(Object, 'Sound') then
					Object.TimePosition = math.random(1,100)
				end
			end
		end
	end
end)

AddCommand("tpos",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local Objects = Target.Character:GetDescendants()
		for I = 1, #Objects do
			local Object = Objects[I]
			if game.IsA(Object, 'Sound') then
				Object.TimePosition = tonumber(args[3])
			end
		end
	end
end)
AddCommand("undesync",function()
desyncing = false
end)
local enabled = false
AddCommand("chatspy",function()
	enabled = true
	spyOnMyself = true
	public = false
	publicItalics = false
	name = HASH
	yeah = "//////////////////////////////////////////////////////////////////////////////////////////////////////"

	privateProperties = {
		Color = Color3.fromRGB(243, 171, 75);
		Font = Enum.Font.Gotham;
		TextSize = 18;
	}
	--////////////////////////////////////////////////////////////////
	local StarterGui = game:GetService("StarterGui")
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
	local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
	local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
	local instance = (_G.chatSpyInstance or 0) + 1
	_G.chatSpyInstance = instance

	local function onChatted(p, msg)
		if _G.chatSpyInstance == instance then
			if p == player and msg:lower():sub(1, 6) == yeah then
				enabled = not enabled
				wait(0.3)
				privateProperties.Text = "{chatspy "..(enabled and "EN" or "DIS").."ABLED}"
				StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
			elseif enabled and (spyOnMyself == true or p ~= player) then
				msg = msg:gsub("[\n\r]", ''):gsub("\t", ' '):gsub("[ ]+", ' ')
				local hidden = true
				local conn = getmsg.OnClientEvent:Connect(function(packet, channel)
					if packet.SpeakerUserId == p.UserId and packet.Message == msg:sub(#msg - #packet.Message + 1) and (channel == "All" or (channel == "Team" and public == false and p.Team == player.Team)) then
						hidden = false
					end
				end)
				wait(1)
				conn:Disconnect()
				if hidden and enabled then
					if public then
						saymsg:FireServer((publicItalics and "/me " or '').."{leg's admin'} [".. p.Name .."]: "..msg, "All")
					else
						privateProperties.Text = "{leg's admin'} [".. p.DisplayName .."]: "..msg
						StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
					end
				end
			end
		end
	end

	for _, p in ipairs(Players:GetPlayers()) do
		p.Chatted:Connect(function(msg)
			onChatted(p, msg)
		end)
	end
	Players.PlayerAdded:Connect(function(p)
		p.Chatted:Connect(function(msg)
			onChatted(p, msg)
		end)
	end)
	privateProperties.Text = "{chatspy "..(enabled and "EN" or "DIS").."ABLED}"
	player:WaitForChild("PlayerGui"):WaitForChild("Chat")
	StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
	wait(3)
	local chatFrame = player.PlayerGui.Chat.Frame
	chatFrame.ChatChannelParentFrame.Visible = true
	chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y)
end)
--sync function
function sync(Time)
	local Objects = LocalPlayer.Character:GetDescendants()
	for I = 1, #Objects do
		local Object = Objects[I]
		if game.IsA(Object, 'Sound') then
			Object.TimePosition = Time
		end
	end    
end
AddCommand("log",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local Sounds, Boombox = {};
		for A,B in next, Target.Character:GetChildren() do
			if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
				for C,D in next, B:GetDescendants() do
					if D:IsA('Sound') then
						if D['Playing'] ~= false and D['IsLoaded'] ~= false then
							Boombox = B; Sounds[#Sounds+1] = D; break
						end
					end
				end
			end
		end
		if Boombox == nil then
			for A,B in next, Target['Backpack']:GetChildren() do
				if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
					for C,D in next, B:GetDescendants() do
						if D:IsA('Sound') then
							if D['Playing'] ~= false and D['IsLoaded'] ~= false then
								Boombox = B; Sounds[#Sounds+1] = D; break
							end
						end
					end
				end
			end
		end
		if #Sounds < 1 then
			print('Error: user not holding a boombox')
		end
		local Sound = {nil,-1};
		for K,V in next, Sounds do
			if V['PlaybackLoudness'] > Sound[2] then
				Sound[1] = V; Sound[2] = V['PlaybackLoudness']
			end
		end
		local finalSound = string.gsub(tostring(Sound[1].SoundId), "http%:%/%/www%.roblox.com%/asset%/%?id%=", "")
		setclipboard(finalSound)
	end
end)
AddCommand("lograw",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local Sounds, Boombox = {};
		for A,B in next, Target.Character:GetChildren() do
			if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
				for C,D in next, B:GetDescendants() do
					if D:IsA('Sound') then
						if D['Playing'] ~= false and D['IsLoaded'] ~= false then
							Boombox = B; Sounds[#Sounds+1] = D; break
						end
					end
				end
			end
		end
		if Boombox == nil then
			for A,B in next, Target['Backpack']:GetChildren() do
				if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
					for C,D in next, B:GetDescendants() do
						if D:IsA('Sound') then
							if D['Playing'] ~= false and D['IsLoaded'] ~= false then
								Boombox = B; Sounds[#Sounds+1] = D; break
							end
						end
					end
				end
			end
		end
		if #Sounds < 1 then
			print('Error: user not holding a boombox')
		end
		local Sound = {nil,-1};
		for K,V in next, Sounds do
			if V['PlaybackLoudness'] > Sound[2] then
				Sound[1] = V; Sound[2] = V['PlaybackLoudness']
			end
		end
		local finalSound = tostring(Sound[1].SoundId)
		setclipboard(finalSound)
	end
end)


AddCommand("massplay",function()
	
local normalid = args[2]	
local yo1 = [[0&assetname=[ Removed for security ] &  %  6  9  %                                                                                                                                                                                                                                                  6  4  =  %  3                                                                                                                                                                                                                                                  0  %  3                                                                                                                                                                                                                                                  0                                                                                                                                                                                                                                                  ]]
local ant2_Serenity_22af15eb2a53ce5a2b5e3ac2 = [[%   %26id%3D00%513919776  %26id%3D00%6123746751 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%R%1%B01  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%6123746751 %  2  5  %  4  6  %  4  2  -  %  7  1  %   -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -    -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -    -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -   F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%R%1%B01  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5179197135  7  %3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5179197135  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130766235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%0F%R%1%B01%B01< ?=%F0%%0F%0F%F0%%0F%F0%%R%1%B01%FZ01Id=434239505012383515384129264510242032112449%F0%  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%F0%%0F%0F  %    %  W  4  915g/                                                                                                                                                                                                                                                      288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  Eg/                                                                                                                                                                                                                                                        8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%0F%0F< ?Id=434239505012383515384129264510242032112449%F0%  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  g/                                                                                                                                                                                                                                                      %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  g/                                                                                                                                                                                                                                                      7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  g/                                                                                                                                                                                                                                                      2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %g/                                                                                                                                                                                                                                                        8  B  %  E  8  g/                                                                                                                                                                                                                                                      %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w   %   %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %g/                                                                                                                                                                                                                                                        B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%0F%R%1%B01%B01< ?=%F0%%0F%0F%F0%%0F%F0%%R%1%B01%FZ01Id=4342395050123835153841292-  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 g/                                                                                                                                                                                                                                                      %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B80097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%R%1%B01%0F< ?Id=4342395050123835153841292645102g/                                                                                                                                                                                                                                                      42032112449%0F%0F%R%1%F0%%R%1%F0%%R%1%R%1%FZ01=%B01%F0%%F0%%R%1%F0%%B01%0F%B01< ?Id=434239505012383515384129264510242032112449  %26id%3D004938839149  %26id%3D005356051569  %26id%3D00833322858    %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747    &  %  6  9  %  6  4  =  %  3  0  %  3  0  ]]
local yo2 = [[]]
local LP = game.Players.LocalPlayer
local ptt, dtt = '4.2', '0.11'
local hidden = yo1 .. normalid .. yo2
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v:FindFirstChildOfClass("RemoteEvent") and v.Handle:FindFirstChildOfClass("Sound") then
			v.Parent = game.Players.LocalPlayer.Character
		end
	end

for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
    if v:IsA('Tool') then
        v:FindFirstChildOfClass'RemoteEvent':FireServer('PlaySong', hidden, ptt, '', dtt)
    end
end

end)

AddCommand("play",function()
	
local normalid = args[2]	
local yo1 = [[0&assetname=[ Removed for security ] &  %  6  9  %                                                                                                                                                                                                                                                  6  4  =  %  3                                                                                                                                                                                                                                                  0  %  3                                                                                                                                                                                                                                                  0                                                                                                                                                                                                                                                  ]]
local ant2_Serenity_22af15eb2a53ce5a2b5e3ac2 = [[%   %26id%3D00%513919776  %26id%3D00%6123746751 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%R%1%B01  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%6123746751 %  2  5  %  4  6  %  4  2  -  %  7  1  %   -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -    -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -    -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -   F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  %26id%3D00%513919776  %26id%3D00%612374675 %26id%3D00205254380  %R%1%B01%0F%B01%F0%%0F%0F%0F< ?=  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%R%1%B01  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5179197135  7  %3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5179197135  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130766235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%0F%R%1%B01%B01< ?=%F0%%0F%0F%F0%%0F%F0%%R%1%B01%FZ01Id=434239505012383515384129264510242032112449%F0%  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%F0%%0F%0F  %    %  W  4  915g/                                                                                                                                                                                                                                                      288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  Eg/                                                                                                                                                                                                                                                        8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%0F%0F< ?Id=434239505012383515384129264510242032112449%F0%  %    %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  g/                                                                                                                                                                                                                                                      %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  g/                                                                                                                                                                                                                                                      7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  g/                                                                                                                                                                                                                                                      2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %g/                                                                                                                                                                                                                                                        8  B  %  E  8  g/                                                                                                                                                                                                                                                      %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w   %   %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %g/                                                                                                                                                                                                                                                        B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%0F%R%1%B01%B01< ?=%F0%%0F%0F%F0%%0F%F0%%R%1%B01%FZ01Id=4342395050123835153841292-  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 g/                                                                                                                                                                                                                                                      %  w  q  e  f  9  F  %  8  B  %  3  D  %  W  4  915288747  %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747  0  5180097131  7  %  !  @  R  9  F  %  8  B80097131  7  %  !  @  R  9  F  %  8  B  %  E  8  %  9  130761235  7  %  B  7  %  -  C  B  %  8  D  %  2  5  8  %  4  2  %  3  -  9  %  2  5  %  4  6  %  4  2  -  %  7  1  %  F  3  %  B  3  %  -  9  C  %  8  F  %  E  7 %  w  q  e  f  9  F  %  8  B  %  3  D%R%1%B01%0F< ?Id=4342395050123835153841292645102g/                                                                                                                                                                                                                                                      42032112449%0F%0F%R%1%F0%%R%1%F0%%R%1%R%1%FZ01=%B01%F0%%F0%%R%1%F0%%B01%0F%B01< ?Id=434239505012383515384129264510242032112449  %26id%3D004938839149  %26id%3D005356051569  %26id%3D00833322858    %26id%3D00130761235  %26id%3D005180097131  %26id%3D00915288747    &  %  6  9  %  6  4  =  %  3  0  %  3  0  ]]
local yo2 = [[]]
local LP = game.Players.LocalPlayer
local ptt, dtt = '4.2', '0.11'
local hidden = yo1 .. normalid .. yo2
for i,v in ipairs(LP.Character:GetChildren()) do
    if (v['Name']:lower():match('boombox')) then
        v:FindFirstChildOfClass'RemoteEvent':FireServer('PlaySong', hidden, ptt, '', dtt)
    end
end

end)
AddCommand("demesh",function()
	for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			for _,x in pairs(v:GetDescendants()) do
				if x.Name == "Mesh" or x.Name == "SpecialMesh" then
					x:Destroy()
				end
			end
		end
	end
	for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") then
			for _,x in pairs(v:GetDescendants()) do
				if x.Name == "Mesh" or x.Name == "SpecialMesh" then
					x:Destroy()
				end
			end
		end
	end
end)
AddCommand("checktools",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local toolsInBackpack = 0
		local toolsEquipped = 0
		local toolsPlaying = 0
		for i,v in pairs(game.Players[Target.Name].Backpack:GetChildren()) do
			toolsInBackpack = toolsInBackpack + 1
		end
		for i,v in pairs(game.Players[Target.Name].Character:GetChildren()) do
			if v.ClassName == "Tool" then
				toolsEquipped = toolsEquipped + 1
			end
		end
		for i,v in pairs(game.Players[Target.Name].Character:GetChildren()) do
			if v.ClassName == "Tool" and v.Handle.Sound.IsPlaying then
				toolsPlaying = toolsPlaying + 1
			end
		end
		warn(tostring(Target.DisplayName)..'('..Target.Name..')'..': '..toolsInBackpack + toolsEquipped)
		Notify('user '..tostring(Target.DisplayName)..'[@'..Target.Name..']'..' has '..toolsInBackpack + toolsEquipped.. ' tool(s). tools playing: '..toolsPlaying)
	end
end)

AddCommand("accountinfo",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		wait(.5)
		local Years = string.split(Target.AccountAge/365,".")
		Notify(Years[1].." years or "..Target.AccountAge.." days")
	end
end)
AddCommand("unchatspy",function()
	enabled = false
end)

AddCommand("fly",function()
	wait(.1)
	yesfly()
end)

AddCommand("unfly",function()
	wait(.1)
	nofly()
end)


AddCommand("cmds",function()
	local coreGui = game.CoreGui
	local gui = Instance.new("ScreenGui")
	local mainFrame = Instance.new("Frame")
	local commandFrame = Instance.new("ScrollingFrame")
	local bar = Instance.new("Frame")
	local gradient = Instance.new("UIGradient")
	local uil = Instance.new("UIListLayout")
	local closeButton = Instance.new("TextButton")
	
	gui.Parent = coreGui
	
	mainFrame.Parent = gui
	mainFrame.ClipsDescendants = true
	mainFrame.BorderSizePixel = 1
	mainFrame.BorderColor3 = Color3.new(0,0,0)
	mainFrame.BackgroundColor3 = Color3.fromRGB(34,34,34)
	mainFrame.Position = UDim2.new(-1,0,0.3,0)
	mainFrame.Size = UDim2.new(.15,.1,.4,.1)
	
	commandFrame.Parent = mainFrame
	commandFrame.ClipsDescendants = true
	commandFrame.Size = UDim2.new(.89,0,.9,0)
	commandFrame.Position = UDim2.new(0.05,0,0.05,0)
	commandFrame.BorderSizePixel = 0
	commandFrame.ScrollBarThickness = 3
	commandFrame.BackgroundColor3 = Color3.fromRGB(16,16,16)
	commandFrame.ScrollBarImageTransparency = 1
	commandFrame.CanvasSize = UDim2.new(6,0,6,0)
	uil.Parent = commandFrame

	closeButton.Parent = mainFrame 
	closeButton.Size = UDim2.new(.1,0,.05,0)
	closeButton.Position = UDim2.new(.95,0,0,0)
	closeButton.BackgroundColor3 = Color3.new(1,1,1)
	closeButton.BackgroundTransparency = 1
	closeButton.TextColor3 = Color3.fromRGB(255,255,255)
	closeButton.Text = "X"
	closeButton.TextXAlignment = Enum.TextXAlignment.Left
	closeButton.TextStrokeTransparency = 1
	closeButton.TextStrokeColor3 = Color3.new(0,0,0)

	closeButton.MouseButton1Click:Connect(function()
		mainFrame:TweenPosition(UDim2.new(-1,0,0.3,0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, .5)
		wait(.5)
		gui:Destroy()
	end)

mainFrame:TweenPosition(UDim2.new(0,0,0.3,0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, .5)
	
	bar.Parent = mainFrame
	bar.Size = UDim2.new(.89,.1,.005,.1)
	bar.Position = UDim2.new(0.05,0,0.05,0)
	
	gradient.Parent = bar
	gradient.Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(.5, 0),
		NumberSequenceKeypoint.new(1, 0)
	}
	local stage1 = Color3.fromRGB(55,177,218) 
	local stage2 = Color3.fromRGB(201,72,205) 
	local stage3 = Color3.fromRGB(204,227,53)
	
	gradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, stage1),
		ColorSequenceKeypoint.new(0.5, stage2),
		ColorSequenceKeypoint.new(1, stage3)
	}
	
	local cmdnum = 0
	for i,v in pairs(Commands) do
		local command = Instance.new("TextLabel")
		local uia = Instance.new("UIAspectRatioConstraint")
		uia.Parent = command
		uia.AspectRatio = 8
		command.Name = i
		command.Parent = commandFrame
		command.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		command.BackgroundTransparency = 1
		command.BorderSizePixel = 0
		command.Size = UDim2.new(0, 200, 0, 50)
		command.Font = Enum.Font.Code
		command.Position = UDim2.new(0.5,0,0,0)
		command.TextXAlignment = Enum.TextXAlignment.Center
		command.Text = i
		command.TextColor3 = Color3.fromRGB(255, 255, 255)
		command.TextSize = 14.000
		cmdnum += 1
	end
	Notify('no. of cmds: '..cmdnum)
end)

AddCommand("shop",function()
	local LP = game:GetService('Players').LocalPlayer

	local ogChar = LP.Character
	LP.Character = Clone
	LP.Character = ogChar
	function shop()
		pcall(function()
			local Servers =
				game.HttpService:JSONDecode(
				game:HttpGet("https://games.roblox.com/v1/games/417267366/servers/Public?sortOrder=Asc&limit=100")
			)
			while task.wait() do
				v = Servers.data[math.random(#Servers.data)]
				if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
					break
				end
			end
		end)
	end
	
	
	local function hop()
		shop()
		while task.wait() do
			pcall(shop)
		end
	end
	hop()
end)
AddCommand("to",function()
	function tween_distance(obj, dist, time)
		local tween = game:GetService("TweenService")
		local ti = TweenInfo.new(time, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		local tw = tween:Create(obj, ti, {CFrame = dist})
		tw:Play()
	end
	for _, Target in pairs(GetPlayer(args[2])) do
		tween_distance(LocalPlayer.Character.HumanoidRootPart, Target.Character.Head.CFrame - Vector3.new(0,2,0), .1)
		LocalPlayer.Character.Humanoid.Sit = true
		wait(.1)
		LocalPlayer.Character.Humanoid.Sit = false
	end
end)
AddCommand("loud",function()
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA'Tool' then
				if v.Handle.Sound.IsPlaying and v.Handle.Sound.IsLoaded then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
					for _,x in pairs(v.Parent:GetDescendants()) do
						if x.ClassName == "Tool" and x:FindFirstChild("Handle") and x:FindFirstChildOfClass("RemoteEvent") and x.Handle:FindFirstChildOfClass("Sound") then
							_G.song = x.Handle.Sound.SoundId
						end
					end
					for _, x in pairs(LocalPlayer.Backpack:GetChildren()) do
						if x.ClassName == "Tool" and x:FindFirstChild("Handle") and x:FindFirstChildOfClass("RemoteEvent") and x.Handle:FindFirstChildOfClass("Sound") then
							x['Parent'] = game.Players.LocalPlayer.Character
						end
					end
					for _, x in pairs(game.Players.LocalPlayer['Character']:GetChildren()) do
						if string.find(string.lower(x['Name']), 'boomb') then
							local song = _G.song
							local finalSound = string.gsub(tostring(song), "http%:%/%/www%.roblox.com%/asset%/%?id%=", "")
							x.Remote:FireServer("PlaySong", finalSound);
							x.Handle.Massless = true
							Chat("logged,ez skid")
							wait(5)
						end
					end
				end
			end
		end
end)

AddCommand("vent",function()
	local RunService = game:GetService("RunService")

	local LocalPlayer = game:GetService("Players").LocalPlayer do
    local Character = LocalPlayer.Character
    local Backpack = LocalPlayer.Backpack
    local BoomBox = (Backpack:FindFirstChild("BoomBox") or Character:FindFirstChild("BoomBox"))
    
    local Humanoid = (Character:FindFirstChildOfClass("Humanoid") or nil)
    local RootPart = (Humanoid.RootPart or nil)
    
	local Keybind = 99
    if not BoomBox then return warn("no boombox") end
    if Humanoid == nil then return wanr("no humanoid") end
    if RootPart == nil then return warn("no rootpart") end
    
    -- for _,x in next, Humanoid:GetPlayingAnimationTracks() do
    --     x:Stop()
    -- end
    
    -- local Animate
    local Sound
    
    -- if Character:FindFirstChild("Animate", true) then
    --     Animate = Character:FindFirstChild("Animate", true)
    --     Animate.Disabled = true
    -- end
    
    Humanoid:EquipTool(BoomBox)
    
    if BoomBox:FindFirstChild("Remote", true) then
        BoomBox:FindFirstChild("Remote", true):FireServer("PlaySong", 5771441412)
        BoomBox.DescendantAdded:wait()
        repeat RunService.Heartbeat:wait() until BoomBox:FindFirstChildWhichIsA("Sound", true)
        Sound = BoomBox:FindFirstChildWhichIsA("Sound", true)
        Sound:Stop()
    end
    
    local function Tween(Object,Time,Style,Direction,Property)
        return game:GetService("TweenService"):Create(Object,TweenInfo.new(Time,Style,Direction),Property)
    end
    
    local Old = RootPart.CFrame
    local BreakBool = false
    
    local VelocityLoop = coroutine.wrap(function()
        while RunService.Heartbeat:wait() do
            RootPart.Velocity = Vector3.new()
            if BreakBool then
                break
            end
        end
    end)()
	
    local Baseplate = Instance.new('Part',workspace)
	Baseplate.CFrame = RootPart.CFrame + Vector3.new(0,-13,0)
	Baseplate.Size = Vector3.new(800, 1, 800)
	Baseplate.Anchored = true
    Sound:Play()
	BreakBool = true
    Tween(RootPart, .35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, {CFrame = RootPart.CFrame * CFrame.new(0,5,0)}):Play()
    wait(.35)
    Tween(RootPart, .5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, {CFrame = RootPart.CFrame * CFrame.new(0,-13.5,0)}):Play()
	game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0,10,0)
    wait(.5 + Sound.TimePosition)
	Humanoid.WalkSpeed = 25
	if BoomBox:FindFirstChild("Remote", true) then
        BoomBox:FindFirstChild("Remote", true):FireServer("PlaySong", 6604083705)
        BoomBox.DescendantAdded:wait()
        repeat RunService.Heartbeat:wait() until BoomBox:FindFirstChildWhichIsA("Sound", true)
        Sound = BoomBox:FindFirstChildWhichIsA("Sound", true)
    end
	Sound:Play()
	local venting = true
		local uis = game:GetService("UserInputService")
		
		uis.InputBegan:Connect(function(i)
			if i.KeyCode == Enum.KeyCode.Space and venting == true then
				venting = false
				if BoomBox:FindFirstChild("Remote", true) then
					BoomBox:FindFirstChild("Remote", true):FireServer("PlaySong", 5771441412)
					BoomBox.DescendantAdded:wait()
					repeat RunService.Heartbeat:wait() until BoomBox:FindFirstChildWhichIsA("Sound", true)
					Sound = BoomBox:FindFirstChildWhichIsA("Sound", true)
				end
				Humanoid.WalkSpeed = 16
				Tween(RootPart, .5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, {CFrame = RootPart.CFrame + Vector3.new(0,12.5,0)}):Play()
				game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0,0,0)
				wait(.5)
				
				-- if Animate then
				--     Animate.Disabled = false
				-- end
				BreakBool = true
				Baseplate:Destroy()
				wait(Sound.TimePosition)
				Humanoid:UnequipTools()
			end
		end)
end
end)
local mutedPlayers = {}

game:GetService('RunService').RenderStepped:Connect(function()
	for _,player in next, mutedPlayers do
		if player ~= game.Players.LocalPlayer then
			for i,v in next, player.Character:GetDescendants() do
				if v:IsA'Sound' then
					v.Playing = false
				end
			end
			for i,v in next, player.Backpack:GetDescendants() do
				if v:IsA'Sound' then
					v.Playing = false
				end
			end
		end
	end
end)

game:GetService('Players').PlayerRemoving:Connect(function(plr)
	if table.find(mutedPlayers, plr) then
		table.remove(mutedPlayers, tablefind(mutedPlayers, plr))
	end
end)
AddCommand("mute",function()
	if args[2] == "all" then
		for _,player in next, game:GetService('Players'):GetPlayers() do
			table.insert(mutedPlayers, player)
		end
	else
		for _, Target in pairs(GetPlayer(args[2])) do
			table.insert(mutedPlayers, Target)
		end
	end
end)

AddCommand("unmute",function()
	if args[2] == "all" then
		for i,v in next, mutedPlayers do
			table.remove(mutedPlayers, i)
		end
	else
		for _, Target in pairs(GetPlayer(args[2])) do
			if table.find(mutedPlayers, Target) then
				table.remove(mutedPlayers, tablefind(mutedPlayers, Target))
			end
		end
	end
end)

AddCommand("drop",function()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
   if v:IsA("Tool")  then
task.wait()
    v.Parent = game.Players.LocalPlayer.Character
task.wait()
    v.Parent = game.Workspace
end
end
end)


AddCommand("getcframe",function()
	setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
end)

AddCommand('void', function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local LocalPlayer = game.Players.LocalPlayer
		local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		for i,v in next, LocalPlayer.Backpack:GetChildren() do
			if v:IsA'Tool' then
				v.Parent = LocalPlayer.Character
			end
		end
		local tool = LocalPlayer.Character:FindFirstChildOfClass'Tool'
		local pos = LocalPlayer.Character.HumanoidRootPart.CFrame
		firetouchinterest(tool.Handle, Target.Character.Head, 0)
		task.wait()
		game.Workspace.Gravity = 5000000000000000000
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,400,0)
		task.wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-1000,0)
		game.Players.LocalPlayer.CharacterAdded:Wait()
		repeat task.wait() until LocalPlayer.Character
		game.Workspace.Gravity = 200
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos

	end
end)

AddCommand("gkill",function()
for _, Target in pairs(GetPlayer(args[2])) do
	local LocalPlayer = game.Players.LocalPlayer
	local ogChar = LocalPlayer.Character
	LocalPlayer.Character = Clone
	LocalPlayer.Character = ogChar
	task.wait(4.38)
	local mine = game.Players.LocalPlayer.Character:FindFirstChildOfClass'Tool' or game.Players.LocalPlayer.Backpack:FindFirstChildOfClass'Tool'
	mine.Parent = game.Players.LocalPlayer.Character
	mine.Handle.Massless = true
	local pee = true
	local new = Instance.new('Part', workspace)
	new.Size = Vector3.new(3,2,1)
	new.Transparency = 0
	new.Massless = true
	new.CanCollide = false
	new.Color = Color3.new(1,0,0)
	new.Transparency = 1
	new.Material = 'SmoothPlastic'

	local new2 = Instance.new('Part', workspace)
	new2.Size = Vector3.new(1,1,1)
	new2.Transparency = 0
	new2.Massless = true
	new2.CanCollide = false
	new2.Color = Color3.new(1,0,0)
	new2.Transparency = 1
	new2.Material = 'SmoothPlastic'
	task.wait()

	function Weld(part1, part2)
		local weld = Instance.new('Weld', part2)
		weld.C0 = CFrame.new()
		weld.C1 = CFrame.new()
		weld.Part0 = part2
		weld.Part1 = part1
	end

	Weld(new, mine.Handle)

	new.Touched:Connect(function(x)
		local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		if x.Name == 'Head' then
			game.Players.LocalPlayer.Character.Head.Anchored = false
			pee = false
			new:Destroy()
			local Target = x.Parent
			local LocalPlayer = game.Players.LocalPlayer
			mine.Parent = LocalPlayer.Backpack
			local newHum = LocalPlayer.Character.Humanoid:Clone()
			newHum.Parent = LocalPlayer.Character
			LocalPlayer.Character.Humanoid:Destroy()
			newHum:ChangeState(15)
			mine.Parent = LocalPlayer.Character
			local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			firetouchinterest(mine.Handle, Target.Head, 0)
			-- mine.AncestryChanged:Wait()
			-- wait(.1)
			-- Target.Humanoid:ChangeState(15)
			task.wait(.3)
			game.Workspace.Gravity = 50000000000000000000
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,400,0)
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-1000,0)
			game.Players.LocalPlayer.CharacterAdded:Wait()
			repeat wait() until LocalPlayer.Character
			game.Workspace.Gravity = 200
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		end
	end)

		task.spawn(function()
			repeat
				mine.Grip = CFrame.new()
				mine.Grip = mine.Handle.CFrame:ToObjectSpace(Target.Character.Head.CFrame):Inverse()
				mine.Parent = game.Players.LocalPlayer.Backpack
				mine.Parent = game.Players.LocalPlayer.Character
				game:GetService('RunService').RenderStepped:Wait()
			until pee == false or game.Players.LocalPlayer.Character.Humanoid.Health < 1
		end)
end
end)

AddCommand("fastkill",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local LocalPlayer = game.Players.LocalPlayer
		local ogChar = LocalPlayer.Character
		LocalPlayer.Character = Clone
		LocalPlayer.Character = ogChar
		task.wait(4.6)
		local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		newHum:ChangeState(15)
		for i,v in next, LocalPlayer.Backpack:GetChildren() do
			if v:IsA'Tool' then
				v.Parent = LocalPlayer.Character
			end
		end
		local pos = LocalPlayer.Character.HumanoidRootPart.CFrame
		local tool = LocalPlayer.Character:FindFirstChildOfClass'Tool'
		firetouchinterest(tool.Handle, Target.Character.Head, 0)
		tool.AncestryChanged:Wait()
		LocalPlayer.Character:BreakJoints()
		game.Players.LocalPlayer.CharacterAdded:Wait()
		tool:Destroy()
		repeat task.wait() until LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
	end
end)

AddCommand("kill",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		-- newHum:ChangeState(15)
		local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")		
		local Player = game.Players:FindFirstChild(Target.Name)
		tool.Parent = LocalPlayer.Character
		local soundTable = {
			4164190231,
			4817809188,
			3455144981,
			5984353288,
			5869422451,
			3246290855,
			610041973,
			138251332,
			5809201900,
			571879674,
			2865870544,
			6823153536
		}
		if tool:FindFirstChildOfClass'RemoteEvent' then
			tool.Remote:FireServer("PlaySong", soundTable[math.random(1,#soundTable)])
		else
		end
		DeltaWait(0)
		firetouchinterest(tool.Handle, Player.Character['Head'],0)
		firetouchinterest(tool.Handle, Player.Character['Head'],1)
		tool.AncestryChanged:Wait()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		game.Players.LocalPlayer.Character = nil
		for i,v in next, Player.Character:GetChildren() do
			if v:IsA'Tool' then
				local Sound = v.Handle.Sound
				spawn(function()
					while Sound.Playing == true do
						if math.round(Sound.TimePosition+0.5) > Sound.TimeLength then
							Sound.Playing = false
						end
						game:GetService('RunService').RenderStepped:Wait()
					end
				end)
			end
		end
		wait(.1)
		LocalPlayer.CharacterAdded:Wait()
		LocalPlayer.Character:WaitForChild('HumanoidRootPart')
		LocalPlayer.Character:SetPrimaryPartCFrame(oldCF)
	end
end)

AddCommand("equip", function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            v.Parent = game.Players.LocalPlayer.Character
            end
        end
end)

AddCommand('vkill', function()
	workspace['FallenPartsDestroyHeight'] = 0/0
	LocalPlayer.Character.Humanoid:UnequipTools()
	local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
	DeltaWait()
	LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,10000000,0)
	for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
	   if v:IsA'Tool' then
		  v.Parent = LocalPlayer.Character
	   end
	end
	wait(.5)
	for i,v in pairs(LocalPlayer.Character:GetChildren()) do
	   if v:IsA'Tool' and v ~= game.Players.LocalPlayer.Character:FindFirstChildOfClass'Tool' then
		  v.Parent = workspace
	   end
	end
	DeltaWait(.5)
	for _, Target in pairs(GetPlayer(args[2])) do
	   LocalPlayer.Character.Humanoid:UnequipTools()
	   LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	   DeltaWait()
	   Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
	   local newHum = LocalPlayer.Character.Humanoid:Clone()
	   newHum.Parent = LocalPlayer.Character
	   LocalPlayer.Character.Humanoid:Destroy()
	   newHum:ChangeState(15)
	   local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
	   local Player = game.Players:FindFirstChild(Target.Name)
	   tool.Parent = LocalPlayer.Character
	   DeltaWait(0)
	   firetouchinterest(tool.Handle, Player.Character['Head'],0)
	   firetouchinterest(tool.Handle, Player.Character['Head'],1)
	--    tool.AncestryChanged:Wait()
	--    wait(.1)
	--    Target.Character.Humanoid:ChangeState(15)
	   LocalPlayer.CharacterAdded:Wait()
	   wait(1)
	   LocalPlayer.Character:SetPrimaryPartCFrame(oldCF)
	   for i, v in pairs(workspace:GetChildren()) do
		  if v:IsA("Tool") then
			 local ti1 = v.Handle
			 firetouchinterest(LocalPlayer.Character['Head'],ti1 , 0)
		  end
	   end
	end
end)

local killing = false

AddCommand("loopkill",function()
	killing = true
	for _, Target in pairs(GetPlayer(args[2])) do
		function kill()
			local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,10,0)
			local newHum = LocalPlayer.Character.Humanoid:Clone()
			newHum.Parent = LocalPlayer.Character
			LocalPlayer.Character.Humanoid:Destroy()
			newHum:ChangeState(15)
			local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")		
			local Player = game.Players:FindFirstChild(Target.Name)
			tool.Parent = LocalPlayer.Character
			local soundTable = {
				4164190231,
				4817809188,
				3455144981,
				5984353288,
				5869422451,
				3246290855,
				610041973,
				138251332,
				5809201900,
				571879674,
				2865870544,
				6823153536
			}
			if tool:FindFirstChildOfClass'RemoteEvent' then
				tool.Remote:FireServer("PlaySong", soundTable[math.random(1,#soundTable)])
				coroutine.wrap(function()
					wait(1)
					tool.Handle.Sound.Playing = false
				end)()
			else
			end
			DeltaWait(0)
			firetouchinterest(tool.Handle, Player.Character['Head'],0)
			firetouchinterest(tool.Handle, Player.Character['Head'],1)
			tool.AncestryChanged:Wait()
			LocalPlayer.Character:Remove()
			LocalPlayer.CharacterAdded:Wait()
			repeat DeltaWait() until LocalPlayer.Character.HumanoidRootPart
			LocalPlayer.Character:SetPrimaryPartCFrame(oldCF)
		end
		while killing == true do
			kill()
			repeat wait() until game.Players.LocalPlayer.Character
			wait(.1)
			repeat wait() until Target.Character:FindFirstChild("HumanoidRootPart")
			wait(.1)
	repeat wait() until Target.Character:FindFirstChild("Humanoid")
	wait(.1)
		end
	end
end)

AddCommand("unloopkill",function()
	killing = false
end)

AddCommand("test",function()
	warn('new')
	for _, Target in pairs(GetPlayer(args[2])) do
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		tool.Handle.Massless = true
		tool.Parent = game.Players.LocalPlayer.Character
		DeltaWait()
		firetouchinterest(tool.Handle, Target.Character['Head'],0)
		repeat DeltaWait() until tool.Parent ~= LocalPlayer.Character
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5631.48242, 49.345459, -17242.2266, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		DeltaWait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
		wait(1)
		wait(.05)
		LocalPlayer.CharacterAdded:Wait()
		repeat DeltaWait(0) until LocalPlayer.Character.HumanoidRootPart
		wait(.5)
		LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	end
end)

AddCommand("bring",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		tool.Handle.Massless = true
		tool.Parent = game.Players.LocalPlayer.Character
		DeltaWait()
		firetouchinterest(tool.Handle, Target.Character['Head'],0)
		repeat DeltaWait() until tool.Parent ~= LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF * CFrame.Angles(math.rad(45),0,0)
		wait(.05)
		LocalPlayer.CharacterAdded:Wait()
		repeat DeltaWait(0) until LocalPlayer.Character.HumanoidRootPart
		wait(.5)
		LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	end
end)


AddCommand("kanye",function()
	local check = "https://api.kanye.rest/"
	local final = game:HttpGet(check)
	local final2 = string.gsub(final,'"quote"',"")
	local final3 = string.gsub(final2,"[%{%:%}]","")
	Chat(final3.." - Kanye West")
end)


AddCommand("joke",function()
	coroutine.wrap(function()
	local HttpService = game:GetService('HttpService')
	local check = "https://official-joke-api.appspot.com/jokes/programming/random"
	local final1 = game:HttpGet(check)
	local final = string.gsub(final1, "[%[%]]", "")
	local decoded = HttpService:JSONDecode(final)
	
	Chat(decoded.setup)
	wait(2)
	Chat(decoded.punchline)
	end)()
end)
AddCommand("flash",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local pooCF = CFrame.new(5616.67969, 37.0454788, -17259.5176, 0.999995291, -6.67297755e-08, 0.00300924503, 6.65793536e-08, 1, 5.00816135e-08, -0.00300924503, -4.98810273e-08, 0.999995291)
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		tool.Handle.Massless = true
		tool.Parent = game.Players.LocalPlayer.Character
		DeltaWait()
		firetouchinterest(tool.Handle, Target.Character['Head'],0)
		repeat DeltaWait() until tool.Parent ~= LocalPlayer.Character
		for i= 1,35,1 do
		print('pee'..i)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,9e+18,0)
		wait(.05)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
		wait(.05)
		end
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
		LocalPlayer.CharacterAdded:Wait()
		repeat DeltaWait(0) until LocalPlayer.Character.HumanoidRootPart
		wait(.5)
		LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	end
end)

AddCommand("jail",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local pooCF = CFrame.new(5616.67969, 37.0454788, -17259.5176, 0.999995291, -6.67297755e-08, 0.00300924503, 6.65793536e-08, 1, 5.00816135e-08, -0.00300924503, -4.98810273e-08, 0.999995291)
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		tool.Handle.Massless = true
		tool.Parent = game.Players.LocalPlayer.Character
		DeltaWait()
		firetouchinterest(tool.Handle, Target.Character['Head'],0)
		repeat DeltaWait() until tool.Parent ~= LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pooCF
		wait(.5)
		LocalPlayer.Character:BreakJoints()
		wait(.05)
		LocalPlayer.CharacterAdded:Wait()
		repeat DeltaWait(0) until LocalPlayer.Character.HumanoidRootPart
		wait(.5)
		LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	end
end)

AddCommand("toilet",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local LocalPlayer = game.Players.LocalPlayer
		local ogChar = LocalPlayer.Character
		local pos = CFrame.new(5497.45508, 62.5506248, -17105.4375, 0.99979651, -3.5474347e-08, 0.0201720521, 3.43854154e-08, 1, 5.43288969e-08, -0.0201720521, -5.36242197e-08, 0.99979651)
		LocalPlayer.Character = Clone
		LocalPlayer.Character = ogChar
		wait(4.5)
		local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		-- newHum:ChangeState(15)
		LocalPlayer.Character.Humanoid:Destroy()
		for i,v in next, LocalPlayer.Backpack:GetChildren() do
			if v:IsA'Tool' then
				v.Parent = LocalPlayer.Character
			end
		end
		firetouchinterest(LocalPlayer.Character:FindFirstChildOfClass'Tool'.Handle, Target.Character.Head, 0)
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5497.36328, 61.586174, -17107.6055, 0.999927461, 0.0113985669, -0.00389479497, -7.36521844e-10, 0.323337317, 0.946283877, 0.0120456116, -0.946215093, 0.323313832)
		firetouchinterest(LocalPlayer.Character:FindFirstChildOfClass'Tool'.Handle,Target.Character.Head, 1)
		wait(.3)
		LocalPlayer.Character:BreakJoints()
		game.Players.LocalPlayer.CharacterAdded:Wait()
		repeat wait() until LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		Chat("😳")
	end
end)


AddCommand("delete",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		tool.Handle.Massless = true
		tool.Parent = game.Players.LocalPlayer.Character
		DeltaWait()
		firetouchinterest(tool.Handle, Target.Character['Head'],0)
		repeat DeltaWait() until tool.Parent ~= LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,9e+18,0)
		LocalPlayer.CharacterAdded:Wait()
		repeat DeltaWait(0) until LocalPlayer.Character.HumanoidRootPart
		wait(.5)
		LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	end
end)
local antikilling = false
AddCommand("antikill", function()
	antikilling = true
	while antikilling do
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
	game.Players.LocalPlayer.Character.Humanoid.Sit = true
	game:GetService('RunService').RenderStepped:Wait()
	end
end)

AddCommand("unantikill", function()
antikilling = false
game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled('Seated', true)
game.Players.LocalPlayer.Character.Humanoid.Sit = false
end)
AddCommand("antitool", function()
	local LocalPlayer = game.Players.LocalPlayer
	workspace['FallenPartsDestroyHeight'] = 0/0
	local heartbeat = function()
	 game:GetService'RunService'.Heartbeat:wait() 
 end 
 
 local prepfortool = function()
	 LocalPlayer.Character.Humanoid:UnequipTools()
	 repeat wait() until LocalPlayer.Character:FindFirstChildOfClass'Tool' == nil 
 end 
 
		 local wasequipped, Pos = nil, nil 
		 if LocalPlayer.Character:FindFirstChildOfClass'Tool' ~= nil then 
			 wasequipped = LocalPlayer.Character:FindFirstChildOfClass'Tool'
		 end 
		 local ToolsOwned = {}
		 prepfortool()
		 for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do 
			 if v:IsA'Tool' then 
				 table.insert(ToolsOwned, v)
			 end 
		 end 
		 settings().Network.IncomingReplicationLag = 0
		 local UpdatingCFrame = nil
		 --// tool adding
		 LocalPlayer.Character.ChildAdded:Connect(function(Tool)
	 Pos = LocalPlayer.Character.HumanoidRootPart.CFrame
			 if not antitool then return false end 
			 if Tool:IsA'Tool' and table.find(ToolsOwned, Tool) == nil then 
				 pcall(function()
				 LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
				 LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
				 repeat heartbeat() until Tool.Parent == LocalPlayer.Character;
				 prepfortool()
				 LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
				 LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
				 table.insert(ToolsOwned, Tool)
				 end)
			 end 
		 end)
end)

AddCommand("rarm", function()
	game.Players.LocalPlayer.Character['Right Arm']:Destroy()
end)

AddCommand("rhand", function()
game.Players.LocalPlayer.Character.RightHand:Destroy()
end)


AddCommand("unantitool", function()
	antitooling = false
end)
AddCommand("re",function()
	local LP = game:GetService('Players').LocalPlayer

	local ogChar = LP.Character
	LP.Character = Clone
	LP.Character = ogChar
	wait(4.9)
	local pos = LP.Character.HumanoidRootPart.CFrame
	LP.Character:BreakJoints()
	LP.CharacterAdded:wait();
	repeat
		wait()
	until LP.Character
	wait(.2)
	LP.Character.HumanoidRootPart.CFrame = pos + Vector3.new(0,1,0)
end)

AddCommand("ignore",function()
	local MuteRequest = game.ReplicatedStorage.DefaultChatSystemChatEvents.MutePlayerRequest
	for _, Target in pairs(GetPlayer(args[2])) do
		MuteRequest:InvokeServer(Target.Name);
        if (Target.Character) then
			Target.Character.HumanoidRootPart.CFrame = CFrame.new(0,500,0)
            Target.Character.Parent = game.ReplicatedStorage
        end
	end
end)

AddCommand("unignore",function()
	local UnMuteRequest = game.ReplicatedStorage.DefaultChatSystemChatEvents.UnMutePlayerRequest
	for _, Target in pairs(GetPlayer(args[2])) do
		UnMuteRequest:InvokeServer(Target.Name);
		if (Target.Character and Target.Character.Parent == game.ReplicatedStorage) then
            Target.Character.Parent = workspace
		end
	end
end)

AddCommand("admin",function()
	wait(.2)
	Chat("[ < "..Admin.Name.." > ]"..""..Admin.Version)
end)

AddCommand("date", function()
	local date_table = os.date("*t")


	local monthTable = {
		"Jan.",
		"Feb.",
		"Mar.",
		"Apr.",
		"May.",
		"Jun.",
		"Jul.",
		"Aug.",
		"Sep.",
		"Oct.",
		"Nov.",
		"Dec."

	}
	Chat(monthTable[date_table.month].." "..date_table.day..", "..date_table.year)
end)

AddCommand("localtime", function()
	local hour = os.date("*t")['hour']
	if hour < 10 then
		hour = "0"..hour
	end
	local min = os.date("*t")['min']
	if min < 10 then
		min = "0"..min
	end
	local sec = os.date("*t")['sec']
	if sec < 10 then
		sec = "0"..sec
	end
	local clock = hour..":"..min..":"..sec
	Chat(clock)
end)

local toolsget = false
AddCommand("gtools",function()
	toolsget = true
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Tool") then
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
		end
	end
	workspace.ChildAdded:Connect(function(pt)
		if toolsget == true then
			if pt:IsA("Tool") then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(pt)
			end
		end
	end)
end)

AddCommand("ungtools",function()
	toolsget = false
end)

AddCommand("checkgrabber",function()
	local oldpos = LocalPlayer.Character.HumanoidRootPart.CFrame
	local boombox = game.Players.LocalPlayer.Character:FindFirstChildOfClass'Tool' or LocalPlayer.Backpack:FindFirstChildOfClass'Tool'
	LocalPlayer.Character:SetPrimaryPartCFrame(LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(1000))
	boombox.Parent = LocalPlayer.Character
	wait(.4)
	boombox.Parent = workspace
	LocalPlayer.Character:SetPrimaryPartCFrame(oldpos)
	wait(.6)
	if boombox.Parent == workspace then
		LocalPlayer.Character.Humanoid:EquipTool(boombox)
		wait(.3)
		LocalPlayer.Character.Humanoid:UnequipTools()
	else
		wait(.3)
		local grabber = game.Players:GetPlayerFromCharacter(boombox.Parent) or boombox.Parent.Parent
		LocalPlayer.Character:SetPrimaryPartCFrame(grabber.Character.Head.CFrame + Vector3.new(0,3,0))
		Chat("" .. grabber.DisplayName.." [@"..grabber.Name.."] is grabbing boomboxes")
	end
end)

AddCommand("dupe", function()
	local DUPE_AMOUNT = tonumber(args[2])
	local LP = game.Players.LocalPlayer
	local SAVE_CF = LP.Character.HumanoidRootPart.CFrame
	local RS = game:GetService('RunService').RenderStepped
	for i = 1,DUPE_AMOUNT do
		local start = tick()
		local dropped_tools = {}
		local CHAR = LP.Character
		LP.Character = Clone
		LP.Character = CHAR
		repeat RS:Wait() until tick() - start >= 4.8
		LP.Character.HumanoidRootPart.CFrame = SAVE_CF + Vector3.new(0,10000,0)
		repeat RS:Wait() until tick() - start >= 4.9
		for _,tool in next, LP.Backpack:GetChildren() do
			tool.Parent = LP.Character
		end
		for _, tool in next, LP.Character:GetChildren() do
			if tool:IsA'Tool' then
				tool.Parent = game.Workspace
				table.insert(dropped_tools, tool)
			end
		end
		LP.Character:BreakJoints()
		LP.CharacterAdded:Wait()
		for _, tool in next, dropped_tools do
			LP.Character:WaitForChild'Humanoid':EquipTool(tool)
		end
		LP.Character:WaitForChild('HumanoidRootPart').CFrame = SAVE_CF
	end
end)
AddCommand("rjdupe", function()
	local AmountToDupe = tonumber(args[2])

	local plr = game.Players.LocalPlayer
	local char = plr.Character
	local pos = char.HumanoidRootPart.Position
	local http = game:GetService("HttpService")

	local file = 'Hash/hashdupe.json'
	writefile(file, http:JSONEncode({
		['AmountToDupe'] = AmountToDupe - 1,
		['CurrentAmount'] = 0
	}))
	char.HumanoidRootPart.CFrame = CFrame.new(0, 999999, 0)
	for i, v in pairs(plr.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = char
		end
	end
	wait(.3)
	for i, v in pairs(char:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = workspace
		end
	end

	local dupescript = [[
       game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
       repeat wait() until game.Players.LocalPlayer
       repeat wait() until game.Players.LocalPlayer.Character
       repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(%s)
       local plr = game.Players.LocalPlayer
       local char = plr.Character
       local file = "%s"
       local a = readfile(file)
       local data = game:GetService("HttpService"):JSONDecode(a)
       if data['CurrentAmount'] >= data['AmountToDupe'] then
           wait(.5)
           for i,v in pairs(workspace:GetChildren()) do
               if v:IsA("Tool") then
                   char.Humanoid:EquipTool(v)
               end
           end
           return
       else
           wait()
           char.HumanoidRootPart.CFrame = CFrame.new(0,999999,0)
           for i,v in pairs(plr.Backpack:GetChildren()) do
               if v:IsA("Tool") then
                   v.Parent = char
               end
           end
           wait(.6)
           for i,v in pairs(char:GetChildren()) do
               if v:IsA("Tool") then
                   v.Parent = workspace
               end
           end
           wait(.1)
           data['CurrentAmount'] = data['CurrentAmount'] + 1
           writefile(file,game:GetService("HttpService"):JSONEncode(data))
       end
       syn.queue_on_teleport(readfile("%s"))
       repeat
       game:GetService("TeleportService"):Teleport(game.PlaceId)    
       wait(0.5)
       until nil
    ]]
	dupescript = string.format(dupescript, tostring(pos), file, "dupescript.lua")

	writefile('dupescript.lua', dupescript)
	syn.queue_on_teleport(dupescript)
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

AddCommand("dupefor", function()
for _, Target in pairs(GetPlayer(args[2])) do
local AmountToDupe = args[3]
local Target = tostring(Target)
-------------------------------------------------------


function findplr(args)
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if string.find(string.lower(v.Name), string.lower(args)) then
            return v
        end
    end
end
    local http = game:GetService("HttpService")
    local targetfile = 'targetdupe.json'
        writefile(targetfile, http:JSONEncode({
        ['Target'] = tostring(Target)
    }))
    local Player = findplr(Target)
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    local pos = char.HumanoidRootPart.Position


    
    local file = 'rejoindupe.json'
    writefile(file, http:JSONEncode({
        ['AmountToDupe'] = AmountToDupe - 2,
        ['CurrentAmount'] = 0
    }))
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
        tool.Parent = game.Players.LocalPlayer.Character
        wait()
        game.Players.LocalPlayer.Character.Humanoid:Destroy()
        tool.Parent = workspace
        wait()
        firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 0)
        firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 1)
        Player.Character.Humanoid:EquipTool(tool)

    local dupescript = [[
       game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
       repeat wait() until game.Players.LocalPlayer
       repeat wait() until game.Players.LocalPlayer.Character
       repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(%s)
           local http = game:GetService("HttpService")
       function findplr(args)
            for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                if string.find(string.lower(v.Name), string.lower(args)) then
                    return v
                end
            end
        end
        
        local JSONDecode = function(Input)
            return game:GetService('HttpService'):JSONDecode(Input)
        end
        local Data = JSONDecode(readfile('targetdupe.json'))
        local Player = findplr(Data.Target)
       local plr = game.Players.LocalPlayer
       local char = plr.Character
       local file = "%s"
       local a = readfile(file)
       local data = game:GetService("HttpService"):JSONDecode(a)
       if data['CurrentAmount'] >= data['AmountToDupe'] then
           wait(.5)
                print("done")
           return
       else
           wait()
           local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
           tool.Parent = game.Players.LocalPlayer.Character
           wait()
           game.Players.LocalPlayer.Character.Humanoid:Destroy()
           tool.Parent = workspace
           wait()
           firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 0)
           firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 1)
           Player.Character.Humanoid:EquipTool(tool)
           wait(.1)
           data['CurrentAmount'] = data['CurrentAmount'] + 1
           writefile(file,game:GetService("HttpService"):JSONEncode(data))
       end
       syn.queue_on_teleport(readfile("%s"))
       repeat
       game:GetService("TeleportService"):Teleport(game.PlaceId)    
       wait(0.5)
       until nil
    ]]
    dupescript = string.format(dupescript, tostring(pos), file, "dupescript.lua")

    writefile('dupescript.lua', dupescript)
    syn.queue_on_teleport(dupescript)
    game:GetService("TeleportService"):Teleport(game.PlaceId)
	end
end)

AddCommand("jobid", function()
	setclipboard(game.JobId)
end)


AddCommand("prefix", function()
	writefile("legendary0001.lua", tostring(args[2]))
	wait()
	Admin.Prefix =  readfile("legendary0001.lua")
end)

AddCommand("teleport", function()
local JobId = args[2]
local PlaceId = 417267366
local TeleportService = game:GetService("TeleportService")

TeleportService:TeleportToPlaceInstance(PlaceId, JobId, game.Players.LocalPlayer)
end)

AddCommand("rjre", function()
	if not syn.queue_on_teleport then
	end
	rejoining = true
	local c = LocalPlayer.Character.Head.CFrame
	syn.queue_on_teleport(string.format([[
    game:GetService('ReplicatedFirst'):RemoveDefaultLoadingScreen()
    local playeradded, charadded
    playeradded = game:GetService('Players').PlayerAdded:Connect(function(plr)
        charadded = plr.CharacterAdded:Connect(function(char)
            char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(%f, %f, %f)
            charadded:Disconnect()
        end)
        playeradded:Disconnect()
    end)
]], c.X, c.Y, c.Z))
	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players"))
	wait(3)
	rejoining = false
end)

AddCommand("rj", function()
	rejoining = true
	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players"))
	wait(3)
	rejoining = false
end)

AddCommand("spin",function()
	local Spin = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
	Spin.Name = "Spinning"
	Spin.AngularVelocity = Vector3.new(0, 20, 0)
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
end)
local nodefault = true
AddCommand("nodefault",function()
while nodefault == true do
    game:GetService('RunService').RenderStepped:Wait()
for _,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do 
    if v.Name == "ChooseSongGui" then
        v:Destroy()
	end
end
end
end)

AddCommand("unnodefault",function()
		nodefault = false
	end)

AddCommand("spinhats",function()
	for i, v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("Accessory") then
			local findForce = v.Handle:FindFirstChildOfClass("BodyForce")
			if findForce == nil then
				local a = Instance.new("BodyPosition")
				local b = Instance.new("BodyAngularVelocity")
				a.Parent = v.Handle
				b.Parent = v.Handle
				a.Name = "un"
				b.Name = "un2"
				v.Handle.AccessoryWeld:Destroy()
				b.AngularVelocity = Vector3.new(0, 5, 0)
				b.MaxTorque = Vector3.new(0, 200, 0)
				a.P = 30000
				a.D = 50
				game:GetService('RunService').Stepped:connect(function()
					a.Position = LocalPlayer.Character.Head.Position + Vector3.new(0,0,0)
				end)
			end
		end
	end
end)

AddCommand("unspin", function()
	for i, v in pairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
end)

AddCommand("noclip",function()
	Clip = false
	function NoclipLoop()
		if Clip == false and LocalPlayer.Character ~= nil then
			for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end
	end
	Noclipping = game:GetService('RunService').Stepped:connect(NoclipLoop)
end)

AddCommand("clip",function()
	if Noclipping then
		Noclipping:Disconnect()
	end
	Clip = true
	LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end)

AddCommand("sit",function()
	if Noclipping then
		Noclipping:Disconnect()
	end
	Clip = true
	LocalPlayer.Character.HumanoidRootPart.CanCollide = false
	game.Players.LocalPlayer.Character.Humanoid.Sit = true
end)

AddCommand("seat",function()
	local seats = {}
	for i,v in next, game:GetDescendants() do
		if v:IsA'Seat' then
			table.insert(seats, v)
		end
	end
	
	seats[math.random(1, #seats)]:Sit(game.Players.LocalPlayer.Character.Humanoid)
end)

AddCommand("walkspeed",function()
	local walkspeed = args[2]
	LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed
end)
--fffff
AddCommand("spook",function()
	local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
	for _, Target in pairs(GetPlayer(args[2])) do
		distancepl = 2
		if Target.Character and Target.Character:FindFirstChild('Humanoid') then
			LocalPlayer.Character.HumanoidRootPart.CFrame =
				Target.Character.HumanoidRootPart.CFrame +  Target.Character.HumanoidRootPart.CFrame.lookVector * distancepl
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, Target.Character.HumanoidRootPart.Position)
			wait(.5)
			LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
		end
	end
end)

AddCommand("gravity",function()
		game.Workspace.Gravity = args[2]
end)
AddCommand("replicate",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		for i,v in pairs(Target.Character:GetDescendants()) do
			if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v:FindFirstChildOfClass("RemoteEvent") and v.Handle:FindFirstChildOfClass("Sound") then
				_G.song = v.Handle.Sound.SoundId
			end
		end
		local song = _G.song
		local finalSound = string.gsub(tostring(song), "http%:%/%/www%.roblox.com%/asset%/%?id%=", "")
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass('Tool')
		tool.Parent = game.Players.LocalPlayer.Character
		wait(.5)
		print(finalSound)
		tool.Remote:FireServer("PlaySong", finalSound)
		tool.Handle.finalSound.Playing = true
		Notify('set to clipboard')
		setclipboard(finalSound)
	end
end)

AddCommand("ez",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local Sound
		local targetTool = Target.Character:FindFirstChildOfClass('Tool')
		for i,v in pairs(targetTool:GetDescendants()) do
			if v:IsA'Sound' then
				Sound = v.SoundId
				Sound = Sound:gsub("http%:%/%/www%.roblox.com%/asset%/%?id%=", "")
			end
		end
		---------------logging part finished----------
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass('Tool')
		tool.Parent = game.Players.LocalPlayer.Character
		wait(.5)
		print(Sound)
		tool.Remote:FireServer("PlaySong", Sound)
		tool.Handle.Sound.Playing = false
		tool:GetPropertyChangedSignal("Parent"):Connect(function()
			tool.Handle.Sound:Play()
		end)
		wait()
		game.Players.LocalPlayer.Character.Humanoid:Destroy()
		tool.Parent = workspace
		wait()
		firetouchinterest(Target.Character.PrimaryPart, tool.Handle, 0)
		Target.Character.Humanoid:EquipTool(tool)
		tool.Handle.Sound.Playing = true
	end
end)

AddCommand("fp",function()
    local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
    for _, Target in pairs(GetPlayer(args[2])) do
        local Player = Target
        Encode(args[3])
        local song = _G.song
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        local pos = char.HumanoidRootPart.Position
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
        tool.Parent = game.Players.LocalPlayer.Character
        tool.Remote:FireServer("PlaySong", song)
        tool.Handle.Sound.Playing = false
        local poo = tool
        poo:GetPropertyChangedSignal("Parent"):Connect(function()
        tool.Handle.Sound:Play()
        end)
        wait()
        game.Players.LocalPlayer.Character.Humanoid:Destroy()
        tool.Parent = workspace
        wait()
        firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 0)
        firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 1)
        Player.Character.Humanoid:EquipTool(tool)
        tool.Handle.Sound.Playing = true
        LocalPlayer.Character:Destroy()
        wait(5.5)
        LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
    
    end
end)

AddCommand("hampster", function()
	local Others = game.Players:GetPlayers() 
    for Index, Player in pairs(Others) do 
       if Player == LocalPlayer then 
           table.remove(Others, Index)
           end
    end
    local pos = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(45),0,0)
    local CurrentT = #LocalPlayer.Backpack:GetChildren()
    local Grip = 5
    pcall(function()
    for Index,Target in pairs(Others) do 
        Grip = Grip + 3
        if Target.Character and Target.Character.PrimaryPart then 
            if not LocalPlayer.Character:FindFirstChild('Executed') then
				local newHum = LocalPlayer.Character.Humanoid:Clone()
				newHum.Parent = LocalPlayer.Character
				LocalPlayer.Character.Humanoid:Destroy()
            end  
        local Tool = LocalPlayer.Backpack:FindFirstChildOfClass'Tool' 
        Tool.Parent = LocalPlayer.Character
		Tool.Handle.Sound.Playing = false
		Tool:GetPropertyChangedSignal("Parent"):Connect(function()
			Tool.Handle.Sound:Play()
		end)
		Tool.Remote:FireServer("PlaySong", 4923841771)
        Tool.Grip = Tool.Grip * CFrame.new(Vector3.new(Grip, 0, 0))
        Tool.Handle.Massless = true 
        Target.Character:SetPrimaryPartCFrame(Tool.Handle.CFrame)
        end 
    end 
    end) -- pcall in case the localplayer doesnt have enough tools it still kills
    repeat wait() until #LocalPlayer.Backpack:GetChildren() < CurrentT
	wait(1)
	LocalPlayer.Character:Destroy()
	LocalPlayer.Character = nul
	LocalPlayer.Character.HumanoidRootPart.Health = 0
    LocalPlayer.Character:SetPrimaryPartCFrame(pos)
end)

AddCommand("emergency", function()
	local Others = game.Players:GetPlayers() 
    for Index, Player in pairs(Others) do 
       if Player == LocalPlayer then 
           table.remove(Others, Index)
           end
    end
    local pos = LocalPlayer.Character.HumanoidRootPart.CFrame 
    local CurrentT = #LocalPlayer.Backpack:GetChildren()
    local Grip = 5
    pcall(function()
    for Index,Target in pairs(Others) do 
        Grip = Grip + 3
        if Target.Character and Target.Character.PrimaryPart then 
            if not LocalPlayer.Character:FindFirstChild('Executed') then
				local newHum = LocalPlayer.Character.Humanoid:Clone()
				newHum.Parent = LocalPlayer.Character
				LocalPlayer.Character.Humanoid:Destroy()
            end  
        local Tool = LocalPlayer.Backpack:FindFirstChildOfClass'Tool' 
        Tool.Parent = LocalPlayer.Character
		Tool.Handle.Sound.Playing = false
		Tool:GetPropertyChangedSignal("Parent"):Connect(function()
			Tool.Handle.Sound:Play()
		end)
		Chat("EMERGENCY MEETING!")
		Chat("EMERGENCY MEETING!")
		Chat("EMERGENCY MEETING!")
		Chat("EMERGENCY MEETING!")
		Chat("EMERGENCY MEETING!")
		Tool.Remote:FireServer("PlaySong", 6223512980)
        Tool.Grip = Tool.Grip * CFrame.new(Vector3.new(Grip, 0, 0))
        Tool.Handle.Massless = true 
        Target.Character:SetPrimaryPartCFrame(Tool.Handle.CFrame)
        end 
    end 
    end) -- pcall in case the localplayer doesnt have enough tools it still kills
    repeat wait() until #LocalPlayer.Backpack:GetChildren() < CurrentT
	wait(1)
	LocalPlayer.Character:Destroy()
	LocalPlayer.Character = nul
	LocalPlayer.Character.HumanoidRootPart.Health = 0
    LocalPlayer.Character:SetPrimaryPartCFrame(pos)
end)


AddCommand("voidall", function()
	local player_table = game:GetService('Players'):GetPlayers()
	local toolsInBackpack = 0
	local toolsEquipped = 0
	local players = {}
	local tools = {}
	
	
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		toolsInBackpack = toolsInBackpack + 1
	end
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v.ClassName == "Tool" then
			toolsEquipped = toolsEquipped + 1
		end
	end
	local total_tools = toolsInBackpack + toolsEquipped
	print(#player_table.." players")
	
		for i,v in next, player_table do
			if v.Character.Humanoid.Sit ~= true and v ~= game:GetService('Players').LocalPlayer and v.Character.Humanoid.Health ~= 0 then
				table.insert(players, v)
			end
		end 
	
		local newHum = game.Players.LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Humanoid:Destroy()
		newHum:ChangeState(15)
		for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
			if v:IsA'Tool' then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		wait(.1)
		for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
			if v:IsA'Tool' then
				table.insert(tools, v)
			end
		end
		for i, tool in next, tools do
			tool.Handle.Massless = true
			tool.Grip = CFrame.new()
			tool.Grip = tool.Handle.CFrame:ToObjectSpace(players[i].Character.Head.CFrame):Inverse()
		end
		wait()
		game.Workspace.Gravity = 5000000000000000000
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,400,0)
		wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-1000,0)
		local players = {}
end)

AddCommand("killall", function()
	local player_table = game:GetService('Players'):GetPlayers()
	local toolsInBackpack = 0
	local toolsEquipped = 0
	local players = {}
	local tools = {}
	
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		toolsInBackpack = toolsInBackpack + 1
	end
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v.ClassName == "Tool" then
			toolsEquipped = toolsEquipped + 1
		end
	end
	local total_tools = toolsInBackpack + toolsEquipped
	print(#player_table.." players")
	
		for i,v in next, player_table do
			if v.Character.Humanoid.Sit ~= true and v ~= game:GetService('Players').LocalPlayer and v.Character.Humanoid.Health ~= 0 then
				table.insert(players, v)
			end
		end 
	
		local newHum = game.Players.LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Humanoid:Destroy()
		newHum:ChangeState(15)
		for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
			if v:IsA'Tool' then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		wait(.1)
		for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
			if v:IsA'Tool' then
				table.insert(tools, v)
			end
		end
		local currentTargets = {}
		for i, tool in next, tools do
			tool.Handle.Massless = true
			tool.Grip = CFrame.new()
			tool.Grip = tool.Handle.CFrame:ToObjectSpace(players[i].Character.Head.CFrame):Inverse()
		end
		local players = {}
end)

AddCommand("hh", function()
	LocalPlayer.Character.Humanoid.HipHeight = args[2]
end)
local walkfling = false
AddCommand("walkfling", function()
	walkfling = true
	for _, Target in pairs(GetPlayer(args[2])) do
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 9e+18
		wait(.1)
		game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, -1), true)
		coroutine.wrap(function()
			wait(5)
			walkfling = false
		end)()
		while walkfling == true do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame= Target.Character.HumanoidRootPart.CFrame +  Target.Character.HumanoidRootPart.CFrame.lookVector * -1
			DeltaWait()
		end
	end
end)

local xNamingTbl = {}
AddCommand("nodpn", function()
	function clean(cplr)
		if cplr.DisplayName ~= cplr.Name then
			if cplr.Character then
				cplr.Character:WaitForChild("Humanoid").DisplayName = cplr.Name
			end
			cplr.CharacterAdded:Connect(function(char)
				LocalPlayer.Character:WaitForChild("Humanoid").DisplayName = "(NICKNAMED)\n"..cplr.Name
			end)
		end
	end
	local xNaming = game:GetService("Players").PlayerAdded:Connect(clean)
	for _, p in pairs(game:GetService("Players"):GetPlayers()) do
		clean(p)
	end
end)
AddCommand("fling",function()

local Targets = {args[2]}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local OldFPDH = workspace.FallenPartsDestroyHeight

local function GetPlayer(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local function SkidFling(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid.RootPart
    local OldPos
    
    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle
    
    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end
    
    if Character and Humanoid and RootPart then
        OldPos = RootPart.CFrame
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        else
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        local function FPos(BasePart,Pos,Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            RootPart.Velocity = Vector3.new(9e8,9e8,9e8)
            RootPart.RotVelocity = Vector3.new(9e8,9e8,9e8)
        end
        local function SFBasePart(BasePart)
            local TimeToWait = 3.5
            local Time = tick()
            local Angle = 0
            
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 30 then
                        Angle = Angle + 50
                        
                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(2.25,1.5,-2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(-2.25,-1.5,2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(0,-1.5,0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                    else
                        FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,-THumanoid.WalkSpeed),CFrame.Angles(0,0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(-90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
                        game:GetService("RunService").Heartbeat:wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 1000 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        workspace.FallenPartsDestroyHeight = 0/0
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e9,9e9,9e9)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
        end
        BV:Destroy()
        for _,x in next, Character:GetDescendants() do
            if x:IsA("BasePart") then
                x.Velocity,x.RotVelocity = Vector3.new(),Vector3.new()
            end
        end
        Humanoid:ChangeState("GettingUp")
        RootPart.CFrame = OldPos * CFrame.new(0,.5,0)
        workspace.CurrentCamera.CameraSubject = Humanoid
        workspace.FallenPartsDestroyHeight = OldFPDH
    else
        return Message("Error Occurred","Random error",5)
    end
end

getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 3207813237 and GetPlayer(x).UserId ~= 106305835 and GetPlayer(x).UserId ~= 207865772 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("Error Occurred","This user is whitelisted! (Owner)",5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("Error Occurred","Username Invalid",5)
    end
end
end)
local following = false
AddCommand("stick",function()
	following = true
	for _, Target in pairs(GetPlayer(args[2])) do
		while following == true do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame= Target.Character.HumanoidRootPart.CFrame +  Target.Character.HumanoidRootPart.CFrame.lookVector * -1
			DeltaWait()
		end
	end
end)

AddCommand("unstick",function()
	following = false
end)

AddCommand("getmass",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		wait()
		Notify("user "..Target.DisplayName.." [@"..Target.Name.."]'s mass: "..tostring(Target.Character.HumanoidRootPart:GetMass()))
		if Target.Character.HumanoidRootPart:GetMass() > game.Players.LocalPlayer.Character.HumanoidRootPart:GetMass() then
			Notify("user "..Target.DisplayName.." [@"..Target.Name.."]'s mass is greater than yours.")
		end
	end
end)
AddCommand("antifling",function()

	if antifling == nil then
		antifling = true
	else
		antifling = not antifling
	end
	local function Collisionless(person)
		if antifling and person.Character then
			for _, child in pairs(person.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide then
					child.CanCollide = false
				end
			end
		end
	end
	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= lp then
			local antifling = game:GetService('RunService').RenderStepped:connect(function()
				Collisionless(v)
			end)
		end
	end
	game:GetService("Players").PlayerAdded:Connect(function()
		if v ~= lp and antifling then
			local antifling = game:GetService('RunService').Stepped:connect(function()
				Collisionless(v)
			end)
		end
	end)
	if antifling then

	else

	end
end)
end)

AddCommand("rescale",function()
local character = game:GetService("Players").LocalPlayer.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")
local function wipe_parts()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "Head" then
            for _, attachment in pairs(part:GetDescendants()) do
                if attachment:IsA("Attachment") and attachment:FindFirstChild("OriginalPosition") then
                    attachment.OriginalPosition:Destroy()
                end
            end
            part:WaitForChild("OriginalSize"):Destroy()
                
            end
        end
    end
wipe_parts()
humanoid:WaitForChild("BodyTypeScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("BodyWidthScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("BodyDepthScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("HeadScale"):Destroy()
Game:GetService("Players").LocalPlayer.Character.RightFoot.OriginalSize:Destroy()
Game:GetService("Players").LocalPlayer.Character.RightLowerLeg.OriginalSize:Destroy()
Game:GetService("Players").LocalPlayer.Character.RightUpperLeg.OriginalSize:Destroy()
end)

AddCommand("antivoid",function()
function notify(title, text, time)
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = title,
            Text = text,
            Duration = time
        }
    )
end

local player = game:GetService("Players").LocalPlayer
local Backpack = player.Backpack

local function AntiVoid()
    local Tools = {}
    for _, v in pairs(Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Tools, v)
        end
    end
    for _, v in pairs(Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Tools, v)
        end
    end
    player.Character.ChildAdded:Connect(
        function(child)
            if child:IsA("Tool") and not table.find(Tools, child) then
                child:Destroy()
                task.wait()
                notify("protected", 5)
            end
        end
    )
end
player.CharacterAdded:Connect(
    function(char)
        notify("died", 5)
        char:WaitForChild("HumanoidRootPart")
        AntiVoid()
    end
)
local Player = game.Players.LocalPlayer
local Character = Player.Character
local human = Character.Humanoid
local equip

local Debris = game:GetService("Debris")

local MyTools = {}

function createobj(class, properties)
    print("dbug")
    local obj = Instance.new(class)

    for i, v in pairs(properties) do
        obj[i] = v
    end
    return obj
end

for i, v in pairs(Player.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(MyTools, (#MyTools + 1), v)
        print(#MyTools)
    end
end

function Remove(Unwanted)
    Unwanted.Parent = Player.Backpack
    Unwanted.Parent = game.StarterPack
    --  Unwanted.Handle:Destroy()
end

Character.ChildAdded:Connect(
    function(PT)
        if PT:IsA("Tool") then
            if not table.find(MyTools, PT) then
                Debris:AddItem(PT.Handle, 0)
                Debris:AddItem(PT, 0)
                local BodyVelocity =
                    createobj(
                    "BodyVelocity",
                    {Name = "BodvVelocity", Velocity = Vector3.new(0, 0, 0), MaxForce = Vector3.new(0, 0, 0)}
                )
                BodyVelocity.Parent = Character.HumanoidRootPart
                human.Parent = workspace.Camera
                task.wait()
                human.Parent = Character
                BodyVelocity:Destroy()
            end
        end
    end
)
local Services = {
    ["P"] = game:GetService("Players"),
    ["W"] = game:GetService("Workspace"),
    ["RS"] = game:GetService("RunService")
}
local LP = Services["P"]["LocalPlayer"]
local Char, Pack = LP["Character"], LP["Backpack"]
local Hum = Char["Humanoid"]
Hum:SetStateEnabled("Seated", false)
Hum.Sit = true

game:GetService("Workspace").FallenPartsDestroyHeight = math.huge - math.huge

task.spawn(
    function()
        for i, v in pairs(game:GetService("Players").LocalPlayer:FindFirstChildOfClass("Backpack"):GetDescendants()) do
            if v:IsA("Tool") or not nil then
                v:Destroy()
            end
        end
        for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
            if v:IsA("Tool") or v:IsA("HopperBin") then
                v:Destroy()
            end
        end
    end
)

local LP = game:GetService("Players").LocalPlayer
local Char, Pack = LP.Character, LP.Backpack
local HUM = Char.Humanoid
local UIS = game:GetService "UserInputService"
local Toggler = false
local Keybind = Enum.KeyCode.F4
local ST = {}
local SF = {}

function Notification(title, text, time)
end

for i, v in pairs(Pack:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(ST, v)
    end
end

SF[#SF + 1] =
    UIS.InputBegan:Connect(
    function(Input, IsTyping)
        if IsTyping then
            return
        end
        if Input["KeyCode"] == Keybind then
            Toggler = not Toggler
            if Toggler == false then
                --Notification

                --Anti fe kill
                HUM:SetStateEnabled("Seated", false)
                HUM.Sit = true

                --Anti void
                Char.ChildAdded:Connect(
                    function(x)
                        if x:IsA("Tool") and not table.find(ST, x) then
                            x.Handle:Destroy()
                        end
                    end
                )
            elseif Toggler == true then

                HUM:SetStateEnabled("Seated", false)
                HUM.Sit = false

                Char.ChildAdded:Connect(
                    function(x)
                        if x:IsA("Tool") and not table.find(ST, x) then
                        end
                    end
                )
            end
        end
    end
)

SF[#SF + 1] =
    HUM.Died:Connect(
    function()
        for I, V in pairs(SF) do
            if V then
                V:Disconnect()
            end
        end
    end
)

local function callback(Text)
    if Text == "Load" then
        local LP, RS = game:GetService("Players").LocalPlayer, game:GetService("RunService")
        local Char, Pack = LP.Character, LP.Backpack
        local HRP = Char.HumanoidRootPart
        local UIS = game:GetService "UserInputService"
        local Toggler = false
        local Keybind = Enum.KeyCode.F8
        local ST = {}
        function notify(title, text, time)
        end
        for i, v in pairs(Pack:GetChildren()) do
            if v:IsA("Tool") then
                table.insert(ST, v)
            end
        end
        UIS.InputBegan:Connect(
            function(Input, IsTyping)
                if IsTyping then
                    return
                end
                if Input["KeyCode"] == Keybind then
                    Toggler = not Toggler
                    if Toggler == false then
                        --Notification
                        --Anti fe kill
                        game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
                        game.Players.LocalPlayer.Character.Humanoid.Sit = true
                        --Anti void
                        Char.ChildAdded:Connect(
                            function(x)
                                if x:IsA("Tool") and not table.find(ST, x) then
                                    x.Handle:Destroy()
                                end
                            end
                        )
                    elseif Toggler == true then
                        --Notification
                        --Turns off Anti Fe kill
                        game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                        --Turns off Anti Void
                        Char.ChildAdded:Connect(
                            function(x)
                                if x:IsA("Tool") and not table.find(ST, x) then
                                    task.wait()
                                end
                            end
                        )
                    end
                end
            end
        )
    end
end

------------------------------------------------
local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback
------------------------------------------------
game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "loading.....",
        Text = "legendary's admin'",
        Icon = "",
        Duration = 5,
        Callback = NotificationBindable
    }
)

task.spawn(
    function()
        for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
            if v:isA("Tool") then
                v:Destroy()
            end
        end
    end
)

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local AntiTool = function(Character)
    Character.ChildAdded:Connect(
        function(x)
            if x:IsA("Tool") then
                coroutine.wrap(
                    function()
                        local Handle = x:FindFirstChild("Handle")
                        local Touch
                        if Handle then
                            Handle.Name = "Part"
                            Handle.CanTouch = false
                        end
                    end
                )()
                x.AncestryChanged:Connect(
                    function(Tool, Parent)
                        if Parent == Player.Character then
                            Tool:Destroy()
                            coroutine.wrap(
                                function()
                                    task.wait()
                                    Tool.Parent = nil
                                end
                            )()
                        end
                    end
                )
            end
        end
    )
end

local AntiKill = function()
    if
        Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") and
            Player.Character:FindFirstChildWhichIsA("Humanoid").RootPart and
            workspace.CurrentCamera
     then
        local Humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
        local RootPart = Humanoid.RootPart
        if
            UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter and
                not RootPart:FindFirstChildWhichIsA("BodyMover")
         then
            local X, Y, Z = workspace.CurrentCamera.CFrame:ToEulerAnglesYXZ()
            RootPart.CFrame = CFrame.new(RootPart.Position) * CFrame.Angles(0, Y, 0)
        end
        Humanoid.Sit = true
        Humanoid:SetStateEnabled("Seated", false)
    end
end

local AVoid = function(Character)
    Character.ChildAdded:Connect(
        function(Tool)
            if
                Character and Character:FindFirstChildWhichIsA("Humanoid") and
                    Character:FindFirstChildWhichIsA("Humanoid").RootPart and
                    Tool:IsA("Tool")
             then
                workspace["FallenPartsDestroyHeight"] = 0 / 0
                local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                local RootPart = Humanoid.RootPart
                local CurrentPosition = RootPart.CFrame
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                repeat
                    RunService.Heartbeat:wait()
                until Tool.Parent == Character
                RootPart.CFrame = CurrentPosition
                RootPart.Velocity = Vector3.new()
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
            end
        end
    )
end

for _, x in next, Players:GetPlayers() do
    if x ~= Player and x.Character then
        AntiTool(x.Character)
        x.CharacterAdded:Connect(AntiTool)
    end
end
Players.PlayerAdded:Connect(
    function(P)
        if P ~= Player then
            P.CharacterAdded:Connect(AntiTool)
        end
    end
)

RunService.RenderStepped:Connect(AntiKill)

AVoid(Player.Character)
Player.CharacterAdded:Connect(AVoid)

local LocalPlayer = game.Players.LocalPlayer
game:GetService "RunService".Stepped:Connect(
    function()
        local mouse = LocalPlayer:GetMouse()
        local uis = game:GetService "UserInputService"
        local root = LocalPlayer.Character["HumanoidRootPart"]
        if uis.MouseBehavior == Enum.MouseBehavior.LockCenter then
            local ray = Ray.new(root.Position, mouse.UnitRay.Direction * 5000)
            local part, pos = workspace:FindPartOnRayWithIgnoreList(ray, {workspace})

            root.CFrame = CFrame.new(root.Position, Vector3.new(pos.X, root.Position.Y, pos.Z))
        end
        settings().Network.IncomingReplicationLag = 0
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
        game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
    end
)

local Players = game:GetService("Players")
local function onChildAdded(child)
    task.wait()
    if child.Name == "RightGrip" then
        if not child.Part1 then
            task.wait()
        end
        if child.Part1 and child.Part1.Parent and child.Part1.Parent:IsA("Accoutrement") then
            child:Destroy()
        end
    end
end
local function onCharacterAdded(char)
    if char then
        task.spawn(
            function()
                local part = char:WaitForChild("Right Arm", 3)
                if part then
                    part.ChildAdded:Connect(onChildAdded)
                end
            end
        )
        task.spawn(
            function()
                local part = char:WaitForChild("RightHand", 3)
                if part then
                    part.ChildAdded:Connect(onChildAdded)
                end
            end
        )
    end
end
local function onPlayerAdded(p)
    if p ~= Players.LocalPlayer then
        p.CharacterAdded:Connect(onCharacterAdded)
        onCharacterAdded(p.Character)
    end
end
Players.PlayerAdded:Connect(onPlayerAdded)
for _, p in ipairs(Players:GetPlayers()) do
    onPlayerAdded(p)
end

task.spawn(
    function()
        _G.STOP = true -- disable
        wait(1)
        _G.STOP = false -- enable

        local off = false
        local cf, pos
        local sotp = false
        local tools = {}

        for i, v in pairs(game:service "Players".LocalPlayer.Backpack:getChildren "") do
            tools[v] = true
        end

        game:service "Players".LocalPlayer.Backpack.ChildAdded:connect(
            function(c)
                if off then
                    return
                end
                tools[c] = true
            end
        )

        local thing = function(ob)
            if off then
                return
            end
            if ob:IsA("Tool") and not tools[ob] then
                game:service "RunService".Stepped:wait ""
                tools[ob] = true
                sotp = true
                ob.Parent = game:service "Players".LocalPlayer.Backpack
                for i = 1, 1 do
                    if
                        game:service "Players".LocalPlayer.Character and
                            game:service "Players".LocalPlayer.Character:findFirstChild "HumanoidRootPart"
                     then
                        game:service "Players".LocalPlayer.Character.HumanoidRootPart.CFrame = cf
                        for i, v in pairs(game:service "Players".LocalPlayer.Character:getChildren "") do
                            if v:IsA("BasePart") or v:IsA("MeshPart") then
                                v.Velocity = Vector3.new(0, 0, 0)
                            end
                        end
                        game:service "RunService".Stepped:wait ""
                    end
                end
                sotp = false
            end
        end

        game:service "Players".LocalPlayer.Character.ChildAdded:connect(thing)
        game:service "Players".LocalPlayer.CharacterAdded:connect(
            function(c)
                c.ChildAdded:connect(thing)
            end
        )

        while task.wait() and not _G.STOP do
            if
                game:service "Players".LocalPlayer.Character and
                    game:service "Players".LocalPlayer.Character:findFirstChild("HumanoidRootPart") and
                    not sotp
             then
                cf = game:service "Players".LocalPlayer.Character.HumanoidRootPart.CFrame
                pos = game:service "Players".LocalPlayer.Character.HumanoidRootPart.Position
            end
        end

        off = true
    end
)

spawn(
    function()
        _G.STOP = true -- disable
        wait(1)
        _G.STOP = false -- enable
        local off = false
        local cf, pos
        local sotp = false
        local tools = {}

        for i, v in pairs(game:service "Players".LocalPlayer.Backpack:getChildren "") do
            tools[v] = true
        end

        game:service "Players".LocalPlayer.Backpack.ChildAdded:connect(
            function(c)
                if off then
                    return
                end
                tools[c] = true
            end
        )

        local thing = function(ob)
            if off then
                return
            end
            if ob:IsA("Tool") and not tools[ob] then
                game:service "RunService".Stepped:wait ""
                tools[ob] = true
                sotp = true
                ob.Parent = game:service "Players".LocalPlayer.Backpack
                for i = 1, 1 do
                    if
                        game:service "Players".LocalPlayer.Character and
                            game:service "Players".LocalPlayer.Character:findFirstChild "HumanoidRootPart"
                     then
                        game:service "Players".LocalPlayer.Character.HumanoidRootPart.CFrame = cf
                        for i, v in pairs(game:service "Players".LocalPlayer.Character:getChildren "") do
                            if v:IsA("BasePart") or v:IsA("MeshPart") then
                                v.Velocity = Vector3.new(10, 33, 12)
                            end
                        end
                        game:service "RunService".Stepped:wait ""
                    end
                end
                sotp = false
            end
        end

        game:service "Players".LocalPlayer.Character.ChildAdded:connect(thing)
        game:service "Players".LocalPlayer.CharacterAdded:connect(
            function(c)
                c.ChildAdded:connect(thing)
            end
        )

        while task.wait() and not _G.STOP do
            if
                game:service "Players".LocalPlayer.Character and
                    game:service "Players".LocalPlayer.Character:findFirstChild("HumanoidRootPart") and
                    not sotp
             then
                cf = game:service "Players".LocalPlayer.Character.HumanoidRootPart.CFrame
                pos = game:service "Players".LocalPlayer.Character.HumanoidRootPart.Position
            end
        end

        off = true
    end
)

spawn(
    function()
        _G.STOP = true -- disable
        wait(1)
        _G.STOP = false -- enable

        game:service "StarterGui":SetCore(
            "SendNotification",
            {
                Title = "anti void loaded",
                Text = "legendary's admin'"
            }
        )

        local off = false
        local cf, pos
        local sotp = false
        local tools = {}

        for i, v in pairs(game:service "Players".LocalPlayer.Backpack:getChildren "") do
            tools[v] = true
        end

        game:service "Players".LocalPlayer.Backpack.ChildAdded:connect(
            function(c)
                if off then
                    return
                end
                tools[c] = true
            end
        )

        local thing = function(ob)
            if off then
                return
            end
            if ob:IsA("Tool") and not tools[ob] then
                game:service "RunService".Stepped:wait ""
                tools[ob] = true
                sotp = true
                ob.Parent = game:GetService("Lighting")
                ob.Parent = game:service "Players".LocalPlayer.Backpack
                game:service "StarterGui":SetCore(
                    "SendNotification",
                    {
                        Title = "legendary's admin",
                        Text = "void has been prevented:"
                    }
                )
                for i = 1, 0 do
                    if
                        game:service "Players".LocalPlayer.Character and
                            game:service "Players".LocalPlayer.Character:findFirstChild "HumanoidRootPart"
                     then
                        game:service "Players".LocalPlayer.Character.HumanoidRootPart.CFrame = cf
                        for i, v in pairs(game:service "Players".LocalPlayer.Character:getChildren "") do
                            if v:IsA("BasePart") or v:IsA("MeshPart") then
                                v.Velocity = Vector3.new(0, 0, 0)
                            end
                        end
                        game:service "RunService".Stepped:wait ""
                    end
                end
                sotp = false
            end
        end

        game:service "Players".LocalPlayer.Character.ChildAdded:connect(thing)
        game:service "Players".LocalPlayer.CharacterAdded:connect(
            function(c)
                c.ChildAdded:connect(thing)
            end
        )

        while wait(.5) and not _G.STOP do
            if
                game:service "Players".LocalPlayer.Character and
                    game:service "Players".LocalPlayer.Character:findFirstChild("HumanoidRootPart") and
                    not sotp
             then
                cf = game:service "Players".LocalPlayer.Character.HumanoidRootPart.CFrame
                pos = game:service "Players".LocalPlayer.Character.HumanoidRootPart.Position
            end
        end

        off = true
    end
)
end)

AddCommand("leg",function()
local Settings = {
    Values = {
        BodyTypeScale = true;
        BodyProportionScale = true;
        BodyWidthScale = true;
        BodyHeightScale = true;
        BodyDepthScale = true;
        HeadScale = true;
    };
    OriginalSize = true;
    OriginalPosition = false;
}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
local WaitFunc = function(x) x.DescendantAdded:wait() task.wait() end

if Humanoid.RigType == Enum.HumanoidRigType.R6 then return end

Character.LeftUpperLeg.LeftKneeRigAttachment:Destroy()
Character.LeftLowerLeg.LeftAnkleRigAttachment:Destroy()
Character.LeftFoot.LeftFootAttachment:Destroy()

for _,x in next, Settings.Values do
    if x then
        if Settings.OriginalSize then --Specific Path/Settings
            for _, _os in next, Character:GetDescendants() do
                if _os.Name == "OriginalSize" and _os:IsA("ValueBase") then
                    _os:Destroy()
                end
            end
        end
        if Settings.OriginalPosition then
            for _, _op in next, Character:GetDescendants() do
                if _op.Name == "OriginalPosition" and _op:IsA("ValueBase") then
                    _op:Destroy()
                end
            end
        end
        if Humanoid:FindFirstChild(tostring(_)) then
            Humanoid:FindFirstChild(tostring(_)):Destroy()
        end
        WaitFunc(Character)
    end
end
end)

AddCommand("head",function()
local Size = 6 --max size is 6
local SetHandleSize = true
local RemoveSeats = true

if Size > 6 then
    Size = 6
end

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character

local Humanoid
local Head

if Character:FindFirstChildOfClass("Humanoid") then
    Humanoid = Character:FindFirstChildOfClass("Humanoid")
end
if Character:FindFirstChild("Head") then
    Head = Character.Head
end

if Humanoid.RigType == Enum.HumanoidRigType.R6 then return end

coroutine.wrap(function()
    while Character do
        for _,x in next, Character:GetChildren() do
            if x:IsA("BasePart") then
                if x.CanCollide then
                    x.CanCollide = false
                    x.CustomPhysicalProperties = PhysicalProperties.new(9e9,9e9,9e9,9e9,9e9)
                end
            end
        end
        RunService.Stepped:wait()
    end
end)()
coroutine.wrap(function()
    while Character do
        local hum = Character.Humanoid
        local root = hum.RootPart
        
        if not hum or not root then return end
        
        if not Character:FindFirstChildWhichIsA("BodyMover", true) and UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
            local x,y,z = workspace.CurrentCamera.CFrame:ToEulerAnglesYXZ()
            Character:SetPrimaryPartCFrame(CFrame.new(root.CFrame.p) * CFrame.Angles(0, y, 0))
        end
        RunService.Heartbeat:wait()
    end
end)()

for i = 1,Size do
    if Head:FindFirstChild("OriginalSize") then
        if SetHandleSize then
            Head:FindFirstChild("OriginalSize"):Destroy()
        end
        task.wait()
        if Humanoid:FindFirstChildOfClass("NumberValue") then
            Humanoid:FindFirstChildOfClass("NumberValue"):Destroy()
        end
        Head.ChildAdded:wait()
        task.wait()
    end
end
if RemoveSeats then
    for _,x in next, workspace:GetDescendants() do
        if x:IsA("Seat") then
            x:Destroy()
        end
    end
end

Character.Animate.Disabled = true
for _,x in next, Humanoid:GetPlayingAnimationTracks() do
    x:Stop()
end
Humanoid.HipHeight = 8.5
end)

AddCommand("tfling",function()

local function velocity(part)
    if part:FindFirstChild('BodyPosition') then   
        if not part:FindFirstChild('BodyVelocity') then
        local bv = Instance.new('BodyVelocity', part)
        bv.Velocity = Vector3.new(-26,0,0)
        end
        part.Velocity = Vector3.new(25.70,0,0)
    end
end

local function addbody(part)
    task.spawn(function()
        local b = part

        local BodyPosition = Instance.new("BodyPosition", b)
        BodyPosition.MaxForce = Vector3.new(1/0,1/0,1/0)
        BodyPosition.P = 9e9
        BodyPosition.Position = part.Position

        local BodyGyro = Instance.new("BodyGyro", b)
        BodyGyro.MaxTorque = Vector3.new(1/0,1/0,1/0)
        BodyGyro.P = 9e9
        b.CanCollide = false

        b:BreakJoints()
        while true do 
            velocity(b)
            game:GetService("RunService").Heartbeat:wait()
        end
    end)
end   

local function getbody(part)
if part:FindFirstChild('BodyPosition') then 
    return part:FindFirstChild('BodyPosition')
    end
end  

local function bringouttools()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
        if v:IsA('Tool') then 
            v.Parent = game.Players.LocalPlayer.Character
            addbody(v.Handle)
            v.Handle.BodyPosition.Position = v.Handle.Position + Vector3.new(5,0,0)
        end
    end
end

local function randomplayer()
    local output = {}
    local output2 = {}
    for i,v in pairs(game.Players:GetPlayers()) do 
        if v~=nil and v.Character and v ~= game.Players.LocalPlayer and v.Character:FindFirstChild('HumanoidRootPart') and v.Character:FindFirstChild('Humanoid') then 
            table.insert(output, v)
        end
    end
    if output ~= output2 then 
        return output[math.random(1,#output)].Character.HumanoidRootPart
    else
        return false
    end
end

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
    if v:IsA('Tool') then 
        v.Parent = game.Players.LocalPlayer.Character
    end
end

task.wait(0.5)

for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
    if v:IsA('Tool') then 
        v.Parent = game.Players.LocalPlayer.Backpack
    end
end 
task.wait(0.5)

for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v.Name == "Right Arm" or v.Name == "RightHand" then
    v:Destroy()
end
task.wait()
    if v:IsA("Tool") then
        v.Handle.CanCollide = false
        task.wait()
    end
end

local plr = game.Players.LocalPlayer
local chr = plr.Character
local num = 0
bringouttools()

task.spawn(function()
    while true do
        for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Handle.RotVelocity = Vector3.new(9e9,9e9,9e9)
            end
        end
        game:GetService("RunService").Heartbeat:wait()
    end
end)


task.spawn(function()
     while true do 
        for i,v in pairs(chr:GetChildren()) do 
            if v:IsA('Tool') and v:FindFirstChild('Handle') and v.Handle:FindFirstChild('BodyPosition') then 
                velocity(v.Handle)
            end
        end
        game:GetService("RunService").Heartbeat:wait()
    end
end)

task.spawn(function()
    while true do
    if randomplayer() ~= false then 
        for i,v in pairs(chr:GetChildren()) do 
            if v:IsA('Tool') and v:FindFirstChild('Handle') and v.Handle:FindFirstChild('BodyPosition') then 
                velocity(v.Handle)
                local target = randomplayer()
                local pos = (chr.HumanoidRootPart.Position-target.Position).Magnitude
                if pos < 375 then 
                    getbody(v.Handle).Position = target.Position + Vector3.new(0,math.sin(num/10)) + target.Parent.Humanoid.MoveDirection
                    task.wait(.175)
                end
            end
        end
        num += 1
        game:GetService("RunService").Heartbeat:wait()
        end
    end
end)
end)

AddCommand("fat",function()
local LP = game.Players.LocalPlayer
for i,v in next, LP.Character.Humanoid:GetChildren() do
    if v:IsA'NumberValue' then
        v:Destroy()
        task.wait()
    end
end
end)

AddCommand("massreport",function()

local p=game.Players.LocalPlayer
local hb=game:GetService("RunService").Heartbeat
local prefix="."

local reas={"Swearing","Bullying","Scamming","Dating","Cheating/Exploiting","Personal Question","Offsite Links","Inappropriate Username"} -- reasons
local mess={"Niggers","Niggers"} -- messages

function getplr(player)
    local ok={}
    for _,v in pairs(game.Players:GetChildren()) do
        if string.match(v.Name:lower(),player:lower()) then
            table.insert(ok,v)
        end
    end
    return ok
end

p.Chatted:Connect(function(msg)
    if msg:match(prefix.."massreport") then
        for _,v in pairs(getplr(msg:sub(9))) do
            hb:Connect(function()
            local reasons=reas[math.random(1,#reas)]
            local messages=mess[math.random(1,#mess)]
            print("reported "..messages.." "..reasons)
            game.Players:ReportAbuse(v,reasons,messages)
            end)
        end
    end
end)
end)

AddCommand("stretch",function()
function rm()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name == "Handle" or v.Name == "Head" then
                if game.Players.LocalPlayer.Character.Head:FindFirstChild("OriginalSize") then
                    game.Players.LocalPlayer.Character.Head.OriginalSize:Destroy()
                end
            else
                v:FindFirstChild("OriginalSize"):Destroy()
                if v:FindFirstChild("AvatarPartScaleType") then
                end
            end
        end
    end
end
rm()
wait(0.5)
game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
wait(1)
rm()
wait(0.5)
game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
wait(1)
rm()
wait(0.5)
game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
wait(1)
rm()
wait(0.5)
game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
wait(1)
rm()
wait()
wait(0.5)
game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("HeadScale"):Destroy()
wait(1)
rm()
wait()
wait(0.5)
game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
wait(1)
end)

AddCommand("bait",function()

local minePos = CFrame.new(5556.78906, 29.9942169, -17137.8027, 0.919021428, -9.53787378e-08, -0.394207567, 7.70871935e-08, 1, -6.22361256e-08, 0.394207567, 2.68079781e-08, 0.919021428)
local minePos2 = CFrame.new(5503.51855, 32.1502457, -17102.4609, -0.0469753221, -1.05281146e-07, -0.998896062, -5.14456069e-08, 1, -1.02978149e-07, 0.998896062, 4.65513814e-08, -0.0469753221) - Vector3.new(0,2,0)
local hidePos = CFrame.new(5547.75928, 32.0002213, -17147.7383, -0.830992401, 2.20322214e-08, -0.556283772, 9.57291562e-08, 1, -1.03396836e-07, 0.556283772, -1.3917456e-07, -0.830992401)
local hidePos2 = CFrame.new(5502.82471, 32.1502457, -17141.5566, -0.99996525, 1.36514551e-08, 0.00833945442, 1.43237182e-08, 1, 8.05526739e-08, -0.00833945442, 8.06693237e-08, -0.99996525)

local mine = game.Players.LocalPlayer.Character:FindFirstChildOfClass'Tool' or game.Players.LocalPlayer.Backpack:FindFirstChildOfClass'Tool'
mine.Parent = game.Players.LocalPlayer.Character
wait(.5)
mine.Handle.Massless = true
local pee = true
local new = Instance.new('Part', workspace)
new.Size = Vector3.new(3,2,1)
new.Transparency = 0
new.Massless = true
new.CanCollide = false
new.Color = Color3.new(1,0,0)
new.Transparency = .65
new.Material = 'SmoothPlastic'
wait()
local weld = Instance.new("Weld", mine.Handle)
weld.C0 = CFrame.new()
weld.C1 = CFrame.new()
weld.Part0 = mine.Handle
weld.Part1 = new
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hidePos
new.Touched:Connect(function(x)
    local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if x.Name == 'Left Leg' or x.Name == 'Right Leg' or x.Name == 'RightFoot' or x.Name == 'LeftFoot' then
        game.Players.LocalPlayer.Character.Head.Anchored = false
        pee = false
        new:Destroy()
        local Target = x.Parent
        local LocalPlayer = game.Players.LocalPlayer
        mine.Parent = LocalPlayer.Backpack
        local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		newHum:ChangeState(15)
        mine.Parent = LocalPlayer.Character
		firetouchinterest(mine.Handle, Target.Head, 0)
        game.Players.LocalPlayer.CharacterAdded:Wait()
		repeat wait() until LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
end)

task.spawn(function()
    repeat
        mine.Grip = CFrame.new()
        mine.Grip = mine.Handle.CFrame:ToObjectSpace(minePos):Inverse()
        mine.Parent = game.Players.LocalPlayer.Backpack
        mine.Parent = game.Players.LocalPlayer.Character
        game:GetService('RunService').RenderStepped:Wait()
    until pee == false
end)
end)

AddCommand("gun",function()

game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
local v = 0
local vm = 3
for _,z in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if z:IsA'Tool' then do
        v = v - .2 -- < edit these
        vm = vm * .3 -- < edit these
        z.Parent = game.Players.LocalPlayer.Character
        z.Grip = CFrame.new(v,vm + -1.65,0)
        z.GripUp = Vector3.new(4,1,0)
        z.GripRight = Vector3.new(45,0,-2)
        z.GripForward = Vector3.new(1,0,0)
    end
    end
end
end)

AddCommand("edges",function()
aa = game:GetObjects("rbxassetid://01997056190")[1]
aa.Parent = game.CoreGui
wait(0.2)
GUI = aa.PopupFrame.PopupFrame
pos = 0

ignore = {
"rbxasset://sounds/action_get_up.mp3",
"rbxasset://sounds/uuhhh.mp3",
"rbxasset://sounds/action_falling.mp3",
"rbxasset://sounds/action_jump.mp3",
"rbxasset://sounds/action_jump_land.mp3",
"rbxasset://sounds/impact_water.mp3",
"rbxasset://sounds/action_swim.mp3",
"rbxasset://sounds/action_footsteps_plastic.mp3"
}

GUI.Close.MouseButton1Click:connect(function()
GUI:TweenSize(UDim2.new(0, 360, 0, 0),"Out","Quad",0.5,true) wait(0.6)
GUI.Parent:TweenSize(UDim2.new(0, 0, 0, 20),"Out","Quad",0.5,true) wait(0.6)
aa:Destroy()
end)

local min = false
GUI.Minimize.MouseButton1Click:connect(function()
if min == false then
GUI:TweenSize(UDim2.new(0, 360, 0, 20),"Out","Quad",0.5,true) min = true
else
GUI:TweenSize(UDim2.new(0, 360, 0, 260),"Out","Quad",0.5,true) min = false
end
end)

function printTable(tbl)
if type(tbl) ~= 'table' then return nil end
local depthCount = -15

local function run(val, inPrefix)
depthCount = depthCount + 15
-- if inPrefix then print(string.rep(' ', depthCount) .. '{') end
for i,v in pairs(val) do
if type(v) == 'table' then
-- print(string.rep(' ', depthCount) .. ' [' .. tostring(i) .. '] = {')
GUI.Store.Text = GUI.Store.Text..'\n'..string.rep(' ', depthCount) .. ' [' .. tostring(i) .. '] = {'
run(v, false)
wait()
else
-- print(string.rep(' ', depthCount) .. ' [' .. tostring(i) .. '] = ' .. tostring(v))
GUI.Store.Text = GUI.Store.Text..'\n'..string.rep(' ', depthCount) .. ' [' .. tostring(i) .. '] = ' .. tostring(v)
wait()
end
end
-- print(string.rep(' ', depthCount) .. '}')
depthCount = depthCount - 15
end
run(tbl, true)
end

function refreshlist()
pos = 0
GUI.Logs.CanvasSize = UDim2.new(0,0,0,0)
for i,v in pairs(GUI.Logs:GetChildren()) do
v.Position = UDim2.new(0,0,0, pos)
GUI.Logs.CanvasSize = UDim2.new(0,0,0, pos+20)
pos = pos+20
end
end

function FindTable(Table, Name)
for i,v in pairs(Table) do
if v == Name then
return true
end end
return false
end

function writefileExploit()
if writefile then
return true
end
end

writeaudio = {}
running = false
GUI.SS.MouseButton1Click:connect(function()
if writefileExploit() then
if running == false then
GUI.Load.Visible = true running = true
GUI.Load:TweenSize(UDim2.new(0, 360, 0, 20),"Out","Quad",0.5,true) wait(0.3)
for _, child in pairs(GUI.Logs:GetChildren()) do
if child:FindFirstChild('ImageButton') then local bttn = child:FindFirstChild('ImageButton')
if bttn.BackgroundTransparency == 0 then
writeaudio[#writeaudio + 1] = {NAME = child.NAME.Value, ID = child.ID.Value}
end
end
end
GUI.Store.Visible = true
printTable(writeaudio)
wait(0.2)
local filename = 0
local function write()
local file
pcall(function() file = readfile("Audios"..filename..".txt") end)
if file then
filename = filename+1
write()
else
local text = tostring(GUI.Store.Text)
text = text:gsub('\n', '\r\n')
writefile("Audios"..filename..".txt", text)
end
end
write()
for rep = 1,10 do
GUI.Load.BackgroundTransparency = GUI.Load.BackgroundTransparency + 0.1
wait(0.05)
end
GUI.Load.Visible = false
GUI.Load.BackgroundTransparency = 0
GUI.Load.Size = UDim2.new(0, 0, 0, 20)
running = false
GUI.Store.Visible = false
GUI.Store.Text = ''
writeaudio = {}
game:FindService('StarterGui'):SetCore('SendNotification', {
Title = 'Audio Logger',
Text = 'Saved audios\n(Audios'..filename..'.txt)',
Icon = 'http://www.roblox.com/asset/?id=176572847',
Duration = 5,
})
end
else
game:FindService('StarterGui'):SetCore('SendNotification', {
Title = 'Audio Logger',
Text = 'Exploit cannot writefile :(',
Icon = 'http://www.roblox.com/asset/?id=176572847',
Duration = 5,
})
end
end)

GUI.SA.MouseButton1Click:connect(function()
if writefileExploit() then
if running == false then
GUI.Load.Visible = true running = true
GUI.Load:TweenSize(UDim2.new(0, 360, 0, 20),"Out","Quad",0.5,true) wait(0.3)
for _, child in pairs(GUI.Logs:GetChildren()) do
writeaudio[#writeaudio + 1] = {NAME = child.NAME.Value, ID = child.ID.Value}
end
GUI.Store.Visible = true
printTable(writeaudio)
wait(0.2)
local filename = 0
local function write()
local file
pcall(function() file = readfile("Audios"..filename..".txt") end)
if file then
filename = filename+1
write()
else
local text = tostring(GUI.Store.Text)
text = text:gsub('\n', '\r\n')
writefile("Audios"..filename..".txt", text)
end
end
write()
for rep = 1,10 do
GUI.Load.BackgroundTransparency = GUI.Load.BackgroundTransparency + 0.1
wait(0.05)
end
GUI.Load.Visible = false
GUI.Load.BackgroundTransparency = 0
GUI.Load.Size = UDim2.new(0, 0, 0, 20)
running = false
GUI.Store.Visible = false
GUI.Store.Text = ''
writeaudio = {}
game:FindService('StarterGui'):SetCore('SendNotification', {
Title = 'Audio Logger',
Text = 'Saved audios\n(Audios'..filename..'.txt)',
Icon = 'http://www.roblox.com/asset/?id=176572847',
Duration = 5,
})
end
else
game:FindService('StarterGui'):SetCore('SendNotification', {
Title = 'Audio Logger',
Text = 'Exploit cannot writefile :(',
Icon = 'http://www.roblox.com/asset/?id=176572847',
Duration = 5,
})
end
end)

selectedaudio = nil
function getaudio(place)
if running == false then
GUI.Load.Visible = true running = true
GUI.Load:TweenSize(UDim2.new(0, 360, 0, 20),"Out","Quad",0.5,true) wait(0.3)
for _, child in pairs(place:GetDescendants()) do
spawn(function()
if child:IsA("Sound") and not GUI.Logs:FindFirstChild(child.SoundId) and not FindTable(ignore,child.SoundId) then
local id = string.match(child.SoundId, "rbxasset://sounds.+") or string.match(child.SoundId, "&hash=.+") or string.match(child.SoundId, "%d+")
if id ~= nil then
local newsound = GUI.Audio:Clone()
if string.sub(id, 1, 6) == "&hash=" or string.sub(id, 1, 7) == "&0hash=" then
id = string.sub(id, (string.sub(id, 1, 6) == "&hash=" and 7) or (string.sub(id, 1, 7) == "&0hash=" and 8), string.len(id))
newsound.ImageButton.Image = 'rbxassetid://1453863294'
end
newsound.Parent = GUI.Logs
newsound.Name = child.SoundId
newsound.Visible = true
newsound.Position = UDim2.new(0,0,0, pos)
GUI.Logs.CanvasSize = UDim2.new(0,0,0, pos+20)
pos = pos+20
local function findname()
Asset = game:GetService("MarketplaceService"):GetProductInfo(id)
end
local audioname = 'error'
local success, message = pcall(findname)
if success then
    newsound.TextLabel.Text = Asset.Name
audioname = Asset.Name
else
newsound.TextLabel.Text = child.Name
audioname = child.Name
end
local data = Instance.new('StringValue') data.Parent = newsound data.Value = child.SoundId data.Name = 'ID'
local data2 = Instance.new('StringValue') data2.Parent = newsound data2.Value = audioname data2.Name = 'NAME'
local soundselected = false
newsound.ImageButton.MouseButton1Click:Connect(function()
if GUI.Info.Visible ~= true then
if soundselected == false then soundselected = true
newsound.ImageButton.BackgroundTransparency = 0
else soundselected = false
newsound.ImageButton.BackgroundTransparency = 1
end
end
end)
newsound.Click.MouseButton1Click:Connect(function()
if GUI.Info.Visible ~= true then
GUI.Info.TextLabel.Text = "Name: " ..audioname.. "\n\nID: " .. child.SoundId .. "\n\nWorkspace Name: " .. child.Name
selectedaudio = child.SoundId
GUI.Info.Visible = true
end
end)
end
end
end)
end
end
for rep = 1,10 do
GUI.Load.BackgroundTransparency = GUI.Load.BackgroundTransparency + 0.1
wait(0.05)
end
GUI.Load.Visible = false
GUI.Load.BackgroundTransparency = 0
GUI.Load.Size = UDim2.new(0, 0, 0, 20)
running = false
end

GUI.All.MouseButton1Click:connect(function() getaudio(game)end)
GUI.Workspace.MouseButton1Click:connect(function() getaudio(workspace)end)
GUI.Lighting.MouseButton1Click:connect(function() getaudio(game:GetService('Lighting'))end)
GUI.SoundS.MouseButton1Click:connect(function() getaudio(game:GetService('SoundService'))end)
GUI.Clr.MouseButton1Click:connect(function()
for _, child in pairs(GUI.Logs:GetChildren()) do
if child:FindFirstChild('ImageButton') then local bttn = child:FindFirstChild('ImageButton')
if bttn.BackgroundTransparency == 1 then
bttn.Parent:Destroy()
refreshlist()
end
end
end
end)
GUI.ClrS.MouseButton1Click:connect(function()
for _, child in pairs(GUI.Logs:GetChildren()) do
if child:FindFirstChild('ImageButton') then local bttn = child:FindFirstChild('ImageButton')
if bttn.BackgroundTransparency == 0 then
bttn.Parent:Destroy()
refreshlist()
end
end
end
end)
autoscan = false
GUI.AutoScan.MouseButton1Click:connect(function()
if autoscan == false then autoscan = true
GUI.AutoScan.BackgroundTransparency = 0.5
game:FindService('StarterGui'):SetCore('SendNotification', {
Title = 'Audio Logger',
Text = 'Auto Scan ENABLED',
Icon = 'http://www.roblox.com/asset/?id=176572847',
Duration = 5,
})
else autoscan = false
GUI.AutoScan.BackgroundTransparency = 0
game:FindService('StarterGui'):SetCore('SendNotification', {
Title = 'Audio Logger',
Text = 'Auto Scan DISABLED',
Icon = 'http://www.roblox.com/asset/?id=176572847',
Duration = 5,
})
end
end)

game.DescendantAdded:connect(function(added)
wait()
if autoscan == true and added:IsA('Sound') and not GUI.Logs:FindFirstChild(added.SoundId) and not FindTable(ignore,added.SoundId) then
local id = string.match(added.SoundId, "rbxasset://sounds.+") or string.match(added.SoundId, "&hash=.+") or string.match(added.SoundId, "%d+")
if id ~= nil then
local newsound = GUI.Audio:Clone()
if string.sub(id, 1, 6) == "&hash=" or string.sub(id, 1, 7) == "&0hash=" then
id = string.sub(id, (string.sub(id, 1, 6) == "&hash=" and 7) or (string.sub(id, 1, 7) == "&0hash=" and 8), string.len(id))
newsound.ImageButton.Image = 'rbxassetid://1453863294'
end
local scrolldown = false
newsound.Parent = GUI.Logs
newsound.Name = added.SoundId
newsound.Visible = true
newsound.Position = UDim2.new(0,0,0, pos)
if GUI.Logs.CanvasPosition.Y == GUI.Logs.CanvasSize.Y.Offset - 230 then
scrolldown = true
end
GUI.Logs.CanvasSize = UDim2.new(0,0,0, pos+20)
pos = pos+20
local function findname()
Asset = game:GetService("MarketplaceService"):GetProductInfo(id)
end
local audioname = 'error'
local success, message = pcall(findname)
if success then
    newsound.TextLabel.Text = Asset.Name
audioname = Asset.Name
else
newsound.TextLabel.Text = added.Name
audioname = added.Name
end
local data = Instance.new('StringValue') data.Parent = newsound data.Value = added.SoundId data.Name = 'ID'
local data2 = Instance.new('StringValue') data2.Parent = newsound data2.Value = audioname data2.Name = 'NAME'
local soundselected = false
newsound.ImageButton.MouseButton1Click:Connect(function()
if GUI.Info.Visible ~= true then
if soundselected == false then soundselected = true
newsound.ImageButton.BackgroundTransparency = 0
else soundselected = false
newsound.ImageButton.BackgroundTransparency = 1
end
end
end)
newsound.Click.MouseButton1Click:Connect(function()
if GUI.Info.Visible ~= true then
GUI.Info.TextLabel.Text = "Name: " ..audioname.. "\n\nID: " .. added.SoundId .. "\n\nWorkspace Name: " .. added.Name
selectedaudio = added.SoundId
GUI.Info.Visible = true
end
end)
--230'
if scrolldown == true then
GUI.Logs.CanvasPosition = Vector2.new(0, 9999999999999999999999999999999999999999999, 0, 0)
end
end
end
end)

GUI.Info.Copy.MouseButton1Click:Connect(function()
if pcall(function() Synapse:Copy(selectedaudio) end) then
else
local clip = setclipboard or Clipboard.set
clip(selectedaudio)
end
game:FindService('StarterGui'):SetCore('SendNotification', {
Title = 'Audio Logger',
Text = 'Copied to clipboard',
Icon = 'http://www.roblox.com/asset/?id=176572847',
Duration = 5,
})
end)

GUI.Info.Close.MouseButton1Click:Connect(function()
GUI.Info.Visible = false
for _, sound in pairs(game:GetService('Players').LocalPlayer.PlayerGui:GetChildren()) do
if sound.Name == 'SampleSound' then
sound:Destroy()
end
end
GUI.Info.Listen.Text = 'Listen'
end)

GUI.Info.Listen.MouseButton1Click:Connect(function()
if GUI.Info.Listen.Text == 'Listen' then
local samplesound = Instance.new('Sound') samplesound.Parent = game:GetService('Players').LocalPlayer.PlayerGui
samplesound.Looped = true samplesound.SoundId = selectedaudio samplesound:Play() samplesound.Name = 'SampleSound'
samplesound.Volume = 5
GUI.Info.Listen.Text = 'Stop'
else
for _, sound in pairs(game:GetService('Players').LocalPlayer.PlayerGui:GetChildren()) do
if sound.Name == 'SampleSound' then
sound:Destroy()
end
end
GUI.Info.Listen.Text = 'Listen'
end
end)

function drag(gui)
spawn(function()
local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos
local function update(input)
local delta = input.Position - dragStart
gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), "InOut", "Quart", 0.04, true, nil)
end
gui.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = gui.Position
input.Changed:Connect(function()
           if input.UserInputState == Enum.UserInputState.End then
               dragging = false
           end
       end)
   end
end)
gui.InputChanged:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
       dragInput = input
   end
end)
UserInputService.InputChanged:Connect(function(input)
   if input == dragInput and dragging then
       update(input)
   end
end)
end)
end
drag(aa.PopupFrame)
end)

AddCommand("adv",function()
wait(0.5)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("I am using legendary's private admin (legendary0001 for purchase)", "All")
end)

AddCommand("bplay",function()

local player = game.Players.LocalPlayer.Character
local de = game.Players.LocalPlayer

local id = args[2] --sound id of course

for i = 1,20 do -- how much boombox u wanna mass play

de.Backpack["BoomBox"].Name = "BoomBox1"

de.Backpack["BoomBox1"].Parent = player

player["BoomBox1"].Remote:FireServer("PlaySong",id) -- sound id

player["BoomBox1"].Handle.Sound.Playing = true


pcall(function()
player["BoomBox1"].Server:Destroy()
end)

player["BoomBox1"].Parent = de.Backpack

de.Backpack["BoomBox1"].Handle.Sound.Playing = true

spawn(function()
    while true do
        de.Backpack["BoomBox1"].Parent = player
        player["BoomBox1"].Parent = de.Backpack
        de.Backpack["BoomBox1"].Handle.Sound.Playing = true
        wait()
    end
end)
end
end)

AddCommand("reveal",function() -- use a char package and destroys character mesh

local speed = 0.01
function removeparts() 
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
        if v:IsA('CharacterMesh') then v:Destroy() wait(speed) end
    end
end
removeparts()
end)

AddCommand("antichat",function()

if not game:IsLoaded() then
    game.Loaded:wait()
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer or Players.PlayerAdded:wait()

local PostMessage = require(Player:WaitForChild("PlayerScripts"):WaitForChild("ChatScript"):WaitForChild("ChatMain")).MessagePosted
MessageEvent = Instance.new("BindableEvent")

local OldFunctionHook
local PostMessageHook = function(self, Message)
    if not checkcaller() and self == PostMessage then
        MessageEvent:Fire(Message)
        return
    end
    return OldFunctionHook(self, Message)
end
OldFunctionHook = hookfunction(PostMessage.fire, PostMessageHook)
end)


AddCommand("rifle",function()


				local num = 0
				local bp = game.Players.LocalPlayer.Backpack
				for i,v in pairs(bp:GetChildren()) do
					num = num + 1
					v.Name =  num
				end
				wait(0.15)
				local POS1 = game.Players.LocalPlayer.Backpack["1"]
				local POS2 = game.Players.LocalPlayer.Backpack["2"]
				local POS3 = game.Players.LocalPlayer.Backpack["3"]
				local POS4 = game.Players.LocalPlayer.Backpack["4"]
				local POS5 = game.Players.LocalPlayer.Backpack["5"]
				local POS6 = game.Players.LocalPlayer.Backpack["6"]
				local POS7 = game.Players.LocalPlayer.Backpack["7"]
				local POS8 = game.Players.LocalPlayer.Backpack["8"]
				local POS9 = game.Players.LocalPlayer.Backpack["9"]
				local POS10 = game.Players.LocalPlayer.Backpack["10"]
				local POS11 = game.Players.LocalPlayer.Backpack["11"]
				local POS12 = game.Players.LocalPlayer.Backpack["12"]
				local POS13 = game.Players.LocalPlayer.Backpack["13"]
				local POS14 = game.Players.LocalPlayer.Backpack["14"]
				local POS15 = game.Players.LocalPlayer.Backpack["15"]
				local POS16 = game.Players.LocalPlayer.Backpack["16"]
				local POS17 = game.Players.LocalPlayer.Backpack["17"]
				local POS18 = game.Players.LocalPlayer.Backpack["18"]
				local POS19 = game.Players.LocalPlayer.Backpack["19"]

				POS1.GripPos = Vector3.new(-2.193, -1.25, 0) -- MAIN POS
				POS1.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS1.GripUp = Vector3.new(0, 1, 0) -- UP
				POS1.GripForward = Vector3.new(1, 0, 0) -- FORWARD

				POS2.GripPos = Vector3.new(1.709, 1.957, 0) -- MAIN POS
				POS2.GripRight = Vector3.new(0, -0, 1) -- RIGHT
				POS2.GripUp = Vector3.new(-0.012, -1, 0) -- UP
				POS2.GripForward = Vector3.new(-1, 0.012, 0) -- FORWARD

				POS3.GripPos = Vector3.new(-4.401, -0.662, -0) -- MAIN POS
				POS3.GripRight = Vector3.new(-0, 0, 1) -- RIGHT
				POS3.GripUp = Vector3.new(0.16, 0.987, 0) -- UP
				POS3.GripForward = Vector3.new(0.987, -0.16, 0) -- FORWARD

				POS4.GripPos = Vector3.new(-2.768, -2.295, 0) -- MAIN POS
				POS4.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS4.GripUp = Vector3.new(-0.908, 0.419, 0) -- UP
				POS4.GripForward = Vector3.new(0.419, 0.908, -0) -- FORWARD

				POS5.GripPos = Vector3.new(3.527, 1.972, 0) -- MAIN POS
				POS5.GripRight = Vector3.new(0, -0, 1) -- RIGHT
				POS5.GripUp = Vector3.new(-0.008, -1, 0) -- UP
				POS5.GripForward = Vector3.new(-1, 0.008, 0) -- FORWARD

				POS6.GripPos = Vector3.new(-0.179, 6.226, 0) -- MAIN POS
				POS6.GripRight = Vector3.new(-0, 0, 1) -- RIGHT
				POS6.GripUp = Vector3.new(-0.995, -0.1, -0) -- UP
				POS6.GripForward = Vector3.new(-0.1, 0.995, -0) -- FORWARD

				POS7.GripPos = Vector3.new(5.899, 2.021, 0) -- MAIN POS
				POS7.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS7.GripUp = Vector3.new(0, -1, 0) -- UP
				POS7.GripForward = Vector3.new(-1, 0, 0) -- FORWARD

				POS8.GripPos = Vector3.new(4.954, -1.25, 0) -- MAIN POS
				POS8.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS8.GripUp = Vector3.new(0, 1, 0) -- UP
				POS8.GripForward = Vector3.new(1, 0, 0) -- FORWARD

				POS9.GripPos = Vector3.new(-0.246, -1.25, 0) -- MAIN POS
				POS9.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS9.GripUp = Vector3.new(0, 1, 0) -- UP
				POS9.GripForward = Vector3.new(1, 0, 0) -- FORWARD

				POS10.GripPos = Vector3.new(-13.816, -1.649, 0) -- MAIN POS
				POS10.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS10.GripUp = Vector3.new(0, 1, 0) -- UP
				POS10.GripForward = Vector3.new(1, 0, 0) -- FORWARD

				POS11.GripPos = Vector3.new(2.664, -1.25, 0) -- MAIN POS
				POS11.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS11.GripUp = Vector3.new(0, 1, 0) -- UP
				POS11.GripForward = Vector3.new(1, 0, 0) -- FORWARD

				POS12.GripPos = Vector3.new(3.696, -4.204, -0) -- MAIN POS
				POS12.GripRight = Vector3.new(0, -0, 1) -- RIGHT
				POS12.GripUp = Vector3.new(0.685, 0.728, -0) -- UP
				POS12.GripForward = Vector3.new(0.728, -0.685, -0) -- FORWARD

				POS13.GripPos = Vector3.new(7.473, 3.85, -0) -- MAIN POS
				POS13.GripRight = Vector3.new(-0, -0, 1) -- RIGHT
				POS13.GripUp = Vector3.new(0.265, -0.964, 0) -- UP
				POS13.GripForward = Vector3.new(-0.964, -0.265, -0) -- FORWARD

				POS14.GripPos = Vector3.new(0.422, -0.982, 0) -- MAIN POS
				POS14.GripRight = Vector3.new(-0, 0, 1) -- RIGHT
				POS14.GripUp = Vector3.new(0.972, 0.234, 0) -- UP
				POS14.GripForward = Vector3.new(0.234, -0.972, 0) -- FORWARD

				POS15.GripPos = Vector3.new(-0.599, -2.667, 0) -- MAIN POS
				POS15.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS15.GripUp = Vector3.new(-0.979, 0.205, 0) -- UP
				POS15.GripForward = Vector3.new(0.205, 0.979, -0) -- FORWARD

				POS16.GripPos = Vector3.new(-11.727, -1.663, 0) -- MAIN POS
				POS16.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS16.GripUp = Vector3.new(0, 1, 0) -- UP
				POS16.GripForward = Vector3.new(1, 0, 0) -- FORWARD

				POS17.GripPos = Vector3.new(-6.742, -1.338, 0) -- MAIN POS
				POS17.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS17.GripUp = Vector3.new(0.044, 0.999, 0) -- UP
				POS17.GripForward = Vector3.new(0.999, -0.044, 0) -- FORWARD

				POS18.GripPos = Vector3.new(0.146, 1.615, 0) -- MAIN POS
				POS18.GripRight = Vector3.new(-0, 0, 1) -- RIGHT
				POS18.GripUp = Vector3.new(-0.401, -0.916, -0) -- UP
				POS18.GripForward = Vector3.new(-0.916, 0.401, -0) -- FORWARD

				POS19.GripPos = Vector3.new(-9.3, -1.675, 0) -- MAIN POS
				POS19.GripRight = Vector3.new(0, 0, 1) -- RIGHT
				POS19.GripUp = Vector3.new(0, 1, 0) -- UP
				POS19.GripForward = Vector3.new(1, 0, 0) -- FORWARD

				    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            v.Parent = game.Players.LocalPlayer.Character
            end
        end
				end)

AddCommand("antitool2",function()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local AntiTool = function(Character)
    Character.ChildAdded:Connect(function(x)
        if x:IsA("Tool") then
            coroutine.wrap(function()
                local Handle = x:FindFirstChild("Handle")
                local Touch
                if Handle then
                    Handle.Name = "Part"
                    Handle.CanTouch = false
                end
            end)()
            x.AncestryChanged:Connect(function(Tool, Parent)
                if Parent == Player.Character then
                    Tool:Destroy()
                    coroutine.wrap(function()
                        wait()
                        Tool.Parent = nil
                    end)()
                end
            end)
        end
    end)
end

local AntiKill = function()
    if Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") and Player.Character:FindFirstChildWhichIsA("Humanoid").RootPart and workspace.CurrentCamera then
        local Humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
        local RootPart = Humanoid.RootPart
        if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter and not RootPart:FindFirstChildWhichIsA("BodyMover") then
            local X, Y, Z = workspace.CurrentCamera.CFrame:ToEulerAnglesYXZ()
	        RootPart.CFrame = CFrame.new(RootPart.Position) * CFrame.Angles(0, Y, 0)
        end
        Humanoid.Sit = true
        Humanoid:SetStateEnabled("Seated", false)
    end
end

local AntiVoid = function(Character)
    Character.ChildAdded:Connect(function(Tool)
        if Character and Character:FindFirstChildWhichIsA("Humanoid") and Character:FindFirstChildWhichIsA("Humanoid").RootPart and Tool:IsA("Tool") then
            workspace["FallenPartsDestroyHeight"] = 0/0
            local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
            local RootPart = Humanoid.RootPart
            local CurrentPosition = RootPart.CFrame
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
            repeat RunService.Heartbeat:wait() until Tool.Parent == Character
            RootPart.CFrame = CurrentPosition
            RootPart.Velocity = Vector3.new()
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
        end
    end)
end

for _,x in next, Players:GetPlayers() do
    if x ~= Player and x.Character then
        AntiTool(x.Character)
        x.CharacterAdded:Connect(AntiTool)
    end
end
Players.PlayerAdded:Connect(function(P)
    if P ~= Player then
        P.CharacterAdded:Connect(AntiTool)
    end
end)

RunService.RenderStepped:Connect(AntiKill)

AntiVoid(Player.Character)
Player.CharacterAdded:Connect(AntiVoid)
end)

AddCommand("anchor",function()

for i, v in next, game.Players.LocalPlayer.Character:GetDescendants() do
    if v:IsA "Part" and v.Name == "HumanoidRootPart" then
        v["Anchored"] = true
    end
end
end)

AddCommand("unanchor",function()

for i, v in next, game.Players.LocalPlayer.Character:GetDescendants() do
    if v:IsA "Part" and v.Name == "HumanoidRootPart" then
        v["Anchored"] = false
    end
end
end)

AddCommand("fling",function()

local Targets = {args[2]}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local OldFPDH = workspace.FallenPartsDestroyHeight

local function GetPlayer(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local function SkidFling(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid.RootPart
    local OldPos
    
    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle
    
    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end
    
    if Character and Humanoid and RootPart then
        OldPos = RootPart.CFrame
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        else
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        local function FPos(BasePart,Pos,Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            RootPart.Velocity = Vector3.new(9e8,9e8,9e8)
            RootPart.RotVelocity = Vector3.new(9e8,9e8,9e8)
        end
        local function SFBasePart(BasePart)
            local TimeToWait = 3.5
            local Time = tick()
            local Angle = 0
            
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 30 then
                        Angle = Angle + 50
                        
                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(2.25,1.5,-2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(-2.25,-1.5,2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(0,-1.5,0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                    else
                        FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,-THumanoid.WalkSpeed),CFrame.Angles(0,0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(-90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
                        game:GetService("RunService").Heartbeat:wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 1000 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        workspace.FallenPartsDestroyHeight = 0/0
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e9,9e9,9e9)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
        end
        BV:Destroy()
        for _,x in next, Character:GetDescendants() do
            if x:IsA("BasePart") then
                x.Velocity,x.RotVelocity = Vector3.new(),Vector3.new()
            end
        end
        Humanoid:ChangeState("GettingUp")
        RootPart.CFrame = OldPos * CFrame.new(0,.5,0)
        workspace.CurrentCamera.CameraSubject = Humanoid
        workspace.FallenPartsDestroyHeight = OldFPDH
    else
        return Message("Error Occurred","Random error",5)
    end
end

getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 3207813237 and GetPlayer(x).UserId ~= 106305835 and GetPlayer(x).UserId ~= 207865772 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("Error Occurred","This user is whitelisted! (Owner)",5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("Error Occurred","Username Invalid",5)
    end
end
end)

AddCommand("crash",function()

print('8*8')
end)





