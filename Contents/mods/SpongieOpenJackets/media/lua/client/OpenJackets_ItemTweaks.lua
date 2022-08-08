
if getActivatedMods():contains("ItemTweakerAPIExtraClothingAddon") then 
	require("ItemTweaker_ExtraClothingOptions");
else return end

local function AddNewExtraItem(currentItem, newItem, currentContextMenu, newContextMenu)

	ItemTweaker.AddOrReplaceClothingOption(currentItem, newItem, newContextMenu);
	ItemTweaker.AddOrReplaceClothingOption(newItem, currentItem, currentContextMenu);
	
	TweakItem(currentItem, "clothingExtraSubmenu", currentContextMenu)
	TweakItem(newItem, "clothingExtraSubmenu", newContextMenu)
	
end

-- jackets
AddNewExtraItem("Jacket_WhiteTINT", "Jacket_WhiteOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_Fireman", "Jacket_FiremanOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_Chef", "Jacket_ChefOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_ArmyCamoDesert", "Jacket_ArmyCamoDesertOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_ArmyCamoGreen", "Jacket_ArmyCamoGreenOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_Police", "Jacket_PoliceOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_Ranger", "Jacket_RangerOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_CoatArmy", "Jacket_CoatArmyOPEN", "CloseJacket", "OpenJacket");

AddNewExtraItem("Jacket_Varsity", "Jacket_VarsityOPEN", "CloseJacket", "OpenJacket");

AddNewExtraItem("JacketLong_Doctor", "JacketLong_DoctorOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("JacketLong_Random", "JacketLong_RandomOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("JacketLong_Santa", "JacketLong_SantaOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("JacketLong_SantaGreen", "JacketLong_SantaGreenOPEN", "CloseJacket", "OpenJacket");

AddNewExtraItem("Jacket_Black", "Jacket_BlackOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_LeatherWildRacoons", "Jacket_LeatherWildRacoonsOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_LeatherIronRodent", "Jacket_LeatherIronRodentOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_LeatherBarrelDogs", "Jacket_LeatherBarrelDogsOPEN", "CloseJacket", "OpenJacket");


AddNewExtraItem("WeddingJacket", "WeddingJacketOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Suit_Jacket", "Suit_JacketOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Suit_JacketTINT", "Suit_JacketTINTOPEN", "CloseJacket", "OpenJacket");



-- boiler suit
AddNewExtraItem("Boilersuit", "BoilersuitOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Boilersuit_BlueRed", "Boilersuit_BlueRedOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Boilersuit_Yellow", "Boilersuit_YellowOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Boilersuit_Flying", "Boilersuit_FlyingOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Boilersuit_Prisoner", "Boilersuit_PrisonerOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Boilersuit_PrisonerKhaki", "Boilersuit_PrisonerKhakiOPEN", "CloseJacket", "OpenJacket");



-- SHELL suit
AddNewExtraItem("Jacket_Shellsuit_Black", "Jacket_Shellsuit_BlackOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_Shellsuit_Blue", "Jacket_Shellsuit_BlueOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_Shellsuit_Green", "Jacket_Shellsuit_GreenOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_Shellsuit_Pink", "Jacket_Shellsuit_PinkOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_Shellsuit_Teal", "Jacket_Shellsuit_TealOPEN", "CloseJacket", "OpenJacket");
AddNewExtraItem("Jacket_Shellsuit_TINT", "Jacket_Shellsuit_TINTOPEN", "CloseJacket", "OpenJacket");
