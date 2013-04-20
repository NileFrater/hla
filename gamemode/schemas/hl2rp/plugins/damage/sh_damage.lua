local bad_dmg_types = {
	
	DMG_CRUSH,
	DMG_CLUB,
	DMG_SLASH
	
	}

local translation = {
	
	[DMG_CRUSH] = "Crush Damage",
	[DMG_CLUB] = "Club Damage",
	[DMG_SLASH] = "Slash Damage"
	
	}

-- if SERVER then
-- 	timer.Simple(5,function() 
-- 		dor = ents.Create("prop_door_rotating")
-- 		dor:SetModel("models/props_c17/door01_left.mdl")
-- 		dor:SetPos(player.GetAll()[1]:GetPos() + Vector(0,0,100))
-- 		dor:Spawn()
-- 		dor.purchaseable = true
-- 	end)
-- end


local function createDoor(tbl)
	local door = ents.Create("prop_door_rotating")
	door:SetModel(tbl.model)
	door:SetSkin(tbl.skin)
	door:SetPos(tbl.pos)
	door:SetAngles(tbl.ang)
	door:SetKeyValue("hardware","2")
	door.owner = tbl.owner


	door.doorgroup = tbl["doorgroup"]
	door.title = tbl["title"]
	door.building = tbl["building"]
	door.purchaseable = tbl["purchaseable"]
	CAKE.SetDoorTitle(door, tbl.title)
	door:Spawn()
end

function Damage_EntityTakeDamage(ent, dmginfo)

	local attacker = dmginfo:GetAttacker()
	local amount = dmginfo:GetDamage()
	local dmgtype = dmginfo:GetDamageType()

	if SERVER then
		if ent:IsValid() && ent:GetClass() == "prop_door_rotating" then
			-- this is for hit positions
			-- local d = ents.Create("prop_physics")
			-- d:SetModel("models/healthvial.mdl")
			-- d:SetPos(dmginfo:GetDamagePosition())
			-- d:Spawn()
			if attacker:IsPlayer() && dmginfo:IsBulletDamage() then
				if !dmginfo:IsDamageType(DMG_BUCKSHOT) then
					if amount > 5 then
						if ent:GetModel() != "models/props_c17/door02_double.mdl" then
							print(ent:GetKeyValues()["hardware"] )
							if ent:GetKeyValues()["hardware"] == 1 or ent:GetKeyValues()["hardware"] == 0 then
								if dmginfo:GetDamagePosition():Distance(ent:LocalToWorld(Vector(1,42,-9))) < 4 then
									ent:Fire('Open',0)
								end
							elseif ent:GetKeyValues()["hardware"] == 2 then
								if dmginfo:GetDamagePosition():WithinAABox( ent:LocalToWorld(Vector(5, 44,-14)), ent:LocalToWorld(Vector(-5,3,-3)) ) then
									ent:Fire('Open',0)
								end
							end 
						end
					end
				else
					if amount > 10 then

						local door = ents.Create("prop_physics")
						door:SetModel(ent:GetModel())
						door:SetSkin(ent:GetSkin())
						door:SetPos(ent:GetPos())
						door:SetAngles(ent:GetAngles())
						door:Spawn()

						door:Activate()
						if door:GetPhysicsObject():IsValid() then
							door:GetPhysicsObject():ApplyForceOffset(dmginfo:GetDamageForce(), door:WorldToLocal(dmginfo:GetDamagePosition()))
						end

						local tbl = {}
						tbl.skin = ent:GetSkin()
						tbl.model = ent:GetModel()
						tbl.pos = ent:GetPos()
						tbl.ang = ent:GetAngles()
						tbl.owner = ent.owner
						tbl.title = CAKE.GetDoorTitle(ent)

						tbl.doorgroup = door["doorgroup"]
						tbl.title = door["title"]
						tbl.building = door["building"]
						tbl.purchaseable = door["purchaseable"]

						timer.Simple(60 * 4, function()	createDoor(tbl) end)
						ent:Remove()
					end
				end
			end
		end
	end

	if !ent:IsPlayer() then return end
	
	if table.HasValue(bad_dmg_types, dmgtype) then
		
		if ent:Health() >= 60 then return end // they're health enough to sustain it
		if ent:Armor() != 0 then return end // they has armor, don't knock them out
		
		local chance = math.random(1, 3) == 2
		
		if !chance then return end // not lucky enough, sorry
		
		// CAKE.CombatLog(Color(25, 25, 230), CAKE.GetCharSignature(ent) .. " has been knocked out by \"" .. translation[dmgtype] .. "\"")
		CAKE.UnconciousMode(ent)
		
	end
	
end
hook.Add("EntityTakeDamage", "Damage_ETD", Damage_EntityTakeDamage)