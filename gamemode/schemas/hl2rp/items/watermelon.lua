ITEM.Name = "Watermelon"
ITEM.Class = "watermelon"
ITEM.Description = "Watch out, that black man might steal it."
ITEM.Model = "models/props_junk/watermelon01.mdl"
ITEM.Purchaseable = true
ITEM.Price = 10
ITEM.ItemGroup = 1
ITEM.Hunger = 10

function ITEM:Drop(ply)

end

function ITEM:Pickup(ply)

	self:Remove()

end

function ITEM:UseItem(ply)

	ply:SetHunger(ply:GetHunger() + self.Hunger)
	ply:SetHealth(math.Clamp(ply:Health() + 15, 0, ply:GetMaxHealth()))
	self:Remove()

end
