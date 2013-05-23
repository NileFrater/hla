local function removeLock(ply,cmd,args)
	local ent = ents.GetByIndex(tonumber(args[1]))
	if ent:GetClass() != "ent_doorlock" then return end	
	if ply:GetPos():Distance(ent:GetPos()) < 300 then
		CAKE.CreateItem("combinelock", ent:GetPos(), ent:GetAngles(), CAKE.CreateItemID());
		ent:Remove()
	end
end
concommand.Add("rp_removelock", removeLock)

local function Lock(ply,cmd,args)
	local ent = ents.GetByIndex(tonumber(args[1]))
	if ent:GetClass() != "ent_doorlock" then return end
	if ply:GetPos():Distance(ent:GetPos()) < 300 then
		ent:SetDTBool("1",true)
	end
end
concommand.Add("rp_dlLock", Lock)

local function Unlock(ply,cmd,args)
	local ent = ents.GetByIndex(tonumber(args[1]))
	if ent:GetClass() != "ent_doorlock" then return end
	if ply:GetPos():Distance(ent:GetPos()) < 300 then
		ent:SetDTBool("1",false)
	end
end
concommand.Add("rp_dlUnlock", Unlock)