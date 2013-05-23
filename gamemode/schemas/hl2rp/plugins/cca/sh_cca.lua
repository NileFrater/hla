local meta = FindMetaTable( "Player" )

function meta:IsCP()
	local clothing = "none"
	if CLIENT then
		clothing = CAKE.Clothing
	else
		clothing = CAKE.GetCharField(self,"clothing")
	end
	if string.match(clothing, "clothing_police") or string.match(clothing, "clothing_soldier") or string.match(clothing, "clothing_elite") then
		return true
	end
	return false
end

