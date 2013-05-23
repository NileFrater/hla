
if CLIENT then

local overlay = surface.GetTextureID("effects/combine_binocoverlay")

surface.CreateFont( "CamLocation",
{
	font		= "Helvetica",
	size		= 32,
	weight		= 900
})

local function initializeCameraControls(parent)
	gui.EnableScreenClicker(true)
	RunConsoleCommand( "rp_thirdperson", "1" )
	RunConsoleCommand("rp_cameraOpen")

	local screenPanel = vgui.Create("DPanel")
	screenPanel:SetSize(ScrW(), ScrH())
	screenPanel.Paint = function()
		if LocalPlayer():GetViewEntity():GetClass() != "npc_combine_camera" then
			surface.SetDrawColor(0,0,0,255)
			surface.DrawRect(0,0,screenPanel:GetWide(),screenPanel:GetTall())
		end
		surface.SetTexture(overlay)
		surface.DrawTexturedRect(0,0,screenPanel:GetWide(),screenPanel:GetTall())
	end

	local label = vgui.Create("DLabel", screenPanel)
	label:SetPos(20,20)
	label:SetFont("CamLocation")
	label.Paint = function()
		if LocalPlayer():GetViewEntity():GetClass() != "npc_combine_camera" then
			label:SetText("No Camera's Availible")
			label:SizeToContents()
		else
			label:SetText("Location : "..LocalPlayer():GetViewEntity():GetDTString(1))
			label:SizeToContents()
		end
	end

	local xpos = screenPanel:GetWide() * 0.33 - 50
	local ypos = screenPanel:GetTall() - 30 - 20
	local buttonWide = 100
	local buttonTall = 30

	local button = vgui.Create("DButton", screenPanel)
	button:SetSize(buttonWide, buttonTall)
	button:SetText("Toggle Camera")
	button:SetPos(xpos, ypos)

	xpos = xpos + (screenPanel:GetWide() * 0.33) *.5

	local button = vgui.Create("DButton", screenPanel)
	button:SetSize(buttonWide, buttonTall)
	button:SetText("Previous Camera")
	button:SetPos(xpos, ypos)
	button.DoClick = function() 
		RunConsoleCommand("rp_cameraPrev") 
	end

	xpos = xpos + (screenPanel:GetWide() * 0.33) *.5

	local button = vgui.Create("DButton", screenPanel)
	button:SetSize(buttonWide, buttonTall)
	button:SetText("Next Camera")
	button:SetPos(xpos, ypos)
	button.DoClick = function() 
		RunConsoleCommand("rp_cameraNext") 
	end

	buttonWide, buttonTall = 40, 15

	local button = vgui.Create("DButton", screenPanel)
	button:SetSize(buttonWide, buttonTall)
	button:SetText("Close")
	button:SetPos(screenPanel:GetWide() - buttonWide - 20, buttonTall + 5)
	button.DoClick = function() 
		screenPanel:Remove() 
		gui.EnableScreenClicker(false)
		RunConsoleCommand("rp_cameraClose") 
	end
	return screenPanel
end

