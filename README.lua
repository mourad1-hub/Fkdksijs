local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local setclipboard = setclipboard or toclipboard

-- 🔔 إشعار تحميل السكربت
pcall(function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "انتصر";
		Text = "جاري التحميل...";
		Duration = 5;
	})
	wait(0.1)
	game.StarterGui:SetCore("SendNotification", {
		Title = "تم التشغيل";
		Text = "MRT_V2";
		Image = "rbxassetid://136300057076089";
		Duration = 5;
	})
end)

-- 🖼️ GUI الرئيسي
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MourdClientGUI"
gui.ResetOnSpawn = false

-- 🟣 زر فتح/غلق
local circleButton = Instance.new("TextButton", gui)
circleButton.Size = UDim2.new(0, 50, 0, 50)
circleButton.Position = UDim2.new(1, -70, 0, 25)
circleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
circleButton.BorderSizePixel = 0
circleButton.Text = "M"
circleButton.TextColor3 = Color3.fromRGB(170, 0, 255)
circleButton.Font = Enum.Font.GothamBlack
circleButton.TextSize = 22
circleButton.AutoButtonColor = false
circleButton.Name = "ToggleGlowButton"
circleButton.Active = true
circleButton.Draggable = true

Instance.new("UICorner", circleButton).CornerRadius = UDim.new(1, 0)
local glow = Instance.new("UIStroke", circleButton)
glow.Color = Color3.fromRGB(170, 0, 255)
glow.Thickness = 5
glow.Transparency = 0.2
glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local lightEffect = Instance.new("UIGradient", circleButton)
lightEffect.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 0, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 0, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 255))
}
lightEffect.Rotation = 45

