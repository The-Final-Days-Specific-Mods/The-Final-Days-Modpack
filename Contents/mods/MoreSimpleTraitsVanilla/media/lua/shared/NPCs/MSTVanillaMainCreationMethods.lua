MSTVanillaBaseGameCharacterDetails = {}

-- BALANCE MOD -- VANILLA

MSTVanillaBaseGameCharacterDetails.DoTraits = function()

	-- POSITIVE Traits	
	-- Movement Traits	

	local sneaky = TraitFactory.addTrait("Sneaky", getText("UI_trait_sneaky"), 2, getText("UI_trait_sneakydesc"), false);
    sneaky:addXPBoost(Perks.Sneak, 1)	

	local lightfooted = TraitFactory.addTrait("Lightfooted", getText("UI_trait_lightfooted"), 2, getText("UI_trait_lightfooteddesc"), false);
    lightfooted:addXPBoost(Perks.Lightfoot, 1)
	
	local nimble = TraitFactory.addTrait("Nimble", getText("UI_trait_nimble"), 3, getText("UI_trait_nimbledesc"), false);
    nimble:addXPBoost(Perks.Nimble, 1)
	
	-- Mixed traits	
	local marathonrunner = TraitFactory.addTrait("MarathonRunner", getText("UI_trait_marathonrunner"), 7, getText("UI_trait_marathonrunnerdesc"), false);
	marathonrunner:addXPBoost(Perks.Fitness, 1)
	marathonrunner:addXPBoost(Perks.Sprinting, 1)
		
	local strongnimble = TraitFactory.addTrait("StrongNimble", getText("UI_trait_strongnimble"), 6, getText("UI_trait_strongnimbledesc"), false);
	strongnimble:addXPBoost(Perks.Strength, 1)
	strongnimble:addXPBoost(Perks.Nimble, 1)

	local taut = TraitFactory.addTrait("Taut", getText("UI_trait_taut"), 6, getText("UI_trait_tautdesc"), false);
    taut:addXPBoost(Perks.Fitness, 1)
    taut:addXPBoost(Perks.Strength, 1)
	
	local ninjaway = TraitFactory.addTrait("NinjaWay", getText("UI_trait_ninjaway"), 4, getText("UI_trait_ninjawaydesc"), false);
    ninjaway:addXPBoost(Perks.Lightfoot, 1)	
    ninjaway:addXPBoost(Perks.Sneak, 1)	
	
	-- Surviving Traits
	local amforager = TraitFactory.addTrait("AMForager", getText("UI_trait_amforager"), 3, getText("UI_trait_amforagerdesc"), false);
    amforager:addXPBoost(Perks.PlantScavenging, 1)
	
	local amtrapper = TraitFactory.addTrait("AMTrapper", getText("UI_trait_amtrapper"), 3, getText("UI_trait_amtrapperdesc"), false);
    amtrapper:addXPBoost(Perks.Trapping, 1)
    amtrapper:getFreeRecipes():add("Make Stick Trap");
    amtrapper:getFreeRecipes():add("Make Snare Trap");
    amtrapper:getFreeRecipes():add("Make Wooden Cage Trap");
    amtrapper:getFreeRecipes():add("Make Trap Box");
    amtrapper:getFreeRecipes():add("Make Cage Trap");
	
	local mushroomer = TraitFactory.addTrait("Mushroomer", getText("UI_trait_mushroomer"), 8, getText("UI_trait_mushroomerdesc"), false);
    mushroomer:addXPBoost(Perks.PlantScavenging, 1)
	mushroomer:getFreeRecipes():add("Herbalist");	
	
	-- Crafting traits	
	local amcook = TraitFactory.addTrait("AMCook", getText("UI_trait_amcook"), 3, getText("UI_trait_amcookdesc"), false);
    amcook:addXPBoost(Perks.Cooking, 1)

	local amelectrician = TraitFactory.addTrait("AMElectrician", getText("UI_trait_amelectrician"), 4, getText("UI_trait_amelectriciandesc"), false);
    amelectrician:addXPBoost(Perks.Electricity, 1)

	local ammechanic = TraitFactory.addTrait("AMMechanic", getText("UI_trait_ammechanic"), 4, getText("UI_trait_ammechanicdesc"), false);
    ammechanic:addXPBoost(Perks.Mechanics, 1)

	local amcarpenter = TraitFactory.addTrait("AMCarpenter", getText("UI_trait_amcarpenter"), 4, getText("UI_trait_amcarpenterdesc"), false);
    amcarpenter:addXPBoost(Perks.Woodwork, 1)
	
	local ammetalworker = TraitFactory.addTrait("AMMetalworker", getText("UI_trait_ammetalworker"), 4, getText("UI_trait_ammetalworkerdesc"), false);
    ammetalworker:addXPBoost(Perks.MetalWelding, 1)

	-- Combat traits
	local durabile = TraitFactory.addTrait("Durabile", getText("UI_trait_durabile"), 3, getText("UI_trait_durabiledesc"), false);
    durabile:addXPBoost(Perks.Maintenance, 1)	
	
    local shortbladefan = TraitFactory.addTrait("Shortbladefan", getText("UI_trait_shortbladefan"), 2, getText("UI_trait_shortbladefandesc"), false);
    shortbladefan:addXPBoost(Perks.SmallBlade, 1)
    
	local shortbluntfan = TraitFactory.addTrait("Shortbluntfan", getText("UI_trait_shortbluntfan"), 3, getText("UI_trait_shortbluntfandesc"), false);
    shortbluntfan:addXPBoost(Perks.SmallBlunt, 1)
  
	local cutter = TraitFactory.addTrait("Cutter", getText("UI_trait_cutter"), 4, getText("UI_trait_cutterdesc"), false);
    cutter:addXPBoost(Perks.Axe, 1)
	
    local spearman = TraitFactory.addTrait("Spearman", getText("UI_trait_spearman"), 4, getText("UI_trait_spearmandesc"), false);
    spearman:addXPBoost(Perks.Spear, 1)
	
    local swordsman = TraitFactory.addTrait("Swordsman", getText("UI_trait_swordsman"), 4, getText("UI_trait_swordsmandesc"), false);
    swordsman:addXPBoost(Perks.LongBlade, 1)

	-- Firearm traits	
    local gunfan = TraitFactory.addTrait("Gunfan", getText("UI_trait_gunfan"), 4, getText("UI_trait_gunfandesc"), false);
    gunfan:addXPBoost(Perks.Aiming, 1)
    gunfan:addXPBoost(Perks.Reloading, 1)
	
	local sharpshooter = TraitFactory.addTrait("Sharpshooter", getText("UI_trait_sharpshooter"), 10, getText("UI_trait_sharpshooterdesc"), false);
    sharpshooter:addXPBoost(Perks.Aiming, 3)

	--Time traits
	if getActivatedMods():contains("MoreSimpleTraitzDisableDrowsinessTraits") == false then		
	
		local owlperson = TraitFactory.addTrait("OwlPerson", getText("UI_trait_owlperson"), -1, getText("UI_trait_owlpersondesc"), false);

		local larkperson = TraitFactory.addTrait("LarkPerson", getText("UI_trait_larkperson"), -1, getText("UI_trait_larkpersondesc"), false);	

	end	

	--NEGATIVE Traits	
    local slack = TraitFactory.addTrait("Slack", getText("UI_trait_slack"), -6, getText("UI_trait_slackdesc"), false);
    slack:addXPBoost(Perks.Fitness, -1)
    slack:addXPBoost(Perks.Strength, -1)

    local weathersensitive = TraitFactory.addTrait("WeatherSensitive", getText("UI_trait_weathersensitive"), -3, getText("UI_trait_weathersensitivedesc"), false);
	
	local sorelegstrait = TraitFactory.addTrait("SoreLegsTrait", getText("UI_trait_sorelegstrait"), -8, getText("UI_trait_sorelegstraitdesc"), false);
	
	local sensitivestomach = TraitFactory.addTrait("SensitiveStomach", getText("UI_trait_sensitivestomach"), -2, getText("UI_trait_sensitivestomachdesc"), false);	
	
	local panicattacks = TraitFactory.addTrait("PanicAttacks", getText("UI_trait_panicattacks"), -4, getText("UI_trait_panicattacksdesc"), false);	
		
	local MSTAllergic = TraitFactory.addTrait("MSTAllergic", getText("UI_trait_MSTAllergic"), -3, getText("UI_trait_MSTAllergicdesc"), false);		
		
		
	-- if More Traits mod active			
	if getActivatedMods():contains("ToadTraits") == false then	
	
		--WEIGHT TRAITS
		local cangrabmore = TraitFactory.addTrait("CanGrabMore", getText("UI_trait_cangrabmore"), 2, getText("UI_trait_cangrabmoredesc"), false);
		local cangrabless = TraitFactory.addTrait("CanGrabLess", getText("UI_trait_cangrabless"), -2, getText("UI_trait_cangrablessdesc"), false);

		--BLEEDING TRAITS		
		local hbwounds = TraitFactory.addTrait("HeavilyBleedingWounds", getText("UI_trait_hbwounds"), -3, getText("UI_trait_hbwoundsdesc"), false);
		local wbwounds = TraitFactory.addTrait("WeaklyBleedingWounds", getText("UI_trait_wbwounds"), 3, getText("UI_trait_wbwoundsdesc"), false);
		
		--VANILLA ALCOHOLIC TRAIT		
		local MSTAlcoholic = TraitFactory.addTrait("MSTAlcoholic", getText("UI_trait_MSTAlcoholic"), -8, getText("UI_trait_MSTAlcoholicdesc"), false);			
		
	end

	----------------------------
    ----- MUTAL EXCLUSIVES -----
	----------------------------	
	
	-- Mushroomer
	TraitFactory.setMutualExclusive("Mushroomer", "Herbalist");
	-- Slack
	TraitFactory.setMutualExclusive("Slack", "MarathonRunner");
    TraitFactory.setMutualExclusive("Slack", "StrongNimble");
    TraitFactory.setMutualExclusive("Slack", "Athletic");
    TraitFactory.setMutualExclusive("Slack", "Strong");
    TraitFactory.setMutualExclusive("Slack", "Taut");
	-- Taut
	TraitFactory.setMutualExclusive("Taut", "Unfit");
	TraitFactory.setMutualExclusive("Taut", "Weak");		
		-- MarathonRunner
	TraitFactory.setMutualExclusive("MarathonRunner", "Unfit");	
	TraitFactory.setMutualExclusive("MarathonRunner", "Obese");		
	TraitFactory.setMutualExclusive("MarathonRunner", "Asthmatic");			
	-- StrongNimble
	TraitFactory.setMutualExclusive("StrongNimble", "Weak");
	TraitFactory.setMutualExclusive("StrongNimble", "Very Underweight");
	-- Sneaky	
	TraitFactory.setMutualExclusive("Sneaky", "Conspicuous");
	-- Lightfooted
	TraitFactory.setMutualExclusive("Lightfooted", "Clumsy");
	-- NinjaWay	
	TraitFactory.setMutualExclusive("NinjaWay", "Conspicuous");	
	TraitFactory.setMutualExclusive("NinjaWay", "Clumsy");		
	-- AMMechanic
	--TraitFactory.setMutualExclusive("AMMechanic", "Mechanics"); - abuse?

	-- Time traits	
	if getActivatedMods():contains("MoreSimpleTraitzDisableDrowsinessTraits") == false then		
	TraitFactory.setMutualExclusive("OwlPerson", "LarkPerson");
	end
	
	-- Alcholic if GreenFire mod active
	if getActivatedMods():contains("jiggasGreenfireMod") == true then		
	TraitFactory.setMutualExclusive("MSTAlcoholic", "Alcoholic");
	end
	
	-- SoreLegs
	TraitFactory.setMutualExclusive("SoreLegsTrait", "Jogger");
	TraitFactory.setMutualExclusive("SoreLegsTrait", "MarathonRunner");	

	-- WeatherSensitive
	if getActivatedMods():contains("DynamicTraits") == true then
	TraitFactory.setMutualExclusive("WeatherSensitive", "Pluviophile");
	end

	if getActivatedMods():contains("ToadTraits") == false then	
		-- Weights
		TraitFactory.setMutualExclusive("CanGrabLess", "CanGrabMore");
		TraitFactory.setMutualExclusive("CanGrabLess", "Strong");
		TraitFactory.setMutualExclusive("CanGrabMore", "Weak");
	
		-- Bleeding
		TraitFactory.setMutualExclusive("HeavilyBleedingWounds", "WeaklyBleedingWounds");	
	end
	
	-- Allergic
	TraitFactory.setMutualExclusive("MSTAllergic", "Resilient");		
	
	----------------------------
	--- FORAGING INTEGRATION ---
	----------------------------
		
	forageSkills = forageSkills or {} 
	-- Forrage Skills
	forageSkills["Mushroomer"] = {
        name 					= "Mushroomer",
        type 					= "trait",
        visionBonus 			= 0.6,
        weatherEffect 			= 5,
        darknessEffect 			= 10,
        specialisations 		= {
			["Mushrooms"] = 55
		}
	};
	forageSkills["AMForager"] = {
        name 					= "AMForager",
        type 					= "trait",
        visionBonus 			= 0.8,
        weatherEffect 			= 10,
        darknessEffect 			= 3,
        specialisations 		= {
            ["Animals"] 		= 3,
	        ["JunkFood"] 		= 3,	
            ["Berries"] 		= 3,
            ["Mushrooms"] 		= 3,
            ["MedicinalPlants"] = 3,
	        ["ForestRarities"] 	= 3,	
	        ["Insects"] 		= 3,	
	        ["WildPlants"]		= 3,	
	        ["Trash"] 			= 3				
		}
	};
	forageSkills["AMTrapper"] = {	
        name 					= "AMTrapper",
        type 					= "trait",
        specialisations 		= {
            ["Animals"] 		= 5
		},
	};
	forageSkills["AMElectrician"] = {	
        name 					= "AMElectrician",
        type 					= "trait",
        specialisations 		= {
	        ["Trash"] 			= 3				
		}
	};
	forageSkills["AMMechanic"] = {	
        name 					= "AMMechanic",
        type 					= "trait",
        specialisations 		= {
	        ["Trash"] 			= 3,				
		},
	};
	forageSkills["AMCarpenter"] = {
        name 					= "AMCarpenter",
        type 					= "trait",
        specialisations 		= {
	        ["Trash"] 			= 3		
		}
	};
	forageSkills["AMMetalworker"] = {
        name 					= "AMMetalworker",
        type 					= "trait",
        specialisations 		= {
	        ["Trash"] 			= 3			
		},
	};
	forageSkills["AMCook"] = {
        name 					= "AMCook",
        type 					= "trait",
        specialisations 		= {
	        ["JunkFood"]		= 5
		}
	};
		forageSkills["WeatherSensitive"] = {
        name 					= "WeatherSensitive",
        type 					= "trait",
        visionBonus 			= -0.2,
        weatherEffect 			= -3,
        darknessEffect 			= -3,
	};
	    
	-- Compatibility with "More Description for Traits"
	
	BaseGameCharacterDetails.SetTraitDescription(sneaky)
	BaseGameCharacterDetails.SetTraitDescription(lightfooted)
	BaseGameCharacterDetails.SetTraitDescription(nimble)
	BaseGameCharacterDetails.SetTraitDescription(marathonrunner)
	BaseGameCharacterDetails.SetTraitDescription(strongnimble)
	BaseGameCharacterDetails.SetTraitDescription(ninjaway)	
	
	BaseGameCharacterDetails.SetTraitDescription(mushroomer)
    BaseGameCharacterDetails.SetTraitDescription(amforager)
    BaseGameCharacterDetails.SetTraitDescription(amtrapper)
	BaseGameCharacterDetails.SetTraitDescription(amcook)
	
    BaseGameCharacterDetails.SetTraitDescription(amelectrician)
    BaseGameCharacterDetails.SetTraitDescription(ammechanic)
    BaseGameCharacterDetails.SetTraitDescription(amcarpenter)
    BaseGameCharacterDetails.SetTraitDescription(ammetalworker)
	
	BaseGameCharacterDetails.SetTraitDescription(durabile)
	BaseGameCharacterDetails.SetTraitDescription(shortbladefan)
	BaseGameCharacterDetails.SetTraitDescription(shortbluntfan)
	BaseGameCharacterDetails.SetTraitDescription(cutter)
	BaseGameCharacterDetails.SetTraitDescription(spearman)
	BaseGameCharacterDetails.SetTraitDescription(swordsman)
	BaseGameCharacterDetails.SetTraitDescription(gunfan)
	BaseGameCharacterDetails.SetTraitDescription(sharpshooter)
	
	BaseGameCharacterDetails.SetTraitDescription(slack)
	BaseGameCharacterDetails.SetTraitDescription(taut)
	
	BaseGameCharacterDetails.SetTraitDescription(weathersensitive)

