TOOL.Category		= "Half-Life: Aftermath"
TOOL.Name			= "#Combine Force Field"
TOOL.Command		= nil
TOOL.ConfigName		= ""

if (CLIENT) then
	language.Add( "Tool.forcefields.name", "Force Field" )
	language.Add( "Tool.forcefields.desc", "Noobulater's Force Field tool" )
	language.Add( "Tool.forcefields.0", "Left Click: Place Force Fields  Right Click: Disables force field for 10 seconds" )
end
local prop1 = nil
local prop2 = nil
function TOOL:LeftClick( trace ) // Putting a Prop to Sleep
	if SERVER then
		if !trace.Hit then return false end

		if !IsValid(prop1) then
			prop1 = ents.Create("prop_physics")
			prop1:SetModel("models/props_combine/combine_fence01a.mdl")
			prop1:Spawn()
			prop1:SetPos(trace.HitPos + Vector(0,0,50))
			prop1:DropToFloor()
			prop1:GetPhysicsObject():EnableMotion(false)
			return true
		else
			prop2 = ents.Create("prop_physics")
			prop2:SetModel("models/props_combine/combine_fence01b.mdl")
			prop2:Spawn()
			prop2:SetPos(trace.HitPos + Vector(0,0,50))
			prop2:DropToFloor()
			prop2:GetPhysicsObject():EnableMotion(false)	
			prop2:SetAngles((prop2:GetPos() - prop1:GetPos()):GetNormal():Angle() + Angle(0,90,0))
			prop1:SetAngles((prop1:GetPos() - prop2:GetPos()):GetNormal():Angle() + Angle(0,-90,0))

			local forcefield = ents.Create("brush_forcefield")
			forcefield:Spawn()	
			forcefield:SetProps(prop1, prop2)						

			prop1.forcefield = forcefield
			prop2.forcefield = forcefield

			prop1 = nil
			prop2 = nil
			return true
		end
	end
end

function TOOL:RightClick( trace ) // And Waking it up
	if !trace.Hit then return false end
	if IsValid(trace.Entity.forcefield) && trace.Entity.forcefield:GetSolid() == SOLID_OBB then
		trace.Entity.forcefield:ToggleSolid()
		timer.Simple(10, function() if IsValid(trace.Entity.forcefield) then trace.Entity.forcefield:ToggleSolid() end end)
		return true
	end
	return false
end
    