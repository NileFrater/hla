RCLICK.SubMenu = "General"
RCLICK.Name = "Crafting"

function RCLICK.Condition(target)

	return true

end

function RCLICK.Click(target,ply)

	RunConsoleCommand("CRAFTINGOpen")

end