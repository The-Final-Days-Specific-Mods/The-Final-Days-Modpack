-- update 27 05 2022 
--	player:Say("test");	

function MSTdecreaseDrunkenness(player, chance, drunkenness)
    if chance == 0 then
        local currentDrunkenness = player:getStats():getDrunkenness();
        player:getStats():setDrunkenness(currentDrunkenness - drunkenness);
        if player:getStats():getDrunkenness() < 0 then
            player:getStats():setDrunkenness(0);
        end
    end
end

function MSTincreaseWetness(player, chance, wetness)
	if chance == 0 then
	local currentWetness = player:getBodyDamage():getWetness();
	player:getBodyDamage():setWetness(currentWetness + wetness);
	if player:getBodyDamage():getWetness() > 99 then
	player:getBodyDamage():setWetness(99);
	end
	end
end	

function MSTincreaseStress(player, chance,  stress)
    local currentStress = player:getStats():getStress();
    player:getStats():setStress(currentStress + stress);
    if player:getStats():getStress() > 0.99 then
        player:getStats():setStress(0.99);
    end
end

function MSTincreaseUnhappyness(player, unhappyness)
    local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel();
    player:getBodyDamage():setUnhappynessLevel(currentUnhappyness + unhappyness);
    if player:getBodyDamage():getUnhappynessLevel() > 99 then
        player:getBodyDamage():setUnhappynessLevel(99);
    end
end

function MSTincreasePanic(player, chance, panic)
    if chance == 0 then
		local currentPanic = player:getStats():getPanic();
		player:getStats():setPanic(currentPanic + panic);
		if player:getStats():getPanic() > 99 then
			player:getStats():setPanic(99);
		end
	end
end

function MSTincreaseFatigue(player, chance, fatigue)
    if chance == 0 then
        local currentFatigue = player:getStats():getFatigue();
        player:getStats():setFatigue(currentFatigue + fatigue);
        if player:getStats():getFatigue() > 0.99 then
            player:getStats():setFatigue(0.99);
        end
    end
end

function MSTdecreaseFatigue(player, chance, fatigue)
    if chance == 0 then
        local currentFatigue = player:getStats():getFatigue();
        player:getStats():setFatigue(currentFatigue - fatigue);
        if player:getStats():getFatigue() > 0.99 then
            player:getStats():setFatigue(0.99);
        end
    end
end

function MSTincreasePoison(player, chance, poison)
    local currentFoodPoison = player:getBodyDamage():getFoodSicknessLevel();
    if chance == 0 then
        if player:HasTrait("WeakStomach") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 1.3));
        elseif player:HasTrait("WeakStomach") and player:HasTrait("ProneToIllness") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 1.5));
        elseif player:HasTrait("WeakStomach") and player:HasTrait("Resilient") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 1.1));
        elseif player:HasTrait("ProneToIllness") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 1.2));
        elseif player:HasTrait("ProneToIllness") and player:HasTrait("IronGut") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 0.9));
        elseif player:HasTrait("IronGut") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 0.7));
        elseif player:HasTrait("IronGut") and player:HasTrait("Resilient") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 0.5));
        elseif player:HasTrait("Resilient") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 0.8));
        else
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + poison);
        end
        if player:getBodyDamage():getFoodSicknessLevel() > 99 then
            player:getBodyDamage():setFoodSicknessLevel(99);
        end
    end
end

function MSTApplyPain(player, chance, bodyPart, pain)
	if chance == 0 then
	local bodyPartAux = BodyPartType.FromString(bodyPart);
	local playerBodyPart = player:getBodyDamage():getBodyPart(bodyPartAux);
	local currentPain = playerBodyPart:getPain();
	playerBodyPart:setAdditionalPain(currentPain + pain);
	if playerBodyPart:getPain() > 99 then
		playerBodyPart:setAdditionalPain(99);
	end
	end
end

