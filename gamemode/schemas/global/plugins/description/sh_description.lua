local meta = FindMetaTable( "Player" )

function meta:Title2()
	return self:GetNWString( "title2", "" )
end
