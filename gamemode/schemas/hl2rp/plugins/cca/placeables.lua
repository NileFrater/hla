function ccaPlaceRM(ply,cmd,args)
	if !ply:IsCP() then return false end
	
	local ent = ents.Create("ent_rationmachine")
	ent:SetPos(ply:CalcDrop())
	ent:Spawn()
end
concommand.Add("rp_placerm", ccaPlaceRM)

function ccaPlaceCam(ply,cmd,args)
	if !ply:IsCP() then return false end
	
	local ent = ents.Create("npc_combine_camera")
	ent:SetPos(ply:CalcDrop())
	ent:SetKeyValue( "spawnflags", 82)
	ent:Spawn()
	ent:SetDTString(1,args[2])
	ent:SetDTString(2,"on")
	ent:SetDTString(3,"off")
end
concommand.Add("rp_placecam", ccaPlaceCam)

function ccaToggleForcefield(ply,cmd,args)
	local ent = ents.GetByIndex(tonumber(args[1]))
	if !IsValid(ent) then return false end
	if !IsValid(ent.forcefield) then return false end
	if IsValid(ent.forcefield) && ent.forcefield:GetSolid() == SOLID_OBB then
		ent.forcefield:ToggleSolid()
		timer.Simple(10, function() if IsValid(ent.forcefield) then ent.forcefield:ToggleSolid() end end)
		return true
	end
end
concommand.Add("rp_toggleshield", ccaToggleForcefield)