function MSTDecreaseEndurance(player, chance, endurance)
    if chance == 0 then
        local currentEndurance = player:getStats():getEndurance();
        player:getStats():setEndurance(currentEndurance - endurance);
        if player:getStats():getEndurance() < 0 then
            player:getStats():setEndurance(0);
        end
    end
end

function MSTIncreaseEndurance(player, chance, endurance)
    if chance == 0 then
        local currentEndurance = player:getStats():getEndurance();
        player:getStats():setEndurance(currentEndurance + endurance);
        if player:getStats():getEndurance() < 0 then
            player:getStats():setEndurance(0);
        end
    end
end


-------------------------------------------------------


-- WEATHER SENSITIVE TRAIT
function MSTWeatherSensitiveTrait()
	for playerIndex = 0, getNumActivePlayers()-1 do
    local player = getSpecificPlayer(playerIndex);	

	local clim = getClimateManager();	
    local forecaster = clim:getClimateForecaster();
	
	local todayforecast = forecaster:getForecast(0);
	local tomorrowforecast = forecaster:getForecast(1);		
	
	local Head = player:getBodyDamage():getBodyPart(BodyPartType.FromString("Head"));		

	-- one hour = 6
	if 	player:HasTrait("WeatherSensitive") then  
		if todayforecast:isHasBlizzard() or todayforecast:isHasTropicalStorm() or todayforecast:isHasStorm() or todayforecast:isHasHeavyRain() then
--		player:Say("today rain +");
		player:getModData().MSThoursSinceLastRain = player:getModData().MSThoursSinceLastRain + 1;	
		elseif not todayforecast:isHasBlizzard() and not todayforecast:isHasTropicalStorm() and not  todayforecast:isHasStorm() and not todayforecast:isHasHeavyRain() then
--		player:Say("today no rain -");
		player:getModData().MSThoursSinceLastRain = player:getModData().MSThoursSinceLastRain - 1;	
		end
	
		if tomorrowforecast:isHasBlizzard() or tomorrowforecast:isHasTropicalStorm() or tomorrowforecast:isHasStorm() or tomorrowforecast:isHasHeavyRain() then
--		player:Say("tomorrow rain +");
		player:getModData().MSThoursSinceLastRain = player:getModData().MSThoursSinceLastRain + 2;		
		elseif not tomorrowforecast:isHasBlizzard() and not tomorrowforecast:isHasTropicalStorm() and not  tomorrowforecast:isHasStorm() and not tomorrowforecast:isHasHeavyRain() then
--		player:Say("tomorrow no rain -");
		player:getModData().MSThoursSinceLastRain = player:getModData().MSThoursSinceLastRain - (ZombRand(1)+2);	
		end
	end

	if 	player:HasTrait("WeatherSensitive") then  
	
		if todayforecast:isHasBlizzard() or todayforecast:isHasTropicalStorm() or todayforecast:isHasStorm() or todayforecast:isHasHeavyRain() then
			if Head:getPain() <= 8 and ZombRand(19) == 0 then	
--			player:Say("today rain pain");
			MSTApplyPain(player, 0, "Head", (ZombRand(27)+27));
			player:playEmote("mstpainhead");
--			print("1");				
			end
		end
		
		if tomorrowforecast:isHasBlizzard() or tomorrowforecast:isHasTropicalStorm() or tomorrowforecast:isHasStorm() or tomorrowforecast:isHasHeavyRain() then
			if player:getModData().MSThoursSinceLastRain <= 143 and Head:getPain() <= 26 then	
--			player:Say("tomorrow rain+ pain");		
			MSTApplyPain(player, ZombRand(4), "Head", ZombRand(45));
				if ZombRand(11) == 0 then
--				print("2");			
				player:playEmote("mstpainhead");
				end
			end
		end

		if not tomorrowforecast:isHasBlizzard() and not tomorrowforecast:isHasTropicalStorm() and not  tomorrowforecast:isHasStorm() and not tomorrowforecast:isHasHeavyRain() then
			if 	player:getModData().MSThoursSinceLastRain >= 144 and Head:getPain() <= 22 then
