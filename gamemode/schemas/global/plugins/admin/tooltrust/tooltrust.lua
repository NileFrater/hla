CAKE.AddDataField( 1, "extraprops", 0 ) -- ha
CAKE.AddDataField( 1, "extraragdolls", 0 )
CAKE.SpawnTable = {}

PropBlacklist =
{
	"models/props_phx/ball.mdl",
	"models/props_phx/cannonball.mdl",
	"models/props_phx/facepunch_barrel.mdl",
	"models/props_phx/mk-82.mdl",
	"models/props_phx/oildrum001.mdl",
	"models/props_phx/oildrum001_explosive.mdl",
	"models/props_phx/rocket1.mdl",
	"models/props_phx/torpedo.mdl",
	"models/props_phx/ww2bomb.mdl",
	"models/props_phx/misc/flakshell_big.mdl",
	"models/props_phx/games/chess/board.mdl",
	"models/props_phx/misc/small_ramp.mdl",
	"models/props_phx/misc/big_ramp.mdl",
	"models/hunter/blocks/cube8x8x8.mdl",
	"models/hunter/blocks/cube6x6x6.mdl",
	"models/hunter/blocks/cube4x4x4.mdl",
	"models/props_phx/construct/plastic/plastic_panel8x8.mdl",
	"models/props_phx/huge/tower.mdl",
	"models/props_phx/huge/road_short.mdl",
	"models/props_phx/huge/road_medium.mdl",
	"models/props_phx/huge/road_long.mdl",
	"models/props_phx/huge/road_curve.mdl",
	"models/props_phx/huge/evildisc_corp.mdl",
	"models\\props_c17\\oildrum001_explosive.mdl",
	"models\\props_junk\\gascan001a.mdl",
	"models\\props_junk\\propanecanister001a.mdl",
	"models\\props_explosive\\explosive_butane_can.mdl",
	"models\\props_explosive\\explosive_butane_can02.mdl",
	"models\\props_junk\\propane_tank001a.mdl",
	"models\\Advisorpod_crash\\Advisor_Pod_crash.mdl",
	"models\\Combine_Advisor_Pod\\combine_advisor_pod.mdl",
	"models\\advisorpod.mdl",
	"models\\extras\\info_speech.mdl",

}

function PropIsBlacklisted( mdl )

	mdl = string.gsub( mdl, "/", "\\" );

	for k, v in pairs( PropBlacklist ) do

		if( v == string.gsub( mdl, "\\", "" ) ) then
		
			return true;
			
		end
	
	end
	
	return false;

end

function CAKE.MaxProps(ply)

	local dprops = CAKE.ConVars[ "PropLimit" ]
	local exprops = CAKE.GetPlayerField(ply, "extraprops")
	local limit = dprops + exprops

	return tonumber(limit)
	
end

function CAKE.MaxRagdolls(ply)

	local drags = CAKE.ConVars[ "RagdollLimit" ]
	local exrags = CAKE.GetPlayerField(ply, "extraragdolls")
	local rlimit = drags + exrags

	return tonumber(rlimit)

end

function CAKE.MaxVehicles(ply)

	return tonumber(CAKE.ConVars[ "VehicleLimit" ])
	
end

function CAKE.MaxEffects(ply)

	return tonumber(CAKE.ConVars[ "EffectLimit" ])
	
end

function CAKE.CreateSpawnTable(ply)
	
	CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())] = {}
	
	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
	spawntable.props = {}
	spawntable.ragdolls = {}
	spawntable.vehicles = {}
	spawntable.effects = {}

end