-- 🖼️ الواجهة الرئيسية
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 580, 0, 300)
mainFrame.Position = UDim2.new(0.5, -290, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Name = "MainFrame"

local glowMain = Instance.new("UIStroke", mainFrame)
glowMain.Color = Color3.fromRGB(170, 0, 255)
glowMain.Thickness = 3
glowMain.Transparency = 0.3
glowMain.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "💜 MRT_V2 - BROOKHAVEN"
title.TextColor3 = Color3.fromRGB(170, 0, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 20
title.TextStrokeTransparency = 0.2
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- ❌ زر الإغلاق
local closeX = Instance.new("TextButton", mainFrame)
closeX.Size = UDim2.new(0, 30, 0, 30)
closeX.Position = UDim2.new(1, -35, 0, 5)
closeX.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
closeX.Text = "X"
closeX.TextColor3 = Color3.fromRGB(255, 255, 255)
closeX.Font = Enum.Font.GothamBold
closeX.TextSize = 18
Instance.new("UICorner", closeX).CornerRadius = UDim.new(0, 6)

-- ✅ نافذة تأكيد الإغلاق
local confirmFrame = Instance.new("Frame", gui)
confirmFrame.Size = UDim2.new(0, 300, 0, 150)
confirmFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
confirmFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
confirmFrame.BorderSizePixel = 0
confirmFrame.Visible = false
Instance.new("UICorner", confirmFrame).CornerRadius = UDim.new(0, 12)

local confirmStroke = Instance.new("UIStroke", confirmFrame)
confirmStroke.Color = Color3.fromRGB(170, 0, 255)
confirmStroke.Thickness = 2

local confirmTitle = Instance.new("TextLabel", confirmFrame)
confirmTitle.Size = UDim2.new(1, 0, 0, 40)
confirmTitle.Position = UDim2.new(0, 0, 0, 10)
confirmTitle.BackgroundTransparency = 1
confirmTitle.Text = "هل تريد قفل السكربت نهائيًا؟"
confirmTitle.TextColor3 = Color3.fromRGB(170, 0, 255)
confirmTitle.Font = Enum.Font.GothamBold
confirmTitle.TextSize = 18

local killButton = Instance.new("TextButton", confirmFrame)
killButton.Size = UDim2.new(0.5, -10, 0, 40)
killButton.Position = UDim2.new(0, 10, 1, -50)
killButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
killButton.Text = "قفل السكربت"
killButton.TextColor3 = Color3.fromRGB(255, 255, 255)
killButton.Font = Enum.Font.GothamBold
killButton.TextSize = 16
Instance.new("UICorner", killButton).CornerRadius = UDim.new(0, 8)

local cancelButton = Instance.new("TextButton", confirmFrame)
cancelButton.Size = UDim2.new(0.5, -10, 0, 40)
cancelButton.Position = UDim2.new(0.5, 0, 1, -50)
cancelButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
cancelButton.Text = "إلغاء"
cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cancelButton.Font = Enum.Font.GothamBold
cancelButton.TextSize = 16
Instance.new("UICorner", cancelButton).CornerRadius = UDim.new(0, 8)

-- 🟪 التبويبات
local tabsFrame = Instance.new("Frame", mainFrame)
tabsFrame.Size = UDim2.new(0, 140, 1, -40)
tabsFrame.Position = UDim2.new(0, 0, 0, 40)
tabsFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
tabsFrame.BorderSizePixel = 0
local strokeTabs = Instance.new("UIStroke", tabsFrame)
strokeTabs.Color = Color3.fromRGB(170, 0, 255)
strokeTabs.Thickness = 1.5
strokeTabs.Transparency = 0.3

local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(1, -160, 1, -60)
contentFrame.Position = UDim2.new(0, 150, 0, 50)
contentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
contentFrame.BorderSizePixel = 0
local strokeContent = Instance.new("UIStroke", contentFrame)
strokeContent.Color = Color3.fromRGB(170, 0, 255)
strokeContent.Thickness = 1.2
strokeContent.Transparency = 0.25

-- 📑 تبويبة "معلومات"
local infoTab = Instance.new("TextButton", tabsFrame)
infoTab.Size = UDim2.new(1, -10, 0, 30)
infoTab.Position = UDim2.new(0, 5, 0, 5)
infoTab.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
infoTab.Text = "معلومات"
infoTab.TextColor3 = Color3.fromRGB(255, 255, 255)
infoTab.Font = Enum.Font.GothamSemibold
infoTab.TextSize = 14
Instance.new("UICorner", infoTab).CornerRadius = UDim.new(0, 6)
local glowBorder = Instance.new("UIStroke", infoTab)
glowBorder.Color = Color3.fromRGB(170, 0, 255)
glowBorder.Thickness = 2.5
glowBorder.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
glowBorder.Transparency = 0

local infoContent = Instance.new("Frame", contentFrame)
infoContent.Size = UDim2.new(1, -20, 1, -20)
infoContent.Position = UDim2.new(0, 10, 0, 10)
infoContent.BackgroundTransparency = 1
infoContent.Visible = true

-- 🔮 شعار M أكبر قليلاً مع إطار بنفسجي مربع
local logoMFrame = Instance.new("Frame", infoContent)
logoMFrame.Size = UDim2.new(0, 80, 0, 80)
logoMFrame.Position = UDim2.new(0, 0, 0, 0)
logoMFrame.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
logoMFrame.BorderSizePixel = 0
Instance.new("UICorner", logoMFrame).CornerRadius = UDim.new(0, 10)

local logoM = Instance.new("TextLabel", logoMFrame)
logoM.Size = UDim2.new(1, 0, 1, 0)
logoM.Position = UDim2.new(0, 0, 0, 0)
logoM.BackgroundTransparency = 1
logoM.Text = "M"
logoM.TextColor3 = Color3.fromRGB(170, 0, 255)
logoM.Font = Enum.Font.GothamBlack
logoM.TextSize = 65
logoM.TextStrokeTransparency = 0.3

-- 🟣 مستطيل بنفسجي كحدود لخلفية زر النسخ مع تقليل الارتفاع
local copyButtonFrame = Instance.new("Frame", infoContent)
copyButtonFrame.Size = UDim2.new(1, 0, 0, 35)
copyButtonFrame.Position = UDim2.new(0, 0, 0, 85)
copyButtonFrame.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
copyButtonFrame.BorderSizePixel = 0
Instance.new("UICorner", copyButtonFrame).CornerRadius = UDim.new(0, 10)

-- زر نسخ داخل الإطار البنفسجي
local copyButton = Instance.new("TextButton", copyButtonFrame)
copyButton.Size = UDim2.new(1, -10, 1, -10)
copyButton.Position = UDim2.new(0, 5, 0, 5)
copyButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
copyButton.Text = "نسخ حسابي في ROBLOX"
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.Font = Enum.Font.GothamBold
copyButton.TextSize = 18
Instance.new("UICorner", copyButton).CornerRadius = UDim.new(0, 8)

copyButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("MOURD1123")
	elseif toclipboard then
		toclipboard("MOURD1123")
	else
		warn("خاصية النسخ غير مدعومة في هذا النظام")
	end
end)

infoTab.MouseButton1Click:Connect(function()
	for _, v in pairs(contentFrame:GetChildren()) do
		if v:IsA("GuiObject") then
			v.Visible = false
		end
	end
	infoContent.Visible = true
end)

-- ##################
-- تبويبة السكربتات

local scriptsContent = Instance.new("Frame", contentFrame)
scriptsContent.Size = UDim2.new(1, -20, 1, -20)
scriptsContent.Position = UDim2.new(0, 10, 0, 10)
scriptsContent.BackgroundTransparency = 1
scriptsContent.Visible = false

local function createScriptButton(parent, posY, text, url)
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 35)
	frame.Position = UDim2.new(0, 0, 0, posY)
	frame.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
	frame.BorderSizePixel = 0
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

	local button = Instance.new("TextButton", frame)
	button.Size = UDim2.new(1, -10, 1, -10)
	button.Position = UDim2.new(0, 5, 0, 5)
	button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	button.Text = text
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.GothamBold
	button.TextSize = 18
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

	button.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet(url))()
		end)
		if not success then
			warn("فشل تحميل السكربت: ".. tostring(err))
		end
	end)
