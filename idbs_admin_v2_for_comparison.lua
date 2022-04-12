---@diagnostic disable: undefined-global, lowercase-global, undefined-field

repeat wait(1 / 60) until game:IsLoaded()
if not isfile("DWPrefix.lua") then
	writefile("DWPrefix.lua", "/")
end
if game.PlaceId == 417267366 then
	coroutine.wrap(function()
		wait(.5)
		game.Players.LocalPlayer.PlayerGui.ScreenGui:Destroy()
	end)()
end
local success, response = pcall(function()
local Admin = {
	Prefix = readfile("DWPrefix.lua"),
	Name = "idb's admin",
	Version = "v2"
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
	watermark.Text = Admin.Name.." "..Admin.Version .. " | "..game.Players.LocalPlayer.DisplayName.. " | "..monthTable[date_table.month].." "..date_table.day..", "..date_table.year
	watermark.TextColor3 = Color3.fromRGB(255,255,255)
	watermark.TextSize = 15.000
	watermark.TextXAlignment = Enum.TextXAlignment.Center
	watermark.TextWrapped = true
    watermark.TextStrokeTransparency = 0
    watermark.TextStrokeColor3 = Color3.fromRGB(0,0,0)
end
-- createWatermark()


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
        notifText.Text = "[Error]: "..Text
        notifText.TextColor3 = Color3.fromRGB(255, 50, 50)
    else
        notifText.Text = "[Notification]: "..Text
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
Notify("Loaded! Version: "..Admin.Version)
--//////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////
--Command bar
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

--Find player function
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
--scd begins here
local mt = getrawmetatable(game)
local LocalPlayer = game.Players.LocalPlayer
local Character = game.Players.LocalPlayer.Character
local Workspace = game:GetService("Workspace")


local hum = game.Players.LocalPlayer.Character
local p = game:GetService("Players").LocalPlayer


--// functions


-- FLY SCRIPT BY RGEENEUS

-- The following code should be in a local script.
-- Only works on PC, not xbox or mobile. I do not have devices to test on.
-- Call the start fly function AFTER the character exists to fly. The function does not run if there is no character.

local speed = 50 -- This is the fly speed. Change it to whatever you like. The variable can be changed while running

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

local yesfly = function () -- Call this function to begin flying
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

local nofly = function () -- Call this function to stop flying
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

game:GetService("RunService").Heartbeat:connect(function (step) -- The actual fly function, called every frame
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
local Keybind = "f"

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
			
			wait()
			local success, err = pcall(function()
				coroutine.wrap(function()
					func()
				end)()
			end)
			if success then
				if args[2] then
					Notify("Executed command: "..CmdName.." "..args[2])
				else
					Notify("Executed command: "..CmdName)
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

				wait()
				local success, err = pcall(function()
					coroutine.wrap(function()
						func()
					end)()
				end)
				if success then
					if args[2] then
						Notify("Executed command: "..CmdName.." "..args[2])
					else
						Notify("Executed command: "..CmdName)
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
AddCommand("lagnl", function()
	laggingnl = true
	for _, Target in pairs(GetPlayer(args[2])) do
		for i,v in next, Target.Character:GetDescendants() do
			if v:IsA'BasePart' then
				while laggingnl == true do
					sethiddenproperty(v, "NetworkIsSleeping", true)
					game:GetService('RunService').RenderStepped:Wait()
				end
			end
		end
	end
end)

AddCommand("unlagnl", function()
	laggingnl = false
end)

AddCommand("ddos",function(Time)
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass'Tool'
		tool.Parent = LocalPlayer.Character
		wait(1)
		coroutine.wrap(function()
			for i= 1,500,1 do
				tool.Remote:FireServer('PlaySong', 4593727499)
				DeltaWait()
			end
		end)()
		coroutine.wrap(function()
			for i= 1,500,1 do
				tool.Remote:FireServer('PlaySong', 4593727499)
				DeltaWait()
			end
		end)()
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


AddCommand("tkill", function()
	for _, Target in pairs(GetPlayer(args[2])) do
		if LocalPlayer.Character.PrimaryPart ~= nil then
			local Character = LocalPlayer.Character
			local previous = LocalPlayer.Character.PrimaryPart.CFrame
			Character.Archivable = true
			local Clone = Character:Clone()
			LocalPlayer.Character = Clone
			wait(3)
			LocalPlayer.Character = Character
			wait(0.35)
			if LocalPlayer.Character and Target.Character and Target.Character.PrimaryPart ~= nil then
				if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
					LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):Destroy()
				end
				local Humanoid = Instance.new("Humanoid")
				Humanoid.Parent = LocalPlayer.Character
				local Tool = nil
				if LocalPlayer.Character:FindFirstChildOfClass("Tool") then
					Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
				elseif LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
					Tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
				end
				if Tool ~= nil then
					Tool.Parent = LocalPlayer.Backpack
					local Arm = game.Players.LocalPlayer.Character['Right Arm'].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
					Tool.Grip = Arm:ToObjectSpace(Target.Character.PrimaryPart.CFrame):Inverse()

					Tool.Parent = LocalPlayer.Character
					Workspace.CurrentCamera.CameraSubject = Tool.Handle
					repeat
						wait()
					until not Tool or Tool and (Tool.Parent == Workspace or Tool.Parent == Target.Character)
					Humanoid.Health = 0
					LocalPlayer.Character = nil
				end
			end
			LocalPlayer.CharacterAdded:Wait()
			repeat
				wait()
			until LocalPlayer.Character.PrimaryPart ~= nil

			LocalPlayer.Character:SetPrimaryPartCFrame(previous)
		end
	end
end)
CFrameTool = function(tool, pos)
    local RightArm = LocalPlayer.Character:FindFirstChild("RightLowerArm") or LocalPlayer.Character:FindFirstChild("Right Arm");

    local Arm = RightArm.CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0);
    local Frame = Arm:toObjectSpace(pos):Inverse();

    tool.Grip = Frame
end
AddCommand("spectate", function()
	for _, Target in pairs(GetPlayer(args[2])) do
		Workspace.CurrentCamera.CameraSubject = Target.Character
	end
end)

AddCommand("unspectate", function()
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
						saymsg:FireServer((publicItalics and "/me " or '').."{idb's admin} [".. p.Name .."]: "..msg, "All")
					else
						privateProperties.Text = "{idb's admin} [".. p.DisplayName .."]: "..msg
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

	local idk = "nigga ⛆ ⛆ ⛆ ⛆ ⛆ ⛆"
	local player = game.Players.LocalPlayer.Name
	local normalid = args[2]

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

	local encid = urlencode(FixId(normalid))
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v:FindFirstChildOfClass("RemoteEvent") and v.Handle:FindFirstChildOfClass("Sound") then
			v.Parent = game.Players.LocalPlayer.Character
		end
	end
	local hidden = "" .. "CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_".. "&%61%73%73%65%74%76%65%72%73%69%6f%6e%69%64=" .. encid --add here!!
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(string.lower(v.Name), 'boomb') then
			v.Remote:FireServer("PlaySong", hidden);
			v.Handle.Massless = true
		end
	end
	wait(1.5)
	sync();

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
		Notify('User '..tostring(Target.DisplayName)..'[@'..Target.Name..']'..' has: '..toolsInBackpack + toolsEquipped.. ' tool(s). Tools playing: '..toolsPlaying)
	end
end)

AddCommand("accountage",function()
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
	Notify('Number of commands: '..cmdnum)
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
			while wait() do
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
		while wait() do
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
	game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA'Tool' then
				v.Parent = game.Workspace
			end 
		end
	end)
end)

AddCommand("getcf",function()
	setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
end)

AddCommand("annoy",function()
	local annoying = true
	for _, Target in pairs(GetPlayer(args[2])) do
		local SAVE_CF = LocalPlayer.Character.HumanoidRootPart.CFrame
		while annoying == true do
			LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(-2,2),math.random(0,2),math.random(-2,2))
			game:GetService('RunService').RenderStepped:Wait()
			wait(.1)
		end
		LocalPlayer.Character.HumanoidRootPart.CFrame = SAVE_CF
	end
end)

