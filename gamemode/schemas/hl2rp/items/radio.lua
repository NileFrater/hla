ITEM.Name = "Radio"
ITEM.Class = "radio"
ITEM.Description = "Allows the user to tune into radio chat"
ITEM.Model = "models/props_lab/citizenradio.mdl"
ITEM.Purchaseable = false
ITEM.Price = 8
ITEM.ItemGroup = 1
ITEM.Reusable = true

function ITEM:Drop(ply)
	print("dropped")
	if !ply:HasItem("radio") then
		print("hwer")
		umsg.Start( "Tiramisu.CloseRadio", ply )
		umsg.End()
	end
end

function ITEM:Pickup(ply)
	umsg.Start( "Tiramisu.OpenRadio", ply )
	umsg.End()
	self:Remove()
end

function ITEM:UseItem(ply)

	self:Remove()

end