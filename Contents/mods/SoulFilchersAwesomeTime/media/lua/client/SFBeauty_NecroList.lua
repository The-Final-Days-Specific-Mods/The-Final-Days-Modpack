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
		print ("[NecroForge] - Adding SFBeautifyingTime to NecroForge");
		NecroList.Items.SFBeauty1 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Cyan)", "filcher.HairDyeCyan", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty2 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Dark Blue)", "filcher.HairDyeDarkBlue", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty3 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Olive)", "filcher.HairDyeOlive", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty4 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Orange)", "filcher.HairDyeOrange", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty5 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Purple)", "filcher.HairDyePurple", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty6 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Turquoise)", "filcher.HairDyeTurquoise", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty7 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Grey)", "filcher.HairDyeGrey", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty8 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Lilac)", "filcher.HairDyeLilac", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty9 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Lime)", "filcher.HairDyeLime", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty10 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Magenta)", "filcher.HairDyeMagenta", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty11 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Cherry)", "filcher.HairDyeCherry", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty12 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Dark Brown)", "filcher.HairDyeDarkBrown", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty13 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Auburn)", "filcher.HairDyeAuburn", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty14 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Avocado)", "filcher.HairDyeAvocado", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty15 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Deep Purple)", "filcher.HairDyeDeepPurple", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty16 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Light Blonde)", "filcher.HairDyeLightBlonde", "media/textures/Item_HairDye.png", nil, nil, nil};
		NecroList.Items.SFBeauty17 = {"Mods", "SFBeauty", nil, "SFBeauty - Hair Dye (Snow White)", "filcher.HairDyeSnowWhite", "media/textures/Item_HairDye.png", nil, nil, nil};
	end
end)