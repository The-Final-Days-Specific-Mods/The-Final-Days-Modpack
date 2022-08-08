-- command wrappers


function Valhalla.VehicleClaims:sendClientCommand(vehicle, method, args)
	args = args or {};

	if vehicle
	then
		args["_vehicleId"] = vehicle:getId();
	end

	--print("Valhalla.VehicleClaims:sendClientCommand(" .. method .. ")");

	--for k, v in pairs(args)
	--do
		--print("- sending " .. tostring(k) .. " = " .. tostring(v));
	--end

	sendClientCommand(Valhalla:getPlayer(), 'valhallaaux', method, args);
end

function Valhalla.VehicleClaims:saveVehicleId(vehicle)
	Valhalla.VehicleClaims:sendClientCommand(vehicle, "saveVehicleId");
end


-- admin and debug stuff


function Valhalla.VehicleClaims.resetModData(player, vehicle, wipe)
	if player
	then
		local playerData = player:getModData();
		local i = 1;

		while(true)
		do
			if playerData["vehicle_" .. i] ~= nil
			then
				playerData["vehicle_" .. i] = nil;
			end

			i = i + 1;

			if i > Valhalla:getSandboxVar("VehicleOwnershipClaimNo") and playerData["vehicle_" .. i] == nil
			then
				break;
			end
		end

		playerData["vehicleCount"] = nil;

		Valhalla:savePlayerModData(player);
	end

	if vehicle
	then
        -- dbg
		--Valhalla:saveVehicleModData(Valhalla:getClosestVehicle(), {
			--owner = "",
			--allowedToEnter = "",
			--allowedToService = "",
            --pastOwners = "",
		--});

        -- normal
		local vehicleData = Valhalla:getVehicleModData(vehicle);
		local newData = {
			id = "",
			owner = "",
			allowedToEnter = "",
			allowedToService = "",
		};

		if vehicleData['owner'] and vehicleData['id']
		then
			Valhalla.VehicleClaims:sendClientCommand(vehicle, "releasePlayerVehicleById", {
				username = vehicleData['owner'],
				sqlId = vehicleData['id']
			});

			newData["pastOwners"] = Valhalla:addItemToArrayString(
				vehicleData["pastOwners"],
				vehicleData["owner"]
			);
		end

        if wipe
        then
            newData["pastOwners"] = "";
        end

		Valhalla:saveVehicleModData(vehicle, newData, getDebug());
	end
end

function Valhalla.VehicleClaims:addDebugMenuEntries(debugMenu, player, vehicle)
	Valhalla:addContextMenuItem(debugMenu, "Dump player vehicle list", Valhalla.VehicleClaims.savePlayerVehicleList, {
		player
	});

	Valhalla:addContextMenuItem(debugMenu, "Reset ModData (you and the vehicle)", Valhalla.VehicleClaims.resetModData, {
		player, vehicle
	});

	Valhalla:addContextMenuItem(debugMenu, getText("IGUI_VVC_refreshVehicleList"), Valhalla.VehicleClaims.fetchPlayerVehicleList, {
		player
	});
end

function Valhalla.VehicleClaims:addAdminContextMenu(contextMenu, player)
    local vehicle = Valhalla:getClosestVehicle(player);
    local playerList = Valhalla:getOnlinePlayers();

	--Valhalla.VehicleClaims:addDebugMenuEntries(contextMenu, player, vehicle);

	if vehicle
	then
        local vehicleData = Valhalla:getVehicleModData(vehicle);

        -- moddata menu

        local modDataMenu = Valhalla:addContextMenuSubMenu(contextMenu, getText("IGUI_VVC_displayModData"));

        for k, v in pairs(vehicleData)
        do
            Valhalla:addContextMenuItem(modDataMenu, tostring(k) .. " = " .. tostring(v));
        end

        -- moddata reset

        Valhalla:addContextMenuItem(contextMenu, getText("IGUI_VVC_resetModData"), Valhalla.VehicleClaims.resetModData, {
            nil, vehicle, true
        }, {
            tip = getText("IGUI_VVC_resetModDataTip");
        });

        -- set / override owner

        Valhalla:addContextMenuItem(contextMenu, getText("IGUI_VVC_setOwner"), function(vehicle, player)
            Valhalla:showTextPrompt(getText("IGUI_VVC_newOwner"), player:getUsername(), function(newOwner)
                Valhalla.VehicleClaims:overrideOwner(vehicle, newOwner);
            end);
        end, {
            vehicle, player
        });

        -- force release

		Valhalla:addContextMenuItem(contextMenu, getText("IGUI_VVC_releaseVehicle"), Valhalla.VehicleClaims.resetModData, {
			nil, vehicle
		}, {
			tip = getText("IGUI_VVC_releaseVehicleTip")
		});
	end

    -- remote manage

    if Valhalla:getSandboxVar("AllowVehicleManageFromCell")
    then
		local oPlayersMenu = Valhalla:addContextMenuSubMenu(contextMenu, getText("IGUI_VVC_adminManageAccess"));
        local vehiclesInCell = Valhalla:getPlayer():getCell():getVehicles();
        local vehiclesByUser = {};

        for i = 1, vehiclesInCell:size()
        do
            local vehicleInCell = vehiclesInCell:get(i - 1);
            local vehicleData = Valhalla:getVehicleModData(vehicleInCell);

            if vehicleData["owner"] and vehicleData["owner"] ~= ""
            then
                if not vehiclesByUser[vehicleData["owner"]]
                then
                    vehiclesByUser[vehicleData["owner"]] = {};
                end

                table.insert(vehiclesByUser[vehicleData["owner"]], {
                    vehicle = vehicleInCell,
                    data = vehicleData,
                });
            end
        end

        for username, items in pairs(vehiclesByUser)
        do
            local userMenu = Valhalla:addContextMenuSubMenu(oPlayersMenu, username .. " (" .. #items .. ")");

            for i, item in ipairs(items)
            do
				Valhalla.VehicleClaims:addAdminManageVehicleContextMenu(userMenu, item, playerList);
            end
        end
	else
		if vehicle
		then
			Valhalla.VehicleClaims:addAdminManageVehicleContextMenu(Valhalla:addContextMenuSubMenu(contextMenu, getText("IGUI_VVC_adminManageAccess")), {
				data = Valhalla:getVehicleModData(vehicle),
				vehicle = vehicle
			}, playerList);
		end
	end

	-- remove from lists

	if Valhalla.VehicleClaims.vehiclesByUser
	then
		local oPlayersMenu = Valhalla:addContextMenuSubMenu(contextMenu, getText("IGUI_VVC_removeFromList"), nil, nil, {
			tip = getText("IGUI_VVC_removeFromListTip")
		});

		for oPlayerName, opVehicleItems in pairs(Valhalla.VehicleClaims.vehiclesByUser)
		do
			local oPlayerClaimsMenu = Valhalla:addContextMenuSubMenu(oPlayersMenu, oPlayerName .. " (" .. #opVehicleItems .. ")", nil, nil, {
				disabled = #opVehicleItems == 0
			});

			for i, vehicleItem in ipairs(opVehicleItems)
			do
                local vehicleInCell = Valhalla:getSandboxVar("AllowVehicleManageFromCell") and Valhalla.VehicleClaims:vehicleIsInCell(tonumber(vehicleItem["id"]));

                -- force release

				Valhalla:addContextMenuItem(oPlayerClaimsMenu, Valhalla.VehicleClaims:formatVehicleListItem(vehicleItem), function(vehicleId, playerName)
					Valhalla.VehicleClaims:sendClientCommand(nil, "releasePlayerVehicleById", {
						username = playerName,
						sqlId = vehicleId
					});
				end, {
					vehicleItem.id, oPlayerName
				}, {
					tip = getText("IGUI_VCP_removesFromList")
				});
			end
		end
    end
