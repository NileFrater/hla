ITEM.Name = "Milk Carton"
ITEM.Class = "milkcarton"
ITEM.Description = "I doubt this is cow milk."
ITEM.Model = "models/props_junk/garbage_milkcarton002a.mdl"
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
	ply:SetHealth(math.Clamp(ply:Health() + 5, 0, ply:GetMaxHealth()))
	self:Remove()

end
