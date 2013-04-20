CRAFTING = {}

CRAFTING["bat"] = {
-- insert model names here
-- this means that u need these models within 300 units to craft it
-- the way it works is that u can insert a set of models, if one of them is found then that set requirement is satisfied
-- for example, I have 4 sink models so the set would look like {"sink1.mdl","sink2.mdl","sink3.mdl","sink4.mdl"}
-- table would look like requirements = { {"sink1.mdl","sink2.mdl","sink3.mdl","sink4.mdl"} }
-- if ONE sink is found that is satisfied ( i.e water source is nearby )
	requirements = {{"models/props_c17/furnituresink001a.mdl"}, {"models/props_c17/furniturestove001a.mdl"}},
	-- takes {itemClass,amount (default is 1)}
	ingredients = { 
		{"milkjug"},
		{"watermelon",3}
	},
	result = {
		-- itemclass amount, u can have more than one result
		{"weapon_smg"},
	},

}


if CLIENT then
	local craftingFrame = nil
	function craftingOpen()
		local ply = LocalPlayer()
		
	end
	concommand.Add("craftingOpen","craftingOpen", function(ply,cmd,args) craftingOpen() end)
else

end