end

function Valhalla.VehicleClaims:addAdminManageVehicleContextMenu(context, vehicleDataItem, onlinePlayers)
	if vehicleDataItem["data"]["id"]
	then
		local manageMenu = Valhalla:addContextMenuSubMenu(context,
			Valhalla:getVehicleName(vehicleDataItem["vehicle"]) .. " [ID: " .. vehicleDataItem["data"]["id"] .. " @ " .. Valhalla.VehicleClaims:getVehiclePositionString(vehicleDataItem["vehicle"]) .. "]"
		);

		-- all access
		Valhalla.VehicleClaims:addAllAccessContextMenu(manageMenu, vehicleDataItem["vehicle"], onlinePlayers);

		-- interior access
		Valhalla.VehicleClaims:addInteriorAccessContextMenu(manageMenu, vehicleDataItem["vehicle"], onlinePlayers);

		-- mechanics access
		Valhalla.VehicleClaims:addMechanicsAccessContextMenu(manageMenu, vehicleDataItem["vehicle"], onlinePlayers);
	else
		Valhalla.VehicleClaims:saveVehicleId(vehicleDataItem["vehicle"]);

		Valhalla:addContextMenuItem(context, "< " .. getText("IGUI_VVC_reloading") .. " >", nil, nil, {
			disabled = true
		});
	end
end


-- vehicle list management


function Valhalla.VehicleClaims.savePlayerVehicleList()
	local player = Valhalla:getPlayer();
	local count, listItems = Valhalla.VehicleClaims:getPlayerVehicleDataItems(player, true);

	Valhalla.VehicleClaims:sendClientCommand(nil, "saveUserVehicles", {
		listItems = listItems,
	});
end

function Valhalla.VehicleClaims:fetchPlayerVehicleList()
	Valhalla.VehicleClaims:sendClientCommand(nil, "fetchUserVehicles");
end

function Valhalla.VehicleClaims:setPlayerVehicleList(player, listItems)
	local playerData = player:getModData();
	local vehicleCount = 0;

	for i = 1, Valhalla:getSandboxVar("VehicleOwnershipClaimNo") * 2
	do
		local key = "vehicle_" .. i;

		if listItems[i]
		then
			playerData[key] = listItems[i];
			vehicleCount = i;

			--print(" - setting " .. tostring(i) .. " = " .. listItems[i]);
		else
			playerData[key] = nil;

			--print(" - removing " .. tostring(i));
		end
	end

	playerData["vehicleCount"] = vehicleCount;

	Valhalla:savePlayerModData(player, true);
end

function Valhalla.VehicleClaims:reportVehicleLocations(vehicles)
	local vehicleList = {};

	for i = 1, vehicles:size()
	do
		local vehicle = vehicles:get(i - 1);

		vehicleList[vehicle:getId()] = {
			owner = Valhalla.VehicleClaims:getOwner(vehicle)
		};
	end

	if vehicles:size() > 0
	then
		Valhalla.VehicleClaims:sendClientCommand(nil, "updateVehicleLocations", {
			vehicleList = vehicleList
		});
	end
end

function Valhalla.VehicleClaims:updateVehicleLocations(vehicleList)
	local player = getPlayer();

	for sqlId, coords in pairs(vehicleList)
	do
		Valhalla.VehicleClaims:updateVehicleLocation(sqlId, player, coords["x"], coords["y"]);
	end
end

