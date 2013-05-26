RCLICK.Name = "Lock"
RCLICK.SubMenu = "Combine Lock"
function RCLICK.Condition(target)
	if IsValid(target) and target:GetClass() == "ent_doorlock" then return true end

end

function RCLICK.Click(target,ply)
	RunConsoleCommand( "rp_dlLock", target:EntIndex())
end
