local CRAFTING = {}

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
		{"watermelon",1}
	},
	results = {
		-- itemclass amount, u can have more than one result
		{"weapon_smg1",3},
		{"weapon_ar2",3},
	},

}

local meta = FindMetaTable( "Player" )

function meta:IsNear(reqTbl,reqTblKey)
	if reqTbl == nil then return false end
	-- props nearby
	local nearProps = {}
	for _,ent in pairs(ents.GetAll()) do
		if ent:GetPos():Distance(self:GetPos()) < 300 then
			table.insert(nearProps,ent)
		end 
	end
	-- now to check those props 
	if reqTblKey == nil then
		local pass = false
		for _,propTbl in pairs(reqTbl) do
			pass = false
			for _,model in pairs(propTbl) do
				for _,prop in pairs(nearProps) do
					if string.lower(model) == string.lower(prop:GetModel() or "") then
						pass = true
					end
				end
			end
			if pass == false then
				return false
			end
		end
	else
		local pass = false
		for _,model in pairs(reqTbl[reqTblKey]) do
			for _,prop in pairs(nearProps) do
				if string.lower(model) == string.lower(prop:GetModel() or "") then
					pass = true
				end
			end
		end
		if pass == false then
			return false
		end
	end
	return true
end


function meta:HasItemAmount( class, amount )
	local inventory = nil
	if CLIENT then
		inventory = CAKE.Containers[CAKE.Inventory]
	else
		inventory = self:GetInventory()
	end

	local count = 0
	for i=1, inventory.Height do
		for j=1, inventory.Width do
			if !inventory:IsSlotEmpty(j,i) and inventory.Items[i][j].class == class then 
				count = count + 1
			end
			if count >= amount then
				return true
			end
		end
	end
	return false
end

function meta:HasItems(itemTbl)
	for _,itemData in pairs(itemTbl) do
		if !self:HasItemAmount(itemData[1],itemData[2] or 1) then
			return false
		end
	end
	return true
end

function meta:HasRoom(key)

	local freeSlots = 0
	local reqSlots = 0

	for _,data in pairs(CRAFTING[key].ingredients) do
		freeSlots = freeSlots + (data[2] or 1)
	end

	for _,data in pairs(CRAFTING[key].results) do
		freeSlots = freeSlots + (data[2] or 1)
	end

	local inventory = nil
	if CLIENT then
		inventory = CAKE.Containers[CAKE.Inventory]
	else
		inventory = self:GetInventory()
	end

	if inventory:EmptySlots() + freeSlots < reqSlots then
		return false
	end
	return true
end


local function potential(ply) -- this finds out what the play could potentially craft
	ply = ply or LocalPlayer()
	local container = CAKE.Containers[CAKE.Inventory]
	local potentialTbl = {} -- what they can actually craft ( default = nothing )
	local addItem = false
	for key,data in pairs(CRAFTING) do
		addItem = false
		if ply:HasItems(data.ingredients) && ply:HasRoom(key) then
			table.insert(potentialTbl, key)
		end
	end

	return potentialTbl
end

local function availible(ply) -- this finds out what the play could potentially craft
	ply = ply or LocalPlayer()
	local container = CAKE.Containers[CAKE.Inventory]
	local potentialTbl = {} -- what they can actually craft ( default = nothing )
	local addItem = false
	for key,data in pairs(CRAFTING) do
		addItem = false
		if ply:IsNear(data.requirements) && ply:HasItems(data.ingredients) && ply:HasRoom(key) then
			table.insert(potentialTbl, key)
		end
	end

	return potentialTbl
end