function Valhalla.VehicleClaims:updateVehicleLocation(vehicle, player, x, y)
	local vehicleId = nil;

	if vehicle and instanceof(vehicle, "BaseVehicle")
	then
		local vehicleData = Valhalla:getVehicleModData(vehicle);

		vehicleId = vehicleData["id"];
	else
		vehicleId = vehicle;
	end

	local vehicleItem, vehicleSlot = Valhalla.VehicleClaims:getPlayerVehicleById(player, vehicleId);

	if vehicleSlot
	then
		--print("updating vehicle location of id " .. vehicleId);

		local playerData = player:getModData();

		playerData[vehicleSlot] = Valhalla:replaceItemInArrayString(
			playerData[vehicleSlot], 3,
			Valhalla.VehicleClaims:getVehiclePositionString(vehicle, x, y)
		);

		Valhalla:savePlayerModData(player);
	--else
		--Valhalla:say("NO slot found");
	end
end

function Valhalla.VehicleClaims:getOnlinePlayerVehicleLists()
	if not Valhalla:userIsRestricted() or getDebug()
	then
		Valhalla.VehicleClaims:sendClientCommand(nil, "getOnlinePlayerVehicleLists");
	end
end


-- shortcuts


function Valhalla.VehicleClaims:getOwner(vehicle)
	local modData = Valhalla:getVehicleModData(vehicle);

	if modData and modData["owner"] ~= ""
	then
		return modData["owner"];
	else
		return nil;
	end
end

function Valhalla.VehicleClaims:getUsedPlayerVehicleKeys(player)
	local playerData = player:getModData();
	local vehicles = {};
	local i = 1;

	while(true)
	do
		local key = "vehicle_" .. i;

		if playerData[key] ~= "" and playerData[key] ~= nil
		then
			table.insert(vehicles, key);
		end

		i = i + 1;

		if i > Valhalla:getSandboxVar("VehicleOwnershipClaimNo") and playerData[key] == nil
		then
			return vehicles;
		end
	end
end

function Valhalla.VehicleClaims:getFreeVehicleSlot(player)
	local playerData = player:getModData();
	local i = 1;

	while(true)
	do
		if not playerData["vehicle_" .. i] or playerData["vehicle_" .. i] == ""
		then
			return "vehicle_" .. i;
		end

		i = i + 1;
	end

	return false;
end

function Valhalla.VehicleClaims:getPlayerVehicleDataItems(player, asStrings)
	local playerData = player:getModData();
	local names = {};

	for i, key in ipairs(Valhalla.VehicleClaims:getUsedPlayerVehicleKeys(player))
	do
		if not asStrings
		then
			table.insert(names, Valhalla.VehicleClaims:vehicleStringToObject(playerData[key]));
		else
			table.insert(names, playerData[key]);
		end
	end

	return #names or 0, names;
end

function Valhalla.VehicleClaims:getPlayerVehicleById(player, id)
	local playerData = player:getModData();

	for i, key in ipairs(Valhalla.VehicleClaims:getUsedPlayerVehicleKeys(player))
	do
		local vehicleData = Valhalla:splitArrayString(playerData[key]);

		if tonumber(vehicleData[1]) == tonumber(id)
		then
			return {
				id = vehicleData[1],
				name = vehicleData[2],
				location = vehicleData[3]
			}, key;
		end
	end

	return false, false;
end


-- format helpers


function Valhalla.VehicleClaims:formatVehicleListItem(data)
	local name = data["name"];

	if data["location"]
	then
		name = name .. " [ID: " .. data["id"] .. " @ " .. data["location"] .. "]";
	end

	return name;
end


-- checks


function Valhalla.VehicleClaims:playerIsPastOwner(vehicle, player)
	return Valhalla:findItemIndexInArrayString(
		Valhalla:getVehicleModData(vehicle)["pastOwners"],
		player:getUsername()
	) > -1;
end

function Valhalla.VehicleClaims:playerIsOwner(vehicle, player)
	return Valhalla.VehicleClaims:getOwner(vehicle) == player:getDisplayName();
end

function Valhalla.VehicleClaims:vehicleIsInCell(id)
    --print("Valhalla.VehicleClaims:vehicleIsInCell(" .. id .. ")");

    local objects = Valhalla:getPlayer():getCell():getVehicles();

    for i = 1, objects:size()
    do
        local object = objects:get(i - 1);

        if string.match(tostring(object), "BaseVehicle")
        then
            local vehicleData = Valhalla:getVehicleModData(object);

            --print(" - " .. tostring(vehicleData['id']) .. " vs. " .. id);

            if tonumber(vehicleData["id"]) == id
            then
                return object;
            end
        end
    end

    return false;
end

function Valhalla.VehicleClaims:playerCanEnterVehicle(player, vehicle)
	if not Valhalla:userIsRestricted()
	then
		return true;
	else
		local owner = Valhalla.VehicleClaims:getOwner(vehicle);
		local playerName = player:getUsername();
		local allowed = Valhalla:itemIsOnList(Valhalla.VehicleClaims:getPlayersAllowedTo(vehicle, "Enter"), playerName);

		if owner or allowed
		then
			return playerName == owner or allowed;
		else
			return true;
		end
	end
end

function Valhalla.VehicleClaims:playerCanMaintainVehicle(player, vehicle)
	if not Valhalla:userIsRestricted()
	then
		return true;
	else
		local owner = Valhalla.VehicleClaims:getOwner(vehicle);
		local playerName = player:getUsername();
		local allowed = Valhalla:itemIsOnList(Valhalla.VehicleClaims:getPlayersAllowedTo(vehicle, "Service"), playerName);

		if owner or allowed
		then
			return player:getUsername() == owner or allowed;
		else
			return true;
		end
	end