local function citizenRecordsView(parent, ply)
	local recordsPanel = vgui.Create("DPanel", parent)
	recordsPanel:SetSize(parent:GetWide(), parent:GetTall())
	recordsPanel.Paint = function()
		surface.SetDrawColor(Color(0,0,0,55))
		surface.DrawRect(0,0,recordsPanel:GetWide(),recordsPanel:GetTall())
	end

	local infoPanel = vgui.Create("DPanel", recordsPanel)
	infoPanel:SetSize(recordsPanel:GetWide() * 0.5 - 10, recordsPanel:GetTall() * 0.5 - 5)
	infoPanel:SetPos(5,5)
	infoPanel.Paint = function()
		surface.SetDrawColor(Color(0,0,55,55))
		surface.DrawRect(0,0,infoPanel:GetWide(),infoPanel:GetTall())
	end

	local form = vgui.Create("DForm", infoPanel)
	form:SetSize(infoPanel:GetWide(), infoPanel:GetTall())
	form:SetSpacing(5)
	form:SetPadding(5)
	form:SetName("General Information")

	local label = vgui.Create("DLabel")
	label:SetText("Citizen Name : ".. tostring(ply:Nick()))
	label:SizeToContents()	
	form:AddItem(label)

	local label = vgui.Create("DLabel")
	label:SetText("CID : "..ply:GetNWString("cid"))
	label:SizeToContents()
	form:AddItem(label)

	local label = vgui.Create("DLabel")
	label:SetText("Age : "..ply:GetNWInt("age"))
	label:SizeToContents()	
	form:AddItem(label)

	local modelPanel = vgui.Create("DPanel", recordsPanel)
	modelPanel:SetSize(recordsPanel:GetWide() * 0.5 - 10, recordsPanel:GetTall() * 0.5 - 5)
	modelPanel:SetPos(recordsPanel:GetWide() - modelPanel:GetWide() - 5,5)
	modelPanel.Paint = function()
		surface.SetDrawColor(Color(0,0,55,55))
		surface.DrawRect(0,0,modelPanel:GetWide(),modelPanel:GetTall())
	end

	local plyPanel = vgui.Create( "PlayerPanel", modelPanel )
	plyPanel:SetSize( modelPanel:GetWide(), modelPanel:GetTall())
	plyPanel:SetTarget(ply)

	local scrollPanel = vgui.Create("DPanel", recordsPanel)
	scrollPanel:SetSize(recordsPanel:GetWide() * 0.5 - 10, recordsPanel:GetTall() * 0.5 - 10)
	scrollPanel:SetPos(5, recordsPanel:GetTall() * 0.5 + 5)
	scrollPanel.Paint = function()
		surface.SetDrawColor(Color(0,0,55,55))
		surface.DrawRect(0,0,scrollPanel:GetWide(),scrollPanel:GetTall())
	end

	local form = vgui.Create("DForm", scrollPanel)
	form:SetSize(scrollPanel:GetWide(), scrollPanel:GetTall() / 2)
	form:SetSpacing(5)
	form:SetPadding(5)
	form:SetName("Criminal Information")

	local form = vgui.Create("DForm", scrollPanel)
	form:SetPos(0,scrollPanel:GetTall()/2)
	form:SetSize(scrollPanel:GetWide(), scrollPanel:GetTall() / 2)
	form:SetSpacing(5)
	form:SetPadding(5)
	form:SetName("Medical Information")

	local warrentPanel = vgui.Create("DPanel", recordsPanel)
	warrentPanel:SetSize(recordsPanel:GetWide() * 0.5 - 10, recordsPanel:GetTall() * 0.5 - 10)
	warrentPanel:SetPos(recordsPanel:GetWide() - warrentPanel:GetWide() - 5, recordsPanel:GetTall() * 0.5 + 5)
	warrentPanel.Paint = function()
		surface.SetDrawColor(Color(0,0,55,55))
		surface.DrawRect(0,0,warrentPanel:GetWide(),warrentPanel:GetTall())
	end

	local form = vgui.Create("DForm", warrentPanel)
	form:SetSize(warrentPanel:GetWide(), warrentPanel:GetTall())
	form:SetSpacing(5)
	form:SetPadding(5)
	form:SetName("Additional Notes")

	return recordsPanel
end

local function citizenRecordsList(parent)
	local citizenList = vgui.Create( "DListView" , parent )
	citizenList:SetSize(parent:GetWide(), parent:GetTall())
	citizenList:AddColumn("Citizen")
	for _, ply in pairs(player.GetAll()) do
		local line = citizenList:AddLine(ply:Nick())
		line.player = ply
	end
	citizenList.OnClickLine = function( panel , line )
		parent.change(citizenRecordsView(parent, line.player))
	end
	return citizenList
end

local function citizenRecordsBase(parent)
	local screenPanel = vgui.Create("DPanel", parent)
	screenPanel:SetSize(parent:GetWide(), parent:GetTall())
	screenPanel.Paint = function()
		surface.SetDrawColor(Color(0,0,0,55))
		surface.DrawRect(0,0,screenPanel:GetWide(),screenPanel:GetTall())
	end

	local changePanel = vgui.Create("DPanel", screenPanel)
	changePanel:SetSize(screenPanel:GetWide() * 0.95, screenPanel:GetTall() * 0.85)
	changePanel:SetPos(screenPanel:GetWide() * 0.025,screenPanel:GetTall() * (0.025))
	changePanel.Paint = function()
		surface.SetDrawColor(Color(0,0,0,55))
		surface.DrawRect(0,0,changePanel:GetWide(),changePanel:GetTall())
	end
	changePanel.current = citizenRecordsList(changePanel)
	changePanel.change = function(newPanel)
		if changePanel.current != nil then
			changePanel.current:Remove()
		end

		changePanel.current = newPanel
	end

	local buttonWide = 100
	local buttonTall = 20
	local xpos = screenPanel:GetWide() * .75 - buttonWide/2
	local ypos = screenPanel:GetTall() - (screenPanel:GetTall() - screenPanel:GetTall() * 0.85 + screenPanel:GetTall() * (0.025)) / 2 + buttonTall/2

	local button = vgui.Create("DButton", screenPanel)
	button:SetSize(buttonWide, buttonTall)
	button:SetText("Search")
	button:SetPos(xpos, ypos)

	local searchName = vgui.Create("DTextEntry", screenPanel)
	searchName:SetSize(400, 20)
	searchName:SetText("Enter A Citizen's Name to Search For")
	searchName:SetPos(screenPanel:GetWide() * .25 - searchName:GetWide()/2, ypos)

	return screenPanel
end

