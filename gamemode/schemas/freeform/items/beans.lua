ITEM.Name = "Refried Beans"
ITEM.Class = "beans"
ITEM.Description = "It expired a month ago.."
ITEM.Model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.Purchaseable = true
ITEM.Price = 3
ITEM.ItemGroup = 1
ITEM.Hunger = 10
function ITEM:Drop(ply)

end

function ITEM:Pickup(ply)

	self:Remove()

end

function ITEM:UseItem(ply)
	
	ply:SetHunger(ply:GetHunger() + self.Hunger)
	self:Remove()

end
