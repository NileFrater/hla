RCLICK.Name = "Place Ration Machine"
RCLICK.SubMenu = "CCA Tech"

function RCLICK.Condition(target)
	print(LocalPlayer():IsCP() )
	if target == LocalPlayer() && LocalPlayer():IsCP() then return true end
end

function RCLICK.Click(target,ply)
	RunConsoleCommand( "rp_placerm" )
end