end

local baseY = 0
local gap = 40

createScriptButton(scriptsContent, baseY + gap*0, "gumball hub", "https://rawscripts.net/raw/Brookhaven-RP-GumBall-Hub-V2-40312")
createScriptButton(scriptsContent, baseY + gap*1, "ChaosHub", "https://raw.githubusercontent.com/Venom-devX/ChaosHub/main/loader.lua")
createScriptButton(scriptsContent, baseY + gap*2, "ARCHON HUB", "https://rawscripts.net/raw/Brookhaven-RP-ARCHON-HUB-31730")
createScriptButton(scriptsContent, baseY + gap*3, "SP HUB", "https://rawscripts.net/raw/Brookhaven-RP-New-script-SP-Hub-28739")
createScriptButton(scriptsContent, baseY + gap*4, "Real hub", "https://raw.githubusercontent.com/Laelmano24/Rael-Hub/main/main.txt")
createScriptButton(scriptsContent, baseY + gap*5, "shadow hub new", "https://rawscripts.net/raw/Brookhaven-RP-Drip-Client-43162")
createScriptButton(scriptsContent, baseY + gap*6, "sander XY", "https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845")
createScriptButton(scriptsContent, baseY + gap*7, "anti lag", "https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua")
createScriptButton(scriptsContent, baseY + gap*8, "vr7", "https://raw.githubusercontent.com/VR7ss/OMK/refs/heads/main/VR7-ON-TOP")
createScriptButton(scriptsContent, baseY + gap*9, "الهلال", "https://raw.githubusercontent.com/Ndora1/Ndora1/main/Nokia%20Hub.lua")
createScriptButton(scriptsContent, baseY + gap*10, "fling sofa", "https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt")
createScriptButton(scriptsContent, baseY + gap*11, "infiniteyield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
createScriptButton(scriptsContent, baseY + gap*12, "anti kick", "https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn")
createScriptButton(scriptsContent, baseY + gap*13, "fly", "https://rawscripts.net/raw/Brookhaven-RP-Brook-script-fly-gui-35448")

local scriptsTab = Instance.new("TextButton", tabsFrame)
scriptsTab.Size = UDim2.new(1, -10, 0, 30)
scriptsTab.Position = UDim2.new(0, 5, 0, 40)
scriptsTab.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
scriptsTab.Text = "السكربتات"
scriptsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptsTab.Font = Enum.Font.GothamSemibold
scriptsTab.TextSize = 14
Instance.new("UICorner", scriptsTab).CornerRadius = UDim.new(0, 6)
local glowBorderScripts = Instance.new("UIStroke", scriptsTab)
glowBorderScripts.Color = Color3.fromRGB(170, 0, 255)
glowBorderScripts.Thickness = 2.5
glowBorderScripts.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
glowBorderScripts.Transparency = 0

scriptsTab.MouseButton1Click:Connect(function()
	for _, v in pairs(contentFrame:GetChildren()) do
		if v:IsA("GuiObject") then
			v.Visible = false
		end
	end
	scriptsContent.Visible = true
end)

-- 🧠 وظائف الإغلاق
circleButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

closeX.MouseButton1Click:Connect(function()
	confirmFrame.Visible = true
end)

cancelButton.MouseButton1Click:Connect(function()
	confirmFrame.Visible = false
end)

killButton.MouseButton1Click:Connect(function()
	gui:
