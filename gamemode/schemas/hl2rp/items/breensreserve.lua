ITEM.Name = "Breen's Reserve"
ITEM.Class = "breensreserve"
ITEM.Description = "Breen's 'special' water"
ITEM.Model = "models/props_junk/popcan01a.mdl"
ITEM.Purchaseable = true
ITEM.Price = 4
ITEM.ItemGroup = 1
ITEM.Hunger = 4

 function ITEM:Drop(ply)
 
 end

 function ITEM:UseItem(ply)
 
   ply:TakeItem("breensreserve")
   ply:SetHunger(ply:GetHunger() + self.Hunger)  
   self:Remove()
 
 end