--			player:Say("tomorrow no rain pain");	
			MSTApplyPain(player, ZombRand(4), "Head", ZombRand(40));
				if ZombRand(11) == 0 then
--				print("3");	
				player:playEmote("mstpainhead");
				end			
			end		
		end

		if player:getModData().MSThoursSinceLastRain > 288 then
        player:getModData().MSThoursSinceLastRain = 288;
		elseif player:getModData().MSThoursSinceLastRain < 0 then
        player:getModData().MSThoursSinceLastRain = 0;
		end	
--	print("player:getModData().MSThoursSinceLastRain: " .. player:getModData().MSThoursSinceLastRain);	
	end
	end
end


-- LARK TRAIT
function larkperson()
	local player = getPlayer();	
    local gameTime = getGameTime();
	local currentHour = gameTime:getHour();
 	if player:HasTrait("LarkPerson") and not player:isAsleep() then
		if currentHour >= 5 and currentHour <= 8 then	
		MSTdecreaseFatigue(player, 0, 0.003)
		end
		if currentHour >= 19 and currentHour <= 22 then
		MSTincreaseFatigue(player, 0, 0.003)		
		end
	end
end

-- OWL TRAIT
function owlperson()
	local player = getPlayer();	
    local gameTime = getGameTime();
	local currentHour = gameTime:getHour();
 	if player:HasTrait("OwlPerson") and not player:isAsleep() then
		if currentHour >= 19 and currentHour <= 22 then	
		MSTdecreaseFatigue(player, 0, 0.003)
		end
		if currentHour >= 5 and currentHour <= 8 then
		MSTincreaseFatigue(player, 0, 0.003)
		end
	end
end

-- ADAPTIVE TRAIT
function strongnimbleregenendur(player, weapon)
	if player:HasTrait("StrongNimble") and not weapon:getCategories():contains("Unarmed") then
		if weapon:getCategories():contains("Blunt") or weapon:getCategories():contains("LongBlade") or weapon:getCategories():contains("Spear") or weapon:getCategories():contains("Axe") then
--		player:Say("Hayaa big");	
		MSTIncreaseEndurance(player, ZombRand(4), 0.003);
		end
		if weapon:getCategories():contains("SmallBlunt") then
--		player:Say("Hayaa smol");	
		MSTIncreaseEndurance(player, ZombRand(4), 0.002);
		end
		if weapon:getCategories():contains("SmallBlade") then
--		player:Say("Hayaa knifu");
		MSTIncreaseEndurance(player, ZombRand(4), 0.001);
		end
	end
end

-- SORE LEGS TRAIT
function sorelegscalc()
	local player = getPlayer();
	local SprintingLevel = player:getPerkLevel(Perks.Sprinting);
	local Foot_L = player:getBodyDamage():getBodyPart(BodyPartType.FromString("Foot_L"));
	local Foot_R = player:getBodyDamage():getBodyPart(BodyPartType.FromString("Foot_R"));		

		if player:HasTrait("SoreLegsTrait") then
		-- Walking pain
			if player:isPlayerMoving() and not player:IsRunning() == true and not player:isSprinting() == true then	
				if Foot_L:getPain() <= 19 then
				MSTApplyPain(player, 0, "Foot_L", ZombRand(4)+1);	
				end
				if Foot_R:getPain() <= 19 then
				MSTApplyPain(player, 0, "Foot_R", ZombRand(4)+1);
				end
			end
		end
		if player:HasTrait("SoreLegsTrait") then
		-- Sprinting level 0 - 3
			if SprintingLevel == 0 or SprintingLevel == 1 or SprintingLevel == 2 or SprintingLevel == 3 then
				if player:IsRunning() == true and player:isPlayerMoving() then
				MSTApplyPain(player, ZombRand(3), "UpperLeg_L", ZombRand(4)+1);	
				MSTApplyPain(player, ZombRand(3), "UpperLeg_R", ZombRand(4)+1);	
				MSTApplyPain(player, ZombRand(2), "LowerLeg_L", ZombRand(4)+1);	
				MSTApplyPain(player, ZombRand(2), "LowerLeg_R", ZombRand(4)+1);
					if Foot_L:getPain() <= 45 then
					MSTApplyPain(player, 0, "Foot_L", ZombRand(8)+2);
					end
					if Foot_R:getPain() <= 45 then	
					MSTApplyPain(player, 0, "Foot_R", ZombRand(8)+2);
					end
					
				end
				if player:isSprinting() == true and player:isPlayerMoving() then
