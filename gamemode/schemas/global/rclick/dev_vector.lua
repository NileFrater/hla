RCLICK.Name = "Developer Info"
RCLICK.SubMenu = "Admin"

function RCLICK.Condition(target)

if CAKE.IsDoor( target ) and LocalPlayer():GetNWInt( "TiramisuAdminLevel", 0 ) > 3 then return true end

end

function RCLICK.Click(target,ply)
	
	print( "==DEV INFORMATION ==" )
	print( target:EntIndex() )
	print( target:GetPos() )
	print( "==END DEV INFORMATION ==" )
	

end