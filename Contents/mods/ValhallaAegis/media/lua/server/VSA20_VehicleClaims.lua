-- vehicle list management


function Valhalla.Commands:getUserVehicleList(player)
	return Valhalla.Commands:getItemListFromFile(Valhalla.Commands:getPlayerVehicleListFileName(player));
end


function Valhalla.Commands:updateUserVehicleLocation(owner, vehicle)
	--print("updateUserVehicleLocation(" .. (owner or "no owner") .. ", " .. vehicle:getSqlId() .. ")");

	local data = {
		x = vehicle:getX(),
		y = vehicle:getY()
	};

	--Valhalla.Commands:saveItemListInFile(Valhalla.Commands:getVehicleLocationFileName(vehicle), data, true);

	if owner
	then
		local listItems = Valhalla.Commands:getUserVehicleList(owner);
		local sqlId = tostring(vehicle:getSqlId());
		local newList = {};

		for i, line in ipairs(listItems)
		do
			local split = Valhalla:splitArrayString(line);

			if tostring(split[1]) == sqlId
			then
				line = Valhalla:replaceItemInArrayString(line, 3, Valhalla.VehicleClaims:getVehiclePositionString(vehicle, data.x, data.y));
			end

			table.insert(newList, line);
		end

		Valhalla.Commands:saveItemListInFile(Valhalla.Commands:getPlayerVehicleListFileName(owner), newList);
	end

	return data;
end


-- moddata management


function Valhalla.Commands:setValuesOnMulePart(playerObj, args)
	local vehicle = getVehicleById(args["_vehicleId"]);

	if vehicle
	then
		local part = Valhalla:getMulePart(vehicle);

		if part
		then
			--print("Valhalla.Commands:setValuesOnMulePart()");

			local modData = part:getModData();

			for k, v in pairs(args)
			do
				if k ~= "_vehicleId" and k ~= "contentAmount"
				then
					--print("- setting " .. tostring(k) .. " = " .. tostring(v));

					modData[k] = v;
				end
			end

			vehicle:transmitPartModData(part);

			--Valhalla.Commands:saveItemListInFile(Valhalla.Commands:getVehicleDataFileName(vehicle), modData, true);
		--else
			--print("unable to find mule part");
		end
	--else
		--print("unable to find vehicle");
	end
end


-- format helpers


function Valhalla.Commands:getPlayerVehicleListFileName(player)
	local username = player;

	if type(player) ~= "string"
	then
		username = player:getUsername();
	end

	return "vehicle_claims"
		--.. "/" .. Valhalla.Commands:getSaveFileName(playerObj)
		.. "/" .. username .. ".txt";
end


function Valhalla.Commands:getVehicleDataFileName(vehicle)
	return "vehicle_data"
		.. "/" .. string.format("%04d", vehicle:getSqlId()) .. ".txt";
end


function Valhalla.Commands:getVehicleLocationFileName(vehicle)
	return "vehicle_location"
		.. "/" .. string.format("%04d", vehicle:getSqlId()) .. ".txt";
end
