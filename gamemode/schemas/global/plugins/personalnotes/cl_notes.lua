usermessage.Hook("Tiramisu.StartPersonalWrite", function()
	CAKE.WritePersonalNote()
end)

net.Receive( "Tiramisu.SendPersonalNotes", function( len, ply )
	pnorignaltext = net.ReadString( )

end )

function CAKE.WritePersonalNote()



	PWriteMenu = vgui.Create( "DFrame" )
	PWriteMenu:SetSize( 640, 480 )
	PWriteMenu:SetTitle( "Edit your personal Notes" )
	PWriteMenu:SetVisible( true )
	PWriteMenu:SetDraggable( true )
	PWriteMenu:ShowCloseButton( true )
	PWriteMenu:SetDeleteOnClose( true )
	PWriteMenu:Center()
	
	local NoteBox = vgui.Create("DTextEntry", PWriteMenu)
	NoteBox:SetMultiline(true)
	NoteBox:SetText( pnorignaltext )
	NoteBox:SetSize( 630, 380 ) 
	NoteBox:SetPos( 5 , 30 )
	
	local WriteButton = vgui.Create( "DButton", PWriteMenu )
	WriteButton:SetSize( 100, 30 )
	WriteButton:SetPos( 270,  445 )
	WriteButton:SetText( "Save" )
	WriteButton.DoClick = function( button )
		net.Start( "Tiramisu.WritePersonalNote" )
			net.WriteString( NoteBox:GetValue( ) )
		net.SendToServer( )
		PWriteMenu:Close()
	end

	PWriteMenu:MakePopup()
end

