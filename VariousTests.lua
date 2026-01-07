game.UIScene:ClearAllChildren()
game.Scene:ClearAllChildren()

local S = game.Sky
S:SetFaceTexture(0, "posx.png")
S:SetFaceTexture(1, "negx.png")
S:SetFaceTexture(2, "posy.png")
S:SetFaceTexture(3, "negy.png")
S:SetFaceTexture(4, "posz.png")
S:SetFaceTexture(5, "negz.png")

function CreateSpotLight(Pos, FOV, Angle)
local Light = Instance("SpotLight")
Light.Position = Pos
Light.Parent = game.Scene
Light.FOV = math.rad(FOV)
Light.Rotation = Angle
end

CreateSpotLight(Vector3(30, 40, 30), 90, vector(math.rad(-90), 0, 0))

local CoolPart = Instance("Part")
CoolPart.Parent = game.Scene
CoolPart.Position = Vector3(10, 5, 10)
CoolPart.Size = Vector3(5, 5, 5)
CoolPart.Shape = "Teapot"

local Part2 = Instance("Part")
Part2.Parent = game.Scene

local Part = Instance("Part")
Part.Parent = game.Scene
Part.Position = Vector3(10, -5, 10)
Part.Size = Vector3(500, 2, 500)

Part2:Destroy()

local Text = Instance("TextObject")
Text.Position = vector(0.2, 0.2, 0.0)
Text.Size = vector(0.2, 0.2, 0.0)
Text.Text = "Hello this is my text ©"
Text.Transparency = 1.0
Text.TextColor = vector(0.5, 0.0, 0.0)
Text.ZIndex = 5
Text.Font = "Default"
Text.CornerSize = 0.01
Text.FontSize = 0.04
Text.SizeConstraint = "XX"
Text.Parent = game.UIScene

RealColor = vector(1, 1, 1)

game.Input.InputDown:connect(function(code,b) print(code,b)end)

local ABC = Text.MouseRightClicked:connect(function()spawn(function()print("Right")end)end)
ABC:disconnect()
Text.MouseLeftClicked:connect(function()
RealColor = vector(math.random(),math.random(),math.random()) 
Text.Color = RealColor * 0.8
spawn(function()print("Left")end)
end)
Text.MouseLeftUp:connect(function()spawn(function()print("LeftUp")end)end)
Text.MouseEntered:connect(function()
Text.Color = RealColor * 0.8
end)
Text.MouseLeft:connect(function()
Text.Color = RealColor
end)
Text.Changed:connect(function(PropertyName) print(PropertyName) end)

local i = 0

while true do
i = i + 1
CoolPart.Position = vector(math.sin(i / 60)* 5, 0, math.cos(i / 60) * 5) + vector(10, 5, 10)
CoolPart.Rotation = CoolPart.Rotation + vector(1/100, 1/ 100, 1/100)
--Light.FOV = math.rad(math.sin(i / 30) * 20 + 50)

sleep(0)
end
