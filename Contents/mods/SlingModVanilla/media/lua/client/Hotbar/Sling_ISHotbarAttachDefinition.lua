require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local Sling = {
	type = "Sling",
	name = "Back",
	animset = "belt left",
	attachments = {
		SawnOff = "Slinged Rifle",
		Rifle = "Slinged Rifle",
		Shotgun = "Slinged Shotgun",
		Shovel = "Slinged Rifle2",
		BigBlade = "Slinged Katana2",
		BigWeapon = "Slinged Axe",
	},
}






table.insert(ISHotbarAttachDefinition, Sling);



local SlingAlt3 = {
	type = "SlingAlt3",
	name = "Back",
	animset = "belt right",
	attachments = {
		SawnOff = "Slinged Rifle4",
		Rifle = "Slinged Rifle4",
		Shotgun = "Slinged Rifle4",
		Shovel = "Slinged Rifle3",
		BigBlade = "Slinged Katana",
		BigWeapon = "Slinged AxeX",
	},
}
table.insert(ISHotbarAttachDefinition, SlingAlt3);

table.remove(ISHotbarAttachDefinition.replacements);
local BackReplacement = {
	type = "Bag",
	name = "Back",
	animset = "back",
	replacement = {
		BigWeapon = "Big Weapon On Back with Bag",
		BigBlade = "Big Blade On Back with Bag",
		Racket = "Racket Back with Bag",
		Shovel = "Shovel Back with Bag",
		Guitar = "null",
		GuitarAcoustic = "null",
		Pan = "Pan On Back with Bag";
		Rifle = "Rifle On Back with Bag",
		Saucepan = "Saucepan Back with Bag",
	}
}
table.insert(ISHotbarAttachDefinition.replacements, BackReplacement);