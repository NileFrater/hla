RCLICK.Name = "View Personal Notes"
RCLICK.SubMenu = "General"

function RCLICK.Condition(target)

	if target == LocalPlayer() then return true end

end

function RCLICK.Click(target,ply)

	
	RunConsoleCommand( "rp_viewpnotes" )

end