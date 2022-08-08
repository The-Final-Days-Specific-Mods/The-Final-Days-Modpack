-- helpers


function Valhalla.AdminTools:findFuelStationObject(objects, isArrayList)
	function checkObjectForFuelAmount(object)
		local sprite = object:getSprite();

		if sprite and sprite:getProperties() and sprite:getProperties():Is("fuelAmount")
		then
			--if sprite:getName()
			--then
				--print("fuel sprite found: " .. sprite:getName());
			--end

			return object;
		end
	end

	if not isArrayList
	then
		for i = 1, #objects
		do
			if checkObjectForFuelAmount(objects[i])
			then
				return objects[i];
			end
		end
	else
		for i = 0, objects:size() - 1
		do
			if checkObjectForFuelAmount(objects:get(i))
			then
				return objects:get(i);
			end
		end
	end

	return nil;
end