end

function Valhalla.VehicleClaims:playerCanRevokeOwnership(player, vehicle)
	local owner = Valhalla.VehicleClaims:getOwner(vehicle);

	return owner and owner == player:getUsername();
end

function Valhalla.VehicleClaims:playerCanSmashWindow(player, vehicle)
	if not Valhalla:userIsRestricted()
	then
		return true;
	end

	if not Valhalla:getSandboxVar("AllowVehicleWindowSmashing")
	then
		local owner = Valhalla.VehicleClaims:getOwner(vehicle);

		if owner and owner ~= player:getUsername()
		then
			return false;
		end
	end

	return true;
end

function Valhalla.VehicleClaims:playerCanTowCar(player, vehicleA, vehicleB)
	if Valhalla:userIsRestricted() and not Valhalla:getSandboxVar("AllowVehicleTowing")
	then
		local ownerA = Valhalla.VehicleClaims:getOwner(vehicleA);
		local ownerB = Valhalla.VehicleClaims:getOwner(vehicleB);
		local playerName = player:getUsername();

		local differentOwners = ownerA and ownerB and ownerA ~= ownerB;
		local unclaimedTowing = (ownerA and ownerA ~= playerName) or (ownerB and ownerB ~= playerName);

		if differentOwners or unclaimedTowing
		then
			return false;
		end
	end

	return true;
end

function Valhalla.VehicleClaims:playerCanOpenDoor(player, part)
	if Valhalla:userIsRestricted() and part:getId() ~= "EngineDoor"
	then
		return Valhalla:getSandboxVar("AllowDoorAndTrunkAccess") or Valhalla.VehicleClaims:playerCanEnterVehicle(player, part:getVehicle());
	end

	return true;
end

function Valhalla.VehicleClaims:playerCanSiphonGas(player, vehicle)
	if Valhalla:userIsRestricted()
	then
		return Valhalla:getSandboxVar("AllowSiphonGas") or Valhalla.VehicleClaims:playerIsOwner(vehicle, player) or Valhalla.VehicleClaims:playerCanMaintainVehicle(player, vehicle);
	end

	return true;
end

function Valhalla.VehicleClaims:playerCanTakeItems(player, vehicle)
	if Valhalla:userIsRestricted() and not Valhalla:getSandboxVar("AllowStealingFromVehicleContainers")
	then
		return Valhalla.VehicleClaims:playerIsOwner(vehicle, player) or Valhalla.VehicleClaims:playerCanEnterVehicle(player, vehicle);
	end

	return true;
end


-- ownership and access management


function Valhalla.VehicleClaims:modifyOwner(vehicle, player, action)
	local playerData = player:getModData();
	local vehicleData = Valhalla:getVehicleModData(vehicle);
	local vehicleCount = tonumber(playerData["vehicleCount"]);

	if not playerData["vehicleCount"]
	then
		vehicleCount = 0;
	end

	for i = 1, Valhalla:getSandboxVar("VehicleOwnershipClaimNo")
	do
		if not playerData["vehicle_" .. i]
		then
			playerData["vehicle_" .. i] = "";
		end
	end

	if action ~= "remove" or action == "set" or action == "reclaim"
	then
		local vehicleSlot = Valhalla.VehicleClaims:getFreeVehicleSlot(player);

		if vehicleSlot ~= false
		then
			local data = {
				owner = player:getUsername()
			};

			if action ~= "reclaim"
			then
				data["allowedToEnter"] = "";
				data["allowedToService"] = "";
			end

			Valhalla:saveVehicleModData(vehicle, data);

			playerData["vehicleCount"] = vehicleCount + 1;
			playerData[vehicleSlot] = Valhalla:mergeIntoArrayString({
				vehicleData["id"],
				Valhalla:getVehicleName(vehicle),
				Valhalla.VehicleClaims:getVehiclePositionString(vehicle)
			});

			Valhalla:say(getText("IGUI_VVC_claimingVehicle", Valhalla:getVehicleName(vehicle)));
		else
			Valhalla:say("No free vehicle slot found");
		end
	else
		local vehicleItem, vehicleSlot = Valhalla.VehicleClaims:getPlayerVehicleById(player, vehicleData["id"]);

		if vehicleItem
		then
			Valhalla:saveVehicleModData(vehicle, {
				owner = "",
				pastOwners = Valhalla:addItemToArrayString(
					vehicleData["pastOwners"],
					vehicleData["owner"]
				),
				allowedToEnter = "",
				allowedToService = "",
			});

			playerData["vehicleCount"] = vehicleCount - 1;
			playerData[vehicleSlot] = "";

			Valhalla:say(getText("IGUI_VVC_releasingVehicle", Valhalla:getVehicleName(vehicle)));
		else
			Valhalla:say("Unable to find id " .. vehicleData["id"]);
		end
	end

	if not playerData["vehicleCount"] or tonumber(playerData["vehicleCount"]) < 0
	then
		playerData["vehicleCount"] = 0;
	end

    Valhalla.VehicleClaims.savePlayerVehicleList();

	Valhalla:savePlayerModData(player);
end

function Valhalla.VehicleClaims.claim(player, vehicle)
	Valhalla.VehicleClaims:modifyOwner(vehicle, player);
end

function Valhalla.VehicleClaims.revoke(player, vehicle)
	Valhalla.VehicleClaims:modifyOwner(vehicle, player, "remove");
end

