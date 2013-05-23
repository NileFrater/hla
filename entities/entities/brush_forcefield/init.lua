AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

ENT.prop1 = nil
ENT.prop2 = nil

function ENT:Initialize()
	self:SetPos(self:GetPos() + Vector(0,0,50))
	self:SetModel("models/props_junk/PopCan01a.mdl")	
	self:DrawShadow(false)
	-- local pos1 = Vector(0,0,0)
	-- local pos2 = Vector(1,100,100)

	-- self:SetCollisionBounds( pos1, pos2 )	

	-- self:PhysicsInit(SOLID_NONE)
	-- self:SetMoveType(MOVETYPE_NONE)
	-- self:SetSolid(SOLID_OBB)

end

function ENT:ToggleSolid()
	if self:GetSolid() != SOLID_OBB then
		self:SetSolid(SOLID_OBB)
		self:SetDTBool(1, true)		
	else
		self:SetSolid(SOLID_NONE)
		self:SetDTBool(1, false)		
	end
end

function ENT:SetProps(prop1, prop2)
	self.prop1 = prop1
	self.prop2 = prop2

	local min, max = self.prop1:GetCollisionBounds()

	local pos1 = Vector(-1, self.prop1:GetPos():Distance(self.prop2:GetPos())/-2 + 10, min.z)--self.prop1:GetPos():Distance(self.prop2:GetPos())/-2, min.z)
	local pos2 = Vector(1, self.prop1:GetPos():Distance(self.prop2:GetPos())/2 - 10, max.z)--self.prop1:GetPos():Distance(self.prop2:GetPos())/2, max.z)
	self:SetCollisionBounds( pos1, pos2 )	

	self:PhysicsInit(SOLID_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_OBB)

	self:SetDTBool(1, true)

	self:SetPos(self.prop1:GetPos() + self.prop1:GetRight() * self.prop1:GetPos():Distance(self.prop2:GetPos())/2)
	self:SetAngles(self.prop1:GetAngles())

	local phys = self:GetPhysicsObject()
	if(phys:IsValid()) then
		phys:EnableMotion(false)
	end	
end

function ENT:StartTouch(otherEnt)
	otherEnt:SetVelocity(otherEnt:GetVelocity() * -5)
end
