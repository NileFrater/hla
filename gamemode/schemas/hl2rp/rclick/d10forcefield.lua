RCLICK.Name = "Disable Field for 10 seconds"
RCLICK.SubMenu = "Force Field"
function RCLICK.Condition(target)
	if !LocalPlayer():IsCP() then return false end
	if IsValid(target) and (string.lower(target:GetModel()) == "models/props_combine/combine_fence01a.mdl" or string.lower(target:GetModel()) == "models/props_combine/combine_fence01b.mdl") then return true end

end

function RCLICK.Click(target,ply)
	RunConsoleCommand( "rp_disableff", target:EntIndex(), 10)
end