function Valhalla.VehicleClaims:modifyAccessRights(vehicle, aType, action, playerName)
    if vehicle
    then
        local vehicleData = Valhalla:getVehicleModData(vehicle);
        local key = "allowedTo" .. aType;
        local value = "";

        if action ~= "revoke" or action == "add"
        then
            value = Valhalla:addItemToArrayString(vehicleData[key], playerName);
        else
            value = Valhalla:removeItemFromArrayString(vehicleData[key], playerName);
        end

        Valhalla:saveVehicleModData(vehicle, {
            [key] = value
        });
    else
        Valhalla:say(getText("IGUI_VVC_vehicleNotInRange"));
    end
end

function Valhalla.VehicleClaims.grantInteriorAccess(vehicle, playerName)
	Valhalla.VehicleClaims:modifyAccessRights(vehicle, "Enter", "add", playerName);
end

function Valhalla.VehicleClaims.revokeInteriorAccess(vehicle, playerName)
	Valhalla.VehicleClaims:modifyAccessRights(vehicle, "Enter", "revoke", playerName);
end

function Valhalla.VehicleClaims.grantMechanicsAccess(vehicle, playerName)
	Valhalla.VehicleClaims:modifyAccessRights(vehicle, "Service", "add", playerName);
end

function Valhalla.VehicleClaims.revokeMechanicsAccess(vehicle, playerName)
	Valhalla.VehicleClaims:modifyAccessRights(vehicle, "Service", "revoke", playerName);
end

function Valhalla.VehicleClaims:getPlayersAllowedTo(vehicle, aType, asList)
	local modData = Valhalla:getVehicleModData(vehicle);

	if modData and modData["allowedTo" .. aType]
	then
		if asList
		then
			return Valhalla:splitArrayString(modData["allowedTo" .. aType]);
		else
			return modData["allowedTo" .. aType];
		end
	end

	if asList
	then
		return {};
	else
		return "";
	end
end

function Valhalla.VehicleClaims:overrideOwner(vehicle, newOwner)
    local vehicleData = Valhalla:getVehicleModData(vehicle);
    local newData = {
        owner = newOwner
    };

    if vehicleData['owner'] and vehicleData['id']
    then
        Valhalla.VehicleClaims:sendClientCommand(vehicle, "releasePlayerVehicleById", {
            username = vehicleData['owner'],
            sqlId = vehicleData['id']
        });

        newData["pastOwners"] = Valhalla:addItemToArrayString(
            vehicleData["pastOwners"],
            vehicleData["owner"]
        );
    end

    Valhalla:saveVehicleModData(vehicle, newData, getDebug());
end

function Valhalla.VehicleClaims:forceReleaseVehicle(vehicle)
	local vehicleData = Valhalla:getVehicleModData(vehicle);

	if vehicleData['owner'] and vehicleData['id']
	then
		Valhalla.VehicleClaims:sendClientCommand(vehicle, "releasePlayerVehicleById", {
			username = vehicleData['owner'],
			sqlId = vehicleData['id']
		});
	end
end

function Valhalla.VehicleClaims:closeDoor(player, part)
	sendClientCommand(player, 'vehicle', 'setDoorOpen', {
		vehicle = part:getVehicle():getId(),
		part = part:getId(),
		open = false
	});
end


-- context menu helpers


function Valhalla.VehicleClaims:addPlayersContextMenu(contextMenu, title, playerList, action, vehicle, listKey)
	if #playerList > 0
	then
		local player = Valhalla:getPlayer();
		local playersMenu = Valhalla:addContextMenuSubMenu(contextMenu, title);
		local vehicleData = Valhalla:getVehicleModData(vehicle);

		for i, onlinePlayer in ipairs(playerList)
		do
			local playerName = onlinePlayer:getUsername();
			local disabled = false;

			if Valhalla:itemIsOnList(vehicleData[listKey], playerName) or (playerName == player:getUsername() and not getDebug())
			then
				disabled = true;
			end

			Valhalla:addContextMenuItem(playersMenu, playerName, action, {
				vehicle, playerName
			}, {
				disabled = disabled
			});
		end
	end
end

function Valhalla.VehicleClaims:addInteriorAccessContextMenu(vehicleMenu, vehicle, playerList)
    if vehicle --and not vehicle:getScript():getName():match("Trailer")
    then
        local vehicleData = Valhalla:getVehicleModData(vehicle);

        Valhalla:addContextMenuItem(vehicleMenu, getText("IGUI_VVC_allowedInterior"), nil, nil, {
            disabled = true
        });

        if vehicleData["allowedToEnter"]
        then
            local players = Valhalla:splitArrayString(vehicleData["allowedToEnter"]);

            if #players > 1
            then
                Valhalla:addContextMenuItem(vehicleMenu, "< " .. getText("IGUI_VVC_revokeAll") .. " >", function(vehicle)
                    Valhalla:saveVehicleModData(vehicle, {
                        allowedToEnter = ""
                    });
                end, {
                    vehicle
                });
            end

            for i, playerName in ipairs(players)
            do
                Valhalla:addContextMenuItem(vehicleMenu, playerName, Valhalla.VehicleClaims.revokeInteriorAccess, {
                    vehicle, playerName
                });
            end
        end

        Valhalla.VehicleClaims:addPlayersContextMenu(
            vehicleMenu, getText("IGUI_VVC_addPlayerToList"), playerList,
            Valhalla.VehicleClaims.grantInteriorAccess, vehicle, "allowedToEnter"
        );
    end
end

