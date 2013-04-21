function ccaDoorKick(ply,cmd,args)
	local trace = ply:GetEyeTrace()
	if !trace.Hit then return false end
	local door = trace.Entity
	local distance = door:GetPos():Distance(ply:GetPos())
	if distance < 180 then	
		if ply:OnGround() then
			umsg.Start( "Tiramisu.Freescroll", ply )
				umsg.Bool( true )
			umsg.End()
			ply:SetNWBool( "kickingdoor", true )
			ply:Freeze( true )
			timer.Simple(.6, function() flyOpen(door) end)
			timer.Simple(1.7,function() 
				ply:SetNWBool( "kickingdoor", false )
				ply:Freeze( false )
				umsg.Start( "Tiramisu.Freescroll", ply )
					umsg.Bool( false )
				umsg.End()
			end)
		end
	end
end
concommand.Add("rp_kickdoor", ccaDoorKick)
concommand.Add("DoorKick", ccaDoorKick)
