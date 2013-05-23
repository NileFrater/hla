AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

function ENT:Initialize()
	self.Entity:SetHealth(30)

	self.Entity:SetModel("models/props_combine/combine_lock01.mdl")
	self.Entity:SetDTBool(1,false)
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS)
	self.Entity:SetSolid( SOLID_VPHYSICS)

	local phys = self.Entity:GetPhysicsObject()
	if(phys:IsValid()) then
		phys:EnableMotion(false)
	end

end

function ENT:Unattach()
	local eff = EffectData()
	eff:SetOrigin(self.Entity:GetPos())
	util.Effect("ManhackSparks",eff)

	self.Entity:SetParent(nil)

	local newDoor = self.door
	self:SetPos(newDoor:LocalToWorld(Vector(7,36.8,-2)))
	local ang = newDoor:GetAngles()

	ang.y = ang.y - 90
	self:SetAngles(ang)


	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:EnableMotion(true)
		phys:Wake()
		timer.Simple(60, function() if IsValid(self.Entity) then self.Entity:Remove() end end)
	else
		self.Entity:Remove()
	end
	self.door = nil
end

function ENT:SetDoor(newDoor)
	self.door = newDoor
	self:SetPos(newDoor:LocalToWorld(Vector(7,36.8,-2)))
	local ang = newDoor:GetAngles()

	ang.y = ang.y - 90
	self:SetAngles(ang)
	self:SetParent(self.door)
end

function ENT:OnTakeDamage(dmginfo)
	print(dmginfo:GetDamage())

	if self.door == nil then return end

	if dmginfo:GetDamage() >= self.Entity:Health() then
		self:Unattach()
	end
	self.Entity:SetHealth(self.Entity:Health() - dmginfo:GetDamage())
end

function ENT:Use(activator)
	if IsValid(self.door) && activator:IsPlayer() then 
		if !self:GetDTBool("1") && activator:IsCP() then
			self.door:Fire("Unlock",0)
			self.door:Fire("Toggle",0)
			self.door:Fire("lock",0)
			self:EmitSound("buttons/button9.wav")
		else
			self:EmitSound("buttons/button10.wav")
		end
	end
end