function Valhalla.VehicleClaims:addMechanicsAccessContextMenu(vehicleMenu, vehicle, playerList)
    Valhalla:addContextMenuItem(vehicleMenu, getText("IGUI_VVC_allowedMechanics"), nil, nil, {
        disabled = true
    });

    local vehicleData = Valhalla:getVehicleModData(vehicle);

    if vehicleData["allowedToService"]
    then
        local players = Valhalla:splitArrayString(vehicleData["allowedToService"]);

        if #players > 1
        then
            Valhalla:addContextMenuItem(vehicleMenu, getText("IGUI_VVC_revokeAll"), function(vehicle)
                Valhalla:saveVehicleModData(vehicle, {
                    allowedToService = ""
                });
            end, {
                vehicle
            });
        end

        for i, playerName in ipairs(Valhalla:splitArrayString(vehicleData["allowedToService"]))
        do
            Valhalla:addContextMenuItem(vehicleMenu, playerName, Valhalla.VehicleClaims.revokeMechanicsAccess, {
                vehicle, playerName
            });
        end
    end

    Valhalla.VehicleClaims:addPlayersContextMenu(
        vehicleMenu, getText("IGUI_VVC_addPlayerToList"), playerList,
        Valhalla.VehicleClaims.grantMechanicsAccess, vehicle, "allowedToService"
    );
end

function Valhalla.VehicleClaims:addAllAccessContextMenu(vehicleMenu, vehicle, playerList)
    if #playerList > 0
    then
        local allowMenu = Valhalla:addContextMenuSubMenu(vehicleMenu, getText("IGUI_VVC_allowAll"));
        local revokeMenu = Valhalla:addContextMenuSubMenu(vehicleMenu, getText("IGUI_VVC_revokeAll"));

        for i, onlinePlayer in ipairs(playerList)
		do
            local playerName = onlinePlayer:getUsername();
            local allowInterior = Valhalla:itemIsOnList(Valhalla.VehicleClaims:getPlayersAllowedTo(vehicle, "Enter"), playerName);
            local allowService = Valhalla:itemIsOnList(Valhalla.VehicleClaims:getPlayersAllowedTo(vehicle, "Service"), playerName);

            Valhalla:addContextMenuItem(allowMenu, playerName, function(vehicle, playerName)
                if not allowInterior
                then
                    Valhalla.VehicleClaims.grantInteriorAccess(vehicle, playerName);
                end

                if not allowService
                then
                    Valhalla.VehicleClaims.grantMechanicsAccess(vehicle, playerName);
                end
            end, {
				vehicle, playerName
			});

            Valhalla:addContextMenuItem(revokeMenu, playerName, function(vehicle, playerName)
                if allowInterior
                then
                    Valhalla.VehicleClaims.revokeInteriorAccess(vehicle, playerName);
                end

                if allowService
                then
                    Valhalla.VehicleClaims.revokeMechanicsAccess(vehicle, playerName);
                end
            end, {
				vehicle, playerName
			});
        end
    end
end