function GM:PlayerSpawnProp(ply, mdl)

	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
	
	if CAKE.PlayerRank(ply) <= 2 then
		
		if !util.tobool( CAKE.GetPlayerField(ply, "tooltrust") ) and !CAKE.ConVars[ "DefaultPropTrust" ] then -- require tt to spawn stuff.
			CAKE.SendChat(ply, "You are not allowed to spawn anything!")
			return false
		end
		
		if( PropIsBlacklisted( mdl )  and not CAKE.PlayerRank(ply) >= 3 ) then
	
		CAKE.SendChat(ply, "This prop is blacklisted! It cannot be spawned!")
		return false;
		end
		

		if(!spawntable) then
			CAKE.CreateSpawnTable(ply)
			spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
		end

		local spawned = 0
		for k, v in pairs(spawntable.props) do
			if(v != nil and v:IsValid()) then
				spawned = spawned + 1
			else
				spawntable.props[k] = nil -- No longer exists. Wipe it out.
			end
		end
		
		if(spawned >= CAKE.MaxProps(ply)) then
			CAKE.SendChat(ply, "You have reached your prop limit! (" .. CAKE.MaxProps(ply) .. "). Try using the Prop Sleeper for more props!")
			return false
		else
			return true
		end
		
	else
		CAKE.CreateSpawnTable(ply)
		return true
end
end

function GM:PlayerSpawnRagdoll(ply, mdl)

	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
	
	if CAKE.PlayerRank(ply) <= 2 then
	
		if !util.tobool( CAKE.GetPlayerField(ply, "tooltrust") ) and !CAKE.ConVars[ "DefaultPropTrust" ] then
			CAKE.SendChat(ply, "You are not allowed to spawn ragdolls!")
			return false
		end
		
		if(!spawntable) then
			CAKE.CreateSpawnTable(ply)
			spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
		end

		local spawned = 0
		for k, v in pairs(spawntable.ragdolls) do
			if(v != nil and v:IsValid()) then
				spawned = spawned + 1
			else
				spawntable.ragdolls[k] = nil -- No longer exists. Wipe it out.
			end
		end
		if(spawned >= CAKE.MaxRagdolls(ply)) then
			CAKE.SendChat(ply, "You have reached your ragdoll limit! (" .. CAKE.MaxRagdolls(ply) .. ")")
			return false
		else
			return true
		end
	else
		CAKE.CreateSpawnTable(ply)
		return true
	end
	
end

function GM:PlayerSpawnVehicle(ply)

	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
	
	if CAKE.PlayerRank(ply) <= 2 then

		if !util.tobool( CAKE.GetPlayerField(ply, "tooltrust") ) and !CAKE.ConVars[ "DefaultVehicles" ] then
			CAKE.SendChat(ply, "You are not allowed to spawn vehicles!")
			return false
		end

		if(!spawntable) then
			CAKE.CreateSpawnTable(ply)
			spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
		end

		local spawned = 0

		for k, v in pairs(spawntable.vehicles) do
			if(v != nil and v:IsValid()) then
				spawned = spawned + 1
			else
				spawntable.vehicles[k] = nil -- No longer exists. Wipe it out.
			end
		end
		
		if(spawned >= CAKE.MaxVehicles(ply)) then
			CAKE.SendChat(ply, "You have reached your limit! (" .. CAKE.MaxVehicles(ply) .. ")")
			return false
		else
			return true
		end
			
	
	else
		CAKE.CreateSpawnTable(ply)
		return true
	end
	
end

function GM:PlayerSpawnNPC( ply, class )

	return CAKE.PlayerRank( ply ) > 0

end


function GM:PlayerSpawnEffect(ply, mdl)

	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
	
	if CAKE.PlayerRank(ply) <= 2 then
	
		if(!tobool(CAKE.GetPlayerField(ply, "tooltrust")) and !CAKE.ConVars[ "DefaultPropTrust" ]) then
			CAKE.SendChat(ply, "You are not allowed to spawn effects!" )
			return false
		end
		
		if(!spawntable) then
			CAKE.CreateSpawnTable(ply)
			spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
		end
		
		local spawned = 0
		
		for k, v in pairs(spawntable.effects) do
			if(v and v:IsValid()) then
				spawned = spawned + 1
			else
				spawntable.effects[k] = nil -- No longer exists. Wipe it out.
			end
		end
		
		if(spawned >= CAKE.MaxEffects(ply)) then
			CAKE.SendChat(ply, "You have reached your limit! (" .. CAKE.MaxEffects(ply) .. ")")
			return false
		else
			return true
		end
		
	else
		CAKE.CreateSpawnTable(ply)
		return true
	end
	