--				player:Say("Sprint pain");
				MSTApplyPain(player, ZombRand(2),"UpperLeg_L", ZombRand(12)+7);	
				MSTApplyPain(player, ZombRand(2),"UpperLeg_R", ZombRand(12)+7);	
				MSTApplyPain(player, 0,"LowerLeg_L", ZombRand(17)+7);	
				MSTApplyPain(player, 0,"LowerLeg_R", ZombRand(17)+7);
				MSTApplyPain(player, 0,"Foot_L", ZombRand(25)+15);	
				MSTApplyPain(player, 0,"Foot_R", ZombRand(25)+15);
				MSTDecreaseEndurance(player, 0, 0.03);	
				end
			end
		end
		if player:HasTrait("SoreLegsTrait") then
		-- Sprinting level 4 - 7
		if SprintingLevel == 4 or SprintingLevel == 5 or SprintingLevel == 6 or SprintingLevel == 7 then
			if player:IsRunning() == true and player:isPlayerMoving() then
				MSTApplyPain(player, ZombRand(3), "UpperLeg_L", ZombRand(3)+1);	
				MSTApplyPain(player, ZombRand(3), "UpperLeg_R", ZombRand(3)+1);	
				MSTApplyPain(player, ZombRand(2), "LowerLeg_L", ZombRand(3)+1);	
				MSTApplyPain(player, ZombRand(2), "LowerLeg_R", ZombRand(3)+1);
					if Foot_L:getPain() <= 45 then
					MSTApplyPain(player, 0, "Foot_L", ZombRand(6)+2);
					end
					if Foot_R:getPain() <= 45 then	
					MSTApplyPain(player, 0, "Foot_R", ZombRand(6)+2);
					end				
				end
				if player:isSprinting() == true and player:isPlayerMoving() then
				MSTApplyPain(player, ZombRand(2),"UpperLeg_L", ZombRand(10)+6);	
				MSTApplyPain(player, ZombRand(2),"UpperLeg_R", ZombRand(10)+6);	
				MSTApplyPain(player, 0,"LowerLeg_L", ZombRand(15)+6);	
				MSTApplyPain(player, 0,"LowerLeg_R", ZombRand(15)+6);
				MSTApplyPain(player, 0,"Foot_L", ZombRand(20)+13);	
				MSTApplyPain(player, 0,"Foot_R", ZombRand(20)+13);
				MSTDecreaseEndurance(player, 0, 0.02);
				end
			end
		end
		if player:HasTrait("SoreLegsTrait")then
		-- Sprinting level 8 - 10
		if SprintingLevel == 8 or SprintingLevel == 9 or SprintingLevel == 10 then
		if player:IsRunning() == true and player:isPlayerMoving() then			
			MSTApplyPain(player, ZombRand(3), "UpperLeg_L", ZombRand(2)+1);	
			MSTApplyPain(player, ZombRand(3), "UpperLeg_R", ZombRand(2)+1);	
			MSTApplyPain(player, ZombRand(2), "LowerLeg_L", ZombRand(2)+1);	
			MSTApplyPain(player, ZombRand(2), "LowerLeg_R", ZombRand(2)+1);
					if Foot_L:getPain() <= 45 then
					MSTApplyPain(player, 0, "Foot_L", ZombRand(4)+2);
					end
					if Foot_R:getPain() <= 45 then	
					MSTApplyPain(player, 0, "Foot_R", ZombRand(4)+2);
					end		
			end
			if player:isSprinting() == true and player:isPlayerMoving() then
			MSTApplyPain(player, ZombRand(2),"UpperLeg_L", ZombRand(9)+5);	
			MSTApplyPain(player, ZombRand(2),"UpperLeg_R", ZombRand(9)+5);	
			MSTApplyPain(player, 0,"LowerLeg_L", ZombRand(14)+5);	
			MSTApplyPain(player, 0,"LowerLeg_R", ZombRand(14)+5);
			MSTApplyPain(player, 0,"Foot_L", ZombRand(18)+12);	
			MSTApplyPain(player, 0,"Foot_R", ZombRand(18)+12);
			MSTDecreaseEndurance(player, 0, 0.01);
			end
		end
	end	
