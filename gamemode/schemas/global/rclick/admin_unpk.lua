RCLICK.Name = "Un-Permanent-Kill"
RCLICK.SubMenu = "Admin"

function RCLICK.Condition(target)

	if  LocalPlayer():GetNWInt( "TiramisuAdminLevel", 0 ) >= 2 then return true end

end

function RCLICK.Click(target,ply)

	CAKE.StringRequest( "Un-Permanent Kill a Character", "Enter the player's SteamID", "STEAM_0:0:0", function( text )
		local SteamID = text
	end,
	function() end, "Accept", "Cancel")
 
	local checkboxes = {}
	local char = CAKE.PlayerData[ SteamID ][ "characters" ]

	local Window = vgui.Create( "DFrame" )
	Window:SetTitle( "Select Characters" )
	Window:SetDraggable( false )
	Window:ShowCloseButton( false )

	local InnerPanel = vgui.Create( "DPanelList", Window )
	InnerPanel:SetSpacing( 5 )
	InnerPanel:SetPadding( 5 )

	local Text = vgui.Create( "DLabel" )
	Text:SetText( "Characters without ticks are alive, characters with ticks are banned." )
	Text:SizeToContents()
	Text:SetContentAlignment( 5 )
	Text:SetTextColor( color_white )
	InnerPanel:AddItem( Text )

	for k, v in pairs(char) do
		local checkbox = vgui.Create( "DCheckBoxLabel" )
		checkbox:SetText(v["name"])
		checkbox:SetContentAlignment( 5 )
		if v["banned"] == 1 then
		checkbox:SetValue( 0 )
		else checkbox:SetValue( 1 )
		end
		checkbox:SizeToContents()
		checkbox.char = k
		InnerPanel:AddItem( checkbox )
		table.insert(checkboxes, checkbox)
	end

	local ButtonPanel = vgui.Create( "DPanel", Window )
	ButtonPanel:SetTall( 30 )

	local Button = vgui.Create( "DButton", ButtonPanel )
	Button:SetText( "Accept" )
	Button:SizeToContents()
	Button:SetTall( 20 )
	Button:SetWide( Button:GetWide() + 20 )
	Button:SetPos( 5, 5 )
	Button.DoClick = function()
		for k, v in pairs (checkboxes) do
			if v and v:GetChecked() then
				for k, v in pairs(char) do
				table.
			end
		end
		ply:ConCommand(str)
		Window:Close()
	end

	local ButtonCancel = vgui.Create( "DButton", ButtonPanel )
	ButtonCancel:SetText( "Cancel" )
	ButtonCancel:SizeToContents()
	ButtonCancel:SetTall( 20 )
	ButtonCancel:SetWide( Button:GetWide() + 20 )
	ButtonCancel:SetPos( 5, 5 )
	ButtonCancel.DoClick = function() Window:Close() end
	ButtonCancel:MoveRightOf( Button, 5 )

	ButtonPanel:SetWide( Button:GetWide() + 5 + ButtonCancel:GetWide() + 10 )

	local w, h = InnerPanel:GetSize()
	w = math.max( w, 400 ) 

	Window:SetSize( w + 50, h + 125 )
	Window:Center()

	InnerPanel:StretchToParent( 5, 25, 5, 45 )

	ButtonPanel:CenterHorizontal()
	ButtonPanel:AlignBottom( 8 )

	Window:MakePopup()

end