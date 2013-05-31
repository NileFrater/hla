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

function ccaDisableForcefield(ply,cmd,args)
	local ent = ents.GetByIndex(tonumber(args[1]))
	local time = tonumber(args[2])
	if !IsValid(ent) then return false end
	if !IsValid(ent.forcefield) then return false end
	ent.forcefield:Disable(time)
end
concommand.Add("rp_disableff", ccaDisableForcefield)

function ccaEnableForcefield(ply,cmd,args)
	local ent = ents.GetByIndex(tonumber(args[1]))
	if !IsValid(ent) then return false end
	if !IsValid(ent.forcefield) then return false end
	ent.forcefield:Enable()
end
concommand.Add("rp_enableff", ccaEnableForcefield)
