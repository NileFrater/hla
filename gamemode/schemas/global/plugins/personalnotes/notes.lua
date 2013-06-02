
net.Receive( "Tiramisu.WritePersonalNote", function( len, ply )
	local text = net.ReadString( )
	timer.Simple( 0, function()
		CAKE.SetCharField(ply, "notes", text)
	end)

end )

function CAKE.StartPersonalWrite( ply )
end

function CAKE.SendCurrentNotes( ply )
	local tosend = CAKE.GetCharField( ply, "notes" )
			net.Start( "Tiramisu.SendPersonalNotes" )
				net.WriteString( tosend )
			net.Send( ply )
			
		umsg.Start("Tiramisu.StartPersonalWrite", ply)
		umsg.End()
end