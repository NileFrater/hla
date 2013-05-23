AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

function ENT:Initialize()

	self.Entity:SetModel("models/props_combine/combine_interface002.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS)
	self.Entity:SetSolid( SOLID_VPHYSICS)

	local phys = self.Entity:GetPhysicsObject()
	if(phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Use(activator)
	if activator:IsPlayer() && (activator.nextUse == nil or activator.nextUse <= CurTime()) then
		activator.nextUse = CurTime() + 2
		activator:ConCommand("openCombineConsole")
	end
end