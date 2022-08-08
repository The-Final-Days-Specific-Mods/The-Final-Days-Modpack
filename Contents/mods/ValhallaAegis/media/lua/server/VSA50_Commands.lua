-- moddata management


function Valhalla.Commands.setVehicleData(playerObj, args)
	--print("Valhalla.Commands.setVehicleData(" .. playerObj:getUsername() .. ", " .. args["_vehicleId"] .. ")");

	Valhalla.Commands:setValuesOnMulePart(playerObj, args);
end


function Valhalla.Commands.saveVehicleId(playerObj, args)
	--print("Valhalla.Commands.saveVehicleId(" .. playerObj:getUsername() .. ", " .. args["_vehicleId"] .. ")");

	local vehicle = getVehicleById(args["_vehicleId"]);

	if vehicle
	then
		args["id"] = vehicle:getSqlId();

		Valhalla.Commands:setValuesOnMulePart(playerObj, args);
	--else
		--print("vehicle not found");
	end
end


-- vehicle list management


function Valhalla.Commands.updateVehicleLocation(playerObj, args)
	--print("Valhalla.Commands.updateVehicleLocation(" .. playerObj:getUsername() .. ", " .. args["_vehicleId"] .. ")");

	local vehicle = getVehicleById(args["_vehicleId"]);

	if vehicle
	then
		sendServerCommand(playerObj, "valhallaaux_client", "updateVehicleLocation",
			Valhalla.Commands:updateUserVehicleLocation(vData.owner, vehicle)
		);
	--else
		--print("vehicle not found");
	end
end


function Valhalla.Commands.updateVehicleLocations(playerObj, args)
	--print("Valhalla.Commands.updateVehicleLocations(" .. playerObj:getUsername() .. ")");

	local vehicleList = {};

	for id, vData in pairs(args["vehicleList"])
	do
		local vehicle = getVehicleById(id);

		if vehicle
		then
			vehicleList[vehicle:getSqlId()] = Valhalla.Commands:updateUserVehicleLocation(vData.owner, vehicle);
		end
	end

	for i, player in ipairs(Valhalla:getOnlinePlayers())
	do
		sendServerCommand(player, "valhallaaux_client", "updateVehicleLocations", {
			vehicleList = vehicleList
		});
	end
end


function Valhalla.Commands.saveUserVehicles(playerObj, args)
	--print("Valhalla.Commands.saveUserVehicles(" .. playerObj:getUsername() .. ")");

	Valhalla.Commands:saveItemListInFile(Valhalla.Commands:getPlayerVehicleListFileName(playerObj), args["listItems"]);
end


function Valhalla.Commands.fetchUserVehicles(playerObj, args)
	--print("Valhalla.Commands.fetchUserVehicles(" .. playerObj:getUsername() .. ")");

	sendServerCommand(playerObj, "valhallaaux_client", "setPlayerVehicleList", {
		username = playerObj:getUsername(),
		listItems = Valhalla.Commands:getUserVehicleList(playerObj)
	});
end


function Valhalla.Commands.releasePlayerVehicleById(playerObj, args)
	if args["username"] and args["sqlId"]
	then
		--print("Valhalla.Commands.removeVehicleById(" .. args["username"] .. " | " .. args["sqlId"] .. ")");

		local listItems = Valhalla.Commands:getUserVehicleList(args["username"]);

		if #listItems > 0
		then
			local newList = {};

			for i, line in ipairs(listItems)
			do
				local split = Valhalla:splitArrayString(line);

				if tostring(split[1]) ~= tostring(args["sqlId"])
				then
					table.insert(newList, line);
				end
			end

			Valhalla.Commands:saveItemListInFile(Valhalla.Commands:getPlayerVehicleListFileName(args["username"]), newList);
            Valhalla.Commands:sendServerCommandToNamedPlayer(args["username"], "setPlayerVehicleList", {
                listItems = newList
            });

			Valhalla.Commands.getOnlinePlayerVehicleLists(playerObj, args);
		--else
			--print(" - user has no vehicles");
		end
	--else
		--print("vehicle not found");
	end
end


