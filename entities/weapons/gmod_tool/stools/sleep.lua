TOOL.Category		= "Half-Life: Aftermath"
TOOL.Name			= "#Prop Sleeper"
TOOL.Command		= nil
TOOL.ConfigName		= ""





if (CLIENT) then
	language.Add( "Tool.sleep.name", "Prop Sleeper" )
	language.Add( "Tool.sleep.desc", "DeathByKittens' Prop Sleeping Tool" )
	language.Add( "Tool.sleep.0", "Left Click: Sleep a Prop   Right Click: Wake up a Prop" )
end

function TOOL:LeftClick( trace ) // Putting a Prop to Sleep

	if (!trace.Entity) then return false end
	if (!trace.Entity:IsValid()) then return false end
	if (trace.Entity:IsPlayer()) then return false end	
	if (trace.Entity:GetClass() != "prop_physics" ) then return false end
	
	if ( CLIENT ) then return true end
	
	if (trace.Entity:GetPhysicsObjectCount() > 2 ) then return false end // Greedy
		
	local ent = trace.Entity
	local ply = self:GetOwner()

	if ( ent:GetMoveType() == MOVETYPE_NONE )  then return false end // Already asleep!
	if ( ent:GetTable().NoTouch )  then return false end
	
	ent:GetTable().NoTouch = true
	ent:GetTable().OldMoveType = ent:GetMoveType()
	ent:SetMoveType(MOVETYPE_NONE)
	local phys = ent:GetPhysicsObject()
	if not phys:IsValid() then return false end
	phys:EnableGravity( false )
	phys:EnableMotion( false )
	phys:EnableDrag( false )
	phys:Sleep()
	print( ent:GetTable().CreatorSteamID )
	local spawntable = CAKE.SpawnTable[ent:GetTable().CreatorSteamID]
	
		if(!spawntable) then
			CAKE.CreateSpawnTable(ply)
			spawntable = CAKE.SpawnTable[CAKE.FormatText(ent:GetTable().CreatorSteamID)]
		
		local spawned = 0
		for k, v in pairs(spawntable.props) do
			if(v != nil and v:IsValid()) then
				spawned = spawned - 1
			else
				spawntable.props[k] = nil -- No longer exists. Wipe it out.
			end
		end
		
		if(spawned >= CAKE.MaxProps(ply)) then
			CAKE.SendChat(ply, "You have reached your prop limit! (" .. CAKE.MaxProps(ply) .. ")")
			return false
		else
			return true
		end
		
	else
		CAKE.CreateSpawnTable(ply)
		return true
	end
	
	return true

end

function TOOL:RightClick( trace ) // And Waking it up

    if (!trace.Entity) then return end
	if (!trace.Entity:IsValid()) then return end
	if (trace.Entity:IsPlayer()) then return end	
	if (trace.Entity:GetClass() != "prop_physics" ) then return false end
    
	if ( CLIENT ) then return true end
    
	if (trace.Entity:GetPhysicsObjectCount() > 2 ) then return false end
	if (trace.Entity:GetMoveType() != MOVETYPE_NONE )  then return false end
    
	local ent = trace.Entity
    local ply = self:GetOwner()

	ent:GetTable().NoTouch = false
	ent:SetMoveType(ent:GetTable().OldMoveType)
	local phys = ent:GetPhysicsObject()
	if not phys:IsValid() then return false end
	phys:EnableGravity( true )
	phys:EnableMotion( true )
	phys:EnableDrag( true )
	phys:Wake()
	
	local spawntable = CAKE.SpawnTable[CAKE.FormatText(ent:GetTable().CreatorSteamID)]

	if(!spawntable) then
			CAKE.CreateSpawnTable(ply)
			spawntable = CAKE.SpawnTable[CAKE.FormatText(ent:GetTable().CreatorSteamID)]

		local spawned = 0
		for k, v in pairs(spawntable.props) do
			if(v != nil and v:IsValid()) then
				spawned = spawned + 1
			else
				spawntable.props[k] = nil -- No longer exists. Wipe it out.
			end
		end
		
		if(spawned >= CAKE.MaxProps(ply)) then
			CAKE.SendChat(ply, "You have reached your prop limit! (" .. CAKE.MaxProps(ply) .. ")")
			return false
		else
			return true
		end
		
	else
		CAKE.CreateSpawnTable(ply)
		return true
	end
	
end
    