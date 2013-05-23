RCLICK.Name = "Buy Ration"
RCLICK.SubMenu = "Ration Machine"
function RCLICK.Condition(target)
	if IsValid(target) and string.lower(target:GetClass()) == "ent_rationmachine" then return true end

end

function RCLICK.Click(target,ply)
	RunConsoleCommand( "rp_buyration", target:EntIndex() )
end