end

-- SORE LEGS STOMP PAIN
function sorellegsstomppain(player, weapon)
	local player = getPlayer();	
	local Foot_R = player:getBodyDamage():getBodyPart(BodyPartType.FromString("Foot_R"));	
	if player:HasTrait("SoreLegsTrait")then
		if weapon:getCategories():contains("Unarmed") and player:isAimAtFloor() and Foot_R:getPain() <= 50 then
--		player:Say("Hayaa");	
		MSTApplyPain(player, 0,"Foot_R", ZombRand(6)+3);
		end
	end
end

-- SORE LEGS PAIN WHILE FITNESS
--function ISFitnessAction:exeLooped()
--	local player = self.character;
--	if self.exercise == "squats" then
--		if player:HasTrait("SoreLegsTrait")then
--		MSTApplyPain(player, ZombRand(4), "UpperLeg_L", ZombRand(4)+1);	
--		MSTApplyPain(player, ZombRand(4), "UpperLeg_R", ZombRand(4)+1);	
--		MSTApplyPain(player, ZombRand(4), "LowerLeg_L", ZombRand(4)+1);	
--		MSTApplyPain(player, ZombRand(4), "LowerLeg_R", ZombRand(4)+1);
--		end	
--		elseif self.exercise == "burpees" then
--		if player:HasTrait("SoreLegsTrait")then
--		MSTApplyPain(player, ZombRand(4), "UpperLeg_L", ZombRand(4)+2);	
--		MSTApplyPain(player, ZombRand(4), "UpperLeg_R", ZombRand(4)+2);	
--		MSTApplyPain(player, ZombRand(4), "LowerLeg_L", ZombRand(4)+2);	
--		MSTApplyPain(player, ZombRand(4), "LowerLeg_R", ZombRand(4)+2);
--		MSTApplyPain(player, ZombRand(3), "Foot_L", ZombRand(3)+2);	
--		MSTApplyPain(player, ZombRand(3), "Foot_R", ZombRand(3)+2);		
--		end
--	end
--	self.repnb = self.repnb + 1;
--	self.fitness:exerciseRepeat();
--	self:setFitnessSpeed();
--end

-- MARATHON RUNNER TRAIT
local function marathonrunnerregen ()
	local player = getPlayer();
	local FitnessLevel = player:getPerkLevel(Perks.Fitness);	
	if player:HasTrait("MarathonRunner") then 
		if player:IsRunning() == true and player:isPlayerMoving() and FitnessLevel <= 6 and player:isSneaking() == false then
--		player:Say("sprint6");	
			MSTIncreaseEndurance(player, ZombRand(3), 0.002);
		end
		if player:IsRunning() == true and player:isPlayerMoving() and FitnessLevel <= 6 and player:isSneaking() == true then
--		player:Say("sneak sprint6");	
			MSTIncreaseEndurance(player, ZombRand(11), 0.002);
		end		
		if player:IsRunning() == true and player:isPlayerMoving() and FitnessLevel >= 7 and player:isSneaking() == false then
--		player:Say("sprint7");	
			MSTIncreaseEndurance(player, ZombRand(5), 0.002);
		end
		if player:IsRunning() == true and player:isPlayerMoving() and FitnessLevel >= 7 and player:isSneaking() == true then
