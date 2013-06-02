concommand.Add( "rp_voice", function(ply, cmd, args)
	local id = args[ 1 ]
	
	if !CAKE.Voices[ id ] then
		CAKE.SendError( ply, "This sound does not exist. Use rp_listvoices" )
		return
	end

	if !CAKE.CanVoice(ply, CAKE.Voices[ id ].Group) then
		CAKE.SendError( ply, "You don't have permission to use that voice." )
		return		
	end

	local voice = CAKE.Voices[ id ]

	local path
	if ply:GetGender() == "Female" then
		path = CAKE.Voices[ id ].FemalePath
	else
		path = CAKE.Voices[ id ].MalePath
	end

	util.PrecacheSound( path )
	ply:EmitSound( path )
end )

concommand.Add( "rp_listvoices", function(ply, cmd, args)

	CAKE.SendConsole( ply, "---List of Voices---" )
	CAKE.SendConsole( ply, "Please note, these are only for your current permissions" )
	
	for voicegroup, _ in pairs(CAKE.VoiceGroups) do

		if CAKE.CanVoice(ply, voicegroup) then
			CAKE.SendConsole( ply, "--" .. voicegroup .. "--\n\n" )
			for k, v in pairs(CAKE.Voices) do
				if v.Group == voicegroup then
					CAKE.SendConsole( ply, k .. " - " .. voice.Name .. " - " .. voice.MalePath )
				end
			end
			CAKE.SendConsole( ply, "\n")
		end
	end
	
end )



-- Here we check if what a player just said is worthy of a sound or not.
function CAKE.VoiceCheck( ply, text )
 
	local vcmtext = text
	-- Lets first make sure the player is a CP
	if ply:IsCP() then
		IsACombine = true
	else
		IsACombine = false
	end
		-- And whether or not they are, we're about to check the huge voice tables from sh_voice
		for k, v in pairs(CAKE.voices) do
			if ( (v.faction == "Combine" and IsACombine == true ) or ( v.faction == "Human" and IsACombine == false) ) then
				print( text )
				if ( string.lower(vcmtext) == string.lower(v.command) ) then
						voice = {
								global = false,
								volume = 80,
								sound = v.sound,
								phrase = v.phrase
						}
						VoiceDone = false
						if (v.female and ply:GetGender() == "Female") then
							voice.sound = string.gsub(voice.sound, "/male", "/female")
						end
				end
			end	
			
			if voice then
				if VoiceDone == true then
				print( "Jobby?")
				return false
			else
				print ( "about to emit" )
				ply:EmitSound(voice.sound, voice.volume)
				return voice.phrase	
			end	
			end
	
		end 
	end