-- events


Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldobjects, test)
	if Valhalla:getSandboxVar("EnableVehicleOwnership")
	then
		player = getSpecificPlayer(player);

		local vehicleCount, vehicleItems = Valhalla.VehicleClaims:getPlayerVehicleDataItems(player);
		local manageMenu = Valhalla:addContextMenuSubMenu(context, getText("IGUI_VVC_manageVehicles", vehicleCount, Valhalla:getSandboxVar("VehicleOwnershipClaimNo")));

		local vehicle = Valhalla:getClosestVehicle(player);
		local currentVehicleId = 0;
		local vehicleData = {};
		local needsReload = false;

		if vehicle
		then
			vehicleData = Valhalla:getVehicleModData(vehicle);
			currentVehicleId = vehicleData['id'];

			-- add vehicle id if not present

			if not currentVehicleId or currentVehicleId == "" or currentVehicleId == 0
			then
				Valhalla.VehicleClaims:saveVehicleId(vehicle);

				needsReload = true;
			end

			local owner = Valhalla.VehicleClaims:getOwner(vehicle);
			local userIsOwner = owner == player:getUsername();

			-- collect missing vehicles if needed

			if owner and userIsOwner
			then
				local vehicleItem, vehicleSlot = Valhalla.VehicleClaims:getPlayerVehicleById(player, currentVehicleId)

				if not vehicleSlot
				then
					Valhalla.VehicleClaims:modifyOwner(vehicle, player, "reclaim")

					needsReload = true;
				end
			end

            -- exit and prompt for reload

			if needsReload
			then
				Valhalla:addContextMenuItem(manageMenu, "< " .. getText("IGUI_VVC_reloading") .. " >", nil, nil, {
					disabled = true
				});

				return true;
			end

            -- normal stuff from here on

			if owner
			then
				local playerName = owner;
                local lastOnline = 0;
                local claimExpired = false;

				if userIsOwner
				then
					playerName = getText("IGUI_VVC_youLC");
                else
                    if vehicleData["ownerLastOnline"]
                    then
                        lastOnline = math.floor(Valhalla:millisecToDays(Calendar.getInstance():getTimeInMillis() - tonumber(vehicleData["ownerLastOnline"])));

                        if lastOnline >= tonumber(Valhalla:getSandboxVar("AllowVehicleReleaseAfterDays"))
                        then
                            claimExpired = true;
                        end
                    end
				end

				Valhalla:addContextMenuItem(manageMenu, getText("IGUI_VVC_vehicleOwnedBy", playerName) .. (lastOnline > 0 and (", " .. getText("IGUI_VVC_lastOnlineDays", lastOnline)) or ""), nil, nil, {
					disabled = true
				});

				-- revoke

				if Valhalla.VehicleClaims:playerCanRevokeOwnership(player, vehicle)
				then
					Valhalla:addContextMenuItem(manageMenu, getText("IGUI_VVC_revokeClaim"), Valhalla.VehicleClaims.revoke, {
						player, vehicle
					});
				end

                if claimExpired
                then
                    Valhalla:addContextMenuItem(manageMenu, getText("IGUI_VVC_releaseVehicle"), Valhalla.VehicleClaims.resetModData, {
                        nil, vehicle
                    }, {
                        tip = getText("IGUI_VVC_releaseVehicleTip")
                    });
                end
			else
				-- claim

				local isUnderLimit = vehicleCount < Valhalla:getSandboxVar("VehicleOwnershipClaimNo");
                local allowClaim = not Valhalla.VehicleClaims:playerIsPastOwner(vehicle, player) or Valhalla:getSandboxVar("AllowPastOwnerReclaim");
				local tooltip = "";

				if not isUnderLimit
				then
					tooltip = tooltip .. getText("IGUI_VVC_vehicleLimitReached") .. "\n";
				end

				if not allowClaim
				then
					tooltip = tooltip .. getText("IGUI_VVC_cantClaimAgain") .. "\n";
				end

				Valhalla:addContextMenuItem(manageMenu, getText("IGUI_VVC_claim"), Valhalla.VehicleClaims.claim, {
					player, vehicle
				}, {
					disabled = not allowClaim or not isUnderLimit,
					tip = tooltip or nil
				});
			end
		end

		if vehicleCount > 0
		then
			for i, item in ipairs(vehicleItems)
			do
                local vehicleInCell = Valhalla:getSandboxVar("AllowVehicleManageFromCell") and Valhalla.VehicleClaims:vehicleIsInCell(tonumber(item["id"]));
                local isCurrentVehicle = vehicle and tonumber(item["id"]) == tonumber(currentVehicleId);
				local canBeManaged = isCurrentVehicle or vehicleInCell;
				local tooltip = "";

				if not canBeManaged
				then
					-- listed vehicle not in range

					local title = Valhalla.VehicleClaims:formatVehicleListItem(item);

					Valhalla:addContextMenuItem(manageMenu, title, nil, nil, {
						disabled = true,
						tip = getText("IGUI_VVC_vehicleNotInRange")
					});
				else
                    local vMenuTitle = Valhalla.VehicleClaims:formatVehicleListItem(item);

                    if isCurrentVehicle
                    then
                        vMenuTitle = ">> " .. vMenuTitle;
                    end

					local vehicleMenu = Valhalla:addContextMenuSubMenu(manageMenu, vMenuTitle, nil, nil, {
						disabled = not canBeManaged,
						tip = tooltip or nil
					});

                    -- revoke

                    if vehicleInCell
                    then
                        Valhalla:addContextMenuItem(vehicleMenu, getText("IGUI_VVC_revokeClaim"), Valhalla.VehicleClaims.revoke, {
                            player, vehicleInCell
                        });
                    end

					-- player info

					local playerList = Valhalla:getOnlinePlayers();

					if #playerList == 0
					then
						Valhalla:addContextMenuItem(vehicleMenu, getText("IGUI_VVC_noClosePlayers"), nil, nil, {
							disabled = true
						});
					end

					-- interior

					Valhalla.VehicleClaims:addInteriorAccessContextMenu(vehicleMenu, vehicle or vehicleInCell, playerList);

					-- mechanics

                    Valhalla.VehicleClaims:addMechanicsAccessContextMenu(vehicleMenu, vehicle or vehicleInCell, playerList);
				end
			end
		else
			Valhalla:addContextMenuItem(manageMenu, getText("IGUI_VVC_noVehiclesYet", playerName), nil, nil, {
				disabled = true
			});
		end
	end
end);