function Valhalla.Commands.getOnlinePlayerVehicleLists(playerObj, args)
	--print("Valhalla.Commands.getOnlinePlayerVehicleLists(" .. playerObj:getUsername() .. ")");

	local vehiclesByUser = {};

	for i, player in ipairs(Valhalla:getOnlinePlayers())
	do
		local vehicleLines = Valhalla.Commands:getUserVehicleList(player);
		local playerName = player:getUsername();

		vehiclesByUser[playerName] = {};

		for j, line in ipairs(vehicleLines)
		do
			table.insert(vehiclesByUser[playerName], Valhalla.VehicleClaims:vehicleStringToObject(line));
		end
	end

	sendServerCommand(playerObj, "valhallaaux_client", "refreshOnlinePlayerVehicleLists", {
		vehiclesByUser = vehiclesByUser
	});
end


function Valhalla.Commands.updateVehicleOwnerOnlineTime(playerObj, args)
    --print("Valhalla.Commands.updateVehicleOwnerOnlineTime(" .. playerObj:getUsername() .. ")");

    if args["owner"]
    then
        local lastActivity = Valhalla.Commands:getItemListFromFile(Valhalla.Narc.playerActivityLogFolder .. "/" .. args["owner"] .. ".txt");
		
		args["owner"] = nil;
		args["lastOnlineCheck"] = Calendar.getInstance():getTimeInMillis();
		
		if lastActivity[1]
		then
			args["ownerLastOnline"] = lastActivity[1];
		end
		
		Valhalla.Commands.setVehicleData(playerObj, args);
    end
end


-- admin tools


function Valhalla.Commands.refuelGasStation(playerObj, args)
	--print("Valhalla.Commands.refuelGasStation(" .. playerObj:getUsername() .. ", " .. args["x"] .. "|" .. args["y"] .. "|" .. args["z"] .. ")");

	local square = getSquare(args["x"], args["y"], args["z"]);

	if square
	then
		local fuelStationObj = Valhalla.AdminTools:findFuelStationObject(square:getObjects(), true);

		if fuelStationObj
		then
			Valhalla.AdminTools:refuelGasStation(fuelStationObj, args["amount"]);
		--else
			--print("fuel station object not found");
		end
	--else
		--print("square not found");
	end
end


function Valhalla.Commands.checkSquareForMoveablePickup(playerObj, args)
    --print("Valhalla.Commands.checkSquareForMoveablePickup(" .. playerObj:getUsername() .. ", " .. args["x"] .. "|" .. args["y"] .. "|" .. args["z"] .. ")");

    local listItems = Valhalla.Commands:getItemListFromFile(Valhalla.Narc.pickupLogFile);
    local location = Valhalla:formatXYZString(args["x"], args["y"], args["z"])
    local results = {};

    for i, item in ipairs(listItems)
    do
        --print("checking " .. tostring(item) .. " for " .. location);

        if Valhalla:stringContains(item, location)
        then
            --print(" -> location matches!");

            table.insert(results, tostring(item));
        end
    end

	--print(" => found " .. tostring(#results) .. " results");

    sendServerCommand(playerObj, "valhallaaux_client", "showSquareMoveablePickups", {
		username = playerObj:getUsername(),
		results = results
	});
end


-- logging


function Valhalla.Commands.writeToLog(playerObj, args)
    --print("Valhalla.Commands.writeToLog(...)");

    if args["file"] and args["line"] ~= nil
    then
        local line = tostring(args["line"]);

        if args["logTime"] == nil or tostring(args["logTime"]) == "true"
        then
            local timeStr = Calendar.getInstance():getTime();

            if tostring(args["useTimestamp"]) == "true"
            then
                timeStr = Calendar.getInstance():getTimeInMillis();
            end

            timeStr = tostring(timeStr);

            if line ~= ""
            then
                line = "[" .. timeStr .. "] " .. line;
            else
                line = timeStr;
            end
        end

        --print(" -> " .. line);

        if tostring(args["append"]) == "false"
        then
            --print(" - overwriting file content");

            Valhalla.Commands:saveItemListInFile(args["file"], {
                line
            }, false);
        else
            --print(" - appending to list");

            Valhalla.Commands:appendLineToFile(args["file"], line);
        end
    end
end


-- events


Events.OnClientCommand.Add(function(moduleName, command, playerObj, args)
	if moduleName == "valhallaaux" and Valhalla.Commands[command]
	then
		--print("CLIENT SENT COMMAND: " .. moduleName .. " | " .. command);
        --Valhalla.Commands:printArgs(args)

		Valhalla.Commands[command](playerObj, args);
	end
end);