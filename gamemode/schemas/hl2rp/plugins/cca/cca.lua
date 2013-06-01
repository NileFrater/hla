local meta = FindMetaTable( "Player" )

function meta:IsCP()
	local clothing = CAKE.GetCharField(self,"clothing")
	if clothing == "clothing_police" or clothing == "clothing_soldier" or clothing == "clothing_elite" and clothing == "helmet_police" or clothing == "helmet_soldier" or clothing == "helmet_elite" then
		return true
	end
	return false
end