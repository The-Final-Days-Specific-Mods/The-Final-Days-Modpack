------------------------------------------------------------------------------------------------------------------
-- Notes:
-- All Mod Items should appear in "Mods" Category. 
-- Until they get their own Buttons, they get a Prefix in name.
-- Mod Item Icons - keep the "media/textures/Item_IconName.png" format, it's good for performance.
------------------------------------------------------------------------------------------------------------------
-- {"Category Name" x 3, "Display Name", "Module.ItemID", "Item_(Icon)", R, G, B, Function, State, Extra, X, Y, Z}
------------------------------------------------------------------------------------------------------------------
-- Plug-In Code based on NF Plug-In code by blindcoder.
------------------------------------------------------------------------------------------------------------------
-- Supported Mods: By Mod ID
--
------------------------------------------------------------------------------------------------------------------

Events.OnGameStart.Add( function ()
	if NecroList then
		print ("[NecroForge] - Adding EgnhAlakingTime to NecroForge");
		NecroList.Items.EgnhAlak1 = {"Mods", "Egnh Alak", nil, "Emperador Bottle", "archer.Empilight", "media/textures/Item_EmperadorBottle.png", nil, nil, nil};
		NecroList.Items.EgnhAlak2 = {"Mods", "Egnh Alak", nil, "Gin Bottle", "archer.Gin", "media/textures/Item_Gin.png", nil, nil, nil};
		NecroList.Items.EgnhAlak3 = {"Mods", "Egnh Alak", nil, "Pale Pilsen Bottle", "archer.PalePilsenBottle", "media/textures/Item_PalePilsenBottle.png", nil, nil, nil};
		NecroList.Items.EgnhAlak4 = {"Mods", "Egnh Alak", nil, "Pale Pilsen Can", "archer.PalePilsenCan", "media/textures/Item_PalePilsenCan.png", nil, nil, nil};
		NecroList.Items.EgnhAlak5 = {"Mods", "Egnh Alak", nil, "Red Horse Bottle", "archer.RedHorse", "media/textures/Item_RedHorseBottle.png", nil, nil, nil};
		NecroList.Items.EgnhAlak6 = {"Mods", "Egnh Alak", nil, "Soju Bottle", "archer.Soju", "media/textures/Item_Soju.png", nil, nil, nil};
		NecroList.Items.EgnhAlak7 = {"Mods", "Egnh Alak", nil, "Jose Cuervo Bottle", "archer.TequilaCuervo", "media/textures/Item_Tequila.png", nil, nil, nil};
	end
end)