RCLICK.Name = "Place Combine Camera"
RCLICK.SubMenu = "Civil Protection Technology"

function RCLICK.Condition(target)
	if target == LocalPlayer() && LocalPlayer():IsCP() then return true end
end

function RCLICK.Click(target,ply)

	CAKE.StringRequest( "Spawn a Camera", "Enter the identifier for this camera ( For Example, this is PLAZA_CAMERA01 )", "", function( text )
		RunConsoleCommand("rp_placecam", target:EntIndex(), text)
	end,
	function() end, "Accept", "Cancel")
end