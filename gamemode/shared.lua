CAKE.Name = string.Replace( GM.Folder, "gamemodes/", "" )

local meta = FindMetaTable( "Player" )

function meta:CanTraceTo( ent, filter ) -- Can the player and the entity "see" eachother?
	filter = self
	local trace = {  }
	if CLIENT and self == LocalPlayer() then
		trace.start = CAKE.CameraPos
	else
		trace.start = self:EyePos()
	end
	if ent:IsTiraPlayer() then
		trace.endpos = ent:EyePos()
	else
		trace.endpos = ent:GetPos()
	end
	trace.filter = filter
	trace.mask = CONTENTS_SOLID
	
	local tr = util.TraceLine( trace )
	
	if !tr.HitWorld or tr.Entity == ent then return true end
	
	return false

end

function meta:Nick( ) -- Hotfix. Allows you to fetch a character's name quickly.
	return self:GetNWString( "name", "Unnamed" )
end

function meta:Title()
	return self:GetNWString( "title", "" )
end



--Calculates the position where an item should be created when dropped.
function meta:CalcDrop( )

	local pos = self:GetShootPos( )
	local ang = self:GetAimVector( )
	local tracedata = {  }
	tracedata.start = pos
	tracedata.endpos = pos+( ang*80 )
	tracedata.filter = self
	local trace = util.TraceLine( tracedata )
	
	return trace.HitPos
	
end

--Does the player have a character currently loaded?
function meta:IsCharLoaded()
	
	return self:GetNWBool( "charloaded", false )

end

--Returns a door's title
function CAKE.GetDoorTitle( door )
	return door:GetNWString( "doortitle", "" )
end

-- This formats a player's SteamID for things such as data file names
-- For example, STEAM_0:1:5947214 would turn into 015947214
function CAKE.FormatText( SteamID )

	local SteamID = SteamID or "STEAM_0:0:0"

	s = string.gsub( SteamID,"STEAM","" )
	s = string.gsub( s,":","" )
	s = string.gsub( s,"_","" )
	s = string.gsub( s," ","" )
	
	return s
	
end

--Finds a player based on its OOC name, its IC name or its SteamID
function CAKE.FindPlayer(name)
	local count = 0

	local name = name:lower()

	for _, ply in pairs(player.GetAll()) do
		if game.SinglePlayer() then
			return ply --There'll be just one player on the game, so return the sole player that should be on the player list.
		end
		if string.lower(ply:Nick()):match(name) or string.lower(ply:Name()):match(name) or string.lower(ply:SteamID()):match(name) or CAKE.FormatText(ply:SteamID()):match( name ) then
			return ply
		end	
	end
	
	return false
	
end

function CAKE.RadioEmit(ply)

local radiooffsounds = {
		"npc/metropolice/vo/off1.wav",
		"npc/metropolice/vo/off2.wav",
		"npc/metropolice/vo/off3.wav",
		"npc/metropolice/vo/off4.wav"
	};

local radioonsounds = {
		"npc/metropolice/vo/on1.wav",
		"npc/metropolice/vo/on2.wav"
	};
	
	local randomOff = radiooffsounds[ math.random(1, #radiooffsounds) ]
	local randomOn = radioonsounds[ math.random(1, #radioonsounds) ]
	local randomSound = CAKE.chattervoices[ math.random(1, #CAKE.chattervoices) ]
	ply:EmitSound( randomOn, 60)
	timer.Simple(0.5 , function() ply:EmitSound( randomSound.sound, 60) end )
	timer.Simple(2 , function() ply:EmitSound( randomOff, 60) end )

end

hook.Add("Think", "Tiramisu.RadioEmitThink", function()

	for k,v in pairs(player.GetAll()) do
		if v:IsCP() then
		local curTime = CurTime()
		
			if (!v.nextChatterEmit) then
			local durr = curTime + math.random(30, 50)
				v.nextChatterEmit = durr
			end
			
			if ( (curTime >= v.nextChatterEmit) ) then
				v.nextChatterEmit = nil
				
				CAKE.RadioEmit(v)
			end
		end
	end

end)