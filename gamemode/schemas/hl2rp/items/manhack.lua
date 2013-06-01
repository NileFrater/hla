ITEM.Name = "Manhack Deployer"
ITEM.Class = "manhack_deployer"
ITEM.Description = "Use this to deploy a manhack."
ITEM.Model = "models/props_lab/jar01b.mdl"
ITEM.Purchaseable = true
ITEM.Price = 3
ITEM.ItemGroup = 1

function ITEM:Drop(ply)

end

function ITEM:Pickup(ply)

	self:Remove()

end

function ITEM:UseItem(ply)
	ply:PlayEmote("deploy")
	timer.Simple(1,function()
                local mhack = ents.Create("npc_manhack")
                mhack:SetKeyValue("spawnflags", 65536)//Start Packed up
				mhack:SetKeyValue("spawnflags", 512) // Will fade when destroyed
                mhack:SetPos(ply:EyePos()+ply:EyeAngles():Forward()*10)
                mhack:SetAngles(ply:GetAngles())
                mhack:Spawn()
				mhack:AddEntityRelationship(ply, ply:IsCP() and D_LI or D_HT, 99)
                mhack:Fire("Unpack","",0)
            end)
	self:Remove()

end
