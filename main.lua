local Player = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera

local RunService = game["Run Service"]
local Stepped = RunService.Stepped

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
	if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" and not RunService:IsStudio() then 
		game:GetService("RunService").Heartbeat:connect(function()
			v.Velocity = Vector3.new(-29.45,0,0)
		end)
	end
end

local oCharacter = (Player.Character or Player.CharacterAdded:Wait()); oCharacter.Archivable = true
local nCharacter = oCharacter:Clone(); nCharacter.Parent = workspace; nCharacter.Name = "yikes"
local collisionCr = coroutine.create(function()
	while true do
		Stepped:Wait()
		
		for _,v in pairs(oCharacter:GetDescendants()) do
			if v:isA("BasePart") then
				v.CanCollide = false 
			end
		end
	end
end);

function setRoot()
	local AlignPosition = Instance.new("AlignPosition", oCharacter.Torso)
	local Connect0 = Instance.new("Attachment", oCharacter.Torso)
	local Connect1 = Instance.new("Attachment", nCharacter.Torso); Connect1.CFrame = CFrame.new(0, -20, 0)
	
	AlignPosition.MaxVelocity = math.huge
	AlignPosition.Responsiveness = 200
	AlignPosition.Attachment0 = Connect0
	AlignPosition.Attachment1 = Connect1
end

function ReanimateAccessory(origin, target, pos : Vector3, ori : Vector3)
	local AlignPosition = Instance.new("AlignPosition", origin.Handle)
	local AlignOrientation = Instance.new("AlignOrientation", origin.Handle)

	local Attachment0 = Instance.new("Attachment", origin.Handle)

	local Attachment1 = Instance.new("Attachment", target)
	Attachment1.Position = pos
	Attachment1.Orientation = ori

	AlignPosition.ApplyAtCenterOfMass = false
	AlignPosition.RigidityEnabled = false
	AlignPosition.MaxVelocity = math.huge
	AlignPosition.MaxForce = math.huge
	AlignPosition.Responsiveness = 200
	AlignPosition.Attachment0 = Attachment0
	AlignPosition.Attachment1 = Attachment1

	AlignOrientation.MaxTorque = math.huge
	AlignOrientation.MaxAngularVelocity = math.huge
	AlignOrientation.RigidityEnabled = false
	AlignOrientation.Responsiveness = 200
	AlignOrientation.Attachment0 = Attachment0
	AlignOrientation.Attachment1 = Attachment1

	origin.Handle.AccessoryWeld:Destroy()
end

coroutine.resume(collisionCr)

oCharacter["Left Arm"]:Destroy()
oCharacter["Right Arm"]:Destroy()
oCharacter["Left Leg"]:Destroy()
oCharacter["Right Leg"]:Destroy(); setRoot()

oCharacter["Pal Hair"].Handle.Mesh:Destroy()
oCharacter["Necklace"].Handle.Mesh:Destroy()
oCharacter["Robloxclassicred"].Handle.Mesh:Destroy()
oCharacter["Pink Hair"].Handle.Mesh:Destroy()
oCharacter["Hat1"].Handle.Mesh:Destroy()
oCharacter["Kate Hair"].Handle.Mesh:Destroy()

ReanimateAccessory(oCharacter["Meshes/aa (1)Accessory"], nCharacter["Head"], Vector3.new(), Vector3.new(0, 90, 0))
ReanimateAccessory(oCharacter["Pal Hair"], nCharacter["Torso"], Vector3.new(0, -.5, 0), Vector3.new(0, 90, 0))
ReanimateAccessory(oCharacter["Necklace"], nCharacter["Torso"], Vector3.new(0, .5, 0), Vector3.new(0, 90, 0))
ReanimateAccessory(oCharacter["Robloxclassicred"], nCharacter["Right Arm"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
ReanimateAccessory(oCharacter["Pink Hair"], nCharacter["Left Arm"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
ReanimateAccessory(oCharacter["Hat1"], nCharacter["Right Leg"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
ReanimateAccessory(oCharacter["Kate Hair"], nCharacter["Left Leg"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))

for _,v in pairs(oCharacter:GetChildren()) do
	if v:isA("Accessory") and v.Handle:FindFirstChild("AccessoryWeld") then
		ReanimateAccessory(v, nCharacter:FindFirstChild(v.Name).Handle, Vector3.new(), Vector3.new())
	end
end

Player.Character = nCharacter
Camera.CameraSubject = nCharacter.Humanoid;

delay(5.65, function() oCharacter.Humanoid.Health = 0; wait() Camera.CameraSubject = nCharacter.Humanoid end)

for _,v in pairs(nCharacter:GetDescendants()) do
	if v:isA("BasePart") then
		v.Transparency = 1
	end
end; nCharacter.Head.face:Destroy()

if _G["DefaultAnimations"] then
	local rootPart: BasePart = nCharacter:FindFirstChild("HumanoidRootPart")
	local mainHumanoid = nCharacter:FindFirstChildOfClass("Humanoid")

	local playingAnim = ""
	local currentTrack: AnimationTrack
	local walkAnimation = Instance.new("Animation"); walkAnimation.AnimationId = "rbxassetid://180426354"
	local idleAnimation = Instance.new("Animation"); idleAnimation.AnimationId = "rbxassetid://180435571"

	coroutine.wrap(function()
		while true do
			game["Run Service"].RenderStepped:Wait()

			if rootPart.Velocity.Magnitude >= 1 and playingAnim ~= "walk" then
				print("Walking")
				playingAnim = "walk"; if currentTrack then currentTrack:Stop() end;
				currentTrack = mainHumanoid:LoadAnimation(walkAnimation); currentTrack:Play()
			elseif rootPart.Velocity.Magnitude < 1 and playingAnim ~= "idle" then
				print("Not moving")
				playingAnim = "idle"; if currentTrack then currentTrack:Stop() end;
				currentTrack = mainHumanoid:LoadAnimation(idleAnimation); currentTrack:Play()
			end
		end
	end)()
end

return nCharacter