AddCommand("unannoy", function()
	annoying = false
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
		wait()
		game.Workspace.Gravity = 5000000000000000000
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,400,0)
		wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-1000,0)
		game.Players.LocalPlayer.CharacterAdded:Wait()
		repeat wait() until LocalPlayer.Character
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
	wait(4.4)
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
	wait()

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
			wait(.3)
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

AddCommand("ikill",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local LocalPlayer = game.Players.LocalPlayer
		local ogChar = LocalPlayer.Character
		LocalPlayer.Character = Clone
		LocalPlayer.Character = ogChar
		wait(4.7)
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
		repeat wait() until LocalPlayer.Character
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

AddCommand('skill', function()
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

AddCommand("poo",function()
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

AddCommand("unantitool", function()
	antitooling = false
end)
AddCommand("reset",function()
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

AddCommand("script",function()
	wait(.2)
	Chat("["..Admin.Name.."]".." | "..Admin.Version)
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
	wait(.3)
	boombox.Parent = workspace
	LocalPlayer.Character:SetPrimaryPartCFrame(oldpos)
	wait(.5)
	if boombox.Parent == workspace then
		LocalPlayer.Character.Humanoid:EquipTool(boombox)
		wait(.3)
		LocalPlayer.Character.Humanoid:UnequipTools()
	else
		wait(.2)
		local grabber = game.Players:GetPlayerFromCharacter(boombox.Parent) or boombox.Parent.Parent
		LocalPlayer.Character:SetPrimaryPartCFrame(grabber.Character.Head.CFrame + Vector3.new(0,3,0))
		Chat("Player: " .. grabber.DisplayName.." [@"..grabber.Name.."] is grabbing")
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
	writefile("DWPrefix.lua", tostring(args[2]))
	wait()
	Admin.Prefix =  readfile("DWPrefix.lua")
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
		Notify('Logged audio, set to clipboard!')
		setclipboard(finalSoudn)
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
--removes nicknames
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
	GetCharacter = function(Plr)
		return Plr and Plr.Character or LocalPlayer.Character
	end
	---gets a players root if none arguments passed it will return your root
	---@param Plr any
	---@return any
	GetRoot = function(Plr)
		return Plr and GetCharacter(Plr):FindFirstChild("HumanoidRootPart") or GetCharacter():FindFirstChild("HumanoidRootPart");
	end
	---gets a players humanoid if none arguments passed it will return your humanoid
	---@param Plr any
	---@return any
	GetHumanoid = function(Plr)
		return Plr and GetCharacter(Plr):FindFirstChildWhichIsA("Humanoid") or GetCharacter():FindFirstChildWhichIsA("Humanoid");
	end
	
	---comment
	---@param Plr any
	---@return any
	GetMagnitude = function(Plr)
		return Plr and (GetRoot(Plr).Position - GetRoot().Position).magnitude or math.huge
	end
    local Target = GetPlayer(args[2]);
    local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
    local OldPos, OldVelocity = Root.CFrame, Root.Velocity

    for i, v in next, Target do
        local TargetRoot = GetRoot(v)
        local TargetPos = TargetRoot.Position
        local Stepped = game:GetService('RunService').Stepped:Connect(function(step)
            step = step - Workspace.DistributedGameTime
        
            Root.CFrame = (TargetRoot.CFrame - (Vector3.new(0, 1e6, 0) * step)) + (TargetRoot.Velocity * (step * 30))
            Root.Velocity = Vector3.new(0, 1e6, 0)
        end)
        local start = tick();
        repeat
            wait();
        until (TargetPos - TargetRoot.Position).magnitude >= 60 or tick() - start >= 3.5
        Stepped:Disconnect();
    end
    wait();
    local Stepped = game:GetService('RunService').Stepped:Connect(function()
        Root.Velocity = OldVelocity
        Root.CFrame = OldPos
    end)
    wait(2);
    Root.Anchored = true
    Stepped:Disconnect();
    Root.Anchored = false
    Root.Velocity = OldVelocity
    Root.CFrame = OldPos
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
		Notify("User "..Target.DisplayName.." [@"..Target.Name.."]'s mass: "..tostring(Target.Character.HumanoidRootPart:GetMass()))
		if Target.Character.HumanoidRootPart:GetMass() > game.Players.LocalPlayer.Character.HumanoidRootPart:GetMass() then
			Notify("User "..Target.DisplayName.." [@"..Target.Name.."]'s mass is greater than yours.")
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