end

MSTVanillaBaseGameCharacterDetails.DoNewCharacterInitializations = function(playernum, character)
    local player = getSpecificPlayer(playernum);

    -- INITIALIZATION FOR ALCOHOLIC TRAIT
    if player:getModData().MSThoursSinceLastDrink == nil then
        player:getModData().MSThoursSinceLastDrink = 0;
    end
	    -- INITIALIZATION FOR WEATHER SENSITIVE TRAIT	
    if player:getModData().MSThoursSinceLastRain == nil then
        player:getModData().MSThoursSinceLastRain = 0;
    end	

end

MSTVanillaBaseGameCharacterDetails.DoExistingCharacterInitializations = function(player)

	-- INITIALIZATION FOR ALCOHOLIC TRAIT
        if player:getModData().MSThoursSinceLastDrink == nil then
            player:getModData().MSThoursSinceLastDrink = 0;
        end
    -- INITIALIZATION FOR WEATHER SENSITIVE TRAIT	
	if player:getModData().MSThoursSinceLastRain == nil then
		player:getModData().MSThoursSinceLastRain = 0;
	end				
		
end

Events.OnGameBoot.Add(MSTVanillaBaseGameCharacterDetails.DoTraits);
Events.OnCreatePlayer.Add(MSTVanillaBaseGameCharacterDetails.DoNewCharacterInitializations);
