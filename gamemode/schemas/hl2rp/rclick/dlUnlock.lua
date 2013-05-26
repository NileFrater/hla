RCLICK.Name = "Unlock"
RCLICK.SubMenu = "Combine Lock-"
function RCLICK.Condition(target)
	if IsValid(target) and target:GetClass() == "ent_doorlock" then return true end

end

function RCLICK.Click(target,ply)
	RunConsoleCommand( "rp_dlUnlock", target:EntIndex())
end
