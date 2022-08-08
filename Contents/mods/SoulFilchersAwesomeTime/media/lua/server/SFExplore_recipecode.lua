-- Return true if recipe is valid, false otherwise
function Recipe.OnCreate.LampBatteryRemoval(items, result, player)
	for i=0, items:size()-1 do
		local item = items:get(i)
		-- we found the battery, we change his used delta according to the battery
		if item:getType() == "BatteryLamp" or item:getType() == "HeadTorch" then
			result:setUsedDelta(item:getUsedDelta());
			-- then we empty the torch used delta (his energy)
			item:setUsedDelta(0);
		end
	end
end

function Recipe.OnTest.LampBatteryInsert(sourceItem, result)
	if sourceItem:getType() == "BatteryLamp" or sourceItem:getType() == "HeadTorch" then
		return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return true -- the battery
end

function LanternFuel_TestIsValid (sourceItem, result)
	if sourceItem:getType() == "GasLantern" then
		return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return true -- the battery
end

function LanternLight_TestIsValid (sourceItem, result)
	if sourceItem:getType() == "GasLantern" then
		return sourceItem:getUsedDelta() > 0; -- Can only light a lantern that has gas in it.
	end
	return true -- the battery
end

function LanternLight_Create (items, result, player)

    for i=0, items:size()-1 do
       if items:get(i):getType() == "GasLantern" then
       		local original = items:get(i);
		result:setUsedDelta(original:getUsedDelta())
		if original:isFavorite() then result:setFavorite(true) end;
		if original:getAttachedSlot() ~= nil then result:setAttachedSlot(original:getAttachedSlot()) end;
	end
    end
end

function LanternExtinguish_Create (items, result, player)

    for i=0, items:size()-1 do
       if items:get(i):getType() == "GasLanternLit" then
       		local original = items:get(i);
		result:setUsedDelta(original:getUsedDelta())
		if original:isFavorite() then result:setFavorite(true) end;
		if original:getAttachedSlot() ~= nil then result:setAttachedSlot(original:getAttachedSlot()) end;
	end
    end
end

function LanternGeneral_Create (items, result, player)

    for i=0, items:size()-1 do
       if items:get(i):getType() == "GasLantern" or items:get(i):getType() == "GasLanternEmpty" then
       		local original = items:get(i);
		if original:isFavorite() then result:setFavorite(true) end;
		if original:getAttachedSlot() ~= nil then result:setAttachedSlot(original:getAttachedSlot()) end;
	end
    end
end