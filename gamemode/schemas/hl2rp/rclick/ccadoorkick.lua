RCLICK.Name = "Kick Door"
RCLICK.SubMenu = "Door"
function RCLICK.Condition(target)
	if IsValid(target) and CAKE.IsDoor(target) && target:GetModel() != "models/props_c17/door02_double.mdl" then return true end

end

function RCLICK.Click(target,ply)
	RunConsoleCommand( "rp_kickdoor" )
end
