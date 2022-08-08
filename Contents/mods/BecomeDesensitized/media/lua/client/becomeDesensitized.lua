--WITH SANDBOX OPTIONS
require('NPCs/MainCreationMethods');

local multiplier = 0.25

local CONSIDER_TRAITS, CONSIDER_OCCUPATIONS, MINIMUM_Z_KILLS, MAXIMUM_Z_KILLS;

local function setLocalSandboxVars()
	CONSIDER_TRAITS = SandboxVars.BecomeDesensitized.ConsiderTraits;
	if CONSIDER_TRAITS == nil then
		CONSIDER_TRAITS = true;
	end

	CONSIDER_OCCUPATIONS = SandboxVars.BecomeDesensitized.ConsiderOccupations;
	if CONSIDER_OCCUPATIONS == nil then
		CONSIDER_OCCUPATIONS = true;
	end

	MINIMUM_Z_KILLS = SandboxVars.BecomeDesensitized.MinimumZombieKills;
	if MINIMUM_Z_KILLS == nil then
		MINIMUM_Z_KILLS = 500;
	end

	MAXIMUM_Z_KILLS = SandboxVars.BecomeDesensitized.MaximumZombieKills
	if MAXIMUM_Z_KILLS == nil then
		MAXIMUM_Z_KILLS = 2000;
	end
end

local function calculateMultiplier()
	local player = getPlayer();
	local profession = player:getDescriptor():getProfession();
	
	multiplier = 0.25
	
	if CONSIDER_TRAITS then
		--Good Traits
		if player:HasTrait("Brave") then
			multiplier = multiplier + 0.05 --0.30
		end
		
		if player:HasTrait("Hunter") then
			multiplier = multiplier + 0.025 --0.325
		end

		--Bad Traits
		if player:HasTrait("Cowardly") then --0.20
			multiplier = multiplier - 0.05
		end
	
		if player:HasTrait("Agoraphobic") then  --0.0175
			multiplier = multiplier - 0.025
		end
	
		if player:HasTrait("Claustophobic") then --0.15
			multiplier = multiplier - 0.025
		end
	
		if player:HasTrait("Hemophobic") then --0.125
			multiplier = multiplier - 0.025
		end

		if player:HasTrait("Pacifist") then --0.075
			multiplier = multiplier - 0.05
		end
	end
	
	if CONSIDER_OCCUPATIONS then
		if profession == "policeofficer" then
			multiplier = multiplier + 0.05
		elseif profession == "fireofficer" then
			multiplier = multiplier + 0.025
		elseif profession == "parkranger" then
			multiplier = multiplier + 0.01
		elseif profession == "securityguard" then
			multiplier = multiplier + 0.01
		elseif profession == "doctor" then
			multiplier = multiplier + 0.05
		elseif profession == "nurse" then
			multiplier = multiplier + 0.05
		end
	end
end

local function initBecomeDesensitized()
	setLocalSandboxVars();
	--update multiplier
	calculateMultiplier();
end

local function updateTraits(player, traits, hasTrait)
	if hasTrait then
		if player:HasTrait("Brave") then
			traits:remove("Brave"); 
		end

		if player:HasTrait("Cowardly") then
			traits:remove("Cowardly"); 
		end

		if player:HasTrait("Agoraphobic") then
			traits:remove("Agoraphobic"); 
		end

		if player:HasTrait("Claustophobic") then
			traits:remove("Claustophobic"); 
		end

		if player:HasTrait("Hemophobic") then
			traits:remove("Hemophobic"); 
		end

		if player:HasTrait("AdrenalineJunkie") then
			traits:remove("AdrenalineJunkie"); 
		end
	end
end

local function checkTraits()
	local player = getPlayer();
	local playerData = player:getModData();
	local traits = player:getTraits();
	local hasDesensitized = player:HasTrait("Desensitized");

	updateTraits(player, traits, hasDesensitized);
end

local function becomeDesensitized()
	local player = getPlayer();
	local playerData = player:getModData();
	local traits = player:getTraits();
	local hasDesensitized = player:HasTrait("Desensitized");

	if hasDesensitized == false then
		traits:add("Desensitized"); 
		hasDesensitized = true;
	end

	updateTraits(player, traits, hasDesensitized);
end

--run every day
local function checkDesensitized()
	local player = getPlayer();

	if player:HasTrait("Desensitized") then
		-- do nothing for now 
		-- might do checks for lower zombie killing count over a number of weeks
		-- if player has a low zombie killing count, lose desensitized
	else 
		local playerData = player:getModData();
		local selectedMinZKills = MINIMUM_Z_KILLS;
		local selectedMaxZKills = MAXIMUM_Z_KILLS;
		local zombieKills = player:getZombieKills();
		local zombiesKilledDifference = zombieKills;
		
		-- if over MaximumZombieKills zombie kills, automatically become Desensitized
		if zombiesKilledDifference > selectedMaxZKills then
			becomeDesensitized();
			return;
		--elseif killed more than MinimumZombieKills new zombies
		elseif zombiesKilledDifference > selectedMinZKills then
			local probability = zombiesKilledDifference / selectedMaxZKills;
			local probabilityTreshold = 100 * probability * multiplier;
			
			local randomNumber = ZombRand(1, 100);

			if randomNumber < probabilityTreshold then
				becomeDesensitized();
				return;
			end
		else
			return;
		end
	end
end

Events.OnGameStart.Add(initBecomeDesensitized);
Events.EveryDays.Add(checkDesensitized);
Events.EveryDays.Add(checkTraits);