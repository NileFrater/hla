ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Door Lock"

function ENT:SetupDataTables()
	self:DTVar("Bool", 1, "locked")
end