function openCombineConsole()
	local CombineMenu = vgui.Create( "DFrame" )
	CombineMenu:SetSize( ScrW(), ScrH() )
	CombineMenu:Center()
	CombineMenu:SetDraggable( false )
	CombineMenu:ShowCloseButton( true )
	CombineMenu:SetTitle( "" )
	CombineMenu:MakePopup(true)
	CombineMenu.Paint = function()
		CAKE.DrawBlurScreen()
	end

	local terminalName = vgui.Create("DLabel", CombineMenu)
	terminalName:SetText("Terminal Designation")
	terminalName:SetPos(CombineMenu:GetWide() * 0.75 + 20, CombineMenu:GetTall() * 0.1)
	terminalName:SizeToContents()

	local timeStamp = vgui.Create("DLabel", CombineMenu)
	timeStamp:SetPos(CombineMenu:GetWide() * 0.75 + 20, CombineMenu:GetTall() * 0.1 + 20)
	timeStamp.Think = function() timeStamp:SetText(os.date()) timeStamp:SizeToContents() end
	
	local baseScreenPanel = vgui.Create("DPanel", CombineMenu)
	baseScreenPanel:SetSize(CombineMenu:GetWide() * 0.75, CombineMenu:GetTall())
	baseScreenPanel:SetPos(0,0)
	baseScreenPanel.Paint = function()
		surface.SetDrawColor(Color(0,0,0,55))
		surface.DrawRect(0,0,baseScreenPanel:GetWide(),baseScreenPanel:GetTall())
	end

	local xpos = CombineMenu:GetWide() - (CombineMenu:GetWide() * 0.25) * (3/4)
	local ypos = CombineMenu:GetTall() * 0.2
	local buttonWide = (CombineMenu:GetWide() * 0.25) * (1/2)
	local buttonTall = CombineMenu:GetTall() * 0.05

	local button = vgui.Create("DButton", CombineMenu)
	button:SetSize(buttonWide, buttonTall)
	button:SetText("Initialize Camera Controls")
	button:SetPos(xpos, ypos)
	button.DoClick = function() 
		if baseScreenPanel.current != nil then baseScreenPanel.current:Remove() end
		baseScreenPanel.current = initializeCameraControls(baseScreenPanel)
		CombineMenu:Remove()
	end
	

	ypos = ypos + buttonTall + CombineMenu:GetTall() * (1/10)

	local button = vgui.Create("DButton", CombineMenu)
	button:SetSize(buttonWide, buttonTall)
	button:SetText("Request Ground Support")
	button:SetPos(xpos, ypos)
	button.DoClick = function() 
		if baseScreenPanel.current != nil then baseScreenPanel.current:Remove() end
		baseScreenPanel.current = citizenRecordsBase(baseScreenPanel)
	end

	ypos = ypos + buttonTall + CombineMenu:GetTall() * (1/10)
		
	local button = vgui.Create("DButton", CombineMenu)
	button:SetSize(buttonWide, buttonTall)
	button:SetText("Request APC Support")
	button:SetPos(xpos, ypos)
	button.DoClick = function() 
		if baseScreenPanel.current != nil then baseScreenPanel.current:Remove() end
	end

	ypos = ypos + buttonTall + CombineMenu:GetTall() * (1/10)

	local button = vgui.Create("DButton", CombineMenu)
	button:SetSize(buttonWide, buttonTall)
	button:SetText("Run Command")
	button:SetPos(xpos, ypos)
	button.DoClick = function() 
		if baseScreenPanel.current != nil then baseScreenPanel.current:Remove() end
	end

	ypos = ypos + buttonTall + CombineMenu:GetTall() * (1/10)
			
end
concommand.Add("openCombineConsole", openCombineConsole)

else
	local function cameraOpen(ply,cmd,args)
		local cameras = ents.FindByClass("npc_combine_camera")
		if table.Count(cameras) > 0 then
			if ply.ccacamkey == nil then
				ply.ccacamkey = 1
			end
			ply:SetViewEntity(cameras[ply.ccacamkey])
		end
	end
	concommand.Add("rp_cameraOpen", cameraOpen)

	local function cameraNext(ply,cmd,args)
		local cameras = ents.FindByClass("npc_combine_camera")
		if table.Count(cameras) > 0 then
			ply.ccacamkey = ply.ccacamkey + 1
			if ply.ccacamkey > table.Count(cameras) then
				ply.ccacamkey = 1
			end
			ply:SetViewEntity(cameras[ply.ccacamkey])
		end
	end
	concommand.Add("rp_cameraNext", cameraNext)	

	local function cameraPrev(ply,cmd,args)
		local cameras = ents.FindByClass("npc_combine_camera")
		if table.Count(cameras) > 0 then
			ply.ccacamkey = ply.ccacamkey - 1
			if ply.ccacamkey <= 0 then
				ply.ccacamkey = table.Count(cameras)
			end
			ply:SetViewEntity(cameras[ply.ccacamkey])
		end
	end
	concommand.Add("rp_cameraPrev", cameraPrev)	

	local function cameraClose(ply,cmd,args)
		ply:SetViewEntity(ply)
	end
	concommand.Add("rp_cameraClose", cameraClose)		
end