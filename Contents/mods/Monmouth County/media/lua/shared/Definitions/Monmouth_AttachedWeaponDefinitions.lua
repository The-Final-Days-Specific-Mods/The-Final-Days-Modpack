require "Definitions/AttachedWeaponDefinitions"
-- define weapons to be attached to zombies when creating them

-- For Specific Outfits --

AttachedWeaponDefinitions.huntingknifeDeadApe = {
	chance = 75,
	outfit = {"MonmouthDeadApeBiker"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.HuntingKnife",
	},
}
AttachedWeaponDefinitions.SawnoffShotgunDeadApe = {
	chance = 25,
	outfit = {"MonmouthDeadApeBiker"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.DoubleBarrelShotgunSawnoff",
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.MonmouthDeadApeBiker = {
	chance = 20;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.SawnoffShotgunDeadApe,
		AttachedWeaponDefinitions.huntingknifeDeadApe,		
	},
} 

AttachedWeaponDefinitions.PenFlappyFraz = {
	chance = 100,
	outfit = {"FlappyFraz"},
	weaponLocation = {"Right Hand"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Pen",
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.FlappyFraz = {
	chance = 100;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.PenFlappyFraz,	
	},
} 

table.insert(AttachedWeaponDefinitions["meatCleaverBack"].weapons, "MonmouthWeapons.KukriMachete")

table.insert(AttachedWeaponDefinitions["MacheteShoulder"].weapons, "MonmouthWeapons.KukriMachete")

table.insert(AttachedWeaponDefinitions["bladeInBack"].weapons, "MonmouthWeapons.KukriMachete")

table.insert(AttachedWeaponDefinitions["macheteInBack"].weapons, "MonmouthWeapons.KukriMachete")