Events.OnGameStart.Add(function()
	if Valhalla:getSandboxVar("EnableVehicleOwnership")
	then
		-- blocking entering

		local vanillaEnter = ISEnterVehicle["isValid"];

		ISEnterVehicle["isValid"] = function(self)
			if Valhalla.VehicleClaims:playerCanEnterVehicle(self.character, self.vehicle)
			then
				return vanillaEnter(self);
			else
				Valhalla:sayIfDifferentObject(self.vehicle, getText("IGUI_VVC_notMine"), self.character);

				for seat = 1, self.vehicle:getMaxPassengers()
				do
					local part = self.vehicle:getPassengerDoor(seat - 1);

					if part
					then
						Valhalla.VehicleClaims:closeDoor(self.character, part);
					end
				end
			end

			return false;
		end

		-- blocking hood access

		local vanillaMechanics = ISOpenMechanicsUIAction["isValid"];

		ISOpenMechanicsUIAction["isValid"] = function(self)
			if Valhalla.VehicleClaims:playerCanMaintainVehicle(self.character, self.vehicle)
			then
				return vanillaMechanics(self);
			else
				Valhalla:sayIfDifferentObject(self.vehicle, getText("IGUI_VVC_notMine"), self.character);

				if self.usedHood
				then
					Valhalla.VehicleClaims:closeDoor(self.character, self.usedHood);
				end
			end

			return false;
		end

		-- marking position on exit

		local vanillaExit = ISExitVehicle["perform"];

		ISExitVehicle["perform"] = function(self)
			Valhalla.VehicleClaims:updateVehicleLocation(self.character:getVehicle(), self.character);

			vanillaExit(self);
		end

        -- blocking window smashing

		local vanillaSmash = ISSmashVehicleWindow["isValid"];

		ISSmashVehicleWindow["isValid"] = function(self)
			if Valhalla.VehicleClaims:playerCanSmashWindow(self.character, self.vehicle)
			then
				return vanillaSmash(self);
			else
				Valhalla:sayIfDifferentObject(self.vehicle, getText("IGUI_VVC_notMine"), self.character);
			end

			return false;
        end

		-- blocking towing

		local vanillaTow = ISAttachTrailerToVehicle["isValid"];

		ISAttachTrailerToVehicle["isValid"] = function(self)
			if Valhalla.VehicleClaims:playerCanTowCar(self.character, self.vehicleA, self.vehicleB)
			then
				return vanillaTow(self);
			else
				Valhalla:sayIfDifferentObject(self.vehicle, getText("IGUI_VVC_notMine"), self.character);
			end

			return false;
		end

		-- "vehicle recycling" compatibility because people would not leave me alone with this. it's a great mod, but don't just
		-- assume i need to cater to every vehicle related mod out there

		if RecycleVehicleAction
		then
			local recycleValid = RecycleVehicleAction["isValid"];

			RecycleVehicleAction["isValid"] = function(self)
				local owner = Valhalla.VehicleClaims:getOwner(self.vehicle);

				if not owner or owner == self.character:getDisplayName() or not Valhalla:userIsRestricted()
				then
					return recycleValid(self);
				else
					Valhalla:sayIfDifferentObject(self.vehicle, getText("IGUI_VVC_notMine"), self.character);
				end

				return false;
			end

			local recyclePerform = RecycleVehicleAction["perform"];

			RecycleVehicleAction["perform"] = function(self)
				local owner = Valhalla.VehicleClaims:getOwner(self.vehicle);

				if owner
				then
					Valhalla.VehicleClaims:forceReleaseVehicle(self.vehicle);
				end

				recyclePerform(self);
			end
		end

		-- trunks and doors

		local vanillaOpenDoor = ISOpenVehicleDoor["isValid"];

		ISOpenVehicleDoor["isValid"] = function(self)
			if Valhalla.VehicleClaims:playerCanOpenDoor(self.character, self.part)
			then
				return vanillaOpenDoor(self);
			else
				Valhalla:sayIfDifferentObject(self.vehicle, getText("IGUI_VVC_notMine"), self.character);
				Valhalla.VehicleClaims:closeDoor(self.character, self.part);
			end
		end

		-- siphon gas

		local vanillaSiphonGas = ISTakeGasolineFromVehicle["isValid"];

		ISTakeGasolineFromVehicle["isValid"] = function(self)
			if Valhalla.VehicleClaims:playerCanSiphonGas(self.character, self.vehicle)
			then
				return vanillaSiphonGas(self);
			else
				Valhalla:sayIfDifferentObject(self.vehicle, getText("IGUI_VVC_notMine"), self.character);
			end
		end
	end
end);

Events.OnEnterVehicle.Add(function(player)
	if Valhalla:getSandboxVar("EnableVehicleOwnership")
	then
		Valhalla.VehicleClaims:updateVehicleLocation(player:getVehicle(), player);
	end
end);

Events.OnCreatePlayer.Add(function()
	if Valhalla:getSandboxVar("EnableVehicleOwnership")
	then
		Valhalla.VehicleClaims:fetchPlayerVehicleList();
	end
end);

Events.EveryTenMinutes.Add(function()
	if Valhalla:getSandboxVar("EnableVehicleOwnership")
	then
		if not Valhalla.VehicleClaims.initialLoadDone
		then
			Valhalla.VehicleClaims.initialLoadDone = true;

			Valhalla.VehicleClaims:fetchPlayerVehicleList();
			--Valhalla.VehicleClaims:getOnlinePlayerVehicleLists();
		end

        local vehicles = Valhalla:getPlayer():getCell():getVehicles();

		for i = 1, vehicles:size()
		do
			local vehicle = vehicles:get(i - 1);
			local vehicleData = Valhalla:getVehicleModData(vehicle);

			if not vehicleData["id"] or vehicleData["id"] == "" or vehicleData["id"] == 0
			then
				Valhalla.VehicleClaims:saveVehicleId(vehicle);
			else
				if vehicleData["owner"] and vehicleData["owner"] ~= ""
				then
					if not vehicleData["lastOnlineCheck"] or Calendar.getInstance():getTimeInMillis() >= tonumber(vehicleData["lastOnlineCheck"]) + (1000 * 60 * Valhalla.VehicleClaims.lastOnlinePollingMins)
					then
						Valhalla.VehicleClaims:sendClientCommand(vehicle, "updateVehicleOwnerOnlineTime", {
							owner = vehicleData["owner"]
						});
					end
				end
			end
		end

		Valhalla.VehicleClaims:reportVehicleLocations(Valhalla:getPlayer():getCell():getVehicles());
		Valhalla.VehicleClaims:getOnlinePlayerVehicleLists();
	end
end);

Events.OnServerCommand.Add(function(moduleName, command, args)
	if Valhalla:getSandboxVar("EnableVehicleOwnership")
	then
		local player = Valhalla:getPlayer();

		if moduleName == 'valhallaaux_client'
		then
			--print("SERVER SENT COMMAND: " .. moduleName .. " | " .. command);

            if command == "setPlayerVehicleList"
            then
                Valhalla.VehicleClaims:setPlayerVehicleList(player, args["listItems"]);
            end

            if command == "refreshOnlinePlayerVehicleLists"
            then
                Valhalla.VehicleClaims.vehiclesByUser = Valhalla:sortArrayByKey(args["vehiclesByUser"]);
            end

			if command == "updateVehicleLocation"
			then
				Valhalla.VehicleClaims:updateVehicleLocation(args["sqlId"], player, args["x"], args["y"]);
			end

			if command == "updateVehicleLocations"
			then
				Valhalla.VehicleClaims:updateVehicleLocations(args["vehicleList"]);
			end
		end
	end
end);