--		player:Say("sneak sprint7");	
			MSTIncreaseEndurance(player, ZombRand(14), 0.002);
		end		
	end
end

-- HEAVY BLEED TRAIT
function hbwounds()
	local player = getPlayer();
	if player:HasTrait("HeavilyBleedingWounds") then 
        local bodydamage = player:getBodyDamage();
        local bleeding = bodydamage:getNumPartsBleeding();
        if bleeding > 0 then
            for i = 0, player:getBodyDamage():getBodyParts():size() - 1 do
                local b = player:getBodyDamage():getBodyParts():get(i);
                if b:bleeding() and b:IsBleedingStemmed() == false then
                    local damage = 0.0055;
                    if b:getType() == BodyPartType.Neck then
                        damage = damage * 4;
                    end
                    b:ReduceHealth(damage);
                end
            end
        end
    end
end

-- WEAK BLEED TRAIT
function wbwounds()
	local player = getPlayer();
	    if player:HasTrait("WeaklyBleedingWounds") then
			local bodydamage = player:getBodyDamage();
			local bleeding = bodydamage:getNumPartsBleeding(); 
				if bleeding > 0 then
				for i = 0, player:getBodyDamage():getBodyParts():size() - 1 do
				local b = player:getBodyDamage():getBodyParts():get(i);
					if b:bleeding() and b:IsBleedingStemmed() == false then
					local damage = 0.0014;
					if b:getType() == BodyPartType.Neck then
					damage = damage * 6;
					end
				b:AddHealth(damage);
				end
			end
		end
	end
end

-- SENSITIVE STOMACH TRAIT
function sensitivestomach()
	local player = getPlayer();
	local playerdata = player:getModData();
    local HealByFoodTimer = player:getBodyDamage():getHealthFromFoodTimer();
    if player:HasTrait("SensitiveStomach") then
        if HealByFoodTimer > 1000 then
            if playerdata.fPreviousHealthFromFoodTimer == nil then
                playerdata.fPreviousHealthFromFoodTimer = 1000;
            end
            if HealByFoodTimer > playerdata.fPreviousHealthFromFoodTimer then
                local Torso_Lower = player:getBodyDamage():getBodyPart(BodyPartType.FromString("Torso_Lower"));
                local pain = (HealByFoodTimer - playerdata.fPreviousHealthFromFoodTimer) * (0.003 * (ZombRand(2)+3));
				MSTincreasePoison(player, 0, (ZombRand(11)+5+pain) * 0.3);
                Torso_Lower:setAdditionalPain(Torso_Lower:getAdditionalPain() + pain);
                if Torso_Lower:getAdditionalPain() >= 100 then
					Torso_Lower:setAdditionalPain(100);
                end
            end
            playerdata.fPreviousHealthFromFoodTimer = HealByFoodTimer;
        end
    end
end

-- WAY OF THE NINJA TRAIT
local function ninjawayregen ()
	local player = getPlayer();
	local FitnessLevel = player:getPerkLevel(Perks.Fitness);	
	if player:HasTrait("NinjaWay") then 
	-- player sneaking and not moving and not sleeping
		if player:isSneaking() == true and not player:isPlayerMoving() and not player:isAsleep() then	
--		player:Say("regen staying not sleep");
		MSTIncreaseEndurance(player, ZombRand(8), 0.001);	
		end
	-- player sneaking and moving with fitness <=6	
		if player:isSneaking() == true and player:isPlayerMoving() and player:IsRunning() == false and FitnessLevel <= 6 then
--		player:Say("regen sneak f6");
		MSTIncreaseEndurance(player, ZombRand(4), 0.001);
		end
	-- player sneaking and moving with fitness >=7		
		if player:isSneaking() == true and player:isPlayerMoving() and player:IsRunning() == false and FitnessLevel >= 7 then
