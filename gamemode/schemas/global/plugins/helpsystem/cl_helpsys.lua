
function OpenHelpSys(whattable)

 local helpname = (whattable.blah)
 print ( whattable.blah )
 
 for k,v in pairs (whattable.Pages) do
		
 
 end


local HelpSysFrame = vgui.Create( "DFrame" )  
HelpSysPanel:SetSize( 400, 400 )              
HelpSysPanel:Center()           
HelpSysPanel:SetTitle( helpname ) // Set the title
HelpSysPanel:SetVisible( true )               
HelpSysPanel:SetDraggable( true )             
HelpSysPanel:ShowCloseButton( true )         
HelpSysPanel:MakePopup()                      

local HelpSysImage = vgui.Create( "DImage", HelpSysFrame )
HelpSysImage:Center()
HelpSysImage:SetImage( "Brick/brickfloor001a.vtf" ) -- Set your .vtf image
HelpSysImage:SizeToContents()
end

ExampleTutorial = {

			blah = "Example Tutorial Name"
}

ExampleTutorial.Pages = {
	["page1"] = {
		["text"] = {
			["title"] = "Title text goes here",
			["body"] = "Body Text Goes here"
		},
		["image"] = "materials/CarlRP/lockpick/right"
	},
	["page2"] = {
		["text"] = {
			["title"] = "Second Title text goes here",
			["body"] = "Second Body Text Goes here"
		},
		["image"] = "materials/CarlRP/lockpick/wrong"
	},
	["page3"] = {
		["text"] = {
			["title"] = "Third Title text goes here",
			["body"] = "Third Body Text Goes here"
		},
		["image"] = "materials/CarlRP/lockpick/pick"
	},
}

function DoTutorial()
OpenHelpSys(ExampleTutorial)
end

concommand.Add("rp_helpsys", DoTutorial)

