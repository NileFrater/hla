local function purchaseRation(ply,cmd,args)
	local ent = ents.GetByIndex(tonumber(args[1]))
	if ply:GetPos():Distance(ent:GetPos()) < 300 then
		if ply:GetNWInt( "money" ) >= 0 then
			--CAKE.ChangeMoney( ply, -1 )
			local sequence = ent.dispenser:LookupSequence("dispense_package" )
			ent.dispenser:ResetSequence( sequence )
			local sequence = ent.dispenser:LookupSequence( "idle" )
			timer.Simple(5,function() if IsValid(ent.dispenser) then ent.dispenser:ResetSequence( sequence ) end end)
		end
	end
end
concommand.Add("rp_buyration", purchaseRation)