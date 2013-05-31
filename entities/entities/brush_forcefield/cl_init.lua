include('shared.lua')

local mat = Material("effects/combineshield/comshieldwall")

function ENT:RenderOverride()

end

ENT.cd = 0

function ENT:Think() 
	if self:GetDTBool(1) && LocalPlayer():GetPos():Distance(self:GetPos()) < 700 && self.cd < CurTime() then
		self:EmitSound("ambient/energy/force_field_loop1.wav", 50, 100)
		self.cd = CurTime() + 4
	end
end 

function ENT:Draw()

end

local function hudpainthook()
	for k,v in pairs(ents.FindByClass("brush_forcefield")) do
		local self = v 
		if IsValid(self) && self:GetDTBool(1) then		
			local origin = self:GetPos()
			local correctedAngle = self:GetAngles()
		    local t = util.GetPlayerTrace(LocalPlayer())
			local tr = util.TraceLine(t)
		 	local min, max = self:GetCollisionBounds()
			cam.Start3D(CAKE.CameraPos, CAKE.CameraAngle)
				render.SetMaterial(mat)
				render.DrawQuadEasy(self:LocalToWorld(self:OBBCenter()), self:GetForward()*-1, max.y - min.y, max.z - min.z, Color(0,255,255,55), 0)
				render.DrawQuadEasy(self:LocalToWorld(self:OBBCenter()), self:GetForward(), max.y - min.y, max.z - min.z, Color(0,255,255,55), 0)
			cam.End3D()
		end
	end
end
hook.Add("PostPlayerDraw", "renderForceFields", hudpainthook)