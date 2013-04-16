RCLICK.Name = "Change Extended Description"
RCLICK.SubMenu = "Settings"

function RCLICK.Condition(target)

	if target == LocalPlayer() then return true end

end

function RCLICK.Click(target,ply)

	
	CAKE.StringRequest( "Change Your Extended Description", "Change your extended description to what?", ply:Title2(), function( text )
		RunConsoleCommand( "rp_extendeddesc", text )
	end,
	function() end, "Accept", "Cancel")

end