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
	local ori = self.ori
	local eff = EffectData()
	eff:SetOrigin(self.Entity:GetPos())
	util.Effect("ManhackSparks",eff)

	self.Entity:SetParent(nil)

	local newDoor = self.door
	self:SetPos(newDoor:LocalToWorld(Vector(7 * ori,36.8 + (ori * -3.6 + 3.6),-2)))
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
	self.door.doorlock = nil
	self.door = nil
end
ENT.ori = nil
function ENT:SetDoor(newDoor, ori)
	ori = ori or 1
	self.door = newDoor
	self.door.doorlock = self
	self:SetPos(newDoor:LocalToWorld(Vector(7 * ori,36.8 + (ori * -3.6 + 3.6),-2)))
	local ang = newDoor:GetAngles()

	ang.y = ang.y - 90 * ori
	self:SetAngles(ang)
	self:SetParent(self.door)
	self.ori = ori
end

function ENT:OnTakeDamage(dmginfo)
	print(dmginfo:GetDamage())

	if self.door == nil then return end

	if dmginfo:GetDamage() >= self.Entity:Health() then
		self:Unattach()
	end
	self.Entity:SetHealth(self.Entity:Health() - dmginfo:GetDamage())
end

ENT.cd = 0

function ENT:Open()
	self.door:Fire("Unlock",0)
	self.door:Fire("Toggle",0)
	self.door:Fire("lock",0)
	self:EmitSound("buttons/button9.wav")
end

function ENT:Use(activator)
	if IsValid(self.door) && activator:IsPlayer() && self.cd < CurTime() then 
		if !self:GetDTBool("1") then
			self:Open()
		else
			self:EmitSound("buttons/button10.wav")
		end
		self.cd = CurTime() + 0.5
	end
end  

function ENT:OnRemove()
	if self.door != nil then
		self.door.doorlock = nil
	end
	self.door = nil
end

local function unlockDoor( ply, entity )
	if IsValid(entity) && CAKE.IsDoor(entity) && IsValid(entity.doorlock) then
		if ply:IsCP() && ply:KeyDown(IN_SPEED) then
			entity.doorlock:SetDTBool("1",false)
			entity.doorlock:Open()
			self.cd = CurTime() + 0.5
		end
	end
end
 
hook.Add( "PlayerUse", "combineDoorLockUnlockerFromOtherSide", unlockDoor )