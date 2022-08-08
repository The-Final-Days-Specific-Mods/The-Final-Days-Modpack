-- ALCOHOLIC TRAIT from Dynamic traits mod

function MSTAlcoholicTrait(player)
--	print("function alcoholicTrait is called");
	for playerIndex = 0, getNumActivePlayers()-1 do
	local player = getSpecificPlayer(playerIndex);
	local currentDrunkenness = player:getStats():getDrunkenness();

	if player:HasTrait("MSTAlcoholic") and currentDrunkenness >= 30 then
--	player:Say(getText("Alcho power!"));		
	MSTdecreaseDrunkenness(player, 0, (ZombRand(10)+5));
	end
		
	-- Drunkenness is greater than 0 which means the player recently had a drink.
	if currentDrunkenness > 0 then
		player:getModData().MSThoursSinceLastDrink = player:getModData().MSThoursSinceLastDrink - 36;
	-- Drunkenness is equal to 0 which means the player recently haven't had a drink.
	else
		player:getModData().MSThoursSinceLastDrink = player:getModData().MSThoursSinceLastDrink + 1;
	
		-- If the player has the Alcoholic trait and haven't drinked for the latest 48 hours the effects starts.
		if player:HasTrait("MSTAlcoholic") and player:getModData().MSThoursSinceLastDrink >= 216 then
--			player:Say("Alcoholic suffer");	
			MSTincreaseStress(player, 0, 0.10);
			MSTincreaseUnhappyness(player, (ZombRand(2)+2));
			MSTincreaseFatigue(player, ZombRand(6), 0.02);
			MSTApplyPain(player, ZombRand(3), "Head", (ZombRand(40)+10));
			if player:getBodyDamage():getFoodSicknessLevel() <= 65 then
				MSTincreasePoison(player, ZombRand(3), (ZombRand(18)+5));
			end
		end
	end
    -- CHECK BOTH VALUES TO KEEP THEM INTO THE LIMITS
		if player:getModData().MSThoursSinceLastDrink > 288 then
			player:getModData().MSThoursSinceLastDrink = 288;
		elseif player:getModData().MSThoursSinceLastDrink < 0 then
			player:getModData().MSThoursSinceLastDrink = 0;
		end

--	print("player:getModData().MSThoursSinceLastDrink: " .. player:getModData().MSThoursSinceLastDrink);
	end
end

function MSTAlcoholicShaking(player)
	local player = getPlayer();
	if player:HasTrait("MSTAlcoholic") and player:getModData().MSThoursSinceLastDrink >= 168 and not player:isAsleep() then
		if ZombRand(8) == 0 and player:isSneaking() == false then
--		print("sway");	
		player:playEmote("mstsway");	
		end
	end	
end


Events.EveryTenMinutes.Add(MSTAlcoholicShaking);

Events.EveryTenMinutes.Add(MSTAlcoholicTrait);

Events.OnPlayerUpdate.Add(MSTVanillaBaseGameCharacterDetails.DoExistingCharacterInitializations);