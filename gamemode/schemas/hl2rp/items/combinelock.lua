ITEM.Name = "Door lock"
ITEM.Class = "combinelock"
ITEM.Description = ""
ITEM.Model = "models/props_combine/combine_lock01.mdl"
ITEM.Purchaseable = false
ITEM.Price = 4
ITEM.ItemGroup = 1
ITEM.Reusable = true

function ITEM:Drop(ply)

end

function ITEM:Pickup(ply)

	self:Remove()

end

function ITEM:UseItem(ply)

	self:Remove()

	local trace = ply:GetEyeTraceNoCursor()

	if !trace.Hit then return true end
	local target = trace.Entity
	local distance = target:GetPos():Distance(ply:GetPos())

	if distance < 250 then
		if IsValid(target) then 
			if CAKE.IsDoor(target) && string.lower(target:GetModel()) != "models/props_c17/door02_double.mdl" then 
				local doorlock = ents.Create("ent_doorlock")
				doorlock:Spawn()
				doorlock:SetDoor(target)
			end
		end
	end
end

