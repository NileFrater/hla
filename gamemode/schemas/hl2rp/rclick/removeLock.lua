RCLICK.Name = "Remove Lock"
RCLICK.SubMenu = "DoorLock"
function RCLICK.Condition(target)
	if IsValid(target) and target:GetClass() == "ent_doorlock" then return true end

end

function RCLICK.Click(target,ply)
	RunConsoleCommand( "rp_removelock", target:EntIndex())
end
