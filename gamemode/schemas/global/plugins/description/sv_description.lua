-- Set Extended Description
concommand.Add( "rp_extendeddesc", function( ply, cmd, args )

	local exdesc = table.concat( args, " " )

	CAKE.SetCharField( ply, "title2", exdesc )
	ply:SetNWString("title2", exdesc)

end)