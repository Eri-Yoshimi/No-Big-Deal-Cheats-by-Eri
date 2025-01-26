-- Cheat made by Eri --------------------------------------------------------------------------------------------

-- Global Variables ---------------------------------------------------------------------------------------------
local plr = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("StarterGui")
-----------------------------------------------------------------------------------------------------------------

-- Setup --------------------------------------------------------------------------------------------------------
local GUI = Instance.new("ScreenGui")
local FreeMouse = Instance.new("TextButton")
local Main = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UIGridLayout = Instance.new("UIGridLayout")
local UIPadding = Instance.new("UIPadding")
local UICorner = Instance.new("UICorner")

GUI.Name = "NoBigDeal"
GUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.DisplayOrder = 5
GUI.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = GUI
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 400, 0, 300)
Main.Visible = false

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(162, 162, 162))}
UIGradient.Rotation = 90
UIGradient.Parent = Main

UIGridLayout.Parent = Main
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 70, 0, 70)

UIPadding.Parent = Main
UIPadding.PaddingBottom = UDim.new(0, 10)
UIPadding.PaddingLeft = UDim.new(0, 10)
UIPadding.PaddingRight = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 10)

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Main

FreeMouse.Name = "FreeMouse"
FreeMouse.Parent = GUI
FreeMouse.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FreeMouse.BackgroundTransparency = 1.000
FreeMouse.BorderColor3 = Color3.fromRGB(0, 0, 0)
FreeMouse.BorderSizePixel = 0
FreeMouse.Selectable = false
FreeMouse.Size = UDim2.new(1, 0, 1, 0)
FreeMouse.Visible = false
FreeMouse.Modal = true
FreeMouse.Font = Enum.Font.SourceSans
FreeMouse.Text = ""
FreeMouse.TextColor3 = Color3.fromRGB(0, 0, 0)
FreeMouse.TextSize = 14.000
FreeMouse.TextTransparency = 1.000

local function createButton(name)
	local newButton = Instance.new("TextButton", Main)
	newButton.Name = name
	newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	newButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	newButton.BorderSizePixel = 0
	newButton.Size = UDim2.new(0, 200, 0, 50)
	newButton.Font = Enum.Font.SourceSans
	newButton.Text = name
	newButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	newButton.TextSize = 14
	newButton.TextScaled = true
	newButton.Modal = true

	local newUICorner = Instance.new("UICorner", newButton)
	newUICorner.CornerRadius = UDim.new(0, 10)

	local newUIPadding = Instance.new("UIPadding", newButton)
	newUIPadding.PaddingTop = UDim.new(0, 5)
	newUIPadding.PaddingBottom = UDim.new(0, 5)
	newUIPadding.PaddingLeft = UDim.new(0, 5)
	newUIPadding.PaddingRight = UDim.new(0, 5)

	return newButton
end
-----------------------------------------------------------------------------------------------------------------

-- Toggle Handler -----------------------------------------------------------------------------------------------
local uis = game:GetService("UserInputService")

uis.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.P then
		Main.Visible = not Main.Visible
		FreeMouse.Visible = FreeMouse.Visible
	elseif key.KeyCode == Enum.KeyCode.U then
		GUI:Destroy()
	end
end)
-----------------------------------------------------------------------------------------------------------------

-- ESP Handler --------------------------------------------------------------------------------------------------
local ESPCache = {}

local function CreateESP(basepart, color)
	local newEspGui = Instance.new("BillboardGui", basepart)
	newEspGui.AlwaysOnTop = true
	local espSize = basepart.Size.X > basepart.Size.Z and basepart.Size.X or basepart.Size.Z
	newEspGui.Size = UDim2.new(espSize, 2, espSize, 2)
	local espFrame = Instance.new("Frame", newEspGui)
	espFrame.Size = UDim2.new(1, 0, 1, 0)
	espFrame.BackgroundTransparency = 1
	local newStroke = Instance.new("UIStroke", espFrame)
	if color then
		newStroke.Color = color
	else
		newStroke.Color = basepart.Color
	end
	newStroke.Thickness = 1
	table.insert(ESPCache, newEspGui)
end

local CashESP = createButton("Cash ESP")
CashESP.Activated:Connect(function()
	for i, d in workspace:GetDescendants() do
		if string.lower(d.Name) == "cash" and d:IsA("Model") then
			local part = d:FindFirstChild("Root")
			if part:IsA("BasePart") then
				CreateESP(part, Color3.new(0, 1, 0))
			end
		end
	end
end)

