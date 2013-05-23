ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Combine Forcefield"


function ENT:SetupDataTables()
	self:DTVar("Bool", 1, "On")
end