--		player:Say("regen sneak f7");
		MSTIncreaseEndurance(player, ZombRand(5), 0.001);
		end
	-- player sneaking and RUN with fitness <=6	
		if player:isSneaking() == true and player:isPlayerMoving() and player:IsRunning() == true and FitnessLevel <= 6 then
--		player:Say("regen sneak run f6");
		MSTIncreaseEndurance(player, ZombRand(4), 0.002);
		end
	-- player sneaking and RUN with fitness >=7		
		if player:isSneaking() == true and player:isPlayerMoving() and player:IsRunning() == true and FitnessLevel >= 7 then
--		player:Say("regen sneak run f7");
		MSTIncreaseEndurance(player, ZombRand(5), 0.002);
		end		
	end
end

-- PANIC ATTACKS TRAIT
function panicattackscalc ()
	local player = getPlayer();
	local stats = player:getStats();
	local panic = stats:getPanic();
	local speedcontrolforpa = UIManager.getSpeedControls();
	local gamespeedforpa = speedcontrolforpa:getCurrentGameSpeed();	
	if player:HasTrait("PanicAttacks") and not player:isAsleep() then
		if ZombRand(379) == 0 then
		-- 379
		if gamespeedforpa <= 3 then
--		player:playSound("ZombieSurprisedPlayer");
		getSoundManager():PlaySound("ZombieSurprisedPlayer", false, 0):setVolume(0.20);	
		end
		player:playEmote("mstshiver");	
		MSTincreasePanic(player, 0, (ZombRand(30)+70));
		MSTincreaseStress(player, 0, 0.30)	;
		MSTincreaseWetness(player, 0, (ZombRand(20)+20));
		end
	
		if panic >= 10 and panic <= 49 then
--		player:Say("Panic +10");	
		MSTincreasePanic (player, 0, (ZombRand(2)+1));	
		end
		if panic >= 50 and panic <= 79 then
--		player:Say("Panic +50");
		MSTincreasePanic (player, 0, (ZombRand(2)+2));	
		end	
		if panic >= 80 then
--		player:Say("Panic +80");
		MSTincreasePanic (player, ZombRand(3), (ZombRand(8)+3));	
		end		
	end
end		

-- ALLERGIC TRAIT
function allergictrait ()
	local player = getPlayer();
	if player:HasTrait("MSTAllergic") and not player:isAsleep() then
		if ZombRand(219) == 0 then
			if not player:hasEquipped("Base.ToiletPaper") and not player:hasEquipped("Base.Tissue") then
--			print("Sneeze not sleep");	
			player:Say(getText("IGUI_PlayerText_Sneeze"));	
			addSound(player, player:getX(), player:getY(), player:getZ(), 40, 50);	
			player:playEmote("mstsneeze");	
			end
			if player:hasEquipped("Base.ToiletPaper") or  player:hasEquipped("Base.Tissue") then
--			print("Sneeze Tissue not sleep");	
			player:Say(getText("IGUI_PlayerText_SneezeMuffled"));
			addSound(player, player:getX(), player:getY(), player:getZ(), 4, 6);	
			player:playEmote("mstsneeze");	
			end
		end		
	end
end

Events.OnWeaponSwingHitPoint.Add(sorellegsstomppain);
Events.OnWeaponSwingHitPoint.Add(strongnimbleregenendur);

Events.OnPlayerUpdate.Add(sensitivestomach);
Events.OnPlayerUpdate.Add(hbwounds);
Events.OnPlayerUpdate.Add(wbwounds);

Events.EveryOneMinute.Add(marathonrunnerregen);
Events.EveryOneMinute.Add(ninjawayregen);
Events.EveryOneMinute.Add(sorelegscalc);
Events.EveryOneMinute.Add(panicattackscalc);
Events.EveryOneMinute.Add(allergictrait);

Events.EveryTenMinutes.Add(MSTWeatherSensitiveTrait);
Events.EveryTenMinutes.Add(larkperson);
Events.EveryTenMinutes.Add(owlperson);