end

function GM:PlayerSpawnedProp(ply, mdl, ent)

	if ( ent:GetPhysicsObject():GetMass() > 500 )  then
		if ( CAKE.PlayerRank(ply) < 3) then
			CAKE.SendChat(ply, "This prop is too big to be spawned.")
			ent:Remove()
			return
		end
	end

	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
	table.insert(spawntable.props, ent)
	
end

function GM:PlayerSpawnedRagdoll(ply, mdl, ent)

	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
	table.insert(spawntable.ragdolls, ent)
	
end

function GM:PlayerSpawnedVehicle(ply, ent)

	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
	table.insert(spawntable.vehicles, ent)
	
end

function GM:PlayerSpawnedEffect(ply, mdl, ent)

	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ply:SteamID())]
	table.insert(spawntable.effects, ent)
	
end

hook.Add( "PlayerLoadout", "TiramisuTooltrustLoadout", function( ply )

	if(!util.tobool(CAKE.GetPlayerField(ply, "tooltrust"))) then

		if CAKE.ConVars[ "DefaultGravgun" ] then
			ply:Give("weapon_physcannon")
		end
		if CAKE.ConVars[ "DefaultPhysgun" ] then
			ply:Give("weapon_physgun")
		end

	else
	
		ply:Give("gmod_tool")
		ply:Give("weapon_physcannon")
		ply:Give("weapon_physgun")
	
	end

end)

function Admin_Tooltrust(ply, cmd, args)

	if(#args != 2) then
	
		CAKE.SendChat( ply, "Invalid number of arguments! ( rp_admin tooltrust \"name\" value )" )
		return

	end
	
	local target = CAKE.FindPlayer(args[1])
	
	if !(target and target:IsValid() and target:IsTiraPlayer()) then
		CAKE.SendChat( ply, "Target not found!" )
		return
	end

	local toggle = util.tobool(args[2])

	if toggle then
		CAKE.SetPlayerField(target, "tooltrust", 1)
		CAKE.SendChat( target, "You have been granted tooltrust by " .. ply:Name() )
		CAKE.SendChat( ply, target:Name() .. " [" .. target:SteamID() .. "] | " .. target:Nick() .. " has been granted tooltrust" )

		if !CAKE.ConVars[ "DefaultPhysgun" ] then
			target:Give("weapon_physgun")
		end
		if !CAKE.ConVars[ "DefaultGravgun" ] then
			target:Give("weapon_physgun")
		end
		target:Give("gmod_tool")
	else
		CAKE.SetPlayerField(target, "tooltrust", 0)
		CAKE.SendChat( target, "Your tooltrust has been removed by " .. ply:Name() )
		CAKE.SendChat( ply, target:Name() .. " [" .. target:SteamID() .. "] | " .. target:Nick() .. " has been removed from tooltrust" )
		
		target:StripWeapon("gmod_tool")
		if !CAKE.ConVars[ "DefaultPhysgun" ] then
			target:StripWeapon("weapon_physgun")
		end
		if !CAKE.ConVars[ "DefaultGravgun" ] then
			target:StripWeapon("weapon_physgun")
		end
	end

end


hook.Add( "PhysgunPickup", "TiramisuPhysgunPickup", function( ply, ent )
	if CAKE.IsDoor( ent ) then
		return false
	end

	if IsValid(ent) then
		if ent:IsTiraPlayer() or ent:GetClass() == "item_prop" then
			return CAKE.PlayerRank(ply) > 0
		end
	end

end)

function PLUGIN.Init()

	CAKE.AddDataField( 1, "tooltrust", CAKE.ConVars[ "DefaultToolTrust" ] ) -- Is the player allowed to have the toolgun
	
	CAKE.AdminCommand( "tooltrust", Admin_Tooltrust, "Change someones tooltrust", true, true, 3 )
	
end