local FakeCashESP = createButton("Fake Cash ESP")
FakeCashESP.Activated:Connect(function()
	for i, d in workspace:GetDescendants() do
		if string.lower(d.Name) == "fakecash" and d:IsA("Model") then
			local part = d:FindFirstChild("Root")
			if part:IsA("BasePart") then
				CreateESP(part, Color3.new(1, 0.666667, 0))
			end
		end
	end
end)

local DiskESP = createButton("Disk ESP")
DiskESP.Activated:Connect(function()
	for i, d in workspace:GetDescendants() do
		if string.lower(d.Name) == "disk" and d:IsA("Model") then
			local part = d:FindFirstChild("Color")
			if part:IsA("BasePart") then
				CreateESP(part, Color3.new(0, 0, 0))
			end
		end
	end
end)

local GrenadeESP = createButton("Grenade ESP")
GrenadeESP.Activated:Connect(function()
	for i, d in workspace:GetDescendants() do
		if string.lower(d.Name) == "grenade" and d:IsA("Model") then
			local part = d:FindFirstChild("Root")
			if part:IsA("BasePart") then
				CreateESP(part, Color3.new(1, 0, 0))
			end
		end
	end
end)

local SeltzerESP = createButton("Seltzer Bottle ESP")
SeltzerESP.Activated:Connect(function()
	for i, d in workspace:GetDescendants() do
		if string.lower(d.Name) == "bottle" and d:IsA("Model") then
			local part = d:FindFirstChild("Fluid")
			if part:IsA("BasePart") then
				CreateESP(part, Color3.new(0.666667, 0, 0.498039))
			end
		end
	end
end)

local PlayerESP = createButton("Player ESP")
PlayerESP.Activated:Connect(function()
	for i, p in game.Players:GetPlayers() do
		local playerChar = workspace:FindFirstChild(p.Name)
		if playerChar then
			if playerChar:FindFirstChild("Head") then
				CreateESP(playerChar:FindFirstChild("Head"), Color3.new(1, 1, 1))				
			end
			if playerChar:FindFirstChild("Torso") then
				CreateESP(playerChar:FindFirstChild("Torso"), Color3.new(1, 1, 1))
			end
		end
	end
end)

local function lookAtBoard(board)
	local connection
	local goin = true

	task.delay(5, function()
		goin = false
		if connection then
			connection:Disconnect()
		end
	end)

	connection = RunService.RenderStepped:Connect(function()
		if goin then
			camera.CFrame = CFrame.new(board.CFrame.Position + board.CFrame.LookVector * 10, board.CFrame.Position)
		end
	end)
end

local LookAtMissionBoard1 = createButton("Look At Alamont's Board")
LookAtMissionBoard1.Activated:Connect(function()
	local board = workspace:WaitForChild("CurrentMap"):WaitForChild("Round"):WaitForChild("Core"):WaitForChild("Bases"):WaitForChild("1"):WaitForChild("MissionBoard")
	lookAtBoard(board)
end)

local LookAtMissionBoard2 = createButton("Look At Halfwell's Board")
LookAtMissionBoard2.Activated:Connect(function()
	local board = workspace:WaitForChild("CurrentMap"):WaitForChild("Round"):WaitForChild("Core"):WaitForChild("Bases"):WaitForChild("2"):WaitForChild("MissionBoard")
	lookAtBoard(board)
end)

local LookAtMissionBoard3 = createButton("Look At Bergmann's Board")
LookAtMissionBoard3.Activated:Connect(function()
	local board = workspace:WaitForChild("CurrentMap"):WaitForChild("Round"):WaitForChild("Core"):WaitForChild("Bases"):WaitForChild("3"):WaitForChild("MissionBoard")
	lookAtBoard(board)
end)

local MonitorChat = createButton("Chat Monitor")
local chatMonitor = false
local chatEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ToClient"):WaitForChild("Chat")
if chatEvent then
    chatEvent.OnClientEvent:Connect(function(plr, part, message)
        if chatMonitor then
            print(plr.Name .. " sent: ".. message)
            CoreGui:SetCore("SendNotification", {
                Title = plr.Name;
                Text = message;
                Duration = 3;
            })
        end
    end)
end
MonitorChat.Activated:Connect(function()
    chatMonitor = not chatMonitor
end)
-----------------------------------------------------------------------------------------------------------------

-- Credit Notification ------------------------------------------------------------------------------------------
CoreGui:SetCore("SendNotification", {
	Title = "No Big Deal Cheat Injected";
	Text = "Made by Eri";
	Duration = 5;
})
-----------------------------------------------------------------------------------------------------------------
