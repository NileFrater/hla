local meta = FindMetaTable( "Player" )

function meta:IsCP()
	local clothing = "none"
	if CLIENT then
		clothing = CAKE.Clothing
	else
		clothing = CAKE.GetCharField(self,"clothing")
	end
	if string.match(clothing, "clothing_police") or string.match(clothing, "clothing_soldier") or string.match(clothing, "clothing_elite") and string.match(clothing, "helmet_police") or string.match(clothing, "helmet_soldier") or string.match(clothing, "helmet_elite") then
		return true
	end
	return false
end

// If enabled in config, then cameras will take no damage.
function CameraInvincibility(npc, hit, dmg)
	if CAKE.ConVars["CameraInvulnerable"] then
		if npc:GetClass() == 'npc_combine_camera' then
			dmg:ScaleDamage(0)
		end
	else
end
end
hook.Add('ScaleNPCDamage', 'CAKE.CameraDamage', CameraDamage)