if CLIENT then
	local lastCraft = nil
	local function buildRequirements(craftingData,backgroundPanel)
		local reqForm = vgui.Create( "DForm" , backgroundPanel)
		reqForm:SetName( "Requirements :" )
		reqForm:SetSpacing( 5 )
		reqForm:SetPadding( 5 )

		local reqPanel = vgui.Create( "DIconLayout", reqForm )
		reqPanel:SetSpaceX(5)
		reqPanel:SetSpaceY(5)

		for _,propTbl in pairs(craftingData.requirements) do
			local Icon = vgui.Create( "ContainerSlot_Icon", backgroundPanel)
			Icon:SetSize(48, 48)
			if table.Count(propTbl) > 1 then
				Icon.propTbl = propTbl
				Icon.key = 1
				Icon.think = function() 
								Icon.key = Icon.key + 1
								if Icon.key > table.Count(Icon.propTbl) then
									Icon.key = 1
								end
								Icon:SetModel(Icon.propTbl[Icon.key])
								timer.Simple(2,function() if Icon then Icon.think() end end)
							end
				Icon.think()
			else
				Icon:SetModel(propTbl[1])
			end
			Icon.PaintOver = function()
								if !LocalPlayer():IsNear(craftingData.requirements,_) then
									surface.SetDrawColor(155,55,55,155)
									surface.DrawRect(0,0,Icon:GetWide(),Icon:GetTall())
								end
							end			
			reqPanel:Add(Icon)
		end
		reqForm:AddItem(reqPanel)

		return reqForm
	end

	local function buildIngredients(craftingData,backgroundPanel)

		local inventory = CAKE.Containers[CAKE.Inventory]

		local ingForm = vgui.Create( "DForm" , backgroundPanel)
		ingForm:SetName( "Ingredients :" )
		ingForm:SetSpacing( 5 )
		ingForm:SetPadding( 5 )

		local reqPanel = vgui.Create( "DIconLayout", ingForm )
		reqPanel:SetSpaceX(5)
		reqPanel:SetSpaceY(5)

		for _,data in pairs(craftingData.ingredients) do
			local Icon = vgui.Create( "ContainerSlot_Icon", backgroundPanel)
			Icon:SetSize(48, 48)

			Icon:SetModel(CAKE.ItemData[ data[1] ].Model)
			Icon.PaintOver = function()
								if !inventory:HasItem( data[1] ) then
									surface.SetDrawColor(155,55,55,155)
									surface.DrawRect(0,0,Icon:GetWide(),Icon:GetTall())
								end
							end

			if data[2] != nil && data[2] > 1 then
				local iconLabel = vgui.Create("DLabel", Icon)
				iconLabel:SetText("x"..data[2])
				iconLabel:SizeToContents()

				local labelX = Icon:GetWide() - iconLabel:GetWide() - (Icon:GetWide()*(1/8))
				local labelY = Icon:GetTall() - iconLabel:GetTall() - (Icon:GetTall()*(1/8))

				iconLabel:SetPos(labelX, labelY)
				iconLabel.PaintOver = function() 
											if !inventory:HasItemAmount(data[1] ,data[2]) then
												iconLabel:SetTextColor(155,55,55,255)
											else
												iconLabel:SetTextColor(255,255,255,255)
											end

										end
			end
	
			reqPanel:Add(Icon)
		end
		ingForm:AddItem(reqPanel)

		return ingForm
	end

	local function buildResults(craftingData,backgroundPanel)
		local resForm = vgui.Create( "DForm" , backgroundPanel)
		resForm:SetName( "Results :" )
		resForm:SetSpacing( 5 )
		resForm:SetPadding( 5 )

		local reqPanel = vgui.Create( "DIconLayout", resForm )
		reqPanel:SetSpaceX(5)
		reqPanel:SetSpaceY(5)

		for _,data in pairs(craftingData.results) do
			local Icon = vgui.Create( "ContainerSlot_Icon", backgroundPanel)
			Icon:SetSize(64, 64)

			Icon:SetModel(CAKE.ItemData[ data[1] ].Model)

			if data[2] != nil && data[2] > 1 then
				local iconLabel = vgui.Create("DLabel", Icon)
				iconLabel:SetText("x"..data[2])
				iconLabel:SizeToContents()

				local labelX = Icon:GetWide() - iconLabel:GetWide() - (Icon:GetWide()*(1/8))
				local labelY = Icon:GetTall() - iconLabel:GetTall() - (Icon:GetTall()*(1/8))

				iconLabel:SetPos(labelX, labelY)
			end

			reqPanel:Add(Icon)
		end
		resForm:AddItem(reqPanel)

		return resForm
	end

	local function createPreview(key, parent)
		local craftingData = CRAFTING[key]
		local backgroundPanel = vgui.Create( "DPanelList", parent )
		backgroundPanel:Dock( LEFT )
		backgroundPanel:SetSize(280,340)
		backgroundPanel:SetPos(10,30)
		backgroundPanel.Paint = function() end
		backgroundPanel:DockMargin( 0, 0, 5, 0 )
		backgroundPanel:SetPadding(5)
		backgroundPanel:SetSpacing(5)
		backgroundPanel:EnableHorizontal(false)
		backgroundPanel:EnableVerticalScrollbar(true)

		backgroundPanel:AddItem(buildRequirements(craftingData,backgroundPanel))
		backgroundPanel:AddItem(buildIngredients(craftingData,backgroundPanel))
		backgroundPanel:AddItem(buildResults(craftingData,backgroundPanel))

		local backButton = vgui.Create("DButton")
		backButton:SetTall(20)
		backButton:SetText("Back To Crafting Menu")
		backButton.DoClick = function()
			parent.createList(parent)
			backgroundPanel:Remove()
		end

		local craftButton = vgui.Create("DButton")
		craftButton:SetTall(20)
		craftButton:SetText("Craft Item(s)")
		craftButton.DoClick = function()
			RunConsoleCommand("craftItem",key)
			lastCraft = key
			parent:Remove()
		end

		backgroundPanel:AddItem(craftButton)
		backgroundPanel:AddItem(backButton)

	end
	local function createList(parent)
		craftingList = vgui.Create( "DListView" , parent )
		craftingList:SetSize(280,340)
		craftingList:SetPos(10,30)
		craftingList:AddColumn("Crafting Recipe")

		local name = ""

		for _,key in pairs(potential(ply)) do
			name = ""
			for _,data in pairs(CRAFTING[key].results) do
				name = name .. ( CAKE.ItemData[ data[1] ].Name or data[1] ) 
				if data[2] and data[2] > 1 then
					name = name .. " x" ..data[2]
				end
				if _ < table.Count(CRAFTING[key].results) then
					name = name .. " and "
				end
			end
			local line = craftingList:AddLine(name)
			line.key = key
			local oldPaint = line.Paint
			line.Paint = function() 
				if !LocalPlayer():IsNear(CRAFTING[line.key].requirements) then
					surface.SetDrawColor(155,55,55,255)
					surface.DrawRect(0,0,line:GetWide(),line:GetTall()-1)
				end
				if lastCraft == line.key then
					surface.SetDrawColor(155,155,155,155)
					surface.DrawRect(0,0,line:GetWide(),line:GetTall()-1)
				end
			end
		end

		craftingList.OnClickLine = function( panel , line )
			parent.createPreview(line.key,parent)
			craftingList:Remove()
		end
	end

	local craftingFrame = nil
	local function craftingOpen()
		local ply = LocalPlayer()
		if craftingFrame then
			craftingFrame:Remove()
		end
		craftingFrame = vgui.Create( "DFrame" )
		craftingFrame:SetTitle("Crafting Menu")
		craftingFrame:SetSize(300,380)
		craftingFrame:Center()
		craftingFrame:MakePopup()
		craftingFrame.createList = createList
		craftingFrame.createPreview = createPreview
		craftingFrame.createList(craftingFrame)

	end
	concommand.Add("craftingOpen", craftingOpen)
else

	function meta:CraftItem(key)
		local proceed = false
		for _,value in pairs(availible(self)) do
			if value == key then
				proceed = true
			end
		end
		if proceed then
			local craftData = CRAFTING[key]
			local inventory = self:GetInventory()
			for _,data in pairs(craftData.ingredients) do
				for i = 1, (data[2] or 1) do
					inventory:TakeItemID(inventory:HasItem(data[1])) 
				end
			end
			for _,data in pairs(craftData.results) do
				for i = 1, (data[2] or 1) do
					inventory:AddItem(data[1], CAKE.CreateItemID()) 
				end
			end
			self:EmitSound("items/battery_pickup.wav")
		end
	end
	concommand.Add("craftItem", function(ply,cmd,args) ply:CraftItem(args[1]) end)
end

